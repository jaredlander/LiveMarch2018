library(rvest)

ribalta <- read_html('data/ribalta.html')
ribalta

ribalta %>% html_nodes('ul')
ribalta %>% html_nodes('ul') %>% html_nodes('span')

# this line is looking for the class, but we are already in the nodes
ribalta %>% html_nodes('ul') %>% html_nodes('span') %>% html_nodes('.street')
# this line, finds the node that has a class of 'street' anywhere
ribalta %>% html_nodes('.street')

ribalta %>% html_nodes('.street') %>% html_text()

ribalta %>% html_nodes('#latitude')
ribalta %>% html_nodes('#latitude') %>% html_attr('value')

ribalta %>% html_nodes('table.food-items')
ribalta %>% 
    html_nodes('table.food-items') %>% 
    magrittr::extract2(5)

ribalta %>% 
    html_nodes('table.food-items') %>% 
    magrittr::extract2(5) %>% 
    html_table()
