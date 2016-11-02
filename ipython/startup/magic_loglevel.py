from IPython.core.magic import register_line_magic

@register_line_magic
def loglevel(line):
    try:
        levelname = line.upper()
        level = getattr(logging, levelname)
    except AttributeError:
        return "No loglevel with that name"

    logging.getLogger('').setLevel(level)
    print("Loglevel set to {}: {}".format(level, levelname))

del loglevel
