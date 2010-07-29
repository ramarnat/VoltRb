module VoltRb
  VoltColumn = Struct.new :name, :type

  # This object contains one or more rows (a rowset).
  # Enumerable is implemented so we can access the rows via the usual each, all, first, last.
  #   first_row = response.results[0].first
  # Each row is a hash with the symbolized column names for keys.
  #   puts first_row[:MY_COLUMN]
  # We can get a list of columns via schema.
  class VoltTable
    include Enumerable

    def initialize(hash_data)
      @raw = hash_data
    end

    def status
      @status ||= @raw["status"]
    end

    def schema
      @schema ||= hydrate_schema
    end

    def each
      # ToDo: Benchmark, benchmark, benchmark.
      @raw["data"].each { |r| yield hydrate_row(r) }
    end

    def all
      self.inject([]) { |o,e| o << e; o }
    end

    def first
      hydrate_row(@raw["data"].first)
    end

    def last
      hydrate_row(@raw["data"].last)
    end

    def empty?
      @raw["data"].empty?
    end

    def count
      @raw["data"].size
    end

  private
    def hydrate_schema
      @raw["schema"].inject([]) { |o, e| o << VoltColumn.new(e["name"].to_sym, e["type"]); o }
    end

    def hydrate_row(data)
      row = {}
      self.schema.each_with_index { |col, i| row[col.name.to_sym] = Utils.ruby_from_volt(data[i], col.type) } 
      row
    end
  end
end

