package com.pptaa.sample;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class HotelTests {

	@Setter(onMethod_ = {@Autowired})
	private SampleHotel sampleHotel;
	
	@Test
	public void test() {
		assertNotNull(sampleHotel);

		log.info(sampleHotel);
		log.info("-------------------------");
		log.info(sampleHotel.getChef());
		
	}
}