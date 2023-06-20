Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31F1EB64DB
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 11:10:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBZEV-0007Qj-B9; Tue, 20 Jun 2023 07:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZEM-0006z0-QH
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:09:03 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZEI-0004bM-1Y
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:09:02 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-987a977f62aso369069966b.1
 for <qemu-riscv@nongnu.org>; Tue, 20 Jun 2023 04:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259336; x=1689851336;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sKqdML8OOkd/9MMr9Zrb0tAOr3XFy13fJxMhSqc0LZI=;
 b=ELwUDv5PrCQIKircfrZnTPz1RM06etL3xXHpVWYrPsRExcEjeLMzO9EAfU6RInKoyE
 axkL5J8sdCbz1g4AskWVltkKepuEf9O29sUSfSrRUtyFn12mz+aSCDqd+4gGVzm0Dwns
 0QkH8T3Ii+0gCHjb8NiVlIS5iQfc/8UZtZcvX/aEzlDAMnVvKaghM3tp+2dbTifz3U6C
 JoQlRfi/PWHud5U3qX/C8K8mt3qKMtW4b1I+VWdK+3QqV3EIeg1vquM3pKVAwygXmjl1
 fo6ld/A+oFoc4ksngfi2X4vx3SVJJe5fK1d9m4EuYOlfEo78qk+PMUv8tHjibgG91xLp
 ukQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259336; x=1689851336;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sKqdML8OOkd/9MMr9Zrb0tAOr3XFy13fJxMhSqc0LZI=;
 b=IwLme9ezjTgVQFWtkhGaWypGpZ6qtg1DjXpGoBAbbfBW6kVobR7UQju1UrIxg61b1P
 jTqo3RcSHbX1o5eAIXE3WydIhAv73afQfPON5aLB6pzHcmDB224GEQuCgNQMO5oKnJwp
 Cfk6hfXvAIjkSX6onGUTixePGGE79DDk2UjNr/oXx+8FCcmUSv3BQqhIk2LJf20w3XQv
 H10fcHhg931q63nNQanxSLWJmKdFGOipmp4JpTcVFNXiNr/jsnEJqtx/Da+MwJ366df0
 Ok1s/oe4WSuP8FNF/+xyaEPfWtyRp1g8U6weom4uL7dDLq/uSZkEzb7i1D8WqHmn2E3I
 AfFw==
X-Gm-Message-State: AC+VfDxatlgoCvMWU6LHZzsWOuzMMw2ili0cZWPkngriRwcNoaY6BP/M
 DfPSzkR7s5L762Sw8RvFHIfoZpvvpUVExH9GF5JAoA1m
X-Google-Smtp-Source: ACHHUZ6kfDmiDVdrZDBHEHePXvYE63ufhSym6rY4FbpD9EbigGVObbpUHL4kmNzoioSKHkwMEUhv+Q==
X-Received: by 2002:a17:906:fcb7:b0:96f:5902:8c4d with SMTP id
 qw23-20020a170906fcb700b0096f59028c4dmr7993713ejb.27.1687259336611; 
 Tue, 20 Jun 2023 04:08:56 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 36/37] host/include/aarch64: Implement aes-round.h
Date: Tue, 20 Jun 2023 13:07:57 +0200
Message-Id: <20230620110758.787479-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x633.google.com
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
index 6ef78ea278..a1e5f3c06d 100644
--- a/meson.build
+++ b/meson.build
@@ -2667,6 +2667,15 @@ config_host_data.set('CONFIG_AVX512BW_OPT', get_option('avx512bw') \
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


