package br.com.pastaeriso.servicos;

import java.time.LocalDateTime;
import com.google.gson.*;
import java.lang.reflect.Type;
public class Deserializer {

  public static class LocalDateTimeDeserializer implements JsonDeserializer<LocalDateTime> {
    public LocalDateTime deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context)
        throws JsonParseException {
      return LocalDateTime.parse(json.getAsJsonPrimitive().getAsString());
    }
  }
}
