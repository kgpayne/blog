#!/usr/bin/env python
# -*- coding: utf-8 -*- #
import os

with open(".s3cfg", "ab") as myfile:
    myfile.write("\n")
    myfile.write("access_key = {0}".format(os.environ['AWS_ACCESS_KEY_ID']))
    myfile.write("\n")
    myfile.write("secret_key = {0}".format(os.environ['AWS_SECRET_ACCESS_KEY']))
