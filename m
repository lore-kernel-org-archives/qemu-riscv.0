Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbHxq-0000pP-QE
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 03:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxp-0000lU-AR
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:49:13 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:50861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxk-0003qC-JU
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 03:49:12 -0400
Received: by mail-pj1-x1036.google.com with SMTP id gn3so1128161pjb.0
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 00:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vveCAHhRvzkaJ734nZh2WZbf1uFJlX98LAsZrTZc6yk=;
 b=FArYqGra1LRTMj43U7Tyx12eKyBAdSU/KFhHH8EvhI2evyT5gPQy3BuKeVhwwWoCiN
 sfwbCcbXdCubI6cr9emo8NiuVhUiT17w8o5CAEgxlvAB80WLsURQ/iVuZBCXodZH+wWQ
 rZot/tRnUNjSj/cdT0wdcuSxc4ZInE40USlxl3x4Ck/lC34t1Nch7IDqe9HwE8aB/5r0
 WdM3115MnApvy6oVD8+rnD7sC/oixJGDZ+/VybIPN4TYlEsnWTHXnyz+Dz6kowQi/ofK
 rL5frLVdNYDAt5IPaAz3sPcPBm4wVtRDbs5gPtVSTdGd/WBA/AQRTFXdhqI3a7rYznv8
 Itew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vveCAHhRvzkaJ734nZh2WZbf1uFJlX98LAsZrTZc6yk=;
 b=2opqmPi7ERqXpLGcgFejkA4jGpBE+d1NM8zvRcCJBchZ5TbGBq8qcAeAigYZUZgAHE
 I1/OnhqHXKATd5LNMEEUpTYWe/umIMaqycm/xe/9KXHRYHGNmyzUPSXJAA+83Y79JahD
 0Ppeva6XeNh8ula6Ny7U80lLzm1PbJPPEpjAwkJZFOo0f+7nJKV5FUWx/HJWDIk1o+Pa
 1zUfxarnV/rrQYad2V3xdKsGnydAoN8PBBrdR6uW/GUIzK+Y/8K59FjUKqWkjHAKQPD9
 MJ82PhzpAKC+CgncGFH/hWAYN3tdKQaIm96GP96GXuUg1KooOD29bB3oA6M0w+nXYpdX
 ESaA==
X-Gm-Message-State: AOAM530Orabq30MHZHFiJEhdt3uzPjtnzQZjzrT/xRg+IBPGg8agZn+l
 1NELO8JrBF95pCklNfjw62gUHg==
X-Google-Smtp-Source: ABdhPJwXxowWtc46c2FVYC/GzckDf8JI/z10BQeXLQO3SG2xfM/Nt+2OqJsfP2XWTJHyQP0RxJQkdw==
X-Received: by 2002:a17:903:2306:b0:13d:a304:1b55 with SMTP id
 d6-20020a170903230600b0013da3041b55mr9732723plh.51.1634284147319; 
 Fri, 15 Oct 2021 00:49:07 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:49:07 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v8 37/78] target/riscv: rvv-1.0: floating-point move
 instruction
Date: Fri, 15 Oct 2021 15:45:45 +0800
Message-Id: <20211015074627.3957162-45-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 15 Oct 2021 07:49:13 -0000

From: Frank Chang <frank.chang@sifive.com>

NaN-boxed the scalar floating-point register based on RVV 1.0's rules.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 42a9f2764d5..1340ce56806 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2460,9 +2460,15 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
         require_rvf(s) &&
         vext_check_isa_ill(s) &&
         require_align(a->rd, s->lmul)) {
+        TCGv_i64 t1;
+
         if (s->vl_eq_vlmax) {
+            t1 = tcg_temp_new_i64();
+            /* NaN-box f[rs1] */
+            do_nanbox(s, t1, cpu_fpr[a->rs1]);
+
             tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
-                                 MAXSZ(s), MAXSZ(s), cpu_fpr[a->rs1]);
+                                 MAXSZ(s), MAXSZ(s), t1);
             mark_vs_dirty(s);
         } else {
             TCGv_ptr dest;
@@ -2476,15 +2482,21 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
             TCGLabel *over = gen_new_label();
             tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
 
+            t1 = tcg_temp_new_i64();
+            /* NaN-box f[rs1] */
+            do_nanbox(s, t1, cpu_fpr[a->rs1]);
+
             dest = tcg_temp_new_ptr();
             desc = tcg_constant_i32(simd_desc(s->vlen / 8, s->vlen / 8, data));
             tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, a->rd));
-            fns[s->sew - 1](dest, cpu_fpr[a->rs1], cpu_env, desc);
+
+            fns[s->sew - 1](dest, t1, cpu_env, desc);
 
             tcg_temp_free_ptr(dest);
             mark_vs_dirty(s);
             gen_set_label(over);
         }
+        tcg_temp_free_i64(t1);
         return true;
     }
     return false;
-- 
2.25.1


