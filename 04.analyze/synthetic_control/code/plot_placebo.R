main <- function(){
  
  treatment_data <- load_csv("complete", "treatment_data.csv") %>% 
    dplyr::filter(treatment_year <= 2015,
                  city_id != 21403,
                  city_id != 21421,
                  2206)  
  
  treatment_name_lists <- distinct(treatment_data,city_name) %>% 
    unlist() %>% 
    as.character()
  
  # treatment_name_lists <- treatment_name_lists %>% 
  #   dplyr::filter(city_name != "檜山郡江差町",
  #                 city_name != "檜山郡上ノ国町",
  #                 city_name != "十和田市",
  #                 city_name != "上北郡六戸町") %>%
    # unlist() %>% 
    # as.character()

  purrr::map(treatment_name_lists, synth_placebo, treatment_data)  
  
}


synth_placebo <- function(name_t, treatment_data){
  
  print(name_t)
  file_name <- paste0(name_t, '.rds')
  synth_data <- readRDS(here::here('04.analyze', 'synthetic_control',
                                   'after_2015', 'table', file_name))
  
  # synth_data <- readRDS(here::here('04.analyze','synthetic_control', 'figure',
                                   # 'synth_cov', 'density_1000','table', file_name))
                                   # 
  treatment_one <- treatment_data %>% 
    dplyr::filter(city_name == name_t)
  
  int_year <- unique(treatment_one$treatment_year)
  
  city_name_t <- unique(treatment_one$city_name)
  
  title_name <- paste0("Placebo test ","'", city_name_t,"'")
  
  placebo_plot <- synth_data %>%
    tidysynth::plot_placebos() +
    labs(title = title_name,
         y = "population",
         caption = 'figure 3') +
    theme_bw(base_family = "HiraKakuPro-W3") +
    theme(legend.position = 'none')

  pdf_name <- paste0(city_name_t,".png")
  
  file_name_figure <- paste0(here::here('04.analyze','synthetic_control',
                                        'after_2015', 'placebo',
                                        pdf_name))

  # file_name_figure <- paste0(here::here('04.analyze','synthetic_control',
  #                                       'figure','synth_cov',
  #                                       'density_1000','placebo', pdf_name))
  
  ggsave(placebo_plot, filename = file_name_figure)
  
  return(placebo_plot)
  
}
