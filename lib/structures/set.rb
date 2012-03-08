#
# set
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


module Structures
  class Set
    # A Simple set structure
    #  It is implemented using a hash
    include Enumerable

    def initialize
      @hash ||= Hash.new
    end

    def insert(item)
      @hash[item] = true
      self
    end
    alias :<< :insert
    alias :add :insert

    # remove an item.
    # If an item has been removed, return it, otherwise nil
    def remove(item)
      if @hash.include?(item)
        @hash.delete(item)
        item
      else
        nil
      end
    end
    alias :delete :remove

    def size
      @hash.size
    end

    def empty?
      @hash.empty?
    end

    def to_a
      @hash.keys
    end

    def to_s
      "[#{to_a.join(',')}]"
    end

    def each
      block_given? or return enum_for(__method__)
      @hash.each_key { |i| yield i }
    end
  end
end
