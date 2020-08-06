Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dRy-0002p4-AR
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dRu-0002mJ-Ng
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:39 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:54375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dRs-0007sj-JH
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:48:38 -0400
Received: by mail-pj1-x102b.google.com with SMTP id mt12so6450313pjb.4
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=TQUW5yEXaSqtuF8JpWOtroDX50qPmyztu1PCtMnroQQ=;
 b=DPc5i97WRA81UrNHjQ9AGyNEf0P9rkttV+tu4U9tlh1EjMRp2Qjxa25BZDgcgZ1Qbw
 uXG+C+r1pbEXZUpqMhb7qHK+tRT4PMoCuK7k0BWJDtICbdS6xeOsgcgGzoeWUPrT4V75
 jeLnMjqMbZFMxvUO6gpMtFKgaWSa+dj+xwZ2K0EZyTHWYhcUTi5gGq115U74nBQorH4c
 8Vcd5Nd0jlLkFN4nQgiqoGrGUgUFmLdzIVJFEpWLjZFJI1ho8kgP4s4RzQPbtbkKz+vl
 1vq2RkBdY0HdMQ0OURswhN3zZ8gSqCMq3Rn+PienemO7QjpFkFc9t8OzkCgCMY5gQ5oc
 eY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=TQUW5yEXaSqtuF8JpWOtroDX50qPmyztu1PCtMnroQQ=;
 b=sQSgvIjiT8anT3q4rnwNV8+Q54Jxd/+PoPzwx8kNEpuGD4vfMNZ5PTcj5KnUUVYovh
 djLeyk2RYDLKNwEw6wVVD1qpwo6Hrf2DSaA2CcwxvALkxlKvr0r5GNlwMHHwrcEGuwsg
 XGgf8NzHnA1uA4gmQerclTf3UaBdFtAC1tCtTh8ofDFqdHVHUExqJif19cA4HvlCqDPB
 1X6vbp/Ni/3o8o435p5mvnhOABYS7DG/DBiRalTuwuYNYfCbfPIAhsPjE5nhWslC6Fjy
 fGIG91VimYBisUUkWoHVZOBJ9Zy+OCrTDDi7OPPcpLejYYEAtR27INhu8SeKTmnx42t2
 OoPA==
X-Gm-Message-State: AOAM530jNGSAB+AXQYyKkn0byVRhF+655PgWKf7GYnJhmowEl9WePME+
 +N44Hv1M+eb6QiP8o723UAD2gA==
X-Google-Smtp-Source: ABdhPJyzJIDjwYVBkIPowcxss3TtYiyKRfJxWN1SRNaYzM2pfGVQzNUyjRgvTBmO9MLCjKFyjNbNiQ==
X-Received: by 2002:a17:902:ab83:: with SMTP id
 f3mr7307058plr.125.1596710915388; 
 Thu, 06 Aug 2020 03:48:35 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:48:35 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 30/71] target/riscv: rvv-1.0: mask population count
 instruction
Date: Thu,  6 Aug 2020 18:46:27 +0800
Message-Id: <20200806104709.13235-31-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 06 Aug 2020 10:48:39 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   | 2 +-
 target/riscv/insn32.decode              | 2 +-
 target/riscv/insn_trans/trans_rvv.inc.c | 7 ++++---
 target/riscv/vector_helper.c            | 6 +++---
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 25d076d71a8..0a1179370b1 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1066,7 +1066,7 @@ DEF_HELPER_6(vmnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmornot_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 
-DEF_HELPER_4(vmpopc_m, tl, ptr, ptr, env, i32)
+DEF_HELPER_4(vpopc_m, tl, ptr, ptr, env, i32)
 
 DEF_HELPER_4(vmfirst_m, tl, ptr, ptr, env, i32)
 
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index a800c989050..3d2d43ebd8a 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -591,7 +591,7 @@ vmor_mm         011010 - ..... ..... 010 ..... 1010111 @r
 vmnor_mm        011110 - ..... ..... 010 ..... 1010111 @r
 vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
-vmpopc_m        010100 . ..... ----- 010 ..... 1010111 @r2_vm
+vpopc_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
 vmfirst_m       010101 . ..... ----- 010 ..... 1010111 @r2_vm
 vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 82403dff4b9..e6ec5d24012 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2884,8 +2884,8 @@ GEN_MM_TRANS(vmnor_mm)
 GEN_MM_TRANS(vmornot_mm)
 GEN_MM_TRANS(vmxnor_mm)
 
-/* Vector mask population count vmpopc */
-static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
+/* Vector mask population count vpopc */
+static bool trans_vpopc_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s)) {
@@ -2904,13 +2904,14 @@ static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
         tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
         tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
 
-        gen_helper_vmpopc_m(dst, mask, src2, cpu_env, desc);
+        gen_helper_vpopc_m(dst, mask, src2, cpu_env, desc);
         gen_set_gpr(a->rd, dst);
 
         tcg_temp_free_ptr(mask);
         tcg_temp_free_ptr(src2);
         tcg_temp_free(dst);
         tcg_temp_free_i32(desc);
+
         return true;
     }
     return false;
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 77f62c86e02..a18c02eb124 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4465,9 +4465,9 @@ GEN_VEXT_MASK_VV(vmnor_mm, DO_NOR)
 GEN_VEXT_MASK_VV(vmornot_mm, DO_ORNOT)
 GEN_VEXT_MASK_VV(vmxnor_mm, DO_XNOR)
 
-/* Vector mask population count vmpopc */
-target_ulong HELPER(vmpopc_m)(void *v0, void *vs2, CPURISCVState *env,
-                              uint32_t desc)
+/* Vector mask population count vpopc */
+target_ulong HELPER(vpopc_m)(void *v0, void *vs2, CPURISCVState *env,
+                             uint32_t desc)
 {
     target_ulong cnt = 0;
     uint32_t vm = vext_vm(desc);
-- 
2.17.1


