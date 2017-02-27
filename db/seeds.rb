# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(email: 'admin@test.com',password: 'admin123').add_role :admin
User.create!(email: 'test@gmail.com',password: 'password')
Profile.create!(name:'Admin',city:'Lahore',gender:'M',user_id:1)
Profile.create!(name:'Test',city:'Lahore',gender:'M',user_id:2)
City.create!(name: 'Lahore')
City.create!(name: 'Karachi')
City.create!(name: 'Rawalpindi')
City.create!(name: 'Islamabad')
City.create!(name: 'Topi')
Discipline.create!(name:'Business',image_file_name:'business.jpg',description:'Business and management includes all the disciplines that deal with the organisation and coordination of enterprises that deal with products and services traded for profit. Business and management activities aim at accomplishing specific organisational goals, increasing the capital of the company and its overall efficiency.')
Discipline.create!(name:'Engineering',image_file_name:'engineering.jpg',description:'Engineering and technology is based on the application of existing technology within a field of engineering through the use of basic engineering principles and technical skills. As such, bachelor and master programmes in engineering and technology focus primarily on the applied aspects of science to equip graduates with practical technical skills in product improvement, manufacturing, construction or engineering operational functions.Universities provide a wide offer of Masters of Science (M.Sc.) in engineering and technology that keeps on growing and resulting in extensive specialisations and technological development. Studying engineering equips students with practical skills to acquire and apply scientific, mathematical, economic, social and practical ')
Discipline.create!(name:'Law',image_file_name:'law.jpg',description:'The unique five-year joint BA-LL.B is designed for students seeking a challenging, rigorous, interdisciplinary exposure to law and related vital disciplines. Furthermore, while the focal point is the Pakistani legal system, the teaching methodology encompasses a critical, comparative approach in order to broaden perspectives and sharpen analytical skills of the students. Additionally, the ambit of studies is not just laws as they exist and operate, but also how policy impacts laws, and how law and policy interplay.')
Discipline.create!(name:'Computer Sciences',image_file_name:'computerscience.jpg',description:'Many prospective students have a limited understanding of what is computer science. While proficiency in computer programming is an essential skill, computer science students deal with the fundamental nature of computation, what can and cannot be computed, and how efficiently a computation can be accomplished by a machine. They study how to build computer systems (computer architecture), how to make machines think (artificial intelligence), how to build computers that can see (computer vision), how to design software that works seamlessly from different locations (computer networks and distributed systems), how to model complex problems (modelling and simulation) and how to design more efficient computing algorithms (theory of computation).')
Discipline.create!(name:'Social Sciences',image_file_name:'sscience.jpg',description:'Social science is a major category of academic disciplines, concerned with society and the relationships among individuals within a society. It in turn has many branches, each of which is considered a "social science". The main social sciences include economics, political science, human geography, demography, and sociology. In a wider sense, social science also includes some fields in the humanities[1] such as anthropology, archaeology, jurisprudence, history, and linguistics. The term is also sometimes used to refer specifically to the field of sociology, the original science of society, established in the 19th century.')
Discipline.create!(name:'Humanities',image_file_name:'sscience.jpg',description:'Humanities encompass academic disciplines that study human condition and the essence of what it means to be human in a fast changing world. Humanities are similar to liberal arts in many ways and the two terms are sometimes interchangeable. Many degree courses offered by humanities departments can also be listed as social sciences, because they deal with the study of human behaviour and society.')
Discipline.create!(name:'Sciences',image_file_name:'sscience.jpg',description:'Natural sciences include disciplines that describe, predict, and understanding natural phenomena. These can be categorised into life sciences including ecology, anatomy, agriculture, or botany; and physical sciences including disciplines belonging to the fields of physics, earth sciences, astronomy, chemistry, and more.')

Subdiscipline.create!(name:'Environmental Engineering',discipline_id: 2,description:'This programme, at the Institute of Environmental Sciences and Engineering, aims to produce environmental engineers with a sound theoretical foundation and practical knowledge of science and engineering principles to improve the environment for human habitation and to remediate polluted sites. This degree programme addresses water and air pollution control, recycling, waste disposal, and public health issues. It also includes studies on the environmental impact of proposed construction projects through Environmental Impact Assessment (EIA).')
Subdiscipline.create!(name:'Geoinformatics Engineering',discipline_id: 2,description:'This programme, at the Institute of Environmental Sciences and Engineering, aims to produce environmental engineers with a sound theoretical foundation and practical knowledge of science and engineering principles to improve the environment for human habitation and to remediate polluted sites. This degree programme addresses water and air pollution control, recycling, waste disposal, and public health issues. It also includes studies on the environmental impact of proposed construction projects through Environmental Impact Assessment (EIA).')
Subdiscipline.create!(name:'Civil Engineering',discipline_id: 2,description:'This programme, at the Institute of Environmental Sciences and Engineering, aims to produce environmental engineers with a sound theoretical foundation and practical knowledge of science and engineering principles to improve the environment for human habitation and to remediate polluted sites. This degree programme addresses water and air pollution control, recycling, waste disposal, and public health issues. It also includes studies on the environmental impact of proposed construction projects through Environmental Impact Assessment (EIA).')
Subdiscipline.create!(name:'Mechanical Engineering',discipline_id: 2,description:'This programme, at the Institute of Environmental Sciences and Engineering, aims to produce environmental engineers with a sound theoretical foundation and practical knowledge of science and engineering principles to improve the environment for human habitation and to remediate polluted sites. This degree programme addresses water and air pollution control, recycling, waste disposal, and public health issues. It also includes studies on the environmental impact of proposed construction projects through Environmental Impact Assessment (EIA).')
Subdiscipline.create!(name:'Electrical Engineering',discipline_id: 2,description:'This programme, at the Institute of Environmental Sciences and Engineering, aims to produce environmental engineers with a sound theoretical foundation and practical knowledge of science and engineering principles to improve the environment for human habitation and to remediate polluted sites. This degree programme addresses water and air pollution control, recycling, waste disposal, and public health issues. It also includes studies on the environmental impact of proposed construction projects through Environmental Impact Assessment (EIA).')

Subdiscipline.create!(name:'Computer Sciences',discipline_id: 4,description:'A Computer Science degree is excellent preparation for the job market of the future and CS majors take up careers in every imaginable field. The Department was formed in 1994 and our graduates have enjoyed excellent job placements over the last fifteen years, both within Pakistan and internationally. Many have chosen to make their own successful companies. The acceptance of our graduates to top MS and PhD programmes abroad has also been excellent – just this year, students who have graduated can boast acceptances from Oxford, Cambridge, UIUC, Cornell, UT Dallas, Stony Brook and UC San Diego amongst others.')
Subdiscipline.create!(name:'LLB',discipline_id: 3,description:'The unique five-year joint BA-LL.B is designed for students seeking a challenging, rigorous, interdisciplinary exposure to law and related vital disciplines. Furthermore, while the focal point is the Pakistani legal system, the teaching methodology encompasses a critical, comparative approach in order to broaden perspectives and sharpen analytical skills of the students. Additionally, the ambit of studies is not just laws as they exist and operate, but also how policy impacts laws, and how law and policy interplay.')
Subdiscipline.create!(name:'Business Administration',discipline_id: 1,description:'Business administration deals with the performance or management of business operations in regards to making or implementing major decisions. The business administration discipline focuses on efficient methods on how to organize people and resources to drive activities towards set goals. Business administration combines knowledge and theories of finance/economics, human resource, marketing, information systems, accounting and law.')
Subdiscipline.create!(name:'Accounting and Finance',discipline_id: 1,description:'Accountaning is the process of communicating financial information about a business entity to relevant users or entities such as potential shareholders, creditors (including banks or vendors), financial analysts, economists, and government agencies. Accounting can be divided into two major fields: management accounting and financial accounting. Management accounting concentrates on reporting to people inside the business entity and provides information to employees, managers, owner-managers and auditors. The main goal is to provide the management with a basis for making major decisions related to management and operations.')
Subdiscipline.create!(name:'Management Sciences',discipline_id: 1,description:'The BSc degree in Management Science (MGS) is designed as a specialized management program that aims to graduate students who will use business analytic theories and methods to make significant contributions in solving managerial and technical problems. Students learn about business analytical theories and methods ─ including (big) data management, business intelligence, data mining, predictive modeling and other quantitative methods ─ to solve business problems. Students are trained with skills such as translating business problems into analytical problems, developing analytical models, managing big volumes of data, analyzing data for providing solutions across business functional areas, interpreting analytical solutions for managerial decision-making, and communicating analytical results to novice and advanced technical audiences in a business environment.')

Subdiscipline.create!(name:'Anthropology and Sociology',discipline_id: 5,description:'Anthropology captures the particularities of human beings and animals, such as the origins, biologic features, social and physical characteristics. This study of humankind aims to understand the existence of the human species throughout history.')
Subdiscipline.create!(name:'Economics',discipline_id: 5,description:'Economics is a science that was born in the Ancient Greece and developed into a complex study of financial entities. The objects of study are economic agents and their particular activity, as well as their evolution. Microeconomics, the field that studies the basic elements of the markets, including agents, while macroeconomics focuses on the entire economy and the factors that affect it. Microeconomics and macroeconomics are the two main sub-disciplines of economy.')
Subdiscipline.create!(name:'Political Sciences',discipline_id: 5,description:'Political Science is traditionally divided into 4 or 5 major sub-fields: Political Theory, Comparative Politics, International Relations, Public Policy (Policy Analysis or Government), and Political Sociology. The curriculum in Political Science offers an opportunity to specialise in each of these sub-fields.')
Subdiscipline.create!(name:'History',discipline_id: 6,description:'History is the science concerned with finding, gathering, structuring and passing on facts about events in the past. It aims at objectively establishing a cause-effect explanation of events in a chronological, complete and truthful manner. The study of history helps everyone understand why human society is the way it is today, why there are differences between societies and how people have evolved over time. A good understanding of the past leads to better decisions in the present and better planning for the future. Although history is regarded as a descriptive science of the past, it has great impact on the present.')
Subdiscipline.create!(name:'Psychology',discipline_id: 5,description:'Psychology is the science of mind and behaviour. The discipline examines the role of mental functions in individual and social behaviour, while also exploring the physiological and neurobiological processes that lead to certain behaviours. The immediate goal in psychology is to understand humanity by both discovering general principles and exploring specific cases. Many practitioners of applied psychology believe that one of the objectives of the field is to benefit society. Bachelors in Psychology investigate such concepts as perception, cognition, attention, emotion, phenomenology, motivation, brain functioning, personality, behaviour and interpersonal relationships.')
Subdiscipline.create!(name:'Sociology',discipline_id: 5,description:'Sociology is a study field which deals with human social behaviour. It can be also defined as the study of the origins, organization, institutions, and development of human society. Sociology is a part of social science and aims to acquire knowledge about human social factors by performing empirical and critical analysis through qualitative and quantitative techniques, interpretative, hermeneutic and philosophic approaches. The study field looks into the factors such as deviance, social stratification, social class, culture, social mobility, law and religion and develops scientific knowledge. Sociologists try to understand the issues that influence society. Sociology students discover answers to critical questions for our society like: how is culture created? Is social equality possible?')
Subdiscipline.create!(name:'Geography',discipline_id: 6,description:'Geography is divided into two inter-connected sub-disciplines: physical geography and human geography. Physical geography uses plenty of techniques and information from cartography, while human geography analyses topics related to human society such as agriculture, economy, population distribution, etc. The interaction between humans and the Earth is an object of study especially for students in a Master’s degree in geography.')
Subdiscipline.create!(name:'Languages & Literature',discipline_id: 5,description:'Language studies aim at preparing students to build a deep understanding of a culture based on its individual language and literature, using the spoken and written forms of expression. Gaining in-depth knowledge of a foreign language helps students understand and value cultural diversity, helps build connections between societies, and makes the world a smaller, more open place to live in.')
Subdiscipline.create!(name:'Philosophy',discipline_id: 5,description:"Philosophy and ethics aims to look into the human problems related to existence, knowledge and moral values that govern a person's behaviour. These problems are considered based on rational argumentation using systematic approaches. Philosophy strives to acquire knowledge by rational means about the issues that are difficult for empirical investigations. This study field has three main sub-fields: natural philosophy, moral philosophy and metaphysical philosophy.")
Subdiscipline.create!(name:'Physics',discipline_id: 7,description:'Physics focuses on research and it is one of the oldest academic disciplines that are taught throughout different stages of education. The field primarily focuses on classical, relativistic and quantum mechanics and the on the quantum field theory. Physics degrees focus on explaining the phenomena people observe and experience and, through its discoveries, it has strong influences on mathematics, philosophy, geology and engineering. Humanity owes some of the greatest discoveries of modern society to developments in the field of physics, leading to the creation of lasers, TV, radio, computers, DNA, or nuclear science.')
Subdiscipline.create!(name:'Chemistry',discipline_id: 7,description:'Chemistry is the science that covers composition, properties, structure and reactions of molecules, atoms and systems that include the two. Chemistry originated from the medieval art of alchemy, which sought to create gold through various transformations of materials. However, these experiments resulted in other scientific discoveries that created the basis for modern chemistry.')
Subdiscipline.create!(name:'Biology',discipline_id: 7,description:'Biology is a natural science, together with chemistry and physics, and it is taught in schools of all levels. This field explores all living and non-living forms of life, from microorganisms to plants, animals and humans. Biology sub-disciplines focus on species and groups of organisms and offer an in-depth study of their growth and evolution, origin, actions and distribution around the world.')
Subdiscipline.create!(name:'Mathematics',discipline_id: 7,description:'Mathematics studies numbers, structure and change and draws its origins from early philosophy. This ancient discipline is commonly used for calculations, counting and measurements. However, mathematics is a complex field which also involves theories, discovery of patterns, development of law, nicknamed of “The queen of sciences” .')

University.create!(name:'LUMS',description:'Lahore University of Management Sciences',city_id:1)
University.create!(name:'PIEAS',description:'Pakistan Institute of Engineering and Applied Sciences',city_id:4)
University.create!(name:'NUST',description:'National University of Sciences and Technology',city_id:4)

# DisciplineUniversity.create!(university_id:3,name:'Environmental Engineering',degree_type:'Undergraduate',discipline_id:2,subdiscipline_id:1)
# DisciplineUniversity.create!(university_id:3,name:'Geoinformatics Engineering',degree_type:'Undergraduate',discipline_id:2,subdiscipline_id:2)
# DisciplineUniversity.create!(university_id:3,name:'Civil Engineering',degree_type:'Undergraduate',discipline_id:2,subdiscipline_id:3)
# DisciplineUniversity.create!(university_id:3,name:'Mechanical Engineering',degree_type:'Undergraduate',discipline_id:2,subdiscipline_id:4)
# DisciplineUniversity.create!(university_id:3,name:'Business Administration',degree_type:'Undergraduate',discipline_id:1,subdiscipline_id:8)
# DisciplineUniversity.create!(university_id:3,name:'Computer Sciences',degree_type:'Undergraduate',discipline_id:4,subdiscipline_id:6)

# DisciplineUniversity.create!(university_id:2,name:'Environmental Engineering',degree_type:'Undergraduate',discipline_id:2,subdiscipline_id:1)
# DisciplineUniversity.create!(university_id:2,name:'Geoinformatics Engineering',degree_type:'Undergraduate',discipline_id:2,subdiscipline_id:2)
# DisciplineUniversity.create!(university_id:2,name:'Civil Engineering',degree_type:'Undergraduate',discipline_id:2,subdiscipline_id:3)
# DisciplineUniversity.create!(university_id:2,name:'Mechanical Engineering',degree_type:'Undergraduate',discipline_id:2,subdiscipline_id:4)

# DisciplineUniversity.create!(university_id:1,name:'Computer Sciences',degree_type:'Undergraduate',discipline_id:4,subdiscipline_id:6)
# DisciplineUniversity.create!(university_id:1,name:'LLB',degree_type:'Undergraduate',discipline_id:3,subdiscipline_id:7)
# DisciplineUniversity.create!(university_id:1,name:'Electrical Engineering',degree_type:'Undergraduate',discipline_id:2,subdiscipline_id:5)
# DisciplineUniversity.create!(university_id:1,name:'Accounting and Finance',degree_type:'Undergraduate',discipline_id:1,subdiscipline_id:9)
# DisciplineUniversity.create!(university_id:1,name:'Management Sciences',degree_type:'Undergraduate',discipline_id:1,subdiscipline_id:10)
# DisciplineUniversity.create!(university_id:1,name:'Anthropology and Sociology',degree_type:'Undergraduate',discipline_id:5,subdiscipline_id:11)
# DisciplineUniversity.create!(university_id:1,name:'Economics',degree_type:'Undergraduate',discipline_id:5,subdiscipline_id:12)
# DisciplineUniversity.create!(university_id:1,name:'Political Sciences',degree_type:'Undergraduate',discipline_id:5,subdiscipline_id:13)
# DisciplineUniversity.create!(university_id:1,name:'History',degree_type:'Undergraduate',discipline_id:5,subdiscipline_id:14)