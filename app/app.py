import subprocess
import json

def handler(event, context):
    output = subprocess.run(['sh', './test.sh'], capture_output=True, text=True)
    return {
        "stdout": output.stdout,
        "stderr": output.stderr,
        "exitCode": output.returncode,
        "evaluations": {"my-cool-tool": False}
    }