Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EADC02194
	for <qemu-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 18:11:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tfNLC-0004Lf-0H; Tue, 04 Feb 2025 13:08:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNL2-0004Io-Rb
 for qemu-riscv@nongnu.org; Tue, 04 Feb 2025 13:07:57 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNL0-00078X-Ua
 for qemu-riscv@nongnu.org; Tue, 04 Feb 2025 13:07:56 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-38633b5dbcfso6332944f8f.2
 for <qemu-riscv@nongnu.org>; Tue, 04 Feb 2025 10:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738692473; x=1739297273; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BrfjnJSg9CX0l2LnyeLtW/bJrqIZsHOwQ9P6gpzmndY=;
 b=P2uA0u+8gWRX/oPFEDrpcFV80nG1++BjwvtUFTEq14oz4bG4BUlSld580WrxXNWAFB
 CMHoN/nMiyV0zxVkutCGL6Jpp+AVwJSMiiFdkPC3otwdrhaenyHznlRL/h4JboIu2TnY
 oIOiIvVUmQtRZuMhEw81ez151ngqokHDXhchS/dksjngAgnITTckVnbVYqvdNer+Hmps
 KnXl3qOSPlrNv0omX2s6jMHSr+R8ChJPdBFEES5LPewasySpHzGswGghPevlg27ULOXe
 yGiuNMHXyWA4IzqlkrYDWLhGYLP5lcjWFWvtGW/BROymx/Q7td7Srm2E3B0fdtfCc7jf
 9oqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738692473; x=1739297273;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BrfjnJSg9CX0l2LnyeLtW/bJrqIZsHOwQ9P6gpzmndY=;
 b=N2izb/fHPyWh/cDaE99b2PpI40P/h86vGJiqRqZSDxD7rWErQtgcoWi5m7MxGPrAV4
 gBFsL4+PyntZm0ZCQJ5LSqgyqpOkk1JfZ/0W0zJLqiN+H+IfmKYaavWOWLZma90V3RXc
 Q37uvsivhZ1987DFP9WHRqLsFf92xWP542naUXPfn7jPkptQob2Z0AgAKzHpMnRPwUZE
 Z+sHNAXPquxXbO0zh1aGqYE3v3OGTTrb017XfH+7+xHPeBkzdEuvJE2CUgbv93yt6NVR
 W+zbDW0E0z714Psn+7LtJlfbN4KWHlUS2eWsglFv1FyC9AlO3j8DrpJuxBnX0Rexr2ML
 Ih1g==
X-Gm-Message-State: AOJu0YzrOTiq7H+5hLzB/WT4g36J/QJeSTelkI9Hoag7SU0WJxTOABFk
 SCM3WrqmOC2YjFfu3+OYIFfCPlBGyexrTpo9g4f+yxknL2F+b45wi/KLROK8qfc=
X-Gm-Gg: ASbGnctNYK38nLD3KvYVUHA7bZJH4cv0JpL2PN6tIANadB4ONIahLgma/PX5wVU3xex
 mxk9calq47MKpXoD5hllZhVgqRy7LVvhmJR9GUv/PouOT6FPJUkImtM/sXZfMFdWUG2jOHk6Gen
 hzImn1w+5Jox9QOn7Tz1L8PK2CVknhDWodHiFgjG7rhLqrqYauwJT05RbcwBDzsliTcTAiaIBxX
 LGSiGSYgxU2Z6vlT22M9m/+FFJUxUQKANvJF8OpVy1Puzb5K+eeTO4F5QO/zw1QijpQL5cT4ilt
 nabimr6bB7wBP1oS6d2VTFFEZzXzfInUogNJDEtUGazHnIzIV3QWlDwSimrRkJYfAg==
X-Google-Smtp-Source: AGHT+IHaMX7mmU9E7UEgI1vWWgAXf6q0ok6gWpVqC2bryTYzi8x5sMqE2tVEuCFmDrouXMZVf8D4UQ==
X-Received: by 2002:a05:6000:1faa:b0:385:fb8d:865b with SMTP id
 ffacd0b85a97d-38c520a344emr28306088f8f.48.1738692473369; 
 Tue, 04 Feb 2025 10:07:53 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc80e61sm236364185e9.34.2025.02.04.10.07.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 04 Feb 2025 10:07:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/8] hw/boards: Convert no_sdcard flag to OnOffAuto
 tri-state
Date: Tue,  4 Feb 2025 19:07:39 +0100
Message-ID: <20250204180746.58357-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204180746.58357-1-philmd@linaro.org>
References: <20250204180746.58357-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

MachineClass::no_sdcard is initialized as false by default.
To catch all uses, convert it to a tri-state, having the
current default (false) becoming AUTO.

No logical change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/boards.h        | 2 +-
 hw/arm/xilinx_zynq.c       | 2 +-
 hw/core/null-machine.c     | 2 +-
 hw/s390x/s390-virtio-ccw.c | 2 +-
 system/vl.c                | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index e1f41b2a533..d61b0a47780 100644
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
index 8477b828745..12418094f9d 100644
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
index f586a4bef54..b93056c0f7b 100644
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
index d9e683c5b49..5f78c8d20ff 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -817,7 +817,7 @@ static void ccw_machine_class_init(ObjectClass *oc, void *data)
     mc->no_cdrom = 1;
     mc->no_floppy = 1;
     mc->no_parallel = 1;
-    mc->no_sdcard = 1;
+    mc->no_sdcard = ON_OFF_AUTO_ON;
     mc->max_cpus = S390_MAX_CPUS;
     mc->has_hotpluggable_cpus = true;
     mc->smp_props.books_supported = true;
diff --git a/system/vl.c b/system/vl.c
index db8e604ebab..2940c865b19 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -1346,7 +1346,7 @@ static void qemu_disable_default_devices(void)
     if (!has_defaults || machine_class->no_cdrom) {
         default_cdrom = 0;
     }
-    if (!has_defaults || machine_class->no_sdcard) {
+    if (!has_defaults || machine_class->no_sdcard == ON_OFF_AUTO_ON) {
         default_sdcard = 0;
     }
     if (!has_defaults) {
-- 
2.47.1


