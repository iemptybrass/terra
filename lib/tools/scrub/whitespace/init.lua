return function(self)
  self.input = self.input
    :gsub("[\194-\244][\128-\191]+", " ")
    :gsub("[^\32-\126]", " ")
    :gsub("%s+", " ")
  return self
end
