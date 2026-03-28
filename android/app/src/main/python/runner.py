import sys
import io

def run_code(code):
    output = io.StringIO()
    sys.stdout = output

    try:
        exec(code)
    except Exception as e:
        print(e)

    sys.stdout = sys.__stdout__
    return output.getvalue()