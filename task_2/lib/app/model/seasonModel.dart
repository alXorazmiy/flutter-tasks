



class Seasonmodel {
    String name;
    String image;
    int episodes;
    Seasonmodel({required this.name, required this.image, required this.episodes});

    Seasonmodel copyWith ({
        String? name,
        String? image,
        int? episodes
    }) {
        return Seasonmodel(
            name: name ?? this.name, 
            image: image ?? this.image, 
            episodes: episodes ?? this.episodes
        );
    }

}
