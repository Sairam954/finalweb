package com.epam.finalweb.command.impl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.epam.finalweb.command.Command;

import com.epam.finalweb.domain.UserBook;
import com.epam.finalweb.service.BookService;
import com.epam.finalweb.service.exception.ServiceException;
import com.epam.finalweb.service.factory.FactoryService;

public class AllBookCommand implements Command {
	private static Logger LOG = Logger.getLogger(AllBookCommand.class);

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		String locale = (String) session.getAttribute("language");

		BookService bookService = FactoryService.INSTANCE.getBookService();
		List<UserBook> books = null;
		try {
			books = bookService.getAllBook(locale);

			request.setAttribute("allBooks", books);
	
			request.getRequestDispatcher("allBookPage").forward(request, response);
		} catch (ServiceException e) {
			LOG.error("Service Exception", e);
			
		}

	}

}