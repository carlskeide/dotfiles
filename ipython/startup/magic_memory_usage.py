from IPython.core.magic import register_line_magic

try:
    from pympler import summary, muppy
    import psutil

    @register_line_magic
    def memusage(line):
        limit = int(line or 10)

        memory_info = psutil.Process().memory_info()
        print("VMS {:.2f}M, RSS {:.2f}M, SHR {:.2f}M, objects:".format(
            float(memory_info.vms) / 1024.0 / 1024.0,
            float(memory_info.rss) / 1024.0 / 1024.0,
            float(memory_info.shared) / 1024.0 / 1024.0
        ))
        mem_summary = summary.summarize(muppy.get_objects())
        summary.print_(mem_summary, limit=limit)

    del memusage

except ImportError:
    pass
