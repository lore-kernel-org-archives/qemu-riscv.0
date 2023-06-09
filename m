Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC85EC7EE25
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 02:29:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7RpS-0007p7-Hf; Thu, 08 Jun 2023 22:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Roh-00047h-5f
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:25:31 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rnr-0005qB-Am
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 22:25:30 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-5445ef3ef1eso326088a12.2
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 19:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277478; x=1688869478;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AGmrN5JDCC5Y7cmptRYpqyBCVDSOb/l5HD4qcyU6ce4=;
 b=S7gUfg492S3/Kb5H/6N9lI09ZrnGsWhSH39Kj/g04ot3P7AHtzPNorwi9+57uKDoA2
 Y0omvYlcvDFIU4uRgx44p8/sh70sEEAM7ubmlFlgs4Q5qalM1z3lGZK4ljv5YtRTpisV
 6e44NjDiJgR8wsUWnwwTGIGbjC7Hc8mRd3DhIkY/Q9zCeK3ZvDxo5VVU41lCpDDUT2L/
 KmyB2rDp9olPFOtWlfW3NLbaK3q1lt5EDzmypj3gD2+FQomGKVa2sKF2ImApy2CNAhwI
 lDC7dDTLb1i0WsIGf3gdBUAtkNc/M5ssQSplWEBE+eXACPkG1ZSNdgLF4ttZvQLmO1bo
 nSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277478; x=1688869478;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AGmrN5JDCC5Y7cmptRYpqyBCVDSOb/l5HD4qcyU6ce4=;
 b=YZtd8AfSjzRiao/j3RIVLg1M3q4BEm8cHGBggKmS8sLwzqWDgb7vN6G7oN6BtWECae
 gn3lTWLPA1sxHactx9/8ScvgGyIVvzWPyfuoyHJ5qjAP2F0AxhrdLmtZTpy6OoRP1km8
 6tuSAzYZOmSS9A3Z7pATc7bRcRpDInKjas6wS223mfMwLrKKvVfn+EIXn7h1gkO03w0h
 frbfS6T8fc9auwiEVianWemreom+7/uHvuuGMVzOiMjNF1qQRyE3fByYtQglrjg0NhI0
 WYGI5pqksaZZ+8D6XmD0Xk8P8SedCmW6KPQtB/X26lrrzN7OxtSVjUqZPmS0i2vc6x7f
 gPzw==
X-Gm-Message-State: AC+VfDzo+s7slyOzxI6FhexnmrOqKtyiu7aFtGWLsPco6pwB3qz4dJ9p
 q+nq25OYl0NEX6I6gRXzDNwKxA==
X-Google-Smtp-Source: ACHHUZ4LE+lYUD4w4uG47WSKGjQjEohxUKI+DTOiUlleeQu1ciXP13cAwHGKFHCS9NKbP6WY8tDIRg==
X-Received: by 2002:a05:6a20:8f11:b0:10b:40a9:ec48 with SMTP id
 b17-20020a056a208f1100b0010b40a9ec48mr34673pzk.29.1686277477800; 
 Thu, 08 Jun 2023 19:24:37 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 38/38] host/include/ppc: Implement aes-round.h
Date: Thu,  8 Jun 2023 19:24:01 -0700
Message-Id: <20230609022401.684157-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

Detect CRYPTO in cpuinfo; implement the accel hooks.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/ppc/host/aes-round.h   | 181 ++++++++++++++++++++++++++++
 host/include/ppc/host/cpuinfo.h     |   1 +
 host/include/ppc64/host/aes-round.h |   1 +
 util/cpuinfo-ppc.c                  |   8 ++
 4 files changed, 191 insertions(+)
 create mode 100644 host/include/ppc/host/aes-round.h
 create mode 100644 host/include/ppc64/host/aes-round.h

diff --git a/host/include/ppc/host/aes-round.h b/host/include/ppc/host/aes-round.h
new file mode 100644
index 0000000000..9b5a15d1e5
--- /dev/null
+++ b/host/include/ppc/host/aes-round.h
@@ -0,0 +1,181 @@
+/*
+ * Power v2.07 specific aes acceleration.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef PPC_HOST_AES_ROUND_H
+#define PPC_HOST_AES_ROUND_H
+
+#ifndef __ALTIVEC__
+/* Without ALTIVEC, we can't even write inline assembly. */
+#include "host/include/generic/host/aes-round.h"
+#else
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
+#endif /* __ALTIVEC__ */
+#endif /* PPC_HOST_AES_ROUND_H */
diff --git a/host/include/ppc/host/cpuinfo.h b/host/include/ppc/host/cpuinfo.h
index 7ec252ef52..6cc727dba7 100644
--- a/host/include/ppc/host/cpuinfo.h
+++ b/host/include/ppc/host/cpuinfo.h
@@ -16,6 +16,7 @@
 #define CPUINFO_ISEL            (1u << 5)
 #define CPUINFO_ALTIVEC         (1u << 6)
 #define CPUINFO_VSX             (1u << 7)
+#define CPUINFO_CRYPTO          (1u << 8)
 
 /* Initialized with a constructor. */
 extern unsigned cpuinfo;
diff --git a/host/include/ppc64/host/aes-round.h b/host/include/ppc64/host/aes-round.h
new file mode 100644
index 0000000000..4a78d94de8
--- /dev/null
+++ b/host/include/ppc64/host/aes-round.h
@@ -0,0 +1 @@
+#include "host/include/ppc/host/aes-round.h"
diff --git a/util/cpuinfo-ppc.c b/util/cpuinfo-ppc.c
index ee761de33a..053b383720 100644
--- a/util/cpuinfo-ppc.c
+++ b/util/cpuinfo-ppc.c
@@ -49,6 +49,14 @@ unsigned __attribute__((constructor)) cpuinfo_init(void)
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


