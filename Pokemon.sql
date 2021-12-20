create table Pokemon
(
 Id int identity Primary key,
 [Name] nvarchar(100),
 Height nvarchar(100),
 [Weight] nvarchar(100)

)

create table Type
(
Id int identity Primary key,
[Name] nvarchar(100) unique
)

create table PokemonType
(
Id int identity Primary key,
PokemonId int Foreign key references Pokemon (Id),
TypeId int Foreign key references Type(Id)
)

insert Pokemon ([Name],[weight],[height]) values ('Bulbasaur','70','7')
insert Pokemon ([Name],[weight],[height]) values ('Ditto','40','3')

insert Type ([Name]) values ('Normal')
insert Type ([Name]) values ('Grass')

insert PokemonType (PokemonId,TypeId) values ((select Id from Pokemon where [Name]='Bulbasaur'),
(select Id from Type where [Name]='Grass'))

insert PokemonType (PokemonId,TypeId) values ((select Id from Pokemon where [Name]='Ditto'),
(select Id from Type where [Name]='Normal'))

select Pokemon.*,Type.Id, Type.Name, PokemonType.Id from Pokemon inner join PokemonType on Pokemon.Id=PokemonType.PokemonId
													inner join Type on PokemonType.TypeId=Type.Id




