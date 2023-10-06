library(openai)

Sys.setenv(
  OPENAI_API_KEY = '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'
)

?create_chat_completion
a = create_chat_completion(
  model = "gpt-4",
  messages = list(
    list(
      "role" = "system",
      "content" = "You are a Natural Language Processing expert and also an R and Rmarkdown expert."
    ),
    list(
      "role" = "user",
      "content" = "Hello, I want to create a 90 minute Rmarkdown presentation that's an introduction to NLP,
      please help me write the introductory chapter of the presentation, these are the topics:
      
      1. Introduction to NLP:
   - Definition of NLP
   - Importance and applications of NLP
   - Challenges in NLP"
    )
  ))




ch = a$choices
ch

writeLines(ch$message.content)
