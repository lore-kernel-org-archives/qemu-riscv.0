Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAx8-00074c-94
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAx6-00071I-UJ
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:22:16 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:33583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jyAx5-0006Al-1k
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 05:22:16 -0400
Received: by mail-pf1-x436.google.com with SMTP id m9so882503pfh.0
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 02:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=442LCk3HrChupyhPWwxJa1XCObc+Y0ctzDc4sW/DerE=;
 b=AUUz3TUPrKSfmaZtD40AzQEmNwqUwZ5aw8VdC7EdvXbx3tGdx/TeByOfZh7Ml5gWXO
 rhmRRNoAJ5Nl+C3iZGlW11Gw9m+0qKVX5C8Ll2exTW2auGwVbQwbcU1AhWmmQAuuOKoP
 eS5cmctsd6UaWHPPNKG+lJ5/PjsCC7aEDUqnyMBJNKCqFO5yHfPuwe5YJaDo+fS+ukM2
 bKCnPkCzbXu5MvLWObmgXaYrOpYMsIO0LT7QitOzKWJvQslvppbPJwXMnF5x/7BKThh0
 jZjUGHyhquCsd6rO/A7GQZAo3YEX0veMTFWkq++wmWHLzH7yfX1W6pc5P9ibwVqrKSLT
 J4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=442LCk3HrChupyhPWwxJa1XCObc+Y0ctzDc4sW/DerE=;
 b=cjHnCREOUGNA6fThs9kBJ/qlS4xK997h5UAHvkMOXhE4eJdLKhgulXnwfSqtwanvM0
 F+bcStwVN44Zn1P8glpWVNbghaFS1fv99QDXAqJXz9wQYrjeJxaecEeQygR5/yeqCnxv
 PPBad8fe/RGIHi9wfjyfghr0MUS0nUHkmGYmF88zZnS+/iCTHM7ntXbyyyGfTRmOqaB0
 CmdzbPq/p6XvJOrZZgL40HmABIk/9VLz0eCqllP63B7XB+pfLxTUCy/ac5oyljThoYpT
 37vdG8XdxPQjgBHZvTyIqkWoLvvuFN1JKfkRr72xcv4p5VxCVqJdUFPxF47RS4lgfuMv
 3QSA==
X-Gm-Message-State: AOAM531EXaKiIAV/5pa2YOeAiRxc0NsChn2FlM/T10wBTp14b5nt6Fr0
 PWdPFPvyFHxZVDpEBJ+2DvOTEA==
X-Google-Smtp-Source: ABdhPJxKLlRrHkrSisnWO0RODYVg9xR3Cjhtq+9pSLVzrnvWsxHBCtxXzw8P1iz9r7YeOkSFg0Xzrw==
X-Received: by 2002:aa7:9eca:: with SMTP id r10mr27804577pfq.301.1595409733888; 
 Wed, 22 Jul 2020 02:22:13 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c125sm22301879pfa.119.2020.07.22.02.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 02:22:13 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 66/76] target/riscv: rvv-0.9: remove vmford.vv and vmford.vf
Date: Wed, 22 Jul 2020 17:16:29 +0800
Message-Id: <20200722091641.8834-67-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722091641.8834-1-frank.chang@sifive.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x436.google.com
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
X-List-Received-Date: Wed, 22 Jul 2020 09:22:17 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   |  6 ------
 target/riscv/insn32.decode              |  2 --
 target/riscv/insn_trans/trans_rvv.inc.c |  2 --
 target/riscv/vector_helper.c            | 13 -------------
 4 files changed, 23 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index d7f3714ba6..d74dbffc21 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -945,12 +945,6 @@ DEF_HELPER_6(vmfgt_vf_d, void, ptr, ptr, i64, ptr, env, i32)
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
index 2be673c2c7..47337abe52 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -535,8 +535,6 @@ vmfle_vv        011001 . ..... ..... 001 ..... 1010111 @r_vm
 vmfle_vf        011001 . ..... ..... 101 ..... 1010111 @r_vm
 vmfgt_vf        011101 . ..... ..... 101 ..... 1010111 @r_vm
 vmfge_vf        011111 . ..... ..... 101 ..... 1010111 @r_vm
-vmford_vv       011010 . ..... ..... 001 ..... 1010111 @r_vm
-vmford_vf       011010 . ..... ..... 101 ..... 1010111 @r_vm
 vfclass_v       010011 . ..... 10000 001 ..... 1010111 @r2_vm
 vfmerge_vfm     010111 0 ..... ..... 101 ..... 1010111 @r_vm_0
 vfmv_v_f        010111 1 00000 ..... 101 ..... 1010111 @r2
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 9480c64971..ea55428293 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2790,7 +2790,6 @@ GEN_OPFVV_TRANS(vmfeq_vv, opfvv_cmp_check)
 GEN_OPFVV_TRANS(vmfne_vv, opfvv_cmp_check)
 GEN_OPFVV_TRANS(vmflt_vv, opfvv_cmp_check)
 GEN_OPFVV_TRANS(vmfle_vv, opfvv_cmp_check)
-GEN_OPFVV_TRANS(vmford_vv, opfvv_cmp_check)
 
 static bool opfvf_cmp_check(DisasContext *s, arg_rmrr *a)
 {
@@ -2806,7 +2805,6 @@ GEN_OPFVF_TRANS(vmflt_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfle_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfgt_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfge_vf, opfvf_cmp_check)
-GEN_OPFVF_TRANS(vmford_vf, opfvf_cmp_check)
 
 /* Vector Floating-Point Classify Instruction */
 GEN_OPFV_TRANS(vfclass_v, opfv_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index c5fc61bf76..49e6a91859 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4114,19 +4114,6 @@ GEN_VEXT_CMP_VF(vmfge_vf_h, uint16_t, H2, vmfge16)
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


