module TwitterBootstrapMarkup
  class Tag
    def html_safe
      to_s.html_safe
    end
  end
end