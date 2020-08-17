Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k7asF-0001RS-6s
	for mharc-qemu-riscv@gnu.org; Mon, 17 Aug 2020 04:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7as9-0001Nl-Sv
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:52:06 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:46277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7as3-0005Aj-B3
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2020 04:52:05 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 189so7155630pgg.13
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2020 01:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lJz8W6hX5ngS4BWDb1bf4KiM+vqTcQBP4VPgUj8yiEA=;
 b=BGUdoibX1eajMIeIS61qvbyDt8Gc8gcNqpbxijT7KUaqWXyyoJIYXVi/QcG4EvcgvM
 HfX8JwZdDlFZxDp3A1ekMGh6vOuCCNQV4DIhRbXA8dScVVb8rTa5KzPgEt7O0JjZmZ9J
 bL09UHvdWTaq0ZUPTAfbY5BrRiG19Ki/U8In5lGs9QNCxj7GpShPo0mULlz4Vm88VqJz
 YzEs2Jx1pnkwL3cHkUUnlFNjSJabsuAv7pzE6FKbWD+Yg4fuU6h6J13PRO7Q1ziX7xaX
 DEXVY0FezQ7iWRwpuJQTy/NzejpR4jsE22/aBKyqdItBibgAX2nLTm13RG7ma43HXPVk
 ejEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lJz8W6hX5ngS4BWDb1bf4KiM+vqTcQBP4VPgUj8yiEA=;
 b=LvAwvVOtUwb/1McyCKlvqKWlTtn6JgN0YFjUI2KM6Fdjtp4Mq+m3bfEOthNJgiiwrA
 j+DC7ACpsguNGwH0PU2LTrFK23ouHGHJKKjlRmrPraiGRFpFRfA+GbNjwgJGt4WTed7T
 yS0xreGnoogl147uLejdbM6jEiER7RsayDRRMrRjxflf5zcA03Hce1ZMD/vPMLwdWm3T
 gD1fcc/OE+QeWmvwE2hRBhQzjpuesoSIxhB4m+pZXIMNCEuu2/O0z1+sTr/zYBSlzoFX
 ph42HIt+Apsdm16RpP7B6+yP/SDEzbOHX140RH1wjrvNCb805qFzrAlWNA7L3phPilRd
 xlVQ==
X-Gm-Message-State: AOAM5329mJbTOopqtBP1KAfdApRNDlwRQCK+rT/F/Mgu2Gd9DlVhciWk
 AP0ovMMvytZeZXDBjO0GmZrGPGi2o+Hweg==
X-Google-Smtp-Source: ABdhPJwbo8z2LENjOSyLo/y50p/s1rSbAX3ppXz9A9IBMh+VTtaOObQX0xKLbTGY50UFxohbM1oIEA==
X-Received: by 2002:a62:1714:: with SMTP id 20mr10784311pfx.133.1597654317883; 
 Mon, 17 Aug 2020 01:51:57 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:51:57 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [RFC v4 40/70] target/riscv: rvv-1.0: single-width averaging add and
 subtract instructions
Date: Mon, 17 Aug 2020 16:49:25 +0800
Message-Id: <20200817084955.28793-41-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52d.google.com
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
X-List-Received-Date: Mon, 17 Aug 2020 08:52:07 -0000

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vaaddu.vv
* vaaddu.vx
* vasubu.vv
* vasubu.vx

Remove the following instructions:

* vadd.vi

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/helper.h                   | 16 ++++++
 target/riscv/insn32.decode              | 13 +++--
 target/riscv/insn_trans/trans_rvv.inc.c |  5 +-
 target/riscv/vector_helper.c            | 74 +++++++++++++++++++++++++
 4 files changed, 102 insertions(+), 6 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 7ce2fa08d58..3560bf1d4f5 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -694,18 +694,34 @@ DEF_HELPER_6(vaadd_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vaadd_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vaadd_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vaadd_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vaaddu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vaaddu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vaaddu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vaaddu_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vasub_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vasub_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vasub_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vasub_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vasubu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vasubu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vasubu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vasubu_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vaadd_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vaadd_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vaadd_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vaadd_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vaaddu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vaaddu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vaaddu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vaaddu_vx_d, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vasub_vx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vasub_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vasub_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vasub_vx_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vasubu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vasubu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vasubu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vasubu_vx_d, void, ptr, ptr, tl, ptr, env, i32)
 
 DEF_HELPER_6(vsmul_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vsmul_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 2b9700a42ad..fd00ee6fdca 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -457,11 +457,14 @@ vssubu_vv       100010 . ..... ..... 000 ..... 1010111 @r_vm
 vssubu_vx       100010 . ..... ..... 100 ..... 1010111 @r_vm
 vssub_vv        100011 . ..... ..... 000 ..... 1010111 @r_vm
 vssub_vx        100011 . ..... ..... 100 ..... 1010111 @r_vm
-vaadd_vv        100100 . ..... ..... 000 ..... 1010111 @r_vm
-vaadd_vx        100100 . ..... ..... 100 ..... 1010111 @r_vm
-vaadd_vi        100100 . ..... ..... 011 ..... 1010111 @r_vm
-vasub_vv        100110 . ..... ..... 000 ..... 1010111 @r_vm
-vasub_vx        100110 . ..... ..... 100 ..... 1010111 @r_vm
+vaadd_vv        001001 . ..... ..... 010 ..... 1010111 @r_vm
+vaadd_vx        001001 . ..... ..... 110 ..... 1010111 @r_vm
+vaaddu_vv       001000 . ..... ..... 010 ..... 1010111 @r_vm
+vaaddu_vx       001000 . ..... ..... 110 ..... 1010111 @r_vm
+vasub_vv        001011 . ..... ..... 010 ..... 1010111 @r_vm
+vasub_vx        001011 . ..... ..... 110 ..... 1010111 @r_vm
+vasubu_vv       001010 . ..... ..... 010 ..... 1010111 @r_vm
+vasubu_vx       001010 . ..... ..... 110 ..... 1010111 @r_vm
 vsmul_vv        100111 . ..... ..... 000 ..... 1010111 @r_vm
 vsmul_vx        100111 . ..... ..... 100 ..... 1010111 @r_vm
 vwsmaccu_vv     111100 . ..... ..... 000 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 5cd099bed7b..16e0941efb6 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2237,10 +2237,13 @@ GEN_OPIVI_TRANS(vsadd_vi, IMM_SX, vsadd_vx, opivx_check)
 
 /* Vector Single-Width Averaging Add and Subtract */
 GEN_OPIVV_TRANS(vaadd_vv, opivv_check)
+GEN_OPIVV_TRANS(vaaddu_vv, opivv_check)
 GEN_OPIVV_TRANS(vasub_vv, opivv_check)
+GEN_OPIVV_TRANS(vasubu_vv, opivv_check)
 GEN_OPIVX_TRANS(vaadd_vx,  opivx_check)
+GEN_OPIVX_TRANS(vaaddu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vasub_vx,  opivx_check)
-GEN_OPIVI_TRANS(vaadd_vi, 0, vaadd_vx, opivx_check)
+GEN_OPIVX_TRANS(vasubu_vx,  opivx_check)
 
 /* Vector Single-Width Fractional Multiply with Rounding and Saturation */
 GEN_OPIVV_TRANS(vsmul_vv, opivv_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index ad3408888d4..ace6fcd28d8 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -2504,6 +2504,43 @@ GEN_VEXT_VX_RM(vaadd_vx_h, 2, 2)
 GEN_VEXT_VX_RM(vaadd_vx_w, 4, 4)
 GEN_VEXT_VX_RM(vaadd_vx_d, 8, 8)
 
+static inline uint32_t aaddu32(CPURISCVState *env, int vxrm,
+                               uint32_t a, uint32_t b)
+{
+    uint64_t res = (uint64_t)a + b;
+    uint8_t round = get_round(vxrm, res, 1);
+
+    return (res >> 1) + round;
+}
+
+static inline uint64_t aaddu64(CPURISCVState *env, int vxrm,
+                               uint64_t a, uint64_t b)
+{
+    uint64_t res = a + b;
+    uint8_t round = get_round(vxrm, res, 1);
+    uint64_t over = (uint64_t)(res < a) << 63;
+
+    return ((res >> 1) | over) + round;
+}
+
+RVVCALL(OPIVV2_RM, vaaddu_vv_b, OP_UUU_B, H1, H1, H1, aaddu32)
+RVVCALL(OPIVV2_RM, vaaddu_vv_h, OP_UUU_H, H2, H2, H2, aaddu32)
+RVVCALL(OPIVV2_RM, vaaddu_vv_w, OP_UUU_W, H4, H4, H4, aaddu32)
+RVVCALL(OPIVV2_RM, vaaddu_vv_d, OP_UUU_D, H8, H8, H8, aaddu64)
+GEN_VEXT_VV_RM(vaaddu_vv_b, 1, 1)
+GEN_VEXT_VV_RM(vaaddu_vv_h, 2, 2)
+GEN_VEXT_VV_RM(vaaddu_vv_w, 4, 4)
+GEN_VEXT_VV_RM(vaaddu_vv_d, 8, 8)
+
+RVVCALL(OPIVX2_RM, vaaddu_vx_b, OP_UUU_B, H1, H1, aaddu32)
+RVVCALL(OPIVX2_RM, vaaddu_vx_h, OP_UUU_H, H2, H2, aaddu32)
+RVVCALL(OPIVX2_RM, vaaddu_vx_w, OP_UUU_W, H4, H4, aaddu32)
+RVVCALL(OPIVX2_RM, vaaddu_vx_d, OP_UUU_D, H8, H8, aaddu64)
+GEN_VEXT_VX_RM(vaaddu_vx_b, 1, 1)
+GEN_VEXT_VX_RM(vaaddu_vx_h, 2, 2)
+GEN_VEXT_VX_RM(vaaddu_vx_w, 4, 4)
+GEN_VEXT_VX_RM(vaaddu_vx_d, 8, 8)
+
 static inline int32_t asub32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
 {
     int64_t res = (int64_t)a - b;
@@ -2540,6 +2577,43 @@ GEN_VEXT_VX_RM(vasub_vx_h, 2, 2)
 GEN_VEXT_VX_RM(vasub_vx_w, 4, 4)
 GEN_VEXT_VX_RM(vasub_vx_d, 8, 8)
 
+static inline uint32_t asubu32(CPURISCVState *env, int vxrm,
+                               uint32_t a, uint32_t b)
+{
+    int64_t res = (int64_t)a - b;
+    uint8_t round = get_round(vxrm, res, 1);
+
+    return (res >> 1) + round;
+}
+
+static inline uint64_t asubu64(CPURISCVState *env, int vxrm,
+                               uint64_t a, uint64_t b)
+{
+    uint64_t res = (uint64_t)a - b;
+    uint8_t round = get_round(vxrm, res, 1);
+    uint64_t over = (uint64_t)(res > a) << 63;
+
+    return ((res >> 1) | over) + round;
+}
+
+RVVCALL(OPIVV2_RM, vasubu_vv_b, OP_UUU_B, H1, H1, H1, asubu32)
+RVVCALL(OPIVV2_RM, vasubu_vv_h, OP_UUU_H, H2, H2, H2, asubu32)
+RVVCALL(OPIVV2_RM, vasubu_vv_w, OP_UUU_W, H4, H4, H4, asubu32)
+RVVCALL(OPIVV2_RM, vasubu_vv_d, OP_UUU_D, H8, H8, H8, asubu64)
+GEN_VEXT_VV_RM(vasubu_vv_b, 1, 1)
+GEN_VEXT_VV_RM(vasubu_vv_h, 2, 2)
+GEN_VEXT_VV_RM(vasubu_vv_w, 4, 4)
+GEN_VEXT_VV_RM(vasubu_vv_d, 8, 8)
+
+RVVCALL(OPIVX2_RM, vasubu_vx_b, OP_UUU_B, H1, H1, asubu32)
+RVVCALL(OPIVX2_RM, vasubu_vx_h, OP_UUU_H, H2, H2, asubu32)
+RVVCALL(OPIVX2_RM, vasubu_vx_w, OP_UUU_W, H4, H4, asubu32)
+RVVCALL(OPIVX2_RM, vasubu_vx_d, OP_UUU_D, H8, H8, asubu64)
+GEN_VEXT_VX_RM(vasubu_vx_b, 1, 1)
+GEN_VEXT_VX_RM(vasubu_vx_h, 2, 2)
+GEN_VEXT_VX_RM(vasubu_vx_w, 4, 4)
+GEN_VEXT_VX_RM(vasubu_vx_d, 8, 8)
+
 /* Vector Single-Width Fractional Multiply with Rounding and Saturation */
 static inline int8_t vsmul8(CPURISCVState *env, int vxrm, int8_t a, int8_t b)
 {
-- 
2.17.1


