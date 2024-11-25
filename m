Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1957DD58D79
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Nov 2024 18:16:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tFdbW-000195-Q8; Mon, 25 Nov 2024 13:14:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFdbV-00018m-9H
 for qemu-riscv@nongnu.org; Mon, 25 Nov 2024 13:14:33 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFdbT-0005CA-Jk
 for qemu-riscv@nongnu.org; Mon, 25 Nov 2024 13:14:33 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3823e45339bso3552903f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 25 Nov 2024 10:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732558470; x=1733163270; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MKiSAmW0YTZOm2et5NElSEWiWu4k/YmN4d8Ua0BroHo=;
 b=TizCsPU5vEAWkVR1OpR28FRSDPbYNGOkm8kuhsygy4+5uCpHxbUQW4fM+MwV8azUUQ
 vpzf0uDKmVNEr4l4r3R6SOUP2n+PV9LeZtPzhRTNP8leuhF4BucjJwIHy1sv7Oy1+Ctm
 7ke6V6dMvlxNKmdAq9iYxeG8Fklh7MjUsoKj/Fn55Tkdfc/mPkXjbWU6KMKkB66giE8k
 ZTGqGGXgeTLuQp/0RafdQWYRfskkI/2ma5bbCARCSe3bVc2/9zcv3UT5JgHOCW7InhdS
 QVqjSogQBr4iCOwLXYl7eHmB4qNVg71x5J6TF7LXUMDUMJzkXLhHyF/wbEKBqrKkgms3
 W2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732558470; x=1733163270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MKiSAmW0YTZOm2et5NElSEWiWu4k/YmN4d8Ua0BroHo=;
 b=R8atp7ne9KAYDO6gsDZ5TuaRDIq/nQ6Ee9FdlypnrL/OOyESdu7TO7ROQY/Hq0uNB1
 ePPevPyDWQhZxktCdhbJNvymOeSoEKSwy7y95l8us9rISO1CokKnpNZgEnlN0F+ibS+C
 +VU5aMsmFDJZfT1LsfKadE2spqDtv8/XFdRnKpUenESqffkIpuhK6ZPpPNwKkm+T0BHp
 TFh9j7DMC1+DpwvHdsTila4eN3uX9Z66+/eedAz3cqYM6B6aZly9MdMgczbuLiHncgS5
 gfpaA2UV+8UR+jN7Hc7+zAhyG8iv7d4dm+MLZ6X54HIZC5wAXbZIrdCU2pnFHj4iNHr1
 +X8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkGd2U1tQdlzcYOIL8BM7PB9OxbRb17pIOFdqAS/U4x9vHuAKIziT0iQWnXhOFnvdbnzHs0Bw7DIo2@nongnu.org
X-Gm-Message-State: AOJu0YxuvWG3F+64VDIp88QxQaDwtE+/rKlRRpKv45dWsxVUvBrS+R0Y
 zaTiN4osGl4L/Uy6uf5a4UxBPKk2nCd+U3RVMHSBm1Ttz6ryrJxL5ZxbiaEkelA=
X-Gm-Gg: ASbGncvg84NeVyODLiRjUNokeRj02kbUH7tPqUd8Vi1xMR2q3qk1k0tmufvz8HC5O+Z
 x7atFgf6V20Luzs0fNG0hf2Jn0YXKj8uZwYVnm8buHZMzRHFuWz6QD0swS2irOV5skToAG+khYK
 XUBj9DHb9twR48awpRJdzoksLJXd+/eB+fkcKL2Ri7+QhB6VNavHmos1QCyMwL9p8mXFxSz7bIG
 S2A4dXYvoBs8pXf74R05Bjc1+TKWKXuH75wgYGqMwy9dFuP/6TUW0WBHKJfOgZSMCwaEkh5
X-Google-Smtp-Source: AGHT+IFM0gSZqEMpVDD1uZtS66lPh3LCuQsv20JxGOIuVaDeweiqVcNsQtSVTGBjwpN96APWXvP5aQ==
X-Received: by 2002:a05:6000:2d0b:b0:37d:5141:ee91 with SMTP id
 ffacd0b85a97d-38260b5e278mr7949691f8f.18.1732558469949; 
 Mon, 25 Nov 2024 10:14:29 -0800 (PST)
Received: from localhost.localdomain ([176.176.170.239])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fb2760asm11040421f8f.52.2024.11.25.10.14.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Nov 2024 10:14:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 1/3] hw/boards: Convert no_sdcard flag to OnOffAuto
 tri-state
Date: Mon, 25 Nov 2024 19:14:18 +0100
Message-ID: <20241125181420.24424-2-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241125181420.24424-1-philmd@linaro.org>
References: <20241125181420.24424-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

MachineClass::no_sdcard is initialized as false by default.
To catch all uses, convert it to a tri-state, having the
current default (false) becoming AUTO.

No logical change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/boards.h        | 2 +-
 hw/arm/xilinx_zynq.c       | 2 +-
 hw/core/null-machine.c     | 2 +-
 hw/s390x/s390-virtio-ccw.c | 2 +-
 system/vl.c                | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 36fbb9b59d..86fcf9c81f 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -283,9 +283,9 @@ struct MachineClass {
         no_parallel:1,
         no_floppy:1,
         no_cdrom:1,
-        no_sdcard:1,
         pci_allow_0_address:1,
         legacy_fw_cfg_order:1;
+    OnOffAuto no_sdcard;
     bool is_default;
     const char *default_machine_opts;
     const char *default_boot_order;
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index fde4d946b7..76bab2499f 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -463,7 +463,7 @@ static void zynq_machine_class_init(ObjectClass *oc, void *data)
     mc->desc = "Xilinx Zynq Platform Baseboard for Cortex-A9";
     mc->init = zynq_init;
     mc->max_cpus = ZYNQ_MAX_CPUS;
-    mc->no_sdcard = 1;
+    mc->no_sdcard = ON_OFF_AUTO_ON;
     mc->ignore_memory_transaction_failures = true;
     mc->valid_cpu_types = valid_cpu_types;
     mc->default_ram_id = "zynq.ext_ram";
diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
index f586a4bef5..b93056c0f7 100644
--- a/hw/core/null-machine.c
+++ b/hw/core/null-machine.c
@@ -53,7 +53,7 @@ static void machine_none_machine_init(MachineClass *mc)
     mc->no_parallel = 1;
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
-    mc->no_sdcard = 1;
+    mc->no_sdcard = ON_OFF_AUTO_ON;
 }
 
 DEFINE_MACHINE("none", machine_none_machine_init)
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index fe03f716f3..8b40b87899 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -747,7 +747,7 @@ static void ccw_machine_class_init(ObjectClass *oc, void *data)
     mc->no_cdrom = 1;
     mc->no_floppy = 1;
     mc->no_parallel = 1;
-    mc->no_sdcard = 1;
+    mc->no_sdcard = ON_OFF_AUTO_ON;
     mc->max_cpus = S390_MAX_CPUS;
     mc->has_hotpluggable_cpus = true;
     mc->smp_props.books_supported = true;
diff --git a/system/vl.c b/system/vl.c
index 3bb8f2db9a..4a7c29a8ab 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -1350,7 +1350,7 @@ static void qemu_disable_default_devices(void)
     if (!has_defaults || machine_class->no_cdrom) {
         default_cdrom = 0;
     }
-    if (!has_defaults || machine_class->no_sdcard) {
+    if (!has_defaults || machine_class->no_sdcard == ON_OFF_AUTO_ON) {
         default_sdcard = 0;
     }
     if (!has_defaults) {
-- 
2.45.2


