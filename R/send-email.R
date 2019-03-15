#' Send email to alert about some error
#' @description use `gmailr` to send email
#' @export
#' @param msg the message to send
#' @param subject subject of the message
#' @importFrom magrittr %>%
send_email <- function(msg, subject) {
  gmailr::use_secret_file("~/My Documents/Research/Migraine_App/Code/geneRal/stream-client.json")
  email_message <- gmailr::mime() %>%
    gmailr::from(geneRal_email_from) %>%
    gmailr::to(geneRal_email_to) %>%
    gmailr::subject(subject) %>%
    gmailr::html_body(msg)

  gmailr::send_message(email_message)

}
