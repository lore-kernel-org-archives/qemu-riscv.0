Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19B0C71130
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 17:23:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uYpY7-0003xU-KT; Mon, 07 Jul 2025 13:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uYpWy-0001En-M4
 for qemu-riscv@nongnu.org; Mon, 07 Jul 2025 13:21:29 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uYpWv-0005IM-VW
 for qemu-riscv@nongnu.org; Mon, 07 Jul 2025 13:21:28 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a525eee2e3so2186472f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 07 Jul 2025 10:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751908883; x=1752513683; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7p3/Hmprmc6/fhtaFhxu5792QEnsgrd/nZSQrS03GGU=;
 b=s8p/QYoJj8gkRCIGYM72Ugm9ndpMQpNpwpVzMySTJv/CkUh6uDO84uXC1SzC0JabPd
 d5ipY6pQ0CVtLrzzzw3yqNLU0mwPX/NTcB0g6gUzDfepqfDZrNkcvcYQg6DjGSdX6h+G
 Pzf1bti/KvKjQFtJPG0jGHognm1s++yghSGkB8S28dN8wkPlOYjLjA2bWsGyB5P/HRT0
 mzYjZiUL50uqJYPb0+Rbf2hwO3uh7O0zQG4u6Xj6SnkIQgjvmkKsDRhbNs+26bLYk7jn
 s4vvMH5baATtBFRyNWnUcrh6NPGDOzrXFQDnZHXOPUZVo5CNUN+ah7cdtewLC0AL8M1U
 /SdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751908883; x=1752513683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7p3/Hmprmc6/fhtaFhxu5792QEnsgrd/nZSQrS03GGU=;
 b=LgHLxWQFsZvoMjWkR3TNeS+GL3cSE1IwrcKWfxGAC8l7gRYmXJ0nlta48Afc2H1Z1V
 vCxhmvQAxxtFdwrqi2xe4QdM0h7QusBIwKt9PntGFWhbZEVZ7nIUkNgfguJOO3EsO5cU
 ZDVLDKPTQIwwCU7ejixUnVe+wLoeQBRiziiNW+DBDii/8ZydgLkZ6R4izUTEtqcogpl3
 tZsel/Ffv9snVsnJhhTMSwCbyCCwNgU8TJDi/7OUcIcuVH1rfAJqCxDZkqe+BDnXZ/L7
 NVdUu3q0ccQ2l55m7xgE18HZk8DhT7xBGwkBlBdSHKmuBil8zGczy8LcrCrQDBCk6CJZ
 gfBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDAXqN8iTxkVQwpSJPdXPRIknvVwV76YOxFX8nxhVfCPKsHn4UUGT/ty/o+unIzOiLLD7d7XIc/tsS@nongnu.org
X-Gm-Message-State: AOJu0Yzt7zXFjNx+4lkyKtA9NH9FF/siu7kYSiMIptuQ8SSVppSVaJau
 mN+iwLX7JzYlvcH5/Tc6Ecpka/r1Bvyj8ok5oYiojsNxQM6kOWcw+4xfowdEQ73ixrU=
X-Gm-Gg: ASbGncuyd8CgDXnyV/XdDuaKtD8AvqgAXHnS3i9LNaxqp/9QZzqYm1UohxaKxupLesg
 mvGx8fytP1i3TVAs9vbTxVMzXPXSYHueLuF25hFg1/G7476b91D4HagizfHU8drwrl3Uyq6YTOn
 /BRRomuWDXfp1mvlvNjxOcJgkExllDTgDt6YNANPKWVNCDvSeNvVbmONLo9XqpKUdOp0FF9effv
 ipKw/A5D8Bqt5gx3GlXTigryqU26GmAIswCCUZcH44PqGNLidExlUapsbzbScofnwq0+tj6yVNj
 0prgc0Jg4o4xSnvh3k72JwXO+V5JegruO3bE7ErjqOtGdgCmEeCs/EKE5IrIsJqNxqRkY01jFzz
 2DaiJfkee2wMeEu/cgK7NlDF8g9rp8q6PYlJx
X-Google-Smtp-Source: AGHT+IFqHPha3JU0SZDEsSk94xHPuM6ykN63Gj5nxi9VvSTcrrq3iiZaJo12fIbdCfh+Smny4ThY7Q==
X-Received: by 2002:a5d:5847:0:b0:3a4:eef5:ae26 with SMTP id
 ffacd0b85a97d-3b49aa87429mr7359954f8f.55.1751908883136; 
 Mon, 07 Jul 2025 10:21:23 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454adc71a96sm138055735e9.24.2025.07.07.10.21.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Jul 2025 10:21:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH-for-10.1 v6 14/14] hw/arm: Add
 DEFINE_MACHINE_[ARM_]AARCH64() macros
Date: Mon,  7 Jul 2025 19:20:08 +0200
Message-ID: <20250707172009.3884-15-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707172009.3884-1-philmd@linaro.org>
References: <20250707172009.3884-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

A machine defined with the DEFINE_MACHINE_ARM_AARCH64() macro
will be available on qemu-system-arm and qemu-system-aarch64
binaries.

One defined with DEFINE_MACHINE_AARCH64() will only be available
in the qemu-system-aarch64 binary.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/machines-qom.h | 13 +++++++++++++
 target/arm/machine.c          | 12 ++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/hw/arm/machines-qom.h b/include/hw/arm/machines-qom.h
index a17225f5f92..b71a24ceb95 100644
--- a/include/hw/arm/machines-qom.h
+++ b/include/hw/arm/machines-qom.h
@@ -9,10 +9,23 @@
 #ifndef HW_ARM_MACHINES_QOM_H
 #define HW_ARM_MACHINES_QOM_H
 
+#include "hw/boards.h"
+
 #define TYPE_TARGET_ARM_MACHINE \
         "target-info-arm-machine"
 
 #define TYPE_TARGET_AARCH64_MACHINE \
         "target-info-aarch64-machine"
 
+extern const InterfaceInfo arm_aarch64_machine_interfaces[];
+extern const InterfaceInfo aarch64_machine_interfaces[];
+
+#define DEFINE_MACHINE_ARM_AARCH64(namestr, machine_initfn) \
+        DEFINE_MACHINE_WITH_INTERFACES(namestr, machine_initfn, \
+                                       arm_aarch64_machine_interfaces)
+
+#define DEFINE_MACHINE_AARCH64(namestr, machine_initfn) \
+        DEFINE_MACHINE_WITH_INTERFACES(namestr, machine_initfn, \
+                                       aarch64_machine_interfaces)
+
 #endif
diff --git a/target/arm/machine.c b/target/arm/machine.c
index e442d485241..61ad3b681c7 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -9,6 +9,7 @@
 #include "migration/qemu-file-types.h"
 #include "migration/vmstate.h"
 #include "target/arm/gtimer.h"
+#include "hw/arm/machines-qom.h"
 
 static bool vfp_needed(void *opaque)
 {
@@ -1102,3 +1103,14 @@ const VMStateDescription vmstate_arm_cpu = {
         NULL
     }
 };
+
+const InterfaceInfo arm_aarch64_machine_interfaces[] = {
+    { TYPE_TARGET_ARM_MACHINE },
+    { TYPE_TARGET_AARCH64_MACHINE },
+    { }
+};
+
+const InterfaceInfo aarch64_machine_interfaces[] = {
+    { TYPE_TARGET_AARCH64_MACHINE },
+    { }
+};
-- 
2.49.0


