#
# sort
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

require 'structures/heap'

# Selection sort
#
# this is O(n^^2)
#
def Structures.selection_sort!(a)
  (0..a.size-1).each do |i|
    min = i
    (i+1..a.size-1).each do |j|
      if a[j] < a[min]
        min = j
      end
    end
    a[i], a[min] = a[min], a[i] unless min == i
  end
  a
end

# heap_sort
#
# This is O(n log n)
#
# Insertion could be improved (to be O(n))
def Structures.heap_sort(a)
  h = Structures::Heap.new
  a.each { |e| h.insert(e,e) }

  ret = Array.new
  until h.empty?
    (e, _) =  h.extract_min
    ret << e
  end
  ret
end
