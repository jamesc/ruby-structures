#
# graph_reps_spec
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

require 'structures/graph'

describe Structures::DirectedGraph, 'add_vertex',
    'num_vertices', 'delete_vertex' do
  it "can add vertices" do
    g = Structures::DirectedGraph.new
    g.add_vertex(:foo)
    g.has_vertex(:foo).should eq(true)
    g.has_vertex(:bar).should eq(false)
    g.add_vertex(:bar)
    g.has_vertex(:bar).should eq(true)
    g.add_vertex(:baz)

    g.num_vertices.should eq(3)

    g.delete_vertex(:foo)

    g.num_vertices.should eq(2)
  end
end

describe Structures::DirectedGraph, 'add_vertex', 'each_vertex' do
  it "enumeration of vertices works" do
    g = Structures::DirectedGraph.new
    g.add_vertex(:foo)
    g.add_vertex(:bar)
    g.add_vertex(:baz)

    g.num_vertices.should eq(3)

    v = g.each_vertex.collect { |x| x }
    v.should eq([:foo, :bar, :baz])
  end
end

describe Structures::DirectedGraph, 'add_edge',
    'num_vertices', 'each_adjacent',
    'each_edge' do
  it "can add edges" do
    g = Structures::DirectedGraph.new
    g.has_edge(:foo, :bar).should eq(false)
    g.add_edge(:foo, :bar)
    g.has_edge(:foo, :bar).should eq(true)
    g.add_edge(:bar, :baz)
    g.add_edge(:foo, :baz)
    g.add_edge(:fizz, :baz)

    g.num_vertices.should eq(4)
    adj = g.each_adjacent(:foo).collect { |x| x }
    adj.should eq([:bar, :baz])

    e = []
    g.each_edge { |i,j| e << [i,j] }
    e.should eq([[:foo, :bar],
                 [:foo, :baz],
                 [:bar, :baz],
                 [:fizz, :baz]])
  end
end

describe Structures::DirectedGraph, 'add_edge',
    'num_edges', 'delete_edge' do
  it "can add edges" do
    g = Structures::DirectedGraph.new
    g.add_edge(:foo, :bar)
    g.add_edge(:bar, :baz)
    g.add_edge(:foo, :baz)
    g.add_edge(:fizz, :baz)

    g.num_edges.should eq(4)
    g.num_vertices.should eq(4)

    g.delete_edge(:fizz, :baz)

    vertices = []
    g.each_vertex { |x| vertices << x }
    vertices.should eq([:foo, :bar, :baz, :fizz])

    g.num_edges.should eq(3)
    g.delete_edge(:foo, :baz)
    g.num_edges.should eq(2)

  end

end


