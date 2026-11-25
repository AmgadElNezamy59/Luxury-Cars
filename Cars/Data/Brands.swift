//
//  Brands.swift
//  Cars
//
//  Created by Amgad ElNezamy
//

import Foundation

extension Brand {
    /// Every marque in the showroom, oldest first.
    static let all: [Brand] = [
        Brand(
            id: "rolls-royce",
            name: "Rolls-Royce",
            tagline: "Effortless luxury, hand-built at Goodwood.",
            founded: 1906, country: "United Kingdom", headquarters: "Goodwood",
            colors: (deep: 0x0C1626, light: 0x4F6A88),
            story: [
                "In May 1904, engineer Henry Royce met Charles Rolls, a car dealer with a list of wealthy London clients, at the Midland Hotel in Manchester. Rolls agreed to sell every car Royce could build, and Rolls-Royce Limited was formed two years later.",
                "The Silver Ghost of 1907 sealed the company's reputation after a record-breaking reliability run, and the press soon called it the best car in the world. The Spirit of Ecstasy has graced the hood since 1911.",
                "Since 2003 the cars have been built by BMW-owned Rolls-Royce Motor Cars at Goodwood, England, a separate business from the aero-engine maker that shares the name. Nearly every car is tailored to its owner, including the all-electric Spectre.",
            ],
            models: [
                ("Silver Ghost", "Vintage touring car"),
                ("Phantom", "Flagship limousine"),
                ("Ghost", "Luxury sedan"),
                ("Cullinan", "Luxury SUV"),
                ("Wraith", "Grand tourer"),
                ("Spectre", "Electric coupé"),
            ],
            milestones: [
                (1904, "Rolls meets Royce", "Charles Rolls and Henry Royce meet at the Midland Hotel in Manchester."),
                (1907, "The Silver Ghost", "A record-breaking reliability run earns it the title \"best car in the world.\""),
                (2003, "A new home at Goodwood", "Production moves to Goodwood, England, under BMW ownership."),
                (2023, "Spectre goes electric", "The first all-electric Rolls-Royce reaches its owners."),
            ],
            wikipedia: "https://en.wikipedia.org/wiki/Rolls-Royce_Motor_Cars"
        ),
        Brand(
            id: "bugatti",
            name: "Bugatti",
            tagline: "Where fine art meets the limits of speed.",
            founded: 1909, country: "France", headquarters: "Molsheim",
            colors: (deep: 0x040E22, light: 0x1F4F8A),
            story: [
                "Italian-born Ettore Bugatti founded his company in 1909 in Molsheim, Alsace, which was then part of Germany and is now in France. He treated cars as works of art: engines were finished like jewelry, and every part had to be as beautiful as it was light.",
                "The Type 35 won well over a thousand races, and the Type 57 SC Atlantic is among the most valuable cars ever made. After Ettore's death in 1947, the company slowly faded away.",
                "Revived by the Volkswagen Group in 1998, Bugatti returned with the Veyron, the first series-production car with more than 1,000 PS. The Chiron and the hybrid Tourbillon followed, and since 2021 the brand has been part of Bugatti Rimac.",
            ],
            models: [
                ("Type 35", "Grand Prix racer"),
                ("Type 57 SC Atlantic", "Classic coupé"),
                ("Veyron", "Hypercar"),
                ("Chiron", "Hypercar"),
                ("Divo", "Track-focused hypercar"),
                ("Tourbillon", "Hybrid hypercar"),
            ],
            milestones: [
                (1909, "Bugatti is founded", "Ettore Bugatti sets up shop in Molsheim, Alsace."),
                (1924, "The Type 35 debuts", "It goes on to win well over a thousand races."),
                (2005, "The Veyron arrives", "The first series-production car with more than 1,000 PS."),
                (2024, "Tourbillon unveiled", "A V16 hybrid hypercar opens Bugatti's next chapter."),
            ],
            wikipedia: "https://en.wikipedia.org/wiki/Bugatti"
        ),
        Brand(
            id: "bmw",
            name: "BMW",
            tagline: "Bavarian engineering built around the driver.",
            founded: 1916, country: "Germany", headquarters: "Munich",
            colors: (deep: 0x111926, light: 0x6A84A8),
            story: [
                "BMW was born in Munich in 1916 as a maker of aircraft engines. Its blue-and-white roundel is often said to be a spinning propeller, but the colors actually come from the flag of Bavaria.",
                "Motorcycles followed in 1923 and cars in 1928. After the Second World War the company came close to being absorbed by Daimler-Benz, until investor Herbert Quandt stepped in around 1960 and kept it independent.",
                "The Neue Klasse sedans of the 1960s set the formula BMW still follows: compact, sporty, driver-focused cars, later refined in the 3 Series, the M performance cars and today's electric i models.",
            ],
            models: [
                ("3 Series", "Sports sedan"),
                ("M3", "Performance sedan"),
                ("7 Series", "Luxury sedan"),
                ("X5", "SUV"),
                ("Z4", "Roadster"),
                ("i7", "Electric sedan"),
            ],
            milestones: [
                (1916, "Born in Munich", "BMW begins life as a maker of aircraft engines."),
                (1923, "The first motorcycle", "The R 32 puts BMW on two wheels."),
                (1962, "The Neue Klasse", "A compact, sporty sedan sets the formula BMW still follows."),
                (1975, "The 3 Series debuts", "It grows into BMW's best-selling model line."),
            ],
            wikipedia: "https://en.wikipedia.org/wiki/BMW"
        ),
        Brand(
            id: "bentley",
            name: "Bentley",
            tagline: "British grand touring, handcrafted in Crewe.",
            founded: 1919, country: "United Kingdom", headquarters: "Crewe",
            colors: (deep: 0x18120D, light: 0x8A6946),
            story: [
                "Walter Owen Bentley, known simply as W.O., founded Bentley Motors in London in 1919 with one goal: to build a good car, a fast car, the best in its class.",
                "His cars proved it at Le Mans, winning five times between 1924 and 1930 in the hands of the wealthy amateur racers known as the Bentley Boys. The Great Depression hit hard, and Rolls-Royce bought the company in 1931.",
                "Since 1998 Bentley has been part of the Volkswagen Group. Every car is still built in Crewe, England, where the Continental GT revived the idea of the handcrafted, long-distance grand tourer.",
            ],
            models: [
                ("Continental GT", "Grand tourer"),
                ("Continental GTC", "Convertible"),
                ("Flying Spur", "Luxury sedan"),
                ("Bentayga", "Luxury SUV"),
                ("Mulsanne", "Flagship sedan"),
                ("Batur", "Coachbuilt grand tourer"),
            ],
            milestones: [
                (1919, "W.O. founds Bentley", "Bentley Motors is founded in London."),
                (1924, "First Le Mans victory", "The first of five Bentley wins at Le Mans by 1930."),
                (1931, "Rolls-Royce takes over", "The Great Depression forces a sale to its great rival."),
                (2003, "The Continental GT", "A modern grand tourer revives the brand under Volkswagen."),
            ],
            wikipedia: "https://en.wikipedia.org/wiki/Bentley"
        ),
        Brand(
            id: "mercedes",
            name: "Mercedes-Benz",
            tagline: "The three-pointed star of German luxury.",
            founded: 1926, country: "Germany", headquarters: "Stuttgart",
            colors: (deep: 0x111317, light: 0x8F98A3),
            story: [
                "In 1886 Karl Benz patented his three-wheeled Motorwagen, widely regarded as the first practical automobile. That same year, Gottlieb Daimler and Wilhelm Maybach fitted an engine to a horse carriage near Stuttgart.",
                "The Mercedes name arrived in 1901, when businessman Emil Jellinek had Daimler build a racing car named after his daughter. In 1926 the two pioneering companies merged into Daimler-Benz, and the Mercedes-Benz brand was born.",
                "Today the three-pointed star, standing for land, sea and air, appears on everything from compact cars to the S-Class, a flagship that has introduced many innovations later adopted across the industry.",
            ],
            models: [
                ("300 SL Gullwing", "Classic sports car"),
                ("S-Class", "Flagship sedan"),
                ("E-Class", "Executive sedan"),
                ("G-Class", "Off-roader"),
                ("SL", "Roadster"),
                ("EQS", "Electric sedan"),
            ],
            milestones: [
                (1886, "The Motorwagen", "Karl Benz patents what's widely seen as the first practical automobile."),
                (1901, "The first Mercedes", "Emil Jellinek names a Daimler racing car after his daughter."),
                (1926, "Daimler-Benz is formed", "The two pioneers merge, and Mercedes-Benz is born."),
                (1954, "The 300 SL Gullwing", "Its upward-opening doors become an instant icon."),
            ],
            wikipedia: "https://en.wikipedia.org/wiki/Mercedes-Benz"
        ),
        Brand(
            id: "porsche",
            name: "Porsche",
            tagline: "Sports cars engineered for every day.",
            founded: 1931, country: "Germany", headquarters: "Stuttgart",
            colors: (deep: 0x141414, light: 0x5D6066),
            story: [
                "Ferdinand Porsche opened an engineering consultancy in Stuttgart in 1931; one of its first major projects became the Volkswagen Beetle. In 1948 his son Ferry built the first Porsche-badged car, the 356, because he couldn't find the sports car he dreamed of.",
                "The 911 arrived in 1963 and has been refined ever since, keeping its rear-mounted engine and unmistakable silhouette for more than sixty years.",
                "Porsche has won the 24 Hours of Le Mans more often than any other manufacturer. Today it builds everything from the 911 to the all-electric Taycan in Stuttgart-Zuffenhausen and Leipzig.",
            ],
            models: [
                ("356", "Classic sports car"),
                ("911", "Sports car"),
                ("918 Spyder", "Hybrid hypercar"),
                ("Cayenne", "SUV"),
                ("Macan", "Compact SUV"),
                ("Taycan", "Electric sports sedan"),
            ],
            milestones: [
                (1931, "An engineering office", "Ferdinand Porsche opens his consultancy in Stuttgart."),
                (1948, "The 356", "Ferry Porsche builds the first Porsche-badged car."),
                (1963, "The 911 debuts", "Its rear-engined silhouette is still in production today."),
                (2019, "Taycan goes electric", "Porsche launches its first all-electric sports car."),
            ],
            wikipedia: "https://en.wikipedia.org/wiki/Porsche"
        ),
        Brand(
            id: "ferrari",
            name: "Ferrari",
            tagline: "The Prancing Horse of Maranello.",
            founded: 1947, country: "Italy", headquarters: "Maranello",
            colors: (deep: 0x260606, light: 0x9E231C),
            story: [
                "Enzo Ferrari was a racer first. His Scuderia Ferrari ran Alfa Romeo's racing team in the 1930s, and he built road cars mainly to fund his true passion. The first car to carry his name, the 125 S, appeared in 1947.",
                "The prancing horse was a gift: the mother of First World War fighter ace Francesco Baracca suggested Enzo use the emblem her son had painted on his plane, for good luck.",
                "Ferrari is the oldest and most successful team in Formula One, and every road car, from the 296 GTB to the four-seat Purosangue, is still built in Maranello, Italy.",
            ],
            models: [
                ("F40", "Supercar"),
                ("LaFerrari", "Hybrid hypercar"),
                ("SF90 Stradale", "Plug-in hybrid supercar"),
                ("296 GTB", "Hybrid sports car"),
                ("12Cilindri", "V12 grand tourer"),
                ("Purosangue", "Four-door, four-seater"),
            ],
            milestones: [
                (1947, "The first Ferrari", "The 125 S carries Enzo's name for the first time."),
                (1950, "Into Formula One", "Ferrari races in the first world championship and every season since."),
                (1987, "The F40", "Built to celebrate Ferrari's 40th anniversary."),
                (2013, "LaFerrari", "Ferrari's first hybrid hypercar."),
            ],
            wikipedia: "https://en.wikipedia.org/wiki/Ferrari"
        ),
        Brand(
            id: "lamborghini",
            name: "Lamborghini",
            tagline: "Outrageous supercars from Sant'Agata.",
            founded: 1963, country: "Italy", headquarters: "Sant'Agata Bolognese",
            colors: (deep: 0x15110A, light: 0x7A6331),
            story: [
                "Tractor manufacturer Ferruccio Lamborghini founded his car company in 1963, convinced he could build a better grand tourer than the Ferraris he owned. Legend has it that a dismissive remark from Enzo Ferrari sealed the decision.",
                "The 1966 Miura defined the mid-engined supercar, and the wedge-shaped Countach became a poster on bedroom walls around the world. After decades of changing owners, Audi bought the company in 1998.",
                "Every Lamborghini is built in Sant'Agata Bolognese, near Bologna. Its latest cars, the Revuelto, Temerario and Urus SE, pair the brand's famous engines with hybrid power.",
            ],
            models: [
                ("Miura", "Classic supercar"),
                ("Countach", "Supercar icon"),
                ("Aventador", "V12 supercar"),
                ("Revuelto", "Hybrid V12 supercar"),
                ("Temerario", "Hybrid V8 supercar"),
                ("Urus", "Super SUV"),
            ],
            milestones: [
                (1963, "Lamborghini is founded", "Ferruccio Lamborghini sets out to build a better grand tourer."),
                (1966, "The Miura", "The car that defined the mid-engined supercar."),
                (1974, "The Countach", "A wedge-shaped poster car for a generation."),
                (2018, "The Urus", "Lamborghini's super SUV becomes its best-seller."),
            ],
            wikipedia: "https://en.wikipedia.org/wiki/Lamborghini"
        ),
    ]
}
