# WARNING - Generated by {fusen} from dev/flat_nettoyage.Rmd: do not edit by hand

#' Title
#' 
#' Description

#' Générer des graphiques pour les contaminants
#'
#' Cette fonction crée des graphiques pour différentes variables avec des options de regroupement, de couleur et de type de graphique.
#'
#' @param data Le jeu de données 
#' @param x La variable à utiliser sur l'axe des x.
#' @param y La variable à utiliser sur l'axe des y .
#' @param group_by La variable pour regrouper les données.
#' @param color_by La variable pour la couleur des données.
#' @param plot_type Le type de graphique à générer.
#'
#' @return Un objet ggplot contenant le graphique.
#' 
#' @export
#'
#' @examples
#' library(votre_package)
#' grahespackeges(data, x = "Sepal.Length", y = "Sepal.Width", group_by = "Species", color_by = "Species", plot_type = "line_point")
#'
#' grahespackeges(data=iris)
grahespackeges <- function(data, x, y, group_by, color_by, plot_type = "line_point") {
  p <- ggplot(aes_string(x = x, y = y, group = group_by, colour = color_by), data = data)
  
  if (plot_type == "line_point") {
    p <- p + geom_line() + geom_point()
  } else if (plot_type == "curve") {
    p <- p + geom_smooth()
  } else if (plot_type == "boxplot") {
    p <- p + geom_boxplot()
  }
  
  p + theme_classic() +
    theme(axis.text.x = element_text(size = 14), axis.text.y = element_text(size = 14, angle = 90),
          text = element_text(size = 14)) + xlab("") + ylab(y)
}

