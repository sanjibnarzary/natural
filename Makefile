# Copyright (c) 2011, Chris Umbel

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

SHELL := /bin/bash

benchmark:
	@node benchmarks

test_clean: 
	@ls -1 ./io_spec/test_data/wordnet/download/{index,data}* | xargs rm -f

clean: test_clean  
	@find ./ -name *~ | xargs rm -f
	@find ./ -name \#* | xargs rm -f

test:
	@NODE_PATH=. jasmine-node spec/

test_io: test_clean
	@NODE_PATH=. jasmine-node io_spec/

test_io_unclean:
	@NODE_PATH=. jasmine-node io_spec/
