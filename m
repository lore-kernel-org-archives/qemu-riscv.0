Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pu6ai-000851-1o
	for mharc-qemu-riscv@gnu.org; Wed, 03 May 2023 03:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aM-0006A1-VO
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:35 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Zy-0005go-Bm
 for qemu-riscv@nongnu.org; Wed, 03 May 2023 03:07:34 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f18dacd392so29591465e9.0
 for <qemu-riscv@nongnu.org>; Wed, 03 May 2023 00:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097628; x=1685689628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AlbQNgtkgysZMHjfft1C2G8eExbC6pUxkdPDPUlgiFs=;
 b=F0mH2cTOcVgXUOHG7GibycCjAs9KyTyDhxLWIyIwZ5qmthZzduKtnEccuQj3wzhWsZ
 9kq8Tx8HPEeXFQVLDA20AKpGnq/hynE2bKc7KCYR1mnS/Z/sJ6aG/Rz00ydxjSvjvnjz
 lWvBBH40OUpC8YxypWN4TPS1RCOmu301jX0sOIlmV3OEW1SjgK9IH7oC0NfWFfYpssrH
 hzXzBKm3+mPluEN7F9JR6vCLi2pxwanrKPcMghrtpk0tzowhB+OaTKc5iNnc6z5ZiGtD
 ifTC0xeaKbKQdr4NlB3oBP79JFGfeLg+Hsjx6g7SpVsTQg6NC6v4qIhQa/SPf0h8AL8Z
 gj7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097628; x=1685689628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AlbQNgtkgysZMHjfft1C2G8eExbC6pUxkdPDPUlgiFs=;
 b=a5TtQBNNY8JboB76wnJXYEJsyiBtu4ZkyNbEEGt4VEUGn6V0Qc85aEqQCsqk4yYZk6
 bchu0Lh7WOz0ryLg4Tw8Z9dEYNDQraSIW2xJ8gwRe7iYqYQNWCZJQEAa+DyQcMNQsU5r
 MLBzsUJVKZ205LMRcP/t1i6A5d+SkS1+l1ICUHYzUuam8USHMkbVHPD61Xpnv6aOOzvv
 VN5RGql6TrY3OXxKEku5d87H+bmtNBt3QW0/0tvmsgWA8o5TRk7HSDwNCAr3wpHXNQUL
 Yv8N/rqU7vt8YPK2qnboeGpzcz22xu8SSt0jFW4npkLl7VPiN73b7xCVcZpOVDdWi0f/
 /NPA==
X-Gm-Message-State: AC+VfDxUd9m5N7niynEwbMkESBFE9M7ewo76iRyGjFBSmRXFw/Cz0jxQ
 aZub37HkW6jqwFlEBj8iYrf15A==
X-Google-Smtp-Source: ACHHUZ6W+611fRZ8I6wqrm894x3UDU4xjW7c8EjPxhbf6g1FfwmqTvVGJ2FGHqNVUxTvBmmtZF00+g==
X-Received: by 2002:a7b:cc05:0:b0:3f0:683d:224d with SMTP id
 f5-20020a7bcc05000000b003f0683d224dmr13525315wmh.9.1683097628520; 
 Wed, 03 May 2023 00:07:08 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 14/57] tcg/i386: Add have_atomic16
Date: Wed,  3 May 2023 08:06:13 +0100
Message-Id: <20230503070656.1746170-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
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
X-List-Received-Date: Wed, 03 May 2023 07:07:35 -0000

Notice when Intel or AMD have guaranteed that vmovdqa is atomic.
The new variable will also be used in generated code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/cpuid.h      | 18 ++++++++++++++++++
 tcg/i386/tcg-target.h     |  1 +
 tcg/i386/tcg-target.c.inc | 27 +++++++++++++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/include/qemu/cpuid.h b/include/qemu/cpuid.h
index 1451e8ef2f..35325f1995 100644
--- a/include/qemu/cpuid.h
+++ b/include/qemu/cpuid.h
@@ -71,6 +71,24 @@
 #define bit_LZCNT       (1 << 5)
 #endif
 
+/*
+ * Signatures for different CPU implementations as returned from Leaf 0.
+ */
+
+#ifndef signature_INTEL_ecx
+/* "Genu" "ineI" "ntel" */
+#define signature_INTEL_ebx     0x756e6547
+#define signature_INTEL_edx     0x49656e69
+#define signature_INTEL_ecx     0x6c65746e
+#endif
+
+#ifndef signature_AMD_ecx
+/* "Auth" "enti" "cAMD" */
+#define signature_AMD_ebx       0x68747541
+#define signature_AMD_edx       0x69746e65
+#define signature_AMD_ecx       0x444d4163
+#endif
+
 static inline unsigned xgetbv_low(unsigned c)
 {
     unsigned a, d;
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index d4f2a6f8c2..0421776cb8 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -120,6 +120,7 @@ extern bool have_avx512dq;
 extern bool have_avx512vbmi2;
 extern bool have_avx512vl;
 extern bool have_movbe;
+extern bool have_atomic16;
 
 /* optional instructions */
 #define TCG_TARGET_HAS_div2_i32         1
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index bb603e7968..f838683fc3 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -185,6 +185,7 @@ bool have_avx512dq;
 bool have_avx512vbmi2;
 bool have_avx512vl;
 bool have_movbe;
+bool have_atomic16;
 
 #ifdef CONFIG_CPUID_H
 static bool have_bmi2;
@@ -4024,6 +4025,32 @@ static void tcg_target_init(TCGContext *s)
                     have_avx512dq = (b7 & bit_AVX512DQ) != 0;
                     have_avx512vbmi2 = (c7 & bit_AVX512VBMI2) != 0;
                 }
+
+                /*
+                 * The Intel SDM has added:
+                 *   Processors that enumerate support for Intel® AVX
+                 *   (by setting the feature flag CPUID.01H:ECX.AVX[bit 28])
+                 *   guarantee that the 16-byte memory operations performed
+                 *   by the following instructions will always be carried
+                 *   out atomically:
+                 *   - MOVAPD, MOVAPS, and MOVDQA.
+                 *   - VMOVAPD, VMOVAPS, and VMOVDQA when encoded with VEX.128.
+                 *   - VMOVAPD, VMOVAPS, VMOVDQA32, and VMOVDQA64 when encoded
+                 *     with EVEX.128 and k0 (masking disabled).
+                 * Note that these instructions require the linear addresses
+                 * of their memory operands to be 16-byte aligned.
+                 *
+                 * AMD has provided an even stronger guarantee that processors
+                 * with AVX provide 16-byte atomicity for all cachable,
+                 * naturally aligned single loads and stores, e.g. MOVDQU.
+                 *
+                 * See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104688
+                 */
+                if (have_avx1) {
+                    __cpuid(0, a, b, c, d);
+                    have_atomic16 = (c == signature_INTEL_ecx ||
+                                     c == signature_AMD_ecx);
+                }
             }
         }
     }
-- 
2.34.1


