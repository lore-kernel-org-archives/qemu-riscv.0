Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5782BC369C2
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 15:24:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u8Kti-0001ip-TX; Fri, 25 Apr 2025 11:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1u8Kte-0001ed-97
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 11:23:22 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1u8Kta-0002pe-QW
 for qemu-riscv@nongnu.org; Fri, 25 Apr 2025 11:23:21 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-7376dd56eccso2570932b3a.0
 for <qemu-riscv@nongnu.org>; Fri, 25 Apr 2025 08:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745594597; x=1746199397; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xNi29cUmvbhQyUeV6Au09yg4HVFM1Boo5sSDPMUFN5U=;
 b=rx9gA6NV10zGWYMDPQU5OVoiUC+3/KcF6utX5+3pkPZlD1rFMnV9NpOGNWsX0fOLpZ
 DfDB+3KyFQe15xQGzUquIiio7rnMCdJucRujH7MJhWGDN92rD9ahRFyBH7SISCKSb0QF
 /MnWQtKL9cCi4vPNwEASYvnY1ZcWckaJFBTCEsZAnCUA6/e4y4UNU9enfCYNhz+86/jb
 TrlOd9KRaaUMPMfWWeHM+3ugAvYIhxQYSpEz9wdm1eqD+QWNR6ZOOpx/PDBMwEuYn5bv
 RlZJGNevGD7Y2Kdi7pHvufXD8uye6K6ZesIbJVhUhl3f1UEa2Ex206MHw5rEqLh/tWFU
 tSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745594597; x=1746199397;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xNi29cUmvbhQyUeV6Au09yg4HVFM1Boo5sSDPMUFN5U=;
 b=Phsyp13U9bwNNBpLyoSoSDacGqJGl+WU2+9dYk5D5pU1IYOwuDU0FqACFo0gQNDToE
 iPeZ5gyhZCmzuixJmfpuo685cct5KsP0W5aHjm1RQrXLDv/42kvDLjsH4MNOwm3jR1+/
 Ym0kYoZ1QWZuyRxFGhoRlIw31Wxc08zi1JnoG07TVqGSS8AgYRTuYL63AOmZI4Tqe7qx
 3iRICjIxdWm9PbzOuj4nAUqk7ZF+xw5fOX+7EzxcXGTI/4OQJ3Ok94S6DWnwtin2MtKA
 3o3Z7jwBbQtLeF/o/LiCb+FfL0hNKbK72GQhug3seV9t7LQC+UPZT8KJihAsdLtAQcs+
 nq+A==
X-Gm-Message-State: AOJu0YzHh5I5H+eTR+4vmG6s5QaPEwFxNUhEoB1oFeUFIHTiDLkeRwc/
 dHZZSDdsIO5SMbKa9liF8saNEl9Hoi+UdHydr5iVeBoVU08O8EhQan284/YGnmaqKqKCz0C6D4N
 y
X-Gm-Gg: ASbGnctMa3EeL7o0dnGQR8kKVl9Webv6S2ahq5ZWnCMfpOxuga5mQVPmTMFsEWWz/vf
 IN6tk9yYVR7RpaL/JVrcx2X1FOplczDzYaHHpssRypwir0GOObNyNRcbkuqL770fsXgJs4St+gR
 fG2F+Bznlevw0NeqzYjVSWvU8AmCqE7fRxQ0tyVFJhhDII20VSvk0ec6PQyXrDyKOltUrIvJViX
 h1ngDguDDoXJ9VjvTY77TLS8OA2OVJphWj3jGFKzQG8n0fbdyHlTJAbtPh9C+xsVwyJ0oi5gJcW
 1kH5kBsGXL/d4RXVM/FVJ55dwpXEGPXfmcwIoy3M5lbFBIBUk4ttn2G3qykuCSMMBccx6Vl2Y5g
 =
X-Google-Smtp-Source: AGHT+IFYaA7OEpPoQ1dhQ7EJLs6ZVzHDkNu2pzIww5etqOZVJsTnSgdHSR5GwpIQAjxKanG2ydS0yQ==
X-Received: by 2002:a05:6a00:1150:b0:736:692e:129 with SMTP id
 d2e1a72fcca58-73fd8f4f0a7mr4483681b3a.24.1745594596919; 
 Fri, 25 Apr 2025 08:23:16 -0700 (PDT)
Received: from stoup.. (71-212-47-143.tukw.qwest.net. [71.212.47.143])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25a6a49esm3390466b3a.106.2025.04.25.08.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 08:23:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, dbarboza@ventanamicro.com
Subject: [PATCH 5/7] target/riscv: Pass ra to riscv_csrrw_i128
Date: Fri, 25 Apr 2025 08:23:09 -0700
Message-ID: <20250425152311.804338-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250425152311.804338-1-richard.henderson@linaro.org>
References: <20250425152311.804338-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h       | 4 ++--
 target/riscv/csr.c       | 8 ++++----
 target/riscv/op_helper.c | 9 +++++----
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 2c0524d0be..8b84793b15 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -851,8 +851,8 @@ typedef RISCVException (*riscv_csr_op_fn)(CPURISCVState *env, int csrno,
 RISCVException riscv_csrr_i128(CPURISCVState *env, int csrno,
                                Int128 *ret_value);
 RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
-                                Int128 *ret_value,
-                                Int128 new_value, Int128 write_mask);
+                                Int128 *ret_value, Int128 new_value,
+                                Int128 write_mask, uintptr_t ra);
 
 typedef RISCVException (*riscv_csr_read128_fn)(CPURISCVState *env, int csrno,
                                                Int128 *ret_value);
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 097640e25d..a663f527a4 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -5656,8 +5656,8 @@ RISCVException riscv_csrr_i128(CPURISCVState *env, int csrno,
 }
 
 RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
-                                Int128 *ret_value,
-                                Int128 new_value, Int128 write_mask)
+                                Int128 *ret_value, Int128 new_value,
+                                Int128 write_mask, uintptr_t ra)
 {
     RISCVException ret;
 
@@ -5668,7 +5668,7 @@ RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
 
     if (csr_ops[csrno].read128) {
         return riscv_csrrw_do128(env, csrno, ret_value,
-                                 new_value, write_mask, 0);
+                                 new_value, write_mask, ra);
     }
 
     /*
@@ -5681,7 +5681,7 @@ RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
     target_ulong old_value;
     ret = riscv_csrrw_do64(env, csrno, &old_value,
                            int128_getlo(new_value),
-                           int128_getlo(write_mask), 0);
+                           int128_getlo(write_mask), ra);
     if (ret == RISCV_EXCP_NONE && ret_value) {
         *ret_value = int128_make64(old_value);
     }
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index aee16e2e3a..e3770a2655 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -108,7 +108,7 @@ void helper_csrw_i128(CPURISCVState *env, int csr,
 {
     RISCVException ret = riscv_csrrw_i128(env, csr, NULL,
                                           int128_make128(srcl, srch),
-                                          UINT128_MAX);
+                                          UINT128_MAX, GETPC());
 
     if (ret != RISCV_EXCP_NONE) {
         riscv_raise_exception(env, ret, GETPC());
@@ -116,13 +116,14 @@ void helper_csrw_i128(CPURISCVState *env, int csr,
 }
 
 target_ulong helper_csrrw_i128(CPURISCVState *env, int csr,
-                       target_ulong srcl, target_ulong srch,
-                       target_ulong maskl, target_ulong maskh)
+                               target_ulong srcl, target_ulong srch,
+                               target_ulong maskl, target_ulong maskh)
 {
     Int128 rv = int128_zero();
     RISCVException ret = riscv_csrrw_i128(env, csr, &rv,
                                           int128_make128(srcl, srch),
-                                          int128_make128(maskl, maskh));
+                                          int128_make128(maskl, maskh),
+                                          GETPC());
 
     if (ret != RISCV_EXCP_NONE) {
         riscv_raise_exception(env, ret, GETPC());
-- 
2.43.0


