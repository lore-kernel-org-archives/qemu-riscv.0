Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHxk-0000fT-Cq
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxc-0000aJ-S6
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:49:00 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:38485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxa-0003i2-Qp
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:49:00 -0400
Received: by mail-pg1-x530.google.com with SMTP id e65so5462007pgc.5
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jUYCjBb813bVniRs97243ht1jTQgrvPcs1XgjQ8AQd0=;
 b=dGzW0RQRKQcMa4j+sShE6Yx3HsSSpzz/3nUI27GRuBRJl+7YrEwmmqTd3cABt/7R/n
 Mcy8tYozf0ZQnwaFVlifoBwH4p6HMPkZQPJ9Bm0wRVKDX3Ot+A2icJPB8JaFUoIrq0eg
 Ur1R1/XWIXnTn/bmng+IiDj5GqaXXgoxW7EAsFSXdK+JjdB3XF6Eqojt35G/ZFsIAgcz
 0r9R4QMor2cGccEWk54V2oKKjbSYdi6Zued6pRs4grk3cps7q5Vo0KX1ujjql27FjX3k
 mQpV0woIq4iFz5NMCPWW7sx89Smi8XSNTNJ+4p1+lW6cvJIMyb9vYrrgvjT4jrZyT/5p
 sJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jUYCjBb813bVniRs97243ht1jTQgrvPcs1XgjQ8AQd0=;
 b=2lMvjt7ldJlkj6yn6Qw3W2q8V/3+9wnpoEvvPLBX2mzTkLAd/+lXIXhbsQPolNOL6V
 DBGxhQRdijOYzfM0l/sfC93DncCU6JZtEPwhrz2n+dqpRNE+uCTEBeT9TLYnZizFriEf
 HtGZFG0AhT7dAHLAUw6o/uD1wTg51PakdlGw3bcFJwDeNdgNa0vrjjTENnalevc2lFli
 s3Wvc8QsUg8yUXlFKLbj0z6tkA1ORF307cqUljhDKgHseNqjpvDs9I1Xu3sEsSjq+Lhq
 w0tQq2BF/54xGbunAB0NuBwJM6asEjlgheuTkaOL3QodbRzgqwGgOXRyPSUfiJtSfiWR
 ZyTg==
X-Gm-Message-State: AOAM531Nzf3nsCgILlJC6bm5tVvGpyLpnj5124XGKmtKEehLjJoljv/U
 bWsWpQWsWILrsw3gza2DSGo7Ng==
X-Google-Smtp-Source: ABdhPJwsR5buWBp6m6UIQ4GQsodCuK9av4XXiGo4u4ljZKRoCK2CpeMOyyJQjm/2QV3tTHdYKfdIkQ==
X-Received: by 2002:a63:85c6:: with SMTP id u189mr7794704pgd.381.1634284137207; 
 Fri, 15 Oct 2021 00:48:57 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:48:56 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v8 34/78] target/riscv: rvv-1.0: allow load element with
 sign-extended
Date: Fri, 15 Oct 2021 15:45:42 +0800
Message-Id: <20211015074627.3957162-42-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x530.google.com
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
X-List-Received-Date: Fri, 15 Oct 2021 07:49:01 -0000

From: Frank Chang <frank.chang@sifive.com>

For some vector instructions (e.g. vmv.s.x), the element is loaded with
sign-extended.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 32 +++++++++++++++++--------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 3751496676f..31ea231b3be 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2824,17 +2824,29 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
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
@@ -2889,7 +2901,7 @@ static void vec_element_loadx(DisasContext *s, TCGv_i64 dest,
 
     /* Perform the load. */
     load_element(dest, base,
-                 vreg_ofs(s, vreg), s->sew);
+                 vreg_ofs(s, vreg), s->sew, false);
     tcg_temp_free_ptr(base);
     tcg_temp_free_i32(ofs);
 
@@ -2905,9 +2917,9 @@ static void vec_element_loadx(DisasContext *s, TCGv_i64 dest,
 }
 
 static void vec_element_loadi(DisasContext *s, TCGv_i64 dest,
-                              int vreg, int idx)
+                              int vreg, int idx, bool sign)
 {
-    load_element(dest, cpu_env, endian_ofs(s, vreg, idx), s->sew);
+    load_element(dest, cpu_env, endian_ofs(s, vreg, idx), s->sew, sign);
 }
 
 static bool trans_vext_x_v(DisasContext *s, arg_r *a)
@@ -2917,7 +2929,7 @@ static bool trans_vext_x_v(DisasContext *s, arg_r *a)
 
     if (a->rs1 == 0) {
         /* Special case vmv.x.s rd, vs2. */
-        vec_element_loadi(s, tmp, a->rs2, 0);
+        vec_element_loadi(s, tmp, a->rs2, 0, false);
     } else {
         /* This instruction ignores LMUL and vector register groups */
         int vlmax = s->vlen >> (3 + s->sew);
@@ -2999,7 +3011,7 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
         (s->mstatus_fs != 0) && (s->sew != 0)) {
         unsigned int len = 8 << s->sew;
 
-        vec_element_loadi(s, cpu_fpr[a->rd], a->rs2, 0);
+        vec_element_loadi(s, cpu_fpr[a->rd], a->rs2, 0, false);
         if (len < 64) {
             tcg_gen_ori_i64(cpu_fpr[a->rd], cpu_fpr[a->rd],
                             MAKE_64BIT_MASK(len, 64 - len));
@@ -3101,7 +3113,7 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmrr *a)
         TCGv_i64 dest = tcg_temp_new_i64();
 
         if (a->rs1 == 0) {
-            vec_element_loadi(s, dest, a->rs2, 0);
+            vec_element_loadi(s, dest, a->rs2, 0, false);
         } else {
             vec_element_loadx(s, dest, a->rs2, cpu_gpr[a->rs1], vlmax);
         }
-- 
2.25.1


