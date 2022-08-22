Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQ99B-0007PY-Ho
	for mharc-qemu-riscv@gnu.org; Mon, 22 Aug 2022 11:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ99A-0007OD-Ac
 for qemu-riscv@nongnu.org; Mon, 22 Aug 2022 11:15:24 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:44921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ993-0004sq-QU
 for qemu-riscv@nongnu.org; Mon, 22 Aug 2022 11:15:24 -0400
Received: by mail-ej1-x635.google.com with SMTP id ce26so6128897ejb.11
 for <qemu-riscv@nongnu.org>; Mon, 22 Aug 2022 08:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=6VBB9l/n2pBbDajK4ZQ84clibkYsxsKuyND2MJ/GRek=;
 b=OORXop52lSdOH4LMflg63bssXPv9O7aWUa1w6cTZjE62j94jBdRiQhF5PK3storUZ6
 C1XtroImnTCN9+oxSirb65fWpxy7LpPuog2y3TFGNZom2xvvlw4Ehbzmi8pBrzbT21jT
 unHw9fl9qhF6wfpJC0cVm+FNPx2Z+U9Ts9r0MEmE8rUHp3qRK3SUJw9zSxwjuJVDW8yX
 nxE4mkFY2f6wDy7lYFT+avXSxMHDkbHOydCLQfNBSil71QLT2evXoG3mrYIgMjZMRPfQ
 D9DHLVmNhZDXnWgyIkgcwmWw4pCGBKexTzTblKx4uQe7hb04qT/zfc9dvXlWUlGS00X3
 fjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=6VBB9l/n2pBbDajK4ZQ84clibkYsxsKuyND2MJ/GRek=;
 b=H32EjnfiwrPrldEGLSYACL24COJsEdwudD7SjK7/ck/71fX3LOMpPLk02vqWRrzeh0
 ZgvrQoNfYC/mbPpF81PtbFv+IvSaAWURdYy/vDPsgxbTZhW6FPOe8dong3lF8SXwDN08
 skEJTJhDifwYwgOMF2pUPdRkkTmHVsEqWA1U4eFEzC9H2L306l20OjVfwxHZ8mkX5D0S
 T1URyN9JyJIX9UKnWwW3HiaweSkjOlPbJHVebwhWdJWOprbOKkUQqoyb2GlskM7D4z/z
 UVDC6Kj/NMrRCxtV/ZktPgzuYcyl8sI+Jc/fVnRQvBDt2FnwboqqP6X6b5YRJHR3C2n7
 vd1w==
X-Gm-Message-State: ACgBeo3tYWsgPWWVCrRXH16OrpPh/5Vl5BPlvobnOHuElxnx4sOqaqxC
 ohW8boNTWDL7CYVfwfpQHokUMS+zbppJVA==
X-Google-Smtp-Source: AA6agR5NnWqo0faEoytSCdzNehB1/BpYZsIE003L3ye9+dsqgXSr8fkbvWBJyrXs4oYKwgoKyXrRfg==
X-Received: by 2002:adf:cd86:0:b0:225:1a3a:d984 with SMTP id
 q6-20020adfcd86000000b002251a3ad984mr11390880wrj.212.1661177556635; 
 Mon, 22 Aug 2022 07:12:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh16-20020a05600c3d1000b003a3561d4f3fsm15184908wmb.43.2022.08.22.07.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 07:12:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Furquan Shaikh <furquan@rivosinc.com>
Subject: [PATCH v2 2/7] target/arm: Honour -semihosting-config userspace=on
Date: Mon, 22 Aug 2022 15:12:25 +0100
Message-Id: <20220822141230.3658237-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822141230.3658237-1-peter.maydell@linaro.org>
References: <20220822141230.3658237-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 22 Aug 2022 15:15:24 -0000

Honour the commandline -semihosting-config userspace=on option,
instead of never permitting userspace semihosting calls in system
emulation mode, by passing the correct value to the is_userspace
argument of semihosting_enabled(), instead of manually checking and
always forbidding semihosting if the guest is in userspace and this
isn't the linux-user build.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 12 +-----------
 target/arm/translate.c     | 16 ++++------------
 2 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 3decc8da573..9bed336b47e 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2219,17 +2219,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
          * it is required for halting debug disabled: it will UNDEF.
          * Secondly, "HLT 0xf000" is the A64 semihosting syscall instruction.
          */
-        if (semihosting_enabled(false) && imm16 == 0xf000) {
-#ifndef CONFIG_USER_ONLY
-            /* In system mode, don't allow userspace access to semihosting,
-             * to provide some semblance of security (and for consistency
-             * with our 32-bit semihosting).
-             */
-            if (s->current_el == 0) {
-                unallocated_encoding(s);
-                break;
-            }
-#endif
+        if (semihosting_enabled(s->current_el == 0) && imm16 == 0xf000) {
             gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
         } else {
             unallocated_encoding(s);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index b85be8a818d..54543b7c2a8 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1169,10 +1169,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
      * semihosting, to provide some semblance of security
      * (and for consistency with our 32-bit semihosting).
      */
-    if (semihosting_enabled(false) &&
-#ifndef CONFIG_USER_ONLY
-        s->current_el != 0 &&
-#endif
+    if (semihosting_enabled(s->current_el != 0) &&
         (imm == (s->thumb ? 0x3c : 0xf000))) {
         gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
         return;
@@ -6556,10 +6553,7 @@ static bool trans_BKPT(DisasContext *s, arg_BKPT *a)
     /* BKPT is OK with ECI set and leaves it untouched */
     s->eci_handled = true;
     if (arm_dc_feature(s, ARM_FEATURE_M) &&
-        semihosting_enabled(false) &&
-#ifndef CONFIG_USER_ONLY
-        !IS_USER(s) &&
-#endif
+        semihosting_enabled(s->current_el == 0) &&
         (a->imm == 0xab)) {
         gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
     } else {
@@ -8764,10 +8758,8 @@ static bool trans_SVC(DisasContext *s, arg_SVC *a)
 {
     const uint32_t semihost_imm = s->thumb ? 0xab : 0x123456;
 
-    if (!arm_dc_feature(s, ARM_FEATURE_M) && semihosting_enabled(false) &&
-#ifndef CONFIG_USER_ONLY
-        !IS_USER(s) &&
-#endif
+    if (!arm_dc_feature(s, ARM_FEATURE_M) &&
+        semihosting_enabled(s->current_el == 0) &&
         (a->imm == semihost_imm)) {
         gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
     } else {
-- 
2.25.1


