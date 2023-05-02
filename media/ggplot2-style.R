
options(
  ggplot2.discrete.colour = c(
    "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7",
    "#999999", "#000000"),
  ggplot2.discrete.fill = c(
    "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7",
    "#999999", "#000000"),
  ggplot2.continuous.colour = "viridis",
  ggplot2.continuous.fill = "viridis"
)

library(ggplot2)
update_geom_defaults("point", aes(color = "#3a4145", size = 2.5))
update_geom_defaults("line", aes(color = "#3a4145", linewidth = 1.5))

theme_set(
  theme_minimal(
    base_size = 14,
    base_family = "sans"
  ) %+replace% 
    theme(
      text = element_text(color = "#3a4145"),
      axis.line = element_blank(),
      axis.ticks = element_blank(),
      panel.grid = element_blank(),
      panel.grid.major = element_line(color = "#d2d2d2"),
      strip.background = element_rect(),
      panel.grid.minor = element_blank(),
      plot.margin = unit(c(1, 1, 1, 1), "lines"),
      panel.background = element_rect(fill = "#fffff8"),
      plot.background = element_rect(color = "#3a4145", fill = "#fffff8", linewidth = 3),
      plot.caption = element_text(color = "darkgrey", hjust = 1, size = 10),
      legend.position = "bottom"
    )
)

ggplot <- function(...){
  ggplot2::ggplot(...) +
    labs(caption = "\nlivefreeordichotomize.com")
}
