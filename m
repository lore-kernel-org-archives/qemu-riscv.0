Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A662E7718B
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Jan 2025 18:28:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tTPk4-0007qh-10; Thu, 02 Jan 2025 13:16:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tTPjt-0007PS-Q7
 for qemu-riscv@nongnu.org; Thu, 02 Jan 2025 13:16:12 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tTPjq-0006sW-T7
 for qemu-riscv@nongnu.org; Thu, 02 Jan 2025 13:16:09 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-21669fd5c7cso160782915ad.3
 for <qemu-riscv@nongnu.org>; Thu, 02 Jan 2025 10:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735841764; x=1736446564; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d8h/Admcq7JHr895Vta0jYiW589ICp9iFjYzF/Y3DHs=;
 b=zW9QM1Wf948cZJh/HCxUyUr2/afaIdWbr3rBYIxI3hw5QPgNsKRvDR/nsLJ/cDejuu
 v18QIvDQBgQ4h1kDgUJGvkTFZelUx/oiuTy5wZGtlBpp/2mTTMeYjx0RIOICY9FK8pRl
 Oi1zLN4HkZT+kmGGBuzsMtrMWtLjzAqX9Kvh6Z4AkyALc0Rq8bciEk5sbPC087yf58vM
 ZA4lxvVrBhgbJGVJLd+bSlACTg2X25uTmK9T8ckDSzjSX4zo7C1gK9GIb08X7/shMWmy
 1PnB7/Y8a/alp8R5NQO5DZVGjfpDU+JGwlZHdPV40yc7IK/01B1TyGavtZSMqbj/NKWw
 txXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735841764; x=1736446564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d8h/Admcq7JHr895Vta0jYiW589ICp9iFjYzF/Y3DHs=;
 b=nSl0zdDTA2PY4CsA0HSPd6nMB6rRPoXxF2ks9iKpTyzv0Q7LzwT01m28P7RH8DklJM
 RxYX3F1p4d+Yc5hPKTD7nrmOrCtfvu1NZVYBiKUxwKvwLqNkCl1kiJhJRiXHGivdfYgb
 ZHc0AYj3a1bfvv4+nZvDmX/DDww0pQ7m1+CMia/0TJSQinM/4Lzj9+SFNGq2Mjp8lu0Y
 8+CUgusRJQPqL7G5ai9kXRDQk+NfJ42gLTw0m3m/vENRvjknI5HlolGfpzGdOOMznjsb
 UgSDZck6iz0R4CmRE9ZgkCJJU8sFh0gAEasHQChZXK+uJRsMeSYHMqh8W4uYCejOjV+8
 Qr7w==
X-Gm-Message-State: AOJu0YxTkD+wg+O7OLcPkpZWmzJqAzyvcfQd4PcydXwXB2fjFXVXtDP0
 0vPNMvTH01hxkHj0LAdC4aF5dWoQ+dh/trkvuMyjGgAQBPwJGWgF9k7vl1o/neE=
X-Gm-Gg: ASbGnctxcrawUFc2D9QLzDr3cCvcaFbZlO8xFW6QWJWdW+ucCWO19iXvXKdcy3bkT+T
 uMP4vB/YwRelpID4++mSNvvJoIxMAqvI+8iiSSZllnFb+5KuSdpfAWte9HWklmvSjBQzBtf/AVG
 LxmMOhyToZ5pHU6JDOMvZNQdQa6tx8dUssy1i4t1a4ssT3PzcOmHxl76YvDMdNyuijuXXffY3GB
 KVqjTJhj8+3PbpUmpXQTaNBQ9ojL77/ExuL+sR9wFv6BJqpQ9UQUO0nLoCCIg==
X-Google-Smtp-Source: AGHT+IFy4YL3h+4Ey3wfbIq6HK6LyH761h1mioVqaE3lFvrtVGwWpWp/rYRquZiGHhMmY2aaLQ9u3A==
X-Received: by 2002:a17:902:d481:b0:215:6fcd:6cd1 with SMTP id
 d9443c01a7336-219e6e8c508mr527072735ad.7.1735841763688; 
 Thu, 02 Jan 2025 10:16:03 -0800 (PST)
Received: from stoup.. ([63.239.63.212]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc9f68e4sm230148315ad.211.2025.01.02.10.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 10:16:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	palmer@dabbelt.com,
	Alistair.Francis@wdc.com
Subject: [PATCH 1/2] util/cpuinfo-riscv: Detect Zbs
Date: Thu,  2 Jan 2025 10:16:00 -0800
Message-ID: <20250102181601.1421059-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250102181601.1421059-1-richard.henderson@linaro.org>
References: <20250102181601.1421059-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/riscv/host/cpuinfo.h |  5 +++--
 util/cpuinfo-riscv.c              | 18 ++++++++++++++++--
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/host/include/riscv/host/cpuinfo.h b/host/include/riscv/host/cpuinfo.h
index cdc784e7b6..b2b53dbf62 100644
--- a/host/include/riscv/host/cpuinfo.h
+++ b/host/include/riscv/host/cpuinfo.h
@@ -9,8 +9,9 @@
 #define CPUINFO_ALWAYS          (1u << 0)  /* so cpuinfo is nonzero */
 #define CPUINFO_ZBA             (1u << 1)
 #define CPUINFO_ZBB             (1u << 2)
-#define CPUINFO_ZICOND          (1u << 3)
-#define CPUINFO_ZVE64X          (1u << 4)
+#define CPUINFO_ZBS             (1u << 3)
+#define CPUINFO_ZICOND          (1u << 4)
+#define CPUINFO_ZVE64X          (1u << 5)
 
 /* Initialized with a constructor. */
 extern unsigned cpuinfo;
diff --git a/util/cpuinfo-riscv.c b/util/cpuinfo-riscv.c
index 971c924012..0291b7218a 100644
--- a/util/cpuinfo-riscv.c
+++ b/util/cpuinfo-riscv.c
@@ -36,7 +36,8 @@ static void sigill_handler(int signo, siginfo_t *si, void *data)
 /* Called both as constructor and (possibly) via other constructors. */
 unsigned __attribute__((constructor)) cpuinfo_init(void)
 {
-    unsigned left = CPUINFO_ZBA | CPUINFO_ZBB | CPUINFO_ZICOND | CPUINFO_ZVE64X;
+    unsigned left = CPUINFO_ZBA | CPUINFO_ZBB | CPUINFO_ZBS
+                  | CPUINFO_ZICOND | CPUINFO_ZVE64X;
     unsigned info = cpuinfo;
 
     if (info) {
@@ -50,6 +51,9 @@ unsigned __attribute__((constructor)) cpuinfo_init(void)
 #if defined(__riscv_arch_test) && defined(__riscv_zbb)
     info |= CPUINFO_ZBB;
 #endif
+#if defined(__riscv_arch_test) && defined(__riscv_zbs)
+    info |= CPUINFO_ZBS;
+#endif
 #if defined(__riscv_arch_test) && defined(__riscv_zicond)
     info |= CPUINFO_ZICOND;
 #endif
@@ -71,7 +75,8 @@ unsigned __attribute__((constructor)) cpuinfo_init(void)
             && pair.key >= 0) {
             info |= pair.value & RISCV_HWPROBE_EXT_ZBA ? CPUINFO_ZBA : 0;
             info |= pair.value & RISCV_HWPROBE_EXT_ZBB ? CPUINFO_ZBB : 0;
-            left &= ~(CPUINFO_ZBA | CPUINFO_ZBB);
+            info |= pair.value & RISCV_HWPROBE_EXT_ZBS ? CPUINFO_ZBS : 0;
+            left &= ~(CPUINFO_ZBA | CPUINFO_ZBB | CPUINFO_ZBS);
 #ifdef RISCV_HWPROBE_EXT_ZICOND
             info |= pair.value & RISCV_HWPROBE_EXT_ZICOND ? CPUINFO_ZICOND : 0;
             left &= ~CPUINFO_ZICOND;
@@ -117,6 +122,15 @@ unsigned __attribute__((constructor)) cpuinfo_init(void)
             left &= ~CPUINFO_ZBB;
         }
 
+        if (left & CPUINFO_ZBS) {
+            /* Probe for Zbs: bext zero,zero,zero. */
+            got_sigill = 0;
+            asm volatile(".insn r 0x33, 5, 0x24, zero, zero, zero"
+                         : : : "memory");
+            info |= got_sigill ? 0 : CPUINFO_ZBS;
+            left &= ~CPUINFO_ZBS;
+        }
+
         if (left & CPUINFO_ZICOND) {
             /* Probe for Zicond: czero.eqz zero,zero,zero. */
             got_sigill = 0;
-- 
2.43.0


