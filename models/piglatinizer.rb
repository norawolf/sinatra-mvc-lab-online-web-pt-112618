class PigLatinizer
  # if word starts with 1 consonant, move to end and add "ay"
  # if word starts with 2 or more consonants, move all consonants to end and add "ay"
  # if word starts with vowel, add "way" to end of word. this includes words that are a singular vowel

  # bonus
  # if it's a y followed by consonant, leave it, ex: yvonne -> yvonneway
  # if it's a y followed by a vowel - move to end ex: yellow -> ellowyay
  # handle words starting with 'qu' ex: quiet -> ietquay
  # what about apostrophes or numbers in a word --> maybe remove all punctuation?
  # remove extra whitespace

  # currently only handles words w vowel or X consonants, does not affect casing
  # currently treats Y as a consonant

  def piglatinize(input)
    split = input.split(" ")#.map(&:downcase)
    results = []

    split.each_with_index do |word, index|
      if word.start_with?(/[aeiouAEIOU]/)
        results << word += "way"
      else word.start_with?(/[^aeiou]/)
      #  use string[regex] to return a substring of the consonants at the beginning
        cons = word[/\A[bcdfghjklmnpqrstvwxyz]*/i]

        #uses #string[range] method to return a substring with consants removed from beginning
        results << word[(cons.length)..-1] + cons + "ay"
      end
    end
    results.join(" ")
  end

end
