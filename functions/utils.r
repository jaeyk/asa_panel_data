# Add the columns present in df2 but missing in df2 to df1

add_miss_cols <- function(df1, df2) {

    diff.col.names <- setdiff(names(df2), names(df1))

    df1[diff.col.names] <- NA

    return(df1)

}

# Calculate attrition rate
attr_rate <- function(pre, post) {
    out <- (pre - post)/pre
    round(out, 2)}

# Extract the non-wave part of the names from the column names

extract_name <- function(df, wave) {gsub(glue("{wave}_"), "", names(df)[str_detect(names(df), glue("{wave}"))])}

# Recode responses

recode_response <- function(df) {

    df <- 6 - df

    return(df)

}

# Recode party

recode_party_w1 <- function(df) {

    df[df == 1] <- "Independent"
    df[df == 2] <- "Democrat"
    df[df == 3] <- "Republican"

    return(df)
}

recode_party_w23 <- function(df) {

    df[df == 1] <- "Republican"
    df[df == 2] <- "Independent"
    df[df == 3] <- "Democrat"
    df[df == 4] <- NA
    df[df == 5] <- NA

    return(df)
}

# Recode gender

recode_dummy <- function(df) {

    df <- if_else(df == 1, 1, 0)

    return(df)

}

# Calculate group mean

group_mean <- function(x){
    out <- df %>%
        group_by(wave) %>%
        summarise(mean = mean(x, na.rm = TRUE))

    return(out)
}