program StripTags;
{
  VERSION 1.0
  DESCRIPTION
    Strip subtitles of all italic, bold and underline tags
}

var
  subNumber, i, j : Integer;
  line : string;
  newLine : string;
  TAGS : array of string;
begin
  TAGS := ['<i>', '</i>', '<u>', '</u>', '<b>', '</b>'];
  for subNumber := 0 to GetSubtitleCount - 1 do begin
    line := GetSubtitleText(subNumber);
    newLine := line;

    for i := 0 to 5 do begin // loop through all TAGS
      j := pos(TAGS[i], newLine);
      While j <> 0 do begin
        Delete(newLine, j, Length(TAGS[i]));
        j := pos(TAGS[i], newLine);
      end
    end
    SetSubtitleText(subNumber, newLine);
  end
end.
