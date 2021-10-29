Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNnC-00086n-Ed
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNn6-000843-Or
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:03:14 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:42787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNn4-0006dv-GJ
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:03:12 -0400
Received: by mail-pf1-x431.google.com with SMTP id m14so8648545pfc.9
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ojVy87w7rLmDpCzSt0H+za1Y68Jzkmx6I4ZCOTE3Jlc=;
 b=Sm0goNiajwHe7JFnmT2+3x9lwZVHOGJXffATIXUq2sN8gQvEjfoabnHFetfZCu3kpD
 7lyc/kNE8DWgdv7cFl713gKCBPSOUkr2OT/QoinlbnBXLN1buWR9uKGah841d+QIJqy7
 Efcoix7AhGm21ULiss+nhk83TwYfTm/sLaa6SuQuJb1pOmqRuIyd3bFl/pp0HjYmfR+1
 uuaFAPNcOFTC7UfJwKYozBPAj6ywWBMsBj5lxjcJ4hgqbmNXOpdX+XApExUyfOLs8D2/
 1ULaM9AQzkpDPe31KGZaKB95oXYWDfsNAauTVTuT0mWnA17qFtaNCFij3A7GLUkNcOAV
 /rnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ojVy87w7rLmDpCzSt0H+za1Y68Jzkmx6I4ZCOTE3Jlc=;
 b=qaoCoylIyWNC5XbFusoKdQYb82g41/mGOg0P3RCxtvUZTK67SOww4NzEJgFN9FKnBE
 z3KMzWP0wmbL6kj+MTUz32ysLC4LxtscuOxH/+1KiF09YKZ6urgkcdnW7jVjyVjUD5vm
 ZNWzDb3B7Gdd1hz7apxAizP5TehtKXbSOWZcjgf5lrfZBI0MJsqtCKzAaADFvnEDJk87
 cf95SYp6g8Q9jOJNmsf+WHlNil4HdLNFfK9BQQHQzXSIGDMtY7J0meWBGvxp0H3iYyi/
 aw2Yp922bywB+amTcEcl9ihWcxXxxE2S1kdSaVID5r/oN83Lg8gvf/z3BD3OxQgkTuA6
 0S8w==
X-Gm-Message-State: AOAM530uSRUJvcQ/yGDzoR90Q9ZjKAu7GbEvIvbsE7Mgst8k6ShFagYP
 cYa3n0Zu8fgsq1lLGE71iKPHOw==
X-Google-Smtp-Source: ABdhPJyX6cHdWqf8TcNMQX/TDwn6tcyls8PaTVVfsi3CciZHmz//a0YWvkfaZIR2o5EMC7LIslY6cg==
X-Received: by 2002:aa7:8e12:0:b0:47b:dcda:658 with SMTP id
 c18-20020aa78e12000000b0047bdcda0658mr9630992pfr.46.1635498188492; 
 Fri, 29 Oct 2021 02:03:08 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:03:08 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v9 56/76] target/riscv: rvv-1.0: remove widening saturating
 scaled multiply-add
Date: Fri, 29 Oct 2021 16:59:01 +0800
Message-Id: <20211029085922.255197-57-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x431.google.com
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
X-List-Received-Date: Fri, 29 Oct 2021 09:03:16 -0000

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   |  22 ---
 target/riscv/insn32.decode              |   7 -
 target/riscv/insn_trans/trans_rvv.c.inc |   9 --
 target/riscv/vector_helper.c            | 205 ------------------------
 4 files changed, 243 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 3ea21b4a578..af79570da8f 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -686,28 +686,6 @@ DEF_HELPER_6(vsmul_vx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vsmul_vx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vsmul_vx_d, void, ptr, ptr, tl, ptr, env, i32)
 
-DEF_HELPER_6(vwsmaccu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vwsmaccu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vwsmaccu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vwsmacc_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vwsmacc_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vwsmacc_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vwsmaccsu_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vwsmaccsu_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vwsmaccsu_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vwsmaccu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vwsmaccu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vwsmaccu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vwsmacc_vx_b, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vwsmacc_vx_h, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vwsmacc_vx_w, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vwsmaccsu_vx_b, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vwsmaccsu_vx_h, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vwsmaccsu_vx_w, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vwsmaccus_vx_b, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vwsmaccus_vx_h, void, ptr, ptr, tl, ptr, env, i32)
-DEF_HELPER_6(vwsmaccus_vx_w, void, ptr, ptr, tl, ptr, env, i32)
-
 DEF_HELPER_6(vssrl_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vssrl_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vssrl_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index eeab6b00a1b..aee3a6cd01f 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -503,13 +503,6 @@ vasubu_vv       001010 . ..... ..... 010 ..... 1010111 @r_vm
 vasubu_vx       001010 . ..... ..... 110 ..... 1010111 @r_vm
 vsmul_vv        100111 . ..... ..... 000 ..... 1010111 @r_vm
 vsmul_vx        100111 . ..... ..... 100 ..... 1010111 @r_vm
-vwsmaccu_vv     111100 . ..... ..... 000 ..... 1010111 @r_vm
-vwsmaccu_vx     111100 . ..... ..... 100 ..... 1010111 @r_vm
-vwsmacc_vv      111101 . ..... ..... 000 ..... 1010111 @r_vm
-vwsmacc_vx      111101 . ..... ..... 100 ..... 1010111 @r_vm
-vwsmaccsu_vv    111110 . ..... ..... 000 ..... 1010111 @r_vm
-vwsmaccsu_vx    111110 . ..... ..... 100 ..... 1010111 @r_vm
-vwsmaccus_vx    111111 . ..... ..... 100 ..... 1010111 @r_vm
 vssrl_vv        101010 . ..... ..... 000 ..... 1010111 @r_vm
 vssrl_vx        101010 . ..... ..... 100 ..... 1010111 @r_vm
 vssrl_vi        101010 . ..... ..... 011 ..... 1010111 @r_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 03716ad7066..119c82ca47e 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2016,15 +2016,6 @@ GEN_OPIVX_TRANS(vasubu_vx,  opivx_check)
 GEN_OPIVV_TRANS(vsmul_vv, opivv_check)
 GEN_OPIVX_TRANS(vsmul_vx,  opivx_check)
 
-/* Vector Widening Saturating Scaled Multiply-Add */
-GEN_OPIVV_WIDEN_TRANS(vwsmaccu_vv, opivv_widen_check)
-GEN_OPIVV_WIDEN_TRANS(vwsmacc_vv, opivv_widen_check)
-GEN_OPIVV_WIDEN_TRANS(vwsmaccsu_vv, opivv_widen_check)
-GEN_OPIVX_WIDEN_TRANS(vwsmaccu_vx)
-GEN_OPIVX_WIDEN_TRANS(vwsmacc_vx)
-GEN_OPIVX_WIDEN_TRANS(vwsmaccsu_vx)
-GEN_OPIVX_WIDEN_TRANS(vwsmaccus_vx)
-
 /* Vector Single-Width Scaling Shift Instructions */
 GEN_OPIVV_TRANS(vssrl_vv, opivv_check)
 GEN_OPIVV_TRANS(vssra_vv, opivv_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 79a2c3ff3ac..128406aa780 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -2494,211 +2494,6 @@ GEN_VEXT_VX_RM(vsmul_vx_h, 2, 2)
 GEN_VEXT_VX_RM(vsmul_vx_w, 4, 4)
 GEN_VEXT_VX_RM(vsmul_vx_d, 8, 8)
 
-/* Vector Widening Saturating Scaled Multiply-Add */
-static inline uint16_t
-vwsmaccu8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b,
-          uint16_t c)
-{
-    uint8_t round;
-    uint16_t res = (uint16_t)a * b;
-
-    round = get_round(vxrm, res, 4);
-    res   = (res >> 4) + round;
-    return saddu16(env, vxrm, c, res);
-}
-
-static inline uint32_t
-vwsmaccu16(CPURISCVState *env, int vxrm, uint16_t a, uint16_t b,
-           uint32_t c)
-{
-    uint8_t round;
-    uint32_t res = (uint32_t)a * b;
-
-    round = get_round(vxrm, res, 8);
-    res   = (res >> 8) + round;
-    return saddu32(env, vxrm, c, res);
-}
-
-static inline uint64_t
-vwsmaccu32(CPURISCVState *env, int vxrm, uint32_t a, uint32_t b,
-           uint64_t c)
-{
-    uint8_t round;
-    uint64_t res = (uint64_t)a * b;
-
-    round = get_round(vxrm, res, 16);
-    res   = (res >> 16) + round;
-    return saddu64(env, vxrm, c, res);
-}
-
-#define OPIVV3_RM(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2, OP)    \
-static inline void                                                 \
-do_##NAME(void *vd, void *vs1, void *vs2, int i,                   \
-          CPURISCVState *env, int vxrm)                            \
-{                                                                  \
-    TX1 s1 = *((T1 *)vs1 + HS1(i));                                \
-    TX2 s2 = *((T2 *)vs2 + HS2(i));                                \
-    TD d = *((TD *)vd + HD(i));                                    \
-    *((TD *)vd + HD(i)) = OP(env, vxrm, s2, s1, d);                \
-}
-
-RVVCALL(OPIVV3_RM, vwsmaccu_vv_b, WOP_UUU_B, H2, H1, H1, vwsmaccu8)
-RVVCALL(OPIVV3_RM, vwsmaccu_vv_h, WOP_UUU_H, H4, H2, H2, vwsmaccu16)
-RVVCALL(OPIVV3_RM, vwsmaccu_vv_w, WOP_UUU_W, H8, H4, H4, vwsmaccu32)
-GEN_VEXT_VV_RM(vwsmaccu_vv_b, 1, 2)
-GEN_VEXT_VV_RM(vwsmaccu_vv_h, 2, 4)
-GEN_VEXT_VV_RM(vwsmaccu_vv_w, 4, 8)
-
-#define OPIVX3_RM(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)         \
-static inline void                                                 \
-do_##NAME(void *vd, target_long s1, void *vs2, int i,              \
-          CPURISCVState *env, int vxrm)                            \
-{                                                                  \
-    TX2 s2 = *((T2 *)vs2 + HS2(i));                                \
-    TD d = *((TD *)vd + HD(i));                                    \
-    *((TD *)vd + HD(i)) = OP(env, vxrm, s2, (TX1)(T1)s1, d);       \
-}
-
-RVVCALL(OPIVX3_RM, vwsmaccu_vx_b, WOP_UUU_B, H2, H1, vwsmaccu8)
-RVVCALL(OPIVX3_RM, vwsmaccu_vx_h, WOP_UUU_H, H4, H2, vwsmaccu16)
-RVVCALL(OPIVX3_RM, vwsmaccu_vx_w, WOP_UUU_W, H8, H4, vwsmaccu32)
-GEN_VEXT_VX_RM(vwsmaccu_vx_b, 1, 2)
-GEN_VEXT_VX_RM(vwsmaccu_vx_h, 2, 4)
-GEN_VEXT_VX_RM(vwsmaccu_vx_w, 4, 8)
-
-static inline int16_t
-vwsmacc8(CPURISCVState *env, int vxrm, int8_t a, int8_t b, int16_t c)
-{
-    uint8_t round;
-    int16_t res = (int16_t)a * b;
-
-    round = get_round(vxrm, res, 4);
-    res   = (res >> 4) + round;
-    return sadd16(env, vxrm, c, res);
-}
-
-static inline int32_t
-vwsmacc16(CPURISCVState *env, int vxrm, int16_t a, int16_t b, int32_t c)
-{
-    uint8_t round;
-    int32_t res = (int32_t)a * b;
-
-    round = get_round(vxrm, res, 8);
-    res   = (res >> 8) + round;
-    return sadd32(env, vxrm, c, res);
-
-}
-
-static inline int64_t
-vwsmacc32(CPURISCVState *env, int vxrm, int32_t a, int32_t b, int64_t c)
-{
-    uint8_t round;
-    int64_t res = (int64_t)a * b;
-
-    round = get_round(vxrm, res, 16);
-    res   = (res >> 16) + round;
-    return sadd64(env, vxrm, c, res);
-}
-
-RVVCALL(OPIVV3_RM, vwsmacc_vv_b, WOP_SSS_B, H2, H1, H1, vwsmacc8)
-RVVCALL(OPIVV3_RM, vwsmacc_vv_h, WOP_SSS_H, H4, H2, H2, vwsmacc16)
-RVVCALL(OPIVV3_RM, vwsmacc_vv_w, WOP_SSS_W, H8, H4, H4, vwsmacc32)
-GEN_VEXT_VV_RM(vwsmacc_vv_b, 1, 2)
-GEN_VEXT_VV_RM(vwsmacc_vv_h, 2, 4)
-GEN_VEXT_VV_RM(vwsmacc_vv_w, 4, 8)
-RVVCALL(OPIVX3_RM, vwsmacc_vx_b, WOP_SSS_B, H2, H1, vwsmacc8)
-RVVCALL(OPIVX3_RM, vwsmacc_vx_h, WOP_SSS_H, H4, H2, vwsmacc16)
-RVVCALL(OPIVX3_RM, vwsmacc_vx_w, WOP_SSS_W, H8, H4, vwsmacc32)
-GEN_VEXT_VX_RM(vwsmacc_vx_b, 1, 2)
-GEN_VEXT_VX_RM(vwsmacc_vx_h, 2, 4)
-GEN_VEXT_VX_RM(vwsmacc_vx_w, 4, 8)
-
-static inline int16_t
-vwsmaccsu8(CPURISCVState *env, int vxrm, uint8_t a, int8_t b, int16_t c)
-{
-    uint8_t round;
-    int16_t res = a * (int16_t)b;
-
-    round = get_round(vxrm, res, 4);
-    res   = (res >> 4) + round;
-    return ssub16(env, vxrm, c, res);
-}
-
-static inline int32_t
-vwsmaccsu16(CPURISCVState *env, int vxrm, uint16_t a, int16_t b, uint32_t c)
-{
-    uint8_t round;
-    int32_t res = a * (int32_t)b;
-
-    round = get_round(vxrm, res, 8);
-    res   = (res >> 8) + round;
-    return ssub32(env, vxrm, c, res);
-}
-
-static inline int64_t
-vwsmaccsu32(CPURISCVState *env, int vxrm, uint32_t a, int32_t b, int64_t c)
-{
-    uint8_t round;
-    int64_t res = a * (int64_t)b;
-
-    round = get_round(vxrm, res, 16);
-    res   = (res >> 16) + round;
-    return ssub64(env, vxrm, c, res);
-}
-
-RVVCALL(OPIVV3_RM, vwsmaccsu_vv_b, WOP_SSU_B, H2, H1, H1, vwsmaccsu8)
-RVVCALL(OPIVV3_RM, vwsmaccsu_vv_h, WOP_SSU_H, H4, H2, H2, vwsmaccsu16)
-RVVCALL(OPIVV3_RM, vwsmaccsu_vv_w, WOP_SSU_W, H8, H4, H4, vwsmaccsu32)
-GEN_VEXT_VV_RM(vwsmaccsu_vv_b, 1, 2)
-GEN_VEXT_VV_RM(vwsmaccsu_vv_h, 2, 4)
-GEN_VEXT_VV_RM(vwsmaccsu_vv_w, 4, 8)
-RVVCALL(OPIVX3_RM, vwsmaccsu_vx_b, WOP_SSU_B, H2, H1, vwsmaccsu8)
-RVVCALL(OPIVX3_RM, vwsmaccsu_vx_h, WOP_SSU_H, H4, H2, vwsmaccsu16)
-RVVCALL(OPIVX3_RM, vwsmaccsu_vx_w, WOP_SSU_W, H8, H4, vwsmaccsu32)
-GEN_VEXT_VX_RM(vwsmaccsu_vx_b, 1, 2)
-GEN_VEXT_VX_RM(vwsmaccsu_vx_h, 2, 4)
-GEN_VEXT_VX_RM(vwsmaccsu_vx_w, 4, 8)
-
-static inline int16_t
-vwsmaccus8(CPURISCVState *env, int vxrm, int8_t a, uint8_t b, int16_t c)
-{
-    uint8_t round;
-    int16_t res = (int16_t)a * b;
-
-    round = get_round(vxrm, res, 4);
-    res   = (res >> 4) + round;
-    return ssub16(env, vxrm, c, res);
-}
-
-static inline int32_t
-vwsmaccus16(CPURISCVState *env, int vxrm, int16_t a, uint16_t b, int32_t c)
-{
-    uint8_t round;
-    int32_t res = (int32_t)a * b;
-
-    round = get_round(vxrm, res, 8);
-    res   = (res >> 8) + round;
-    return ssub32(env, vxrm, c, res);
-}
-
-static inline int64_t
-vwsmaccus32(CPURISCVState *env, int vxrm, int32_t a, uint32_t b, int64_t c)
-{
-    uint8_t round;
-    int64_t res = (int64_t)a * b;
-
-    round = get_round(vxrm, res, 16);
-    res   = (res >> 16) + round;
-    return ssub64(env, vxrm, c, res);
-}
-
-RVVCALL(OPIVX3_RM, vwsmaccus_vx_b, WOP_SUS_B, H2, H1, vwsmaccus8)
-RVVCALL(OPIVX3_RM, vwsmaccus_vx_h, WOP_SUS_H, H4, H2, vwsmaccus16)
-RVVCALL(OPIVX3_RM, vwsmaccus_vx_w, WOP_SUS_W, H8, H4, vwsmaccus32)
-GEN_VEXT_VX_RM(vwsmaccus_vx_b, 1, 2)
-GEN_VEXT_VX_RM(vwsmaccus_vx_h, 2, 4)
-GEN_VEXT_VX_RM(vwsmaccus_vx_w, 4, 8)
-
 /* Vector Single-Width Scaling Shift Instructions */
 static inline uint8_t
 vssrl8(CPURISCVState *env, int vxrm, uint8_t a, uint8_t b)
-- 
2.25.1


