% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/model.R
\name{sleuth_results}
\alias{sleuth_results}
\title{Extract Wald test results from a sleuth object}
\usage{
sleuth_results(obj, test, test_type = "wt", which_model = "full",
  rename_cols = TRUE, show_all = TRUE)
}
\arguments{
\item{obj}{a \code{sleuth} object}

\item{test}{a character string denoting the test to extract. Possible tests can be found by using \code{models(obj)}.}

\item{which_model}{a character string denoting the model. If extracting a wald test, use the model name. If extracting a likelihood ratio test, use 'lrt'.}

\item{rename_cols}{if \code{TRUE} will rename some columns to be shorter and
consistent with vignette}

\item{show_all}{if \code{TRUE} will show all transcripts (not only the ones
passing filters). The transcripts that do not pass filters will have
\code{NA} values in most columns.}
}
\value{
a \code{data.frame} with the following columns:

target_id: transcript name, e.g. "ENSXX#####" (dependent on the transcriptome used in kallisto)

pval: p-value of the chosen model

qval: false discovery rate adjusted p-value, using Benjamini-Hochberg (see \code{\link{p.adjust}})

b: 'beta' value (effect size). Technically a biased estimator of the fold change

se_b: standard error of the beta

mean_obs: mean of natural log counts of observations

var_obs: variance of observation

tech_var: technical variance of observation from the bootstraps

sigma_sq: raw estimator of the variance once the technical variance has been removed

smooth_sigma_sq: smooth regression fit for the shrinkage estimation

final_simga_sq: max(sigma_sq, smooth_sigma_sq); used for covariance estimation of beta
}
\description{
This function extracts Wald test results from a sleuth object.
}
\examples{
models(sleuth_obj) # for this example, assume the formula is ~condition,
                     and a coefficient is IP
results_table <- sleuth_results(sleuth_obj, 'conditionIP')
}
\seealso{
\code{\link{sleuth_wt}} and \code{\link{sleuth_lrt}} to compute tests, \code{\link{models}} to
view which models, \code{\link{tests}} to view which tests were performed (and can be extracted)
}

