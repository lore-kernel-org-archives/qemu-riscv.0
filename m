Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dRF-0001YT-4D
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dRD-0001UR-HB
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:47:55 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:34384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dRA-0007jz-8S
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:47:55 -0400
Received: by mail-pj1-x102a.google.com with SMTP id c10so4558617pjn.1
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rbR7gWz7NB+oHD2ItrhPcWL3qhV01Hqh8WuvfbYuDMM=;
 b=N8WfztLktFrSDzG+FP9aNA49F3AJd8FMxthufRfNjvDnv9e5e72Si+pGDkk5P2ywS5
 8WBjTsT4S5PIfOMGDXxkS7Dk0DtCzrKViwxgYowiWoIor2SURRd4OdietLrEpnvHZIg+
 OESvP4PaGaTIll+fOyFAYN2oHF3WHuz4mCDBPwAuHovmOj5SzndjkDTx1Kp9bK8f2T+L
 A570QYAYq5R8W0VrRGz5F81IM2NFwKHA5eG5Pywy0BC1qjQR8EG9YnQEJ3TQNXN6xwW4
 sZ31IQ30cREwJrvOHvJ82kJv1D5HOZaRerTZ5X1Z1QrTVrbDbP0dajrC4wWb5bnbGKBn
 i9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rbR7gWz7NB+oHD2ItrhPcWL3qhV01Hqh8WuvfbYuDMM=;
 b=h65zUzRVhq6WjK3trIC2lXCmkqCpaNIEfqONeDqPLxqMe/yYBhF5f3DJxc9ncHJHoS
 R+krCkajfBOtaAgXS6Ap41mi7FhRdiSyZS1jUpyizveqf7VISatmDBrYey3H1UIcZ8PX
 WInejyKT6e63fknftfyzfipID50xqU3aP+ABO1H/KNhslUsMZ8/NFZ7Z87Q5z6f9NPDt
 wPLRUqfg33HG+llUtwyyW1npsucXS7ZoUZAWx67eUP8T9G0oOAdXPEIK94ZC0iJ5IvRo
 g596hWxj6MvTZJL+RVnGNvBxxD9/3BoU9k0NiBdyVXJYuzU9bfkIXCaxsQxf2yDnbmeZ
 ocxQ==
X-Gm-Message-State: AOAM5306yDd7VXHMR0src3ZgaUZ+DXz8j6yeBOJ12M/eWmKptoEN0gcL
 6WFwZLpHSYwENajjkI/RE94pGrM7vKU=
X-Google-Smtp-Source: ABdhPJwjpay4QK0QbbvTFa0Rj8aznBuQcwASvR7VD4wJXDkuKqdQ4/AyCu+TITEImdj1Pf0kskQQow==
X-Received: by 2002:a17:902:221:: with SMTP id
 30mr7470595plc.222.1596710870902; 
 Thu, 06 Aug 2020 03:47:50 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:47:50 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 12/71] target/riscv: rvv-1.0: add fractional LMUL
Date: Thu,  6 Aug 2020 18:46:09 +0800
Message-Id: <20200806104709.13235-13-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 06 Aug 2020 10:47:56 -0000

From: Frank Chang <frank.chang@sifive.com>

Introduce the concepts of fractional LMUL for RVV 1.0.
In RVV 1.0, LMUL bits are contiguous in vtype register.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h                      | 15 ++++++++-------
 target/riscv/insn_trans/trans_rvv.inc.c |  9 ++++++---
 target/riscv/translate.c                |  3 +++
 target/riscv/vector_helper.c            | 17 +++++++++++++++--
 4 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 08d2c10a024..d0f9a76ca01 100644
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
@@ -368,9 +368,10 @@ typedef RISCVCPU ArchCPU;
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
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index b529474403e..75aab0a50f9 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1653,7 +1653,8 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_v *a)
                              vreg_ofs(s, a->rs1),
                              MAXSZ(s), MAXSZ(s));
         } else {
-            uint32_t data = FIELD_DP32(0, VDATA, LMUL, s->lmul);
+            uint32_t data = 0;
+            data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
             static gen_helper_gvec_2_ptr * const fns[4] = {
                 gen_helper_vmv_v_v_b, gen_helper_vmv_v_v_h,
                 gen_helper_vmv_v_v_w, gen_helper_vmv_v_v_d,
@@ -1691,7 +1692,8 @@ static bool trans_vmv_v_x(DisasContext *s, arg_vmv_v_x *a)
             TCGv_i32 desc ;
             TCGv_i64 s1_i64 = tcg_temp_new_i64();
             TCGv_ptr dest = tcg_temp_new_ptr();
-            uint32_t data = FIELD_DP32(0, VDATA, LMUL, s->lmul);
+            uint32_t data = 0;
+            data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
             static gen_helper_vmv_vx * const fns[4] = {
                 gen_helper_vmv_v_x_b, gen_helper_vmv_v_x_h,
                 gen_helper_vmv_v_x_w, gen_helper_vmv_v_x_d,
@@ -1729,7 +1731,8 @@ static bool trans_vmv_v_i(DisasContext *s, arg_vmv_v_i *a)
             TCGv_i32 desc;
             TCGv_i64 s1;
             TCGv_ptr dest;
-            uint32_t data = FIELD_DP32(0, VDATA, LMUL, s->lmul);
+            uint32_t data = 0;
+            data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
             static gen_helper_vmv_vx * const fns[4] = {
                 gen_helper_vmv_v_x_b, gen_helper_vmv_v_x_h,
                 gen_helper_vmv_v_x_w, gen_helper_vmv_v_x_d,
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 7b6088677d4..24026f901d1 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -60,6 +60,7 @@ typedef struct DisasContext {
     /* vector extension */
     bool vill;
     uint8_t lmul;
+    float flmul;
     uint8_t sew;
     uint16_t vlen;
     bool vl_eq_vlmax;
@@ -852,6 +853,8 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);
     ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
     ctx->lmul = FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
+    ctx->flmul = (ctx->lmul < 4) ?
+                    (1 << ctx->lmul) : 1.0f / (1 << (8 - ctx->lmul));
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
 }
 
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index f42346cb9ca..4a4c18b8a96 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -86,9 +86,22 @@ static inline uint32_t vext_vm(uint32_t desc)
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
+    uint32_t lmul = FIELD_EX32(simd_data(desc), VDATA, LMUL);
+    return (int8_t)(lmul << 5) >> 5;
 }
 
 static uint32_t vext_wd(uint32_t desc)
-- 
2.17.1


