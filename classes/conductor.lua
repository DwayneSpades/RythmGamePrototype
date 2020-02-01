conductor = object:new
{
  bpm=0,
  sustain=0,
  beatOffset=0,
  songPosition=0,
  
  getSongPos=
    function(self)
      return self.songPosition
    end
}