/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.1.37-MariaDB : Database - javaquiz
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`javaquiz` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `javaquiz`;

/*Table structure for table `answer` */

DROP TABLE IF EXISTS `answer`;

CREATE TABLE `answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `question_id` bigint(20) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `valid` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=latin1;

/*Data for the table `answer` */

insert  into `answer`(`id`,`question_id`,`answer`,`valid`) values 
(1,1,'Equal',0),
(2,1,'Not Equal',1),
(3,1,'The code will not compile',0),
(4,1,'The code will compile but will throw run time error',0),
(5,2,'10 25',0),
(6,2,'35',0),
(7,2,'67',1),
(8,2,'The code will not compile',0),
(9,3,'13',0),
(10,3,'23',1),
(11,3,'22',0),
(12,3,'12',0),
(13,4,'Compilation error',0),
(14,4,'Runtime error',0),
(15,4,'8',1),
(16,4,'10',0),
(17,5,'Parent Hello',0),
(18,5,'Child Hello',0),
(19,5,'Compilation error',1),
(20,5,'None of the above',0),
(21,6,'Parent Hello',0),
(22,6,'Child Hello',0),
(23,6,'Compilation error',1),
(24,6,'Run time error',0),
(25,7,'false',0),
(26,7,'Compilation error',1),
(27,7,'NullPointerException',0),
(28,7,'true',0),
(29,8,'5',1),
(30,8,'0',0),
(31,8,'Compilation error',0),
(32,8,'ArithmeticException',0),
(33,9,'1',1),
(34,9,'3',0),
(35,9,'2',0),
(36,9,'4',0),
(37,10,'10',0),
(38,10,'0',1),
(39,10,'Compilation error',0),
(40,10,'None of the above',0),
(41,11,'-2',0),
(42,11,'-1',1),
(43,11,'1',0),
(44,11,'0',0),
(45,12,'10 12',0),
(46,12,'12 12',1),
(47,12,'12 10',0),
(48,12,'Compilation error',0),
(49,13,'On',0),
(50,13,'Off',0),
(51,13,'Compilation error',1),
(52,13,'Runtime error',0),
(53,14,'Compilation error',0),
(54,14,'Pleasant',1),
(55,14,'Hot Boiling',0),
(56,14,'Hot',0),
(57,15,'Greater than 50',0),
(58,15,'Less than 50',0),
(59,15,'Compilation error',0),
(60,15,'None of the above',1),
(61,16,'Greater than 50 Great',0),
(62,16,'Compilation error',1),
(63,16,'Great',0),
(64,16,'Less than 50',0),
(65,17,'Compilation error',0),
(66,17,'1',1),
(67,17,'Default 1 0',0),
(68,17,'Default 1',0),
(69,18,'Compilation error',0),
(70,18,'On',1),
(71,18,'Off',0),
(72,18,'Run time error',0),
(73,19,'Compilation error',0),
(74,19,'Program will print \"Off\"',0),
(75,19,'Program will print \"On\"',0),
(76,19,'None of the above',1),
(77,20,'9',0),
(78,20,'10',0),
(79,20,'11',0),
(80,20,'Compilation error',1),
(81,21,'100, 90, 80, 70, 60, 50, 40, 20, 10, 0,',0),
(82,21,'100, 90, 80, 70, 60, 50, 40, 20, 10,',0),
(83,21,'90, 80, 70, 60, 50, 40, 20, 10, 0,',0),
(84,21,'None of the above',1),
(85,22,'Code will print all even numbers between 0 to 10',0),
(86,22,'Code will print all odd numbers between 0 to 10',1),
(87,22,'Code will not compile',0),
(88,22,'None of the above',0),
(89,23,'1',0),
(90,23,'2',0),
(91,23,'Compilation error',0),
(92,23,'Runtime error',1),
(93,24,'Parent',1),
(94,24,'Child',0),
(95,24,'Compilation error',0),
(96,24,'Runtime error',0),
(97,25,'int constructor',0),
(98,25,'long constructor',1),
(99,25,'No output',0),
(100,25,'Compilation error',0),
(101,26,'Hi,',0),
(102,26,'Hi,Hello Two,',0),
(103,26,'Hello Two, Hi,',0),
(104,26,'None of the above',1),
(105,27,'No output',0),
(106,27,'Hello',0),
(107,27,'Compilation error',1),
(108,27,'Runtime error',0),
(109,28,'ParentChild',0),
(110,28,'ChildParent',0),
(111,28,'Child',0),
(112,28,'None of the above',1),
(113,29,'1',0),
(114,29,'0',0),
(115,29,'Compilation error',1),
(116,29,'Runtime error',0),
(117,30,' Hello',0),
(118,30,'Compilation error',2),
(119,30,'Runtime error',0),
(120,30,'None of the above',0),
(121,31,'Hi',0),
(122,31,'Compilation error',2),
(123,31,'No output',0),
(124,31,'Runtime error',0);

/*Table structure for table `questions` */

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `topic` varchar(255) DEFAULT NULL,
  `difficult` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `contents` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

/*Data for the table `questions` */

insert  into `questions`(`id`,`topic`,`difficult`,`title`,`question`,`contents`) values 
(1,'Java Language Basics',1,'Java Language Basics Quiz – 1','1. What will happen when you compile and run the following code?','public class Test{\r\n	\r\n	public static void main(String[] args){\r\n		\r\n		double d1 = Double.NaN;		\r\n		double d2 = d1;\r\n		\r\n		if(d1 == d2)\r\n			System.out.println(\"Equal\");\r\n		else\r\n			System.out.println(\"Not Equal\");\r\n	}\r\n	\r\n}'),
(2,'Java Language Basics',1,'Java Language Basics Quiz – 1','2. What will happen when you compile and run the following code?','public class Test{	\r\n	\r\n	public static void main(String[] args){\r\n		int i = 10;\r\n		int j = 25;\r\n		System.out.println(i + \' \' + j);\r\n	}\r\n}\r\n}'),
(3,'Java Language Basics',1,'Java Language Basics Quiz – 1','3. What will happen when you compile and run the following code?','public class Test {\r\n	\r\n	public static void main(String[] args){		\r\n		\r\n		int i = 10;\r\n		int j = 12;\r\n		i+=++j;\r\n		System.out.println(i);\r\n\r\n	}\r\n}'),
(4,'Java Language Basics',1,'Java Language Basics Quiz – 1','4. What will happen when you compile and run the following code?','public class Test {\r\n	\r\n	public static void main(String[] args){\r\n		int i = 010;\r\n		System.out.println(i);\r\n	}\r\n}'),
(5,'Java Language Basics',2,'Java Language Basics Quiz Online Test – 2','1. What will happen when you compile and run the following code?','public class Test{\r\n	\r\n	public static void main(String[] args){		\r\n		One o = new Two();\r\n		o.sayHello();\r\n	}\r\n	\r\n}\r\n\r\nfinal class One{\r\n	public void sayHello(){\r\n		System.out.println(\"Parent Hello\");\r\n	}\r\n}\r\n\r\nclass Two extends One{\r\n	public void sayHello(){\r\n		System.out.println(\"Child Hello\");\r\n	}	\r\n}'),
(6,'Java Language Basics',2,'Java Language Basics Quiz Online Test – 2','2. What will happen when you compile and run the following code?','public class Test{\r\n	\r\n	public static void main(String[] args){		\r\n		One o = new Two();\r\n		o.sayHello();\r\n	}\r\n	\r\n}\r\n\r\nclass One{\r\n	public final void sayHello(){\r\n		System.out.println(\"Parent Hello\");\r\n	}\r\n}\r\n\r\nclass Two extends One{\r\n	public void sayHello(){\r\n		System.out.println(\"Child Hello\");\r\n	}	\r\n}'),
(7,'Java Language Basics',2,'Java Language Basics Quiz Online Test – 2','3. What will happen when you compile and run the following code?','public class Test{\r\n	\r\n	public static void main(String[] args){				\r\n		boolean b1 = false, b2 = null;\r\n		System.out.println( b1 && b2);\r\n	}	\r\n}'),
(8,'Java Language Basics',2,'Java Language Basics Quiz Online Test – 2','4. What will happen when you compile and run the following code?','public class Test{\r\n	\r\n	public static void main(String[] args){			\r\n		int i = 5, j = null;\r\n		System.out.println( i % j );		\r\n	}	\r\n}'),
(9,'Java Language Basics',3,'Java Operators Quiz Online Test – 1','1. What will happen when you compile and run the following code?','public class Test{\r\n	\r\n	public static void main(String[] args) {\r\n		int i = 0;\r\n		int j = i++ + ++i;\r\n		System.out.println( j );\r\n	}\r\n}'),
(10,'Java Language Basics',3,'Java Operators Quiz Online Test – 1','2. What will happen when you compile and run the following code?','public class Test{\r\n	\r\n	public static void main(String[] args) {\r\n		int i = 100;\r\n		int j = 10;\r\n		System.out.println( i%j );\r\n	}\r\n}'),
(11,'Java Language Basics',3,'Java Operators Quiz Online Test – 1','3. What will happen when you compile and run the following code?','public class Test{\r\n	\r\n	public static void main(String[] args) {\r\n		int i = 10, j = 12, k = 1;\r\n		k += i++ - --j;\r\n		System.out.println(k);\r\n	}\r\n}'),
(12,'Java Language Basics',3,'Java Operators Quiz Online Test – 1','4. What will happen when you compile and run the following code?','public class Test{\r\n	\r\n	public static void main(String[] args) {\r\n		byte b1 = 2;\r\n		b1 = b1 + 10;\r\n		\r\n		byte b2 = 2;\r\n		b2 += 10;\r\n		\r\n		System.out.println(b1 + \" \" + b2);\r\n	}\r\n}'),
(13,'Flow Control & Exception',1,'Java If Else Quiz Online Test','1. What will happen when you compile and run the following code?','public class Test {\r\n    \r\n    public static void main(String[] args){        \r\n        \r\n        String state = \"on\";\r\n        \r\n        if(state = \"on\")\r\n            System.out.println(\"On\");\r\n        else\r\n            System.out.println(\"Off\");\r\n        \r\n    }\r\n}'),
(14,'Flow Control & Exception',1,'Java If Else Quiz Online Test','2. What will happen when you compile and run the following code?','public class Test {\r\n	\r\n	public static void main(String[] args){		\r\n		\r\n		int temperature = 33;\r\n	\r\n		if(temperature < 0)\r\n			System.out.println(\"Freezing\");\r\n		else if(temperature < 30)\r\n			System.out.println(\"Pleasant\");\r\n		else if(temperature < 50)\r\n			System.out.println(\"Hot\");\r\n		else\r\n			System.out.println(\"Boiling\");\r\n	\r\n	}\r\n}'),
(15,'Flow Control & Exception',1,'Java If Else Quiz Online Test','3. What will happen when you compile and run the following code?','public class Test {\r\n	\r\n	public static void main(String[] args){		\r\n		\r\n		int i = 51;\r\n		\r\n		if(i > 50)\r\n			System.out.println(\"Greater than 50\");\r\n		else\r\n			System.out.println(\"Less than 50\");\r\n			System.out.println(\"Done\");\r\n		\r\n	}\r\n}'),
(16,'Flow Control & Exception',1,'Java If Else Quiz Online Test','4. What will happen when you compile and run the following code?','public class Test {\r\n	\r\n	public static void main(String[] args){		\r\n		\r\n		int i = 49;\r\n\r\n		if(i > 50)\r\n			System.out.println(\"Greater than 50\");\r\n			System.out.println(\"Great\");\r\n		else\r\n			System.out.println(\"Less than 50\");\r\n	\r\n	}\r\n}'),
(17,'Flow Control & Exception',2,'Java Switch Quiz Online Test','1. What will happen when you compile and run the following code?','public class Test {\r\n	\r\n	public static void main(String[] args){		\r\n		\r\n		int i = 49;\r\n\r\n		if(i > 50)\r\n			System.out.println(\"Greater than 50\");\r\n			System.out.println(\"Great\");\r\n		else\r\n			System.out.println(\"Less than 50\");\r\n	\r\n	}\r\n}'),
(18,'Flow Control & Exception',2,'Java Switch Quiz Online Test','2. What will happen when you compile and run the following code?','public class Test{	\r\n	\r\n	private static final int ON = 1;\r\n	private static final int OFF = 0;\r\n	\r\n	public static void main(String[] args){\r\n		\r\n		int state = 1;\r\n		switch(state){\r\n		\r\n			case ON:\r\n				System.out.println(\"On\");\r\n				break;\r\n\r\n			default: \r\n				System.out.println(\"Unknown\");\r\n			\r\n			case OFF:\r\n				System.out.println(\"Off\");\r\n				\r\n			}\r\n	}\r\n	\r\n}'),
(19,'Flow Control & Exception',2,'Java Switch Quiz Online Test','3. What will happen when you compile and run the following code?','public class Test{	\r\n	\r\n	public static void main(String[] args){\r\n\r\n		final int ON = 1;\r\n		final int OFF = 0;\r\n		\r\n		int state = 3;\r\n		\r\n		switch(state){		\r\n			case ON:\r\n				System.out.print(\"On\");\r\n				break;\r\n\r\n			default: \r\n				System.out.print(\"Unknown\");\r\n			\r\n			case OFF:\r\n				System.out.print(\"Off\");\r\n		}\r\n	}	\r\n}'),
(20,'Flow Control & Exception',3,'For Loop Quiz','1. What will happen when you compile and run the following code?','public class Test{	\r\n	\r\n	public static void main(String[] args){\r\n\r\n		for(int i = 0 ; i < 10; i++){			\r\n		}		\r\n		System.out.println(i);\r\n	\r\n	}\r\n	\r\n}'),
(21,'Flow Control & Exception',3,'For Loop Quiz','2. What will happen when you compile and run the following code?','public class Test{	\r\n	\r\n	public static void main(String[] args){\r\n		int i = 0;\r\n		for(i = 100; i < = 0; i -= 10 ){\r\n			System.out.print(i + \", \");\r\n		}	\r\n	}	\r\n}'),
(22,'Flow Control & Exception',3,'For Loop Quiz','3. What will happen when you compile and run the following code?','public class Test{	\r\n	\r\n	public static void main(String[] args){\r\n		for(int i = 0; i < 10; i++){\r\n			if(i % 2 == 0)\r\n				continue;\r\n			System.out.println(i);\r\n		}\r\n	}	\r\n}'),
(23,'Object Oriented Programming',1,'Java Object Oriented Programming Quiz 1','1. What will happen when you compile and run the following code?','class One{\r\n	int i = 1;\r\n	public int getInt(){\r\n		return i;\r\n	}\r\n}\r\n\r\nclass Two extends One{\r\n	int i = 2;\r\n	public int getInt(){\r\n		return i;\r\n	}	\r\n}\r\npublic class Test{\r\n	public static void main(String[] args) {\r\n		One one = new One();\r\n		Two two = (Two)one;\r\n		System.out.println( two.getInt() );\r\n	}\r\n}'),
(24,'Object Oriented Programming',1,'Java Object Oriented Programming Quiz 1','2. What will happen when you compile and run the following code?','class One{	\r\n	public static void print(int i){\r\n		System.out.println(\"Parent\");\r\n	}\r\n}\r\n\r\nclass Two extends One{\r\n	public static void print(byte b){\r\n		System.out.println(\"Child\");\r\n	}\r\n}\r\n\r\npublic class Test{\r\n	\r\n	public static void main(String args[]){\r\n		One one = new Two();\r\n		one.print(10);\r\n	}	\r\n}'),
(25,'Object Oriented Programming',1,'Java Object Oriented Programming Quiz 1','3. What will happen when you compile and run the following code?','class One{\r\n	\r\n	public One(int x){\r\n		System.out.print(\"int constructor\");\r\n	}\r\n\r\n	public One(long l){\r\n		System.out.print(\"long constructor\");\r\n	}\r\n}\r\n\r\npublic class Test{\r\n	\r\n	public static void main(String[] args){\r\n		long l = 20l;\r\n		One one = new One(l);		\r\n	}		\r\n}'),
(26,'Object Oriented Programming',2,'Java Object Oriented Programming Quiz 5','1. What will happen when you compile and run the following code?','class One{\r\n	public One(String name){\r\n		System.out.print(\"Hello \" + name + \",\");\r\n	}\r\n}\r\n\r\nclass Two extends One{\r\n	public Two(){\r\n		this(\"Two\");\r\n		System.out.print(\"Hi,\");\r\n	}\r\n}\r\n\r\npublic class Test{\r\n	public static void main(String[] args) {\r\n		Two two = new Two();\r\n	}\r\n}'),
(27,'Object Oriented Programming',2,'Java Object Oriented Programming Quiz 5','2. What will happen when you compile and run the following code?','class One{\r\n	public One(String name){\r\n		System.out.print(\"Hello\");\r\n	}\r\n}\r\n\r\nclass Two extends One{\r\n}\r\n\r\npublic class Test{\r\n	public static void main(String[] args) {\r\n		Two two = new Two();\r\n	}\r\n}'),
(28,'Object Oriented Programming',2,'Java Object Oriented Programming Quiz 5','3. What will happen when you compile and run the following code?','class One{\r\n	private One(){\r\n		System.out.print(\"Parent\");\r\n	}\r\n}\r\n\r\nclass Two extends One{\r\n	public Two(){\r\n		System.out.print(\"Child\");\r\n	}\r\n}\r\n\r\npublic class Test{\r\n	public static void main(String[] args) {\r\n		Two two = new Two();\r\n	}\r\n}'),
(29,'Object Oriented Programming',3,'Java Object Oriented Programming Quiz 6','1. What will happen when you compile and run the following code?','class One{\r\n	private void count(int i){\r\n		System.out.println(0);\r\n	}\r\n}\r\npublic class Test extends One{	\r\n	\r\n	public void count(int j){\r\n		System.out.println(1);\r\n	}\r\n	\r\n	public static void main(String[] args) {\r\n		One one = new Test();\r\n		one.count(0);\r\n	}\r\n}'),
(30,'Object Oriented Programming',3,'Java Object Oriented Programming Quiz 6','2. What will happen when you compile and run the following code?','public class Test{\r\n	\r\n	public static void main(String[] args){		\r\n		One o = new One();\r\n		o.sayHello();\r\n	}	\r\n}\r\n\r\nfinal abstract class One{\r\n	public final void sayHello(){\r\n		System.out.println(\"Hello\");\r\n	}\r\n	\r\n	public abstract void sayHi();\r\n}'),
(31,'Object Oriented Programming',3,'Java Object Oriented Programming Quiz 6','3. What will happen when you compile and run the following code?','public class Test{\r\n	\r\n	class TestInner{\r\n		void sayHi(){\r\n			System.out.println(\"Hi\");\r\n		}\r\n	}\r\n	\r\n	public static void main(String[] args) {\r\n		TestInner inner = new TestInner();\r\n		inner.sayHi();\r\n	}\r\n}');

/*Table structure for table `userinfo` */

DROP TABLE IF EXISTS `userinfo`;

CREATE TABLE `userinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `userinfo` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
