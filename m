Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHwp-0007S1-BY
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHwk-0007Kj-0P
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:48:06 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:54063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHwh-0002u7-1L
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:48:05 -0400
Received: by mail-pj1-x102b.google.com with SMTP id ls18so6649866pjb.3
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m8qNypBx+XCd04Rc1mPlj3m8bp+fngd8P2AeAFf31H0=;
 b=JjglIMc7D/5sYzA9oh8GJhNjQlhWqZHeTbB1hjeMqdQMwPEYMkKCigaDtttVUAN2D2
 w4g5VpCshmgF6XjhW8vIVJWYmQQPrQPZ5wGkjsv/vMHAvpedt6MHzyQBtolhDUxSn0RZ
 9fFchQwYypeQMeizlzK9zm1kNWmQxXRW8Tv7mrsjk5rQZaiKk+hoC73fAwcrMqlAN7qx
 7MVGQzd0jNIevl2G8ayeH+LF/dgbm8e9eDSufMr3oZ7WLUmAGQ2mma8UqE9I1AoIhYHg
 VCQETGeQxqGOoRZ2oaPPK3hhG0JeV3xY94je+36kHFOUPsohyvXnOidFDo61xOdUYUkp
 GK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m8qNypBx+XCd04Rc1mPlj3m8bp+fngd8P2AeAFf31H0=;
 b=Sg3rPqIs/Um8e1/Q++VdpEK2OBSf6f+m0zc5ZZD0aLrUH/nqk2A7Moj6X5PO2RPKAT
 MJlrlMmgnfHuR++Y/qvrQYjCZpaiT/X+2lzvY0Ut+Tl1TuslgergFD0jgnCrEjkyZUJ8
 g+0Zdb/cOahxtQS05jxYcvXmz5aPt8dm9Cqm3ibzBFxkLWhO+kKrxyoIuxBoEncl3RYl
 8gIyx9CJHbVSmHg12rCByZryAYqKXpEmI6KuRxZHuAAkg88zdT89qoMEl+SQFh9+AKDy
 mlVuQC8D78qx7q7fv2L6iy4cHehNQnc2DzDNfWdsybN4N6Mn9/uY2B0lo9owJro6YRWL
 Gk0A==
X-Gm-Message-State: AOAM530fpKOeUfUfkAEdsFmDDiicjJbNZR/ZKKfoXvQFQrX706kzFWEn
 7DKZ6ZRu8YnVxPFnjYwEN/VOmA==
X-Google-Smtp-Source: ABdhPJyUgTXUYpousdinOMottSHGnjDFSZPIHcOaaYBjS/EWmrZ3/GUjD64JjBVkneRsTCeLXrrmZw==
X-Received: by 2002:a17:90b:4b03:: with SMTP id
 lx3mr11707742pjb.162.1634284081764; 
 Fri, 15 Oct 2021 00:48:01 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:48:01 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 21/76] target/riscv: rvv-1.0: fix address index overflow bug
 of indexed load/store insns
Date: Fri, 15 Oct 2021 15:45:25 +0800
Message-Id: <20211015074627.3957162-25-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Oct 2021 07:48:06 -0000

From: Frank Chang <frank.chang@sifive.com>

Replace ETYPE from signed int to unsigned int to prevent index overflow
issue, which would lead to wrong index address.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index d0c4be2ecc9..366a4476916 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -361,10 +361,10 @@ static target_ulong NAME(target_ulong base,            \
     return (base + *((ETYPE *)vs2 + H(idx)));          \
 }
 
-GEN_VEXT_GET_INDEX_ADDR(idx_b, int8_t,  H1)
-GEN_VEXT_GET_INDEX_ADDR(idx_h, int16_t, H2)
-GEN_VEXT_GET_INDEX_ADDR(idx_w, int32_t, H4)
-GEN_VEXT_GET_INDEX_ADDR(idx_d, int64_t, H8)
+GEN_VEXT_GET_INDEX_ADDR(idx_b, uint8_t,  H1)
+GEN_VEXT_GET_INDEX_ADDR(idx_h, uint16_t, H2)
+GEN_VEXT_GET_INDEX_ADDR(idx_w, uint32_t, H4)
+GEN_VEXT_GET_INDEX_ADDR(idx_d, uint64_t, H8)
 
 static inline void
 vext_ldst_index(void *vd, void *v0, target_ulong base,
-- 
2.25.1


