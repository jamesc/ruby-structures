#
# graph_reps
#
# Copyright 2012 James Casey. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# Graph representation - Adjacency list
#

module Structures
  module AdjacencyList

    def initialize
      @vertice ||= Hash.new
      @edgelist ||= Set.new
    end

    def add_edge(i, j)
      add_vertex(i)
      add_vertex(j)
      basic_add_edge(i, j)
    end

    def add_vertex(i)
      @vertice[i] ||= Set.new
    end

    def has_vertex(i)
      @vertice.has_key?(i)
    end

    def has_edge(i,j)
      has_vertex(i) && @vertice[i].include?(j)
    end

    def delete_edge(i, j)
      @vertice[i].delete(j)
    end

    def delete_vertex(i)
      @vertice.delete(i)
      @vertice.each_value { |adjacent| adjacent.delete(i) }
    end

    def num_vertices
      @vertice.size
    end

    def num_edges
      c = 0
      each_edge { | x| c+=1 }
      c
    end

    # Iterators

    def each_adjacent(i, &b)
      @vertice[i].each(&b)
    end

    def each_vertex(&b)
      @vertice.each_key(&b)
    end
    alias :each :each_vertex

    def each_edge(&block)
      each_vertex { |u|
        each_adjacent(u) { |v| yield u,v }
      }
    end

    def to_a
      each_edge.map { |x,y| [x,y] }
    end

    # Protected
    def basic_add_edge(i, j)
      @vertice[i].add(j)
    end
  end

  class DirectedGraph
    include Structures::AdjacencyList
  end
end

