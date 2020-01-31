#!/usr/bin/env python3

import os
import json
import shutil
from os.path import expanduser


def get_dirs(dir_path):
    return [directory for directory in os.listdir(dir_path) if os.path.isdir(directory)]

def get_files(dir_path):
    return [f for f in os.listdir(dir_path) if os.path.isfile(f)]


IGNORED_FILES = ['.git', 'backup', '.gitignore', '.gitmodules', 'setup.py', '.setup.py.swp', 'LICENSE', 'README.md']

home_dir = expanduser("~")
manager_base_dir = os.path.dirname(os.path.realpath(__file__))

backup_dir = os.path.join(manager_base_dir, 'backup')
os.makedirs(backup_dir, exist_ok=True)


for dir_name, sub_dir_list, file_list in os.walk(manager_base_dir):
    # Don't navigate through the ignored directories
    for index, sub_dir in enumerate(sub_dir_list):
        if sub_dir in IGNORED_FILES:
            del sub_dir_list[index]

    for managed_file_name in file_list:
        if managed_file_name not in IGNORED_FILES:
            absolute_managed_file_path = os.path.join(dir_name, managed_file_name)
            path_tail = os.path.relpath(absolute_managed_file_path, start=manager_base_dir)
            absolute_home_file_path = os.path.join(home_dir, path_tail)
            backup_file_path = os.path.join(backup_dir, path_tail)
            # Check if file exists in the home directory
            if os.path.isfile(absolute_home_file_path):

                # If the backup directory doesn't exist yet then create it
                backup_leaf_directory_path = os.path.dirname(backup_file_path)
                if not os.path.isdir(backup_leaf_directory_path):
                    print(f"Creating backup directory: {backup_leaf_directory_path} ") 
                    os.makedirs(backup_leaf_directory_path)

                print(f"Copying {absolute_home_file_path} to {backup_file_path}")
                shutil.copy(absolute_home_file_path, backup_file_path)

                print(f"Deleting file {absolute_home_file_path}")
                os.remove(absolute_home_file_path)

            home_leaf_directory_path = os.path.dirname(absolute_home_file_path)
            if not os.path.isdir(home_leaf_directory_path):
                print(f"Creating new directory: {home_leaf_directory_path} ") 
                os.makedirs(home_leaf_directory_path)


            print(f"Creating symlink from {absolute_home_file_path} to {absolute_managed_file_path}")
            os.symlink(absolute_managed_file_path, absolute_home_file_path)

