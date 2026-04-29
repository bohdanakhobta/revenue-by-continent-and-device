# Revenue by Continent and Device Analysis

## Project Overview

This SQL project analyses revenue performance by continent and device type.  
It also compares account and session activity across different regions.

## Business Problem

Businesses need to understand which regions generate the most revenue and how users interact across devices.  
This analysis helps identify strong-performing continents, compare mobile and desktop revenue, and evaluate user activity by region.

## Data Sources

- `session_params` — session information, including continent and device
- `order` — customer purchases
- `product` — product prices
- `account_session` — links accounts with sessions
- `account` — account verification information

## Metrics

- Total revenue
- Revenue from mobile
- Revenue from desktop
- Percent of total revenue
- Account count
- Verified account count
- Session count

## What this analysis shows

- Which continents generate the most revenue
- How revenue is split between mobile and desktop users
- How account and session activity differ by continent
- How verified accounts are distributed across regions

## SQL File

`revenue_by_continent_and_device.sql`

## Skills Demonstrated

- SQL CTEs
- LEFT JOINs
- Conditional aggregation with CASE WHEN
- Window functions
- Revenue segmentation
- Geographic and device-level analysis
