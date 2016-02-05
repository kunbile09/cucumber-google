When(/^I search google for a common term$/) do
  #go to google
  @browser.goto 'google.com'
  #perform a search for common term
  search_field = @browser.text_field(id: 'lst-ib')
  search_field.flash
  search_field.set('Socks')
  search_field.send_keys(:enter)
  sleep 5
end

Then(/^each search results title contains the search term$/) do
  #go get the results
  results = @browser.divs(class: 'g')
  #compare the search term  to each of the result titles
  results.each do |result|
    expect(result.div.h3.text).to include "Socks"
  end

end

And(/^each search result summary contains the search term$/) do
  #go get the results
  results = @browser.divs(class: 'g')
  #compare the search term  to each of the result summery
  results.each do |result|
    expect(result.div.h3.div.div.text).to include "Socks"
  end


end