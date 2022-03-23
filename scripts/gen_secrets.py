#!/usr/bin/env python3

from base64 import standard_b64encode
from os import urandom
from os.path import exists

import yaml


def gen_secrets():
    """generate secrets and passwords"""
    to_gen = {}
    with open("sample-secrets.yml", "r") as oID:
        to_gen = yaml.safe_load(oID)
    curr_data = {}
    if exists("secrets.yml"):
        with open("secrets.yml", "r") as oID:
            curr_data = yaml.safe_load(oID)
    if not curr_data:
        curr_data = {}
    for k, s in to_gen.items():
        if k not in curr_data:
            curr_data[k] = standard_b64encode(urandom(s)).decode('UTF-8')
    with open("secrets.yml", "w") as oID:
        yaml.safe_dump(curr_data, oID)


if __name__ == '__main__':
    gen_secrets()
