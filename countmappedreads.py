#!/usr/bin/env python

#Importing necessary modules.
import argparse

#Initializing argparse.
def get_args():
    parser = argparse.ArgumentParser(description="Takes input sam filename with -i.")
    parser.add_argument("-i", help="input sam filename", type=str)
    return parser.parse_args()
args = get_args()

mapped_reads = 0
unmapped_reads = 0
#Opening sam file, iterating line by line, stripping newline characters.
with open(args.i, "r") as sam_file:
    for line in sam_file:
        line = line.strip()
        
        #If statement to ignore header section. Then extracting bitwise flag from line.
        if not line.startswith("@"):
            line = line.split("\t")
            bitwise_flag = int(line[1])

            #Selecting only primary alignments
            if ((bitwise_flag & 256)) != 256:

                #Increment mapped reads counter
                if ((bitwise_flag & 4) != 4):
                    mapped_reads += 1
                #Increment unmapped reads counter
                else:
                    unmapped_reads += 1

print(f"Number of mapped reads: {mapped_reads}")
print(f"Number of unmapped reads: {unmapped_reads}")