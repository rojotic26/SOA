
# Module that can be included (mixin) to create and parse TSV data
module TsvBuddy
  # @data should be a data structure that stores information
  #  from TSV or Yaml files. For example, it could be an Array of Hashes.
  attr_accessor :data

  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    @data, keyarr,  temphash  = [], [], {}
    arr = tsv.split("\n")
    keyarr = arr[0].split("\t")
    arr.delete_at(0)
    arr.each do |line|
      val = line.split("\t")
      temphash = Hash[keyarr.zip val]
      @data << temphash
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    flag, keyarr, valuearr, wholevalue = false, [], [], ''
    @data.each do |unique|
      unique.each do |a, b|
        keyarr << a.to_s  if flag == false
        valuearr.push(b.to_s)
      end
      wholevalue = wholevalue + valuearr.join("\t") + "\n"
      flag, valuearr = true, []
    end
    keyarr.join("\t") + "\n" + wholevalue
  end
end
