Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKwq-0003Gr-US
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKwo-0003F3-Qm
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:05:58 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:40837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKwm-0001xe-TG
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:05:58 -0400
Received: by mail-pf1-x442.google.com with SMTP id x123so5518667pfc.7
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=o7vlQsV0PBwUQL8MS7m+vgkNdBFVpF7naUi2966qi54=;
 b=lUCkY2VHVdlP3pkXl4eTluUjUsD4DwJPK8acCxVB5JU4SVmoSSmu2xQ7N2K07vZ+2b
 BVitQsYTCekRLJ1JVOPH/BCNRrgYHfAHAWNHRqmWwjpF4sHr1vY5aOK28i0kJY2B+vCo
 /YVsttNH1hwnstcAhgCnpKT3F7jrPrUTBeTVgM68ESCmVFAbRKxgEcQ2zI2592qn+5uh
 6UGaVg1jXVLsA+QHDAWDTCy16sTGedFUmFs/fc6qQ0Sw/4C/mutV/PdWsep3sIulAaKt
 F3VzNKoxK1+m45iNZ5v8155/FqYHqr/k5+a4vbCOQiUpD9jF+tLsEHzhw27CNeMcGlGE
 M8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=o7vlQsV0PBwUQL8MS7m+vgkNdBFVpF7naUi2966qi54=;
 b=GKmdScVuW3R096QPVwEuYgUKkxOdSQE4+yoHs90EIZaJVj6CNQPEDTqyU1c7iiW6jT
 E39wz93HuJyu8u9Sq+67jFzJLkg3qAOQ2iH5nl6oix3keDRWoijTThGssUKfB3YDH7RY
 AtajLtYunCzSksr83wBQelvgIbj/WXToWeu8pH3i537uOBvYRwAhWVAoNOhSOgTx+y6V
 fCYNjrTCX1nZKrFcAX7VaFQsVxTfTa9xb8ZyKwpROTr1y8UgKIW0Me9ZgnrQUN6FfBk9
 UYgKESI2vbjqE/oq0BSYQ4BMZgJHNycwOQZtj6ZuDWimIEWOlDdRBa8+I0Q7alBefWVn
 aX+A==
X-Gm-Message-State: AOAM5336wZiBNqYVMRP3S69u5QFWJwvzDf0qIVqWvMbILGD4DtMjSAx1
 jp6lccHeVKu0AVrbpZZOpQZ6xw==
X-Google-Smtp-Source: ABdhPJyEMzPNa5XbiqwED0D8TkxYLKWQnookYjS6hYbcCmK8ZhNa5eFYtibr6teeBIhcVZZ6DWOJnA==
X-Received: by 2002:a63:b64a:: with SMTP id v10mr4179460pgt.192.1601406354143; 
 Tue, 29 Sep 2020 12:05:54 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:05:53 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v5 12/68] target/riscv: rvv-1.0: add fractional LMUL
Date: Wed, 30 Sep 2020 03:03:47 +0800
Message-Id: <20200929190448.31116-13-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Tue, 29 Sep 2020 19:05:59 -0000

From: Frank Chang <frank.chang@sifive.com>

Introduce the concepts of fractional LMUL for RVV 1.0.
In RVV 1.0, LMUL bits are contiguous in vtype register.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h           | 15 ++++++++-------
 target/riscv/translate.c     | 16 ++++++++++++++--
 target/riscv/vector_helper.c | 16 ++++++++++++++--
 3 files changed, 36 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f5ce26e515..2f433700ec 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -94,10 +94,10 @@ typedef struct CPURISCVState CPURISCVState;
 
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
@@ -374,9 +374,10 @@ typedef RISCVCPU ArchCPU;
 #include "exec/cpu-all.h"
 
 FIELD(TB_FLAGS, VL_EQ_VLMAX, 2, 1)
-FIELD(TB_FLAGS, LMUL, 3, 2)
-FIELD(TB_FLAGS, SEW, 5, 3)
-FIELD(TB_FLAGS, VILL, 8, 1)
+FIELD(TB_FLAGS, LMUL, 3, 3)
+FIELD(TB_FLAGS, SEW, 6, 3)
+/* Skip MSTATUS_VS (0x600) fields */
+FIELD(TB_FLAGS, VILL, 11, 1)
 
 /*
  * A simplification for VLMAX
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index df9317ffdb..b54952c688 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -59,7 +59,19 @@ typedef struct DisasContext {
     bool ext_ifencei;
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
@@ -841,7 +853,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->vlen = cpu->cfg.vlen;
     ctx->vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);
     ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
-    ctx->lmul = FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
+    ctx->lmul = sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3);
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
 }
 
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 12301e943e..aa8348ea25 100644
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


