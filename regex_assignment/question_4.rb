def replace
  sentence="Mrs Monica sharma has been selected for National simming competition"
  sentence.gsub!(/\bMrs\b/,"Ms")
  puts sentence
end
 

replace
