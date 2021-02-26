Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTg9-0006vE-0y
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:20:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTg3-0006rw-2I
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:20:29 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:54745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTfv-0000oI-OA
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:20:25 -0500
Received: by mail-pj1-x1033.google.com with SMTP id i14so3561386pjz.4
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=S6xkQfRd6vUSxqxVLXftVFLAZqRmy4HsvooD2JMQJkM=;
 b=d6HEWVxkYflth2qZk8cEma4j2QOqOxF1w5MUvwNYGd3MTGm/GZ2u5k0ZsPs3gawENZ
 VVcz0okBYksjNa40KgKrAcISXLLDaEb3BAlZnmDLeDyhTaWx1IY/a5PdxsaLPRjuehNK
 W6BMVxi2M0h5bhihDmK/qHe2ldVk8dL0wyvAAq/iLXcuRFIA6wDII6aTOks8+MJrQHoq
 7H7lrSbLuIzH1+OmJLWqL3h7OPXJ53Tqb03TF+isbIY6pqTyo43DdI/O4+YM+znsCMvS
 wozfpslIunFIhqOqPQ5gwa/yBg31iBFU2Dsaz+gn8lD0Gy9hDr73v/DSsuTOFyTjOkRD
 pknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=S6xkQfRd6vUSxqxVLXftVFLAZqRmy4HsvooD2JMQJkM=;
 b=lN7rfrakEEczXLMXJAFcjO6+cidBUMbb3ArEF3L2u/zTYlkIFqG4y8+PapzFgzcpTw
 pBtxY30OFYeWBty45zDLbddaK8S2mgp48Z4vH63k8mqbuuWfs+6Ex1mjQFYf4BxpwcXt
 ia2U53Xk/OcBvRBz6gyyln1QhARgH8vxHOGfMpaPuhAyg5PnNx/PeiL3fPyhnxSs3Mll
 S2JqUSjkSQNmJTTQEWpWCmWrRCaDTj2PGefyE8dhvNpxmhzo0U6c8rP1xsmbZkPbIIrI
 Y/iGaFQDRMxukIK2jsm0bq6pgUmvSsL08F/8zCwLxE0ei+n2ATiZroEb07BaWvXti580
 Xx+A==
X-Gm-Message-State: AOAM531AsEMihAQXd2fReFFIzs9KfBb6r/AtuReAN9V9aB3inZjT0DEn
 EBO28O0YEkiq3OtbrpB1rJSoYQ==
X-Google-Smtp-Source: ABdhPJxAU7iyWHdo3w/+tJ8gyw68m0fSLfHGD0d2bJICs7EAGlosvlgSCvIoxemTbx7htAli4c6tQQ==
X-Received: by 2002:a17:90a:c588:: with SMTP id
 l8mr1180018pjt.120.1614309618442; 
 Thu, 25 Feb 2021 19:20:18 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:20:18 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v7 12/75] target/riscv: rvv-1.0: add fractional LMUL
Date: Fri, 26 Feb 2021 11:17:56 +0800
Message-Id: <20210226031902.23656-13-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 26 Feb 2021 03:20:29 -0000

From: Frank Chang <frank.chang@sifive.com>

Introduce the concepts of fractional LMUL for RVV 1.0.
In RVV 1.0, LMUL bits are contiguous in vtype register.

Also rearrange rvv bits in TB_FLAGS to skip MSTATUS_VS (0x600)
and MSTATUS_FS (0x6000) bits.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h           | 18 ++++++++++--------
 target/riscv/translate.c     | 16 ++++++++++++++--
 target/riscv/vector_helper.c | 16 ++++++++++++++--
 3 files changed, 38 insertions(+), 12 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 2c1e6c46a2d..0ba330e613d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -105,10 +105,10 @@ typedef struct CPURISCVState CPURISCVState;
 
 #define RV_VLEN_MAX 256
 
-FIELD(VTYPE, VLMUL, 0, 2)
-FIELD(VTYPE, VSEW, 2, 3)
-FIELD(VTYPE, VEDIV, 5, 2)
-FIELD(VTYPE, RESERVED, 7, sizeof(target_ulong) * 8 - 9)
+FIELD(VTYPE, VLMUL, 0, 3)
+FIELD(VTYPE, VSEW, 3, 3)
+FIELD(VTYPE, VEDIV, 8, 2)
+FIELD(VTYPE, RESERVED, 10, sizeof(target_ulong) * 8 - 11)
 FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
 
 struct CPURISCVState {
@@ -381,12 +381,14 @@ typedef RISCVCPU ArchCPU;
 #include "exec/cpu-all.h"
 
 FIELD(TB_FLAGS, MEM_IDX, 0, 3)
-FIELD(TB_FLAGS, VL_EQ_VLMAX, 3, 1)
-FIELD(TB_FLAGS, LMUL, 4, 2)
+FIELD(TB_FLAGS, LMUL, 3, 3)
 FIELD(TB_FLAGS, SEW, 6, 3)
-FIELD(TB_FLAGS, VILL, 9, 1)
+/* Skip MSTATUS_VS (0x600) bits */
+FIELD(TB_FLAGS, VL_EQ_VLMAX, 11, 1)
+FIELD(TB_FLAGS, VILL, 12, 1)
+/* Skip MSTATUS_FS (0x6000) bits */
 /* Is a Hypervisor instruction load/store allowed? */
-FIELD(TB_FLAGS, HLSX, 10, 1)
+FIELD(TB_FLAGS, HLSX, 15, 1)
 
 bool riscv_cpu_is_32bit(CPURISCVState *env);
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6e1896188c0..75ed94c802b 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -60,7 +60,19 @@ typedef struct DisasContext {
     bool hlsx;
     /* vector extension */
     bool vill;
-    uint8_t lmul;
+    /*
+     * Encode LMUL to lmul as follows:
+     *     LMUL    vlmul    lmul
+     *      1       000       0
+     *      2       001       1
+     *      4       010       2
+     *      8       011       3
+     *      -       100       -
+     *     1/8      101      -3
+     *     1/4      110      -2
+     *     1/2      111      -1
+     */
+    int8_t lmul;
     uint8_t sew;
     uint16_t vlen;
     bool vl_eq_vlmax;
@@ -853,7 +865,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
     ctx->vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);
     ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
-    ctx->lmul = FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
+    ctx->lmul = sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3);
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
     ctx->cs = cs;
 }
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 12301e943e6..aa8348ea25a 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -86,9 +86,21 @@ static inline uint32_t vext_vm(uint32_t desc)
     return FIELD_EX32(simd_data(desc), VDATA, VM);
 }
 
-static inline uint32_t vext_lmul(uint32_t desc)
+/*
+ * Encode LMUL to lmul as following:
+ *     LMUL    vlmul    lmul
+ *      1       000       0
+ *      2       001       1
+ *      4       010       2
+ *      8       011       3
+ *      -       100       -
+ *     1/8      101      -3
+ *     1/4      110      -2
+ *     1/2      111      -1
+ */
+static inline int32_t vext_lmul(uint32_t desc)
 {
-    return FIELD_EX32(simd_data(desc), VDATA, LMUL);
+    return sextract32(FIELD_EX32(simd_data(desc), VDATA, LMUL), 0, 3);
 }
 
 static uint32_t vext_wd(uint32_t desc)
-- 
2.17.1


