poner_nombres <- function(vector) {
  names(vector) <- paste0("dim", 1:length(vector))
  return(vector)
}


split_text <- function(string) {
  edit1 <- str_split(string, "\\.")[[1]]  
  return(edit1)
}

split_and_edit <-  function(string) {
  edit1 <- str_split(string, "\\.")[[1]]  
  edit2 <- str_remove_all(edit1, '\\"|‘|’|»') %>% 
    str_remove_all("[[:punct:]]") %>% 
    tm::removeWords( stopwords("es")) %>% 
    str_trim(side = "both") %>% 
    str_replace_all(pattern = "  ", " " ) %>% 
    str_replace_all(pattern = "  ", " " )
  return(edit2)
}

editar_texto <-  function(string) {
  edit2 <- str_remove_all(string, '\\"|‘|’|»') %>% 
    str_remove_all("[[:punct:]]") %>% 
    tm::removeWords( stopwords("es")) %>% 
    str_trim(side = "both") %>% 
    str_replace_all(pattern = "  ", " " ) %>% 
    str_replace_all(pattern = "  ", " " )
  return(edit2)
}



editar_texto2 <-  function(string) {
  edit1 <- paste(string, collapse = " ")
  edit2 <- str_remove_all(edit1, '\\"|‘|’|»') %>% 
    str_remove_all("[[:punct:]]") %>%
    str_trim(side = "both")
  return(edit2)
}


eliminar_vacios <- function(lista) {
  discard(lista,  function(x) x == "")  
}

encontrar_mas_parecidos <- function(vectores, texto, n = 3 ) {
  vector <-  create_representation(texto)
  vector <- vector[[1]] %>% unname() %>% unlist()
  similitud <-  map_dbl(vectores, ~coop::cosine(vector, .x ) )
  top <- order(similitud, decreasing=T)[1:n]
  return(textos[top])
}

create_representation <- function(texto) {
  var_names <- paste0("dim", 1:300)
  doc = nlp(texto)  
  indices <- 0:(length(doc) - 1)
  
  vectores <- map(indices,  ~doc[.x]$vector ) %>% 
    discard(function(x) sum(x) == 0 ) %>% 
    map(set_names, var_names) %>% 
    bind_rows()
  
  representacion <-  map(vectores, mean)
  return(list(representacion, texto, length(indices)) )
}

crear_tabla <- function(concepto) {
  data.frame(oraciones = unlist(concepto)) %>% 
    kbl() %>% 
    kable_styling(font_size = 12)
}


