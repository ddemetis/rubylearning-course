class Mp3Analyzer
  attr_reader :mp3_id3tag, :title, :artist, :album, :year, :comment, :genre

  def initialize(file)
    mp3_file = File.new(file)
    mp3_file.seek(-128, IO::SEEK_END)
    @mp3_id3tag = mp3_file.read(128)
    mp3_file.close
    parse_id3tag  if @mp3_id3tag[0..2] == 'TAG'
  end

  def parse_id3tag
      @title = @mp3_id3tag[3..32]
      @artist = @mp3_id3tag[33..62]
      @album = @mp3_id3tag[63..92]
      @year = @mp3_id3tag[93..96]
      @comment = @mp3_id3tag[97..126]
      @genre = @mp3_id3tag[127]
  end

  def to_hash
    {'Title' => @title, 'Artist' => @artist, 'Album' => @album, 'Year' => @year,
       'Comment' => @comment, 'Genre' => @genre}
  end

  def print
    to_hash.each {|key,value| puts "#{key}: #{value}"}
  end

  def to_s
    @mp3_id3tag
  end

end

Mp3Analyzer.new('song.mp3').print









