#run r script for the mountain region
rmarkdown::render("steak article params.Rmd",
                  params = list(region = "Mountain"))

# create a custom function, render_report, that you can pass a value to
render_report <-function(regionvar){
  template <-"steak article params.Rmd"
  outfile <-sprintf("steakArticle_%s.html",regionvar)
  parameters <-list(region = regionvar)
  rmarkdown::render(template,
                    output_file=outfile,
                    params=parameters)
  invisible(TRUE)
}

render_report("Pacific")

# to batch process: create a list that you can pass into the custom function render_report
library(purrr)
params_list <- list(list("East North Central",
                         "East South Central", "Middle Atlantic",
                         "Mountain", "New England", "Pacific",
                         "South Atlantic", "West North Central",
                         "West South Central"))
purrr::pmap(params_list,render_report)