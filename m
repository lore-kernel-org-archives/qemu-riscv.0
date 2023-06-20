Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CA9EB64DB
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 11:13:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBZEV-0007QG-5l; Tue, 20 Jun 2023 07:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZEQ-00076W-BD
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:09:06 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZEJ-0004bw-OS
 for qemu-riscv@nongnu.org; Tue, 20 Jun 2023 07:09:04 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-988c495f35fso235913566b.1
 for <qemu-riscv@nongnu.org>; Tue, 20 Jun 2023 04:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259338; x=1689851338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tquFfTdtw0sVSZbN7ZybV+/6BBhwf96oST0EwHIj8d8=;
 b=ktmUMiVXF7RRURH3EoJFqZ7X3QrVQOFCmFuvT6EtCxZB6bwGP7/qPNANv4MS1gcc0p
 AENG4p70wpm21HZViGJBLCpKqWqf/SD+8D0iYDjT4/H8oc/AeYRu53isM89lxtCUzxXR
 PfBA1yPpTJLeTgaR/yQ5//hD2P55JrQRD2kLbZps+zG7TZ3CdigXLBbEY7WVpkpiLRmv
 o+ZQtUiydw5S40Xz5vGfq5AxnaY5cWkEm6ljhcD5j9F+nklIfzVPlsLRhR3Au3uIXy9t
 g0gfWLTAznhEFOyOfVij41LXlsp+NWXJOtoXhYGZj69M/klhfLeKSO6Lb6cxPER3hQzE
 5QLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259338; x=1689851338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tquFfTdtw0sVSZbN7ZybV+/6BBhwf96oST0EwHIj8d8=;
 b=KxU2u/vtrWb3S3BmPmYhBknw9wcSgw2YtVvmidc8c22pbGpyida9EIdk0hKzDRdf61
 guZcDPJy4EeprClrcETPpPjNaoqaRVC3FW0429lxyYImeN29nRNHXHdXwjBSEEBz8+IY
 2DL4cn9+JJG+1fg0i0F35s+G4+1SgH7bICrz0kwiQ+hhpeZmPwD+L/KredI2NtGh98uX
 d6RsV1KJkCyS+/UVfnwT2NiiCDqlHuibUh5hx9ew+v+giTwiQz15TzPbRObxJZv9+diL
 mdeMRpWnASupQ8jCpsea7vaQouRpzYSV2YwRncJI87T3LdF8kw+GQJGlHYIWCFnBJdEr
 IcBg==
X-Gm-Message-State: AC+VfDz0JQt2mDRYI5Vw2tb4l/0+7cycEoxYqoYWQ0Wv4lq22bCxd2Tj
 RxFpHpf/dgM1Po0JLNhV2VRAQQ==
X-Google-Smtp-Source: ACHHUZ5T4hSNlZ1YisXDj55zz0jvz+WIW5SpEi9JXz3+77AQm7mlj0ZNb/hCPdpFGoreWB49Y92ndQ==
X-Received: by 2002:a17:907:6ea0:b0:961:800b:3f1e with SMTP id
 sh32-20020a1709076ea000b00961800b3f1emr13757763ejc.73.1687259337954; 
 Tue, 20 Jun 2023 04:08:57 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 37/37] host/include/ppc: Implement aes-round.h
Date: Tue, 20 Jun 2023 13:07:58 +0200
Message-Id: <20230620110758.787479-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62b.google.com
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

Detect CRYPTO in cpuinfo; implement the accel hooks.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/ppc/host/cpuinfo.h            |   1 +
 host/include/ppc/host/crypto/aes-round.h   | 182 +++++++++++++++++++++
 host/include/ppc64/host/crypto/aes-round.h |   1 +
 util/cpuinfo-ppc.c                         |   8 +
 4 files changed, 192 insertions(+)
 create mode 100644 host/include/ppc/host/crypto/aes-round.h
 create mode 100644 host/include/ppc64/host/crypto/aes-round.h

diff --git a/host/include/ppc/host/cpuinfo.h b/host/include/ppc/host/cpuinfo.h
index df11e8d417..29ee7f9ef8 100644
--- a/host/include/ppc/host/cpuinfo.h
+++ b/host/include/ppc/host/cpuinfo.h
@@ -16,6 +16,7 @@
 #define CPUINFO_ISEL            (1u << 5)
 #define CPUINFO_ALTIVEC         (1u << 6)
 #define CPUINFO_VSX             (1u << 7)
+#define CPUINFO_CRYPTO          (1u << 8)
 
 /* Initialized with a constructor. */
 extern unsigned cpuinfo;
diff --git a/host/include/ppc/host/crypto/aes-round.h b/host/include/ppc/host/crypto/aes-round.h
new file mode 100644
index 0000000000..8062d2a537
--- /dev/null
+++ b/host/include/ppc/host/crypto/aes-round.h
@@ -0,0 +1,182 @@
+/*
+ * Power v2.07 specific aes acceleration.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef PPC_HOST_CRYPTO_AES_ROUND_H
+#define PPC_HOST_CRYPTO_AES_ROUND_H
+
+#ifdef __ALTIVEC__
+#include "host/cpuinfo.h"
+
+#ifdef __CRYPTO__
+# define HAVE_AES_ACCEL  true
+#else
+# define HAVE_AES_ACCEL  likely(cpuinfo & CPUINFO_CRYPTO)
+#endif
+#define ATTR_AES_ACCEL
+
+/*
+ * While there is <altivec.h>, both gcc and clang "aid" with the
+ * endianness issues in different ways. Just use inline asm instead.
+ */
+
+/* Bytes in memory are host-endian; bytes in register are @be. */
+static inline AESStateVec aes_accel_ld(const AESState *p, bool be)
+{
+    AESStateVec r;
+
+    if (be) {
+        asm("lvx %0, 0, %1" : "=v"(r) : "r"(p), "m"(*p));
+    } else if (HOST_BIG_ENDIAN) {
+        AESStateVec rev = {
+            15, 14, 13, 12, 11, 10, 9, 8, 7,  6,  5,  4,  3,  2,  1,  0,
+        };
+        asm("lvx %0, 0, %1\n\t"
+            "vperm %0, %0, %0, %2"
+            : "=v"(r) : "r"(p), "v"(rev), "m"(*p));
+    } else {
+#ifdef __POWER9_VECTOR__
+        asm("lxvb16x %x0, 0, %1" : "=v"(r) : "r"(p), "m"(*p));
+#else
+        asm("lxvd2x %x0, 0, %1\n\t"
+            "xxpermdi %x0, %x0, %x0, 2"
+            : "=v"(r) : "r"(p), "m"(*p));
+#endif
+    }
+    return r;
+}
+
+static void aes_accel_st(AESState *p, AESStateVec r, bool be)
+{
+    if (be) {
+        asm("stvx %1, 0, %2" : "=m"(*p) : "v"(r), "r"(p));
+    } else if (HOST_BIG_ENDIAN) {
+        AESStateVec rev = {
+            15, 14, 13, 12, 11, 10, 9, 8, 7,  6,  5,  4,  3,  2,  1,  0,
+        };
+        asm("vperm %1, %1, %1, %2\n\t"
+            "stvx %1, 0, %3"
+            : "=m"(*p), "+v"(r) : "v"(rev), "r"(p));
+    } else {
+#ifdef __POWER9_VECTOR__
+        asm("stxvb16x %x1, 0, %2" : "=m"(*p) : "v"(r), "r"(p));
+#else
+        asm("xxpermdi %x1, %x1, %x1, 2\n\t"
+            "stxvd2x %x1, 0, %2"
+            : "=m"(*p), "+v"(r) : "r"(p));
+#endif
+    }
+}
+
+static inline AESStateVec aes_accel_vcipher(AESStateVec d, AESStateVec k)
+{
+    asm("vcipher %0, %0, %1" : "+v"(d) : "v"(k));
+    return d;
+}
+
+static inline AESStateVec aes_accel_vncipher(AESStateVec d, AESStateVec k)
+{
+    asm("vncipher %0, %0, %1" : "+v"(d) : "v"(k));
+    return d;
+}
+
+static inline AESStateVec aes_accel_vcipherlast(AESStateVec d, AESStateVec k)
+{
+    asm("vcipherlast %0, %0, %1" : "+v"(d) : "v"(k));
+    return d;
+}
+
+static inline AESStateVec aes_accel_vncipherlast(AESStateVec d, AESStateVec k)
+{
+    asm("vncipherlast %0, %0, %1" : "+v"(d) : "v"(k));
+    return d;
+}
+
+static inline void
+aesenc_MC_accel(AESState *ret, const AESState *st, bool be)
+{
+    AESStateVec t, z = { };
+
+    t = aes_accel_ld(st, be);
+    t = aes_accel_vncipherlast(t, z);
+    t = aes_accel_vcipher(t, z);
+    aes_accel_st(ret, t, be);
+}
+
+static inline void
+aesenc_SB_SR_AK_accel(AESState *ret, const AESState *st,
+                      const AESState *rk, bool be)
+{
+    AESStateVec t, k;
+
+    t = aes_accel_ld(st, be);
+    k = aes_accel_ld(rk, be);
+    t = aes_accel_vcipherlast(t, k);
+    aes_accel_st(ret, t, be);
+}
+
+static inline void
+aesenc_SB_SR_MC_AK_accel(AESState *ret, const AESState *st,
+                         const AESState *rk, bool be)
+{
+    AESStateVec t, k;
+
+    t = aes_accel_ld(st, be);
+    k = aes_accel_ld(rk, be);
+    t = aes_accel_vcipher(t, k);
+    aes_accel_st(ret, t, be);
+}
+
+static inline void
+aesdec_IMC_accel(AESState *ret, const AESState *st, bool be)
+{
+    AESStateVec t, z = { };
+
+    t = aes_accel_ld(st, be);
+    t = aes_accel_vcipherlast(t, z);
+    t = aes_accel_vncipher(t, z);
+    aes_accel_st(ret, t, be);
+}
+
+static inline void
+aesdec_ISB_ISR_AK_accel(AESState *ret, const AESState *st,
+                        const AESState *rk, bool be)
+{
+    AESStateVec t, k;
+
+    t = aes_accel_ld(st, be);
+    k = aes_accel_ld(rk, be);
+    t = aes_accel_vncipherlast(t, k);
+    aes_accel_st(ret, t, be);
+}
+
+static inline void
+aesdec_ISB_ISR_AK_IMC_accel(AESState *ret, const AESState *st,
+                            const AESState *rk, bool be)
+{
+    AESStateVec t, k;
+
+    t = aes_accel_ld(st, be);
+    k = aes_accel_ld(rk, be);
+    t = aes_accel_vncipher(t, k);
+    aes_accel_st(ret, t, be);
+}
+
+static inline void
+aesdec_ISB_ISR_IMC_AK_accel(AESState *ret, const AESState *st,
+                            const AESState *rk, bool be)
+{
+    AESStateVec t, k, z = { };
+
+    t = aes_accel_ld(st, be);
+    k = aes_accel_ld(rk, be);
+    t = aes_accel_vncipher(t, z);
+    aes_accel_st(ret, t ^ k, be);
+}
+#else
+/* Without ALTIVEC, we can't even write inline assembly. */
+#include "host/include/generic/host/crypto/aes-round.h"
+#endif
+
+#endif /* PPC_HOST_CRYPTO_AES_ROUND_H */
diff --git a/host/include/ppc64/host/crypto/aes-round.h b/host/include/ppc64/host/crypto/aes-round.h
new file mode 100644
index 0000000000..5eeba6dcb7
--- /dev/null
+++ b/host/include/ppc64/host/crypto/aes-round.h
@@ -0,0 +1 @@
+#include "host/include/ppc/host/crypto/aes-round.h"
diff --git a/util/cpuinfo-ppc.c b/util/cpuinfo-ppc.c
index d95adc8ccd..7212afa45d 100644
--- a/util/cpuinfo-ppc.c
+++ b/util/cpuinfo-ppc.c
@@ -48,6 +48,14 @@ unsigned __attribute__((constructor)) cpuinfo_init(void)
         /* We only care about the portion of VSX that overlaps Altivec. */
         if (hwcap & PPC_FEATURE_HAS_VSX) {
             info |= CPUINFO_VSX;
+            /*
+             * We use VSX especially for little-endian, but we should
+             * always have both anyway, since VSX came with Power7
+             * and crypto came with Power8.
+             */
+            if (hwcap2 & PPC_FEATURE2_HAS_VEC_CRYPTO) {
+                info |= CPUINFO_CRYPTO;
+            }
         }
     }
 
-- 
2.34.1


