Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pELZy-0005bK-2K
	for mharc-qemu-riscv@gnu.org; Sat, 07 Jan 2023 21:38:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZw-0005Yt-Ia
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:38:32 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZB-0004gb-W8
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:38:32 -0500
Received: by mail-pl1-x631.google.com with SMTP id c6so5884813pls.4
 for <qemu-riscv@nongnu.org>; Sat, 07 Jan 2023 18:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LHzGWvWFa4q7FhR/Zjnl6sZxcznG5V94Bca4nmBi0Ko=;
 b=YTwxzUVTIaPoRoMrrMr3xZVtTxHkxcoWUY/Z2XQDOSB9OBwIAea0LWF4lZprz0utdL
 bz8oAXkZ3pbK8ENWVfDUPWyMxSf5qcWI7FdLHPzVhOdyqjkbnc7RYerBxQdmB9Sd4SNc
 W53FcipIv/fYzM1CT+uvFYlDuvdAk2/kogBSiHH30yV1gAPucUS4CmvT7tD6r8j3GoeP
 e3C4JRG6yLBzathSHildNLFQ87fxBqI7WxbiZTxvKKqIeunYgevwxILHvH32/SSN3Z4G
 nJwT+chTNLjwGHbuETD1YlinuW3PASIxxePuuoD/RrS4xa3rYjivcBCSGBfLjUJGJLuQ
 MlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LHzGWvWFa4q7FhR/Zjnl6sZxcznG5V94Bca4nmBi0Ko=;
 b=xmqhWeQRt72zFFxHqztAByEhHUOyaVKBYjIvYHIO6u6QjDTubhLbd4qptejQVj6wza
 TqGpEmzlhb9K50twowJXYIL08TQiKjGKkUWX/Mkk4JY/jQcuqt3w3Grd18JL3v2BEJu1
 YeVakKhR51GaHScAqGG+yJG+I7NR1Q8aOUP9NhEhWb110wvHhLwgBQs+C9AQII9pwXgq
 hWJM6By94qulzIUKWH646E5CqtBnfr8Pk6FmQ5jhU13TFnH+KZeCf5KJALuHdfqcCSFv
 loe5Cn37F26UEONaND+7x3A39ZMhulcoBFqc6ypUSlA6XJ89+Kj+bMc1ZniwWff5ErCv
 jDrA==
X-Gm-Message-State: AFqh2kqr6DgWL102i6ZYIdlfm76pe8LpHI5ElO0R9rDKR66Ozo/YRVC4
 Mzjez+lHxieN1OLtFtXvX4hAGw==
X-Google-Smtp-Source: AMrXdXtWkkVxrDI5jAepvQBu55pf/8Pkk8TEqq3iuXCppr2qwzq8jDajDuGDsPrBDdPoMgPJH321zw==
X-Received: by 2002:a17:902:fe0c:b0:192:5c3e:8939 with SMTP id
 g12-20020a170902fe0c00b001925c3e8939mr52348852plj.0.1673145464761; 
 Sat, 07 Jan 2023 18:37:44 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 22/36] tests/tcg/s390x: Add clst.c
Date: Sat,  7 Jan 2023 18:37:05 -0800
Message-Id: <20230108023719.2466341-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
X-List-Received-Date: Sun, 08 Jan 2023 02:38:32 -0000

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add a basic test to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20221025213008.2209006-2-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/s390x/clst.c          | 82 +++++++++++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 tests/tcg/s390x/clst.c

diff --git a/tests/tcg/s390x/clst.c b/tests/tcg/s390x/clst.c
new file mode 100644
index 0000000000..ed2fe7326c
--- /dev/null
+++ b/tests/tcg/s390x/clst.c
@@ -0,0 +1,82 @@
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <stdlib.h>
+
+static int clst(char sep, const char **s1, const char **s2)
+{
+    const char *r1 = *s1;
+    const char *r2 = *s2;
+    int cc;
+
+    do {
+        register int r0 asm("r0") = sep;
+
+        asm("clst %[r1],%[r2]\n"
+            "ipm %[cc]\n"
+            "srl %[cc],28"
+            : [r1] "+r" (r1), [r2] "+r" (r2), "+r" (r0), [cc] "=r" (cc)
+            :
+            : "cc");
+        *s1 = r1;
+        *s2 = r2;
+    } while (cc == 3);
+
+    return cc;
+}
+
+static const struct test {
+    const char *name;
+    char sep;
+    const char *s1;
+    const char *s2;
+    int exp_cc;
+    int exp_off;
+} tests[] = {
+    {
+        .name = "cc0",
+        .sep = 0,
+        .s1 = "aa",
+        .s2 = "aa",
+        .exp_cc = 0,
+        .exp_off = 0,
+    },
+    {
+        .name = "cc1",
+        .sep = 1,
+        .s1 = "a\x01",
+        .s2 = "aa\x01",
+        .exp_cc = 1,
+        .exp_off = 1,
+    },
+    {
+        .name = "cc2",
+        .sep = 2,
+        .s1 = "abc\x02",
+        .s2 = "abb\x02",
+        .exp_cc = 2,
+        .exp_off = 2,
+    },
+};
+
+int main(void)
+{
+    const struct test *t;
+    const char *s1, *s2;
+    size_t i;
+    int cc;
+
+    for (i = 0; i < sizeof(tests) / sizeof(tests[0]); i++) {
+        t = &tests[i];
+        s1 = t->s1;
+        s2 = t->s2;
+        cc = clst(t->sep, &s1, &s2);
+        if (cc != t->exp_cc ||
+                s1 != t->s1 + t->exp_off ||
+                s2 != t->s2 + t->exp_off) {
+            fprintf(stderr, "%s\n", t->name);
+            return EXIT_FAILURE;
+        }
+    }
+
+    return EXIT_SUCCESS;
+}
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index ab7a3bcfb2..79250f31dd 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -25,6 +25,7 @@ TESTS+=signals-s390x
 TESTS+=branch-relative-long
 TESTS+=noexec
 TESTS+=div
+TESTS+=clst
 
 Z13_TESTS=vistr
 $(Z13_TESTS): CFLAGS+=-march=z13 -O2
-- 
2.34.1


