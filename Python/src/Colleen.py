# This is it. It’s the end of the line for me. But not for you.

s = """# This is it. It’s the end of the line for me. But not for you.

s = {q}{q}{q}{s}{q}{q}{q}

def quine():
	print(s.format(q=chr(34), s=s), end={q}{q})

if __name__ == {q}__main__{q}:
	quine() # Fast is what you do best, ain't it? Just Keep Running.
"""

def quine():
	print(s.format(q=chr(34), s=s), end="")

if __name__ == "__main__":
	quine() # Fast is what you do best, ain't it? Just Keep Running.
