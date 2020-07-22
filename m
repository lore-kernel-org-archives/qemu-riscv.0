Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAvO-00034S-NE
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAvM-0002zO-Op
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:20:28 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:40509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAvK-0005ml-I5
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:20:28 -0400
Received: by mail-pj1-x102d.google.com with SMTP id t15so865088pjq.5
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=b009y4bHWo9FAz89fm3BgjB9nWZ1yvMrO2kzUNMCm3c=;
 b=LqbDzH5CV2k9wi5FFm4oOQT6m/6TaAQC38s44XtrIZas/r9bjgexPhr/+n7h3sERqT
 hasWriro2FeSeeQFoelK8FPZIG+vjxJdagY81E13w63viMgdGd/Ytrw2B3+S5pKwCc05
 f38wSlisxTjv8zO+9/EhDV/1WBYulHCxuGY5MsRvnecimOivD8nTPNmP3AgmeyUe9PAO
 vcJFt4uVZDsd+BrCBMtDk6qrDZB8YJnC0Uh+SOrt0EjHGtA7hBc2BI9FYAEmSdILv8Vo
 4bQ9phQ2agui7+DCRqv24KXEFKHihYJDwXKKnhJ70Z8wPRvmknK7QXavLMU4a5HDAWy0
 +RXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=b009y4bHWo9FAz89fm3BgjB9nWZ1yvMrO2kzUNMCm3c=;
 b=Z1BgM9scILwlK56uecZO8lNGLwqr1KtjYXySqos+rfL0GhigvtuThlJeBeDoPkkSFw
 jM1RHZARK6e2veMVwszODw9nyf1ktITBXzQRDToDQ0V5QspFXu/k2ts0W2R5TokTxjdS
 fVcxYmjLHi9eVjQWn6EBa+jFcGmKEV4rdNpJcYchlzcdG1xsy18ZfUi5HcPnjLipBJ0E
 HCwBmv6XKyebzsxFEU/UL0zh6G6um5OwSPGJdIFpcxdUVneMByC0+8YL6J36SgIsHulc
 anQQqINRWPAhMH3g36dF6BIqYhIjiQ244Zcsw4Fji6DtvyttEKCK711BsdBVQ7UD6VOr
 V3NQ==
X-Gm-Message-State: AOAM531lZvhfryzJvhzRlC3xuceg8DCmZPyIxHsuBhAqdfARW3VjndfC
 7qyw/Vg36r+WKaqj8g7bGE4BEQ==
X-Google-Smtp-Source: ABdhPJwqRnwSt1IFeouHr9Qx3sqLOzjev7Z6eEBwIoIbM4nh8rHC9vR97nAtcEKLyfpuN1k82UNPog==
X-Received: by 2002:a17:90a:ef17:: with SMTP id
 k23mr8227711pjz.45.1595409625095; 
 Wed, 22 Jul 2020 02:20:25 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:20:24 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 39/76] target/riscv: rvv-0.9: integer scalar move instructions
Date: Wed, 22 Jul 2020 17:16:02 +0800
Message-Id: <20200722091641.8834-40-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102d.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:20:29 -0000

From: Frank Chang <frank.chang@sifive.com>

* Remove "vmv.s.x: dothing if rs1 == 0" constraint.
* Add vmv.x.s instruction.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              |  3 +-
 target/riscv/insn_trans/trans_rvv.inc.c | 46 ++++++++++++++++++++-----
 2 files changed, 40 insertions(+), 9 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 01316c908d..ef53df7c73 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -580,8 +580,9 @@ vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
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
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index af19561e7d..780f8660bf 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -3252,27 +3252,57 @@ static void vec_element_storei(DisasContext *s, int vreg,
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
+        mark_vs_dirty(s);
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


