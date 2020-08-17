Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7at5-0002nm-0r
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7at3-0002jv-LB
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:53:01 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:41738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7at1-0005Kv-Jf
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:53:01 -0400
Received: by mail-pl1-x633.google.com with SMTP id f10so7160801plj.8
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XCP+3ppn5aAqD22KrZFun5u2gdcyvp6w5yDJwaePmVA=;
 b=FSMNQc8xRZeDGQ0Ax+Ungl2mZhdRkVc5RoMp/lwYi9b0ZFY0aNCZCc0w4Bs1HpmqER
 Mq74X8ivO8xIUAZ0oF8M4dvWgqqlXy0IeV8FqjkePF9MOxTxvvjU4proRim3zLJyp7Qh
 AroolFRY5mQgEGI2Vfgad/UfQwJQ6mbyXbPkdZhLBK/8GQeFCwML3fEUD4Zeft2YrqzC
 HfSprMu6Ydmqp0Oh5H5/xsOfO5Cd8LDiwYlbDWSehr9fg89ZJ0UsHxdDU+zdFbpu/qp0
 lN9DtTUp57vEXumvpg3l8/ZgYuAgKMUsu78Z/sRAtfYtAxmeycUauP98ievq6qWawx93
 liZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XCP+3ppn5aAqD22KrZFun5u2gdcyvp6w5yDJwaePmVA=;
 b=Eo8ITXo1H7qyIpE/wdftXPqkI2uIACOv0RjIhgXZ6Ebz1PD4Quatit9nNncUiTTlKY
 uxvfDwfsQgbzK3JBSqWc1zmnLT7ut+feg1pgZ8kSlu+iIOB+TscoeUl5pfRh+KwGL0CG
 9qRZ0GV5qgkEdCsDf6u9zTJPvS38tQje24XBH34JS/VYpbJ2IEZuC8AfAhc0IEYmckEf
 pn/etcJcGVo1tmtrJXXfheer3oAyF+k3vRGwltY1s+Pdj2dTJ/Ikd2cFvs0IAA0kDol0
 WFIh26iUF+i0Z7ikGpNfUbXk1oDtflu6e5+Mbuk//Cn/1GwJ0ei5tzgjIxkMfEY+1lzi
 XyPg==
X-Gm-Message-State: AOAM5333jRjmCuQVMZsIomY7WWr79+1ICQA1ocmYB5IiTHi0BOvwxn4S
 XfMFv0O1uHzG0eHTmMlWovYYUQ==
X-Google-Smtp-Source: ABdhPJyJ9KyMowJaeFFkEUCpT/lsP/HKMDbKE/s98Zs9f5usTRD0HS3kInaQPSeMSA7dFMkhBJ1EMw==
X-Received: by 2002:a17:90a:4fe2:: with SMTP id
 q89mr12436241pjh.70.1597654378255; 
 Mon, 17 Aug 2020 01:52:58 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:52:57 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 62/70] target/riscv: introduce floating-point rounding mode
 enum
Date: Mon, 17 Aug 2020 16:49:47 +0800
Message-Id: <20200817084955.28793-63-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x633.google.com
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
X-List-Received-Date: Mon, 17 Aug 2020 08:53:02 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/fpu_helper.c               | 12 ++++++------
 target/riscv/insn_trans/trans_rvv.inc.c | 18 +++++++++---------
 target/riscv/internals.h                |  9 +++++++++
 3 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index bb346a82499..92e076c6ed8 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -55,23 +55,23 @@ void helper_set_rounding_mode(CPURISCVState *env, uint32_t rm)
 {
     int softrm;
 
-    if (rm == 7) {
+    if (rm == FRM_DYN) {
         rm = env->frm;
     }
     switch (rm) {
-    case 0:
+    case FRM_RNE:
         softrm = float_round_nearest_even;
         break;
-    case 1:
+    case FRM_RTZ:
         softrm = float_round_to_zero;
         break;
-    case 2:
+    case FRM_RDN:
         softrm = float_round_down;
         break;
-    case 3:
+    case FRM_RUP:
         softrm = float_round_up;
         break;
-    case 4:
+    case FRM_RMM:
         softrm = float_round_ties_away;
         break;
     default:
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 4f33c42990e..c148ed40c9f 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2430,7 +2430,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
             gen_helper_##NAME##_d,                                 \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, FRM_DYN);                                    \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2510,7 +2510,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)            \
             gen_helper_##NAME##_w,                                \
             gen_helper_##NAME##_d,                                \
         };                                                        \
-        gen_set_rm(s, 7);                                         \
+        gen_set_rm(s, FRM_DYN);                                   \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);            \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,           \
@@ -2542,7 +2542,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
             gen_helper_##NAME##_h, gen_helper_##NAME##_w,        \
         };                                                       \
         TCGLabel *over = gen_new_label();                        \
-        gen_set_rm(s, 7);                                        \
+        gen_set_rm(s, FRM_DYN);                                  \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);        \
                                                                  \
         data = FIELD_DP32(data, VDATA, VM, a->vm);               \
@@ -2578,7 +2578,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
         static gen_helper_opfvf *const fns[2] = {                \
             gen_helper_##NAME##_h, gen_helper_##NAME##_w,        \
         };                                                       \
-        gen_set_rm(s, 7);                                        \
+        gen_set_rm(s, FRM_DYN);                                  \
         data = FIELD_DP32(data, VDATA, VM, a->vm);               \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
@@ -2608,7 +2608,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
             gen_helper_##NAME##_h, gen_helper_##NAME##_w,          \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, FRM_DYN);                                    \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2644,7 +2644,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
         static gen_helper_opfvf *const fns[2] = {                \
             gen_helper_##NAME##_h, gen_helper_##NAME##_w,        \
         };                                                       \
-        gen_set_rm(s, 7);                                        \
+        gen_set_rm(s, FRM_DYN);                                  \
         data = FIELD_DP32(data, VDATA, VM, a->vm);               \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
@@ -2721,7 +2721,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
             gen_helper_##NAME##_d,                                 \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, FRM_DYN);                                        \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2862,7 +2862,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
             gen_helper_##NAME##_w,                                 \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, FRM_DYN);                                        \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2908,7 +2908,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
             gen_helper_##NAME##_w,                                 \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, FRM_DYN);                                    \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index bca48297dab..d9ea6a32188 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -37,6 +37,15 @@ target_ulong fclass_d(uint64_t frs1);
 #define SEW32 2
 #define SEW64 3
 
+enum {
+    FRM_RNE = 0,    /* Round to Nearest, ties to Even */
+    FRM_RTZ = 1,    /* Round towards Zero */
+    FRM_RDN = 2,    /* Round Down */
+    FRM_RUP = 3,    /* Round Up */
+    FRM_RMM = 4,    /* Round to Nearest, ties to Max Magnitude */
+    FRM_DYN = 7,    /* Dynamic rounding mode */
+};
+
 static inline uint64_t nanbox_s(float32 f)
 {
     return f | MAKE_64BIT_MASK(32, 32);
-- 
2.17.1


