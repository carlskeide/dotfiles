from pygments.token import Token

c = get_config()

c.InteractiveShellApp.exec_PYTHONSTARTUP = False

c.InteractiveShellApp.exec_lines = [
    'import logging, sys, os, json, time, types, collections',
    'from datetime import datetime, timedelta',
    'from decimal import Decimal',
    'from pprint import pprint as pp',
    'from IPython.utils.text import SList',
]

c.InteractiveShell.autocall = True
c.InteractiveShell.automagic = False
c.InteractiveShell.autoindent = True

c.TerminalInteractiveShell.highlighting_style = "monokai"
c.TerminalInteractiveShell.highlighting_style_overrides = {
    Token.Menu.Completions.Completion.Current: 'bg:#ffffff #000000',
    Token.Menu.Completions.Completion: 'bg:#333333 #888888',
    Token.Menu.Completions.ProgressButton: 'bg:#333333',
    Token.Menu.Completions.ProgressBar: 'bg:#aaaaaa',
}

