Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTi6-0000ie-5X
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:22:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTi1-0000fw-MM
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:22:29 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:34686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFThz-0001lZ-KL
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:22:29 -0500
Received: by mail-pf1-x429.google.com with SMTP id m6so5333453pfk.1
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hpSiVNd7zIyiPY5kEZba2D+ujgjJKQioASVwNLsUDGM=;
 b=hTPjI7FkY9ZeikS0hgCjy7hhHMCuBxwRVi90D2pFYODFAGjhQi9P1+VHRSAZl/J0j5
 AMjKgjKY0RdRWitNr10y8KE+/37GJMV5piUbdfm2cVbLkw2QoQ7UhA0onem4Z/03Xq9W
 yDjplSkS8JsKV4UfZIPj1pugKjthWWZnnWDKQT7wqKeaQwwLjkDm0mqLykJUBflI9FeZ
 tSW/bgcZGmy1BIt++VClBl4KuxSaXP1ap9BbY/wGKvmsMZpjL/tSeOP5q+LWe6upajLJ
 lj8WlcBfNS8nFTlbpwnNQl2ZazIOACrkmCaPTi9pixRZ6xHgcmvr6970fAFDgQXZWPJB
 lYPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hpSiVNd7zIyiPY5kEZba2D+ujgjJKQioASVwNLsUDGM=;
 b=iY4LffOniDgcPT/Ng+Ctf7s9dHjgSfqANrb0A2zZL43WrfWRD19cjpUYImjCYwWNU4
 2adx1O4EvT0EmO1PsO3Pl3tsahWhE4aJJRSfgf/KIl6Rzh9/Wy1ZKs9xTKnPiTjm8/VE
 W3jYJH37isSsF5Qm8LqaUH/0JJ8VDXOwTu6OZPfG2fRplCSNjVLApmIejtbqGZ2UeyjJ
 fmgX4zleeC30XNjZ28LWlPnd4Iz9hTgLWPd0pOBF4+H0YhAzT0bdBZfksdeqvKFYOiQl
 L1AuaEDRplBRJJyDLx6qbyxfU74StelTQbWxrEdwef50zOpFtvMzM+H6e4QBlesy6vTE
 gOgA==
X-Gm-Message-State: AOAM530YWzeRNyesHwOso62/PHLKfcOodKMi9+qRL5FgH6NNWenuAAQA
 Ls8DsJAOruUh5xKMrTaCX93/tw==
X-Google-Smtp-Source: ABdhPJzOexIU1kVDsd/jroKn8NrBhaqPEufa/N+TSqxGGOf9cdjYq3XmAqnGpJHwkQZssTTESlMvBg==
X-Received: by 2002:a05:6a00:c1:b029:1ee:1add:baf8 with SMTP id
 e1-20020a056a0000c1b02901ee1addbaf8mr1010475pfj.64.1614309745670; 
 Thu, 25 Feb 2021 19:22:25 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:22:25 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v7 35/75] target/riscv: rvv-1.0: integer scalar move
 instructions
Date: Fri, 26 Feb 2021 11:18:19 +0800
Message-Id: <20210226031902.23656-36-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x429.google.com
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
X-List-Received-Date: Fri, 26 Feb 2021 03:22:31 -0000

From: Frank Chang <frank.chang@sifive.com>

* Remove "vmv.s.x: dothing if rs1 == 0" constraint.
* Add vmv.x.s instruction.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode              |  3 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 45 ++++++++++++++++++++-----
 2 files changed, 39 insertions(+), 9 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 85cb3c81be0..f26723a4d27 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -609,8 +609,9 @@ vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
 viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
+vmv_x_s         010000 1 ..... 00000 010 ..... 1010111 @r2rd
+vmv_s_x         010000 1 00000 ..... 110 ..... 1010111 @r2
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
-vmv_s_x         001101 1 00000 ..... 110 ..... 1010111 @r2
 vfmv_f_s        001100 1 ..... 00000 001 ..... 1010111 @r2rd
 vfmv_s_f        001101 1 00000 ..... 101 ..... 1010111 @r2
 vslideup_vx     001110 . ..... ..... 100 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index bc780912b2b..1839fc0a56b 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3211,27 +3211,56 @@ static void vec_element_storei(DisasContext *s, int vreg,
     store_element(val, cpu_env, endian_ofs(s, vreg, idx), s->sew);
 }
 
+/* vmv.x.s rd, vs2 # x[rd] = vs2[0] */
+static bool trans_vmv_x_s(DisasContext *s, arg_vmv_x_s *a)
+{
+    if (require_rvv(s) &&
+        vext_check_isa_ill(s)) {
+        TCGv_i64 t1;
+        TCGv dest;
+
+        t1 = tcg_temp_new_i64();
+        dest = tcg_temp_new();
+        /*
+         * load vreg and sign-extend to 64 bits,
+         * then truncate to XLEN bits before storing to gpr.
+         */
+        vec_element_loadi(s, t1, a->rs2, 0, true);
+        tcg_gen_trunc_i64_tl(dest, t1);
+        gen_set_gpr(a->rd, dest);
+        tcg_temp_free_i64(t1);
+        tcg_temp_free(dest);
+
+        return true;
+    }
+    return false;
+}
+
 /* vmv.s.x vd, rs1 # vd[0] = rs1 */
 static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
 {
-    if (vext_check_isa_ill(s)) {
+    if (require_rvv(s) &&
+        vext_check_isa_ill(s)) {
         /* This instruction ignores LMUL and vector register groups */
-        int maxsz = s->vlen >> 3;
         TCGv_i64 t1;
+        TCGv s1;
         TCGLabel *over = gen_new_label();
 
         tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
-        tcg_gen_gvec_dup_imm(SEW64, vreg_ofs(s, a->rd), maxsz, maxsz, 0);
-        if (a->rs1 == 0) {
-            goto done;
-        }
 
         t1 = tcg_temp_new_i64();
-        tcg_gen_extu_tl_i64(t1, cpu_gpr[a->rs1]);
+        s1 = tcg_temp_new();
+
+        /*
+         * load gpr and sign-extend to 64 bits,
+         * then truncate to SEW bits when storing to vreg.
+         */
+        gen_get_gpr(s1, a->rs1);
+        tcg_gen_ext_tl_i64(t1, s1);
         vec_element_storei(s, a->rd, 0, t1);
         tcg_temp_free_i64(t1);
+        tcg_temp_free(s1);
         mark_vs_dirty(s);
-    done:
         gen_set_label(over);
         return true;
     }
-- 
2.17.1


