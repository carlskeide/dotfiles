from IPython.core.magic import register_line_magic

from pprint import pprint as pp

@register_line_magic
def od(line):
    "Print an object's __dict__"
    if line:
        pp(eval(line).__dict__)
    else:
        print "No object supplied."

del od
