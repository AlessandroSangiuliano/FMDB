/*
   Project: FMTest

   Author: alex,,,

   Created: 2015-02-25 08:33:42 +0100 by alex
*/

#import <Foundation/Foundation.h>
#import <FMDBKit/FMDatabase.h>
#import <FMDBKit/FMResultSet.h>

int
main(int argc, const char *argv[])
{
  FMDatabase *database = [FMDatabase databaseWithPath:@"/home/alex/pova.db"];
  
  //Test for open
  
  if ([database open])
  {
    NSLog(@"Ciao sono aperto");
  }
  
  //Test query
  
  BOOL sc = [database executeUpdate:@"CREATE TABLE tablename (id INTEGER  PRIMARY KEY DEFAULT NULL,field1Name INTEGER DEFAULT NULL,field2Name INTEGER DEFAULT NULL,field3Name INTEGER DEFAULT NULL,field4Name TEXT DEFAULT NULL)"];
  
  if (sc)
  {
    NSLog(@"Succesfull");
  }

  //Test insert
  
  sc = NO;
  sc = [database executeUpdate:@"INSERT INTO tablename (id) VALUES (1)"];
  
  if (sc)
  {
    NSLog(@"INSERT Success");
  }
  
  //Test select
  
  sc = NO;
  
  FMResultSet *rs = [database executeQuery:@"SELECT id FROM tablename"];
  
  if ([rs next])
  {
    NSLog(@"SELECT success");
    int meh = [rs intForColumn:@"id"];
    NSLog(@"id number: %d", meh);
  }

  //Test delete
  
  sc = [database executeUpdate:@"DELETE FROM tablename WHERE id=1"];
  
  if (sc)
  {
    NSLog(@"DELETE Success");
    rs = [database executeQuery:@"SELECT id FROM tablename"];
    if ([rs next])
  {
    NSLog(@"SELECT success");
    int meh = [rs intForColumn:@"id"];
    NSLog(@"id number: %d", meh);
  }
  else
    NSLog(@"No rows");
  }

  //Test DROP
  
  sc = NO;
  sc = [database executeUpdate:@"DROP TABLE tablename"];
  //[database executeQuery:@"SELECT id FROM tablename"]; I'd aspect error from a select on non existing table...
  
  if (sc)
    NSLog(@"DROPPED");

  return 0;
}

