-- ========================================
-- COMPLETE CAR SERVICE CENTER DATABASE
-- Integrated Version with Enhanced Features
-- ========================================

-- Database: `car_service_center_db`

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- --------------------------------------------------------
-- CORE SYSTEM TABLES (EXISTING + ENHANCED)
-- --------------------------------------------------------

-- Table structure for table `categories`
CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `categories`
INSERT INTO `categories` (`id`, `category`, `description`, `status`, `date_created`) VALUES
(1, 'Hatchback', 'Compact cars with rear door that opens upwards', 1, '2022-09-26 11:05:25'),
(2, 'Minivan', 'Multi-purpose vehicles for families', 1, '2022-09-26 11:05:35'),
(3, 'Sports car', 'High-performance vehicles designed for speed', 1, '2022-09-26 11:05:49'),
(4, 'Compact car', 'Small, fuel-efficient vehicles', 1, '2022-09-26 11:06:08'),
(5, 'Luxury car', 'Premium vehicles with advanced features', 1, '2022-09-26 11:06:41'),
(6, 'SUV', 'Sport Utility Vehicles', 1, '2024-06-11 10:00:00'),
(7, 'Sedan', 'Four-door passenger cars', 1, '2024-06-11 10:00:00'),
(8, 'Motorcycle', 'Two-wheeled motor vehicles', 1, '2024-06-11 10:00:00');

-- --------------------------------------------------------

-- Table structure for table `mechanics_list` (ENHANCED)
CREATE TABLE `mechanics_list` (
  `id` int(30) NOT NULL,
  `employee_id` varchar(50) UNIQUE DEFAULT NULL,
  `name` text NOT NULL,
  `contact` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` text DEFAULT NULL,
  `specialization` varchar(200) DEFAULT NULL,
  `experience_years` int(2) DEFAULT NULL,
  `hourly_rate` decimal(8,2) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `mechanics_list`
INSERT INTO `mechanics_list` (`id`, `employee_id`, `name`, `contact`, `email`, `address`, `specialization`, `experience_years`, `hourly_rate`, `hire_date`, `status`, `date_created`) VALUES
(1, 'EMP001', 'Prajwal', '9080911425', 'prajwal123@gmail.com', 'Bangalore, Karnataka', 'Engine Specialist', 5, 250.00, '2020-01-15', 1, '2022-09-26 11:19:55'),
(2, 'EMP002', 'Omkar', '9080945321', 'omkar432@gmail.com', 'Mysore, Karnataka', 'Transmission Expert', 7, 300.00, '2019-03-20', 1, '2022-09-26 11:20:25'),
(3, 'EMP003', 'Suresh Kumar', '9080912345', 'suresh.kumar@gmail.com', 'Hubli, Karnataka', 'Electrical Systems', 4, 220.00, '2021-06-10', 1, '2024-06-11 10:00:00'),
(4, 'EMP004', 'Rajesh Patil', '9080987654', 'rajesh.patil@gmail.com', 'Belgaum, Karnataka', 'Brake Specialist', 6, 275.00, '2020-08-25', 1, '2024-06-11 10:00:00');

-- --------------------------------------------------------

-- Table structure for table `service_list` (EXISTING)
CREATE TABLE `service_list` (
  `id` int(30) NOT NULL,
  `service` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `service_list`
INSERT INTO `service_list` (`id`, `service`, `description`, `status`, `date_created`) VALUES
(1, 'Change Oil', 'An Oil Change is the act of removing the used oil in your engine and replacing it with new, clean oil. Over time, oil breaks down and gets dirty.', 1, '2022-09-26 11:07:59'),
(2, 'Engine Tune Up', 'Comprehensive engine maintenance including spark plugs, filters, and fluid checks to ensure optimal performance.', 1, '2022-09-26 11:08:41'),
(3, 'Overall Checkup', 'Complete vehicle inspection including belts, hoses, exhaust system, and safety components.', 1, '2022-09-26 11:09:27'),
(4, 'Tire Replacement', 'Professional tire installation with proper balancing and alignment checks.', 1, '2022-09-26 11:10:08'),
(5, 'Wash', 'Eco-friendly car washing service with interior and exterior cleaning.', 1, '2022-09-26 11:11:56'),
(6, 'Brake Service', 'Complete brake system inspection, pad replacement, and fluid change.', 1, '2024-06-11 10:00:00'),
(7, 'AC Service', 'Air conditioning system cleaning, gas refilling, and component check.', 1, '2024-06-11 10:00:00'),
(8, 'Battery Service', 'Battery testing, cleaning terminals, and replacement if needed.', 1, '2024-06-11 10:00:00');

-- --------------------------------------------------------
-- NEW ENHANCED TABLES
-- --------------------------------------------------------

-- Table structure for table `customers`
CREATE TABLE `customers` (
  `id` int(30) NOT NULL,
  `customer_code` varchar(50) UNIQUE DEFAULT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(150) UNIQUE NOT NULL,
  `phone` varchar(20) NOT NULL,
  `alternate_phone` varchar(20) DEFAULT NULL,
  `address` text NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `customer_type` enum('Individual','Corporate') DEFAULT 'Individual',
  `company_name` varchar(200) DEFAULT NULL,
  `gst_number` varchar(50) DEFAULT NULL,
  `loyalty_points` int(10) DEFAULT 0,
  `preferred_contact_method` enum('Phone','Email','SMS') DEFAULT 'Phone',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `customers`
INSERT INTO `customers` (`id`, `customer_code`, `first_name`, `last_name`, `email`, `phone`, `address`, `city`, `state`, `postal_code`, `customer_type`, `status`, `created_at`) VALUES
(1, 'CUST001', 'Ajinkya', 'Kaje', 'Ajinkya34@gmail.com', '9080999321', 'JP Nagar, Bangalore', 'Bangalore', 'Karnataka', '560078', 'Individual', 1, '2024-06-11 10:00:00'),
(2, 'CUST002', 'Dip', 'Chafale', 'Dip@gmail.com', '9080997675', 'Gandhi Nagar, Koppal', 'Koppal', 'Karnataka', '583231', 'Individual', 1, '2024-06-11 10:00:00'),
(3, 'CUST003', 'Aditya', 'Gokhale', 'Adi@gmail.com', '9080999778', 'Koramangala, Bangalore', 'Bangalore', 'Karnataka', '560034', 'Individual', 1, '2024-06-11 10:00:00'),
(4, 'CUST004', 'Vishal', 'Reddy', 'reddy@gmail.com', '9080123456', 'Indiranagar, Bangalore', 'Bangalore', 'Karnataka', '560038', 'Individual', 1, '2024-06-11 10:00:00'),
(5, 'CUST005', 'Tech Solutions Pvt Ltd', '', 'admin@techsolutions.com', '9080789123', 'Electronics City, Bangalore', 'Bangalore', 'Karnataka', '560100', 'Corporate', 1, '2024-06-11 10:00:00');

-- --------------------------------------------------------

-- Table structure for table `vehicles`
CREATE TABLE `vehicles` (
  `id` int(30) NOT NULL,
  `customer_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `make` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `year` int(4) NOT NULL,
  `registration_number` varchar(50) UNIQUE NOT NULL,
  `vin_number` varchar(100) UNIQUE DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `engine_type` varchar(100) DEFAULT NULL,
  `engine_capacity` varchar(20) DEFAULT NULL,
  `transmission` enum('Manual','Automatic','CVT') DEFAULT NULL,
  `current_mileage` int(10) DEFAULT NULL,
  `fuel_type` enum('Petrol','Diesel','Electric','Hybrid','CNG') DEFAULT NULL,
  `insurance_company` varchar(200) DEFAULT NULL,
  `insurance_policy_number` varchar(100) DEFAULT NULL,
  `insurance_expiry` date DEFAULT NULL,
  `last_service_date` date DEFAULT NULL,
  `next_service_due` date DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `warranty_expiry` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `vehicles`
INSERT INTO `vehicles` (`id`, `customer_id`, `category_id`, `make`, `model`, `year`, `registration_number`, `color`, `engine_type`, `transmission`, `current_mileage`, `fuel_type`, `insurance_expiry`, `status`, `created_at`) VALUES
(1, 3, 5, 'BMW', 'X3', 2020, 'WD001425', 'Black', '2.0L Turbo', 'Automatic', 45000, 'Petrol', '2025-03-15', 1, '2024-06-11 10:00:00'),
(2, 2, 1, 'Maruti Suzuki', 'Swift', 2016, 'WD001444', 'Red', '1.2L Petrol', 'Manual', 78000, 'Petrol', '2024-12-20', 1, '2024-06-11 10:00:00'),
(3, 1, 5, 'Toyota', 'Camry', 2016, 'WD001244', 'White', '2.5L Hybrid', 'CVT', 65000, 'Hybrid', '2025-01-10', 1, '2024-06-11 10:00:00'),
(4, 4, 4, 'Honda', 'City', 2019, 'KA05MN1234', 'Silver', '1.5L Petrol', 'Manual', 52000, 'Petrol', '2025-06-30', 1, '2024-06-11 10:00:00'),
(5, 5, 6, 'Mahindra', 'XUV500', 2021, 'KA01AB5678', 'Blue', '2.2L Diesel', 'Automatic', 35000, 'Diesel', '2025-08-15', 1, '2024-06-11 10:00:00');

-- --------------------------------------------------------

-- Table structure for table `service_pricing`
CREATE TABLE `service_pricing` (
  `id` int(30) NOT NULL,
  `service_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `base_price` decimal(10,2) NOT NULL,
  `labor_hours` decimal(4,2) DEFAULT NULL,
  `parts_cost_estimate` decimal(10,2) DEFAULT 0.00,
  `tax_percentage` decimal(5,2) DEFAULT 18.00,
  `effective_from` date NOT NULL,
  `effective_to` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `service_pricing`
INSERT INTO `service_pricing` (`id`, `service_id`, `category_id`, `base_price`, `labor_hours`, `parts_cost_estimate`, `effective_from`, `status`, `created_at`) VALUES
(1, 1, 1, 1500.00, 1.0, 800.00, '2024-01-01', 1, '2024-06-11 10:00:00'),
(2, 1, 2, 1800.00, 1.5, 900.00, '2024-01-01', 1, '2024-06-11 10:00:00'),
(3, 1, 5, 2500.00, 1.5, 1500.00, '2024-01-01', 1, '2024-06-11 10:00:00'),
(4, 2, 1, 3500.00, 3.0, 2000.00, '2024-01-01', 1, '2024-06-11 10:00:00'),
(5, 3, 1, 2500.00, 2.0, 500.00, '2024-01-01', 1, '2024-06-11 10:00:00'),
(6, 4, 1, 8000.00, 2.5, 6000.00, '2024-01-01', 1, '2024-06-11 10:00:00'),
(7, 5, 1, 800.00, 0.5, 0.00, '2024-01-01', 1, '2024-06-11 10:00:00'),
(8, 6, 1, 4500.00, 2.0, 2500.00, '2024-01-01', 1, '2024-06-11 10:00:00'),
(9, 7, 1, 2200.00, 1.5, 800.00, '2024-01-01', 1, '2024-06-11 10:00:00');

-- --------------------------------------------------------

-- Table structure for table `parts_inventory`
CREATE TABLE `parts_inventory` (
  `id` int(30) NOT NULL,
  `part_name` varchar(200) NOT NULL,
  `part_number` varchar(100) UNIQUE NOT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(100) NOT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `supplier_name` varchar(200) DEFAULT NULL,
  `supplier_contact` varchar(50) DEFAULT NULL,
  `cost_price` decimal(10,2) NOT NULL,
  `selling_price` decimal(10,2) NOT NULL,
  `quantity_in_stock` int(10) NOT NULL DEFAULT 0,
  `minimum_stock_level` int(10) NOT NULL DEFAULT 5,
  `maximum_stock_level` int(10) DEFAULT NULL,
  `unit_of_measure` varchar(50) DEFAULT 'Piece',
  `location` varchar(100) DEFAULT NULL,
  `last_purchase_date` date DEFAULT NULL,
  `last_sold_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `parts_inventory`
INSERT INTO `parts_inventory` (`id`, `part_name`, `part_number`, `description`, `category`, `brand`, `supplier_name`, `cost_price`, `selling_price`, `quantity_in_stock`, `minimum_stock_level`, `location`, `status`, `created_at`) VALUES
(1, 'Engine Oil 5W-30', 'EO5W30-4L', '4 Liter Premium Engine Oil', 'Engine Oil', 'Castrol', 'Auto Parts Distributor', 850.00, 1200.00, 25, 5, 'Shelf A1', 1, '2024-06-11 10:00:00'),
(2, 'Brake Pads Front', 'BP-FRONT-001', 'Ceramic brake pads for front wheels', 'Brake Parts', 'Bosch', 'Brake Components Ltd', 1500.00, 2200.00, 15, 3, 'Shelf B2', 1, '2024-06-11 10:00:00'),
(3, 'Air Filter', 'AF-STD-001', 'Standard air filter for hatchback cars', 'Filters', 'Mann Filter', 'Filter Solutions', 300.00, 450.00, 30, 10, 'Shelf C1', 1, '2024-06-11 10:00:00'),
(4, 'Spark Plugs Set', 'SP-SET-4', 'Set of 4 iridium spark plugs', 'Ignition', 'NGK', 'Ignition Parts Co', 800.00, 1200.00, 20, 5, 'Shelf A3', 1, '2024-06-11 10:00:00'),
(5, 'Battery 12V 65Ah', 'BAT-12V-65', 'Maintenance-free car battery', 'Electrical', 'Exide', 'Battery World', 3500.00, 4800.00, 8, 2, 'Battery Section', 1, '2024-06-11 10:00:00');

-- --------------------------------------------------------

-- Table structure for table `appointments`
CREATE TABLE `appointments` (
  `id` int(30) NOT NULL,
  `appointment_number` varchar(50) UNIQUE DEFAULT NULL,
  `customer_id` int(30) NOT NULL,
  `vehicle_id` int(30) NOT NULL,
  `service_id` int(30) NOT NULL,
  `mechanic_id` int(30) DEFAULT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `estimated_duration` int(10) DEFAULT NULL,
  `service_type` enum('Drop Off','Pick Up') NOT NULL,
  `pickup_address` text DEFAULT NULL,
  `drop_address` text DEFAULT NULL,
  `special_instructions` text DEFAULT NULL,
  `customer_notes` text DEFAULT NULL,
  `status` enum('Scheduled','Confirmed','In Progress','Completed','Cancelled','No Show') DEFAULT 'Scheduled',
  `confirmed_at` datetime DEFAULT NULL,
  `cancelled_at` datetime DEFAULT NULL,
  `cancellation_reason` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `appointments`
INSERT INTO `appointments` (`id`, `appointment_number`, `customer_id`, `vehicle_id`, `service_id`, `mechanic_id`, `appointment_date`, `appointment_time`, `estimated_duration`, `service_type`, `pickup_address`, `status`, `created_at`) VALUES
(1, 'APT001', 1, 3, 4, 1, '2024-06-15', '10:00:00', 180, 'Pick Up', 'JP Nagar, Bangalore', 'Scheduled', '2024-06-11 10:00:00'),
(2, 'APT002', 2, 2, 2, 2, '2024-06-16', '14:00:00', 240, 'Drop Off', NULL, 'Confirmed', '2024-06-11 10:00:00'),
(3, 'APT003', 3, 1, 3, 1, '2024-06-17', '09:00:00', 120, 'Pick Up', 'Koramangala, Bangalore', 'Scheduled', '2024-06-11 10:00:00');

-- --------------------------------------------------------

-- Table structure for table `work_orders`
CREATE TABLE `work_orders` (
  `id` int(30) NOT NULL,
  `work_order_number` varchar(50) UNIQUE NOT NULL,
  `appointment_id` int(30) DEFAULT NULL,
  `customer_id` int(30) NOT NULL,
  `vehicle_id` int(30) NOT NULL,
  `mechanic_id` int(30) NOT NULL,
  `service_advisor_id` int(30) DEFAULT NULL,
  `priority` enum('Low','Medium','High','Critical') DEFAULT 'Medium',
  `start_date` datetime DEFAULT NULL,
  `completion_date` datetime DEFAULT NULL,
  `estimated_completion` datetime DEFAULT NULL,
  `actual_labor_hours` decimal(5,2) DEFAULT NULL,
  `total_labor_cost` decimal(10,2) DEFAULT 0.00,
  `total_parts_cost` decimal(10,2) DEFAULT 0.00,
  `subtotal_amount` decimal(10,2) DEFAULT 0.00,
  `discount_percentage` decimal(5,2) DEFAULT 0.00,
  `discount_amount` decimal(10,2) DEFAULT 0.00,
  `tax_amount` decimal(10,2) DEFAULT 0.00,
  `final_amount` decimal(10,2) DEFAULT 0.00,
  `mileage_in` int(10) DEFAULT NULL,
  `mileage_out` int(10) DEFAULT NULL,
  `fuel_level_in` varchar(20) DEFAULT NULL,
  `fuel_level_out` varchar(20) DEFAULT NULL,
  `status` enum('Created','In Progress','Parts Pending','On Hold','Quality Check','Ready for Delivery','Completed','Cancelled') DEFAULT 'Created',
  `work_description` text DEFAULT NULL,
  `technician_notes` text DEFAULT NULL,
  `quality_check_notes` text DEFAULT NULL,
  `customer_approval_required` tinyint(1) DEFAULT 0,
  `customer_approved` tinyint(1) DEFAULT NULL,
  `customer_approval_date` datetime DEFAULT NULL,
  `warranty_period_months` int(3) DEFAULT 3,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `work_orders`
INSERT INTO `work_orders` (`id`, `work_order_number`, `appointment_id`, `customer_id`, `vehicle_id`, `mechanic_id`, `priority`, `estimated_completion`, `total_labor_cost`, `total_parts_cost`, `subtotal_amount`, `tax_amount`, `final_amount`, `status`, `work_description`, `created_at`) VALUES
(1, 'WO2024001', 1, 1, 3, 1, 'Medium', '2024-06-15 13:00:00', 2200.00, 6000.00, 8200.00, 1476.00, 9676.00, 'Created', 'Tire replacement - all 4 tires', '2024-06-11 10:00:00'),
(2, 'WO2024002', 2, 2, 2, 2, 'High', '2024-06-16 18:00:00', 3000.00, 2000.00, 5000.00, 900.00, 5900.00, 'In Progress', 'Engine tune up - spark plugs, filters, oil change', '2024-06-11 10:00:00');

-- --------------------------------------------------------

-- Table structure for table `work_order_parts`
CREATE TABLE `work_order_parts` (
  `id` int(30) NOT NULL,
  `work_order_id` int(30) NOT NULL,
  `part_id` int(30) NOT NULL,
  `quantity_used` int(10) NOT NULL,
  `unit_cost` decimal(10,2) NOT NULL,
  `total_cost` decimal(10,2) NOT NULL,
  `warranty_months` int(3) DEFAULT 6,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

-- Table structure for table `work_order_services`
CREATE TABLE `work_order_services` (
  `id` int(30) NOT NULL,
  `work_order_id` int(30) NOT NULL,
  `service_id` int(30) NOT NULL,
  `quantity` int(10) DEFAULT 1,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `labor_hours` decimal(5,2) DEFAULT NULL,
  `completed` tinyint(1) DEFAULT 0,
  `completion_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

-- Table structure for table `payments`
CREATE TABLE `payments` (
  `id` int(30) NOT NULL,
  `payment_number` varchar(50) UNIQUE DEFAULT NULL,
  `work_order_id` int(30) NOT NULL,
  `customer_id` int(30) NOT NULL,
  `payment_method` enum('Cash','Credit Card','Debit Card','UPI','Net Banking','Cheque','Wallet') NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `reference_number` varchar(100) DEFAULT NULL,
  `payment_date` datetime NOT NULL,
  `due_date` date DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `cheque_number` varchar(50) DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `status` enum('Pending','Processing','Completed','Failed','Cancelled','Refunded') DEFAULT 'Pending',
  `gateway_response` text DEFAULT NULL,
  `refund_amount` decimal(10,2) DEFAULT 0.00,
  `refund_date` datetime DEFAULT NULL,
  `refund_reason` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `processed_by` int(30) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `payments`
INSERT INTO `payments` (`id`, `payment_number`, `work_order_id`, `customer_id`, `payment_method`, `amount`, `payment_date`, `status`, `created_at`) VALUES
(1, 'PAY001', 2, 2, 'UPI', 5900.00, '2024-06-11 15:30:00', 'Completed', '2024-06-11 10:00:00');

-- --------------------------------------------------------

-- Table structure for table `customer_feedback`
CREATE TABLE `customer_feedback` (
  `id` int(30) NOT NULL,
  `work_order_id` int(30) NOT NULL,
  `customer_id` int(30) NOT NULL,
  `mechanic_id` int(30) NOT NULL,
  `service_rating` tinyint(1) NOT NULL CHECK (`service_rating` BETWEEN 1 AND 5),
  `mechanic_rating` tinyint(1) NOT NULL CHECK (`mechanic_rating` BETWEEN 1 AND 5),
  `timeliness_rating` tinyint(1) NOT NULL CHECK (`timeliness_rating` BETWEEN 1 AND 5),
  `pricing_rating` tinyint(1) NOT NULL CHECK (`pricing_rating` BETWEEN 1 AND 5),
  `overall_rating` tinyint(1) NOT NULL CHECK (`overall_rating` BETWEEN 1 AND 5),
  `feedback_text` text DEFAULT NULL,
  `positive_aspects` text DEFAULT NULL,
  `improvement_suggestions` text DEFAULT NULL,
  `would_recommend` tinyint(1) DEFAULT NULL,
  `would_return` tinyint(1) DEFAULT NULL,
  `feedback_source` enum('In Person','Phone','Email','SMS','Website','App') DEFAULT 'In Person',
  `follow_up_required` tinyint(1) DEFAULT 0,
  `follow_up_completed` tinyint(1) DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `customer_feedback`
INSERT INTO `customer_feedback` (`id`, `work_order_id`, `customer_id`, `mechanic_id`, `service_rating`, `mechanic_rating`, `timeliness_rating`, `pricing_rating`, `overall_rating`, `feedback_text`, `would_recommend`, `would_return`, `created_at`) VALUES
(1, 2, 2, 2, 5, 5, 4, 4, 5, 'Excellent service! Vishal explained everything clearly and the work was completed on time.', 1, 1, '2024-06-11 10:00:00');

-- --------------------------------------------------------

-- Table structure for table `service_reminders`
CREATE TABLE `service_reminders` (
  `id` int(30) NOT NULL,
  `vehicle_id` int(30) NOT NULL,
  `customer_id` int(30) NOT NULL,
  `service_type` varchar(200) NOT NULL,
  `due_date` date NOT NULL,
  `due_mileage` int(10) DEFAULT NULL,
  `reminder_sent` tinyint(1) DEFAULT 0,
  `reminder_date` datetime DEFAULT NULL,
  `reminder_method` enum('SMS','Email','Phone','App Notification') DEFAULT NULL,
  `status` enum('Pending','Sent','Scheduled','Completed','Cancelled') );