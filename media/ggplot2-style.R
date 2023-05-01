
options(
  ggplot2.discrete.colour = ggokabeito::palette_okabe_ito(),
  ggplot2.discrete.fill = ggokabeito::palette_okabe_ito(),
  ggplot2.continuous.colour = "viridis",
  ggplot2.continuous.fill = "viridis"
)
library(ggplot2)
theme_set(
  theme_minimal(
    base_size = 14,
    base_family = "sans"
  ) %+replace% 
    theme(
      panel.grid.minor = element_blank(),
      legend.position = "bottom",
      plot.background = element_rect(color = "black", fill = NA, size = 3),
      plot.caption = element_text(color = "darkgrey", hjust = 1, size = 10)
    )
)

ggplot <- function(...){
  ggplot2::ggplot(...) +
    labs(caption = "\nlivefreeordichtomize.com")
}
