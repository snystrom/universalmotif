#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericMatrix trim_motif_internal(NumericMatrix motif, NumericVector ic_scores,
    double min_ic) {

  int n_row = motif.nrow();
  int n = motif.ncol();

  int new_cols = n;
  int cut_left = 0;

  for (int i = 0; i < n; ++i) {
    if (ic_scores[i] < min_ic) {
      new_cols -= 1;
      cut_left += 1;
    } else break;
  }

  for (int i = 0; i < n; ++i) {
    if (ic_scores[n - i - 1] < min_ic) {
      new_cols -= 1;
    } else break;
  }

  if (new_cols <= 0) {
    NumericMatrix out;
    return out;
  }

  NumericMatrix out(n_row, new_cols);
  for (int i = 0; i < new_cols; ++i) {
    out(_, i) = motif(_, i + cut_left);
  }

  CharacterVector rown = rownames(motif);
  rownames(out) = rown;

  return out;

}