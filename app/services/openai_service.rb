# app/services/openai_service.rb
require "openai"

class OpenaiService
  attr_reader :client, :prompt

  def initialize(prompt)
    @client = OpenAI::Client.new
    @prompt = prompt
  end

  def call
    @response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: @prompt }],
        temperature: 0.7,
        stream: false,
        max_tokens: 500
      }
    )

    if @response && @response["choices"].present?
      return @response["choices"][0]["message"]["content"]
    else
      return "No response from OpenAI."
    end
  end
end
