# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."
User.destroy_all
Post.destroy_all

puts "Database cleaned!"

puts "Creating admin users..."

User.create(
  email: ENV['ADMIN_EMAIL_1'].to_s,
  password: ENV['ADMIN_PASSWORD_1'].to_s,
  admin: true
)

User.create(
  email: ENV['ADMIN_EMAIL_2'].to_s,
  password: ENV['ADMIN_PASSWORD_2'].to_s,
  admin: true
)

User.create(
  email: ENV['ADMIN_EMAIL_3'].to_s,
  password: ENV['ADMIN_PASSWORD_3'].to_s,
  admin: true
)

puts "#{User.count} admin users created!"

puts "Creating posts..."

# 2 posts de type "publications"
Post.create(
  category: "publications".upcase,
  title: "La responsabilité de plein droit du seul parent chez lequel la résidence habituelle de l’enfant mineur a été fixée : conformité du 4ème alinéa de l’article 1242 du Code civil à la Constitution.",
  subtitle: "Décision n°2023-1045 QPC du 21 avril 2023",
  content: "Par une décision rendue le 21 avril 2023, le Conseil Constitutionnel a confirmé la conformité à la Constitution de l’article 1242 al. 4 du Code civil tel qu’interprété par la Cour de cassation, instituant une responsabilité de plein droit du seul parent chez lequel la résidence habituelle de l’enfant mineur a été fixée.
Voir l’article rédigé par Thomas de Boysson, avocat associé, et Clémence Series Frémont, avocate collaboratrice :",
  publish_link: "https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000047477101",
  article_link: "https://chatainassocies.com/wp-content/uploads/2023/05/Chatain-Focus-decision-conseil-constitutionnel.pdf",
  date: Date.new(2023, 5, 4)
)

Post.create(
  category: "publications".upcase,
  title: "Destination – Sous-destination – Nouveau décret",
  subtitle: "Décret n°2023-195 du 22 mars 2023",
  content: "Le mois de mars s’est terminé avec la publication le 24 mars dernier du décret, tant attendu, relatif aux destinations. Il est accompagné d’un arrêté paru le même jour modifiant l’arrêté du 10 novembre 2016 précisant la définition des sous-destinations.
Voir l’article rédigé par Muriel Fayat, avocate associée :",
  publish_link: "https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000047334912",
  article_link: "https://chatainassocies.com/wp-content/uploads/2023/04/Chatain-Focus-Destination-Sous-destination-Nouveau-decret.pdf",
  date: Date.new(2023, 4, 7)
)

# Post de type "classements", sans subtitle, publish_link et article_link
Post.create(
  category: "classements".upcase,
  title: "Classement « Best Lawyers » 2023",
  content: "Les associés de Chatain & Associés de nouveau parmi les Best Lawyers avec :
– Antoine Chatain, Dominique Ham et Thomas de Boysson en Insurance Law
– Antoine Chatain en Litigation
– Muriel Fayat en Administrative Law et Public Law
– Camille Potier en Criminal Defense

Félicitations à nos associés pour s’être distingués une nouvelle fois !
Un grand merci à nos équipes pour leur engagement et à nos confrères pour leur confiance renouvelée !",
  date: Date.new(2022, 9, 26)
)

# Post de type "communiqués de presse", sans subtitle, publish_link et article_link
Post.create(
  category: "communiqués de presse".upcase,
  title: "Arrivée d’Olivier MOREAU",
  content: "Le cabinet est très heureux d’annoncer l’arrivée d’Olivier Moreau, avocat collaborateur, au sein du cabinet.

👉 Il rejoint l’équipe Risques industriels et droit des assurances menée par Antoine Chatain, Thomas de Boysson et Dominique HAM, associés.
👉 Olivier est avocat au Barreau de Paris (Ordre des avocats de Paris) depuis 2019, il est diplômé d’un Master 2 Droit international privé et du commerce international – Paris 2.",
  date: Date.new(2021, 3, 4)
)

# Post de type "événements", sans publish_link et article_link
Post.create(
  category: "événements".upcase,
  title: "Chatain & Associés ouvre un bureau à Bordeaux",
  subtitle: "Le cabinet Chatain & Associés ouvre son premier bureau en régions. Thomas de Boysson, associé co-responsable du pôle assurance du cabinet, sera en charge du déploiement de cette antenne bordelaise.",
  content: "Fidèle à l’ADN du cabinet, le nouveau bureau accompagnera ses clients dans l’anticipation et la gestion des litiges. Partant de la volonté d’être toujours au cœur des enjeux de la vie des affaires et au plus près de leurs clients, les associés du cabinet entendent proposer localement leurs compétences reconnues au niveau national en droit des affaires, en droit de la responsabilité et des assurances, ainsi qu’en droit public et en droit pénal.
« Offrir localement un accès direct aux compétences spécifiques de mes associés parisiens et proposer mes propres compétences dans la région pour nos clients assureurs et assurés sont les principales motivations de la mise en œuvre de ce projet. Le choix de la Nouvelle Aquitaine a été guidé en raison du dynamisme de ce territoire et de mes liens avec la ville de Bordeaux dont je suis issu », souligne Thomas de Boysson.
Les équipes des bureaux de Bordeaux et Paris travailleront en étroite collaboration grâce aux nouvelles technologies dont le cabinet est équipé.
« Nous sommes dans un dynamique de croissance et forts d’une réelle confiance dans l’avenir de notre cabinet. L’arrivée de Camille Potier en octobre dernier en tant qu’associée pour renforcer notre compétence en droit pénal des affaires et compliance en est le témoin. Nous envisageons ce déploiement en régions à plus grande échelle avec une réflexion d’implantations dans d’autres territoires pour être au plus près de nos clients dans un contexte particulièrement compliqué. », ajoute Antoine Chatain, Managing Partner.
A propos de Thomas de Boysson
Avocat à la Cour, Thomas de Boysson a développé, au fil des années, une expertise en matière de contentieux de la responsabilité civile, des assurances et de la construction, tant en défense qu’en recours. L’avocat de 37 ans a rejoint la structure en 2012 en tant que collaborateur. Diplômé d’un master 2 de l’institut des assurances de Bordeaux (2008), entre 2008 et 2010, il passe plusieurs mois au sein du service indemnisation de la compagnie d’assurance AIG. Il est également membre de l’Association internationale de Droit des Assurances (AIDA). La compétence du pôle assurance du Cabinet dont il est co-responsable avec Antoine Chatain et Dominique Ham est reconnue par le marché depuis de nombreuses années.",
  date: Date.new(2021, 3, 4)
)

puts "#{Post.count} posts created!"
