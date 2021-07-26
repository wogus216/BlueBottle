package com.gdj35.bbps.web.service;

import java.util.HashMap;
import java.util.List;

public interface IshService {
	public int getOCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getOList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getODtlList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getODtl(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getRDtlList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getRDtl(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getOWholeList(HashMap<String, String> params) throws Throwable;

	public int apvOrd(HashMap<String, String> params) throws Throwable;

	public int nonApvOrd(HashMap<String, String> params) throws Throwable;

	public int apvRef(HashMap<String, String> params) throws Throwable;

	public int nonApvRef(HashMap<String, String> params) throws Throwable;

	public int sendO(HashMap<String, String> params) throws Throwable;

	public int sendExp(HashMap<String, Object> insertMap) throws Throwable;

	public int getBOCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getBOList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getBODtl(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getBODtlList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getBRDtl(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getBRDtlList(HashMap<String, String> params) throws Throwable;

	public int cnlO(HashMap<String, String> params) throws Throwable;

	public int cnlRef(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getRefItem(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getOrdItem(HashMap<String, String> params) throws Throwable;

	public int writeRefItem(HashMap<String, Object> insertMap) throws Throwable;

	public int writeRef(HashMap<String, String> params) throws Throwable;

	public int writeOrd() throws Throwable;

	public int writeOrdItem(HashMap<String, Object> insertMap) throws Throwable;

	public HashMap<String, String> getLastONo() throws Throwable;

	public List<HashMap<String, String>> getBrchList() throws Throwable;

	public List<HashMap<String, String>> getCateList() throws Throwable;

}
