Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dTJ-0004mt-T9
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:50:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dTI-0004ja-KE
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:50:04 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:37551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dTA-00085i-WD
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:50:02 -0400
Received: by mail-pj1-x1032.google.com with SMTP id mw10so2579541pjb.2
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CfR5gqnbuZvx3agqnFYUiGRSuq+omKLC4snEt+MZPog=;
 b=ibU8Ahwo7QWfC+OLbvUs+iKrTeX3GSM2tvNo6xACasLX9pQqjS+BlyExCtOByXYU8b
 0xwsD5hiqs7u7IqCykqrQu868SNb5v6CY0PBTXepypivGdb34jw+Pm+2xA1donRy8ens
 E8EwXLEum4WOnaGGYw+FqnfnfOrK4SqJWgZDyi7ToGjVKMOaKiOrOPFKUSKWCxmYKrzY
 iGF6QZxK8c6U64muxwo0PfF4gR9t4j8vH03e6lA3AcqqIsWbzuKoIEgYKof3dkPjZ0QW
 l2i1Rmpcpq6GGiUMY04tvqXjB48+SOt2dHS7NBaNuWSQQGO0NioWl1dMOUD2b2L/gwT1
 ItMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CfR5gqnbuZvx3agqnFYUiGRSuq+omKLC4snEt+MZPog=;
 b=nE1hSt+FXjuxJFe3vgH+ZteHjSlOKNDRkOgCh8XcWTjATm+hF6CNABzofxNPNcX1sn
 //jrdi8NY2Ascxz+sqjH5/wOmKkDgmDIHVeRexMY1U1RC3DPeLBUeofaqrKQl/KfX19f
 JWVC/dw3AgQCgUsC0EaZ0RgAodi9QHfgaU7n7hDYpuhIZdmImvefRe1pl3lG23iRI/mk
 Oocj0IK4QiFejENPEnT9DHOazzHC5RHyz3Y41M4qHbpEMiiqd3a5oemuWGwe6T6nPT6C
 RqgYv5F9bvxRJUtUfpWsh5yeHXmfKlRUzfiWq+CG58VuJPHYLBImiv2GkXLxE3S+xQPl
 PKwA==
X-Gm-Message-State: AOAM531UqfnL6OVIlzZSJ6aQq5cNSwT8RL6apy0W+yRJDe5l3Tkih4Iz
 ZsHwPpXPjVndCnsyFDJDUJ6/Cw==
X-Google-Smtp-Source: ABdhPJxEbENLnWwqOTdT89aJrZJe1qC4jEyaIzb8ajHjpHohtWHrdjkN8Xx3aaaYApLkJ2o72AJytA==
X-Received: by 2002:a17:90a:87:: with SMTP id a7mr7255925pja.14.1596710995851; 
 Thu, 06 Aug 2020 03:49:55 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:49:55 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 64/71] target/riscv: introduce floating-point rounding mode
 enum
Date: Thu,  6 Aug 2020 18:47:01 +0800
Message-Id: <20200806104709.13235-65-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1032.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 06 Aug 2020 10:50:05 -0000

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
index f2bd3972558..6cdb1659b59 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2418,7 +2418,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
             gen_helper_##NAME##_d,                                 \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, FRM_DYN);                                    \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2498,7 +2498,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)            \
             gen_helper_##NAME##_w,                                \
             gen_helper_##NAME##_d,                                \
         };                                                        \
-        gen_set_rm(s, 7);                                         \
+        gen_set_rm(s, FRM_DYN);                                   \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);            \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,           \
@@ -2530,7 +2530,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
             gen_helper_##NAME##_h, gen_helper_##NAME##_w,        \
         };                                                       \
         TCGLabel *over = gen_new_label();                        \
-        gen_set_rm(s, 7);                                        \
+        gen_set_rm(s, FRM_DYN);                                  \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);        \
                                                                  \
         data = FIELD_DP32(data, VDATA, VM, a->vm);               \
@@ -2566,7 +2566,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
         static gen_helper_opfvf *const fns[2] = {                \
             gen_helper_##NAME##_h, gen_helper_##NAME##_w,        \
         };                                                       \
-        gen_set_rm(s, 7);                                        \
+        gen_set_rm(s, FRM_DYN);                                  \
         data = FIELD_DP32(data, VDATA, VM, a->vm);               \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
@@ -2596,7 +2596,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
             gen_helper_##NAME##_h, gen_helper_##NAME##_w,          \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, FRM_DYN);                                    \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2632,7 +2632,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
         static gen_helper_opfvf *const fns[2] = {                \
             gen_helper_##NAME##_h, gen_helper_##NAME##_w,        \
         };                                                       \
-        gen_set_rm(s, 7);                                        \
+        gen_set_rm(s, FRM_DYN);                                  \
         data = FIELD_DP32(data, VDATA, VM, a->vm);               \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
@@ -2709,7 +2709,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
             gen_helper_##NAME##_d,                                 \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, FRM_DYN);                                        \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2850,7 +2850,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
             gen_helper_##NAME##_w,                                 \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, FRM_DYN);                                        \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
@@ -2896,7 +2896,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
             gen_helper_##NAME##_w,                                 \
         };                                                         \
         TCGLabel *over = gen_new_label();                          \
-        gen_set_rm(s, 7);                                          \
+        gen_set_rm(s, FRM_DYN);                                    \
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
                                                                    \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 4fb683a7399..97f023361a9 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -38,6 +38,15 @@ target_ulong fclass_d(uint64_t frs1);
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


