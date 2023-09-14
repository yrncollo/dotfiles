#!/bin/python3
# @author:YrnCollo

'''imports'''
import os

arch = "pacman"


def os_check():
    '''checking the os version'''
    uname = os.popen('uname -a').read()
    uname = uname.split()[2]
    distro = uname.split('-')[1][:4]
    return distro


def install_packages():
    '''installing packages'''
    os.system(f'sudo {arch} -S git')
    os.system(f'sudo {arch} -S neovim')
    os.system(f'sudo {arch} -S xclip')
    os.system(f'sudo {arch} -S zsh-autosuggestions')
    os.system(f'sudo {arch} -S zsh-syntax-highlighting')


def vim_setup():
    '''vim setup packages'''
    os.system(f'sudo {arch} -S python-jedi')
    os.system(f'sudo {arch} -S flake8')
    os.system(f'sudo {arch} -S python-jedi')
    os.system(f'sudo {arch} -S python-pylint')
    os.system(f'sudo {arch} -S yarn')
    os.system('yarn add npm')


def window_manager():
    '''gnome setup packages'''
    os.system(f'sudo {arch} -S xorg-xprop')
    os.system(f'sudo {arch} -S gnome-shell-extension-manager')


def other_apps():
    '''this are other applications installed'''
    os.system(f'sudo {arch} -S discord')
    os.system(f'sudo {arch} -S chrome')
    os.system(f'sudo {arch} -S firefox')
    os.system('yay -S notion-app-enhanced')


def cybersec_tools():
    '''this are some default applications needed for the system'''
    os.system(f'sudo {arch} -S nmap')


# os_check()
install_packages()
vim_setup()
other_apps()
