Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGCF-0004yU-NX
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:42:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGC5-0004pA-Tv
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:42:31 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:45854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGC3-0007qg-Cp
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:42:29 -0500
Received: by mail-pf1-x435.google.com with SMTP id c13so1047157pfi.12
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hpSiVNd7zIyiPY5kEZba2D+ujgjJKQioASVwNLsUDGM=;
 b=inXJ21pOS7XC5zMncqsiDwjcl/z3ykd+BirfbyftLOER+LUl40Z4BLQj1v7QpGRA1O
 MswgBiQclkBISAxqkpT6NsHsxm+D8IxwH+d9Y9ZzB5GGWpdbrGgzHcGSWTzRFg1XemTT
 Hr9EuS9SGDVQyW7gAZ2/Ey9A3JYRAqUsUo37LAtLDwEIrSBFFcH2fbVQdnFzR6012UDE
 UVf5pds/HQNcC4yLnkHxGr9lHCxW3z2u8sl/OlXFKQ/LnS4NHkPM0sxVLTvRUXvx9l7y
 Su5EXdhzGdP0Pan87djUcBY9g2AyzB1WV5cx/4COg679n2fneGd/+gm8KbWDXhpsMxzW
 4E6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hpSiVNd7zIyiPY5kEZba2D+ujgjJKQioASVwNLsUDGM=;
 b=Px0+5dpUTjtENhSxBRnPSSvLB1oyOfES6MLaP4C+B6B25Ul2B0tjS36LaOxlFOc71d
 yisEFN9KVYU3CWnCR3hgTVel2TEtFT+MkAxvGiIeU++f3aZgka5JOVg2tdacjNm8NMpa
 zLUYrk2mY6LIJ/kcuF19gZmx7+yQd+t2OkBQV0o2N1vZuKEKb88K+XdTCu0960o/adQZ
 chJu/WcgyMHFa9lmd2OszKSVG0QfykwuPaNEuXwKNwUeQkqQppTR2WFDF4Xu119m7LZh
 LCRCG2ZG0oEYbr0Yd0opugWtvimCex9K1xn2Gur+WTQs85N30r4/s+mYG7LfuDGD/Z6Q
 WTng==
X-Gm-Message-State: AOAM531+KJfVaoxb9vW/Uj1gyEX4aBniujIyZlNda1vxnEEDgbqWWSlN
 vyB+OxqQS9XuB08wRkYKGWaaYA==
X-Google-Smtp-Source: ABdhPJxd4scq/3m+Ls4gVfiYI40hXjb2iXBOW3uclFQFhbTT1EgJpEUIgYTIBPR+KY/uj99cJnAjHw==
X-Received: by 2002:a63:591f:: with SMTP id n31mr3935188pgb.244.1610444545262; 
 Tue, 12 Jan 2021 01:42:25 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:42:24 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v6 35/72] target/riscv: rvv-1.0: integer scalar move
 instructions
Date: Tue, 12 Jan 2021 17:39:09 +0800
Message-Id: <20210112093950.17530-36-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x435.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 09:42:33 -0000

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


