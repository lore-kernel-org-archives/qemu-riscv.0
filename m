Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgNmA-0006jK-Ku
	for mharc-qemu-riscv@gnu.org; Fri, 29 Oct 2021 05:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNm8-0006dV-Dr
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:02:12 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:40928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNm6-00068h-4W
 for qemu-riscv@nongnu.org; Fri, 29 Oct 2021 05:02:12 -0400
Received: by mail-pl1-x631.google.com with SMTP id v20so6398529plo.7
 for <qemu-riscv@nongnu.org>; Fri, 29 Oct 2021 02:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zCURpOhrcaDgxr9SIVGEmcKcjEEwRqtokbG08irfUpw=;
 b=AZnEOrX/iAz2e0Oe/hQUrTX+KR9ZCS75zjg9BXpLN9LkeSjXEihzFMdB70iExHnNZA
 NH+47n8+KLilxqHYZP8aE9lgEO4wYjdFomjnOkwMqHW2sJCB4IdkbjCueLsam9YCtoYg
 12pzxdQcTyFXYNE8Xl3q3FC4g4cf5IcM/7gbd1qWBHlQh1g+Je9Qv5tep5Av0w8Fa9oG
 T1AdS0Gjl7ZZ5W6S1VM41Wslo+gWCAQTwo2WkVB6HnwnDDNgPxbhM+s8lZTRyclbxHFk
 LqvWMk9Pb93owNG0nYGQrmALoB/z4XQeEv5WjFjwyjhnP8s1HPkDjwJWx0F4VJJTfBNZ
 9b0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zCURpOhrcaDgxr9SIVGEmcKcjEEwRqtokbG08irfUpw=;
 b=hW6XKZCcPI1OqkQtYYn4tCEbxzhWhCjHwixpMRu+FkXBUAqqhUr4ycnGBIoXVjk5Z7
 94gOwoAIfCxc7KAsbHnyARKtV8d9ADHlT7f/qjucrvRODRCvHE9/3gPoIg3A+GltMai/
 iyDb/AuW8tyRpnT+QwSmXoRJzdCKUxgLgl4mpGSfW7l/jl/hB2JYJYTmTM1EaJku3ttg
 GIiGJ9Z1YjdVOhbZD1PGYGCVCtpXw1Ki1ju7/ouzG1b3PjPBES748x8gsHRxqw93Tbxn
 wWTnXU9pXoMhh20iyiqP0hO6vNiQIDAl8X0r70nnCs5W+29uA9u0ycwEi9vKCe7v1zTX
 q+Yw==
X-Gm-Message-State: AOAM532KqMoIROD2Wkm1mVxSkxtgc9Gb7m5xvRPcRS6QwA4klV2Gg6gv
 ynTNNSfdF/7g7Gyci8Cq73fvTQ==
X-Google-Smtp-Source: ABdhPJxeup/PpFSWH1PzuF2ysz2s9cipH+JdwxVCHJGR5rOY13UoJ8yuN2Pp441NC0aAyiNPIOtOWA==
X-Received: by 2002:a17:902:6b83:b0:141:6368:3562 with SMTP id
 p3-20020a1709026b8300b0014163683562mr8472842plk.42.1635498128940; 
 Fri, 29 Oct 2021 02:02:08 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:02:08 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PATCH v9 41/76] target/riscv: rvv-1.0: single-width averaging add
 and subtract instructions
Date: Fri, 29 Oct 2021 16:58:46 +0800
Message-Id: <20211029085922.255197-42-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x631.google.com
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
X-List-Received-Date: Fri, 29 Oct 2021 09:02:13 -0000

From: Frank Chang <frank.chang@sifive.com>

Add the following instructions:

* vaaddu.vv
* vaaddu.vx
* vasubu.vv
* vasubu.vx

Remove the following instructions:

* vadd.vi

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h                   | 16 ++++++
 target/riscv/insn32.decode              | 13 +++--
 target/riscv/insn_trans/trans_rvv.c.inc |  5 +-
 target/riscv/vector_helper.c            | 74 +++++++++++++++++++++++++
 4 files changed, 102 insertions(+), 6 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 878d82caf61..f2e8d107d2f 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -648,18 +648,34 @@ DEF_HELPER_6(vaadd_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
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
index a6f9e5dcc66..f83c8daf24e 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -493,11 +493,14 @@ vssubu_vv       100010 . ..... ..... 000 ..... 1010111 @r_vm
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
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 5285e21cc09..0076ce5a0a9 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2004,10 +2004,13 @@ GEN_OPIVI_TRANS(vsadd_vi, IMM_SX, vsadd_vx, opivx_check)
 
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
index 58ba2a7d99b..6891f28116f 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -2295,6 +2295,43 @@ GEN_VEXT_VX_RM(vaadd_vx_h, 2, 2)
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
@@ -2331,6 +2368,43 @@ GEN_VEXT_VX_RM(vasub_vx_h, 2, 2)
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
2.25.1


