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
  (a.size-1).times do |i|
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

def Structures._partition(a, left, right, pivot_idx)
  pivot_value = a[pivot_idx]
  _swap(a, pivot_idx, right)
  store_idx = left
  (left..right-1).each do |i|
    if a[i] < pivot_value
      _swap(a, i, store_idx)
      store_idx += 1
    end
  end
  _swap(a, store_idx, right)
  store_idx
end

def Structures._swap(a, p1, p2)
  a[p1], a[p2] = a[p2], a[p1]
end

def Structures._best_pivot(a, l, r, mid)
  min = l
  min = r if a[r] < a[min]
  min = mid if a[min] < a[min]
  min
end

# Quick sort
#
# this is O(n log n) but can be O(n^^2) in worst case
#
def Structures.quick_sort!(a, left=0, right=a.size-1)
    if left < right
      pivot_idx = _best_pivot(a, left, right, left + (right-left)/2)

      pivot_idx = _partition(a, left, right, pivot_idx)
      quick_sort!(a, left, pivot_idx - 1)
      quick_sort!(a, pivot_idx + 1, right)
    end
end
