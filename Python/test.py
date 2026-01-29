import subprocess
from pathlib import Path

COLLEEN_SCRIPT = Path("src/Colleen.py")
COLLEEN_TMP = Path("tmp")

GRACE_SCRIPT = Path("src/Grace.py")
GRACE_KID = Path("Grace_kid.py")

def compare_files(file1, file2):
	with open(file1, "r") as f1, open(file2, "r") as f2:
		return f1.read() == f2.read()

def run_colleen():
	with COLLEEN_TMP.open("w") as f:
		subprocess.run(["python3", str(COLLEEN_SCRIPT)], stdout=f, check=True)

def test_colleen():
	run_colleen()

	if compare_files(COLLEEN_SCRIPT, COLLEEN_TMP):
		print("✅ Test Colleen OK")
	else:
		print("❌ Test Colleen FAILED")
		with open(COLLEEN_TMP) as f:
			print("--- TMP CONTENT ---")
			print(f.read())

	if COLLEEN_TMP.exists():
		COLLEEN_TMP.unlink()

def run_grace():
	subprocess.run(["python3", str(GRACE_SCRIPT)], check=True)

def test_grace():
	run_grace()

	if compare_files(GRACE_SCRIPT, GRACE_KID):
		print("✅ Test Grace OK")
	else:
		print("❌ Test Grace FAILED")
		with open(GRACE_KID) as f:
			print("--- GRACE_KID CONTENT ---")
			print(f.read())

	if GRACE_KID.exists():
		GRACE_KID.unlink()

#def test_sully():
#	run_grace()

#	if compare_files(GRACE_SCRIPT, GRACE_KID):
#		print("✅ Test Grace OK")
#	else:
#		print("❌ Test Grace FAILED")
#		with open(GRACE_KID) as f:
#			print("--- GRACE_KID CONTENT ---")
#			print(f.read())

#	if GRACE_KID.exists():
#		GRACE_KID.unlink()

if __name__ == "__main__":
    test_colleen()
    test_grace()
