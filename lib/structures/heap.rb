#
# heap
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

require 'ostruct'

module Structures
  class Heap

    def initialize
      @H ||= Array.new
    end

    # insert a new key, value pair
    def insert(k, v)
      node = OpenStruct.new(:key=>k, :value=>v)
      @H.push(node)
      siftup(size-1)
    end

    # returns nil if empty
    def extract_min
      lastelem = @H.pop
      return unpack(lastelem) if empty?

      ret = @H.first
      @H[0] = lastelem
      siftdown(0, size)
      return unpack(ret)
    end

    def find_min
      if empty?
        nil
      else
        unpack(@H.first)
      end
    end

    def replace(key)
      ret = @H[0].clone
      @H[0].key = key
      siftdown(0, size)
      return unpack(ret)
    end

    # decrease the key for a value and
    # move into it's new position
    #
    # note, finding the value is O(n) by
    # this method
    def decrease_key(k, v)
      idx = nil
      @H.each_with_index do |elem, i|
        if elem.value == v
          idx = i
        end
      end
      return if idx.nil?
      @H[idx].key = k
      siftup(idx)
    end

    # Decrease the key of the node at position x
    # and move into position by siftup
    def siftup(x)
      while parent(x) >= 0 and @H[x].key < @H[parent(x)].key
        swap(x, parent(x))
        x = parent(x)
      end
    end

    # given a new element at spos, siftdown unil it's less than it's children
    def siftdown(spos, epos)
      smallest = spos
      left = left_child(spos)
      right = right_child(spos)

      smallest = left if left < epos and @H[left].key < @H[smallest].key
      smallest = right if right < epos and @H[right].key < @H[smallest].key

      if smallest != spos
        swap(spos, smallest)
        siftdown(smallest, epos)
      end
    end

    def empty?
      size == 0
    end

    def size
      @H.length
    end

    def parent(x)
      (x - 1) >> 1
    end

    def left_child(x)
      x * 2 + 1
    end

    def right_child(x)
      x * 2 + 2
    end

    def swap(pos1, pos2)
      @H[pos1], @H[pos2] = @H[pos2], @H[pos1]
    end

    def to_s
      @H.each.join(',')
    end

    def unpack(struct)
      if struct.nil?
        nil
      else
        return struct.key, struct.value
      end
    end
  end
end
