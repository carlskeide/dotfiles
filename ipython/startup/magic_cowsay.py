from IPython.core.magic import register_line_magic

import logging

try:
    import sh
    logging.getLogger("sh").setLevel(logging.ERROR)

    @register_line_magic
    def cowsay(line):
        if not line:
            return

        print(sh.cowsay(_in=line))

    del cowsay

except ImportError:
    pass
