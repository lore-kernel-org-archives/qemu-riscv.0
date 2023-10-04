Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB3BE8FDDD
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 09:10:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qnxrZ-0003Go-OS; Wed, 04 Oct 2023 05:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnxqe-0001EH-32
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 05:07:16 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnxqY-0007SV-2c
 for qemu-riscv@nongnu.org; Wed, 04 Oct 2023 05:07:15 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3248aa5cf4eso1894771f8f.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Oct 2023 02:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696410428; x=1697015228; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/E8WljXb+dDaNTYEUBfTBEFw2aj3lZYVZ/YWdMp3Hys=;
 b=cONNgvStFEjGijh9ABjrMYWXp4zjMS3k30ojXbmd4kG2rdJBCsRuHL1+JyLnwveUq0
 fJxwPjv4OQt1d7xzfq+SaJxUoJ4JOzN8x4dkElgQJiLEI32SlhYm4HylS1/zifK8bkkv
 5l/x4kHKhSa95LAFO3zz8V0r74WWBzWC5fa0uhhk0dBhADm+5HU5oT/MOsyIZpxBSxrD
 ALmPQLrHTGpQ/aomNlSZ9cb1DFGOhPMOT7bkv7lAHM6PCWl4rqP299Ufij10gHmYnDXU
 3MojyYsOZyKgXb8MJyx3cC/q3rAklys85y38Pu2NAtuggDiYpLjmfDljudPTLQr4ElFt
 mtnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696410428; x=1697015228;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/E8WljXb+dDaNTYEUBfTBEFw2aj3lZYVZ/YWdMp3Hys=;
 b=xI/QwkE2RWUVhyJ2b4DC03y14V5pWo34AzJngcprirJqcu79S3VK+l+3WUB4d40pKv
 Eas2e1CNqXJ4eYWmj/94qA1aM7r4DV079ntQ+r/d3pSUsYS5p6VYER2BuraJb8piu6Jy
 s3aym4NwH6IXw2XIXEBJ6AZLWfEVhou8aWuqiXpT8iBPbozbqahha6K057Ob5/d2U5hN
 f+hZsm4UwviXv8cJrGqo279mfa9cmxb8+/ODJ2nBu6CNzDl3qLzM4Ul4v7GvcBe+IjME
 +vRdyQ3RSHn1nJY/FyVDQVl2ICfBs2Ry+mm7VtEswM3NUaEN+cIapaOU187BJXbgkBpY
 5UEA==
X-Gm-Message-State: AOJu0YxjmVdXPrHPL6o7L1z3lG8rOJK9MxlTgMwMj7OK2RabAyk5axpk
 8+3wHP21Y5V/W1zONfY+jEfPYg==
X-Google-Smtp-Source: AGHT+IHx2XeN96X93ayV/KWEfDkURKGP4gwBvQEmk+UrJqfdFcfhp3IB+e/mosfJGIr3obZspQIMlA==
X-Received: by 2002:adf:f084:0:b0:314:a3f:9c08 with SMTP id
 n4-20020adff084000000b003140a3f9c08mr1466397wro.39.1696410428108; 
 Wed, 04 Oct 2023 02:07:08 -0700 (PDT)
Received: from m1x-phil.lan (5ep85-h01-176-173-163-52.dslam.bbox.fr.
 [176.173.163.52]) by smtp.gmail.com with ESMTPSA id
 k13-20020a5d628d000000b0031f34a395e7sm3505666wru.45.2023.10.04.02.07.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 02:07:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 06/13] accel: Rename accel_softmmu* -> accel_system*
Date: Wed,  4 Oct 2023 11:06:21 +0200
Message-ID: <20231004090629.37473-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004090629.37473-1-philmd@linaro.org>
References: <20231004090629.37473-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Rename accel.softmmu -> accel.system in file paths
and the register_types() method.

Rename sysemu_stubs_ss -> system_stubs_ss in meson
following the pattern used on other source set names.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/{accel-softmmu.h => accel-system.h} |  6 +++---
 accel/accel-common.c                      |  2 +-
 accel/{accel-softmmu.c => accel-system.c} |  6 +++---
 accel/meson.build                         |  2 +-
 accel/stubs/meson.build                   | 10 +++++-----
 5 files changed, 13 insertions(+), 13 deletions(-)
 rename accel/{accel-softmmu.h => accel-system.h} (77%)
 rename accel/{accel-softmmu.c => accel-system.c} (96%)

diff --git a/accel/accel-softmmu.h b/accel/accel-system.h
similarity index 77%
rename from accel/accel-softmmu.h
rename to accel/accel-system.h
index 5e192f1882..d41c62f21b 100644
--- a/accel/accel-softmmu.h
+++ b/accel/accel-system.h
@@ -7,9 +7,9 @@
  * See the COPYING file in the top-level directory.
  */
 
-#ifndef ACCEL_SOFTMMU_H
-#define ACCEL_SOFTMMU_H
+#ifndef ACCEL_SYSTEM_H
+#define ACCEL_SYSTEM_H
 
 void accel_init_ops_interfaces(AccelClass *ac);
 
-#endif /* ACCEL_SOFTMMU_H */
+#endif /* ACCEL_SYSTEM_H */
diff --git a/accel/accel-common.c b/accel/accel-common.c
index df72cc989a..965318daa3 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -30,7 +30,7 @@
 #include "hw/core/accel-cpu.h"
 
 #ifndef CONFIG_USER_ONLY
-#include "accel-softmmu.h"
+#include "accel-system.h"
 #endif /* !CONFIG_USER_ONLY */
 
 static const TypeInfo accel_type = {
diff --git a/accel/accel-softmmu.c b/accel/accel-system.c
similarity index 96%
rename from accel/accel-softmmu.c
rename to accel/accel-system.c
index 9c804ba9e3..fa8f43757c 100644
--- a/accel/accel-softmmu.c
+++ b/accel/accel-system.c
@@ -28,7 +28,7 @@
 #include "hw/boards.h"
 #include "sysemu/cpus.h"
 #include "qemu/error-report.h"
-#include "accel-softmmu.h"
+#include "accel-system.h"
 
 int accel_init_machine(AccelState *accel, MachineState *ms)
 {
@@ -99,8 +99,8 @@ static const TypeInfo accel_ops_type_info = {
     .class_size = sizeof(AccelOpsClass),
 };
 
-static void accel_softmmu_register_types(void)
+static void accel_system_register_types(void)
 {
     type_register_static(&accel_ops_type_info);
 }
-type_init(accel_softmmu_register_types);
+type_init(accel_system_register_types);
diff --git a/accel/meson.build b/accel/meson.build
index 638a9a03ba..3376810921 100644
--- a/accel/meson.build
+++ b/accel/meson.build
@@ -1,5 +1,5 @@
 specific_ss.add(files('accel-common.c', 'accel-blocker.c'))
-system_ss.add(files('accel-softmmu.c'))
+system_ss.add(files('accel-system.c'))
 user_ss.add(files('accel-user.c'))
 
 subdir('tcg')
diff --git a/accel/stubs/meson.build b/accel/stubs/meson.build
index 6b0f200efe..91a2d21925 100644
--- a/accel/stubs/meson.build
+++ b/accel/stubs/meson.build
@@ -1,6 +1,6 @@
-sysemu_stubs_ss = ss.source_set()
-sysemu_stubs_ss.add(when: 'CONFIG_XEN', if_false: files('xen-stub.c'))
-sysemu_stubs_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
-sysemu_stubs_ss.add(when: 'CONFIG_TCG', if_false: files('tcg-stub.c'))
+system_stubs_ss = ss.source_set()
+system_stubs_ss.add(when: 'CONFIG_XEN', if_false: files('xen-stub.c'))
+system_stubs_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
+system_stubs_ss.add(when: 'CONFIG_TCG', if_false: files('tcg-stub.c'))
 
-specific_ss.add_all(when: ['CONFIG_SYSTEM_ONLY'], if_true: sysemu_stubs_ss)
+specific_ss.add_all(when: ['CONFIG_SYSTEM_ONLY'], if_true: system_stubs_ss)
-- 
2.41.0


