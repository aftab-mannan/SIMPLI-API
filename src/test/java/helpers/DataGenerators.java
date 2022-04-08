package helpers;

import com.github.javafaker.Faker;

import net.minidev.json.JSONObject;

public class DataGenerators {
    public static String getEmail() {
        Faker faker = new Faker();
        String randomEmail = faker.name().firstName() +faker.random().nextInt(0, 100) + "@test.com";
        return randomEmail;      
    }

    public static String getUsername() {
        Faker faker = new Faker();
        String randomUsername= faker.name().username();
        return randomUsername;      
    }

    public  String getEmail2() {
        Faker faker = new Faker();
        String randomEmail = faker.name().firstName() +faker.random().nextInt(0, 100) + "@test.com";
        return randomEmail;      
    }

    public  static JSONObject getRandomArticleValues() {
        Faker faker = new Faker();
        String title = faker.gameOfThrones().character();
        String description = faker.gameOfThrones().city();
        String body = faker.gameOfThrones().quote();

        JSONObject json = new JSONObject();
        json.put("title", title);
        json.put("description", description);
        json.put("body", body);
        return json;      
    }
}
