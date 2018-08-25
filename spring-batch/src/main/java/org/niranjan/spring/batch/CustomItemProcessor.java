package org.niranjan.spring.batch;

import org.niranjan.spring.batch.model.Report;
import org.springframework.batch.item.ItemProcessor;

public class CustomItemProcessor implements ItemProcessor<Report, Report>{
	@Override
	public Report process(Report item) throws Exception {
		System.out.println("Processing..." + item);
		return item;
	}
}