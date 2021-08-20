Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mH8Y1-0005LD-1Z
	for mharc-qemu-riscv@gnu.org; Fri, 20 Aug 2021 13:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8Xz-0005I3-1x
 for qemu-riscv@nongnu.org; Fri, 20 Aug 2021 13:43:15 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:50778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8Xq-0003mk-5B
 for qemu-riscv@nongnu.org; Fri, 20 Aug 2021 13:43:12 -0400
Received: by mail-pj1-x1034.google.com with SMTP id bo18so7888590pjb.0
 for <qemu-riscv@nongnu.org>; Fri, 20 Aug 2021 10:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yEsAxRc7JdZ/BSsn2AS7p0rZoGqW6QfhyAngNtE9mC8=;
 b=blefX4G311GP7PEbFiIBfZixKg4EDoCXH1GLAONCaaNQ1alzzNPI6DcLL41GL3rC+P
 sxhxrA3Kxou6QRTyy5uMi8H0Nyt8bWCevuI/UnVcKhOfBZDJgRMtqNI8IXMGZNvm4JQ3
 UeXMGmFc6ybYn8afahAU+f2mU9QnVZ6qIGM9hUaRokgc3BwhxUor42FC8kJ2S1NRYCz/
 RoJ4GxqGABtGjg8B7GGeTILIqnUODtaiF4a3P5vjOs8DWeHVVF48NGDM+9ZaJHpMMihf
 h+nxyLaawpyRqE7+gFohl54SwgCm39h0Bmxj+v1HXrl9PP2obI3MdvHfoBea6uS6bFNE
 UjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yEsAxRc7JdZ/BSsn2AS7p0rZoGqW6QfhyAngNtE9mC8=;
 b=EIALNNNHtwqU4ZsG1JdrJeU4Q3SY8aV0Hz9ljkfyjarJI/Ki3nY0ZCQGdkJY4+ZBcE
 wzOlF/jwunXTWm+ksqjWoD9vZ5adDMnha4bZ5db8LQrhBCkiSU7LsVfMdPDbcfxGN1MZ
 a0BIZ6xrvUcm6637leqCj/O5bLU69PboZTWW604gjqEN/QP/RkxeVn3i7o0eDK0f+Hrx
 Us43/rZLIA9nGAR32RnuaR7I3r8/tArprn19wmpM+UOnlwyh8PaUDfIuk+hoUMSheArQ
 mG0zS8VkmPKcWmUX8csh8BB9ZZ+m7hR18w3vv0cZISZIdU9nGgb6hdRNa22Sq0yOCOVY
 zFEg==
X-Gm-Message-State: AOAM5313CfA09XWrFetwUioKkae9sUH2KT/Vq40d8nTF8V1aejHERlaL
 N9fBquVbYkMjQim8IrB959FVEyijFtoCuA==
X-Google-Smtp-Source: ABdhPJw2TzyTwQhfuBnT8lLExyTuiwlHMhYZBIoIv50iY6beOVFiPwLvvGiVjzre2IZ7VLpo1ipDmA==
X-Received: by 2002:a17:90a:fa89:: with SMTP id
 cu9mr5444355pjb.5.1629481384290; 
 Fri, 20 Aug 2021 10:43:04 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id l2sm7304142pfc.157.2021.08.20.10.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 10:43:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	bin.meng@windriver.com,
	alistair.francis@wdc.com
Subject: [PATCH v4 02/21] tests/tcg/riscv64: Add test for division
Date: Fri, 20 Aug 2021 07:42:38 -1000
Message-Id: <20210820174257.548286-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820174257.548286-1-richard.henderson@linaro.org>
References: <20210820174257.548286-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 20 Aug 2021 17:43:15 -0000

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/riscv64/test-div.c      | 58 +++++++++++++++++++++++++++++++
 tests/tcg/riscv64/Makefile.target |  5 +++
 2 files changed, 63 insertions(+)
 create mode 100644 tests/tcg/riscv64/test-div.c
 create mode 100644 tests/tcg/riscv64/Makefile.target

diff --git a/tests/tcg/riscv64/test-div.c b/tests/tcg/riscv64/test-div.c
new file mode 100644
index 0000000000..a90480be3f
--- /dev/null
+++ b/tests/tcg/riscv64/test-div.c
@@ -0,0 +1,58 @@
+#include <assert.h>
+#include <limits.h>
+
+struct TestS {
+    long x, y, q, r;
+};
+
+static struct TestS test_s[] = {
+    { 4, 2, 2, 0 },                 /* normal cases */
+    { 9, 7, 1, 2 },
+    { 0, 0, -1, 0 },                /* div by zero cases */
+    { 9, 0, -1, 9 },
+    { LONG_MIN, -1, LONG_MIN, 0 },  /* overflow case */
+};
+
+struct TestU {
+    unsigned long x, y, q, r;
+};
+
+static struct TestU test_u[] = {
+    { 4, 2, 2, 0 },                 /* normal cases */
+    { 9, 7, 1, 2 },
+    { 0, 0, ULONG_MAX, 0 },         /* div by zero cases */
+    { 9, 0, ULONG_MAX, 9 },
+};
+
+#define ARRAY_SIZE(X)  (sizeof(X) / sizeof(*(X)))
+
+int main (void)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(test_s); i++) {
+        long q, r;
+
+        asm("div %0, %2, %3\n\t"
+            "rem %1, %2, %3"
+            : "=&r" (q), "=r" (r)
+            : "r" (test_s[i].x), "r" (test_s[i].y));
+
+        assert(q == test_s[i].q);
+        assert(r == test_s[i].r);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(test_u); i++) {
+        unsigned long q, r;
+
+        asm("divu %0, %2, %3\n\t"
+            "remu %1, %2, %3"
+            : "=&r" (q), "=r" (r)
+            : "r" (test_u[i].x), "r" (test_u[i].y));
+
+        assert(q == test_u[i].q);
+        assert(r == test_u[i].r);
+    }
+
+    return 0;
+}
diff --git a/tests/tcg/riscv64/Makefile.target b/tests/tcg/riscv64/Makefile.target
new file mode 100644
index 0000000000..d41bf6d60d
--- /dev/null
+++ b/tests/tcg/riscv64/Makefile.target
@@ -0,0 +1,5 @@
+# -*- Mode: makefile -*-
+# RISC-V specific tweaks
+
+VPATH += $(SRC_PATH)/tests/tcg/riscv64
+TESTS += test-div
-- 
2.25.1


