Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFTk4-0002c1-PK
	for mharc-qemu-riscv@gnu.org; Thu, 25 Feb 2021 22:24:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTk3-0002YX-7e
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:24:35 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:39734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTk1-0002cB-BA
 for qemu-riscv@nongnu.org; Thu, 25 Feb 2021 22:24:34 -0500
Received: by mail-pj1-x1033.google.com with SMTP id d2so5272478pjs.4
 for <qemu-riscv@nongnu.org>; Thu, 25 Feb 2021 19:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=w+CFS/GOe9cC09QX+0Uhdq5c53y54/tPfyYPRIPpf5w=;
 b=aw3ipDwXuLxoDrWWbdewDdjTNaHn4YKm3UwgRfSOGAwAvKSBdpVPpL8biSva7hKEvK
 OTIaKsBF4xxvDMirb2PHTGfNH6OtBN5+ctp5X4vh98xk0I0VlgSgwTl1jKHEcLdtbadA
 Mu5W4yQtJcK92atUgDbYJJKhE1F+iKP38YpfL+tTbZ0rFIL/4jDApAqPwRdSgd4CSGSW
 yPE6Ge0tUi1ce3pOMsWcK6yIhvlcukSS4b8ZDxE7iXH2Ek3aBOL3fdoasaW0Fx+Es8sd
 1AmkrSkiga+yvl02yKNu6brtdn8A4aNYhYGbnhn6Tg8Qpjxh5sZ+MtyDgsoIE4Q2XPl1
 xeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=w+CFS/GOe9cC09QX+0Uhdq5c53y54/tPfyYPRIPpf5w=;
 b=Yg2vHqP4MYDPPiFStcTMFJLHUJog2jGxGzMC1e+bHz9eK7tRZOlOtTC6tVTRSlVDy+
 CGkY0iR3zrlU240hWfr784brzV+c9CR6lClZOyjNrJcm3kZj2POtOPhR5Sby8Gfdn5i5
 kuSqZVA9flAKNS6mqgQYJxNoZZ/MiwBmrxkEaawL/Q0xiisclaNP+bhnbshXpbOKdBKN
 B/6zsAvgc7qZ/uw4yXrwFvjraEKwfEYs05hqagmh+syhnGkJJa/OsYKCAsu7U4KCgujO
 vOinpG/cE5Iurb8RdnI6OmXMW3NnJzZVyXVfwlcozVazkLJEm74vel/MGZd3vgJnFPUH
 fClw==
X-Gm-Message-State: AOAM530hGZlRHT3Gnmxzqv7hRWTc/n6w0wRb3DdIFEat6fbNnvbm0Yi0
 9PSQEO/t1F5w/++UsocLMIU1gQ==
X-Google-Smtp-Source: ABdhPJwC6hvY7LYijW/9Y+hOOuMx2NtFCciwv5IAqd+YABEcMEiEI1HukGZCb6L49vWRf6yM7FV1CQ==
X-Received: by 2002:a17:90a:17ea:: with SMTP id
 q97mr1212542pja.71.1614309872168; 
 Thu, 25 Feb 2021 19:24:32 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:24:31 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v7 56/75] target/riscv: rvv-1.0: remove vmford.vv and vmford.vf
Date: Fri, 26 Feb 2021 11:18:40 +0800
Message-Id: <20210226031902.23656-57-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1033.google.com
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
X-List-Received-Date: Fri, 26 Feb 2021 03:24:35 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   | 6 ------
 target/riscv/insn32.decode              | 2 --
 target/riscv/insn_trans/trans_rvv.c.inc | 2 --
 target/riscv/vector_helper.c            | 7 -------
 4 files changed, 17 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 24fdc4396bd..cdaa21b7008 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -943,12 +943,6 @@ DEF_HELPER_6(vmfgt_vf_d, void, ptr, ptr, i64, ptr, env, i32)
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
index 0ac3329b3c0..2d96c53d066 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -557,8 +557,6 @@ vmfle_vv        011001 . ..... ..... 001 ..... 1010111 @r_vm
 vmfle_vf        011001 . ..... ..... 101 ..... 1010111 @r_vm
 vmfgt_vf        011101 . ..... ..... 101 ..... 1010111 @r_vm
 vmfge_vf        011111 . ..... ..... 101 ..... 1010111 @r_vm
-vmford_vv       011010 . ..... ..... 001 ..... 1010111 @r_vm
-vmford_vf       011010 . ..... ..... 101 ..... 1010111 @r_vm
 vfclass_v       010011 . ..... 10000 001 ..... 1010111 @r2_vm
 vfmerge_vfm     010111 0 ..... ..... 101 ..... 1010111 @r_vm_0
 vfmv_v_f        010111 1 00000 ..... 101 ..... 1010111 @r2
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 4abafcd2edc..c3ec88e238c 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2655,7 +2655,6 @@ GEN_OPFVV_TRANS(vmfeq_vv, opfvv_cmp_check)
 GEN_OPFVV_TRANS(vmfne_vv, opfvv_cmp_check)
 GEN_OPFVV_TRANS(vmflt_vv, opfvv_cmp_check)
 GEN_OPFVV_TRANS(vmfle_vv, opfvv_cmp_check)
-GEN_OPFVV_TRANS(vmford_vv, opfvv_cmp_check)
 
 static bool opfvf_cmp_check(DisasContext *s, arg_rmrr *a)
 {
@@ -2671,7 +2670,6 @@ GEN_OPFVF_TRANS(vmflt_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfle_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfgt_vf, opfvf_cmp_check)
 GEN_OPFVF_TRANS(vmfge_vf, opfvf_cmp_check)
-GEN_OPFVF_TRANS(vmford_vf, opfvf_cmp_check)
 
 /* Vector Floating-Point Classify Instruction */
 GEN_OPFV_TRANS(vfclass_v, opfv_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 549a476490e..c5e65720120 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3839,13 +3839,6 @@ GEN_VEXT_CMP_VF(vmfge_vf_h, uint16_t, H2, vmfge16)
 GEN_VEXT_CMP_VF(vmfge_vf_w, uint32_t, H4, vmfge32)
 GEN_VEXT_CMP_VF(vmfge_vf_d, uint64_t, H8, vmfge64)
 
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


