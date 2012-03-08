#
# graph_algo
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

module Structures
  INFINITY = 1000000

  # Do a DFS of a graph
  class Graph
    include Structures::AdjacencyList

    def dfs(start)
      visited = Hash.new
      each_vertex { |v| visited[v] = false }

      q = Array.new
      q << start

      until q.empty?
        u = q.pop
        visited[u] = true
        yield u if block_given?
        each_adjacent(u) do |v|
          unless visited[v]
            q << v
          end
        end
      end
      visited
    end

    def bfs(start)
      dist = Hash.new
      each_vertex { |v| dist[v] = INFINITY }

      q = Array.new
      q << start
      dist[start] = 0

      until q.empty?
        u = q.shift
        yield u if block_given?
        each_adjacent(u) do |v|
          if dist[v] == INFINITY
            q << v
            dist[v] = dist[u] + 1
          end
        end
      end
      dist
    end
  end
end
