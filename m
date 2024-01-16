Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525D0C47DA7
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 21:00:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPqWW-0004k4-9Q; Tue, 16 Jan 2024 15:59:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPqWU-0004jT-Ln
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 15:59:02 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rPqWS-0007eF-S3
 for qemu-riscv@nongnu.org; Tue, 16 Jan 2024 15:59:02 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-28e724d9c47so759032a91.2
 for <qemu-riscv@nongnu.org>; Tue, 16 Jan 2024 12:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705438740; x=1706043540; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r4cy4vMBI0zOMfd5xLwLJg2urR77gmMSIpOXOZ3zsA8=;
 b=m2ed1djZqAIMT0dQZrvpGcgeIPjX3ni6bKd8z2LEM2w5gq1jghAU6w8O2lSmModOcH
 9Pa3DyKsREzoSBaF6bn9Gdk0PM4vXcfvWi3dBsLQKitZwaD3FsoDpNJhbhni2Om5AW76
 LR5gQGxORO9B81+dJlnJIsKcMn79U9vys0bW71f7DoG8XMmtvMjLMwuseEcIeqxWRO/Q
 8wGXa5V3lFtROsqtcVKAKjXgQE0UK4adSQjuRlPSz5FfjnWecqvjjfDCeHdboAgxsesL
 Ee3xwWe7FfrOW1fRiDcqjnevBmaXdTChleNSzcyLpP2NqKdL9A3F06H1F/DJ0n6ZrJpe
 znMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705438740; x=1706043540;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r4cy4vMBI0zOMfd5xLwLJg2urR77gmMSIpOXOZ3zsA8=;
 b=Z2gmwyL+FbEqzsBMRJugE3SqQpbwa84am1NjwnwjWOKgqFMngARwPOdvFjYVEplkht
 JQPZQhXKEAhGfIkH1JXkJLu92vm4FjOW1/49ygiXlFTcS9n0gCJLdWeWmmLtFIDnC19Z
 fYW4peIqqZtxtqg+sYD3gAdOvBah+g/cRH4V2i3J4nPCh4L+ome5VAmvMvMsu/EN9qw0
 PtrA7/gQhpKUlf6pt7X1Vl9GLLx0s0RJGo2rG94f+AOugngRylLnvQja79Z34ShGISXR
 MJxl2I1NZS+O+wYyppoe29a01ZZnnGRwU4oNkhTSXiahTf+iTe3PQaUYYMJSrEHuLt1/
 Nj8A==
X-Gm-Message-State: AOJu0Yzuj3uhXN6FXzRy64C9Eth8G50ntJ27+2zDCpXy8Y5igjwzwRa6
 KwMMJs6YPpSjrJlNcDcxnpL+v+PbTY5ZLg==
X-Google-Smtp-Source: AGHT+IEM28JGFJgSblwE01TMCY5IOPs2q7ULcy18jlUGEbCwU2EeR3pPl1aqM+v7CjnQUQO6/+4hNQ==
X-Received: by 2002:a17:90b:5150:b0:28b:bbf9:675a with SMTP id
 sd16-20020a17090b515000b0028bbbf9675amr4383967pjb.25.1705438739766; 
 Tue, 16 Jan 2024 12:58:59 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([152.234.123.64])
 by smtp.gmail.com with ESMTPSA id
 sh2-20020a17090b524200b0028df5c748e4sm11326949pjb.44.2024.01.16.12.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 12:58:59 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org, max.chou@sifive.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 11/13] target/riscv: change vext_get_vlmax() arguments
Date: Tue, 16 Jan 2024 17:58:15 -0300
Message-ID: <20240116205817.344178-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116205817.344178-1-dbarboza@ventanamicro.com>
References: <20240116205817.344178-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x102f.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

We'll re-use the logic froim vext_get_vlmax() in 2 other occurrences in
the next patch, but first we need to make it independent of both 'cpu'
and 'vtype'. To do that, add 'vlenb', 'vsew' and 'lmul' as parameters
instead.

Adapt the two existing callers. In cpu_get_tb_cpu_state(), rename 'sew'
to 'vsew' to be less ambiguous about what we're encoding into *pflags.

In HELPER(vsetvl) the following changes were made:

- add a 'vsew' var to store vsew. Use it in the shift to get 'sew';
- the existing 'lmul' var was renamed to 'vlmul';
- add a new 'lmul' var to store 'lmul' encoded like DisasContext:lmul.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.h           |  7 +++----
 target/riscv/cpu_helper.c    | 11 +++++++----
 target/riscv/vector_helper.c | 16 ++++++++++------
 3 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 3af61e0f94..9dcbc0649a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -688,11 +688,10 @@ static inline RISCVMXL riscv_cpu_sxl(CPURISCVState *env)
  *               = 256 >> 7
  *               = 2
  */
-static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
+static inline uint32_t vext_get_vlmax(uint32_t vlenb, uint32_t vsew,
+                                      int8_t lmul)
 {
-    uint8_t vsew = FIELD_EX64(vtype, VTYPE, VSEW);
-    int8_t lmul = sextract32(FIELD_EX64(vtype, VTYPE, VLMUL), 0, 3);
-    uint32_t vlen = cpu->cfg.vlenb << 3;
+    uint32_t vlen = vlenb << 3;
 
     /*
      * We need to use 'vlen' instead of 'vlenb' to
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index c7cc7eb423..8da9104da4 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -81,13 +81,16 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
          * which is not supported by GVEC. So we set vl_eq_vlmax flag to true
          * only when maxsz >= 8 bytes.
          */
-        uint32_t vlmax = vext_get_vlmax(cpu, env->vtype);
-        uint32_t sew = FIELD_EX64(env->vtype, VTYPE, VSEW);
-        uint32_t maxsz = vlmax << sew;
+
+        /* lmul encoded as in DisasContext::lmul */
+        int8_t lmul = sextract32(FIELD_EX64(env->vtype, VTYPE, VLMUL), 0, 3);
+        uint32_t vsew = FIELD_EX64(env->vtype, VTYPE, VSEW);
+        uint32_t vlmax = vext_get_vlmax(cpu->cfg.vlenb, vsew, lmul);
+        uint32_t maxsz = vlmax << vsew;
         bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl) &&
                            (maxsz >= 8);
         flags = FIELD_DP32(flags, TB_FLAGS, VILL, env->vill);
-        flags = FIELD_DP32(flags, TB_FLAGS, SEW, sew);
+        flags = FIELD_DP32(flags, TB_FLAGS, SEW, vsew);
         flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
                            FIELD_EX64(env->vtype, VTYPE, VLMUL));
         flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index b13be1541a..718a0c711a 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -35,16 +35,18 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
 {
     int vlmax, vl;
     RISCVCPU *cpu = env_archcpu(env);
-    uint64_t lmul = FIELD_EX64(s2, VTYPE, VLMUL);
-    uint16_t sew = 8 << FIELD_EX64(s2, VTYPE, VSEW);
+    uint64_t vlmul = FIELD_EX64(s2, VTYPE, VLMUL);
+    uint8_t vsew = FIELD_EX64(s2, VTYPE, VSEW);
+    uint16_t sew = 8 << vsew;
     uint8_t ediv = FIELD_EX64(s2, VTYPE, VEDIV);
     int xlen = riscv_cpu_xlen(env);
     bool vill = (s2 >> (xlen - 1)) & 0x1;
     target_ulong reserved = s2 &
                             MAKE_64BIT_MASK(R_VTYPE_RESERVED_SHIFT,
                                             xlen - 1 - R_VTYPE_RESERVED_SHIFT);
+    int8_t lmul;
 
-    if (lmul & 4) {
+    if (vlmul & 4) {
         /*
          * Fractional LMUL, check:
          *
@@ -53,8 +55,8 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
          * (vlenb << 3) >> (8 - lmul) >= sew
          * vlenb >> (8 - 3 - lmul) >= sew
          */
-        if (lmul == 4 ||
-            cpu->cfg.vlenb >> (8 - 3 - lmul) < sew) {
+        if (vlmul == 4 ||
+            cpu->cfg.vlenb >> (8 - 3 - vlmul) < sew) {
             vill = true;
         }
     }
@@ -68,7 +70,9 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
         return 0;
     }
 
-    vlmax = vext_get_vlmax(cpu, s2);
+    /* lmul encoded as in DisasContext::lmul */
+    lmul = sextract32(FIELD_EX64(s2, VTYPE, VLMUL), 0, 3);
+    vlmax = vext_get_vlmax(cpu->cfg.vlenb, vsew, lmul);
     if (s1 <= vlmax) {
         vl = s1;
     } else {
-- 
2.43.0


