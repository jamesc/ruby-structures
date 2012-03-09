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

  #
  # A graph class, with graph operations based
  # on an adjacency list
  #
  class Graph
    include Structures::AdjacencyList

    #
    # dfs:
    #   Returns a hash of vertices with value set
    #   to true/false depending on if they've been visited
    #
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

    #
    # bfs:
    #   Returns as Hash keyed by vertice with the distance from
    #   the start point
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

    def weight(u,v)
      1
    end

    #
    # dijkstra:
    #   Find single-source shortest paths for a vertex
    #   using dijkstra algorithm.
    #
    #   We assume here a standard length of 1
    #
    #   Returns the shortest path as a Array
    #
    def dijkstra(start, target=nil)
      q = Heap.new
      dist = Hash.new
      previous = Hash.new
      each_vertex do |v|
        dist[v] = INFINITY
        previous[v] = nil
      end
      dist[start] = 0

      # initially all nodes
      each_vertex do |v|
        q.insert(dist[v], v)
      end

      until q.empty?
        (_, u) = q.find_min
        if dist[u] == INFINITY
          break
        end
        (_, u) = q.extract_min
        each_adjacent(u) do |v|
          alt = dist[u] + weight(u,v)
          if alt < dist[v]
            dist[v] = alt
            previous[v] = u
            q.decrease_key(dist[v], v)
          end
        end
      end
      if target
        ret = Array.new
        u = target
        until previous[u].nil?
          ret.unshift u
          u = previous[u]
        end
        ret.unshift start
        ret
      else
        dist
      end
    end

  end
end
