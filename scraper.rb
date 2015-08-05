require "mechanize"

url = "https://www.dotabuff.com/heroes#"

agent = Mechanize.new { |agent| agent.user_agent_alias = "Mac Safari" }

html = agent.get(url).body

html_doc = Nokogiri::HTML(html)


list = html_doc.xpath("//div[@class='name']/text()")
list.each { |i| puts(i).to_s }
# list.each { |i| fp.write(i.text + "\n") }
