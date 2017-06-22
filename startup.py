#! /Users/nmenge/.pyenv/shims/python

try:
    import readline
except ImportError:
    print("Module readline not available.")
else:
    import rlcompleter
    readline.parse_and_bind("tab: complete")
try:
    import pprint
except ImportError:
    print("Module pprint not available.")
else:
    pp = pprint.PrettyPrinter()
    p = pp.pprint

