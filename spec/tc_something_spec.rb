require 'tstats2csv'

describe "split_line" do

  let(:valid) {
    #-------------------------  ---Requests (at peak MB/s r/w)---  -------Requests (avg r/w)--------  ---Comp--  -Activity by Principal-  ---Net---  ----SSD (r/w)----  ---HDD (r/w)---  ------CPU------  -------Mem---  --Capacity-
    #           Time            through  latency   queue   size    through  latency    queue   size     lz dupe      SSD         HDD      recv send  through  latency   through latency  avg/max vcs/ics  vmem/ rss/flt    ssd/  hdd
    #-------------------------  --MB/s- ----ms--- ------- --KiB--  --MB/s- ----ms--- ------- --KiB--  ---------  ugswdseerpmu ugswdseerpmu  ----ms---  --MB/s- ----ms---  --MB/s- ---ms--  ---%----K/s-K/s  -GiB--GiB----  ---GB----GB
    "2012-09-17T19:17:11-07:00  688/  1  0.2/ 3.2   2/  2  64/ 13   44/ 13  0.7/ 1.9   4/  7  60/ 42   2.7/ 7.5  5--1-2------ ------------  0.23/0.17   30/  3 0.82/0.43    0/  0   4/  8    2/  5   6/  0  19.2/ 4.2/  0     21/    0"
    #0                          1     2  3    4     5   6  7   8    9   10  11   12    13  14 15  16   17   18   19           20            21   22     23   2425   26      27  28  29  30   31  32  33  34 35    36    37    38     39
  }

  subject { Tstats2csv::split_line(valid) }

  it { subject[0].should eq "2012-09-17T19:17:11-07:00" }
  it { subject[1].should eq "688" }
  it { subject[2].should eq "1" }
  it { subject[3].should eq "0.2" }
  it { subject[19].should eq "5--1-2------" }

  it "should return nil for invalid lines" do
    results = Tstats2csv::split_line("bogus")
    results.should eq nil
  end


end









# timestamp
# read_mbs_peak
# write_mbs_peak
# read_latency_peak
# write_latency_peak
# read_queue_peak
# write_queue_peak
# read_sizekib_peak
# write_sizekib_peak
# read_mbs_avg
# write_mbs_avg
# read_latency_avg
# write_latency_avg
# read_queue_avg
# write_queue_avg
# read_sizekib_avg
# write_sizekib_avg
# local_compression
# dedupe
# user_ssd
# gc_read_ssd
# stasis_read_ssd
# write_pipeline_ssd
# disk_writeback_ssd
# scan_ssd
# extentscrub_ssd
# extenttools_ssd
# raid_disk_reconstruction_ssd
# prefetch_ssd
# misc_ssd
# upgrade_ssd
# user_hdd
# gc_read_hdd
# stasis_read_hdd
# write_pipeline_hdd
# disk_writeback_hdd
# scan_hdd
# extentscrub_hdd
# extenttools_hdd
# raid_disk_reconstruction_hdd
# prefetch_hdd
# misc_hdd
# upgrade_hdd
# recv
# send
# read_mbs_ssd
# write_mbs_ssd
# read_latency_ssd
# write_latency_ssd
# read_mbs_hdd
# write_mbs_hdd
# read_latency_hdd
# write_latency_hdd
# cpu_avg
# cpu_max
# cpu_vcs
# cpu_ics
# mem_vmem
# mem_rss
# mem_flt
# capacity_ssd
# capacity_hdd
