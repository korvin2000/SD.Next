import os
import subprocess
import argparse

# update
def update(directory):
    for entry in os.listdir(directory):
        entry_path = os.path.join(directory, entry)
        if os.path.isdir(entry_path):
            if os.path.exists(os.path.join(entry_path, '.git')):
                print(f'Updating {entry}...')
                subprocess.run(['git', 'pull'], cwd=entry_path)


parser = argparse.ArgumentParser()
parser.add_argument("-e", "--extensions", default="on", help="update extensions")
parser.add_argument("-r", "--repositories", default="off", help="update repositories")
args = parser.parse_args()

if args.extensions == "on":
    print("Updating extensions")
    extensions_dir = r'./extensions'
    extensions_builtin_dir = r'./extensions-builtin'
    update(extensions_dir)
    update(extensions_builtin_dir)

if args.repositories == "on":
    print("Updating repositories")
    repositories_dir = r'./repositories'
    update(repositories_dir)
