Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNfN5-0003AB-Nc
	for mharc-qemu-riscv@gnu.org; Mon, 15 Aug 2022 15:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNfN1-0002zl-Fx
 for qemu-riscv@nongnu.org; Mon, 15 Aug 2022 15:03:27 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:53160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNfMl-0006Ko-Gi
 for qemu-riscv@nongnu.org; Mon, 15 Aug 2022 15:03:27 -0400
Received: by mail-wm1-x332.google.com with SMTP id k17so4237773wmr.2
 for <qemu-riscv@nongnu.org>; Mon, 15 Aug 2022 12:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=yL2kCSEaX64Q/NPJAtRoJiqW85LCPcZ6AySZ3J3a/uE=;
 b=OrCsM1gBbnPay5eEdRjbJBP2AlvrnZEpp+mSTgO/wZSFxV6k3MEZT+wNFPoyyAvvCJ
 ZVyZbYwLV521HVBEJML8Ir58Qs43nc7IqnWmkY9/4vXwdgP50CaLtKW4WHM5TJgWkXY2
 1lPNW7FpzR90IqAb7lCsG782CZ/1cKuZvmI9qFo68ih0z1/RmH3FZvvb+G/I9mrDJCV+
 tioZJGijJBXlStK2gb22YdzHdxm9hj1C1CvOZ8csBl5aD4Xql8pfaTMyOK1uBAJQbuU9
 ZZ3V1iIHK8NKYXeKrR0tkmy+9YDv7wPjC0QELHfar3DXdklqdeIEQ33ewgZdK/gwROoW
 YcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=yL2kCSEaX64Q/NPJAtRoJiqW85LCPcZ6AySZ3J3a/uE=;
 b=T0R8uJBzVNSrJhVEfx8ifH7LFDThJ22fThFY0oSlypddYmfb85saVZzROl7NFv07+A
 6neSmsAaWz8WL+tfedLv3jWPeNVJLHXdcAAMvzTWKQOgVvZN6Y18YdjV9ToQRE/MKtD+
 1cL6FdpREYrZKZPe8tOfwczTMyKes6Y7WUhDWl1mGohvhbJuWFTvo7UIAEc9mTbjEkht
 0PxTe0RS5wH5yGd29Oxn+NV79qOPf+vdiFpgxAWxyTFmkpi5jfyMd8OP1WXfIHWixiOI
 fBPa3vERlVQLDSQzIQLXOx67oSyxAuTy7QeAEWZ3wQ6jWj0toFucPJYmSoOCH5zYKWFP
 EOfA==
X-Gm-Message-State: ACgBeo0OOeHR8JycmUOx2KZEUvfvrlJBB+G8K8g48so54pffHAOQjB3N
 SXzRq3utmJe9DqwvANdePxDpgg==
X-Google-Smtp-Source: AA6agR56kkbw3hbHC+j8NpWBmdfafwNZC4mXIeyeG3wHz3D/CrA6Nb6QNvyA6TWFiGIgXK3i7o6U2w==
X-Received: by 2002:a05:600c:4f07:b0:3a3:2277:7064 with SMTP id
 l7-20020a05600c4f0700b003a322777064mr10859341wmq.181.1660590189958; 
 Mon, 15 Aug 2022 12:03:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a5d5144000000b00220606afdf4sm8009162wrt.43.2022.08.15.12.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 12:03:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stefan Pejic <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Furquan Shaikh <furquan@rivosinc.com>
Subject: [PATCH 2/7] target/arm: Honour -semihosting-config userspace=on
Date: Mon, 15 Aug 2022 20:02:58 +0100
Message-Id: <20220815190303.2061559-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815190303.2061559-1-peter.maydell@linaro.org>
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 15 Aug 2022 19:03:28 -0000

Honour the commandline -semihosting-config userspace=on option,
instead of never permitting userspace semihosting calls in system
emulation mode, by passing the correct value to the is_userspace
argument of semihosting_enabled(), instead of manually checking and
always forbidding semihosting if the guest is in userspace and this
isn't the linux-user build.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


