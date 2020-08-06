Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3dTB-0004eT-A8
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 06:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dT7-0004aV-Hm
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:49:53 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:35942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k3dT5-00084j-0Z
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 06:49:53 -0400
Received: by mail-pl1-x62d.google.com with SMTP id y6so132747plt.3
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 03:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=glO1yQ9W+Ji+X9b02QK7pYGoe8sPaU9YAwCkFmX+RWg=;
 b=d4hOd8ypJdXvSDKBsvK9QfomKpQeEqcQHwIZWhUnqTwU9VUDPssYdN+vpOPi+0Rs+N
 QojrczJH6fZjkfH4SfPwHB6mgKGH+Mchfr07YQEYw7F1pYxyzTmGnX5uKpWxFhkS9sXF
 O/WSdQkJe8QyzGrEStAVLRp2cfu3bGY0Q6EmS/VaM0a8Ncb4QFoVLDs9pCQ5ijY4PxyK
 VovsTO/Lqsp6t3hbu1BQMqzDVwAiG5GPs1USpdix+HqNhvYCFmlzeXPA5bQ9Rppr23BO
 4T+UOMPYvQj3l4A+ARXygaYEpZGAHfmJTk7IXkP/C9REnU8eE2Pk0hgX/70AtlnLKfmF
 pdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=glO1yQ9W+Ji+X9b02QK7pYGoe8sPaU9YAwCkFmX+RWg=;
 b=HTJGN1a+O5ZE+NYd1U+cs/P50l8/nS4Nq5BKEEipY84qP7cUfwkuCfeTpQBSvLkM1T
 DNoA0EZGbad2iOARK8L3au9cE6K/EUCo/5QKIBZ7wpfhpTTOooKwwxDGrnPpzhfDbtf4
 HvyxsJHWBBcpdIhKHTHcfsAZx8+hCvxIEueA5uo8ErG4oeGraqFNxGHPNaXG3dKE2efh
 ptFDkViykju1z3lBaeWHiFHB9+jLqvSg/G5RpJ4CeARQn673msYTBwDEdq/RO4RZD2e5
 pq99L+06wBzu/SurNXuGnJSEBvbCZ1ihqjB+C2JGuLk8YzZ2aRRXNV2u1E5A7WBgrPd7
 uBwA==
X-Gm-Message-State: AOAM532D1nPsYxHPKDdZkUyAzB9wFFoIkXo8NTuAryrsglOu1P1ijm1B
 tG+Yz5P4Vcp1wotgovMhfN0IMg==
X-Google-Smtp-Source: ABdhPJxzWZKp1VHogul9vJ71sPq5hyUtaWKyB1TN79RZlw4BopdUEgaFHxxthkHG+PZTYURuTfL0sw==
X-Received: by 2002:a17:902:a412:: with SMTP id
 p18mr7085784plq.283.1596710988367; 
 Thu, 06 Aug 2020 03:49:48 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id f18sm6567309pgv.84.2020.08.06.03.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 03:49:48 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v3 61/71] target/riscv: rvv-1.0: remove vmford.vv and vmford.vf
Date: Thu,  6 Aug 2020 18:46:58 +0800
Message-Id: <20200806104709.13235-62-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806104709.13235-1-frank.chang@sifive.com>
References: <20200806104709.13235-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62d.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 10:49:54 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   |  6 ------
 target/riscv/insn32.decode              |  2 --
 target/riscv/insn_trans/trans_rvv.inc.c |  2 --
 target/riscv/vector_helper.c            | 13 -------------
 4 files changed, 23 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index ac655b8f274..a9ec14c49ad 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -963,12 +963,6 @@ DEF_HELPER_6(vmfgt_vf_d, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vmfge_vf_h, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vmfge_vf_w, void, ptr, ptr, i64, ptr, env, i32)
 DEF_HELPER_6(vmfge_vf_d, void, ptr, ptr, i64, ptr, env, i32)
-DEF_HELPER_6(vmford_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vmford_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vmford_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vmford_vf_h, void, ptr, ptr, i64, ptr, env, i32)
-DEF_HELPER_6(vmford_vf_w, void, ptr, ptr, i64, ptr, env, i32)
-DEF_HELPER_6(vmford_vf_d, void, ptr, ptr, i64, ptr, env, i32)
 
 DEF_HELPER_5(vfclass_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfclass_v_w, void, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 99320705cca..994ef3031b5 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -553,8 +553,6 @@ vmfle_vv        011001 . ..... ..... 001 ..... 1010111 @r_vm
 vmfle_vf        011001 . ..... ..... 101 ..... 1010111 @r_vm
 vmfgt_vf        011101 . ..... ..... 101 ..... 1010111 @r_vm
 vmfge_vf        011111 . ..... ..... 101 ..... 1010111 @r_vm
-vmford_vv       011010 . ..... ..... 001 ..... 1010111 @r_vm
-vmford_vf       011010 . ..... ..... 101 ..... 1010111 @r_vm
 vfclass_v       010011 . ..... 10000 001 ..... 1010111 @r2_vm
 vfmerge_vfm     010111 0 ..... ..... 101 ..... 1010111 @r_vm_0
 vfmv_v_f        010111 1 00000 ..... 101 ..... 1010111 @r2
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 1914e547466..718a8834962 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2753,7 +2753,6 @@ GEN_OPFVV_TRANS(vmfeq_vv, opfvv_cmp_check)
 GEN_OPFVV_TRANS(vmfne_vv, opfvv_cmp_check)
 GEN_OPFVV_TRANS(vmflt_vv, opfvv_cmp_check)
 GEN_OPFVV_TRANS(vmfle_vv, opfvv_cmp_check)
-GEN_OPFVV_TRANS(vmford_vv, opfvv_cmp_check)
 
 static bool opfvf_cmp_check(DisasContext *s, arg_rmrr *a)
 {
@@ -2769,7 +2768,6 @@ GEN_OPFVF_TRANS(vmflt_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfle_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfgt_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfge_vf, opfvf_cmp_check)
-GEN_OPFVF_TRANS(vmford_vf, opfvf_cmp_check)
 
 /* Vector Floating-Point Classify Instruction */
 GEN_OPFV_TRANS(vfclass_v, opfv_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 920c2aaf98c..359ed6605c6 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3901,19 +3901,6 @@ GEN_VEXT_CMP_VF(vmfge_vf_h, uint16_t, H2, vmfge16)
 GEN_VEXT_CMP_VF(vmfge_vf_w, uint32_t, H4, vmfge32)
 GEN_VEXT_CMP_VF(vmfge_vf_d, uint64_t, H8, vmfge64)
 
-static bool float16_unordered_quiet(uint16_t a, uint16_t b, float_status *s)
-{
-    FloatRelation compare = float16_compare_quiet(a, b, s);
-    return compare == float_relation_unordered;
-}
-
-GEN_VEXT_CMP_VV_ENV(vmford_vv_h, uint16_t, H2, !float16_unordered_quiet)
-GEN_VEXT_CMP_VV_ENV(vmford_vv_w, uint32_t, H4, !float32_unordered_quiet)
-GEN_VEXT_CMP_VV_ENV(vmford_vv_d, uint64_t, H8, !float64_unordered_quiet)
-GEN_VEXT_CMP_VF(vmford_vf_h, uint16_t, H2, !float16_unordered_quiet)
-GEN_VEXT_CMP_VF(vmford_vf_w, uint32_t, H4, !float32_unordered_quiet)
-GEN_VEXT_CMP_VF(vmford_vf_d, uint64_t, H8, !float64_unordered_quiet)
-
 /* Vector Floating-Point Classify Instruction */
 #define OPIVV1(NAME, TD, T2, TX2, HD, HS2, OP)         \
 static void do_##NAME(void *vd, void *vs2, int i)      \
-- 
2.17.1


