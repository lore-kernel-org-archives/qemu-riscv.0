Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzGDO-0006xn-On
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 04:43:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGDN-0006v2-PL
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:43:49 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:35162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGDL-0008Ln-Cf
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 04:43:49 -0500
Received: by mail-pj1-x1034.google.com with SMTP id b5so1318572pjl.0
 for <qemu-riscv@nongnu.org>; Tue, 12 Jan 2021 01:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=eUoqw8bR8jPzDolBGKVvPijEtmOtmS88HZYblTtGCsw=;
 b=iW8BottD0Bf+aPlTGt+urKX+MvFmhOe3oe/FL846R6i4EqBIDVGezZUe3ERCtcr4mK
 20LpJtPR1TyQ2w/kJPQgz9iMlI2bGTenw5UqiG1fqCcnStHKsx8ufE6AEzpKM6btseSq
 KCLgIEtPJamIDtRVt3LiikwONe//h7o8BRhjVJRmFlu+cyhrW4ZLlWMGKucVzA3+CAHC
 DUdmgOmzjRWHIi9vGbhW6tctPQOJoBqncVH4Qssb+MVUBgnY0AcibISeK764T02OT+6T
 WRSTKOKcd1gMjpuRB1/RB1KOp+7rHlHOCiziLrH3Udf11CCjRT/kM/R9SlV7TTwz7G63
 q9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=eUoqw8bR8jPzDolBGKVvPijEtmOtmS88HZYblTtGCsw=;
 b=ofoWZ+4I85wBc/c91s4IsAg2MrRnPR7Rdctw5ScvsxmW7d7vJp0Ff6WxhNl4IssImY
 8RvbZkNKMHT9rXPWwGPLUfi773f60/hfABJenAwpx1WKFx+1rveHB/DDuD7CrAb52oZG
 PwY+ZAaIMcOoLGg6Brg/XIbpKsBQtXs+x88Sx4/VUMnrPR+wiMMx5g6GVayRGSnhiYx3
 lq0FNKnRn1sMud8EYvHZOYoTD5aMhOcASMm1fCBHoULz1sLxWMI9eLysoMU5M30etpIA
 T3fii2UhM7UiAhbQUsjtqaEWgAIWBa+TqU0tvI32gjAoVEluRBZQBTyYLq2ZfDN5tLfi
 Vgvw==
X-Gm-Message-State: AOAM530QMljuXFd/jdiA4gaPFDT8nrvIWEikDFdRCMEYsGs1w4mrBtLh
 r0xedQQesuHjXSKi8zll48VRLw==
X-Google-Smtp-Source: ABdhPJyTyVwVq2En2BrDkA5OaTn/lpPgoBWg1XSxXGzImzSZ9pxWu42gbE3L9kFJOa4MgvZQeYcjsw==
X-Received: by 2002:a17:90b:204:: with SMTP id
 fy4mr3665582pjb.57.1610444626101; 
 Tue, 12 Jan 2021 01:43:46 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:43:45 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v6 55/72] target/riscv: rvv-1.0: remove widening saturating
 scaled multiply-add
Date: Tue, 12 Jan 2021 17:39:29 +0800
Message-Id: <20210112093950.17530-56-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1034.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 09:43:50 -0000

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
index 2e4ed26f89c..24fdc4396bd 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -727,28 +727,6 @@ DEF_HELPER_6(vsmul_vx_h, void, ptr, ptr, tl, ptr, env, i32)
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
index ac1bcab9627..0ac3329b3c0 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -478,13 +478,6 @@ vasubu_vv       001010 . ..... ..... 010 ..... 1010111 @r_vm
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
index 2188e92064f..4abafcd2edc 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2249,15 +2249,6 @@ GEN_OPIVX_TRANS(vasubu_vx,  opivx_check)
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
index e6931466d40..549a476490e 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -2703,211 +2703,6 @@ GEN_VEXT_VX_RM(vsmul_vx_h, 2, 2)
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
2.17.1


