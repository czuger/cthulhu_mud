class Investigator < ActiveRecord::Base

  belongs_to :profession
  belongs_to :location, class_name: 'Place'

  SURNAME = %w( Smith Jones Williams Taylor Brown Davies Evans Wilson Thomas Johnson Roberts Robinson Thompson Wright Walker White Edwards Hughes Green Hall Lewis Harris Clarke Patel Jackson Wood Turner Martin Cooper Hill Ward Morris Moore Clark Lee King Baker Harrison Morgan Allen James Scott Phillips Watson Davis Parker Price Bennett Young Griffiths Mitchell Kelly Cook Carter Richardson Bailey Collins Bell Shaw Murphy Miller Cox Richards Khan Marshall Anderson Simpson Ellis Adams Singh Begum Wilkinson Foster Chapman Powell Webb Rogers Gray Mason Ali Hunt Hussain Campbell Matthews Owen Palmer Holmes Mills Barnes Knight Lloyd Butler Russell Barker Fisher Stevens Jenkins Murray Dixon Harvey Graham Pearson Ahmed Fletcher Walsh Kaur Gibson Howard Andrews Stewart Elliott Reynolds Saunders Payne Fox Ford Pearce Day Brooks West Lawrence Cole Atkinson Bradley Spencer Gill Dawson Ball Burton O'brien Watts Rose Booth Perry Ryan Grant Wells Armstrong Francis Rees Hayes Hart Hudson Newman Barrett Webster Hunter Gregory Carr Lowe Page Marsh Riley Dunn Woods Parsons Berry Stone Reid Holland Hawkins Harding Porter Robertson Newton Oliver Reed Kennedy Williamson Bird Gardner Shah Dean Lane Cooke Bates Henderson Parry Burgess Bishop Walton Burns Nicholson Shepherd Ross Cross Long Freeman Warren Nicholls Hamilton Byrne Sutton Mcdonald Yates Hodgson Robson Curtis Hopkins O'connor Harper Coleman Watkins Moss Mccarthy Chambers O'neill Griffin Sharp Hardy Wheeler Potter Osborne Johnston Gordon Doyle Wallace George Jordan Hutchinson Rowe Burke May Pritchard Gilbert Willis Higgins Read Miles Stevenson Stephenson Hammond Arnold Buckley Walters Hewitt Barber Nelson Slater Austin Sullivan Whitehead Mann Frost Lambert Stephens Blake Akhtar Lynch Goodwin Barton Woodward Thomson Cunningham Quinn Barnett Baxter Bibi Clayton Nash Greenwood Jennings Holt Kemp Poole Gallagher Bond Stokes Tucker Davidson Fowler Heath Norman Middleton Lawson Banks French Stanley Jarvis Gibbs Ferguson Hayward Carroll Douglas Dickinson Todd Barlow Peters Lucas Knowles Hartley Miah Simmons Morton Alexander Field Morrison Norris Townsend Preston Hancock Thornton Baldwin Burrows Briggs Parkinson Reeves Macdonald Lamb Black Abbott Sanders Thorpe Holden Tomlinson Perkins Ashton Rhodes Fuller Howe Bryant Vaughan Dale Davey Weston Bartlett Whittaker Davison Kent Skinner Birch Morley Daniels Glover Howell Cartwright Pugh Humphreys Goddard Brennan Wall Kirby Bowen Savage Bull Wong Dobson Smart Wilkins Kirk Fraser Duffy Hicks Patterson Bradshaw Little Archer Warner Waters O'sullivan Farrell Brookes Atkins Kay Dodd Bentley Flynn John Schofield Short Haynes Wade Butcher Henry Sanderson Crawford Sheppard Bolton Coates Giles Gould Houghton Gibbons Pratt Manning Law Hooper Noble Dyer Rahman Clements Moran Sykes Chan Doherty Connolly Joyce Franklin Hobbs Coles Herbert Steele Kerr Leach Winter Owens Duncan Naylor Fleming Horton Finch Fitzgerald Randall Carpenter Marsden Browne Garner Pickering Hale Dennis Vincent Chadwick Chandler Sharpe Nolan Lyons Hurst Collier Peacock Howarth Faulkner Rice Pollard Welch Norton Gough Sinclair Blackburn Bryan Conway Power Cameron Daly Allan Hanson Gardiner Boyle Myers Turnbull Wallis Mahmood Sims Swift Iqbal Pope Brady Chamberlain Rowley Tyler Farmer Metcalfe Hilton Godfrey Holloway Parkin Bray Talbot Donnelly Nixon Charlton Benson Whitehouse Barry Hope Lord North Storey Connor Potts Bevan Hargreaves Mclean Mistry Bruce Howells Hyde Parkes Wyatt Fry Lees O'donnell Craig Forster Mckenzie Humphries Mellor Carey Ingram Summers Leonard )
  BOY_NAME = %w( Aaron Aron Abel Abner Abraham Adam Adrian Alan Allan Allen Albert Alexander Alfred Algernon Alister Allister Alistair Alastair Alaster Alonso Alonzo Alphonso Alfonso Alvin Alwin Alwyn Ambrose Amos Andrew Angus Anselm Ansel Anthony Antony Anton Archibald Arnold Arthur Augustus August Augustine Augustin Austin Avery Baldwin Barrett Bartholomew Basil Benedict Benjamin Bennet Bennett Bernard Barnard Bert Bertram Bertrand Blake Bradford Bradley Brady Brandon Branden Brenton Bret Brett Brian Bryan Bryant Broderick Bruce Bruno Burton Byron Caleb Calvin Cameron Carey Cary Carry Carl Karl Carol Carrol Carroll Casey Kasey Caspar Casper Cassius Cecil Cedric Charles Chester Christian Christopher Kristopher Clarence Clare Clair Clark Claude Claud Clayton Clement Clifford Clinton Clive Clyde Cody Colin Collin Conrad Corey Cory Cornelius Craig Curtis Cyril Cyrus Dale Daniel Darrell Darrel Darryl Daryl David Dean Deane Dennis Denis Derek Derrick Desmond Dexter Dominic Dominick Domenic Domenick Don Donald Donovan Dorian Douglas Douglass Doyle Drew Duane Dwayne Dudley Duke Duncan Dustin Dwight Dylan Dillon Earl Earle Edgar Edward Edwin Elbert Elijah Elias Elliot Elliott Ellis Elmer Elton Alton Elvin Elwin Elwyn Elvis Elwood Emery Emmery Emory Emil Emile Emmanuel Emanuel Immanuel Manuel Eric Erik Erick Ernest Earnest Ervin Erwin Irvin Irvine Irving Irwin Ethan Eugene Eustace Evan Everard Everett Fabian Felix Ferdinand Fergus Ferguson Floyd Ford Francis Franklin Franklyn Frederick Frederic Fredrick Fredric Fred Freddie Gabriel Garrett Garret Geoffrey Jeffrey George Gerald Gerard Gilbert Glenn Glen Graham Grant Gregory Gregor Griffith Griffin Harold Harris Harrison Harvey Henry Herbert Herman Horace Horatio Howard Hubert Hugh Humphrey Humphry Ian Ignatius Immanuel Irvin Irvine Irving Irwin Isaac Isaak Isidore Isidor Isadore Isador Ivor Jack Jacob James Jason Jasper Jefferson Jeffrey Jeffery Geoffrey Jeremy Jeremiah Jerome Jesse John Jonathan Joseph Joshua Julian Julius Justin Karl Carl Keith Kelly Kelley Kelvin Kendall Kendrick Kenneth Kent Kevin Kristopher Kristofer Kurt Curt Kyle Lambert Lamont Lancelot Launcelot Laurence Lawrence Lorence Lorenzo Lee Leigh Leo Leon Leonard Leopold Leroy Leeroy Leslie Lesley Lester Lewis Lincoln Lindon Lyndon Lindsay Lindsey Linus Lionel Llewellyn Lloyd Loyd Loyde Floyd Logan Lonnie Lonny Louis Lowell Lucian Lucius Luke Lucas Luther Lyle Lyall Lynn Malcolm Manuel Marion Mark Marc Marcus Marshall Marshal Martin Marvin Mervin Matthew Matthias Maurice Morris Maximilian Maxwell Maynard Melvin Merlin Merrill Merril Merill Michael Miles Myles Milton Mitchell Monroe Munroe Montague Montgomery Morgan Mortimer Morton Moses Murray Murry Nathan Nathaniel Neal Neil Nelson Nevill Nevil Nevile Neville Newton Nicholas Nicolas Nigel Noah Noel Nowell Norbert Norris Norman Norton Oliver Orson Orville Oscar Oswald Oswold Owen Patrick Paul Percival Perceval Perry Peter Philip Phillip Quentin Quintin Quenton Quinton Quincy Ralph Randall Randal Randolph Raphael Rafael Raymond Raymund Reginald Rene Reuben Ruben Rubin Reynold Richard Kendrick Robert Roderic Roderick Rodney Roger Rodger Roland Rowland Rolph Rolf Rolfe Roman Ronald Ron Ronnie Ronny Roscoe Ross Roy Rudolph Rudolf Russell Russel Ryan Samson Sampson Samuel Sanford Saul Scott Sean Shaun Shawn Shane Sebastian Seth Seymour Shannon Shanon Sheldon Shelley Shelly Shellie Sidney Sydney Silas Silvester Sylvester Simeon Simon Solomon Stacy Stacey Stanley Stephen Steven Stephan Steffan Stefan Stuart Stewart Terence Terrence Terrance Thaddeus Thadeus Theodore Theodor Timothy Thomas Tobias Todd Tracy Tracey Travis Tristram Tristam Tristan Troy Tyler Ulysses Uriah Urias Valentine Valentin Valerian Valerius Vernon Victor Vincent Virgil Vergil Wallace Wallis Walter Warren Wayne Wesley Wilbur Wilber Wiley Wilfred Wilfrid Willard William Willis Wilson Winfred Winston Woodrow Xavier Zachary Zachariah Zacharias )
  GIRL_NAME = %w( Abigail Ada Adelaide Adele Adelle Adela Adeline Adelina Adaline Adrienne Adriana Agatha Agnes Aileen Eileen Alene Alberta Alexandra Alexandria Alexis Alfreda Alice Alicia Alyce Alisa Alissa Alyssa Alison Allison Alyson Allyson Althea Amabel Amanda Amber Amelia Amy Aimee Amie Anastasia Andrea Angela Angelica Angelina Angeline Angel Anita Anna Ann Anne Annabel Annabelle Anabel Annette Annetta Antoinette Antonia April Arabella Arabel Arabelle Arlene Arline Arleen Arlyne Ashley Audrey Augusta Augustina Aurora Barbara Beatrice Beatrix Belinda Belle Bell Bel Bella Berenice Bernice Bertha Berta Betty Beverly Beverley Blanche Blanch Bonnie Bonny Brenda Brett Bret Bretta Bridget Bridgette Brigid Brigit Brittany Brittney Britney Camille Camilla Camile Camila Candace Candice Caren Carin Caryn Carla Carlotta Carlota Carmen Carol Carole Carrol Carroll Karol Caroline Carolyn Carolina Carlyne Carline Karoline Cassandra Catherine Cathryn Catheryn Catharine Cathleen Cecilia Cecillia Cecelia Cecile Cecily Cicely Celeste Celestine Celestina Celia Celine Celina Charity Charlotte Cheryl Christine Christina Christiana Clara Claire Clare Clair Clarice Clarissa Claudia Clemency Clementine Clementina Colleen Coleen Constance Cora Cordelia Corinne Corinna Corynne Corrine Corine Corina Cornelia Courtney Crystal Chrystal Cynthia Daisy Daysie Danielle Daniela Daphne Darlene Darleen Darlyne Deborah Delia Dell Della Denise Denice Denyse Diana Diane Dianne Dinah Dina Dolores Delores Dominique Dominica Donna Dora Doreen Dorene Doris Dorris Dorothy Dorothea Edith Edyth Edythe Edna Elaine Alaine Helaine Eleanor Elinor Eleonora Eleonore Elenore Elisa Eliza Elisia Elissa Elise Elyse Elsa Elizabeth Elisabeth Ella Ellen Eloise Heloise Elsie Elvira Emily Emilia Emma Erica Erika Ericka Erin Ernestine Earnestine Estelle Estella Esther Ester Hester Ethel Etta Eugenia Eugenie Eulalia Eunice Euphemia Euphemie Eustacia Eve Eva Eveline Evelyn Evelynne Eveleen Evelina Evangeline Evangelina Faith Felicia Felicity Felice Florence Frances Francesca Francisca Francine Frederica Frederika Fredericka Gabrielle Gabriela Gabriella Genevieve Georgina Georgine Geraldine Gertrude Gillian Jillian Gina Gladys Glenda Gloria Grace Gwendolen Gwendolyn Hannah Hanna Harriet Hazel Heather Helen Helena Elena Ellen Henrietta Hester Hillary Hilary Hilda Hylda Holly Hope Ida Imogen Imogene Irene Iris Irma Erma Isabel Isabelle Isabella Jacqueline Jacquelyn Jane Janet Janette Janetta Janice Janis Jenice Jean Jeanne Jeannette Jeannetta Jeanette Jemima Jennifer Jenny Jessica Jill Joanna Joanne Joann Johanna Joan Joceline Jocelyn Josephine Joyce Judith Julia Julianne Juliana Juliet Juliette June Justina Justine Karen Karin Karyn Katherine Katharine Kathryn Kathrine Kathrynne Katrina Kathleen Kathlene Kathlyn Kathlynne Kelly Kellie Kelli Kelley Kimberly Kimberley Kristina Kristin Kristine Kristen Laura Laureen Laurene Laurena Laurine Lauren Laurel Laverne Laverna Lavinia Leah Lea Lee Leigh Leila Leilah Lela Lena Leona Leonora Leonore Lenora Lenore Leslie Lesley Leticia Letitia Lillian Lilian Lily Lilly Lili Lilli Linda Lynda Lindsay Lindsey Lisa Lois Lona Lora Lorena Lorene Loreen Lorine Lorna Loretta Lorette Lorinda Laurinda Lorraine Lorrain Loraine Lottie Lotty Lotta Louise Louisa Lucille Lucile Lucinda Lucy Lucie Luci Lucia Lydia Lynn Lynne Marilyn Linda Arlene Evelyn Mabel Mabelle Mable Madeline Madeleine Madelyn Magdaline Magdalen Magdalena Marcia Margaret Margarita Marguerite Margret Marianne Marianna Maryann Maryanne Marian Marilyn Marilynn Marylin Marlene Marlyn Maribel Maribelle Marietta Mariett Mariette Marina Marion Marjorie Marjory Margery Martha Marta Mary Maria Marie Mary Matilda Mathilda Maud Maude Maureen Maurene Maxine Megan Melanie Melinda Melissa Mercedes Meredith Michelle Michele Mildred Millicent Milicent Melicent Minnie Minna Mina Miranda Miriam Myriam Molly Mollie Mona Monica Morgan Muriel Myra Mira Nadine Natalie Nathalie Natalia Natasha Nancy Nell Nelle Nettie Netty Netta Nicki Nicole Nina Noel Noelle Nora Noreen Norene Norma Octavia Olive Olivia Ophelia Pamela Pansy Patricia Paula Paulina Pauline Pearl Peggy Penelope Phoebe Phebe Phyllis Polly Priscilla Prudence Rachel Raquel Rebecca Regina Renata Renee Rhoda Rhonda Roberta Rose Rosa Rosabel Rosabelle Rosabella Rosalie Rosalee Rosaline Rosalyn Rosalind Rosalinda Roseanna Rosanna Rosanne Rosemary Rosemarie Rowena Roxanne Roxanna Roxana Ruby Rubina Ruth Sabrina Samantha Sarah Sara Selina Selena Selene Celine Celina Celena Selma Shannon Shanon Sharon Sharron Sharen Sharyn Shauna Shawna Sheena Sheila Shelley Shelly Shellie Shirley Shirlee Shirlie Sibyl Sybil Sibylle Syble Sidney Sydney Sonia Sonya Sophia Stacy Stacey Stacie Staci Stephanie Stephany Stephania Stephana Stefanie Stefania Stefana Steffanie Stella Susan Susanna Susannah Susanne Suzanne Sylvia Silvia Tabitha Tamara Tamar Tanya Tania Teresa Theresa Therese Theodora Thelma Tiffany Tina Tracy Tracey Tracie Traci Ulrica Ulrika Una Ursula Valentina Valerie Valery Valeria Vanessa Vera Verna Veronica Victoria Vida Viola Violet Violette Violetta Virginia Vivian Vivien Wanda Wendy Wilhelmina Winifred Yolanda Yolande Yvonne Yvette Zoe )

  def self.generate_name( gender )
    if gender == :m || gender == 'm'
      BOY_NAME.sample + ' ' + SURNAME.sample
    else
      GIRL_NAME.sample + ' ' + SURNAME.sample
    end
  end

end

