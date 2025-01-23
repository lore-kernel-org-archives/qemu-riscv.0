Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D1EC02182
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 23:48:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tb6u9-0001Wj-D3; Thu, 23 Jan 2025 18:46:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tb6tj-0000At-IP
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2025 18:46:09 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tb6td-0004UQ-UP
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2025 18:46:05 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so17198475e9.0
 for <qemu-riscv@nongnu.org>; Thu, 23 Jan 2025 15:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737675959; x=1738280759; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9gXZ2pCmpp3MBAsW4Hnbi8sV5bqYGRAr8w/4hsc1kvQ=;
 b=ltT2sGh/FbEpEsD6V48v4IhBk5KynU5kff7WyXFsZxlvIpYK5+35vqrMKy13ANRPT8
 cYzW/NUaytgnQpshnrHL0flVWl1Lkb6ye7Jjwd95NjWDyTjMUrBJHb44XuypkmvmuCO8
 LFR28+JzeVDkHk/QQHjliARHFoW6YKjiQsLglBJuYFua00RJKVMVIbw7Ow1fKHiDUh5J
 ns3P420Vzs81B2tCxeAm7H1LYsconXKYtggY3fQdIrRfMOAjXEKjpApmT8MmrYg+/vjQ
 U2P50z155KOE1GkAeQMorYsr2L8d/mQ9L+sFzDqiCEJHemG6YrdGgGcvl8mY3TfEMaKT
 pDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737675959; x=1738280759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9gXZ2pCmpp3MBAsW4Hnbi8sV5bqYGRAr8w/4hsc1kvQ=;
 b=iuJrklYPaFEwHbt/xrOxWuDDpAAAZKUZJ5LiaXBdy+TcFiVAUq0V3K4nMDK49vlRNk
 uELpiBDyI4TSPYpelYYLXw4O/pMlk+Rs3WA8rjjfywK8ceqUcqRczgMHkqEPGBOOT10O
 4Js3UGH7kQKG4iyPBEQC2ZJoYFPFa21j+D/XeY7M7i7kaXlHKnMAXAmw18gRnc5SPfO/
 5IeQkPmTqao+tkgaRzgESYnVUejRwvceQJnz2g1T34se5WiuDs7rdK2a0C4XPQ6K2K/V
 4SGRhUNwdl/wacBdnfRoGA1xQZixKIsQ1TQtGJd27VutcyfhJSmt5ZJLTO6GPY9I7N69
 Tyog==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+pSbUPnGG+KW8LKbuoQwl/klHCZzvPdaAmI1p+d5re+27c82VGU2uKm7dsI7PM5f9IybjYFuZk5od@nongnu.org
X-Gm-Message-State: AOJu0Yw+nxh82WxE+9TVq4YP1sNBWkqpR3ihZKvNJ/Wlp4Ivay7/t0i5
 w3iuLA0+7rV1LvEt8EgAGdK3tFEo0pZBJoFgXwi13hgyoNIWD1fcZS5MTOLSUqA=
X-Gm-Gg: ASbGncshoyWxoUz3rV8Fu40nmR/gyZhVmAm0I1qqcIS3JJwpbkX6kKgO4+sDYkplNnB
 FPVcFu4GEe1VXcq+2bt4cArR83kNNYbWqPMdHtVjaNiChMDkTJYLuWtXZiuqKl/uXQYYaMpOpag
 /3m1GaW0nGW+Txp8BKyQ7kYaXAw10gkWvlzx97AxOwnRNtmG2Lwfxv8v/B9fccZ9DR3yt9y6N3k
 oPhaIoUIb6fhaCJHfI82TLnImCBSDqDLZp28N0kh2PNHBv9aG9i3vcHnITJkP5JNh1tNvL2iDz3
 8hQNFBViGnjYrUKNvT/O9rrM5dka2jGH0dG1aHgWOJzoznZM8aHrD10=
X-Google-Smtp-Source: AGHT+IFkrF3nSiyRp86eT1OfDhljZaIiOgfPlVgQgIeU90j7M027ZvrIkgirhKCWekxtCJUAZQHWLg==
X-Received: by 2002:a05:600c:4f48:b0:434:fd15:3adc with SMTP id
 5b1f17b1804b1-43891431319mr209632555e9.25.1737675959187; 
 Thu, 23 Jan 2025 15:45:59 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a17d79csm1009152f8f.39.2025.01.23.15.45.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:45:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 18/20] cpus: Have cpu_exec_initfn() per user / system emulation
Date: Fri, 24 Jan 2025 00:44:12 +0100
Message-ID: <20250123234415.59850-19-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Slighly simplify cpu-target.c again by extracting cpu_exec_initfn()
to cpu-{system,user}.c, adding an empty stub for user emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Good enough for now...
---
 cpu-target.c         | 9 ---------
 hw/core/cpu-system.c | 7 +++++++
 hw/core/cpu-user.c   | 5 +++++
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/cpu-target.c b/cpu-target.c
index dff8c0747f9..3d33d20b8c8 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -24,7 +24,6 @@
 #include "migration/vmstate.h"
 #ifndef CONFIG_USER_ONLY
 #include "hw/core/sysemu-cpu-ops.h"
-#include "exec/address-spaces.h"
 #endif
 #include "system/accel-ops.h"
 #include "system/cpus.h"
@@ -176,14 +175,6 @@ void cpu_exec_unrealizefn(CPUState *cpu)
     accel_cpu_common_unrealize(cpu);
 }
 
-void cpu_exec_initfn(CPUState *cpu)
-{
-#ifndef CONFIG_USER_ONLY
-    cpu->memory = get_system_memory();
-    object_ref(OBJECT(cpu->memory));
-#endif
-}
-
 char *cpu_model_from_type(const char *typename)
 {
     const char *suffix = "-" CPU_RESOLVING_TYPE;
diff --git a/hw/core/cpu-system.c b/hw/core/cpu-system.c
index c63c984a803..0520c362db4 100644
--- a/hw/core/cpu-system.c
+++ b/hw/core/cpu-system.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "exec/address-spaces.h"
 #include "exec/memory.h"
 #include "exec/tswap.h"
 #include "hw/qdev-core.h"
@@ -182,3 +183,9 @@ void cpu_class_init_props(DeviceClass *dc)
 
     device_class_set_props(dc, cpu_system_props);
 }
+
+void cpu_exec_initfn(CPUState *cpu)
+{
+    cpu->memory = get_system_memory();
+    object_ref(OBJECT(cpu->memory));
+}
diff --git a/hw/core/cpu-user.c b/hw/core/cpu-user.c
index e5ccf6bf13a..cdd8de2fefa 100644
--- a/hw/core/cpu-user.c
+++ b/hw/core/cpu-user.c
@@ -25,3 +25,8 @@ void cpu_class_init_props(DeviceClass *dc)
 {
     device_class_set_props(dc, cpu_user_props);
 }
+
+void cpu_exec_initfn(CPUState *cpu)
+{
+    /* nothing to do */
+}
-- 
2.47.1


