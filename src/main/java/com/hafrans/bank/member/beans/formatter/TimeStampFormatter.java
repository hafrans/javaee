package com.hafrans.bank.member.beans.formatter;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

import org.springframework.format.Formatter;
import org.springframework.stereotype.Component;

@Component(value="timestampFormatter")
public class TimeStampFormatter implements Formatter<Timestamp> {

	@Override
	public String print(Timestamp arg0, Locale arg1) {
		
		return new SimpleDateFormat("yyyy-MM-dd").format(arg0.getTime());
	}

	@Override
	public Timestamp parse(String arg0, Locale arg1) throws ParseException {
		
		return new Timestamp(new SimpleDateFormat("yyyy-MM-dd").parse(arg0).getTime());
	}

}
