#
# sort_spec
#
# Copyright 2012 James Casey. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'structures/sort'

describe Structures, 'selection_sort' do

  it "should sort properly" do
    a =  %w{this is a sentence to be sorted}.to_a
    Structures.selection_sort!(a)
    a.should eq(%w{a be is sentence sorted this to}.to_a)
  end

  it "should sort a single element" do
    a = ["foo"]
    Structures.selection_sort!(a)
    a.should eq(["foo"])
  end

  it "should sort and empty list" do
    a = []
    Structures.selection_sort!(a)
    a.should eq([])
  end
end

describe Structures, 'heap_sort' do

  it "should sort properly" do
    a =  %w{this is a sentence to be sorted}.to_a
    sorted = Structures.heap_sort(a)
    sorted.should eq(%w{a be is sentence sorted this to}.to_a)
  end

  it "should sort a single element" do
    a = ["foo"]
    sorted = Structures.heap_sort(a)
    sorted.should eq(["foo"])
  end

  it "should sort and empty list" do
    a = []
    sorted = Structures.heap_sort(a)
    sorted.should eq([])
  end
end

