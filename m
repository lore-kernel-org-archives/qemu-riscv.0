Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTgS-00077U-UK
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:20:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTgN-00075J-5F
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:20:48 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:39536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTgJ-00011F-O9
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:20:46 -0500
Received: by mail-pl1-x632.google.com with SMTP id k22so4553548pll.6
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Duw0Yb367y09BGT6bBCZDZ8RJGpDVcpQlqKbPSHG7pA=;
 b=cWtCdgnGgQOVa69fZRBUu4zow/dH5P47xULdbV0bj2hYXYmDDRmtn4At8VJ8hWh/i1
 xZJ2oNY+at9PwUfRqjfhTdxSTLys6FtB7ariVk8M5DivpHvev4LtVecqwL+PpcuaWKd8
 XfnRb5anf46s8jJoQdZDR7AnSrT6DEFq4rjw0fU4UxEeo4305vyaTOIHCwcdAVsoLsT+
 kZKGSIb77ad7jroW67cBiXPOE7nCRl5yW7J18UsumK9vSmZzQX1ByK3ZLp3K1pajS7lD
 uAMf6v4JOAkBhb9lzxZMtxFLffJhZSg5hkWstZndOr3NIrTa+OQyDzljRvsLxvw+ar47
 AAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Duw0Yb367y09BGT6bBCZDZ8RJGpDVcpQlqKbPSHG7pA=;
 b=tT3yPmHRmaw2i8M9ax1Hj16uSG5ltxGQ6bI7qPAWGAtTyvNCMbk2ism/UP00Rhs5sN
 2YBHauyWA57cXhEtYWrt7bglK00/a06gvHaUdkQwhVVi8Qpgf7WzdL0xc9hd2y15YPKK
 S8HI6M7x03nk/a0Nz5YbqMMqX/kZBiJ8P4zgY88yZk4hkkbeF1ZlYWNH0vXQVCPMArC0
 3pIljW3fm4J7GrRYCWyIz/5yInDaQeomNliOxb24duhohdqKETCVFyMdB7b7hGPolha/
 lQpRJC1YIjLuo26uya9E7/8vCgGswbl0p1e73duGBNJPS6K6pYqz55Yp3yqiLiBpNqi0
 9D/Q==
X-Gm-Message-State: AOAM531G1GTx+3wRAp08uIgKuCtX+gWYawednSkklvxgdLfrbVx3tqP0
 EXVMzCbo99ygXx+BWGzuYHaR2g==
X-Google-Smtp-Source: ABdhPJwxUdKQHpHGlbDWmEX31bWytKyLquu0D7t/HKRMINBpzFT1ZY/Xb3sFBfZcBDqS+ulzqJAqnA==
X-Received: by 2002:a17:902:9a92:b029:e2:dbb6:7442 with SMTP id
 w18-20020a1709029a92b02900e2dbb67442mr1253506plp.50.1614309642612; 
 Thu, 25 Feb 2021 19:20:42 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:20:42 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v7 16/75] target/riscv: rvv:1.0: add translation-time nan-box
 helper function
Date: Fri, 26 Feb 2021 11:18:00 +0800
Message-Id: <20210226031902.23656-17-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x632.google.com
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
X-List-Received-Date: Fri, 26 Feb 2021 03:20:49 -0000

From: Frank Chang <frank.chang@sifive.com>

* Add fp16 nan-box check generator function, if a 16-bit input is not
  properly nanboxed, then the input is replaced with the default qnan.
* Add do_nanbox() helper function to utilize gen_check_nanbox_X() to
  generate the NaN-boxed floating-point values based on SEW setting.
* Apply nanbox helper in opfvf_trans().

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 35 ++++++++++++++++++++++++-
 target/riscv/translate.c                | 10 +++++++
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 18a1c409fcf..ccfa93cf2f8 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2100,6 +2100,33 @@ GEN_OPIVI_NARROW_TRANS(vnclip_vi, IMM_ZX, vnclip_vx)
 /*
  *** Vector Float Point Arithmetic Instructions
  */
+
+/*
+ * As RVF-only cpus always have values NaN-boxed to 64-bits,
+ * RVF and RVD can be treated equally.
+ * We don't have to deal with the cases of: SEW > FLEN.
+ *
+ * If SEW < FLEN, check whether input fp register is a valid
+ * NaN-boxed value, in which case the least-significant SEW bits
+ * of the f regsiter are used, else the canonical NaN value is used.
+ */
+static void do_nanbox(DisasContext *s, TCGv_i64 out, TCGv_i64 in)
+{
+    switch (s->sew) {
+    case 1:
+        gen_check_nanbox_h(out, in);
+        break;
+    case 2:
+        gen_check_nanbox_s(out, in);
+        break;
+    case 3:
+        tcg_gen_mov_i64(out, in);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /* Vector Single-Width Floating-Point Add/Subtract Instructions */
 
 /*
@@ -2152,6 +2179,7 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
 {
     TCGv_ptr dest, src2, mask;
     TCGv_i32 desc;
+    TCGv_i64 t1;
 
     TCGLabel *over = gen_new_label();
     tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
@@ -2165,12 +2193,17 @@ static bool opfvf_trans(uint32_t vd, uint32_t rs1, uint32_t vs2,
     tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, vs2));
     tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
-    fn(dest, mask, cpu_fpr[rs1], src2, cpu_env, desc);
+    /* NaN-box f[rs1] */
+    t1 = tcg_temp_new_i64();
+    do_nanbox(s, t1, cpu_fpr[rs1]);
+
+    fn(dest, mask, t1, src2, cpu_env, desc);
 
     tcg_temp_free_ptr(dest);
     tcg_temp_free_ptr(mask);
     tcg_temp_free_ptr(src2);
     tcg_temp_free_i32(desc);
+    tcg_temp_free_i64(t1);
     mark_vs_dirty(s);
     gen_set_label(over);
     return true;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 75ed94c802b..d9a794d71e8 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -123,6 +123,16 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
  *
  * Here, the result is always nan-boxed, even the canonical nan.
  */
+static void gen_check_nanbox_h(TCGv_i64 out, TCGv_i64 in)
+{
+    TCGv_i64 t_max = tcg_const_i64(0xffffffffffff0000ull);
+    TCGv_i64 t_nan = tcg_const_i64(0xffffffffffff7e00ull);
+
+    tcg_gen_movcond_i64(TCG_COND_GEU, out, in, t_max, in, t_nan);
+    tcg_temp_free_i64(t_max);
+    tcg_temp_free_i64(t_nan);
+}
+
 static void gen_check_nanbox_s(TCGv_i64 out, TCGv_i64 in)
 {
     TCGv_i64 t_max = tcg_const_i64(0xffffffff00000000ull);
-- 
2.17.1


