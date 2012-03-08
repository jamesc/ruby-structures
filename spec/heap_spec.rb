#
# test_heap
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

require 'structures/heap'

describe Structures::Heap, '#empty?', '#size' do
  it "is empty when heap is empty" do
    s = Structures::Heap.new
    s.size.should eq(0)
    s.empty?.should eq(true)
  end
end

describe Structures::Heap, 'parent' do
  it "works as a heap starting at 1" do
    s = Structures::Heap.new

    s.parent(1).should eq(0)
    s.parent(2).should eq(0)
    s.parent(3).should eq(1)
    s.parent(4).should eq(1)
    s.parent(37).should eq(18)
  end
end

describe Structures::Heap, 'left_child', 'right_child' do
  it "works as a heap starting at 1" do
    s = Structures::Heap.new

    s.left_child(1).should eq(3)
    s.right_child(1).should eq(4)
    s.left_child(2).should eq(5)
    s.right_child(2).should eq(6)

    s.left_child(18).should eq(37)
    s.right_child(18).should eq(38)
  end
end

describe Structures::Heap, 'insert' do
  it "allows addition" do
    s = Structures::Heap.new

    s.insert(10, "foo")
    s.size.should eq(1)

    s.insert(5, "bar")
    s.size.should eq(2)

    s.insert(8, "baz")
    s.size.should eq(3)

    s.insert(1, "fizz")
    s.size.should eq(4)

    (k, v) = s.extract_min
    k.should eq(1)
    v.should eq("fizz")
    (k, v) = s.extract_min
    k.should eq(5)
    v.should eq("bar")
    (k, v) = s.extract_min
    k.should eq(8)
    v.should eq("baz")
    (k, v) = s.extract_min
    k.should eq(10)
    v.should eq("foo")
    s.empty?.should eq(true)

  end
end

describe Structures::Heap, 'replace' do
  it "allows replacing with larger value" do
    s = Structures::Heap.new

    s.insert(10, "foo")
    s.insert(5, "bar")
    s.insert(8, "baz")
    s.insert(1, "fizz")

    s.replace(7)

    (k,v) = s.extract_min
    k.should eq(5)
    (k,v) = s.extract_min
    k.should eq(7)
    (k,v) = s.extract_min
    k.should eq(8)
    (k,v) = s.extract_min
    k.should eq(10)
  end
end
