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
    g.dfs(:foo) do |v|
      ordered << v
    end
    ordered.should eq([:foo, :baz, :fizz, :buzz, :argh, :bar])
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
    g.bfs(:foo) do |v|
      ordered << v
    end
    ordered.should eq([:foo, :bar, :baz, :buzz, :fizz, :argh])
  end
end

