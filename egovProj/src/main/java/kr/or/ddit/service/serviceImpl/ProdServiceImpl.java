package kr.or.ddit.service.serviceImpl;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.ProdMapper;
import kr.or.ddit.service.ProdService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProdServiceImpl implements ProdService {
	
	@Autowired
	ProdMapper prodMapper;
	
	@Override
	public List<Map<String,Object>> amtSale(){
		return this.prodMapper.amtSale();
	}

	
	

}
