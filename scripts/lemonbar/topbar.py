#!/usr/bin/python

import atexit
import os
import select
import subprocess
import sys
from datetime import datetime
from psutil import sensors_battery

color = {
    "foreground": "#ffffff",
    "background": "#282f3a",
    "lightbackground": "#414a59",
    "primary": "#5294e2",
    "good": "#91cc57",
    "bad": "#cc575d",
    "muted": "#999999",
}


def fg(color, text):
    return '%{F' + color + '}' + text + '%{F-}'


def bg(color, text):
    return '%{B' + color + '}' + text + '%{B-}'


def file_contents(f):
    try:
        ff = open(f, 'r')
        c = ff.read().strip()
        ff.close()
        return c
    except:
        return None


def output_of(cmd):
    try:
        return subprocess.run(cmd.split(' '), stdout=subprocess.PIPE) \
                            .stdout.decode('utf-8').strip()
    except:
        return None


class Widget(object):
    @staticmethod
    def available():
        """Determines if widget is available/makes sense on this system."""
        return True

    def __init__(self, pipe, hooks):
        """Initialize widget. The widget may spawn a subprocess and feed its
        stdout into pipe. The main loop runs through all lines received on all
        widget pipes and calls hooks based on the first word in a line. If
            hooks["my_trigger"] = self
        is set, this widget's update function will be called if the main loop
        sees a line starting with 'my_trigger'.
        """
        pass

    def update(self, line):
        """Update widget's internal state based on data received via the main
        loop.
        """
        pass

    def render(self):
        """Render the widget."""
        return ''


class Text(Widget):
    def __init__(self, text):
        super(Widget, self)
        self.text = text

    def render(self):
        return self.text


class Battery(Widget):
    icons = ['', '', '', ]
    icon_charging = ''

    @staticmethod
    def available():
        return sensors_battery() is not None

    def render(self):
        battery = sensors_battery()
        charge = battery.percent
        # c = color['bad'] if charge < 30 else color['good']
        if battery.power_plugged:
            icon = ' %%{T2}%s%%{T1} ' % self.icon_charging
        else:
            icon = ' %%{T2}%s%%{T1} ' % self.icons[round(
                charge / 100 * (len(self.icons) - 1))]
        return icon + ' ' + str(round(charge))


class PulseAudio(Widget):
    icon_loud = ' \ue05d '
    icon_mute = ' \ue04f '

    @staticmethod
    def available():
        try:
            subprocess.run(['pactl', 'info'],
                           check=True,
                           stdout=subprocess.PIPE,
                           stderr=subprocess.PIPE)
            return True
        except:
            return False

    def __init__(self, pipe, hooks):
        client = subprocess.Popen(['pactl', 'subscribe'], stdout=pipe)
        atexit.register(client.kill)
        self.volume = 0
        self.mute = False
        hooks["Event 'change' on sink"] = self

    def update(self, line):
        painfo = output_of('pactl info').splitlines()
        for l in painfo:
            if l.startswith('Default Sink:'):
                look_for = l.split(':')[1].strip()
                break
        in_sink = False
        look_for = 'Name: ' + look_for
        # sink_list = output_of('pactl list sinks').splitlines()
        if not in_sink:
            if look_for in l:
                in_sink = True
        else:
            if 'Mute:' in l:
                if l.split(':')[1].strip() == 'yes':
                    self.mute = True
                else:
                    self.mute = False
            elif 'Volume:' in l:
                self.volume = int(l.split('/', 2)[1].strip()[:-1])
                return

    def render(self):
        if self.mute:
            return fg(color['bad'], self.icon_mute) + '--'
        else:
            return fg(color['good'], self.icon_loud) + str(self.volume)


class Clock(Widget):
    def render(self):
        return '  ' + bg(
            color['lightbackground'],
            datetime.now().strftime('  %a %b %d  %H:%M  '))


class Wifi(Widget):
    icon = ' \ue048 '

    @staticmethod
    def available():
        try:
            return len(output_of(['iw', 'dev'])) > 0
        except:
            return False

    def render(self):
        strength = 0.0
        iw = output_of(['iwgetid']).split()
        profile = ''
        if len(iw) == 0:
            profile = fg(color['muted'], 'disconnected')
        elif len(iw) < 2 or 'ESSID' not in iw[1]:
            profile = fg(color['muted'], 'connecting')
        else:
            profile = iw[1][7:-1]
            if profile == '':
                profile = fg(color['muted'], 'disconnected')
            else:
                for line in file_contents(
                        '/proc/net/wireless').splitlines()[2:]:
                    cols = line.split()
                    if cols[0][:-1] == iw[0]:
                        strength = float(cols[2])
                        break
        c = color['good'] if strength > 40 else color['bad']
        profile = fg(c, self.icon) + profile
        if strength > 0:
            profile += ' ' + fg(color['muted'], str(int(strength)))
        return profile


class MPD(Widget):
    icon_paused = ' \ue059 '
    icon_playing = ' \ue05c '
    audio_files = ['mp3', 'ogg', 'flac', 'mp4', 'm4a']

    @staticmethod
    def available():
        try:
            subprocess.run(['mpc'],
                           check=True,
                           stdout=subprocess.PIPE,
                           stderr=subprocess.PIPE)
            return True
        except:
            return False

    def __init__(self, pipe, hooks):
        client = subprocess.Popen(['mpc', 'idleloop', 'player'], stdout=pipe)
        atexit.register(client.kill)
        self.song = ''
        self.status = 'stopped'
        hooks['player'] = self

    def update(self, line):
        status = output_of('mpc').splitlines()
        if len(status) < 3:
            self.song = ''
            self.status = 'stopped'
        else:
            self.song = status[0]
            if '.' in self.song[-5:] and \
                    self.song.rsplit('.', 1)[1].lower() in self.audio_files \
                    and '/' in self.song:
                self.song = self.song.rsplit('/', 1)[1]
            self.status = status[1].split(None, 1)[0][1:-1]

    def render(self):
        if self.status == 'playing':
            return self.icon_playing + fg(color['muted'], self.song)
        elif self.status == 'paused':
            return self.icon_paused + fg(color['muted'], self.song)
        return ''


class Mail(Widget):
    icon = ' mail '

    @staticmethod
    def available():
        if os.environ['MAILPATH']:
            mailpath = (os.environ['MAILPATH'] + '/' + p + '/new'
                        for p in os.listdir(os.environ['MAILPATH'])
                        if p[0] != '.')
        elif os.environ['MAIL']:
            mailpath = (os.environ['MAIL'] + '/' + p + '/new'
                        for p in os.listdir(os.environ['MAIL'])
                        if p[0] != '.')
        else:
            mailpath = ''
        return (os.path.isdir(p) for p in mailpath) \
            and os.path.isdir(os.path.expanduser('~/.password-store'))

    def __init__(self, pipe, hooks):
        if os.environ['MAILPATH']:
            self.mailpath = os.environ['MAILPATH'] + '/new'
        elif os.environ['MAIL']:
            self.mailpath = os.environ['MAIL'] + '/new'
        else:
            self.mailpath = None

    def render(self):
        # print(self.mailpath, file=sys.stderr)
        return self.icon + str(len(os.listdir(self.mailpath))) + ' total '


widgets = [
    '%{l}',
    Battery,
    MPD,
    Mail,
    '%{c}',
    '%{r}',
    # PulseAudio,
    Clock,
    Wifi,
]

# no icons yet for some reason
if __name__ == '__main__':
    sread, swrite = os.pipe()
    hooks = {}

    ws = []
    for wc in widgets:
        if type(wc) is str:
            w = Text(wc)
            ws.append(w)
        elif wc.available():
            w = wc(swrite, hooks)
            w.update(None)
            ws.append(w)

    print(''.join(w.render() for w in ws))
    sys.stdout.flush()

    while True:
        ready, _, _ = select.select([sread], [], [], 5)
        # poll / update widgets (rerender only on updates that match hooks,
        # or on regular timeouts)
        updated = False
        if len(ready) > 0:
            for p in ready:
                lines = os.read(p, 4096).decode('utf-8').splitlines()
                for line in lines:
                    for first, hook in hooks.items():
                        if line.startswith(first):
                            updated = True
                            hook.update(line)
        else:
            updated = True
        # render
        if updated:
            print(''.join(w.render() for w in ws))
            sys.stdout.flush()
