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
Discipline.create!(name:'Business',image_file_name:'business.jpg',description:'The BSc degree in Management Science (MGS) is designed as a specialized management program that aims to graduate students who will use business analytic theories and methods to make significant contributions in solving managerial and technical problems. Students learn about business analytical theories and methods ─ including (big) data management, business intelligence, data mining, predictive modeling and other quantitative methods ─ to solve business problems. Students are trained with skills such as translating business problems into analytical problems, developing analytical models, managing big volumes of data, analyzing data for providing solutions across business functional areas, interpreting analytical solutions for managerial decision-making, and communicating analytical results to novice and advanced technical audiences in a business environment.')
Discipline.create!(name:'Engineering',image_file_name:'engineering.jpg',description:'Engineering and technology is based on the application of existing technology within a field of engineering through the use of basic engineering principles and technical skills. As such, bachelor and master programmes in engineering and technology focus primarily on the applied aspects of science to equip graduates with practical technical skills in product improvement, manufacturing, construction or engineering operational functions.Universities provide a wide offer of Masters of Science (M.Sc.) in engineering and technology that keeps on growing and resulting in extensive specialisations and technological development. Studying engineering equips students with practical skills to acquire and apply scientific, mathematical, economic, social and practical ')
Discipline.create!(name:'Law',image_file_name:'law.jpg',description:'The unique five-year joint BA-LL.B is designed for students seeking a challenging, rigorous, interdisciplinary exposure to law and related vital disciplines. Furthermore, while the focal point is the Pakistani legal system, the teaching methodology encompasses a critical, comparative approach in order to broaden perspectives and sharpen analytical skills of the students. Additionally, the ambit of studies is not just laws as they exist and operate, but also how policy impacts laws, and how law and policy interplay.')
Discipline.create!(name:'Computer Sciences',image_file_name:'computerscience.jpg',description:'Many prospective students have a limited understanding of what is computer science. While proficiency in computer programming is an essential skill, computer science students deal with the fundamental nature of computation, what can and cannot be computed, and how efficiently a computation can be accomplished by a machine. They study how to build computer systems (computer architecture), how to make machines think (artificial intelligence), how to build computers that can see (computer vision), how to design software that works seamlessly from different locations (computer networks and distributed systems), how to model complex problems (modelling and simulation) and how to design more efficient computing algorithms (theory of computation).')
Discipline.create!(name:'Social Sciences',image_file_name:'sscience.jpg',description:'Social science is a major category of academic disciplines, concerned with society and the relationships among individuals within a society. It in turn has many branches, each of which is considered a "social science". The main social sciences include economics, political science, human geography, demography, and sociology. In a wider sense, social science also includes some fields in the humanities[1] such as anthropology, archaeology, jurisprudence, history, and linguistics. The term is also sometimes used to refer specifically to the field of sociology, the original science of society, established in the 19th century.')

Subdiscipline.create!(name:'Environmental Engineering',discipline_id: 2,description:'This programme, at the Institute of Environmental Sciences and Engineering, aims to produce environmental engineers with a sound theoretical foundation and practical knowledge of science and engineering principles to improve the environment for human habitation and to remediate polluted sites. This degree programme addresses water and air pollution control, recycling, waste disposal, and public health issues. It also includes studies on the environmental impact of proposed construction projects through Environmental Impact Assessment (EIA).')
Subdiscipline.create!(name:'Geoinformatics Engineering',discipline_id: 2,description:'This programme, at the Institute of Environmental Sciences and Engineering, aims to produce environmental engineers with a sound theoretical foundation and practical knowledge of science and engineering principles to improve the environment for human habitation and to remediate polluted sites. This degree programme addresses water and air pollution control, recycling, waste disposal, and public health issues. It also includes studies on the environmental impact of proposed construction projects through Environmental Impact Assessment (EIA).')
Subdiscipline.create!(name:'Civil Engineering',discipline_id: 2,description:'This programme, at the Institute of Environmental Sciences and Engineering, aims to produce environmental engineers with a sound theoretical foundation and practical knowledge of science and engineering principles to improve the environment for human habitation and to remediate polluted sites. This degree programme addresses water and air pollution control, recycling, waste disposal, and public health issues. It also includes studies on the environmental impact of proposed construction projects through Environmental Impact Assessment (EIA).')
Subdiscipline.create!(name:'Mechanical Engineering',discipline_id: 2,description:'This programme, at the Institute of Environmental Sciences and Engineering, aims to produce environmental engineers with a sound theoretical foundation and practical knowledge of science and engineering principles to improve the environment for human habitation and to remediate polluted sites. This degree programme addresses water and air pollution control, recycling, waste disposal, and public health issues. It also includes studies on the environmental impact of proposed construction projects through Environmental Impact Assessment (EIA).')
Subdiscipline.create!(name:'Electrical Engineering',discipline_id: 2,description:'This programme, at the Institute of Environmental Sciences and Engineering, aims to produce environmental engineers with a sound theoretical foundation and practical knowledge of science and engineering principles to improve the environment for human habitation and to remediate polluted sites. This degree programme addresses water and air pollution control, recycling, waste disposal, and public health issues. It also includes studies on the environmental impact of proposed construction projects through Environmental Impact Assessment (EIA).')

Subdiscipline.create!(name:'Computer Sciences',discipline_id: 4,description:'A Computer Science degree is excellent preparation for the job market of the future and CS majors take up careers in every imaginable field. The Department was formed in 1994 and our graduates have enjoyed excellent job placements over the last fifteen years, both within Pakistan and internationally. Many have chosen to make their own successful companies. The acceptance of our graduates to top MS and PhD programmes abroad has also been excellent – just this year, students who have graduated can boast acceptances from Oxford, Cambridge, UIUC, Cornell, UT Dallas, Stony Brook and UC San Diego amongst others.')
Subdiscipline.create!(name:'LLB',discipline_id: 3,description:'The unique five-year joint BA-LL.B is designed for students seeking a challenging, rigorous, interdisciplinary exposure to law and related vital disciplines. Furthermore, while the focal point is the Pakistani legal system, the teaching methodology encompasses a critical, comparative approach in order to broaden perspectives and sharpen analytical skills of the students. Additionally, the ambit of studies is not just laws as they exist and operate, but also how policy impacts laws, and how law and policy interplay.')
Subdiscipline.create!(name:'Business Administration',discipline_id: 1,description:'The programme of Bachelors in Business Administration offered at NBS is a well-rounded and seasoned business management program that aims to inculcate key business concepts in the students. The course aims to explore vital business theories, ever-changing industry dynamics and theoretical concepts applicable both in local and multinational companies in light of the real-time global business events. Under this programme, students can specialize in International Business & Marketing or Finance and Investments.')
Subdiscipline.create!(name:'Accounting and Finance',discipline_id: 1,description:'The BS in Accounting and Finance degree is a four year degree program offered at NBS to prepare students for a challenging and rewarding career in either the public or the private financial sector. Accounting and Finance are essential functions of all major organizations today. This program will provide a sound foundation to be successful in the rapidly evolving, global business and financial environment.')
Subdiscipline.create!(name:'Management Sciences',discipline_id: 1,description:'The BSc degree in Management Science (MGS) is designed as a specialized management program that aims to graduate students who will use business analytic theories and methods to make significant contributions in solving managerial and technical problems. Students learn about business analytical theories and methods ─ including (big) data management, business intelligence, data mining, predictive modeling and other quantitative methods ─ to solve business problems. Students are trained with skills such as translating business problems into analytical problems, developing analytical models, managing big volumes of data, analyzing data for providing solutions across business functional areas, interpreting analytical solutions for managerial decision-making, and communicating analytical results to novice and advanced technical audiences in a business environment.')

Subdiscipline.create!(name:'Anthropology and Sociology',discipline_id: 5,description:'The Anthropology and Sociology major ensures that students get a strong disciplinary foundation with a grounding in theory and methods, along with a choice of courses that will allow them to pursue more specialised interests during the course of the programme.')
Subdiscipline.create!(name:'Economics',discipline_id: 5,description:'The Department of Economics seeks to contribute to questions at the frontier of economic knowledge by drawing on the regional laboratory of economic and social life in South Asia and by collaborating with academics based at global centres of excellence in economic research.')
Subdiscipline.create!(name:'Political Sciences',discipline_id: 5,description:'Political Science is traditionally divided into 4 or 5 major sub-fields: Political Theory, Comparative Politics, International Relations, Public Policy (Policy Analysis or Government), and Political Sociology. The curriculum in Political Science offers an opportunity to specialise in each of these sub-fields.')
Subdiscipline.create!(name:'History',discipline_id: 5,description:'A BA in History equips a student with analytical tools. Besides a broad-based knowledge of the past, a student of History shall have read seminal historical texts, be knowledgeable about important scholarly contributions in her/his area of specialisation, have developed the skill to read carefully, be able to argue - both orally and in writing - with power and conviction. A student of History would also be cognizant that the discipline requires patience, rigour, and extreme attention to detail before any substantive claim to knowledge can be made. Finally, appreciation of History inculcates a life-long love for learning that contributes to our individual and collective selves in ways that are impossible to quantify.')

University.create!(name:'LUMS',description:'Lahore University of Management Sciences',city_id:1)
University.create!(name:'PIEAS',description:'Pakistan Institute of Engineering and Applied Sciences',city_id:4)
University.create!(name:'NUST',description:'National University of Sciences and Technology',city_id:4)

Degreeprogram.create!(name:'Environmental Engineering',degree_type:'Undergraduate',discipline_id:2,subdiscipline_id:1)
Degreeprogram.create!(name:'Geoinformatics Engineering',degree_type:'Undergraduate',discipline_id:2,subdiscipline_id:2)
Degreeprogram.create!(name:'Civil Engineering',degree_type:'Undergraduate',discipline_id:2,subdiscipline_id:3)
Degreeprogram.create!(name:'Mechanical Engineering',degree_type:'Undergraduate',discipline_id:2,subdiscipline_id:4)
Degreeprogram.create!(name:'Electrical Engineering',degree_type:'Undergraduate',discipline_id:2,subdiscipline_id:5)
Degreeprogram.create!(name:'Computer Sciences',degree_type:'Undergraduate',discipline_id:4,subdiscipline_id:6)
Degreeprogram.create!(name:'LLB',degree_type:'Undergraduate',discipline_id:3,subdiscipline_id:7)
Degreeprogram.create!(name:'Business Administration',degree_type:'Undergraduate',discipline_id:1,subdiscipline_id:8)
Degreeprogram.create!(name:'Accounting and Finance',degree_type:'Undergraduate',discipline_id:1,subdiscipline_id:9)
Degreeprogram.create!(name:'Management Sciences',degree_type:'Undergraduate',discipline_id:1,subdiscipline_id:10)
Degreeprogram.create!(name:'Anthropology and Sociology',degree_type:'Undergraduate',discipline_id:5,subdiscipline_id:11)
Degreeprogram.create!(name:'Economics',degree_type:'Undergraduate',discipline_id:5,subdiscipline_id:12)
Degreeprogram.create!(name:'Political Sciences',degree_type:'Undergraduate',discipline_id:5,subdiscipline_id:13)
Degreeprogram.create!(name:'History',degree_type:'Undergraduate',discipline_id:5,subdiscipline_id:14)

DisciplineUniversity.create!(university_id:3,degreeprogram_id:1)
DisciplineUniversity.create!(university_id:3,degreeprogram_id:2)
DisciplineUniversity.create!(university_id:3,degreeprogram_id:3)
DisciplineUniversity.create!(university_id:3,degreeprogram_id:4)
DisciplineUniversity.create!(university_id:3,degreeprogram_id:8)
DisciplineUniversity.create!(university_id:3,degreeprogram_id:6)

DisciplineUniversity.create!(university_id:2,degreeprogram_id:1)
DisciplineUniversity.create!(university_id:2,degreeprogram_id:2)
DisciplineUniversity.create!(university_id:2,degreeprogram_id:3)
DisciplineUniversity.create!(university_id:2,degreeprogram_id:4)

DisciplineUniversity.create!(university_id:1,degreeprogram_id:6)
DisciplineUniversity.create!(university_id:1,degreeprogram_id:7)
DisciplineUniversity.create!(university_id:1,degreeprogram_id:5)
DisciplineUniversity.create!(university_id:1,degreeprogram_id:9)
DisciplineUniversity.create!(university_id:1,degreeprogram_id:10)
DisciplineUniversity.create!(university_id:1,degreeprogram_id:11)
DisciplineUniversity.create!(university_id:1,degreeprogram_id:12)
DisciplineUniversity.create!(university_id:1,degreeprogram_id:13)
DisciplineUniversity.create!(university_id:1,degreeprogram_id:14)