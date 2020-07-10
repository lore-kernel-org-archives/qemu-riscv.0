Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtsci-0006LW-Sw
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqfc-00069Y-W5
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:54:21 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:34160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1jtqfZ-0006zT-VT
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 06:54:20 -0400
Received: by mail-pj1-x1031.google.com with SMTP id cv18so4421467pjb.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 03:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0y2Zz7uq/+7dxNuHpbzv8HKYgLmeDEKfa3P6rGLA6+c=;
 b=A12frDBzzibMkK7Jj0OGmHNWp4Np+dnQPMTo3TLowKlU188u0DfoGAExV7kmk1YxA7
 4SPZHUtkodeamqpqhBI9kZJ0uD5DYhVZCRaB859eWfRCx9doY8YhZWDJ896hsCO+8W0N
 hgTXkD6t+Z1jzU3/bBYdME7SsfYaVpSODLEmLMUpIgsZnxhxdRTi1QuceVby7XimRwrl
 di1oxGP9gRYgrXnT7/8C4OklGKW/CfF+5+jFpc0RB3tOaMIYBGwxeS5t5x90TGFQN2Xp
 r+iZtKTusM5ct+kcg9lmoG7wxpsnpPnfHNQUM9Kpcryi+gBxoTIUQew+JlM81aGzkE2B
 aWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0y2Zz7uq/+7dxNuHpbzv8HKYgLmeDEKfa3P6rGLA6+c=;
 b=NT044UKTyomUO7jrYtQIsLyRkHt/Bs3NjYYNQW5MFkThoNENniO8hn11IuVrU3HDjS
 M0hXVtJUd2s9nVu4L8qOOvMV5lJfAS1jnjHiK+VgWrsUiWlQxy9NtJ42iZG4OS7Oq8aj
 +g7jP3XU0TvnB7XO9+KbskCdYmOdjqKht52s6wlIiHFUgK2k9lbb+Mu8H5SIEErufh/Z
 khNKEMuN11x3ew/+H+VDehdJyCc4c1jesaN/q5lWDO+/NHXDnFz7qSzZp8Ul93siBd93
 J1qXtzHZeaX3DlNjaBnCOGr8zVtgBrCHRPmwi18hVrFEIacIlvFR+ovkXyUQtPX1r9kN
 hfIg==
X-Gm-Message-State: AOAM532KGbNOTahBSYqUM8sMlvMfsUKM4vGLTmXntVMcjQulHF+4k8BJ
 XBIW3v+KPnZGbACsjCa9EcbWNg==
X-Google-Smtp-Source: ABdhPJwAKetzumjOLTBCPmX2UUm14xgr+EUvT/1d31qBPt9quCyOgHG7UTctjSFehEJ+wF8mpXSdFA==
X-Received: by 2002:a17:90a:348d:: with SMTP id
 p13mr5011708pjb.108.1594378456632; 
 Fri, 10 Jul 2020 03:54:16 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id r191sm5519406pfr.181.2020.07.10.03.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:54:16 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC 55/65] target/riscv: rvv-0.9: remove vmford.vv and vmford.vf
Date: Fri, 10 Jul 2020 18:49:09 +0800
Message-Id: <20200710104920.13550-56-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710104920.13550-1-frank.chang@sifive.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1031.google.com
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
X-List-Received-Date: Fri, 10 Jul 2020 10:54:21 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   |  6 ------
 target/riscv/insn32.decode              |  2 --
 target/riscv/insn_trans/trans_rvv.inc.c |  2 --
 target/riscv/vector_helper.c            | 13 -------------
 4 files changed, 23 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index b56342f333..e9655453bc 100644
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
index 6481fa7465..2490fc5732 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2564,7 +2564,6 @@ GEN_OPFVV_TRANS(vmfeq_vv, opfvv_cmp_check)
 GEN_OPFVV_TRANS(vmfne_vv, opfvv_cmp_check)
 GEN_OPFVV_TRANS(vmflt_vv, opfvv_cmp_check)
 GEN_OPFVV_TRANS(vmfle_vv, opfvv_cmp_check)
-GEN_OPFVV_TRANS(vmford_vv, opfvv_cmp_check)
 
 static bool opfvf_cmp_check(DisasContext *s, arg_rmrr *a)
 {
@@ -2581,7 +2580,6 @@ GEN_OPFVF_TRANS(vmflt_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfle_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfgt_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfge_vf, opfvf_cmp_check)
-GEN_OPFVF_TRANS(vmford_vf, opfvf_cmp_check)
 
 /* Vector Floating-Point Classify Instruction */
 GEN_OPFV_TRANS(vfclass_v, opfv_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 41faa3592e..42a48be5fd 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4107,19 +4107,6 @@ GEN_VEXT_CMP_VF(vmfge_vf_h, uint16_t, H2, vmfge16)
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


