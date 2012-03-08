#
# test_set
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

require 'structures/set'

describe Structures::Set, '#empty?', '#size' do
  it "is empty when set is empty" do
    s = Structures::Set.new
    s.size.should eq(0)
    s.empty?.should eq(true)
  end
end

describe Structures::Set, '#insert' do
  it "contains inserted items" do
    s = Structures::Set.new
    # precondition
    s.include?("foo").should eq(false)
    s.size.should eq(0)

    ret = s.insert("foo")

    # postcondition
    ret.should eq(s)
    s.include?("foo").should eq(true)
    s.size.should eq(1)
  end
end

describe Structures::Set, '#<<' do
  it "<< works" do
    s = Structures::Set.new

    s << "a"
    s << "b"
    s.size.should eq(2)
    s.include?("a").should eq(true)
    s.include?("b").should eq(true)
  end
end

describe Structures::Set, '#remove' do
  it "remove works correctly" do
    s = Structures::Set.new
    # precondition
    ret = s.insert("foo")
    s.include?("foo").should eq(true)
    s.size.should eq(1)

    s.remove("foo").should eq("foo")

    # postcondition
    s.include?("foo").should eq(false)
    s.size.should eq(0)
  end
end

describe Structures::Set, '#remove' do
  it "remove on non-existent" do
    s = Structures::Set.new

    s.remove("foo").should eq(nil)
    s.remove("foo").should eq(nil)
  end
end

describe Structures::Set, '#each' do
  it "each works" do
    s = Structures::Set.new

    result = []
    s.insert("a")
    s.insert("b")
    s.insert("c")

    s.each { |i| result << i }
    result.should eq (["a", "b", "c"])
  end
end

describe Structures::Set, '#to_a' do
  it "to_a works" do
    s = Structures::Set.new

    s.insert("a")
    s.insert("b")
    s.insert("c")
    s.to_a.should eq(["a", "b", "c"])
  end
end

describe Structures::Set, '#map' do
  it "enumerable supplies map" do
    s = Structures::Set.new

    s.insert("a")
    s.insert("b")
    s.insert("c")
    upper = s.map {|i| i.upcase}
    upper.should eq(["A", "B", "C"])
  end
end

