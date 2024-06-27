Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A34C30653
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 18:04:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sMtTb-00019h-P2; Thu, 27 Jun 2024 14:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMtTS-00018T-FK
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2024 14:03:58 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMtTP-0001ME-UB
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2024 14:03:58 -0400
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7eee734a668so367406939f.3
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2024 11:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719511434; x=1720116234; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S0iy7OmdnIv4vhHrmSzHh4pajG0G9qYEbVVtDoAkstk=;
 b=ZaugFMYcZ7claEq9OHpyKX+bjT48BmPQLLfq0DN8n3zBtGzw9dOQGLbJN3S+8a5G2k
 auBHqLBPgl983D/zaSh7+En+D1NddLtmz/8fWTcb0aZhXSLKV3rPb4FDavZSo2JULwmT
 dK/0Niv53hWues1fFLDXyq8e1sPV0A4r6z/ZOZ4JF8u8DWGX/virs1m+H9uv6LbDwDjA
 TRyHbweLoAYuDNkER3tmsZTCfeXX9BPT7c/08MVFZcfKPXTUJ2XO5Wy91LeUm4WHLzoz
 Cc6yWy61s+0R9bG35HbULfdv1vshB2MZyrrnAccbHGI4EyNjVZlYv2QSLGte80sBBXf6
 tUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719511434; x=1720116234;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S0iy7OmdnIv4vhHrmSzHh4pajG0G9qYEbVVtDoAkstk=;
 b=qOZkAfRmvJ9svZameFl/qgzjjaHdrCb81VzwzGaud8oYiOQhH9/PxaFcEGtxe9WHnz
 F2CiiJKxL7L7swARjRi2X/HQ9NN+7s8Rh2OoPich4PboDWywDNomWaUDlmfhqNpmXyYH
 fd7hU55zV3YFrrcIvGLH5NAOroHbirKrMalQCUE4yhzVkxSQRXUkkmCpqmpMB7Q4D/J0
 2+pBeYlaw59YHKGyqbVcGip6lf2IFpiugdUbzecjHFj85GOH7Zmv9I3/M1Eqqif7w+f3
 wTk56qECIgLNvTP1JUI4Ncp0kIACUJ2OvuC2cVPwxHZB0nJrT/tDDrV2ICqaQT1n4nsu
 52EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzAjG1L/HdW6e+ULRhgRqATfCmGKRkcCIjDoOWHREx7PnGAvKwUtiaGrsfO1rFAFoysJQZ6E67IC1n/M0aLnRIOmkkZlw=
X-Gm-Message-State: AOJu0YzLBhYnotf2yLhawmL/836JIoPii9DgyARiYxWxxF3oLIxeJUdg
 OQZFiletJSVurvLWVm6yv66R7moF72VXQJQn6C0Cpy2R0cRczPygu5M1NPA7IvM=
X-Google-Smtp-Source: AGHT+IGbIDolrQN49fa5zQh9Z+vDvESl7Nr5+6iTsVqxbdzA59oot616d/eEA+1D9pZUI8qHSo83nA==
X-Received: by 2002:a05:6602:3f8a:b0:7f1:3ad1:2341 with SMTP id
 ca18e2360f4ac-7f3a13db517mr1966042139f.7.1719511434499; 
 Thu, 27 Jun 2024 11:03:54 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70803ecf764sm2170b3a.106.2024.06.27.11.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 11:03:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: brad@comstyle.com, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 qemu-riscv@nongnu.org
Subject: [PATCH 3/3] util/cpuinfo-riscv: Use linux __riscv_hwprobe syscall
Date: Thu, 27 Jun 2024 11:03:50 -0700
Message-Id: <20240627180350.128575-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627180350.128575-1-richard.henderson@linaro.org>
References: <20240627180350.128575-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2b.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

With recent linux kernels, there is a syscall to probe for various
ISA extensions.  These bits were phased in over several kernel
releases, so we still require checks for symbol availability.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build          |  6 ++++++
 util/cpuinfo-riscv.c | 26 ++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/meson.build b/meson.build
index 97e00d6f59..58afd0125d 100644
--- a/meson.build
+++ b/meson.build
@@ -2837,6 +2837,12 @@ have_cpuid_h = cc.links('''
   }''')
 config_host_data.set('CONFIG_CPUID_H', have_cpuid_h)
 
+# Don't bother to advertise asm/hwprobe.h for old versions that do
+# not contain RISCV_HWPROBE_EXT_ZBA.
+config_host_data.set('CONFIG_ASM_HWPROBE_H',
+                     cc.has_header_symbol('asm/hwprobe.h',
+                                          'RISCV_HWPROBE_EXT_ZBA'))
+
 config_host_data.set('CONFIG_AVX2_OPT', get_option('avx2') \
   .require(have_cpuid_h, error_message: 'cpuid.h not available, cannot enable AVX2') \
   .require(cc.links('''
diff --git a/util/cpuinfo-riscv.c b/util/cpuinfo-riscv.c
index abf799794f..cf59ce83a3 100644
--- a/util/cpuinfo-riscv.c
+++ b/util/cpuinfo-riscv.c
@@ -6,6 +6,11 @@
 #include "qemu/osdep.h"
 #include "host/cpuinfo.h"
 
+#ifdef CONFIG_ASM_HWPROBE_H
+#include <asm/hwprobe.h>
+#include <sys/syscall.h>
+#endif
+
 unsigned cpuinfo;
 static volatile sig_atomic_t got_sigill;
 
@@ -47,6 +52,27 @@ unsigned __attribute__((constructor)) cpuinfo_init(void)
 #endif
     left &= ~info;
 
+#ifdef CONFIG_ASM_HWPROBE_H
+    if (left) {
+        /*
+         * TODO: glibc 2.40 will introduce <sys/hwprobe.h>, which
+         * provides __riscv_hwprobe and __riscv_hwprobe_one,
+         * which is a slightly cleaner interface.
+         */
+        struct riscv_hwprobe pair = { .key = RISCV_HWPROBE_KEY_IMA_EXT_0 };
+        if (syscall(__NR_riscv_hwprobe, &pair, 1, 0, NULL, 0) == 0
+            && pair.key >= 0) {
+            info |= pair.value & RISCV_HWPROBE_EXT_ZBA ? CPUINFO_ZBA : 0;
+            info |= pair.value & RISCV_HWPROBE_EXT_ZBB ? CPUINFO_ZBB : 0;
+            left &= ~(CPUINFO_ZBA | CPUINFO_ZBB);
+#ifdef RISCV_HWPROBE_EXT_ZICOND
+            info |= pair.value & RISCV_HWPROBE_EXT_ZICOND ? CPUINFO_ZICOND : 0;
+            left &= ~CPUINFO_ZICOND;
+#endif
+        }
+    }
+#endif /* CONFIG_ASM_HWPROBE_H */
+
     if (left) {
         struct sigaction sa_old, sa_new;
 
-- 
2.34.1


