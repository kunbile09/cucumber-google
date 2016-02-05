
require 'watir-webdriver'

browser = Watir::Browser.new
browser.goto 'www.google.com'

puts browser.title
puts browser.text


search_field = browser.text_field(id: 'lst-ib')
search_field.flash
search_field.set('Columbus State')
search_field.send_keys(:enter)
results = browser.divs(class: 'g')
puts results.size
results[0].div.div.h3.a.click