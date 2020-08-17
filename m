Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7ara-0000Ck-9e
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7arY-000072-87
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:51:28 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:39881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7arW-00054m-AZ
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:51:27 -0400
Received: by mail-pl1-x62f.google.com with SMTP id g15so3266721plj.6
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LdFgf4NPBtoeqHpSLjq5VQqyoxEgDzcCNkK0t9em+iQ=;
 b=XB2bK0ifvc/Pafw+8p3LqBDW1g0WMYG+SbdiDZyHX2rq9TriBAXzegJwMgrQIA4OOF
 DAt7ZTx5GT2/92kSfA7Q6SVEDcHRe1pgo23ujltCnftAmg+YW4yxK3StyRs0tjhApRmx
 j6S5T+FP+qrj9WB16CU/igMmHRNjBGwLHOvlJ0Vjt1vlQHDSM1Q1jrAwgZS+sP5VUFEx
 1H5tP5AkXB5qtmoPL5PxQxHa82VHQjoWeAuvLDxac3x0FlhnzUj3h1IBF99aGvassj3e
 ehvo0TJy4pmbcOVdk3+QwSNb/fuGWdLWK5dwK/rXxv8pVMMBOtlqTXmdMvXJKShNXgZG
 t7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LdFgf4NPBtoeqHpSLjq5VQqyoxEgDzcCNkK0t9em+iQ=;
 b=HRPcTLX4mWrI9efz/bjJJIwF6FEanCN8LZr+z59dKKy6hQ8oMLAIcCgjg3tgKq+wM3
 Icn4Cq8kL2c3SdEnBWZlOTxG5wJLk+BXK3q1Lz9Kewtck/yiwmflwFi+izyDnIuZbqEK
 C+7IjSmRVX466WwVeTQrBEtHQjBFyLBIW43C7D9BxP3TEJyxSE7/4AWVqBI9r89Trib6
 2qh6bS0IYI0vUIZACgOEbKF/0KwkuRr6gD+aqiK4sqk78JU7bUs+nmPEoiMZlIwJ+7hs
 SXc77vk7sCBORNtDWrBBHsA6hmkB3DtAhYkfp2UNtRsi4C7cuqUCgMl+87AnHmqClKBr
 rkUA==
X-Gm-Message-State: AOAM533e35wDox56J9ktinrNBxLpIhE0W4lLd1GJQZ7cZ8VXS6JtU61v
 3AxqqUJnVod77MvMdL50pxIFkw==
X-Google-Smtp-Source: ABdhPJz8N6fT2prIb1G+GfHxEg+rze8PEY0cz8yCZqnxYTrvHFXGWjlsFlqLpLPd9g9CL9n0Vjbvqg==
X-Received: by 2002:a17:902:690a:: with SMTP id
 j10mr10481468plk.155.1597654285078; 
 Mon, 17 Aug 2020 01:51:25 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:51:24 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 28/70] target/riscv: rvv-1.0: mask population count
 instruction
Date: Mon, 17 Aug 2020 16:49:13 +0800
Message-Id: <20200817084955.28793-29-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62f.google.com
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
X-List-Received-Date: Mon, 17 Aug 2020 08:51:28 -0000

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
index 2c6efce00a7..ce963c33af8 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2895,8 +2895,8 @@ GEN_MM_TRANS(vmnor_mm)
 GEN_MM_TRANS(vmornot_mm)
 GEN_MM_TRANS(vmxnor_mm)
 
-/* Vector mask population count vmpopc */
-static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
+/* Vector mask population count vpopc */
+static bool trans_vpopc_m(DisasContext *s, arg_rmr *a)
 {
     if (require_rvv(s) &&
         vext_check_isa_ill(s)) {
@@ -2915,13 +2915,14 @@ static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
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
index f802e8c9c05..13694c1b2c4 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4447,9 +4447,9 @@ GEN_VEXT_MASK_VV(vmnor_mm, DO_NOR)
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


