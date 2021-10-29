Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNlx-0006Ja-4i
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:02:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNli-0006AK-Fv
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:01:46 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:34401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNle-00064F-Gh
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:01:44 -0400
Received: by mail-pf1-x42a.google.com with SMTP id 127so8692818pfu.1
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WTi3I8mZ2w3zyxnQNPXa8ChcIPv5QKyCZqVuG62zE8E=;
 b=d/o2z6J8x/jqxmFN1fsRwY8flEk6O8aKTZQs9C+RXc4M2YvvaV3jqDIAU4mP/aRjDC
 ZeVEVDdq2AvNUZ0kpty3JYxhbDYRXNuf7E6LxRVfaRIk1rS8OoNp0/c8XV04vljMa0Ra
 SB4++rNyOI5NJyhRHqt+2cs7BPTNige4UjQqMlsmWt+ffoonzNYzkxaScX1VEFUyUxY/
 ZLSlrEjUCJwvy4PItF7wXBrH+pcDaC4Avkv8Pk6u2Hwl20NHcp/p86wfx3wLNddlajvM
 OwlSLL6d0xINj0Nu8hFVUipD/YEOsdn3kZSM91OzfSGJcxb8lz7FXXHzhiL8+uUUHNCm
 Qy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WTi3I8mZ2w3zyxnQNPXa8ChcIPv5QKyCZqVuG62zE8E=;
 b=i/Y3ev30xKFblH13X69jxtO98uwIk98W0tbhadT4KAJk6nkjziwmYXAn/PPg2xJ8O+
 3pa65IBaJr1XLhiOiAhgdCoZM/DTUpe/H0zWZ4DrGV9Ew/e48rDs3MnM3k5Df7jL7mf+
 sehzbTC0c9gFheVbFXHYPdS+SGKd0bkbdRvJqmv2+Zc3x5M58zHc8l/dctoAJ/xqKZsU
 tX89euda3BCS0RZCdv+vU3NhWGmG92qpFPRuV3i4UpHMkgbQwA1raV1ohn72NIcaAabk
 VUsWZLsITeqwAdDtPve1G4NuZ641t+0eVDV474LkMnAN0zWfSWkm06CwV0AP7ffLi4V0
 sp4g==
X-Gm-Message-State: AOAM530g32oVS9c8wK7+KzijBOc/OV2S0YEagcNUTcDjURPkPllFh5dD
 WB3OruBhenTP/MC5hIqKrPEa9WwGuItssAgQ
X-Google-Smtp-Source: ABdhPJwpjhKI9VTDSDFxi9efy5PlQvtrz4S9pzYBjUqf5dX/PsHa3dVYK4vdliHj8mdEa9jxXwLg0Q==
X-Received: by 2002:a65:5082:: with SMTP id r2mr7183751pgp.353.1635498100920; 
 Fri, 29 Oct 2021 02:01:40 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:01:40 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v9 34/76] target/riscv: rvv-1.0: allow load element with
 sign-extended
Date: Fri, 29 Oct 2021 16:58:39 +0800
Message-Id: <20211029085922.255197-35-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Fri, 29 Oct 2021 09:01:47 -0000

From: Frank Chang <frank.chang@sifive.com>

For some vector instructions (e.g. vmv.s.x), the element is loaded with
sign-extended.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 32 +++++++++++++++++--------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 80cbf0cadb8..4207cc4e6b8 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2825,17 +2825,29 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
 /* Integer Extract Instruction */
 
 static void load_element(TCGv_i64 dest, TCGv_ptr base,
-                         int ofs, int sew)
+                         int ofs, int sew, bool sign)
 {
     switch (sew) {
     case MO_8:
-        tcg_gen_ld8u_i64(dest, base, ofs);
+        if (!sign) {
+            tcg_gen_ld8u_i64(dest, base, ofs);
+        } else {
+            tcg_gen_ld8s_i64(dest, base, ofs);
+        }
         break;
     case MO_16:
-        tcg_gen_ld16u_i64(dest, base, ofs);
+        if (!sign) {
+            tcg_gen_ld16u_i64(dest, base, ofs);
+        } else {
+            tcg_gen_ld16s_i64(dest, base, ofs);
+        }
         break;
     case MO_32:
-        tcg_gen_ld32u_i64(dest, base, ofs);
+        if (!sign) {
+            tcg_gen_ld32u_i64(dest, base, ofs);
+        } else {
+            tcg_gen_ld32s_i64(dest, base, ofs);
+        }
         break;
     case MO_64:
         tcg_gen_ld_i64(dest, base, ofs);
@@ -2890,7 +2902,7 @@ static void vec_element_loadx(DisasContext *s, TCGv_i64 dest,
 
     /* Perform the load. */
     load_element(dest, base,
-                 vreg_ofs(s, vreg), s->sew);
+                 vreg_ofs(s, vreg), s->sew, false);
     tcg_temp_free_ptr(base);
     tcg_temp_free_i32(ofs);
 
@@ -2906,9 +2918,9 @@ static void vec_element_loadx(DisasContext *s, TCGv_i64 dest,
 }
 
 static void vec_element_loadi(DisasContext *s, TCGv_i64 dest,
-                              int vreg, int idx)
+                              int vreg, int idx, bool sign)
 {
-    load_element(dest, cpu_env, endian_ofs(s, vreg, idx), s->sew);
+    load_element(dest, cpu_env, endian_ofs(s, vreg, idx), s->sew, sign);
 }
 
 static bool trans_vext_x_v(DisasContext *s, arg_r *a)
@@ -2918,7 +2930,7 @@ static bool trans_vext_x_v(DisasContext *s, arg_r *a)
 
     if (a->rs1 == 0) {
         /* Special case vmv.x.s rd, vs2. */
-        vec_element_loadi(s, tmp, a->rs2, 0);
+        vec_element_loadi(s, tmp, a->rs2, 0, false);
     } else {
         /* This instruction ignores LMUL and vector register groups */
         int vlmax = s->vlen >> (3 + s->sew);
@@ -3000,7 +3012,7 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
         (s->mstatus_fs != 0) && (s->sew != 0)) {
         unsigned int len = 8 << s->sew;
 
-        vec_element_loadi(s, cpu_fpr[a->rd], a->rs2, 0);
+        vec_element_loadi(s, cpu_fpr[a->rd], a->rs2, 0, false);
         if (len < 64) {
             tcg_gen_ori_i64(cpu_fpr[a->rd], cpu_fpr[a->rd],
                             MAKE_64BIT_MASK(len, 64 - len));
@@ -3102,7 +3114,7 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmrr *a)
         TCGv_i64 dest = tcg_temp_new_i64();
 
         if (a->rs1 == 0) {
-            vec_element_loadi(s, dest, a->rs2, 0);
+            vec_element_loadi(s, dest, a->rs2, 0, false);
         } else {
             vec_element_loadx(s, dest, a->rs2, cpu_gpr[a->rs1], vlmax);
         }
-- 
2.25.1


