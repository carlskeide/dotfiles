c = get_config()

c.InteractiveShellApp.exec_PYTHONSTARTUP = False

c.InteractiveShellApp.exec_lines = [
    'import sys, logging, json, time',
    'from datetime import datetime, timedelta',
    'from pprint import pprint as pp',
    'logging.basicConfig(level=logging.DEBUG)',
]

c.InteractiveShell.autocall = True
c.InteractiveShell.automagic = False
c.InteractiveShell.autoindent = True

