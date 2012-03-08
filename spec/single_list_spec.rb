#
# single_list_spec
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

require 'structures/single_list'

describe Structures::SingleList, '#insert' do
  it "allows me to insert an item" do
    s = Structures::SingleList.new

    # pre-condition
    s.contains("foo").should eq(false)

    s.insert("foo")

    # post-condition
    s.contains("foo").should eq(true)
  end
end

describe Structures::SingleList, '#contains' do
  it "allows me to check for an item" do
    s = Structures::SingleList.new

    s.insert("foo")
    s.insert("bar")
    s.insert("baz")
    s.insert("buzz")

    # post-condition
    s.contains("foo").should eq(true)
    s.contains("bar").should eq(true)
    s.contains("buzz").should eq(true)
    s.contains("baz").should eq(true)
    s.contains("fizz").should eq(false)
  end
end

describe Structures::SingleList, '#delete' do
  it "#1 allows me to delete on an empty list" do
    s = Structures::SingleList.new

    # pre-condition
    s.insert("foo")
    s.contains("foo").should eq(true)

    s.delete("foo")

    # post-condition
    s.contains("foo").should eq(false)
  end
end

describe Structures::SingleList, '#delete' do
  it "#2 allows me to delete single element list" do
    s = Structures::SingleList.new

    # pre-condition
    s.size.should eq(0)
    s.insert("foo")
    s.size.should eq(1)

    s.delete("foo")

    # post-condition
    s.size.should eq(0)
    s.contains("foo").should eq(false)
  end
end

describe Structures::SingleList, '#delete' do
  it "#3 allows me to delete head of list" do
    s = Structures::SingleList.new

    # pre-condition
    s.size.should eq(0)
    s.insert("foo")
    s.insert("bar")
    s.size.should eq(2)
    s.head.should eq("foo")

    s.delete("foo")

    # post-condition
    s.size.should eq(1)
    s.contains("foo").should eq(false)
    s.contains("bar").should eq(true)
    s.head.should eq("bar")
  end
end

describe Structures::SingleList, '#delete' do
  it "#4 allows me to delete tail of list" do
    s = Structures::SingleList.new

    # pre-condition
    s.size.should eq(0)
    s.insert("foo")
    s.insert("bar")
    s.insert("baz")
    s.size.should eq(3)
    s.head.should eq("foo")
    s.tail.should eq("baz")

    s.delete("baz")

    # post-condition
    s.size.should eq(2)
    s.contains("foo").should eq(true)
    s.contains("bar").should eq(true)
    s.contains("baz").should eq(false)
    s.head.should eq("foo")
    s.tail.should eq("bar")
  end
end

describe Structures::SingleList, '#delete' do
  it "#5 allows me to delete mid-element list" do
    s = Structures::SingleList.new

    # pre-condition
    s.size.should eq(0)
    s.insert("foo")
    s.insert("bar")
    s.insert("baz")
    s.size.should eq(3)
    s.head.should eq("foo")
    s.tail.should eq("baz")

    s.delete("bar")

    # post-condition
    s.size.should eq(2)
    s.contains("foo").should eq(true)
    s.contains("bar").should eq(false)
    s.contains("baz").should eq(true)
    s.head.should eq("foo")
    s.tail.should eq("baz")
  end
end

describe Structures::SingleList, '#delete' do
  it "#6 allows me to delete non-existent element" do
    s = Structures::SingleList.new

    # pre-condition
    s.size.should eq(0)
    s.insert("foo")
    s.insert("bar")
    s.insert("baz")
    s.size.should eq(3)
    s.head.should eq("foo")
    s.tail.should eq("baz")

    s.delete("fizz")

    # post-condition
    s.size.should eq(3)
    s.contains("foo").should eq(true)
    s.contains("bar").should eq(true)
    s.contains("baz").should eq(true)
    s.head.should eq("foo")
    s.tail.should eq("baz")
  end
end



