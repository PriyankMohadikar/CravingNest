package com.grownited.controller.admin;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.grownited.repository.BookingRepository;
import com.grownited.repository.LocationRepository;
import com.grownited.repository.OfferRepository;
import com.grownited.repository.UserRepository;

@Controller
public class AdminController {

	@Autowired
	BookingRepository bookingRepository;
	
    @Autowired
    UserRepository userRepository;
    
    @Autowired
    LocationRepository locationRepository;
    
    @Autowired
    OfferRepository offerRepository;

    @GetMapping("/admindashboard")
    public String admin(Model model, @RequestParam(value = "filter", defaultValue = "thismonth") String filter) {
        // Fetch total users
        long totalUsers = userRepository.getTotalUsers();

        // Get current date (April 08, 2025)
        LocalDate currentDate = LocalDate.now();
        int currentMonth = currentDate.getMonthValue(); // 4 (April)
        int currentYear = currentDate.getYear(); // 2025

        // Variables to store filtered data
        long filteredCount = 0;
        String filterLabel = "";
        String percentageChange = "N/A";
        String trendDirection = "";

        // Handle filter logic
        switch (filter.toLowerCase()) {
            case "today":
                // For simplicity, we'll assume "today" means this month (could refine to actual day if needed)
                filteredCount = userRepository.getUsersByMonth(currentMonth, currentYear) != null 
                    ? userRepository.getUsersByMonth(currentMonth, currentYear) : 0;
                filterLabel = "Today";
                break;

            case "thismonth":
                filteredCount = userRepository.getUsersByMonth(currentMonth, currentYear) != null 
                    ? userRepository.getUsersByMonth(currentMonth, currentYear) : 0;
                filterLabel = "This Month";
                // Compare with last month
                long usersLastMonth = userRepository.getUsersByMonth(currentDate.minusMonths(1).getMonthValue(), 
                    currentDate.minusMonths(1).getYear()) != null 
                    ? userRepository.getUsersByMonth(currentDate.minusMonths(1).getMonthValue(), currentDate.minusMonths(1).getYear()) 
                    : 0;
                if (usersLastMonth > 0) {
                    double change = ((double) (filteredCount - usersLastMonth) / usersLastMonth) * 100;
                    percentageChange = String.format("%.1f", change);
                    trendDirection = change >= 0 ? "increase" : "decrease";
                }
                model.addAttribute("usersLastMonth", usersLastMonth);
                break;

            case "lastmonth":
                int lastMonth = currentDate.minusMonths(1).getMonthValue(); // 3 (March)
                int lastYear = currentDate.minusMonths(1).getYear(); // 2025
                filteredCount = userRepository.getUsersByMonth(lastMonth, lastYear) != null 
                    ? userRepository.getUsersByMonth(lastMonth, lastYear) : 0;
                filterLabel = "Last Month";
                // Compare with the month before last
                long usersTwoMonthsAgo = userRepository.getUsersByMonth(currentDate.minusMonths(2).getMonthValue(), 
                    currentDate.minusMonths(2).getYear()) != null 
                    ? userRepository.getUsersByMonth(currentDate.minusMonths(2).getMonthValue(), currentDate.minusMonths(2).getYear()) 
                    : 0;
                if (usersTwoMonthsAgo > 0) {
                    double change = ((double) (filteredCount - usersTwoMonthsAgo) / usersTwoMonthsAgo) * 100;
                    percentageChange = String.format("%.1f", change);
                    trendDirection = change >= 0 ? "increase" : "decrease";
                }
                model.addAttribute("usersLastMonth", usersTwoMonthsAgo); // For display purposes
                break;

            case "thisyear":
                filteredCount = userRepository.getUsersByYear(currentYear) != null 
                    ? userRepository.getUsersByYear(currentYear) : 0;
                filterLabel = "This Year";
                // Compare with last year
                long usersLastYear = userRepository.getUsersByYear(currentYear - 1) != null 
                    ? userRepository.getUsersByYear(currentYear - 1) : 0;
                if (usersLastYear > 0) {
                    double change = ((double) (filteredCount - usersLastYear) / usersLastYear) * 100;
                    percentageChange = String.format("%.1f", change);
                    trendDirection = change >= 0 ? "increase" : "decrease";
                }
                model.addAttribute("usersLastYear", usersLastYear);
                break;

            default:
                filteredCount = userRepository.getUsersByMonth(currentMonth, currentYear) != null 
                    ? userRepository.getUsersByMonth(currentMonth, currentYear) : 0;
                filterLabel = "This Month";
                break;
        }
        // for location card
        long totalLocations = locationRepository.getTotalLocations();
        Long locationsLastMonthObj = locationRepository.getLocationsLastMonth();
        long locationsLastMonth = locationsLastMonthObj != null ? locationsLastMonthObj : 0;

        model.addAttribute("totalLocations", totalLocations);
        model.addAttribute("locationsLastMonth", locationsLastMonth);

        // Add User carddata to the model
        model.addAttribute("totalUsers", totalUsers);
        model.addAttribute("filteredCount", filteredCount);
        model.addAttribute("filterLabel", filterLabel);
        model.addAttribute("percentageChange", percentageChange);
        model.addAttribute("trendDirection", trendDirection);
        
        // for offers card
        long totalOffers = offerRepository.getTotalOffers();
        long activeOffers = offerRepository.getActiveOffers();

        model.addAttribute("totalOffers", totalOffers);
        model.addAttribute("activeOffers", activeOffers);
        
        //Booking Card
        long totalBooking = bookingRepository.getAllBookings();
        long confirmbooking = bookingRepository.confirmedBooking();
        
        model.addAttribute("totalbooking", totalBooking);
        model.addAttribute("confirmbooking", confirmbooking);
        return "Admindashboard";
    }
}