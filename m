Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pELZu-0005Vc-UX
	for mharc-qemu-riscv@gnu.org; Sat, 07 Jan 2023 21:38:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZs-0005S3-Pc
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:38:28 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZA-0004Wm-GE
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:38:28 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso9331342pjt.0
 for <qemu-riscv@nongnu.org>; Sat, 07 Jan 2023 18:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lE4xtEA+pGCE8llxbq4kNT+2kFoTqQa5IGjt6U1bFuE=;
 b=OJiP8Km0LIo65GowqB6hEQC0cb6+H2GTFuEr23RyvHYc5n9ACypQTLSyh1I7LHGWFi
 D0kr+Bl4emeiYv/9tL8pXEMmZZnZt9633B7xoXfl/wwu0D1+tcoiid9nF2Fs2wa/HaPs
 2Y8hUzAeJnwRCID5Dw9E4iJT6ZAzVVgJSu8IpKnoVdmRb82hCbKM97WeVDCBsDQQmrEQ
 +a7mmzMp/WGrn+1eIb21gCNp9W/3UjCdMFIl0gA8qcZ9GG6q5bzgpZzV+iWuszcxlx75
 W4scD1e2MWM0F+aDAxwxHA0waA5KY3VClZmpUHfTkZymNVLGG+pYUchfmZ0kstUzCesX
 Q1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lE4xtEA+pGCE8llxbq4kNT+2kFoTqQa5IGjt6U1bFuE=;
 b=qjQi0LuKeQvmeq95lgpoPGCgGrQu92giZL5RKwxCBV7Ed529halBmgrDEzrgNvrLXw
 PVJrzOMpyiPCbtbiaG2SXRmYznzamm5LqhTxs6F4xjDjpiixz2AboZv/5F2mfp2Sko8T
 PDB+w0EhgvmvphgMhHXo1bYIzJAthNX9kPZBbHyeToG2MNdRnHbH89bain82q1T/wfXD
 DWyK+nEqo0K/F8ot6LghOWvM08IUgPGonGzFKq8vsmdcXFD5PytZLY7uFgTZ5A6s++KK
 N0cDog6j4Ttow6b99g9yixLIVDQw7MAEX/ed9/j6ZMNjKnlj4cxwnfBibCSOK+173OiC
 xt4Q==
X-Gm-Message-State: AFqh2kpqDcsshWkI4o8HgkdyTQj3s02+EurEgKDYjx0jhHWhPkJEMOZS
 1pjkMrxthjHGOnvGzkAKtadpww==
X-Google-Smtp-Source: AMrXdXsiBsglispZb5gp3AG7BUWzgtlj9mgUmnLWokD2UGSwnX7/QWTypmlkm+kHmrYBENDJZgWHFg==
X-Received: by 2002:a17:902:a9c1:b0:193:1557:457c with SMTP id
 b1-20020a170902a9c100b001931557457cmr5559835plr.62.1673145463667; 
 Sat, 07 Jan 2023 18:37:43 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 21/36] tests/tcg/s390x: Add div.c
Date: Sat,  7 Jan 2023 18:37:04 -0800
Message-Id: <20230108023719.2466341-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 08 Jan 2023 02:38:29 -0000

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add a basic test to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20221101111300.2539919-1-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/s390x/div.c           | 40 +++++++++++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 tests/tcg/s390x/div.c

diff --git a/tests/tcg/s390x/div.c b/tests/tcg/s390x/div.c
new file mode 100644
index 0000000000..5807295614
--- /dev/null
+++ b/tests/tcg/s390x/div.c
@@ -0,0 +1,40 @@
+#include <assert.h>
+#include <stdint.h>
+
+static void test_dr(void)
+{
+    register int32_t r0 asm("r0") = -1;
+    register int32_t r1 asm("r1") = -4241;
+    int32_t b = 101, q, r;
+
+    asm("dr %[r0],%[b]"
+        : [r0] "+r" (r0), [r1] "+r" (r1)
+        : [b] "r" (b)
+        : "cc");
+    q = r1;
+    r = r0;
+    assert(q == -41);
+    assert(r == -100);
+}
+
+static void test_dlr(void)
+{
+    register uint32_t r0 asm("r0") = 0;
+    register uint32_t r1 asm("r1") = 4243;
+    uint32_t b = 101, q, r;
+
+    asm("dlr %[r0],%[b]"
+        : [r0] "+r" (r0), [r1] "+r" (r1)
+        : [b] "r" (b)
+        : "cc");
+    q = r1;
+    r = r0;
+    assert(q == 42);
+    assert(r == 1);
+}
+
+int main(void)
+{
+    test_dr();
+    test_dlr();
+}
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 07fcc6d0ce..ab7a3bcfb2 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -24,6 +24,7 @@ TESTS+=trap
 TESTS+=signals-s390x
 TESTS+=branch-relative-long
 TESTS+=noexec
+TESTS+=div
 
 Z13_TESTS=vistr
 $(Z13_TESTS): CFLAGS+=-march=z13 -O2
-- 
2.34.1


