## ER Diagram

```mermaid
erDiagram
    file_ {
        int id PK
        string file_name
        string mime_type
        string file_key
        text file_url
        boolean is_public
        datetime created_at
        datetime updated_at
    }

    user_ {
        int id PK
        string username
        string first_name
        string last_name
        string email
        string password
        int avatar_id FK
        datetime created_at
        datetime updated_at
    }
    user_ }o--|| file_ : "avatar_id"

    countries {
        int id PK
        string name
        datetime created_at
        datetime updated_at
    }

    person {
        int id PK
        string first_name
        string last_name
        text biography
        date date_of_birth
        string gender
        int country_id FK
        int main_photo_id FK
        datetime created_at
        datetime updated_at
    }
    person }o--|| countries : "country_id"
    person }o--|| file_ : "main_photo_id"

    movie {
        int id PK
        string title
        text description
        numeric budget
        date release_date
        int duration
        int director_id FK
        int country_id FK
        int poster_id FK
        datetime created_at
        datetime updated_at
    }
    movie }o--|| person : "director_id"
    movie }o--|| countries : "country_id"
    movie }o--|| file_ : "poster_id"

    genres {
        int id PK
        string name
        datetime created_at
        datetime updated_at
    }

    movie_genres {
        int movie_id PK, FK
        int genre_id PK, FK
        datetime created_at
        datetime updated_at
    }
    movie_genres }o--|| movie : "movie_id"
    movie_genres }o--|| genres : "genre_id"

    character_ {
        int id PK
        string name
        text description
        string role
        int movie_id FK
        datetime created_at
        datetime updated_at
    }
    character_ }o--|| movie : "movie_id"

    character_actors {
        int character_id PK, FK
        int person_id PK, FK
        datetime created_at
        datetime updated_at
    }
    character_actors }o--|| character_ : "character_id"
    character_actors }o--|| person : "person_id"

    person_photos {
        int person_id PK, FK
        int file_id PK, FK
        datetime created_at
        datetime updated_at
    }
    person_photos }o--|| person : "person_id"
    person_photos }o--|| file_ : "file_id"

    favorite_movies {
        int user_id PK, FK
        int movie_id PK, FK
        datetime created_at
        datetime updated_at
    }
    favorite_movies }o--|| user_ : "user_id"
    favorite_movies }o--|| movie : "movie_id"
