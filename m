Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNKxn-0005D8-OC
	for mharc-qemu-riscv@gnu.org; Tue, 29 Sep 2020 15:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKxl-00057t-CR
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:06:57 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:41097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kNKxj-000296-Eu
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2020 15:06:56 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 197so4627664pge.8
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2020 12:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=meqS5rEIqJ3lN5z0vmhA1onzO2c+vRq1ulNO1cDYlvo=;
 b=a/pXlaqsOfL3u8qLNjjuw19NzjYQ6sSmaIEGDa2W5kx2PwnmB8m5JUMNOCiVRe20PR
 FN93tYkmRUmOgNS8GPQkMBGlBUHsGQAcY0OLFozsz4oMcSwYYAJN9DwZXGLG2wxVIiBw
 ZibGypl6vAN8p1DfGvTkaScJHW0SoCFGmifLcbDV1c1M9bUz5C8VPpxsljrL5ye/kCOd
 GwPbIvw0Jp5KCwdtKbLd+v9THpaaj0w47OF0olB5q1p2WEY2wL4P0LcZ6Gpn7hon4Fsp
 c6axfKvHgSuYwE9y6CXDVIFGfvV1W1NyebYhNxpQeAqSBfHK2uyeUfu4EShzWGD0fRxJ
 BM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=meqS5rEIqJ3lN5z0vmhA1onzO2c+vRq1ulNO1cDYlvo=;
 b=MXl59HSmpIpAnTL5Qh0teoQBlaAM2Gn0fla2rlNucGCMcvIjp5HZwfCp2RLzI9i+Vj
 Vl/Rvgsx/nC/tuuoI2428H89Hor+65mD7Rk0oTnMQjzyz4EbZI1E0q4xnS/Y+tQOdTjw
 eAUJEsf64RTb+bgaiFec6+xmUS0a2lX9G1p6+edKLV5wffGU5hX+Q9w5OATN+U7o4kL/
 BG8oDUT8wZaso/eWIrODRlSbd44hShCaw98PLJJF9SMdKTYiaE6bNkWZ5fZQxE8CqyEF
 gRrTlvx/NSlbHAwQ18Qz9CHpNN3Kvn0sRzoV97fR5W2JE8HjHWpoytHF4i7VkeFexGq/
 hgFA==
X-Gm-Message-State: AOAM531MLB9Q6a9CU/19EGqX5gdoRKvOt5jjMB8edakumyMW7+MPfv2C
 kxYdbusJDGPd6npHHm2ANJ4w0w==
X-Google-Smtp-Source: ABdhPJwQQO8BShIbOYkf696aejPX+caAw3FjHS+mOM/H5C/n9woa99caGjRROw4GggsRANjomBl67g==
X-Received: by 2002:a65:6801:: with SMTP id l1mr4345570pgt.154.1601406414271; 
 Tue, 29 Sep 2020 12:06:54 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id v8sm6003950pgg.58.2020.09.29.12.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 12:06:53 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [RFC v5 28/68] target/riscv: rvv-1.0: mask population count
 instruction
Date: Wed, 30 Sep 2020 03:04:03 +0800
Message-Id: <20200929190448.31116-29-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929190448.31116-1-frank.chang@sifive.com>
References: <20200929190448.31116-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Tue, 29 Sep 2020 19:06:57 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   | 2 +-
 target/riscv/insn32.decode              | 2 +-
 target/riscv/insn_trans/trans_rvv.c.inc | 7 ++++---
 target/riscv/vector_helper.c            | 6 +++---
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 50cca2952c..e046591a42 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1070,7 +1070,7 @@ DEF_HELPER_6(vmnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmornot_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 
-DEF_HELPER_4(vmpopc_m, tl, ptr, ptr, env, i32)
+DEF_HELPER_4(vpopc_m, tl, ptr, ptr, env, i32)
 
 DEF_HELPER_4(vmfirst_m, tl, ptr, ptr, env, i32)
 
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 958914458d..0cb76682a0 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -602,7 +602,7 @@ vmor_mm         011010 - ..... ..... 010 ..... 1010111 @r
 vmnor_mm        011110 - ..... ..... 010 ..... 1010111 @r
 vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
-vmpopc_m        010100 . ..... ----- 010 ..... 1010111 @r2_vm
+vpopc_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
 vmfirst_m       010101 . ..... ----- 010 ..... 1010111 @r2_vm
 vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 1cd0f9b8d1..f9d280b0c5 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2911,8 +2911,8 @@ GEN_MM_TRANS(vmnor_mm)
 GEN_MM_TRANS(vmornot_mm)
 GEN_MM_TRANS(vmxnor_mm)
 
-/* Vector mask population count vmpopc */
-static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
+/* Vector mask population count vpopc */
+static bool trans_vpopc_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s)) {
@@ -2931,13 +2931,14 @@ static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
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
index 8556ab3b0d..517e7344b9 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4420,9 +4420,9 @@ GEN_VEXT_MASK_VV(vmnor_mm, DO_NOR)
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


