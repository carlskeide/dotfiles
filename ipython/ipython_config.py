from pygments.token import Token
import six

c = get_config()

c.InteractiveShellApp.exec_PYTHONSTARTUP = False

#c.InteractiveShellApp.log_level = 20
c.InteractiveShellApp.exec_lines = [
    'import logging, sys, os, json, types',
    'from os import path',
    'from time import time',
    'from datetime import date, datetime, timedelta',
    'from collections import defaultdict, OrderedDict, deque',
    'from itertools import chain',
    'from decimal import Decimal',
    'from pprint import pprint as pp',
    'from IPython.utils.text import SList',
] + (
    [
        'from datetime import timezone',
        'from statistics import mean, median',
    ] if six.PY3 else [
        'import pytz',
    ]
)

c.InteractiveShell.autocall = True
c.InteractiveShell.automagic = False
c.InteractiveShell.autoindent = True

c.TerminalIPythonApp.display_banner = False

c.TerminalInteractiveShell.highlighting_style = "monokai"
c.TerminalInteractiveShell.highlighting_style_overrides = {
    Token.Menu.Completions.Completion.Current: 'bg:#ffffff #000000',
    Token.Menu.Completions.Completion: 'bg:#333333 #888888',
    Token.Menu.Completions.ProgressButton: 'bg:#333333',
    Token.Menu.Completions.ProgressBar: 'bg:#aaaaaa',
}


