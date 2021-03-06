package com.epam.finalweb.command.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.epam.finalweb.command.Command;
import com.epam.finalweb.service.BookService;
import com.epam.finalweb.service.exception.ServiceException;
import com.epam.finalweb.service.factory.FactoryService;

public class RemoveBookCommand implements Command {

	private static final Logger LOG = Logger.getLogger(RemoveBookCommand.class);
	private static final String USERID = "userId";
	private static final String BOOKID="bookId";
	private static final String USERBOOKPAGE="userBookPage";
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String userID = (String) session.getAttribute(USERID);
		int userId = Integer.parseInt(userID);
		int bookId = Integer.parseInt(request.getParameter(BOOKID));
		BookService bookService = FactoryService.INSTANCE.getBookService();
		try {
			bookService.removeBook(bookId, userId);

			response.sendRedirect("user?commandName=userbook");

		} catch (ServiceException e) {
			LOG.error("Could Not add book to user library", e);

			request.setAttribute("status", "Book not removed please try later");
			request.getRequestDispatcher(USERBOOKPAGE).forward(request, response);

		}
	}

}
