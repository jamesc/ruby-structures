#
# graph_algo_spec
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

require 'structures/graph_algo'

describe Structures::Graph, 'dfs' do
  it "traverse properly" do
    g = Structures::Graph.new
    g.add_edge(:foo, :bar)
    g.add_edge(:foo, :baz)
    g.add_edge(:baz, :buzz)
    g.add_edge(:buzz, :argh)
    g.add_edge(:baz, :fizz)

    ordered = []
    visited = g.dfs(:foo) do |v|
      ordered << v
    end
    ordered.should eq([:foo, :baz, :fizz, :buzz, :argh, :bar])
    visited.each_pair { |k,v| v.should eq(true) }
  end
end

describe Structures::Graph, 'dfs' do
  it "handles disconnected graphs properly" do
    g = Structures::Graph.new
    g.add_edge(:foo, :bar)
    g.add_edge(:foo, :baz)
    g.add_edge(:baz, :buzz)
    g.add_edge(:buzz, :argh)
    g.add_edge(:baz, :fizz)
    g.add_edge(:a, :b)
    g.add_edge(:b, :c)
    g.add_edge(:a, :d)

    ordered = []
    visited = g.dfs(:foo) do |v|
      ordered << v
    end
    ordered.should eq([:foo, :baz, :fizz, :buzz, :argh, :bar])
    [:foo, :bar, :baz, :fizz, :buzz, :argh].each { |x| visited[x].should eq(true) }

    [:a, :b, :c].each { |x| visited[x].should eq(false) }
  end
end

describe Structures::Graph, 'bfs' do
  it "traverse properly" do
    g = Structures::Graph.new
    g.add_edge(:foo, :bar)
    g.add_edge(:foo, :baz)
    g.add_edge(:baz, :buzz)
    g.add_edge(:buzz, :argh)
    g.add_edge(:baz, :fizz)

    ordered = []
    dist = g.bfs(:foo) do |v|
      ordered << v
    end
    ordered.should eq([:foo, :bar, :baz, :buzz, :fizz, :argh])
    dist[:foo].should eq(0)
    dist[:bar].should eq(1)
    dist[:baz].should eq(1)
    dist[:buzz].should eq(2)
    dist[:fizz].should eq(2)
    dist[:argh].should eq(3)
  end
end

describe Structures::Graph, 'dijkstra' do
  it "can handle a simple DAG" do
    g = Structures::Graph.new
    g.add_edge(:foo, :bar)
    g.add_edge(:foo, :baz)
    g.add_edge(:baz, :buzz)
    g.add_edge(:buzz, :argh)
    g.add_edge(:baz, :fizz)

    dist = g.dijkstra(:foo)
    dist[:bar].should eq(1)
    dist[:buzz].should eq(2)
    dist[:argh].should eq(3)

    path = g.dijkstra(:foo, :argh)
    path.should eq([:foo, :baz, :buzz, :argh])
  end
end
