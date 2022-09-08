import re
import sys

def comment_remover(text):
    def replacer(match):
        s = match.group(0)
        if s.startswith('/'):
            return " " # note: a space and not an empty string
        else:
            return s
    pattern = re.compile(
        r'//.*?$|/\*.*?\*/|\'(?:\\.|[^\\\'])*\'|"(?:\\.|[^\\"])*"',
        re.DOTALL | re.MULTILINE
    )
    return re.sub(pattern, replacer, text)

if __name__ == '__main__':
    code_w_comments = open("1_Program.txt").read()
    code_wo_comments = comment_remover(code_w_comments)
    fh = open("code.txt", "w")
    fh.write(code_wo_comments)
    fh.close()

