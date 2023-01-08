Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pELa7-0005r9-6Y
	for mharc-qemu-riscv@gnu.org; Sat, 07 Jan 2023 21:38:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELa2-0005jv-B7
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:38:38 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZC-0004Vf-Ql
 for qemu-riscv@nongnu.org; Sat, 07 Jan 2023 21:38:38 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 fz16-20020a17090b025000b002269d6c2d83so8701501pjb.0
 for <qemu-riscv@nongnu.org>; Sat, 07 Jan 2023 18:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wHZLFNNm0ZFp31ulDF75QeL44+XwFwYbg39T7b6YDuI=;
 b=yz/Vv9hfx11fLSInlmwJJ1MiPWzE7D/6OdyIY8MRsTs5VPjdFjXiWqOie9g2r6ox8f
 xOqANbE5cvmgQPJkBPDFqa5M2lDwRmrPO5Ps35nPdBDp/2jfCaf6CekDebjqcusMcNtI
 e7wjIooMErSThlYi6DKx+5bT78BY7IWdlWjBAxF/xzojETPLYpH5Z/I+a8obKDiWp/ee
 bJzNJbVRYOKS6Q8NF8c1Y86wXQ9zdyEsto8R0ACvTaT20gzVGLqEhlTB+5Y/1jRRtwpr
 V35qfYdz/Kax42wBGbUZfcRkscrNi0Rw4aNaCmMirA+Hmopcpyj06pGB8fvY153nHJ0P
 tosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wHZLFNNm0ZFp31ulDF75QeL44+XwFwYbg39T7b6YDuI=;
 b=nNtIpJLvcFtCs1DBvfq38trGWcWS6Yfe+fS8nNQhg0AauKYnYZdorIvSrjjAnH5GKq
 bd7aXX8ifzr7Cvhcu+0Y7c+Ig81sQGCLDEI0tWQUi5yJEyqhrWvqMu9+h/btcMmpFkvY
 FqCxiX7DoHLgw9WZ8t5u4NbjDqje5LjU2FY4j8bSKDA+fttqze6PpUz5KEgUDmL2eL0A
 it2K9Ns8WO4M7hrltzkz28lpji6VWkA6S+g4VS8QJwZ+0a0RI1umXcNID4FrQFZyU6jb
 aQAMQRH1BntXW//Zm78DtAdMOAoPieDFG247JdprcvlKLjU7wBwA3ijuioovScA+czlA
 ZxSw==
X-Gm-Message-State: AFqh2kq6o5Dp9fE+3C12BpNHSIj4uYHT24/dG5Y8cCUJkzIBkQDfnB94
 hHo9C4yF1hUORJ1iF/qfeujdKQ==
X-Google-Smtp-Source: AMrXdXsidKN8kV3QYovayg1TOWMn+v7UTYaTQDgzkZLYCWEoLtEOwPlF3xckO4uBp2FDg1YRVww9LQ==
X-Received: by 2002:a17:902:f791:b0:192:5ec4:6656 with SMTP id
 q17-20020a170902f79100b001925ec46656mr61538487pln.3.1673145466046; 
 Sat, 07 Jan 2023 18:37:46 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 23/36] tests/tcg/s390x: Add long-double.c
Date: Sat,  7 Jan 2023 18:37:06 -0800
Message-Id: <20230108023719.2466341-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
X-List-Received-Date: Sun, 08 Jan 2023 02:38:38 -0000

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/s390x/long-double.c   | 24 ++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 tests/tcg/s390x/long-double.c

diff --git a/tests/tcg/s390x/long-double.c b/tests/tcg/s390x/long-double.c
new file mode 100644
index 0000000000..757a6262fd
--- /dev/null
+++ b/tests/tcg/s390x/long-double.c
@@ -0,0 +1,24 @@
+/*
+ * Perform some basic arithmetic with long double, as a sanity check.
+ * With small integral numbers, we can cross-check with integers.
+ */
+
+#include <assert.h>
+
+int main()
+{
+    int i, j;
+
+    for (i = 1; i < 5; i++) {
+        for (j = 1; j < 5; j++) {
+            long double la = (long double)i + j;
+            long double lm = (long double)i * j;
+            long double ls = (long double)i - j;
+
+            assert(la == i + j);
+            assert(lm == i * j);
+            assert(ls == i - j);
+        }
+    }
+    return 0;
+}
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 79250f31dd..1d454270c0 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -26,6 +26,7 @@ TESTS+=branch-relative-long
 TESTS+=noexec
 TESTS+=div
 TESTS+=clst
+TESTS+=long-double
 
 Z13_TESTS=vistr
 $(Z13_TESTS): CFLAGS+=-march=z13 -O2
-- 
2.34.1


