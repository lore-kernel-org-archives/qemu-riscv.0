Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmYtB-0004rS-Ay
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 07:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYt3-0004gV-UX
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:41 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYt1-0002NR-2K
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 07:43:41 -0400
Received: by mail-wr1-x42b.google.com with SMTP id s2so7309689wra.7
 for <qemu-riscv@nongnu.org>; Wed, 12 Apr 2023 04:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299817; x=1683891817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sZWSjtdLuqRfAHXhQ1Qn/4gxDZYp/Ml73FoJP/ry5BM=;
 b=zpqh7kOkoha8JhKb8g6iNhXDgtTC5gVB1VnvX3BxHnU+cYFLT6D2R1NFVydFAqm0yA
 eRGva3gmlWbKGZAPpDWsXHHKW4Gjw2p0PvqEEvwqgc1ND3q3IGkp0njS7U5Q1ClLZSy3
 RiIVBc4JVY8wPe4h/YmX0VWygaRV9WTN3x8X1ISiJp54+rgNtN5SvlZ4qTNCMXyYarmq
 q6RcX0og6WA8/rDTOZA4C22iNXQIeZWWXnd/sfxE85VqwqpUX3vsufs8zea+IDSrey8g
 B6lwAKgtn31TkxxGoCjnA8KYd7eVHXQl1u1/91DbYh70K/2+Hk5kd+XUuPPeZYDw+o5v
 uz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299817; x=1683891817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sZWSjtdLuqRfAHXhQ1Qn/4gxDZYp/Ml73FoJP/ry5BM=;
 b=bFbbyqSaG6NmahePiLZIk2sUbpweNBfRySlL8q8L8OgKLgfZu+uysm2r/Dswy/u8od
 rMOi+SqI5bonkc8HOjM5TTMX3OttB+h3h7mIY0dJWZ/5ZlgHcT8HQ+r2sVIUvw7QmmtT
 3M5H8Xl+8DaiVMLhWE/SImxL4RqJ4AbrZEnrtKxWBOGyAdf5NJnARqo5sFU4daQtltmR
 0jWKEPLAZpMXZFrF/NERxHyajJOLlZSwkJ0itgKFY5b100SXQqev5/mBz0frNq1UAHNm
 iPcBA2YuXvTQpKwvSLOrYc4DOOxr4/XHxbrQyBqqd7d4P1jm3teb1mvHkGuZKURf/PSU
 IkFw==
X-Gm-Message-State: AAQBX9eV2ux429Pp911rhZjmPxEhjR/W4WFf+DubbejN4Rm1bL5c+NF/
 B1mzv533jYp8/lCVJ2YOxYl3aA==
X-Google-Smtp-Source: AKy350ZaDMMESbl/6kbV9YprKZDOelzwcaB+WpQB+So77RUf4yqwE9MSQKfJUlFFFkCdXmCyr7wUNw==
X-Received: by 2002:a5d:4564:0:b0:2ef:ba74:44c2 with SMTP id
 a4-20020a5d4564000000b002efba7444c2mr1748824wrc.2.1681299817039; 
 Wed, 12 Apr 2023 04:43:37 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 02/25] target/riscv: Add a general status enum for
 extensions
Date: Wed, 12 Apr 2023 13:43:10 +0200
Message-Id: <20230412114333.118895-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
References: <20230412114333.118895-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Apr 2023 11:43:42 -0000

From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

The pointer masking is the only extension that directly use status.
The vector or float extension uses the status in an indirect way.

Replace the pointer masking extension special status fields with
the general status.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-Id: <20230324143031.1093-3-zhiwei_liu@linux.alibaba.com>
[rth: Add a typedef for the enum]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-3-richard.henderson@linaro.org>
---
 target/riscv/cpu.h      |  8 ++++++++
 target/riscv/cpu_bits.h | 12 ++++--------
 target/riscv/cpu.c      |  2 +-
 target/riscv/csr.c      | 14 +++++++-------
 4 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index aa53d0e256..ba11279716 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -97,6 +97,14 @@ enum {
     TRANSLATE_G_STAGE_FAIL
 };
 
+/* Extension context status */
+typedef enum {
+    EXT_STATUS_DISABLED = 0,
+    EXT_STATUS_INITIAL,
+    EXT_STATUS_CLEAN,
+    EXT_STATUS_DIRTY,
+} RISCVExtStatus;
+
 #define MMU_USER_IDX 3
 
 #define MAX_RISCV_PMPS (16)
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index a16bfaf43f..fb63b8e125 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -9,6 +9,9 @@
                  (((uint64_t)(val) * ((mask) & ~((mask) << 1))) & \
                  (uint64_t)(mask)))
 
+/* Extension context status mask */
+#define EXT_STATUS_MASK     0x3ULL
+
 /* Floating point round mode */
 #define FSR_RD_SHIFT        5
 #define FSR_RD              (0x7 << FSR_RD_SHIFT)
@@ -735,13 +738,6 @@ typedef enum RISCVException {
 #define PM_ENABLE       0x00000001ULL
 #define PM_CURRENT      0x00000002ULL
 #define PM_INSN         0x00000004ULL
-#define PM_XS_MASK      0x00000003ULL
-
-/* PointerMasking XS bits values */
-#define PM_EXT_DISABLE  0x00000000ULL
-#define PM_EXT_INITIAL  0x00000001ULL
-#define PM_EXT_CLEAN    0x00000002ULL
-#define PM_EXT_DIRTY    0x00000003ULL
 
 /* Execution enviornment configuration bits */
 #define MENVCFG_FIOM                       BIT(0)
@@ -781,7 +777,7 @@ typedef enum RISCVException {
 #define S_OFFSET     5ULL
 #define M_OFFSET     8ULL
 
-#define PM_XS_BITS   (PM_XS_MASK << XS_OFFSET)
+#define PM_XS_BITS   (EXT_STATUS_MASK << XS_OFFSET)
 #define U_PM_ENABLE  (PM_ENABLE  << U_OFFSET)
 #define U_PM_CURRENT (PM_CURRENT << U_OFFSET)
 #define U_PM_INSN    (PM_INSN    << U_OFFSET)
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fab38859ec..32c04214a1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -759,7 +759,7 @@ static void riscv_cpu_reset_hold(Object *obj)
         i++;
     }
     /* mmte is supposed to have pm.current hardwired to 1 */
-    env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
+    env->mmte |= (EXT_STATUS_INITIAL | MMTE_M_PM_CURRENT);
 #endif
     env->xl = riscv_cpu_mxl(env);
     riscv_cpu_update_mask(env);
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index f4d2dcfdc8..4268828dc4 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3534,7 +3534,7 @@ static RISCVException write_mmte(CPURISCVState *env, int csrno,
 
     /* hardwiring pm.instruction bit to 0, since it's not supported yet */
     wpri_val &= ~(MMTE_M_PM_INSN | MMTE_S_PM_INSN | MMTE_U_PM_INSN);
-    env->mmte = wpri_val | PM_EXT_DIRTY;
+    env->mmte = wpri_val | EXT_STATUS_DIRTY;
     riscv_cpu_update_mask(env);
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -3614,7 +3614,7 @@ static RISCVException write_mpmmask(CPURISCVState *env, int csrno,
     if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
         env->cur_pmmask = val;
     }
-    env->mmte |= PM_EXT_DIRTY;
+    env->mmte |= EXT_STATUS_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
@@ -3642,7 +3642,7 @@ static RISCVException write_spmmask(CPURISCVState *env, int csrno,
     if ((env->priv == PRV_S) && (env->mmte & S_PM_ENABLE)) {
         env->cur_pmmask = val;
     }
-    env->mmte |= PM_EXT_DIRTY;
+    env->mmte |= EXT_STATUS_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
@@ -3670,7 +3670,7 @@ static RISCVException write_upmmask(CPURISCVState *env, int csrno,
     if ((env->priv == PRV_U) && (env->mmte & U_PM_ENABLE)) {
         env->cur_pmmask = val;
     }
-    env->mmte |= PM_EXT_DIRTY;
+    env->mmte |= EXT_STATUS_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
@@ -3694,7 +3694,7 @@ static RISCVException write_mpmbase(CPURISCVState *env, int csrno,
     if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
         env->cur_pmbase = val;
     }
-    env->mmte |= PM_EXT_DIRTY;
+    env->mmte |= EXT_STATUS_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
@@ -3722,7 +3722,7 @@ static RISCVException write_spmbase(CPURISCVState *env, int csrno,
     if ((env->priv == PRV_S) && (env->mmte & S_PM_ENABLE)) {
         env->cur_pmbase = val;
     }
-    env->mmte |= PM_EXT_DIRTY;
+    env->mmte |= EXT_STATUS_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
@@ -3750,7 +3750,7 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
     if ((env->priv == PRV_U) && (env->mmte & U_PM_ENABLE)) {
         env->cur_pmbase = val;
     }
-    env->mmte |= PM_EXT_DIRTY;
+    env->mmte |= EXT_STATUS_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
-- 
2.34.1


