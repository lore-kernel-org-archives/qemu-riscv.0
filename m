Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E84EB64DD
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 10:17:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGGRP-0002oL-JG; Mon, 03 Jul 2023 06:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRH-0002d7-L0
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 06:05:47 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGR8-0005oK-Vm
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 06:05:47 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-313f1085ac2so4688574f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 03 Jul 2023 03:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378736; x=1690970736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9pAoF0UlpvCp+BiEKxTuLbyLAGeWXzeXWAmpv3OKFQo=;
 b=JaUBn2TY4B4q8jBRk8JVYx6T3uoqhRWAr4/RF32Eh3GyknanGI/bcL5z5Ez9V9eJ7c
 fhlYuPvQON5YZclUrFKSTvEspt/nnELhSUBxSAz7MrcCMx/PzvLKhMypWrLhhGwOOyMN
 /niGiDOBYf8EW3T0/Q9OFyMyqkYFmGAA4KoWwGCcOg/+NkAVq1Kipzg4jeQYeeo1RMrh
 8Pkmxvy90FOC39AJJJgbAR2WAJ7T9+tDRfoJdvXvL5ZZBW7kgGpRNBPvbYX6A3ceChOX
 OjAEeGm9MfHV8LiBZQB3xFM7sAo3+iCWEyDQ6oxpDbwwrKaooajK8UnM043Z7CmojZJw
 PYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378736; x=1690970736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9pAoF0UlpvCp+BiEKxTuLbyLAGeWXzeXWAmpv3OKFQo=;
 b=OZAP4vZXM7SJuvoNbEtOucZbKgKNLQFkfo5XUrTYUxpd5rks/b7czXdiM43MfV4n3/
 7Z1scrZmZqWYyKotqOBHdOiZ2LQhveCrCa+oiOeN01V0ZeWbjN/mj0WBXrPo8E7DuHLb
 9r5C9Ea4eSG949Pn1E1vCQaGqw9fG8H14czcwArxiYzpgpUIIG6AIjSvMqUE9b4t1upt
 H/jLOeeTNldnOOwtaYwLdYDlooq+mn7JyHRd2yPf6cluYciGTfKGnC8D0RhvX6aDEE2p
 Ph82LDP/LXJQvvNhQUot3RKL2L1Ep9ND14kHSSWkfBImq++HT0MBuggapX/icvhvSCn1
 DCRg==
X-Gm-Message-State: ABy/qLar022ve7jANK6oS/8ZzMYGmavSacNBngKCu8heySsM1WjZUTCB
 jh50mSiVSYhBncPPWSxGknob2A==
X-Google-Smtp-Source: APBJJlHt7v39cjJQNS5sKdPBBHPJAO6x9nBOHAYn98EG2Glfr9RM/mcHsQFRAny2x3Zn1RqVud9JZw==
X-Received: by 2002:adf:ee51:0:b0:314:2a9:1071 with SMTP id
 w17-20020adfee51000000b0031402a91071mr8873926wro.19.1688378735957; 
 Mon, 03 Jul 2023 03:05:35 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
Subject: [PATCH v4 13/37] host/include/aarch64: Implement aes-round.h
Date: Mon,  3 Jul 2023 12:04:56 +0200
Message-Id: <20230703100520.68224-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Detect AES in cpuinfo; implement the accel hooks.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build                                  |   9 +
 host/include/aarch64/host/cpuinfo.h          |   1 +
 host/include/aarch64/host/crypto/aes-round.h | 205 +++++++++++++++++++
 util/cpuinfo-aarch64.c                       |   2 +
 4 files changed, 217 insertions(+)
 create mode 100644 host/include/aarch64/host/crypto/aes-round.h

diff --git a/meson.build b/meson.build
index a9ba0bfab3..029c6c0048 100644
--- a/meson.build
+++ b/meson.build
@@ -2674,6 +2674,15 @@ config_host_data.set('CONFIG_AVX512BW_OPT', get_option('avx512bw') \
     int main(int argc, char *argv[]) { return bar(argv[0]); }
   '''), error_message: 'AVX512BW not available').allowed())
 
+# For both AArch64 and AArch32, detect if builtins are available.
+config_host_data.set('CONFIG_ARM_AES_BUILTIN', cc.compiles('''
+    #include <arm_neon.h>
+    #ifndef __ARM_FEATURE_AES
+    __attribute__((target("+crypto")))
+    #endif
+    void foo(uint8x16_t *p) { *p = vaesmcq_u8(*p); }
+  '''))
+
 have_pvrdma = get_option('pvrdma') \
   .require(rdma.found(), error_message: 'PVRDMA requires OpenFabrics libraries') \
   .require(cc.compiles(gnu_source_prefix + '''
diff --git a/host/include/aarch64/host/cpuinfo.h b/host/include/aarch64/host/cpuinfo.h
index 82227890b4..05feeb4f43 100644
--- a/host/include/aarch64/host/cpuinfo.h
+++ b/host/include/aarch64/host/cpuinfo.h
@@ -9,6 +9,7 @@
 #define CPUINFO_ALWAYS          (1u << 0)  /* so cpuinfo is nonzero */
 #define CPUINFO_LSE             (1u << 1)
 #define CPUINFO_LSE2            (1u << 2)
+#define CPUINFO_AES             (1u << 3)
 
 /* Initialized with a constructor. */
 extern unsigned cpuinfo;
diff --git a/host/include/aarch64/host/crypto/aes-round.h b/host/include/aarch64/host/crypto/aes-round.h
new file mode 100644
index 0000000000..8b5f88d50c
--- /dev/null
+++ b/host/include/aarch64/host/crypto/aes-round.h
@@ -0,0 +1,205 @@
+/*
+ * AArch64 specific aes acceleration.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef AARCH64_HOST_CRYPTO_AES_ROUND_H
+#define AARCH64_HOST_CRYPTO_AES_ROUND_H
+
+#include "host/cpuinfo.h"
+#include <arm_neon.h>
+
+#ifdef __ARM_FEATURE_AES
+# define HAVE_AES_ACCEL  true
+#else
+# define HAVE_AES_ACCEL  likely(cpuinfo & CPUINFO_AES)
+#endif
+#if !defined(__ARM_FEATURE_AES) && defined(CONFIG_ARM_AES_BUILTIN)
+# define ATTR_AES_ACCEL  __attribute__((target("+crypto")))
+#else
+# define ATTR_AES_ACCEL
+#endif
+
+static inline uint8x16_t aes_accel_bswap(uint8x16_t x)
+{
+    return vqtbl1q_u8(x, (uint8x16_t){ 15, 14, 13, 12, 11, 10, 9, 8,
+                                        7,  6,  5,  4,  3,  2, 1, 0, });
+}
+
+#ifdef CONFIG_ARM_AES_BUILTIN
+# define aes_accel_aesd            vaesdq_u8
+# define aes_accel_aese            vaeseq_u8
+# define aes_accel_aesmc           vaesmcq_u8
+# define aes_accel_aesimc          vaesimcq_u8
+# define aes_accel_aesd_imc(S, K)  vaesimcq_u8(vaesdq_u8(S, K))
+# define aes_accel_aese_mc(S, K)   vaesmcq_u8(vaeseq_u8(S, K))
+#else
+static inline uint8x16_t aes_accel_aesd(uint8x16_t d, uint8x16_t k)
+{
+    asm(".arch_extension aes\n\t"
+        "aesd %0.16b, %1.16b" : "+w"(d) : "w"(k));
+    return d;
+}
+
+static inline uint8x16_t aes_accel_aese(uint8x16_t d, uint8x16_t k)
+{
+    asm(".arch_extension aes\n\t"
+        "aese %0.16b, %1.16b" : "+w"(d) : "w"(k));
+    return d;
+}
+
+static inline uint8x16_t aes_accel_aesmc(uint8x16_t d)
+{
+    asm(".arch_extension aes\n\t"
+        "aesmc %0.16b, %1.16b" : "=w"(d) : "w"(d));
+    return d;
+}
+
+static inline uint8x16_t aes_accel_aesimc(uint8x16_t d)
+{
+    asm(".arch_extension aes\n\t"
+        "aesimc %0.16b, %1.16b" : "=w"(d) : "w"(d));
+    return d;
+}
+
+/* Most CPUs fuse AESD+AESIMC in the execution pipeline. */
+static inline uint8x16_t aes_accel_aesd_imc(uint8x16_t d, uint8x16_t k)
+{
+    asm(".arch_extension aes\n\t"
+        "aesd %0.16b, %1.16b\n\t"
+        "aesimc %0.16b, %0.16b" : "+w"(d) : "w"(k));
+    return d;
+}
+
+/* Most CPUs fuse AESE+AESMC in the execution pipeline. */
+static inline uint8x16_t aes_accel_aese_mc(uint8x16_t d, uint8x16_t k)
+{
+    asm(".arch_extension aes\n\t"
+        "aese %0.16b, %1.16b\n\t"
+        "aesmc %0.16b, %0.16b" : "+w"(d) : "w"(k));
+    return d;
+}
+#endif /* CONFIG_ARM_AES_BUILTIN */
+
+static inline void ATTR_AES_ACCEL
+aesenc_MC_accel(AESState *ret, const AESState *st, bool be)
+{
+    uint8x16_t t = (uint8x16_t)st->v;
+
+    if (be) {
+        t = aes_accel_bswap(t);
+        t = aes_accel_aesmc(t);
+        t = aes_accel_bswap(t);
+    } else {
+        t = aes_accel_aesmc(t);
+    }
+    ret->v = (AESStateVec)t;
+}
+
+static inline void ATTR_AES_ACCEL
+aesenc_SB_SR_AK_accel(AESState *ret, const AESState *st,
+                      const AESState *rk, bool be)
+{
+    uint8x16_t t = (uint8x16_t)st->v;
+    uint8x16_t z = { };
+
+    if (be) {
+        t = aes_accel_bswap(t);
+        t = aes_accel_aese(t, z);
+        t = aes_accel_bswap(t);
+    } else {
+        t = aes_accel_aese(t, z);
+    }
+    ret->v = (AESStateVec)t ^ rk->v;
+}
+
+static inline void ATTR_AES_ACCEL
+aesenc_SB_SR_MC_AK_accel(AESState *ret, const AESState *st,
+                         const AESState *rk, bool be)
+{
+    uint8x16_t t = (uint8x16_t)st->v;
+    uint8x16_t z = { };
+
+    if (be) {
+        t = aes_accel_bswap(t);
+        t = aes_accel_aese_mc(t, z);
+        t = aes_accel_bswap(t);
+    } else {
+        t = aes_accel_aese_mc(t, z);
+    }
+    ret->v = (AESStateVec)t ^ rk->v;
+}
+
+static inline void ATTR_AES_ACCEL
+aesdec_IMC_accel(AESState *ret, const AESState *st, bool be)
+{
+    uint8x16_t t = (uint8x16_t)st->v;
+
+    if (be) {
+        t = aes_accel_bswap(t);
+        t = aes_accel_aesimc(t);
+        t = aes_accel_bswap(t);
+    } else {
+        t = aes_accel_aesimc(t);
+    }
+    ret->v = (AESStateVec)t;
+}
+
+static inline void ATTR_AES_ACCEL
+aesdec_ISB_ISR_AK_accel(AESState *ret, const AESState *st,
+                        const AESState *rk, bool be)
+{
+    uint8x16_t t = (uint8x16_t)st->v;
+    uint8x16_t z = { };
+
+    if (be) {
+        t = aes_accel_bswap(t);
+        t = aes_accel_aesd(t, z);
+        t = aes_accel_bswap(t);
+    } else {
+        t = aes_accel_aesd(t, z);
+    }
+    ret->v = (AESStateVec)t ^ rk->v;
+}
+
+static inline void ATTR_AES_ACCEL
+aesdec_ISB_ISR_AK_IMC_accel(AESState *ret, const AESState *st,
+                            const AESState *rk, bool be)
+{
+    uint8x16_t t = (uint8x16_t)st->v;
+    uint8x16_t k = (uint8x16_t)rk->v;
+    uint8x16_t z = { };
+
+    if (be) {
+        t = aes_accel_bswap(t);
+        k = aes_accel_bswap(k);
+        t = aes_accel_aesd(t, z);
+        t ^= k;
+        t = aes_accel_aesimc(t);
+        t = aes_accel_bswap(t);
+    } else {
+        t = aes_accel_aesd(t, z);
+        t ^= k;
+        t = aes_accel_aesimc(t);
+    }
+    ret->v = (AESStateVec)t;
+}
+
+static inline void ATTR_AES_ACCEL
+aesdec_ISB_ISR_IMC_AK_accel(AESState *ret, const AESState *st,
+                            const AESState *rk, bool be)
+{
+    uint8x16_t t = (uint8x16_t)st->v;
+    uint8x16_t z = { };
+
+    if (be) {
+        t = aes_accel_bswap(t);
+        t = aes_accel_aesd_imc(t, z);
+        t = aes_accel_bswap(t);
+    } else {
+        t = aes_accel_aesd_imc(t, z);
+    }
+    ret->v = (AESStateVec)t ^ rk->v;
+}
+
+#endif /* AARCH64_HOST_CRYPTO_AES_ROUND_H */
diff --git a/util/cpuinfo-aarch64.c b/util/cpuinfo-aarch64.c
index f99acb7884..ababc39550 100644
--- a/util/cpuinfo-aarch64.c
+++ b/util/cpuinfo-aarch64.c
@@ -56,10 +56,12 @@ unsigned __attribute__((constructor)) cpuinfo_init(void)
     unsigned long hwcap = qemu_getauxval(AT_HWCAP);
     info |= (hwcap & HWCAP_ATOMICS ? CPUINFO_LSE : 0);
     info |= (hwcap & HWCAP_USCAT ? CPUINFO_LSE2 : 0);
+    info |= (hwcap & HWCAP_AES ? CPUINFO_AES: 0);
 #endif
 #ifdef CONFIG_DARWIN
     info |= sysctl_for_bool("hw.optional.arm.FEAT_LSE") * CPUINFO_LSE;
     info |= sysctl_for_bool("hw.optional.arm.FEAT_LSE2") * CPUINFO_LSE2;
+    info |= sysctl_for_bool("hw.optional.arm.FEAT_AES") * CPUINFO_AES;
 #endif
 
     cpuinfo = info;
-- 
2.34.1


