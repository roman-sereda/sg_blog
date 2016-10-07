sample_titles = ["Newtown paints a portrait of communal grief, recovery",
    "Students were told to select gender pronouns.",
    "'This is not over': Hurricane sideswipes Florida coast",
    "Court says officers' shooting of unarmed man was justified",
    "One of last USS Arizona survivors of Pearl Harbor attack dies"]

sample_bodies = ["Nearly four years after the shocking massacre at the Sandy Hook Elementary School,
      a new film, Newtown, explores how a small Connecticut town has coped with the
      aftermath of the deadliest shooting of schoolchildren in U.S. history.

      The film, which opens in New York on Friday, begins with a late-summer parade,
      a scene that highlights the innocence of what was in many ways a typical American
      town.",
    "The University of Michigan has implemented a “designated pronoun” policy to allow
      students to choose the way they want their professors to refer to them in class.

      As a protest measure, one student created a new identity: “His Majesty.”

      Grant Strobl, a junior at UM and a conservative activist, inserted himself into
      an emotionally charged national debate over gender identity last week when he
      used the school’s new policy to declare himself royalty.",
    "CAPE CANAVERAL, Fla. (AP) — Hurricane Matthew sideswiped Florida's Atlantic
      coast early Friday, toppling trees onto homes and knocking out power to more
      than 800,000 people but sparing the most heavily populated stretch of shoreline
      the catastrophic blow many had feared.

      Authorities warned that the danger was far from over, with hundreds of miles of
      coastline in Florida, Georgia and South Carolina still under threat of torrential
      rain and deadly storm surge as the most powerful hurricane to menace the Atlantic
      Seaboard in over a decade pushed north.",
    "BALTIMORE — A federal appeals court has declined to revive a mother's lawsuit
      against two Baltimore police officers who killed her son after she called 911 to
      get medical attention for him.

      A three judge panel of the 4th U.S. Circuit Court of Appeals on Friday affirmed a
      lower court ruling that said the officers' use of force was justified because
      Maurice Donald Johnson was acting violently.

      The officers fatally shot Johnson in 2012 after his mother, Marcella Holloman,
      called 911 because he was having a mental health episode. Attorneys for the officers
      said Johnson punched and lunged at them and pinned one officer to the ground.",
    "PROVIDENCE, R.I. — One of the last living crew members on the USS Arizona during the
      Japanese attack on Pearl Harbor has died. Raymond Haerry was 94.

      His son says Haerry died Sept. 27 in Rhode Island.

      He was one of six remaining Arizona survivors.

      Raymond Haerry Jr. told The Associated Press on Friday that his father ran to
      an anti-aircraft gun on Dec. 7, 1941, but the ammunition was in storage."]

5.times do |x|
  Post.create title: sample_titles[x-1], body: sample_bodies[x-1]
end
