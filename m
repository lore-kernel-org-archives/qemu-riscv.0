Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D032C83F12
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:17:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhLO-0008Aj-Ks; Thu, 31 Aug 2023 09:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhHX-0005tC-IC
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:00:22 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhHS-0006YB-Rb
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:00:18 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-31c8a710545so639365f8f.3
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 06:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486813; x=1694091613; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VP+M0BihzQYUg4SRwLkLGrk4ZyudSjdzOazRzuk1iZE=;
 b=i5Bpdoze4npJm6QxlKHqPZMz8I8wpJWrzHE5mIO849R+8GK+gDeAlSNm5kZKbclavb
 5wR+gpTDRQLaEa9F7XJ0szqiSs+KOfjyAk3+rzqfcKMAE8KN1g46r7KSS32G6cOtAtOp
 CYgMyJ/nB+TzuSgqd5QXCgvVfIHsXZnubzaFiWym1EORm7Pn0nOKMUohT0Rmb4yFcVPy
 fASkFQPmuFLUBNgD+xqOkheExo27hk4NQBqPlUyeh3MYBuhBXjwZ7i1LPOW2Fv/oHlXD
 ymdb3g0JH0tFrYOQV1KpVlBYoGxq6DhMZJA6y+o3wQU82MfDzuqGlZZxUv4GmWCA9X1s
 2cyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486813; x=1694091613;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VP+M0BihzQYUg4SRwLkLGrk4ZyudSjdzOazRzuk1iZE=;
 b=ZOUG4aGwAYBc5NrrryPlzBOMkUL13hDOBoFAG/4eLkzfO+tHGBMsg6cDwDHoOZ8jJA
 Qf53KAmVOu9VxzPZu+2z4UMYSf5/+Qgm4Brx4QLhWXMX/CJYjqXMZYEqfdyqwg+2kXAD
 W3qm8AqUzt8Is0ZvfpzXexdWbqrnwEGphmZ0Oj7bLkzQqclJc0mxkR6wxt8ie/QJGEAz
 Clm+4erZPcq5L1oSxkXRuz/dez1ykdFrLuE1uUYzyzJ/XbpxK1YLHHWN39E9qQCyQKLs
 rMS5qdI4fm53bmUmW/3v/SMOsLqG7Q8Hc3/vDvvI56HyP5W6KQ+XNy1sLWTTlZc65yxN
 tAPg==
X-Gm-Message-State: AOJu0YxtPj1sEbEKhBynbYprS55rqeNZsSojSOkKkWulkvL5qoUFNsfI
 ch/Pn0eRsiQ59wrhXASIapME1A==
X-Google-Smtp-Source: AGHT+IFkLUG8FoqYQGLxIWmAujQUC1t2HyWpTmJZPehMql7lR3V8T4TK2NlQ8qw0KI6hEXg35E48Zw==
X-Received: by 2002:a5d:6888:0:b0:319:854f:7b02 with SMTP id
 h8-20020a5d6888000000b00319854f7b02mr4148884wru.51.1693486813078; 
 Thu, 31 Aug 2023 06:00:13 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 s16-20020adfecd0000000b0030ada01ca78sm2179819wro.10.2023.08.31.06.00.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 06:00:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>
Subject: [PULL 34/41] hw/i386: Rename 'hw/kvm/clock.h' -> 'hw/i386/kvm/clock.h'
Date: Thu, 31 Aug 2023 14:56:36 +0200
Message-ID: <20230831125646.67855-35-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

kvmclock_create() is only implemented in hw/i386/kvm/clock.h.
Restrict the "hw/kvm/clock.h" header to i386 by moving it to
hw/i386/.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230620083228.88796-3-philmd@linaro.org>
---
 {include/hw => hw/i386}/kvm/clock.h | 4 ++--
 hw/i386/kvm/clock.c                 | 2 +-
 hw/i386/microvm.c                   | 2 +-
 hw/i386/pc_piix.c                   | 2 +-
 hw/i386/pc_q35.c                    | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)
 rename {include/hw => hw/i386}/kvm/clock.h (85%)

diff --git a/include/hw/kvm/clock.h b/hw/i386/kvm/clock.h
similarity index 85%
rename from include/hw/kvm/clock.h
rename to hw/i386/kvm/clock.h
index 3efe0a871c..401c7e445b 100644
--- a/include/hw/kvm/clock.h
+++ b/hw/i386/kvm/clock.h
@@ -10,8 +10,8 @@
  * See the COPYING file in the top-level directory.
  */
 
-#ifndef HW_KVM_CLOCK_H
-#define HW_KVM_CLOCK_H
+#ifndef HW_I386_KVM_CLOCK_H
+#define HW_I386_KVM_CLOCK_H
 
 void kvmclock_create(bool create_always);
 
diff --git a/hw/i386/kvm/clock.c b/hw/i386/kvm/clock.c
index 0824c6d313..34348a3324 100644
--- a/hw/i386/kvm/clock.c
+++ b/hw/i386/kvm/clock.c
@@ -22,7 +22,7 @@
 #include "kvm/kvm_i386.h"
 #include "migration/vmstate.h"
 #include "hw/sysbus.h"
-#include "hw/kvm/clock.h"
+#include "hw/i386/kvm/clock.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 6b762bc18e..8deeb62774 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -32,7 +32,7 @@
 
 #include "hw/loader.h"
 #include "hw/irq.h"
-#include "hw/kvm/clock.h"
+#include "hw/i386/kvm/clock.h"
 #include "hw/i386/microvm.h"
 #include "hw/i386/x86.h"
 #include "target/i386/cpu.h"
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 3de8e0d741..5cbad6ad84 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -46,7 +46,7 @@
 #include "hw/ide/piix.h"
 #include "hw/irq.h"
 #include "sysemu/kvm.h"
-#include "hw/kvm/clock.h"
+#include "hw/i386/kvm/clock.h"
 #include "hw/sysbus.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "exec/memory.h"
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index a95c5d046e..0bd68690f5 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -35,7 +35,7 @@
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "sysemu/kvm.h"
-#include "hw/kvm/clock.h"
+#include "hw/i386/kvm/clock.h"
 #include "hw/pci-host/q35.h"
 #include "hw/pci/pcie_port.h"
 #include "hw/qdev-properties.h"
-- 
2.41.0


