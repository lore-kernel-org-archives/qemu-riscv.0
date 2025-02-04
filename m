Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6A2C02194
	for <qemu-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 18:10:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tfNMY-0005jI-Tl; Tue, 04 Feb 2025 13:09:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNLb-0004Zu-P3
 for qemu-riscv@nongnu.org; Tue, 04 Feb 2025 13:08:31 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNLZ-0007FS-Fr
 for qemu-riscv@nongnu.org; Tue, 04 Feb 2025 13:08:31 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so41041885e9.1
 for <qemu-riscv@nongnu.org>; Tue, 04 Feb 2025 10:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738692508; x=1739297308; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4aC2ap/lG5aepYBxnBeqfmcNSow0ZaEbYXj6+8sjwn0=;
 b=YalsiWazPzHaJEKQguDuYf+1VU37Cqk8DEWkV0HFpnriQhZOAKRtQoUHZ5NWAEYgik
 KRtM7eISdhLrTdaruUSBTOp/biNcZFvLw4iT/BTC1PRr59esYo7L2l9PTaA56P42JA4n
 6VJLi2BzJVq/NAmdkZrEFhu415+uhVDkGjOv9NemOM6wP8b+r4Td4N41Xp8Fxkq/LA84
 5VGR+4J4RP+IagpserA+Ov+Hji4c9ziIq1SJ4R1B1A5fg6Nne52N8oqYwUCgvrFmh1t2
 JrbIYTMiLPWiFWKaHh/CHBIKdB7Wph21FXEiJzzBl54z5CJ9viK2c1Yl2t8x6cqXu147
 ddgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738692508; x=1739297308;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4aC2ap/lG5aepYBxnBeqfmcNSow0ZaEbYXj6+8sjwn0=;
 b=iTpsX7wR1M9TIUNT4WU7g4raxvrWxiRW7wmY+8epo28hDGCOYiCG5Z00Ki8gNJ1HnJ
 bLT/mICFmyXQMEXKgEWus6vz9b53MVuKuV7L0GIx9uOW8wwt21I8WJN5Xu6ocrecyUD+
 CPF0MUHbpDs8kuyZC8Wy/hgKLBi2JPl6tHgrQhtEQf6AoPwej7IuYibzZQQh8NanJIhh
 tLvGeAbm2M0Vyt8gWfyGcsxDTS75QHWJumnOu434DIcCeBLMpqoEY5qXPo6rhh//dZga
 RcV1uyvSBHheoSU90RQ67U5uewBbBjCAvMx3TTA5N/DfpIMzCwDAFeKyhkUX9DQjMFVM
 GdjQ==
X-Gm-Message-State: AOJu0YzfBmepgLC3TrDQlaMA5nGGZPQ45EtFwS/kXNn1HI57zSdGwa5a
 WhQV/boKJthzInZh2oR+N7pIohuPaxEV2w/BwXmWqB66Ag5bU3HvLnl39Pp5N94=
X-Gm-Gg: ASbGncuZlv3UkkTVDflzAqnTCu9dUk7dKG+6gkyHuvS6lgQcRjvnFe3XQaQlP9OUEh9
 8x8QC/jH6ojl9clKnfpYrj4Uzm0N+9cys2MvEST8rJPjffmHoRs7NXcn/KubRjGMtYw0l54dYyq
 zM8+J6AmKmO9wkvPFWwqrPJWvV9HPeW2rTIGS7pSBz2lIGzGRBOZwqDfMIEK5REBlK9CQg9WI8b
 e7ExHj/5okRq/HMBZqygQYJW5oAcN/l/n5MnKQr8fCxVQkSpCL6I1c6Jp37NvYGVrc3SPd9l95S
 JDM3cbDUGn7JEqK/a7Z6uIMXFvFd9gcM+9ThYFoO2ugA7L8wjwJ66i4S2JiOkGM30A==
X-Google-Smtp-Source: AGHT+IGSSRo+93ud+qI6YIkvsWbP3QtJan5pjeoM9kvovDZYShsaOxEUV+3OZmMPR1ahwrd78XGuzQ==
X-Received: by 2002:a05:600c:3d05:b0:434:a802:e99a with SMTP id
 5b1f17b1804b1-438dc3ab389mr215605415e9.4.1738692507800; 
 Tue, 04 Feb 2025 10:08:27 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23d42d4sm203332745e9.6.2025.02.04.10.08.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 04 Feb 2025 10:08:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 8/8] hw/boards: Ensure machine setting auto_create_sdcard
 expose a SD Bus
Date: Tue,  4 Feb 2025 19:07:46 +0100
Message-ID: <20250204180746.58357-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204180746.58357-1-philmd@linaro.org>
References: <20250204180746.58357-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

Using the auto_create_sdcard feature without SD Bus is irrelevant.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 system/vl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/system/vl.c b/system/vl.c
index 5ff461ea4ca..dd8053e1e79 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -53,6 +53,7 @@
 #include "hw/usb.h"
 #include "hw/isa/isa.h"
 #include "hw/scsi/scsi.h"
+#include "hw/sd/sd.h"
 #include "hw/display/vga.h"
 #include "hw/firmware/smbios.h"
 #include "hw/acpi/acpi.h"
@@ -2661,12 +2662,19 @@ static void qemu_init_displays(void)
 
 static void qemu_init_board(void)
 {
+    MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
+
     /* process plugin before CPUs are created, but once -smp has been parsed */
     qemu_plugin_load_list(&plugin_list, &error_fatal);
 
     /* From here on we enter MACHINE_PHASE_INITIALIZED.  */
     machine_run_board_init(current_machine, mem_path, &error_fatal);
 
+    if (machine_class->auto_create_sdcard) {
+        /* Ensure there is a SD bus available to create SD card on */
+        assert(object_resolve_path_type("", TYPE_SD_BUS, NULL));
+    }
+
     drive_check_orphaned();
 
     realtime_init();
-- 
2.47.1


