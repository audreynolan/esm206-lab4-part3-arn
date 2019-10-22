# Audrey Nolan 
# ESM 206 lab 4 

# read in data, clean, etc. 

db <- read_csv(here::here("data", "disease_burden.csv")) %>% 
  clean_names() %>% 
  rename(deaths_per_100k = death_rate_per_100_000)


db_sub <- db %>% 
  filter(country_name %in% c("United States", "Japan", "Afghanistan", "Somalia")) %>%
  filter(age_group == "0-6 days", sex == "Both")

# graph: 
# if run this, then looks funky b/c is a mapped variabled or graph?? so tell the color to be based off country name
ggplot(data = db_sub, aes(x = year, 
                          y = deaths_per_100k))+
  geom_line(aes(color = country_name))

ggsave(here::here("final_graphs","disease_graphs.png", size = 5))
