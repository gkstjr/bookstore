package com.trio.bookstore.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class FinalStoreListVO {
		private List<FinalStoreVO> finalStore;
}
