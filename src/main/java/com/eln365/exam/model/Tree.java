package com.eln365.exam.model;

import java.util.ArrayList;
import java.util.List;

/**
 * @email: ya888g@163.com @company: eln365.com
 * @author: 时光倒流 @date：2014-1-25下午11:40:52
 * 类说明
 */
public class Tree {
	private String id;
	private String name;
	private boolean isDir;
	private boolean open;
	private List<Tree> children;

	public Tree() {
		this.children = new ArrayList<Tree>();
	}

	public void addChild(Tree ct) {
		this.children.add(ct);
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isOpen() {
		return open;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}

	public List<Tree> getChildren() {
		return children;
	}

	public void setChildren(List<Tree> children) {
		this.children = children;
	}

	public boolean getIsDir() {
		return isDir;
	}

	public void setIsDir(boolean isDir) {
		this.isDir = isDir;
	}

}
