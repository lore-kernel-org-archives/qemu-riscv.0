Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6SF-0000mu-MW
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 02:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Rk-00009i-BO
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:58:46 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6R2-0001hb-VE
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 02:58:37 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f4000ec71dso14205e9.2
 for <qemu-riscv@nongnu.org>; Tue, 02 May 2023 23:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097076; x=1685689076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I4w3bX0EvMhXa1FPvD+aIFFJRHstVlIrJSKr2TPnALg=;
 b=CkMdBgXwreFY7CGlT3MnxzBZwaYwc+jr0OOKyz640kc5WDMLv82tPMTGslGoLKsQpY
 j47MsDcVTS3bRMFX8/CT4Qxu13ckfvqh8zCo5HRh4JpJSYNhj6BTmkVf6BiqbIhqKNXQ
 mmD1Kq8g9bfH4dYlFCXpCKskDmNd699rw55hn3KOGo4Mbgt6LsWJP5j4NqGeHiIlKdfv
 OFc0U+hRcZIlpktekEjE5E6jLJin/U9ie0tvO3l5TY5HbVnlnd6pVlyOhWKDGTvl+h4c
 yNArvMBWRkP/D4BYY//fANFGFVSxqBjp9sJxEk5VniOg8wx/44Z/tee1q37/bdFQZIfJ
 DbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097076; x=1685689076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I4w3bX0EvMhXa1FPvD+aIFFJRHstVlIrJSKr2TPnALg=;
 b=e+WNJJbX0x7XUcdaSFZWsfdJzleuprvBc1/8LpXdJszBSEYVbBg9bxzwppZHcfGO8u
 dQ7CMaiYWsaBPcXNIYt+pRGESo2GwV/sEOmQKnn2Bl0/XLzte16saEjOfelc/QalKWkl
 MBKDGLru2JWtil+ShHBDGdSaf7BOCWiBtcuqEbDANgDDvi+fSXiGVkWYVg9rPEptbo3Q
 21OIegkRU1jhJwD89gRxJ9Q5fxz7LiWesIYIbV5zMrHu+lfSb/ie0x7q3uIXh8AyaWZS
 ds9m0IZlIiGfRz2Cuw9psm/qDedGuhJk/efXmWDKgAyfOUWkyuOnOnvemHBEh+bbjhPy
 cMjQ==
X-Gm-Message-State: AC+VfDx4vlWQACegwwgX50RhD+4doeZ1+y6cVX0sfsgjuFYVGMDJNZ8E
 dBRIoCUdO/oaKHPyWQMnGBpDUw==
X-Google-Smtp-Source: ACHHUZ6QXUzNG5w/YVoLl6aRaN22vQRP+iM/+KVNGfSF+1tGgOaxLl736RDoygnjCbFBPs1wr4Z92g==
X-Received: by 2002:adf:e807:0:b0:306:41d3:fca8 with SMTP id
 o7-20020adfe807000000b0030641d3fca8mr776482wrm.69.1683097075911; 
 Tue, 02 May 2023 23:57:55 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 33/54] tcg: Widen helper_*_st[bw]_mmu val arguments
Date: Wed,  3 May 2023 07:57:08 +0100
Message-Id: <20230503065729.1745843-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 03 May 2023 06:58:54 -0000

While the old type was correct in the ideal sense, some ABIs require
the argument to be zero-extended.  Using uint32_t for all such values
is a decent compromise.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-ldst.h | 10 +++++++---
 accel/tcg/cputlb.c     |  6 +++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
index 2ba22bd5fe..684e394b06 100644
--- a/include/tcg/tcg-ldst.h
+++ b/include/tcg/tcg-ldst.h
@@ -55,15 +55,19 @@ tcg_target_ulong helper_be_ldsw_mmu(CPUArchState *env, target_ulong addr,
 tcg_target_ulong helper_be_ldsl_mmu(CPUArchState *env, target_ulong addr,
                                     MemOpIdx oi, uintptr_t retaddr);
 
-void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
+/*
+ * Value extended to at least uint32_t, so that some ABIs do not require
+ * zero-extension from uint8_t or uint16_t.
+ */
+void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                         MemOpIdx oi, uintptr_t retaddr);
-void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr);
 void helper_le_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr);
 void helper_le_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                        MemOpIdx oi, uintptr_t retaddr);
-void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr);
 void helper_be_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr);
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index c8bd642d0e..3117886af1 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2508,7 +2508,7 @@ full_stb_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
     store_helper(env, addr, val, oi, retaddr, MO_UB);
 }
 
-void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
+void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                         MemOpIdx oi, uintptr_t retaddr)
 {
     full_stb_mmu(env, addr, val, oi, retaddr);
@@ -2521,7 +2521,7 @@ static void full_le_stw_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
     store_helper(env, addr, val, oi, retaddr, MO_LEUW);
 }
 
-void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+void helper_le_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
     full_le_stw_mmu(env, addr, val, oi, retaddr);
@@ -2534,7 +2534,7 @@ static void full_be_stw_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
     store_helper(env, addr, val, oi, retaddr, MO_BEUW);
 }
 
-void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint16_t val,
+void helper_be_stw_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
                        MemOpIdx oi, uintptr_t retaddr)
 {
     full_be_stw_mmu(env, addr, val, oi, retaddr);
-- 
2.34.1


