require "tstats2csv/version"

module Tstats2csv
  def self.split_line(line)
    values = line.split(%r{[ \t/]+})
    if values.length == 40
      return values
    else
      return nil
    end
  end

  def make_csv
    puts "timestamp, read_mbs_avg, write_mbs_avg, read_latency_avg, write_latency_avg, read_queue_avg, write_queue_avg, read_size_avg, write_size_avg, compression, dedupe, recv, send, capacity_ssd, capacity_hdd"
    
  end

end
