module ApplicationHelper
    def markdown(text)
        options = [:autolink, :space_after_headers, :hard_wrap]
        Markdown.new(text, *options).to_html.html_safe
    end
end
