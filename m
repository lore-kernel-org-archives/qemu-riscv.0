Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A0CCD6E4C
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 19:53:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wT3Fe-0002Qg-3K; Fri, 29 May 2026 15:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wT3Fa-000224-Td
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 15:52:10 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wT3FY-0005FQ-EU
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 15:52:10 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-45eeba68948so1476551f8f.1
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 12:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780084327; x=1780689127; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Je8q/HCAd0aP2wgv5J5zrln6ORTrwi01jkqwR3v8AHc=;
 b=beB6F2aXLhiQma7R/YJAHFVZIGBZuqmPSzClBr5IZMPEmsVGLh6/9Ua6vWD+6ipz/n
 x05nuTYKnoo0gOa5q61bReBEtzm0JggMcsKMTtCZt5S+iAu4Va7UTSe7c9oeI1LRXXy6
 l7pGRP2l41g+mdA6Y2XcJaWaBZogRlvG9Wqoq4BcRijlMxoESivyMV7SIMQN0Ig1meDx
 XpNGa5PSnTMJEbl35TA1hvuJ8iDsnvBa4QjnWyNdwUPfCL4mSkYbnw74ncozGeUJQhOb
 k9EgTUL6XbKkvcK093GliP80wOP8dHLFXDYQdRbD4T9qeZ1zVHUf7juhyADG/rFdKPlQ
 RuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780084327; x=1780689127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Je8q/HCAd0aP2wgv5J5zrln6ORTrwi01jkqwR3v8AHc=;
 b=lRCoaa+XD5x5j/GeIVIeGnOqCq1sMlHbNpSOFU8tIw1PDz6tijHGCpfgUuferlC0On
 Cd4T5byQ7aNmSx0VBWilTCAEcYfYcudHWrQGIgJ/NYCMG+UKK7tQvDSmiTHAAOJnxixL
 FvApn7S7iWIPHOnNBMJSepSyoEUfulnhOq1Vd8oV90vNgin/cnLdz6PBB3ZeC1zzUPVx
 pd4s344xYb9Ld3UmWJKuQtmwwRVgdv77osOL+OLTCEwPNzw7KorvzjerNcRrcvtIqrPu
 DbEAQDrfxrStAkHWu15/iXOv4gHrk/M+4vIebry1s3n9SEbNLtiBUr4aKKPStljnyy+J
 RFiw==
X-Forwarded-Encrypted: i=1;
 AFNElJ91W/lstidNIUrgFSq5iFLY0x/rDMEkg9XZuB7BTu2WvoB8g0zQWNKmwazOLY9Z5urY94UHEGeFeT/H@nongnu.org
X-Gm-Message-State: AOJu0YxyIWkWE8j4Kn0wU1kn6Zah0vYPzecIoBUsmnEsFw3LonFj3bqB
 ECqiSiobwIYja4NjBRtrtdsqROdL3FCC+GxcJIFGlHEjJ7RBVuKh28WmOdiyPcokoj8=
X-Gm-Gg: Acq92OH4FSZT2atGnm+7yr4zhTdHTRKgbOWKxObref3MCj+Rdkj5F2OYYdFQz4nFN4Q
 FfU0NfqcnzlK47WtgrJrU79jh+ZJ8iAxNGTdBB7HRHmKVF7a+lXvP8/zDmi49UaZAFawDlMs5dH
 yWtLd8UqXNJtLZBuapkqGrNYMIOrg1eOlowLISEESo7RR5InQ1iUJNH1m2FWoQGjZwj2TfJTZw/
 5SUbGno89x4LqnEDMDKh1XCWUXPGFov1TPgH/WMbLM9HQx2dA+oqJY0Y1VqcP/pHAu4C55VD/W1
 2b0ZdrO298oU6fQEAwdSVWZLi5o1cS7W+piLadrTv67VIB6p+EDj7egahPvjAj3Z0qF9vwocrbP
 yYA3UmX+uVX0CUQVtZleEtHj6jehCDH1z0hwUn4BSZR+LryHarzJfrT9EGW8LNiNOul6US4Yp7I
 EL+ZQeDKN62C+x5LYwjoclB4VsKYtdjjK5gWkQIaOmVF5QGBpAbfJZoZ/Gm151RaClDw==
X-Received: by 2002:adf:f089:0:b0:43d:77c6:be78 with SMTP id
 ffacd0b85a97d-45ef6ba1425mr1556824f8f.39.1780084326851; 
 Fri, 29 May 2026 12:52:06 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34bd896sm5336956f8f.14.2026.05.29.12.52.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 12:52:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>, Glenn Miles <milesg@linux.ibm.com>,
 kvm@vger.kernel.org, qemu-s390x@nongnu.org,
 Chao Liu <chao.liu.zevorn@gmail.com>, David Hildenbrand <david@kernel.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Song Gao <gaosong@loongson.cn>, Paolo Bonzini <pbonzini@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anton Johansson <anjo@rev.ng>, Claudio Fontana <cfontana@suse.de>,
 Eric Farman <farman@linux.ibm.com>, Alexander Graf <agraf@csgraf.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Cornelia Huck <cohuck@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Reinoud Zandijk <reinoud@netbsd.org>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 17/17] accel: Remove AccelCPUClass and
 'accel/accel-cpu-target.h'
Date: Fri, 29 May 2026 21:49:39 +0200
Message-ID: <20260529194940.97143-18-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529194940.97143-1-philmd@linaro.org>
References: <20260529194940.97143-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

AccelCPUClass is now an empty class. We removed all uses of
the TYPE_ACCEL_CPU definition. Remove as dead code, along with
register_accel_target_type().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 include/accel/accel-cpu-target.h | 31 -------------------------------
 include/accel/accel-cpu.h        | 19 -------------------
 accel/accel-common.c             | 16 ----------------
 3 files changed, 66 deletions(-)
 delete mode 100644 include/accel/accel-cpu-target.h
 delete mode 100644 include/accel/accel-cpu.h

diff --git a/include/accel/accel-cpu-target.h b/include/accel/accel-cpu-target.h
deleted file mode 100644
index 6feb344e29b..00000000000
--- a/include/accel/accel-cpu-target.h
+++ /dev/null
@@ -1,31 +0,0 @@
-/*
- * Accelerator interface, specializes CPUClass
- * This header is used only by target-specific code.
- *
- * Copyright 2021 SUSE LLC
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef ACCEL_CPU_TARGET_H
-#define ACCEL_CPU_TARGET_H
-
-/*
- * This header is used to define new accelerator-specific target-specific
- * accelerator cpu subclasses.
- * It uses CPU_RESOLVING_TYPE, so this is clearly target-specific.
- *
- * Do not try to use for any other purpose than the implementation of new
- * subclasses in target/, or the accel implementation itself in accel/
- */
-
-#include "qom/object.h"
-#include "accel/accel-cpu.h"
-#include "cpu.h"
-
-#define TYPE_ACCEL_CPU "accel-" CPU_RESOLVING_TYPE
-#define ACCEL_CPU_NAME(name) (name "-" TYPE_ACCEL_CPU)
-DECLARE_CLASS_CHECKERS(AccelCPUClass, ACCEL_CPU, TYPE_ACCEL_CPU)
-
-#endif /* ACCEL_CPU_H */
diff --git a/include/accel/accel-cpu.h b/include/accel/accel-cpu.h
deleted file mode 100644
index d7ea45ada2e..00000000000
--- a/include/accel/accel-cpu.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/*
- * Accelerator interface, specializes CPUClass
- *
- * Copyright 2021 SUSE LLC
- *
- * SPDX-License-Identifier: GPL-2.0-or-later
- */
-
-#ifndef ACCEL_CPU_H
-#define ACCEL_CPU_H
-
-#include "qom/object.h"
-#include "hw/core/cpu.h"
-
-typedef struct AccelCPUClass {
-    ObjectClass parent_class;
-} AccelCPUClass;
-
-#endif /* ACCEL_CPU_H */
diff --git a/accel/accel-common.c b/accel/accel-common.c
index d8ee6d62667..4fe15349012 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -11,7 +11,6 @@
 #include "qemu/accel.h"
 #include "qemu/target-info.h"
 #include "accel/accel-ops.h"
-#include "accel/accel-cpu.h"
 #include "accel/accel-cpu-ops.h"
 #include "accel-internal.h"
 
@@ -98,18 +97,3 @@ static const TypeInfo accel_types[] = {
 };
 
 DEFINE_TYPES(accel_types)
-
-static void register_accel_target_type(void)
-{
-    g_autofree char *name = g_strconcat("accel-", target_cpu_type(), NULL);
-    const TypeInfo accel_cpu_type = {
-        .name = name,
-        .parent = TYPE_OBJECT,
-        .abstract = true,
-        .class_size = sizeof(AccelCPUClass),
-    };
-
-    type_register_static(&accel_cpu_type);
-}
-
-type_init(register_accel_target_type);
-- 
2.53.0


