import sys

cmd_trimmed = ''
with open('curl_cmd.txt', 'r') as f:
    for line in f:
        cmd_trimmed += line.rstrip('\n')
        cmd_trimmed = cmd_trimmed[:-2]

with open('curl_cmd_newline_removed.txt', 'w') as f:
    f.write(cmd_trimmed)