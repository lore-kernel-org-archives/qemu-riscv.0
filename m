Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIG2m-0005tK-Rr
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 15:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2j-0005il-7Y
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 15:55:37 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:40889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2g-00031e-2E
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 15:55:36 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso208789pjh.5
 for <qemu-riscv@nongnu.org>; Mon, 23 Aug 2021 12:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lxeJrVtjC1EeoqdV6Q1TTF0jNHnkui67NgV+2bdrMWY=;
 b=eDBzGnfvcNK/gUqH9KGmyHtj0i39n3204zVsb0G9ZTazT6KyNr8yd3ziOX7iXl52Xh
 5DKE9E72d9PhLbemNb316cMsRUfe5zViSFy+25w2VodvHnSRVnvH4S0KrifoOeAy8Z/0
 fDkh6rP6O6iKrNRbtJ2+aLUXwFLUMbaSfT5jPgTPp3GKTc0jhDLUyr499TtApe32ymtm
 /MnnDEUsj76IPg/xJLhp/8ux7VbDu5Lu24bxnY2RSv1TW9JBzix1Bk8/Bx4sRwapNGKJ
 CJNnZgXf9/LBu9tY5dro6DBNyUNEKFmSy1eVwP1BuYQpCgQXHMCOT+sgsyBOmkEYbuPe
 d5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lxeJrVtjC1EeoqdV6Q1TTF0jNHnkui67NgV+2bdrMWY=;
 b=RIyT0UKcMDaVNXdNhhcLd+EB9Aho9K0tzuvThYK/q6xreMxGiCw5Scep3TJg0vofJY
 1QcXLiBd7nHbBaO5ctpqUATY1AjKHrn9yslH9XZehfDBOwUPHrmsNQ+sesVKigQpGKGg
 C0Ye+/9w0surAQuqrRlc02PN6xlVqtnjc3kN+jTHvVXRdPcIw5L0jwK7xHXPsMJ9OqOa
 aOX3vK/kn3xn9txb4Vrc21mnP7ZeQLcbCuLutros0jKw/4SMaVFIHaSehzOsIXH6Rej6
 TbCSUIhjDzxIFw1j32h1hN7oL259wcm4i4sl/StxZgA/UyHZdOICOQ4yk6Ko/W55X2HQ
 9Trg==
X-Gm-Message-State: AOAM533XDER4TwjJsJOxrjvbljcguZBhWzb7babH6w8U/k/nid13Nv5X
 w/FYZK2uNuLjfB3bD3OWHXiUEA==
X-Google-Smtp-Source: ABdhPJzi7a9K0t1taQK/pKVRUreQeuL5GR7tnrRrLiPOOaA1xTS+vn9IZFAIMDTsOT7qOCbZ4jymOQ==
X-Received: by 2002:a17:90a:9cf:: with SMTP id 73mr261985pjo.136.1629748532827; 
 Mon, 23 Aug 2021 12:55:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v15sm16685078pff.105.2021.08.23.12.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 12:55:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, bin.meng@windriver.com, alistair.francis@wdc.com,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v5 02/24] tests/tcg/riscv64: Add test for division
Date: Mon, 23 Aug 2021 12:55:07 -0700
Message-Id: <20210823195529.560295-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823195529.560295-1-richard.henderson@linaro.org>
References: <20210823195529.560295-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Mon, 23 Aug 2021 19:55:37 -0000

Tested-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


