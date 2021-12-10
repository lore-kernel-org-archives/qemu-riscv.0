Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mvaoL-0006P3-Od
	for mharc-qemu-riscv@gnu.org; Fri, 10 Dec 2021 02:59:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvao4-0006Eq-CP
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:59:04 -0500
Received: from [2607:f8b0:4864:20::102b] (port=35632
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvao2-0006un-Qa
 for qemu-riscv@nongnu.org; Fri, 10 Dec 2021 02:59:04 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso8895900pji.0
 for <qemu-riscv@nongnu.org>; Thu, 09 Dec 2021 23:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QluqMBpBTzXRK4oNP2oSnt/ZLjAZaO+5T6anaSuoUJE=;
 b=hBztzm6+jrANq7XqkX9q39Iq009PlpyBNXOd1MUyZaBE0+VluDbY/DBQ95KxZpwAon
 ZpBqB+l+uhLWK1FWXvPH6s5hwLPeO3JN1SrkZaZg/oR1Zlnr2Cb4kLl7pRL1otZ+pp1q
 5Q9Z8qmUoDsvTFUx2xI9h0XnvMjBdnT+v7BpngJlDe5RYd6c8obr/wv7xerpt51JsfJr
 IoMhL/jVyO48iH25dfXPOZ3jge01XzLxfAD3SfLnsZbyKJLzc0pzUGHKHKkl+46picS1
 luSaMEnU+PDzt8vsg7fLFK0VJQwQhCBV8uCX7CG7v88VAq//Lu2z9FCsgzFiVSGRgk5+
 ourw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QluqMBpBTzXRK4oNP2oSnt/ZLjAZaO+5T6anaSuoUJE=;
 b=OzER4a2V2G6E0UI0ho42/T0IxFiQ6GzKBxNvwxrNgJkJaN+7eeIHIrW4tIccLNwiMi
 SltIrF02R0A+eUec68gRYfBBf7I7EkBYn0RQkPxL3jS7sD/r8b+hPYz6lLrcAjmgchff
 IKzHpwfci36wDQTPQ+hwdqzhnz1poOv69XtiYROpyg67Cvb1rKBlY8BisnfwAQ4pcVrG
 Kc2gLD8Jm2HlQsatFeM8VH0NnT9wblglf9w370DAPLoqv4gVOR7YMZeWjgsTWsuEcRQI
 cnhcvi2XCJNcQhE+pm/8BsLBKY2/Acl7V5nBYCBFYttiyp3jVQmzyLM0B+qGOiLyblAE
 IPwA==
X-Gm-Message-State: AOAM531yGtatdqyxQz5ykA7jHlODsYSPWMbUsCRya6SF6CUsXcrltV5U
 esMs9TTFxY+dbuEZrmNNJJIvrfeIkcSTWk94
X-Google-Smtp-Source: ABdhPJzikZ/H83SUJFwA6k6kK+zcvx0bVR5SZ7daEJXl5T7MtpRlSw1hfNERaRKLxDK4HUJ3dQAUBQ==
X-Received: by 2002:a17:902:714f:b0:142:892d:a46 with SMTP id
 u15-20020a170902714f00b00142892d0a46mr72878403plm.39.1639123140419; 
 Thu, 09 Dec 2021 23:59:00 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:59:00 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v11 34/77] target/riscv: rvv-1.0: allow load element with
 sign-extended
Date: Fri, 10 Dec 2021 15:56:20 +0800
Message-Id: <20211210075704.23951-35-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Dec 2021 07:59:04 -0000

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
index 80cbf0cadb..4207cc4e6b 100644
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
2.31.1


