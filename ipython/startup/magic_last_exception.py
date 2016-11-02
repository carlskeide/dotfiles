from IPython.core.magic import register_line_magic

import sys

@register_line_magic
def last_exception(line):
    "Output the last Excetion"
    try:
        return sys.last_value
    except AttributeError:
        return None

del last_exception

