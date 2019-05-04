#!/usr/bin/env python

import i3


def find_tmp():
    tmps = i3.filter(nodes=[], window=None, name=None)
    if len(tmps) != 1:
        return None
    return tmps[0]['id']


def create_tmp(current_id):
    i3.focus(con_id=current_id)
    i3.split('vertical')
    i3.open()


def destroy_tmp(tmp_id):
    i3.kill(con_id=tmp_id)


def make_float(current_id):
    i3.focus(con_id=current_id)
    i3.floating('enable')
    i3.resize('set 1000 1000')
    i3.move('position center')


def make_unfloat(current_id):
    i3.focus(con_id=current_id)
    i3.floating('disable')


if __name__ == "__main__":
    current = i3.filter(nodes=[], focused=True)[0]
    current_id = current['id']
    if "on" in current['floating']:
        tmp_id = find_tmp()
        if tmp_id is not None:
            i3.focus(con_id=tmp_id)
            make_unfloat(current_id)
            destroy_tmp(tmp_id)
        else:
            make_unfloat()
    else:
        if find_tmp() is None:
            create_tmp(current_id)
            make_float(current_id)
