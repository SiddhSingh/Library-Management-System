use library;

-- Sample Data

-- Librarian - Admin
truncate libuser;
insert into libuser values ('God', 'root', 'admin');

-- Books

call New_Book('One Piece', 'Eichiro Oda', '1.jpg', 1, 1, 'Comics/Manga', 1, 'Action,Adventure,Pirate,Comedy,Drama');
call New_Book('Dragon Ball-Z', 'Akira Toriyama', '3.jpg', 1, 1, 'Comics/Manga', 1, 'Action,Comedy,Dragons');
call New_Book('My Hero Academia', 'Horikoshi Kouhei', '4.jpg', 1, 1, 'Comics/Manga', 1, 'Action,Comedy,Superpowers,All for One,One for All');
call New_Book('Naruto', 'Masashi Kishimoto', '5.jpg', 1, 1, 'Comics/Manga', 1, 'Action,Adventure,Ninja,Comedy');
call New_Book('Detective Conan', 'Gosho Aoyama', '6.jpg', 1, 1, 'Comics/Manga', 1, 'Adventure,Detective,Comedy,Drama');
call New_Book('Black Jack', 'Osamu Tezuka', '7.jpg', 1, 1, 'Comics/Manga', 1, 'Action,Adventure,Comedy,Drama');
call New_Book('No Game No Life', 'Yu Kamiya', '8.jpg', 1, 1, 'Comics/Manga', 1, 'Action,Adventure,Game,Comedy,Chess');
call New_Book('Seven Deadly Sins', 'Tetsu Kariya, Akira Hanasaki', '9.jpg', 1, 1, 'Comics/Manga', 1, 'Action,Adventure,Super Powers,Comedy');
call New_Book('The Gamer', 'Sung Yuing', '10.jpg', 1, 1, 'Comics/Manga', 1, 'Action,Adventure,Comedy,Drama');
call New_Book('Bleach', 'Tite Kubo', '11.jpg', 1, 1, 'Comics/Manga', 1, 'Action,Adventure,Reaper,Shinigami,Comedy');
call New_Book('Sword Art Online', 'Reki Kawahara', '12.jpg', 1, 1, 'Comics/Manga', 1, 'Action,Adventure,Game');
call New_Book('Attack On Titan', 'Hajime Isayama', '13.jpg', 1, 1, 'Comics/Manga', 1, 'Action,Adventure,Titans,Corps,Military');
call New_Book('Fist Of North Star', 'Buronson, Tetsuo Hara', '14.jpg', 1, 1, 'Comics/Manga', 1, 'Action,Adventure,Drama');
call New_Book('Inazuma Eleven', 'Tenya Yabuno', '15.jpg', 1, 1, 'Comics/Manga', 1, 'Action,Comedy,Drama');

