% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pagination.R
\name{paginate_indices}
\alias{paginate_indices}
\alias{paginate}
\alias{pagination}
\alias{paginate_to_mpfs}
\alias{diagnose_pagination}
\title{Paginate a table-like object for rendering}
\usage{
paginate_indices(
  obj,
  page_type = "letter",
  font_family = "Courier",
  font_size = 8,
  lineheight = 1,
  landscape = FALSE,
  pg_width = NULL,
  pg_height = NULL,
  margins = c(top = 0.5, bottom = 0.5, left = 0.75, right = 0.75),
  lpp = NA_integer_,
  cpp = NA_integer_,
  min_siblings = 2,
  nosplitin = list(rows = character(), cols = character()),
  colwidths = NULL,
  tf_wrap = FALSE,
  max_width = NULL,
  indent_size = 2,
  pg_size_spec = NULL,
  rep_cols = num_rep_cols(obj),
  col_gap = 3,
  fontspec = font_spec(font_family, font_size, lineheight),
  round_type = c("iec", "sas"),
  verbose = FALSE
)

paginate_to_mpfs(
  obj,
  page_type = "letter",
  font_family = "Courier",
  font_size = 8,
  lineheight = 1,
  landscape = FALSE,
  pg_width = NULL,
  pg_height = NULL,
  margins = c(top = 0.5, bottom = 0.5, left = 0.75, right = 0.75),
  lpp = NA_integer_,
  cpp = NA_integer_,
  min_siblings = 2,
  nosplitin = character(),
  colwidths = NULL,
  tf_wrap = FALSE,
  max_width = NULL,
  indent_size = 2,
  pg_size_spec = NULL,
  page_num = default_page_number(),
  rep_cols = NULL,
  col_gap = 3,
  fontspec = font_spec(font_family, font_size, lineheight),
  round_type = c("iec", "sas"),
  verbose = FALSE
)

diagnose_pagination(
  obj,
  page_type = "letter",
  font_family = "Courier",
  font_size = 8,
  lineheight = 1,
  landscape = FALSE,
  pg_width = NULL,
  pg_height = NULL,
  margins = c(top = 0.5, bottom = 0.5, left = 0.75, right = 0.75),
  lpp = NA_integer_,
  cpp = NA_integer_,
  min_siblings = 2,
  nosplitin = character(),
  colwidths = propose_column_widths(matrix_form(obj, TRUE, round_type = round_type),
    fontspec = fontspec, round_type = round_type),
  tf_wrap = FALSE,
  max_width = NULL,
  indent_size = 2,
  pg_size_spec = NULL,
  rep_cols = num_rep_cols(obj),
  col_gap = 3,
  verbose = FALSE,
  fontspec = font_spec(font_family, font_size, lineheight),
  round_type = c("iec", "sas"),
  ...
)
}
\arguments{
\item{obj}{(\code{ANY})\cr object to be paginated. Must have a \code{\link[=matrix_form]{matrix_form()}} method.}

\item{page_type}{(\code{string})\cr name of a page type. See \code{\link{page_types}}. Ignored
when \code{pg_width} and \code{pg_height} are set directly.}

\item{font_family}{(\code{string})\cr name of a font family. An error will be thrown
if the family named is not monospaced. Defaults to \code{"Courier"}.}

\item{font_size}{(\code{numeric(1)})\cr font size. Defaults to \code{12}.}

\item{lineheight}{(\code{numeric(1)})\cr line height. Defaults to \code{1}.}

\item{landscape}{(\code{flag})\cr whether the dimensions of \code{page_type} should be
inverted for landscape orientation. Defaults to \code{FALSE}, ignored when \code{pg_width} and
\code{pg_height} are set directly.}

\item{pg_width}{(\code{numeric(1)})\cr page width in inches.}

\item{pg_height}{(\code{numeric(1)})\cr page height in inches.}

\item{margins}{(\code{numeric(4)})\cr named numeric vector containing \code{"bottom"}, \code{"left"},
\code{"top"}, and \code{"right"} margins in inches. Defaults to \code{.5} inches for both vertical
margins and \code{.75} for both horizontal margins.}

\item{lpp}{(\code{numeric(1)} or \code{NULL})\cr lines per page. If \code{NA} (the default), this is calculated automatically
based on the specified page size). \code{NULL} indicates no vertical pagination should occur.}

\item{cpp}{(\code{numeric(1)} or \code{NULL})\cr width (in characters) per page. If \code{NA} (the default), this is calculated
automatically based on the specified page size). \code{NULL} indicates no horizontal pagination should occur.}

\item{min_siblings}{(\code{numeric})\cr minimum sibling rows which must appear on either side of pagination row for a
mid-subtable split to be valid. Defaults to 2 for tables. It is automatically turned off (set to 0) for listings.}

\item{nosplitin}{(\code{character})\cr list of names of subtables where page breaks are not allowed, regardless of other
considerations. Defaults to none.}

\item{colwidths}{(\code{numeric})\cr vector of column widths (in characters) for use in vertical pagination.}

\item{tf_wrap}{(\code{flag})\cr whether the text for title, subtitles, and footnotes should be wrapped.}

\item{max_width}{(\code{integer(1)}, \code{string} or \code{NULL})\cr width that title and footer (including
footnotes) materials should be word-wrapped to. If \code{NULL}, it is set to the current print width of the
session (\code{getOption("width")}). If set to \code{"auto"}, the width of the table (plus any table inset) is
used. Parameter is ignored if \code{tf_wrap = FALSE}.}

\item{indent_size}{(\code{numeric(1)})\cr indent size, in characters. Ignored when \code{x} is already
a \code{MatrixPrintForm} object in favor of information there.}

\item{pg_size_spec}{(\code{page_size_spec})\cr. a pre-calculated page size specification. Typically this is not set by
end users.}

\item{rep_cols}{(\code{numeric(1)})\cr number of \emph{columns} (not including row labels) to be repeated on every page.
Defaults to 0.}

\item{col_gap}{(\code{numeric(1)})\cr The number of spaces to be placed between columns
in the rendered table (and assumed for horizontal pagination).}

\item{fontspec}{(\code{font_spec})\cr a font_spec object specifying the font information to use for
calculating string widths and heights, as returned by \code{\link[=font_spec]{font_spec()}}.}

\item{round_type}{(\code{"iec"} or \code{"sas"})\cr the type of rounding to perform. iec,
the default, peforms rounding compliant with IEC 60559 (see details), while
sas performs nearest-value rounding consistent with rounding within SAS.}

\item{verbose}{(\code{flag})\cr whether additional informative messages about the search for
pagination breaks should be shown. Defaults to \code{FALSE}.}

\item{page_num}{(\code{string})\cr placeholder string for page numbers. See \link{default_page_number} for more
information. Defaults to \code{NULL}.}

\item{...}{additional parameters passed to individual methods.}
}
\value{
\itemize{
\item \code{paginate_indices} returns a \code{list} with two elements of the same length: \code{pag_row_indices} and \code{pag_col_indices}.
\item \code{paginate_to_mpfs} returns a \code{list} of  \code{MatrixPrintForm} objects representing each individual page after
pagination (including forced pagination if necessary).
}

\itemize{
\item \code{diagnose_pagination} returns a \code{list} containing:

\describe{
\item{\code{lpp_diagnostics}}{Diagnostic information regarding lines per page.}
\item{\code{row_diagnostics}}{Basic information about rows, whether pagination was attempted
after each row, and the final result of such an attempt, if made.}
\item{\code{cpp_diagnostics}}{Diagnostic information regarding columns per page.}
\item{\code{col_diagnostics}}{Very basic information about leaf columns, whether pagination
was attempted after each leaf column, ad the final result of such attempts, if made.}
}
}
}
\description{
These functions perform or diagnose bi-directional pagination on an object.
}
\details{
\code{paginate_indices} renders \code{obj} into a \code{MatrixPrintForm} (MPF), then uses that representation to
calculate the rows and columns of \code{obj} corresponding to each page of the pagination of \code{obj}, but
simply returns these indices rather than paginating \code{obj} itself (see Details for an important caveat).

\code{paginate_to_mpfs} renders \code{obj} into its MPF intermediate representation, then paginates that MPF into
component MPFs each corresponding to an individual page and returns those in a \code{list}.

\code{diagnose_pagination} attempts pagination via \code{paginate_to_mpfs}, then returns diagnostic information
which explains why page breaks were positioned where they were, or alternatively why no valid pagination
could be found.

All three of these functions generally support all classes which have a corresponding \code{\link[=matrix_form]{matrix_form()}}
method which returns a valid \code{MatrixPrintForm} object (including \code{MatrixPrintForm} objects themselves).

\code{paginate_indices} is directly called by \code{paginate_to_mpfs} (and thus \code{diagnose_pagination}). For most
classes, and most tables represented by supported classes, calling \code{paginate_to_mpfs} is equivalent to a
manual \verb{paginate_indices -> subset obj into pages -> matrix_form} workflow.

The exception to this equivalence is objects which support "forced pagination", or pagination logic which
is built into the object itself rather than being a function of space on a page. Forced pagination
generally involves the creation of, e.g., page-specific titles which apply to these forced paginations.
\code{paginate_to_mpfs} and \code{diagnose_pagination} support forced pagination by automatically calling the
\code{\link[=do_forced_paginate]{do_forced_paginate()}} generic on the object and then paginating each object returned by that generic
separately. The assumption here, then, is that page-specific titles and such are handled by the class'
\code{\link[=do_forced_paginate]{do_forced_paginate()}} method.

\code{paginate_indices}, on the other hand, \emph{does not support forced pagination}, because it returns only a
set of indices for row and column subsetting for each page, and thus cannot retain any changes, e.g.,
to titles, done within \code{\link[=do_forced_paginate]{do_forced_paginate()}}. \code{paginate_indices} does call \code{\link[=do_forced_paginate]{do_forced_paginate()}}, but
instead of continuing it throws an error in the case that the result is larger than a single "page".

\code{diagnose_pagination} attempts pagination and then, regardless of success or failure, returns diagnostic
information about pagination attempts (if any) after each row and column.

The diagnostics data reflects the final time the pagination algorithm evaluated a page break at the
specified location, regardless of how many times the position was assessed in total.

To get information about intermediate attempts, perform pagination with \code{verbose = TRUE} and inspect
the messages in order.
}
\note{
For \code{diagnose_pagination}, the column labels are not displayed in the \code{col_diagnostics} element
due to certain internal implementation details; rather the diagnostics are reported in terms of
absolute (leaf) column position. This is a known limitation, and may eventually be changed, but the
information remains useful as it is currently reported.

\code{diagnose_pagination} is intended for interactive debugging use and \emph{should not be programmed against},
as the exact content and form of the verbose messages it captures and returns is subject to change.

Because \code{diagnose_pagination} relies on \code{capture.output(type = "message")}, it cannot be used within the
\code{testthat} (and likely other) testing frameworks, and likely cannot be used within \code{knitr}/\code{rmarkdown}
contexts either, as this clashes with those systems' capture of messages.
}
\examples{
mpf <- basic_matrix_form(mtcars)

paginate_indices(mpf, pg_width = 5, pg_height = 3)

paginate_to_mpfs(mpf, pg_width = 5, pg_height = 3)

diagnose_pagination(mpf, pg_width = 5, pg_height = 3)
clws <- propose_column_widths(mpf)
clws[1] <- floor(clws[1] / 3)
dgnost <- diagnose_pagination(mpf, pg_width = 5, pg_height = 3, colwidths = clws)
try(diagnose_pagination(mpf, pg_width = 1)) # fails

}
