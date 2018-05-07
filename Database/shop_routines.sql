-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `sales_report`
--

DROP TABLE IF EXISTS `sales_report`;
/*!50001 DROP VIEW IF EXISTS `sales_report`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sales_report` AS SELECT 
 1 AS `imei_no`,
 1 AS `phone_name`,
 1 AS `phone_storage`,
 1 AS `phone_color`,
 1 AS `phone_sellingdate`,
 1 AS `phone_soldBy`,
 1 AS `phone_plaform`,
 1 AS `phone_plaformName`,
 1 AS `phone_sellingprice`,
 1 AS `phone_buyingprice`,
 1 AS `accessory_total`,
 1 AS `phone_expense_total`,
 1 AS `sales_total`,
 1 AS `expense_incurred_total`,
 1 AS `sales_influx`,
 1 AS `phone_profitmargin`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `profit_report`
--

DROP TABLE IF EXISTS `profit_report`;
/*!50001 DROP VIEW IF EXISTS `profit_report`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `profit_report` AS SELECT 
 1 AS `year_sold`,
 1 AS `jan_sales`,
 1 AS `feb_sales`,
 1 AS `mar_sales`,
 1 AS `apr_sales`,
 1 AS `may_sales`,
 1 AS `jun_sales`,
 1 AS `jul_sales`,
 1 AS `aug_sales`,
 1 AS `sep_sales`,
 1 AS `oct_sales`,
 1 AS `nov_sales`,
 1 AS `dec_sales`,
 1 AS `year_totals`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `faulty_phones_view`
--

DROP TABLE IF EXISTS `faulty_phones_view`;
/*!50001 DROP VIEW IF EXISTS `faulty_phones_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `faulty_phones_view` AS SELECT 
 1 AS `client_no`,
 1 AS `imei_no`,
 1 AS `phone_name`,
 1 AS `phone_storage`,
 1 AS `phone_color`,
 1 AS `fault_datereported`,
 1 AS `fault_description`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `personal_profit_report`
--

DROP TABLE IF EXISTS `personal_profit_report`;
/*!50001 DROP VIEW IF EXISTS `personal_profit_report`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `personal_profit_report` AS SELECT 
 1 AS `year`,
 1 AS `jan_profits`,
 1 AS `feb_profits`,
 1 AS `mar_profits`,
 1 AS `apr_profits`,
 1 AS `may_profits`,
 1 AS `jun_profits`,
 1 AS `jul_profits`,
 1 AS `aug_profits`,
 1 AS `sep_profits`,
 1 AS `oct_profits`,
 1 AS `nov_profits`,
 1 AS `dec_profits`,
 1 AS `year_profits`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `sales_total_view`
--

DROP TABLE IF EXISTS `sales_total_view`;
/*!50001 DROP VIEW IF EXISTS `sales_total_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sales_total_view` AS SELECT 
 1 AS `imei_no`,
 1 AS `phone_name`,
 1 AS `phone_color`,
 1 AS `phone_storage`,
 1 AS `phone_sellingdate`,
 1 AS `phone_warrantydate`,
 1 AS `phone_soldBy`,
 1 AS `accessory_total`,
 1 AS `phone_expense_total`,
 1 AS `phone_sellingprice`,
 1 AS `sales_total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `sales_view`
--

DROP TABLE IF EXISTS `sales_view`;
/*!50001 DROP VIEW IF EXISTS `sales_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sales_view` AS SELECT 
 1 AS `imei_no`,
 1 AS `phone_name`,
 1 AS `phone_storage`,
 1 AS `phone_color`,
 1 AS `phone_sellingprice`,
 1 AS `phone_sellingdate`,
 1 AS `phone_warrantydate`,
 1 AS `phone_soldBy`,
 1 AS `phone_platform`,
 1 AS `phone_platformName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `profits_report`
--

DROP TABLE IF EXISTS `profits_report`;
/*!50001 DROP VIEW IF EXISTS `profits_report`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `profits_report` AS SELECT 
 1 AS `year_sold`,
 1 AS `jan_sales`,
 1 AS `feb_sales`,
 1 AS `mar_sales`,
 1 AS `apr_sales`,
 1 AS `may_sales`,
 1 AS `jun_sales`,
 1 AS `jul_sales`,
 1 AS `aug_sales`,
 1 AS `sep_sales`,
 1 AS `oct_sales`,
 1 AS `nov_sales`,
 1 AS `dec_sales`,
 1 AS `year_sales`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `personal_expenditure_report`
--

DROP TABLE IF EXISTS `personal_expenditure_report`;
/*!50001 DROP VIEW IF EXISTS `personal_expenditure_report`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `personal_expenditure_report` AS SELECT 
 1 AS `year_spent`,
 1 AS `jan`,
 1 AS `feb`,
 1 AS `mar`,
 1 AS `apr`,
 1 AS `may`,
 1 AS `jun`,
 1 AS `jul`,
 1 AS `aug`,
 1 AS `sep`,
 1 AS `oct`,
 1 AS `nov`,
 1 AS `dec`,
 1 AS `year_expenditures`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `sales_report`
--

/*!50001 DROP VIEW IF EXISTS `sales_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sales_report` AS select `sales_view`.`imei_no` AS `imei_no`,`inventory`.`phone_name` AS `phone_name`,`inventory`.`phone_storage` AS `phone_storage`,`inventory`.`phone_color` AS `phone_color`,`sales_view`.`phone_sellingdate` AS `phone_sellingdate`,`sales_view`.`phone_soldBy` AS `phone_soldBy`,`sales_view`.`phone_platform` AS `phone_plaform`,`sales_view`.`phone_platformName` AS `phone_plaformName`,`sales_view`.`phone_sellingprice` AS `phone_sellingprice`,`inventory`.`phone_buyingprice` AS `phone_buyingprice`,`sales_total_view`.`accessory_total` AS `accessory_total`,`sales_total_view`.`phone_expense_total` AS `phone_expense_total`,`sales_total_view`.`sales_total` AS `sales_total`,(select sum(`expense_incurred`.`expense_price`) from `expense_incurred` where (`sales_view`.`imei_no` = `expense_incurred`.`imei_no`)) AS `expense_incurred_total`,(`sales_total_view`.`sales_total` - (select sum(`expense_incurred`.`expense_price`) from `expense_incurred` where (`sales_view`.`imei_no` = `expense_incurred`.`imei_no`))) AS `sales_influx`,((`sales_view`.`phone_sellingprice` - `inventory`.`phone_buyingprice`) - `expense_incurred`.`expense_price`) AS `phone_profitmargin` from (((`inventory` join `sales_view` on((`sales_view`.`imei_no` = `inventory`.`imei_no`))) join `sales_total_view` on((`sales_total_view`.`imei_no` = `inventory`.`imei_no`))) join `expense_incurred` on((`sales_total_view`.`imei_no` = `expense_incurred`.`imei_no`))) group by `sales_view`.`imei_no` order by `sales_view`.`phone_sellingdate` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `profit_report`
--

/*!50001 DROP VIEW IF EXISTS `profit_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `profit_report` AS select (select distinct year(`sales_report`.`phone_sellingdate`) from `sales_report`) AS `year_sold`,ifnull((select sum(`sales_report`.`phone_profitmargin`) from `sales_report` where ((month(`sales_report`.`phone_sellingdate`) = 1) and year(`sales_report`.`phone_sellingdate`) in (select year(`sales_report`.`phone_sellingdate`) from `sales_report`))),0) AS `jan_sales`,(select sum(`sales_report`.`phone_profitmargin`) from `sales_report` where ((month(`sales_report`.`phone_sellingdate`) = 2) and year(`sales_report`.`phone_sellingdate`) in (select year(`sales_report`.`phone_sellingdate`) from `sales_report`))) AS `feb_sales`,(select sum(`sales_report`.`phone_profitmargin`) from `sales_report` where ((month(`sales_report`.`phone_sellingdate`) = 3) and year(`sales_report`.`phone_sellingdate`) in (select year(`sales_report`.`phone_sellingdate`) from `sales_report`))) AS `mar_sales`,(select sum(`sales_report`.`phone_profitmargin`) from `sales_report` where ((month(`sales_report`.`phone_sellingdate`) = 4) and year(`sales_report`.`phone_sellingdate`) in (select year(`sales_report`.`phone_sellingdate`) from `sales_report`))) AS `apr_sales`,(select sum(`sales_report`.`phone_profitmargin`) from `sales_report` where ((month(`sales_report`.`phone_sellingdate`) = 5) and year(`sales_report`.`phone_sellingdate`) in (select year(`sales_report`.`phone_sellingdate`) from `sales_report`))) AS `may_sales`,(select sum(`sales_report`.`phone_profitmargin`) from `sales_report` where ((month(`sales_report`.`phone_sellingdate`) = 6) and year(`sales_report`.`phone_sellingdate`) in (select year(`sales_report`.`phone_sellingdate`) from `sales_report`))) AS `jun_sales`,(select sum(`sales_report`.`phone_profitmargin`) from `sales_report` where ((month(`sales_report`.`phone_sellingdate`) = 7) and year(`sales_report`.`phone_sellingdate`) in (select year(`sales_report`.`phone_sellingdate`) from `sales_report`))) AS `jul_sales`,(select sum(`sales_report`.`phone_profitmargin`) from `sales_report` where ((month(`sales_report`.`phone_sellingdate`) = 8) and year(`sales_report`.`phone_sellingdate`) in (select year(`sales_report`.`phone_sellingdate`) from `sales_report`))) AS `aug_sales`,(select sum(`sales_report`.`phone_profitmargin`) from `sales_report` where ((month(`sales_report`.`phone_sellingdate`) = 9) and year(`sales_report`.`phone_sellingdate`) in (select year(`sales_report`.`phone_sellingdate`) from `sales_report`))) AS `sep_sales`,(select sum(`sales_report`.`phone_profitmargin`) from `sales_report` where ((month(`sales_report`.`phone_sellingdate`) = 10) and year(`sales_report`.`phone_sellingdate`) in (select year(`sales_report`.`phone_sellingdate`) from `sales_report`))) AS `oct_sales`,(select sum(`sales_report`.`phone_profitmargin`) from `sales_report` where ((month(`sales_report`.`phone_sellingdate`) = 11) and year(`sales_report`.`phone_sellingdate`) in (select year(`sales_report`.`phone_sellingdate`) from `sales_report`))) AS `nov_sales`,(select sum(`sales_report`.`phone_profitmargin`) from `sales_report` where ((month(`sales_report`.`phone_sellingdate`) = 12) and year(`sales_report`.`phone_sellingdate`) in (select year(`sales_report`.`phone_sellingdate`) from `sales_report`))) AS `dec_sales`,(select sum(`sales_report`.`phone_profitmargin`) from `sales_report` where year(`sales_report`.`phone_sellingdate`) in (select year(`sales_report`.`phone_sellingdate`) from `sales_report`)) AS `year_totals` from `sales_report` group by `year_sold` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `faulty_phones_view`
--

/*!50001 DROP VIEW IF EXISTS `faulty_phones_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `faulty_phones_view` AS select `faulty_phones`.`client_no` AS `client_no`,`faulty_phones`.`imei_no` AS `imei_no`,`inventory`.`phone_name` AS `phone_name`,`inventory`.`phone_storage` AS `phone_storage`,`inventory`.`phone_color` AS `phone_color`,`faulty_phones`.`fault_datereported` AS `fault_datereported`,`faulty_phones`.`fault_description` AS `fault_description` from (`faulty_phones` join `inventory` on((`inventory`.`imei_no` = `faulty_phones`.`imei_no`))) group by `faulty_phones`.`imei_no` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `personal_profit_report`
--

/*!50001 DROP VIEW IF EXISTS `personal_profit_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `personal_profit_report` AS select (select distinct year(`personal_expenditure`.`expenditure_date`) from `personal_expenditure`) AS `year`,(`profit_report`.`jan_sales` - `personal_expenditure_report`.`jan`) AS `jan_profits`,(`profit_report`.`feb_sales` - `personal_expenditure_report`.`feb`) AS `feb_profits`,(`profit_report`.`mar_sales` - `personal_expenditure_report`.`mar`) AS `mar_profits`,(`profit_report`.`apr_sales` - `personal_expenditure_report`.`apr`) AS `apr_profits`,(`profit_report`.`may_sales` - `personal_expenditure_report`.`may`) AS `may_profits`,(`profit_report`.`jun_sales` - `personal_expenditure_report`.`jun`) AS `jun_profits`,(`profit_report`.`jul_sales` - `personal_expenditure_report`.`jul`) AS `jul_profits`,(`profit_report`.`aug_sales` - `personal_expenditure_report`.`aug`) AS `aug_profits`,(`profit_report`.`sep_sales` - `personal_expenditure_report`.`sep`) AS `sep_profits`,(`profit_report`.`oct_sales` - `personal_expenditure_report`.`oct`) AS `oct_profits`,(`profit_report`.`nov_sales` - `personal_expenditure_report`.`nov`) AS `nov_profits`,(`profit_report`.`dec_sales` - `personal_expenditure_report`.`dec`) AS `dec_profits`,(`profit_report`.`year_totals` - `personal_expenditure_report`.`year_expenditures`) AS `year_profits` from (`profit_report` join `personal_expenditure_report` on((`profit_report`.`year_sold` = `personal_expenditure_report`.`year_spent`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sales_total_view`
--

/*!50001 DROP VIEW IF EXISTS `sales_total_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sales_total_view` AS select `sales_view`.`imei_no` AS `imei_no`,`sales_view`.`phone_name` AS `phone_name`,`sales_view`.`phone_color` AS `phone_color`,`sales_view`.`phone_storage` AS `phone_storage`,`sales_view`.`phone_sellingdate` AS `phone_sellingdate`,`sales_view`.`phone_warrantydate` AS `phone_warrantydate`,`sales_view`.`phone_soldBy` AS `phone_soldBy`,(select sum(`accessory`.`accessory_price`) from `accessory` where (`accessory`.`imei_no` = `sales_view`.`imei_no`)) AS `accessory_total`,(select sum(`phone_expense`.`phone_expense_price`) from `phone_expense` where (`phone_expense`.`imei_no` = `sales_view`.`imei_no`)) AS `phone_expense_total`,`sales_view`.`phone_sellingprice` AS `phone_sellingprice`,((`sales_view`.`phone_sellingprice` + (select sum(`accessory`.`accessory_price`) from `accessory` where (`accessory`.`imei_no` = `sales_view`.`imei_no`))) + (select sum(`phone_expense`.`phone_expense_price`) from `phone_expense` where (`phone_expense`.`imei_no` = `sales_view`.`imei_no`))) AS `sales_total` from ((`sales_view` join `accessory` on((`accessory`.`imei_no` = `sales_view`.`imei_no`))) join `phone_expense` on((`phone_expense`.`imei_no` = `sales_view`.`imei_no`))) group by `sales_view`.`imei_no` order by `sales_view`.`phone_sellingdate` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sales_view`
--

/*!50001 DROP VIEW IF EXISTS `sales_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sales_view` AS select `sales`.`imei_no` AS `imei_no`,`inventory`.`phone_name` AS `phone_name`,`inventory`.`phone_storage` AS `phone_storage`,`inventory`.`phone_color` AS `phone_color`,`sales`.`phone_sellingprice` AS `phone_sellingprice`,`sales`.`phone_sellingdate` AS `phone_sellingdate`,`sales`.`phone_warrantydate` AS `phone_warrantydate`,`sales`.`phone_soldBy` AS `phone_soldBy`,`sales`.`phone_platform` AS `phone_platform`,`sales`.`phone_platformName` AS `phone_platformName` from (`inventory` join `sales` on((`sales`.`imei_no` = `inventory`.`imei_no`))) order by `sales`.`phone_sellingdate` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `profits_report`
--

/*!50001 DROP VIEW IF EXISTS `profits_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `profits_report` AS select (select distinct year(`sales_report`.`phone_sellingdate`) from `sales_report`) AS `year_sold`,(select sum(`sales_report`.`phone_profitmargin`) from `sales_report` where ((month(`sales_report`.`phone_sellingdate`) = 1) and year(`sales_report`.`phone_sellingdate`) in (select year(`sales_report`.`phone_sellingdate`) from `sales_report`))) AS `jan_sales`,(select sum(`sales_report`.`phone_profitmargin`) from `sales_report` where ((month(`sales_report`.`phone_sellingdate`) = 2) and year(`sales_report`.`phone_sellingdate`) in (select year(`sales_report`.`phone_sellingdate`) from `sales_report`))) AS `feb_sales`,(select sum(`sales_report`.`phone_profitmargin`) from `sales_report` where ((month(`sales_report`.`phone_sellingdate`) = 3) and year(`sales_report`.`phone_sellingdate`) in (select year(`sales_report`.`phone_sellingdate`) from `sales_report`))) AS `mar_sales`,(select sum(`sales_report`.`phone_profitmargin`) from `sales_report` where ((month(`sales_report`.`phone_sellingdate`) = 4) and year(`sales_report`.`phone_sellingdate`) in (select year(`sales_report`.`phone_sellingdate`) from `sales_report`))) AS `apr_sales`,(select sum(`sales_report`.`phone_profitmargin`) from `sales_report` where ((month(`sales_report`.`phone_sellingdate`) = 5) and year(`sales_report`.`phone_sellingdate`) in (select year(`sales_report`.`phone_sellingdate`) from `sales_report`))) AS `may_sales`,(select sum(`sales_report`.`phone_profitmargin`) from `sales_report` where ((month(`sales_report`.`phone_sellingdate`) = 6) and year(`sales_report`.`phone_sellingdate`) in (select year(`sales_report`.`phone_sellingdate`) from `sales_report`))) AS `jun_sales`,(select sum(`sales_report`.`phone_profitmargin`) from `sales_report` where ((month(`sales_report`.`phone_sellingdate`) = 7) and year(`sales_report`.`phone_sellingdate`) in (select year(`sales_report`.`phone_sellingdate`) from `sales_report`))) AS `jul_sales`,(select sum(`sales_report`.`phone_profitmargin`) from `sales_report` where ((month(`sales_report`.`phone_sellingdate`) = 8) and year(`sales_report`.`phone_sellingdate`) in (select year(`sales_report`.`phone_sellingdate`) from `sales_report`))) AS `aug_sales`,(select sum(`sales_report`.`phone_profitmargin`) from `sales_report` where ((month(`sales_report`.`phone_sellingdate`) = 9) and year(`sales_report`.`phone_sellingdate`) in (select year(`sales_report`.`phone_sellingdate`) from `sales_report`))) AS `sep_sales`,(select sum(`sales_report`.`phone_profitmargin`) from `sales_report` where ((month(`sales_report`.`phone_sellingdate`) = 10) and year(`sales_report`.`phone_sellingdate`) in (select year(`sales_report`.`phone_sellingdate`) from `sales_report`))) AS `oct_sales`,(select sum(`sales_report`.`phone_profitmargin`) from `sales_report` where ((month(`sales_report`.`phone_sellingdate`) = 11) and year(`sales_report`.`phone_sellingdate`) in (select year(`sales_report`.`phone_sellingdate`) from `sales_report`))) AS `nov_sales`,(select sum(`sales_report`.`phone_profitmargin`) from `sales_report` where ((month(`sales_report`.`phone_sellingdate`) = 12) and year(`sales_report`.`phone_sellingdate`) in (select year(`sales_report`.`phone_sellingdate`) from `sales_report`))) AS `dec_sales`,(select sum(`sales_report`.`phone_profitmargin`) from `sales_report` where year(`sales_report`.`phone_sellingdate`) in (select year(`sales_report`.`phone_sellingdate`) from `sales_report`)) AS `year_sales` from `sales_report` group by `year_sold` order by `year_sold` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `personal_expenditure_report`
--

/*!50001 DROP VIEW IF EXISTS `personal_expenditure_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `personal_expenditure_report` AS select (select distinct year(`personal_expenditure`.`expenditure_date`) from `personal_expenditure`) AS `year_spent`,(select sum(`personal_expenditure`.`expenditure_price`) from `personal_expenditure` where ((month(`personal_expenditure`.`expenditure_date`) = 1) and year(`personal_expenditure`.`expenditure_date`) in (select year(`personal_expenditure`.`expenditure_date`) from `personal_expenditure`))) AS `jan`,(select sum(`personal_expenditure`.`expenditure_price`) from `personal_expenditure` where ((month(`personal_expenditure`.`expenditure_date`) = 2) and year(`personal_expenditure`.`expenditure_date`) in (select year(`personal_expenditure`.`expenditure_date`) from `personal_expenditure`))) AS `feb`,(select sum(`personal_expenditure`.`expenditure_price`) from `personal_expenditure` where ((month(`personal_expenditure`.`expenditure_date`) = 3) and year(`personal_expenditure`.`expenditure_date`) in (select year(`personal_expenditure`.`expenditure_date`) from `personal_expenditure`))) AS `mar`,ifnull((select sum(`personal_expenditure`.`expenditure_price`) from `personal_expenditure` where ((month(`personal_expenditure`.`expenditure_date`) = 4) and year(`personal_expenditure`.`expenditure_date`) in (select year(`personal_expenditure`.`expenditure_date`) from `personal_expenditure`))),0) AS `apr`,(select sum(`personal_expenditure`.`expenditure_price`) from `personal_expenditure` where ((month(`personal_expenditure`.`expenditure_date`) = 5) and year(`personal_expenditure`.`expenditure_date`) in (select year(`personal_expenditure`.`expenditure_date`) from `personal_expenditure`))) AS `may`,(select sum(`personal_expenditure`.`expenditure_price`) from `personal_expenditure` where ((month(`personal_expenditure`.`expenditure_date`) = 6) and year(`personal_expenditure`.`expenditure_date`) in (select year(`personal_expenditure`.`expenditure_date`) from `personal_expenditure`))) AS `jun`,(select sum(`personal_expenditure`.`expenditure_price`) from `personal_expenditure` where ((month(`personal_expenditure`.`expenditure_date`) = 7) and year(`personal_expenditure`.`expenditure_date`) in (select year(`personal_expenditure`.`expenditure_date`) from `personal_expenditure`))) AS `jul`,(select sum(`personal_expenditure`.`expenditure_price`) from `personal_expenditure` where ((month(`personal_expenditure`.`expenditure_date`) = 8) and year(`personal_expenditure`.`expenditure_date`) in (select year(`personal_expenditure`.`expenditure_date`) from `personal_expenditure`))) AS `aug`,(select sum(`personal_expenditure`.`expenditure_price`) from `personal_expenditure` where ((month(`personal_expenditure`.`expenditure_date`) = 9) and year(`personal_expenditure`.`expenditure_date`) in (select year(`personal_expenditure`.`expenditure_date`) from `personal_expenditure`))) AS `sep`,(select sum(`personal_expenditure`.`expenditure_price`) from `personal_expenditure` where ((month(`personal_expenditure`.`expenditure_date`) = 10) and year(`personal_expenditure`.`expenditure_date`) in (select year(`personal_expenditure`.`expenditure_date`) from `personal_expenditure`))) AS `oct`,(select sum(`personal_expenditure`.`expenditure_price`) from `personal_expenditure` where ((month(`personal_expenditure`.`expenditure_date`) = 11) and year(`personal_expenditure`.`expenditure_date`) in (select year(`personal_expenditure`.`expenditure_date`) from `personal_expenditure`))) AS `nov`,(select sum(`personal_expenditure`.`expenditure_price`) from `personal_expenditure` where ((month(`personal_expenditure`.`expenditure_date`) = 12) and year(`personal_expenditure`.`expenditure_date`) in (select year(`personal_expenditure`.`expenditure_date`) from `personal_expenditure`))) AS `dec`,(select sum(`personal_expenditure`.`expenditure_price`) from `personal_expenditure` where year(`personal_expenditure`.`expenditure_date`) in (select year(`personal_expenditure`.`expenditure_date`) from `personal_expenditure`)) AS `year_expenditures` from `personal_expenditure` group by `year_spent` order by `year_spent` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-07 14:31:03
