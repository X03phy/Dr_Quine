import sys # exit()
import os # system()

i = 5

if i <= 0:
    sys.exit(0)

i -= 1
filename = f"Sully_{i}.py"

code = """import sys # exit()
import os # system()

i = {i}

if i <= 0:
    sys.exit(0)

i -= 1
filename = f"Sully_{{i}}.py"

code = {q}{q}{q}{code}{q}{q}{q}

with open(filename, "w") as f:
    f.write(code.format(i=i, q=chr(34), code=code))

os.system(f"python3 {{filename}}")
"""

with open(filename, "w") as f:
    f.write(code.format(i=i, q=chr(34), code=code))

os.system(f"python3 {filename}")
