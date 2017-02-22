#######################################################################
#                          Benjamin Tremblay                          #
#                             2017-02-22                              #
#           write motifs to a file connection in MEME format            #
#######################################################################

######################
#  public functions  #
######################

write_meme <- function(motif_list, file_out) {
  outfile <- file(file_out)
  writeLines(converted_motif, con = file_out)
  # in this case converted_motif is a vector of chars, each representing a line
  close(outfile)
}