KID = "Grace_kid.py"
MODE = "w"
STR = """KID = {q}{kid}{q}
MODE = {q}{mode}{q}
STR = {q}{q}{q}{src}{q}{q}{q}

with open(KID, {q}w{q}) as f:
	f.write(STR.format(q=chr(34), kid=KID, mode=MODE, src=STR))

# I'll take you to the moon! I promise!
"""

with open(KID, "w") as f:
	f.write(STR.format(q=chr(34), kid=KID, mode=MODE, src=STR))

# I'll take you to the moon! I promise!
