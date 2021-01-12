Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGAa-0003T9-9k
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:40:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGAT-0003Q1-4K
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:40:49 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:42269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGAQ-0007J1-Ej
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:40:48 -0500
Received: by mail-pf1-x42a.google.com with SMTP id h10so1051826pfo.9
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=AImtaI1XpU/izzOLPjkNcy0w+CEH9VQf4je2sAF5hjc=;
 b=cYBMynh6Btr7DczCZmA+XG+cwuYwjJ8OzN5PQu34WdfEl9R6s7SJuHFO9JAcTP/AHy
 VFn8gz0VKz7KqYCi2TH+kcgIstYS5KHsSkxdKSbkgSMyzQ1yqer4hW8hNsEVpy9tofr/
 MU78EbzATMtvqU1gKhqb2ZR7Q5GaHbxmxiV+DfU1KJGqonL0nesMXlScKr5GG8+E5TFq
 gKsZPCGnSu0KnB3PcHJkQc8saMuyosxtkNvjjyVspWPxF/RlEXXwOn0qRXObXWBsbaG+
 8jmD/76laSbsPFITmd40FMWgVFGg8emElrL98qZXew/7yiyJxjhpd2e0vG495vO8RIan
 MfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=AImtaI1XpU/izzOLPjkNcy0w+CEH9VQf4je2sAF5hjc=;
 b=HqGrjI8cJdKQ/Q0+klMLpu452y/fcIhR2LQavSdoZRZ5dh/xRwyQYWEC8W6/jvtSgA
 Lumt/X7t90WaIFhF11hgDBtS1cnykiTxKVHOSaN8EfOGRbojGZyJ/tFpzwM9ZmRFpyNS
 JnJYGbmj4QL7bxYMKPQPSmSnPDJprCYVdDGUQ7BfiCAYGsqYk6BryYDpBmTvzzVFOHFy
 aObQMyQkH3XHpV30iAPC43x5Sv7wlaLiplD+NiDbFuuSr6f69WF4zsVF5JekBNdfKiNO
 C5E5jXOudyoHSHVbV8ri/3/liGO9c+7aWgcCriw+tznpw1COC2/D8wqWZ57a1Kho8/AL
 i8GQ==
X-Gm-Message-State: AOAM531m2peals1DHDikMt6kWOUJpk8WbP80dMcnt2mC4VWru6DAOm6i
 pq1eGoG1LhmXwQDlQsUTSOU3+A==
X-Google-Smtp-Source: ABdhPJw+JEHs9lwoEdvsDSIN5gA8o3HdkL5AgDQhf/K4gZBxyAs7weSIvUMqrCRsxzcKisWCZh74cA==
X-Received: by 2002:a63:4f04:: with SMTP id d4mr3920355pgb.225.1610444445096; 
 Tue, 12 Jan 2021 01:40:45 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:40:44 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v6 12/72] target/riscv: rvv-1.0: add fractional LMUL
Date: Tue, 12 Jan 2021 17:38:46 +0800
Message-Id: <20210112093950.17530-13-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42a.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 09:40:49 -0000

From: Frank Chang <frank.chang@sifive.com>

Introduce the concepts of fractional LMUL for RVV 1.0.
In RVV 1.0, LMUL bits are contiguous in vtype register.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h           | 17 +++++++++--------
 target/riscv/translate.c     | 16 ++++++++++++++--
 target/riscv/vector_helper.c | 16 ++++++++++++++--
 3 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index cd5c77114a4..3b985f6218d 100644
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
@@ -380,11 +380,12 @@ typedef RISCVCPU ArchCPU;
 #include "exec/cpu-all.h"
 
 FIELD(TB_FLAGS, VL_EQ_VLMAX, 2, 1)
-FIELD(TB_FLAGS, LMUL, 3, 2)
-FIELD(TB_FLAGS, SEW, 5, 3)
-FIELD(TB_FLAGS, VILL, 8, 1)
+FIELD(TB_FLAGS, LMUL, 3, 3)
+FIELD(TB_FLAGS, SEW, 6, 3)
+/* Skip MSTATUS_VS (0x600) fields */
+FIELD(TB_FLAGS, VILL, 11, 1)
 /* Is a Hypervisor instruction load/store allowed? */
-FIELD(TB_FLAGS, HLSX, 9, 1)
+FIELD(TB_FLAGS, HLSX, 12, 1)
 
 bool riscv_cpu_is_32bit(CPURISCVState *env);
 
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 18e198bf8a6..d9b3b37f698 100644
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
@@ -843,7 +855,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
     ctx->vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);
     ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
-    ctx->lmul = FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
+    ctx->lmul = sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3);
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
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


