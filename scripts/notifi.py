#!/usr/bin/env python3

from os import environ as env, listdir as ls, popen
from os.path import isfile
import datetime
import subprocess
import atexit
try:
    from psutil import sensors_battery
except ImportError:
    class Battery(object):
        def __init__(self, pc: float, pp: bool):
            self.percent: float = pc
            self.power_plugged: bool = pp

    def sensors_battery() -> str:
        with open('/sys/class/power_supply/BAT0/capacity') as nfd, \
             open('/sys/class/power_supply/BAT0/power_now') as sfd:
            ncur = float(nfd.readlines()[0])
            state = (sfd.readlines()[0] == 1)
        return Battery(ncur, state)

MAILPATH = env['MAILPATH'] if env['MAILPATH'] else env['MAIL']
# TODO
COLOR = {
    "foreground": "#ffffff",
    "background": "#282f3a",
    "lightbackground": "#414a59",
    "primary": "#5294e2",
    "good": "#91cc57",
    "bad": "#cc575d",
    "muted": "#999999",
}


def output_of(cmd):
    try:
        return subprocess.run(cmd.split(' '), stdout=subprocess.PIPE) \
                            .stdout.decode('utf-8').strip()
    except:
        return None


def battery() -> str:
    icons = ['', '', '', ]
    icon_charging = ''
    battery = sensors_battery()
    charge = battery.percent
    # c = color['bad'] if charge < 30 else color['good']
    if battery.power_plugged:
        icon = '{0}'.format(icon_charging)
    else:
        icon = '{0}'.format(icons[round(charge / 100 * (len(icons) - 1))])
    return str(round(charge)) + ' ' + icon


def mail(path: str) -> str:
    return str(len(ls(path))) + ' ' + ''


def wifi() -> str:
    wif = output_of("iwgetid --raw")
    with open("/proc/net/wireless") as f:
        sig = f.readlines()[-1].split(' ')[6][:-1]
    try:
        int(sig)
    except ValueError:
        wif = ''
        sig = 'no wife kek'
    finally:
        return '{0} [{1}]'.format(wif, sig)


def paudio() -> str:
    return popen('pamixer --get-volume').read().rstrip('\n')


def date() -> str:
    return datetime.datetime.now().strftime("%B %d :: %I:%M%p")


def mpd_init() -> None:
    client = subprocess.Popen(['mpc', 'idleloop', 'player'],
                              stdout=subprocess.PIPE)
    atexit.register(client.kill)


def mpd() -> str:
    status = output_of('mpc').splitlines()
    return '' if len(status) < 3 else status[0]


if __name__ == "__main__":
    print(date())
    print("bat: {0}".format(battery()))
    print("audio: {0}".format(paudio()))
    print("net: {0}".format(wifi()))
    print("mail: {0}".format(mail(MAILPATH + '/new')))
    print(mpd())
