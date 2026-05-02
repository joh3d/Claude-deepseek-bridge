import os

path = r'c:\Users\h4mm3\Desktop\Code\Claude-deepseek-bridge'
files = ['setup.sh', 'commands/deepseek', 'commands/deepseek-pro', '.claude/settings.example.json', '.gitignore']

for f in files:
    fp = os.path.join(path, f)
    print(f'=== {f} ===')
    try:
        with open(fp, 'r', encoding='utf-8') as fh:
            print(fh.read())
    except Exception as e:
        print(f'Error: {e}')
    print()
