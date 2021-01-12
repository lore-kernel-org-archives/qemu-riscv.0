Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGCD-0004sl-VQ
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:42:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBz-0004nG-8H
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:42:23 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:36144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBt-0007o7-TL
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:42:22 -0500
Received: by mail-pf1-x434.google.com with SMTP id b3so733335pft.3
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=H5kLQPvC+NkVH8eIXzS6BbKDPA2Zb98WYvzuQona8oI=;
 b=hlJx3ZPwY0aNSns3qCOaky49/m9l6vcK+UysY+E5AxSENzs/3WW4xT9HZOU+GT4tfA
 kDZlNTWEhxvcgjiZnKglKXEdVudcLbFoCgQjdppBhK+25Bo4/GRvJ87pzNiYORxVf8nE
 AwKtUsCJ0I0O/pxOnLUnvaLEMrrQAkLqgd3vkzQr+t6C99s4RHcaMMrrOrKYrvXun2KM
 /yGxnV1Wgh4IVh3Llj63LZ4ephpycMYA1tsvWqiHc4eq1YTeUqgze9HKVjo368DE2J2Z
 tPCg7O9SttE/a181SbXpDNYxQStihYnq9hjExWFNtNLouOMca0hPV7HGdsak5os5PEVh
 JrmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=H5kLQPvC+NkVH8eIXzS6BbKDPA2Zb98WYvzuQona8oI=;
 b=fu7SY2H8CKi5LnYr6GWHeLIf0epTGEqoaAZL9LdONFzsoo8BIASvR/w696i6dv7ZGE
 HXINPuTdO/4OnDWMu2uQ9P4W1pHnEhq5rf1elX+Mhl1sTeXFegshbEV1Qu7H3Xoc+eFi
 uwOLWqvR2lTbnM9QYe76eJr033S5XPUc5TPKVj5m9ti4XaB71Ymc1vwfU26DmdP9WF/a
 bw0dg52d20sLa2wiqzYjfBKwvAQnl//Zi5t3eZGNmobcpBkyp4zsc/nhfqp5JqDYH9hc
 mueaK9b5rbA3978wqfcS9LBTYIzJ/3QM1/F8vn/KiQuMoOgNgBofkJ1KL480r2jEv0YG
 TR2Q==
X-Gm-Message-State: AOAM531kWiCk4vunN2ML01PQaQOVMJpSUfs/X0NfrZYudNW8YsAQJR9e
 JVS2NVib0UpDJuXkzno5U5JhDw==
X-Google-Smtp-Source: ABdhPJxjpIRoNeuDQnmTDGsXYxWbpOKFiYcOQ40tQLPkcPkfGl128UTBhzD3QrrrnziSLFKcnUdIjQ==
X-Received: by 2002:a62:19cb:0:b029:19e:75c2:61ec with SMTP id
 194-20020a6219cb0000b029019e75c261ecmr4065610pfz.19.1610444536661; 
 Tue, 12 Jan 2021 01:42:16 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:42:16 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v6 33/72] target/riscv: rvv-1.0: allow load element with
 sign-extended
Date: Tue, 12 Jan 2021 17:39:07 +0800
Message-Id: <20210112093950.17530-34-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x434.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 09:42:23 -0000

From: Frank Chang <frank.chang@sifive.com>

For some vector instructions (e.g. vmv.s.x), the element is loaded with
sign-extended.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 32 +++++++++++++++++--------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 6e45186b9b4..72222d73e0e 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3056,17 +3056,29 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
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
@@ -3121,7 +3133,7 @@ static void vec_element_loadx(DisasContext *s, TCGv_i64 dest,
 
     /* Perform the load. */
     load_element(dest, base,
-                 vreg_ofs(s, vreg), s->sew);
+                 vreg_ofs(s, vreg), s->sew, false);
     tcg_temp_free_ptr(base);
     tcg_temp_free_i32(ofs);
 
@@ -3139,9 +3151,9 @@ static void vec_element_loadx(DisasContext *s, TCGv_i64 dest,
 }
 
 static void vec_element_loadi(DisasContext *s, TCGv_i64 dest,
-                              int vreg, int idx)
+                              int vreg, int idx, bool sign)
 {
-    load_element(dest, cpu_env, endian_ofs(s, vreg, idx), s->sew);
+    load_element(dest, cpu_env, endian_ofs(s, vreg, idx), s->sew, sign);
 }
 
 static bool trans_vext_x_v(DisasContext *s, arg_r *a)
@@ -3151,7 +3163,7 @@ static bool trans_vext_x_v(DisasContext *s, arg_r *a)
 
     if (a->rs1 == 0) {
         /* Special case vmv.x.s rd, vs2. */
-        vec_element_loadi(s, tmp, a->rs2, 0);
+        vec_element_loadi(s, tmp, a->rs2, 0, false);
     } else {
         /* This instruction ignores LMUL and vector register groups */
         int vlmax = s->vlen >> (3 + s->sew);
@@ -3233,7 +3245,7 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
         (s->mstatus_fs != 0) && (s->sew != 0)) {
         unsigned int len = 8 << s->sew;
 
-        vec_element_loadi(s, cpu_fpr[a->rd], a->rs2, 0);
+        vec_element_loadi(s, cpu_fpr[a->rd], a->rs2, 0, false);
         if (len < 64) {
             tcg_gen_ori_i64(cpu_fpr[a->rd], cpu_fpr[a->rd],
                             MAKE_64BIT_MASK(len, 64 - len));
@@ -3335,7 +3347,7 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmrr *a)
         TCGv_i64 dest = tcg_temp_new_i64();
 
         if (a->rs1 == 0) {
-            vec_element_loadi(s, dest, a->rs2, 0);
+            vec_element_loadi(s, dest, a->rs2, 0, false);
         } else {
             vec_element_loadx(s, dest, a->rs2, cpu_gpr[a->rs1], vlmax);
         }
-- 
2.17.1


