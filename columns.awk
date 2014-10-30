#!/usr/bin/awk -f
{
        nr+=1;

        #iterating through each field of a line
        for(i=1;i<=NF;i++){
                #putting fields in emulated 2-dimensional array
                a[NR SUBSEP i]=$i;
                #same as above but for lenghts of fields
                b[NR SUBSEP i]=length($i)
        };
        #
        c[nr]=NF;
        #checking if this line have more fields than any previous line
        #if it does then increasing maxnf
        if(maxnf<NF)
                maxnf=NF;
}
END{
        #counting longest fields in each file
        #because script uses "two dimensional array"
        #there are two for loops
        #checking if the actual field lenght is longer than same field for
        #previous lines and determining which is the longest
        for(line=1;line<=nr;line++)
                for(i=1;i<=c[line];i++)
                        if(maxlenght[i]<b[line SUBSEP i])
                        maxlenght[i]=b[line SUBSEP i]
        #printing the lines
        #for each field in each line check what is the longest field length
        #and print the field with trailing spaces
        for(line=1;line<=nr;line++){
                for(i=1;i<=c[line];i++)
                        printf("%-"maxlenght[i]+2"s",a[line SUBSEP i])
                #after last field print newline character
                printf "\n"
        }
}

# Copyright Jakub Olizarowicz <xpt@olizarowicz.pl>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to
# deal in the Software without restriction, including without limitation the
# rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
# sell copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
# IN THE SOFTWARE.
