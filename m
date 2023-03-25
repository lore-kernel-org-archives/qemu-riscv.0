Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pg2bb-0000jl-Fz
	for mharc-qemu-riscv@gnu.org; Sat, 25 Mar 2023 08:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2ba-0000iP-0b
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 08:02:42 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2bY-00048e-3U
 for qemu-riscv@nongnu.org; Sat, 25 Mar 2023 08:02:41 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-17aeb49429eso4469738fac.6
 for <qemu-riscv@nongnu.org>; Sat, 25 Mar 2023 05:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679745759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LHvMKXD8NAoM/vW12NzPpWoUixdpDsUt4QFvbOLsIaM=;
 b=QpjCi44Fc2AC4iv4/J4rr6aMPYLo97T2Xuarnl2PxDuONerhC+L/FFfZHlYpOsu84N
 rLTDjMkMwVI2xtT43HLcPo2jaH35bGlWZyZGvvGZT1cPTgONSEfFTgiNi2GiFdYOaoXg
 X8J3tdMUptSeJYdA1TPtOT6jTkfMD3uq/dkP+cwdd7ZKqY0muEUYYEad65273ZHVmgVd
 cJ9ACX+JA5AaKmdNf96D5R2nvdoUEamLHKEAOgLVLKLeSXPuf8Y213lLHpvDKfgZUODT
 c7ySDyNCQcDtVI0Qlj2BseIW0fSRreo0W0SsZW/MF/SqYXJglLmzMQ99didGW9FGJ0Qu
 hd0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679745759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LHvMKXD8NAoM/vW12NzPpWoUixdpDsUt4QFvbOLsIaM=;
 b=gu3KobZfkM2wThRyrMeirHy66a8nkFpnpVMmJENMTLoYKp2YCxLfMmxiBAgdwhGg7l
 yes1bsp/P5bBv+5n0xQ1k84vGIhki31NGFhBiyrbKDlyLc1l0yAiCseRrBv9aYJHPM1Z
 AgsuF7tYwsgg0+1NGn7zdcDxv+6sLNALgxkX3tXLRyLWNAJaxV5xNMxs37MmcVaWRRWR
 RSpiQPhueSxOPEYpnLV1H6d5md4V0nCc75oQlEkAR/2kE/8CGXDQFGd2OrV4rBlWWKlY
 5ufT9u3QZaUsfwHF4jbyG7h4M/9nLto/ROaB/61UUVqGmArnQFrY3eZbT4vzUXTV1Rp4
 UdkA==
X-Gm-Message-State: AAQBX9csqXYz032dNl7ePb+r8WDes4NFC2bOGNYKrbrj/Oh3mA97SBj2
 iEfSSZzulwO06hrurL/v6pEb89W7Pn0UjRPbV/M=
X-Google-Smtp-Source: AKy350btAospyDOrsqZd+QSeQM6bxz6vTFrJ7yDygKk8eS50vqmnuDaozDUceCu8rFLx9tvuA+XvOA==
X-Received: by 2002:a17:90b:4c8b:b0:240:c25:210 with SMTP id
 my11-20020a17090b4c8b00b002400c250210mr5919510pjb.44.1679741672884; 
 Sat, 25 Mar 2023 03:54:32 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 02/25] target/riscv: Add a general status enum for
 extensions
Date: Sat, 25 Mar 2023 03:54:06 -0700
Message-Id: <20230325105429.1142530-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 25 Mar 2023 12:02:42 -0000

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
---
 target/riscv/cpu.h      |  8 ++++++++
 target/riscv/cpu_bits.h | 12 ++++--------
 target/riscv/cpu.c      |  2 +-
 target/riscv/csr.c      | 14 +++++++-------
 4 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 12fe8d8546..30d9828d59 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -99,6 +99,14 @@ enum {
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
index fca7ef0cef..b84f62f8d6 100644
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
@@ -734,13 +737,6 @@ typedef enum RISCVException {
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
@@ -780,7 +776,7 @@ typedef enum RISCVException {
 #define S_OFFSET     5ULL
 #define M_OFFSET     8ULL
 
-#define PM_XS_BITS   (PM_XS_MASK << XS_OFFSET)
+#define PM_XS_BITS   (EXT_STATUS_MASK << XS_OFFSET)
 #define U_PM_ENABLE  (PM_ENABLE  << U_OFFSET)
 #define U_PM_CURRENT (PM_CURRENT << U_OFFSET)
 #define U_PM_INSN    (PM_INSN    << U_OFFSET)
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1e97473af2..1135106b3e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -764,7 +764,7 @@ static void riscv_cpu_reset_hold(Object *obj)
         i++;
     }
     /* mmte is supposed to have pm.current hardwired to 1 */
-    env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
+    env->mmte |= (EXT_STATUS_INITIAL | MMTE_M_PM_CURRENT);
 #endif
     env->xl = riscv_cpu_mxl(env);
     riscv_cpu_update_mask(env);
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d522efc0b6..abea7b749e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3513,7 +3513,7 @@ static RISCVException write_mmte(CPURISCVState *env, int csrno,
 
     /* hardwiring pm.instruction bit to 0, since it's not supported yet */
     wpri_val &= ~(MMTE_M_PM_INSN | MMTE_S_PM_INSN | MMTE_U_PM_INSN);
-    env->mmte = wpri_val | PM_EXT_DIRTY;
+    env->mmte = wpri_val | EXT_STATUS_DIRTY;
     riscv_cpu_update_mask(env);
 
     /* Set XS and SD bits, since PM CSRs are dirty */
@@ -3593,7 +3593,7 @@ static RISCVException write_mpmmask(CPURISCVState *env, int csrno,
     if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
         env->cur_pmmask = val;
     }
-    env->mmte |= PM_EXT_DIRTY;
+    env->mmte |= EXT_STATUS_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
@@ -3621,7 +3621,7 @@ static RISCVException write_spmmask(CPURISCVState *env, int csrno,
     if ((env->priv == PRV_S) && (env->mmte & S_PM_ENABLE)) {
         env->cur_pmmask = val;
     }
-    env->mmte |= PM_EXT_DIRTY;
+    env->mmte |= EXT_STATUS_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
@@ -3649,7 +3649,7 @@ static RISCVException write_upmmask(CPURISCVState *env, int csrno,
     if ((env->priv == PRV_U) && (env->mmte & U_PM_ENABLE)) {
         env->cur_pmmask = val;
     }
-    env->mmte |= PM_EXT_DIRTY;
+    env->mmte |= EXT_STATUS_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
@@ -3673,7 +3673,7 @@ static RISCVException write_mpmbase(CPURISCVState *env, int csrno,
     if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
         env->cur_pmbase = val;
     }
-    env->mmte |= PM_EXT_DIRTY;
+    env->mmte |= EXT_STATUS_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
@@ -3701,7 +3701,7 @@ static RISCVException write_spmbase(CPURISCVState *env, int csrno,
     if ((env->priv == PRV_S) && (env->mmte & S_PM_ENABLE)) {
         env->cur_pmbase = val;
     }
-    env->mmte |= PM_EXT_DIRTY;
+    env->mmte |= EXT_STATUS_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
@@ -3729,7 +3729,7 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
     if ((env->priv == PRV_U) && (env->mmte & U_PM_ENABLE)) {
         env->cur_pmbase = val;
     }
-    env->mmte |= PM_EXT_DIRTY;
+    env->mmte |= EXT_STATUS_DIRTY;
 
     /* Set XS and SD bits, since PM CSRs are dirty */
     mstatus = env->mstatus | MSTATUS_XS;
-- 
2.34.1


