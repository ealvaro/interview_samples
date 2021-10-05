class Edge
  attr_accessor :src, :dst, :length

  def initialize(src, dst, length = 1)
    @src = src
    @dst = dst
    @length = length
  end
end

class Graph < Array
  attr_reader :edges

  def initialize
    @edges = []
  end

  def connect(src, dst, length = 1)
    unless self.include?(src)
      raise ArgumentException, "No such vertex: #{src}"
    end
    unless self.include?(dst)
      raise ArgumentException, "No such vertex: #{dst}"
    end
    @edges.push Edge.new(src, dst, length)
  end

  def connect_mutually(vertex1, vertex2, length = 1)
    self.connect vertex1, vertex2, length
    self.connect vertex2, vertex1, length
  end

  def neighbors(vertex)
    neighbors = []
    @edges.each do |edge|
      neighbors.push edge.dst if edge.src == vertex
    end
    return neighbors.uniq
  end

  def length_between(src, dst)
    @edges.each do |edge|
      return edge.length if edge.src == src and edge.dst == dst
    end
    nil
  end

  def dijkstra(src, dst = nil)
    distances = {}
    previouses = {}
    self.each do |vertex|
      distances[vertex] = nil # Infinity
      previouses[vertex] = nil
    end
    distances[src] = 0
    vertices = self.clone
    until vertices.empty?
      nearest_vertex = vertices.inject do |a, b|
        next b unless distances[a]
        next a unless distances[b]
        next a if distances[a] < distances[b]
        b
      end
      break unless distances[nearest_vertex] # Infinity
      if dst and nearest_vertex == dst
        return distances[dst]
      end
      neighbors = vertices.neighbors(nearest_vertex)
      neighbors.each do |vertex|
        alt = distances[nearest_vertex] + vertices.length_between(nearest_vertex, vertex)
        if distances[vertex].nil? or alt < distances[vertex]
          distances[vertex] = alt
          previouses[vertex] = nearest_vertex
          # decrease-key v in Q # ???
        end
      end
      vertices.delete nearest_vertex
    end
    if dst
      return nil
    else
      return distances
    end
  end
end

graph = Graph.new
(1..16).each {|node| graph.push node }
graph.connect_mutually 1, 2, 1
graph.connect_mutually 2, 3, 100
graph.connect_mutually 3, 4, 100
graph.connect_mutually 1, 5, 1
graph.connect_mutually 5, 6, 1
graph.connect_mutually 6, 7, 100
graph.connect_mutually 7, 8, 100
graph.connect_mutually 4, 9, 1
graph.connect_mutually 5,10, 1
graph.connect_mutually 6, 7, 100
graph.connect_mutually 7, 8, 100
graph.connect_mutually 9, 10,1
graph.connect_mutually 10,11,100
graph.connect_mutually 11,12,100
graph.connect_mutually 13,14,100
graph.connect_mutually 14,15,1
graph.connect_mutually 15,16,1
graph.connect_mutually  9,13,100
graph.connect_mutually 10,14,1
graph.connect_mutually 16,12,1
graph.connect_mutually 12, 8,1
graph.connect_mutually  8, 4,1


p graph
p graph.length_between(1, 16)
p graph.neighbors(10)
p graph.dijkstra(1,16)