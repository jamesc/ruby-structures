#
# single_list
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

# Singly linked list implementation

module Structures
  class SingleList

    def initialize
      @head = nil
      @tail = nil
    end

    def insert(value)
      node = element(value)
      if @head.nil?
        @head = node
        @tail = node
      else
        @tail.next = node
        @tail = node
      end
    end
    alias :<< :insert

    def contains(value)
      cur = @head
      until cur.nil? or cur.value == value
        cur = cur.next
      end
      if cur.nil?
        false
      else
        true
      end
    end

    def empty?
      @head.nil?
    end

    def is_tail?(node)
      node.next.nil?
    end

    def size
      len = 0
      each { |value| len += 1 }
      len
    end

    def head
      @head.value
    end

    def tail
      @tail.value
    end

    def delete(value)
      # 1. Empty list
      return false if empty?
      cur = @head
      if value == cur.value
        if is_tail?(@head)
          # 2. removing only element
          @head = nil
          @tail = nil
        else
          # 3. removing head
          @head = @head.next
        end
        return true
      end

      until cur.next.nil? or cur.next.value == value
        cur = cur.next
      end

      unless cur.next.nil? # found it
        if is_tail?(cur.next)
          # 4. removing tail
          cur.next = nil
          @tail = cur
        else
          # 5. removing mid element
          cur.next = cur.next.next
        end
        return true
      end

      # 6. not in list
      return false
    end

    # traverse the list
    def each
      raise "Block required" unless block_given?

      cur = @head
      until cur.nil?
        yield cur.value
        cur = cur.next
      end
    end

    # Make a new list element
    def element(value)
      OpenStruct.new(:value => value, :next => nil)
    end
  end
end


