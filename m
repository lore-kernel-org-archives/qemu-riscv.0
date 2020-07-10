Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtscq-0006fv-2q
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqew-0005uX-JH
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:53:38 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:35814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqeu-0006uv-H7
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:53:38 -0400
Received: by mail-pj1-x1044.google.com with SMTP id f16so2455797pjt.0
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=raPeNNVGTWTWe3j0tOl4U7ukQw7k+xVhzTGPpxxshcQ=;
 b=XIYMIOYOim3QsF2v9ILaHLYW8YsfR0/YOJlCK14Ve7+Ewm8I5cL+czndGXIq8HZzLS
 GM8zPbVi7RXHeFFhaAioIeJYkcu1w1JeAyLSV2qJJtQtbKa3Dqe8yY4Az+jsZ2X6VxRd
 EvYY7AzLaTHytLfJ4L1KhtvW1rW2FZf+suTEQAA3hmLZJP8tDuuQy+8AqthOFVdePGMk
 9O4EXt+EoFrnWIuTnsZbPpvKtzCd7oVkxLDbTsHYzZeghIGzKvFb7qsIN2OkvEz0yYNn
 g38alJYbRp0LXweFTNY1ge8KF4n2aDeGaBKT+uS7RFXGcEH7YzkknXTiJiuejjy2z5Jx
 QDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=raPeNNVGTWTWe3j0tOl4U7ukQw7k+xVhzTGPpxxshcQ=;
 b=poH7Ecm67O86jmCoW1oqs02hMla35eoNEAL9sncU6/ZzwP7ubbmw7YQ+CdQ3iqeNDp
 29u03qKqq9fqSAT8m/V3FWXICt/8UBOhhjhx3coEiVJAvi9C9d9MvofUr60DqYSLFf66
 GW3P0bOJ4+eu1ZUthaM4PhMo6Z2achhKojOqwNTyE/HJsedlRd7bHaWU2X9GWUd4hdox
 qkJnZ7z3J+ya0yB55cVV3LxcisePL749GXd78fmSbVcHbf+tYDLzYW5bVDM0PRRH3xSd
 1y5nqwAfiguNBhSnE1XXjT8Go4E0hmQZSj0GcxVGXG4wJnzJssohTgoF2UJpivBWfufC
 hhww==
X-Gm-Message-State: AOAM533Cmx6+wJmkIx8qYFFbAyI8xSlJJBtXudqgVplRtLf7BLoj4AnC
 2jcUOizSynjaizx+DZwDaQEnVw==
X-Google-Smtp-Source: ABdhPJzLun8PgoluA+WUZBtG6qcxg5TQeIMmzs6A2AhXNcV0fg7pIV32Bz5Qdn9loToWfLP3AC7JCQ==
X-Received: by 2002:a17:90b:2350:: with SMTP id
 ms16mr5167849pjb.127.1594378414636; 
 Fri, 10 Jul 2020 03:53:34 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:53:34 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 45/65] target/riscv: rvv-0.9: register gather instructions
Date: Fri, 10 Jul 2020 18:48:59 +0800
Message-Id: <20200710104920.13550-46-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1044.google.com
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
X-Mailman-Approved-At: Fri, 10 Jul 2020 08:59:04 -0400
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
X-List-Received-Date: Fri, 10 Jul 2020 10:53:38 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.inc.c | 33 +++++++++++++++++--------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 59b25e17f8..50f9782a96 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2958,17 +2958,29 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
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
@@ -3023,7 +3035,7 @@ static void vec_element_loadx(DisasContext *s, TCGv_i64 dest,
 
     /* Perform the load. */
     load_element(dest, base,
-                 vreg_ofs(s, vreg), s->sew);
+                 vreg_ofs(s, vreg), s->sew, false);
     tcg_temp_free_ptr(base);
     tcg_temp_free_i32(ofs);
 
@@ -3041,9 +3053,9 @@ static void vec_element_loadx(DisasContext *s, TCGv_i64 dest,
 }
 
 static void vec_element_loadi(DisasContext *s, TCGv_i64 dest,
-                              int vreg, int idx)
+                              int vreg, int idx, bool sign)
 {
-    load_element(dest, cpu_env, endian_ofs(s, vreg, idx), s->sew);
+    load_element(dest, cpu_env, endian_ofs(s, vreg, idx), s->sew, sign);
 }
 
 static bool trans_vext_x_v(DisasContext *s, arg_r *a)
@@ -3251,11 +3263,11 @@ static bool trans_vrgather_vx(DisasContext *s, arg_rmrr *a)
     }
 
     if (a->vm && s->vl_eq_vlmax) {
-        int vlmax = s->vlen;
+        int vlmax = s->vlen * s->flmul / (1 << (s->sew + 3));
         TCGv_i64 dest = tcg_temp_new_i64();
 
         if (a->rs1 == 0) {
-            vec_element_loadi(s, dest, a->rs2, 0);
+            vec_element_loadi(s, dest, a->rs2, 0, false);
         } else {
             vec_element_loadx(s, dest, a->rs2, cpu_gpr[a->rs1], vlmax);
         }
@@ -3282,7 +3294,8 @@ static bool trans_vrgather_vi(DisasContext *s, arg_rmrr *a)
     }
 
     if (a->vm && s->vl_eq_vlmax) {
-        if (a->rs1 >= s->vlen) {
+        int vlmax = s->vlen * s->flmul / (1 << (s->sew + 3));
+        if (a->rs1 >= vlmax) {
             tcg_gen_gvec_dup_imm(SEW64, vreg_ofs(s, a->rd),
                                  MAXSZ(s), MAXSZ(s), 0);
         } else {
-- 
2.17.1


