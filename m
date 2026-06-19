Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EBCCD98F8
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jun 2026 04:52:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1waRAX-0008Om-GD; Fri, 19 Jun 2026 00:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1waRAF-0008LU-4i
 for qemu-riscv@nongnu.org; Fri, 19 Jun 2026 00:49:13 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1waRAB-0005GD-Ez
 for qemu-riscv@nongnu.org; Fri, 19 Jun 2026 00:49:08 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-84531988438so1263742b3a.0
 for <qemu-riscv@nongnu.org>; Thu, 18 Jun 2026 21:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781844545; x=1782449345; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WsWbPE3Bt2Gd8XbRXKbewV3tBI1M4bc8RRw0T8jY90g=;
 b=O0EtpxNlhvmyI9WuvjAENATHQe6OwzFtJ0Ewiu/XVV8ly5O28YdS2iIem+GxQlCnRw
 ZwdYyrndskMvP0L520yUSbDIclX8n6FPjapbLtmXxPcHEQYQvxQSsYKjMBWo41xf52og
 J7PfRfPDUKlWdjaMa2v0lJAlCcWE7TrylN1u3VCvxi9gPiaQq2F5R2TGKkd7rYIR2HXP
 Zrcu7VYxfAxW+LD4Urm0Wk6ZxZ+OPG9czsmJjRuoicOyiYvt1bEiomDf94AZPXtwNIE3
 CZR94KfQif6ZkqK2uJ8UFeWe5jCvRSgsKDyHXlYgVjxOTaijiwiv5q1+cfHJrMpvd5Pj
 2/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781844545; x=1782449345;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WsWbPE3Bt2Gd8XbRXKbewV3tBI1M4bc8RRw0T8jY90g=;
 b=RBtlhsCJcAbL4SKeT1mWBuU9S2C1pm+TfU5gGwdrniClT7YvEMwCTEBGPPe2++rGe4
 mzVf//RzrdfJJlTrw6lvWR1f3WplkQ9qOpXJbN9Gvv2FOXhV/ojUzNNejuSfpaA7SQYN
 OWFyHwzdR+cSbX3RHQSvR+DZPNdpmuXWc8n6fdg11RQwuO6VD4ka+0FxA25uSY34JRjL
 W+8Nsc4IEHK8AwhmMnFLWPOSE/LV6kbpBOgSjbpolM7b5s65/rs4ObLgy+ktgcUJP8Op
 x7S0M59YzYf4VHGvBY4T9eCvLBS8H0eRx/eVXkqVaBIJvXtuaaOPBe5XXkHerHyHZk60
 Lk5A==
X-Forwarded-Encrypted: i=1;
 AFNElJ9wCraQND7UsIPXAgQhUzH1XVWNTPT6ykrTVpZPm+IbLrrBP5Dt1YNX9bpCE+rkFmY0WxSy1EX6t3HE@nongnu.org
X-Gm-Message-State: AOJu0YxZfLcYriwbicf5hqUpbbOgplZ/+V8mKUIqc9qh6qLd4Cq3qyhQ
 VSjwU7jf+pI9cdAlrZl0nxg7eIfJbjg6zT5vkBMqZ1nsffw2EXecomEo
X-Gm-Gg: AfdE7clQoiwQnU0b6O5YrcSMRSi1xVDeBffhk9FOsI2OzGbNhoVLq9T5NV6dZXb5qMl
 ZVUbNgTBqjJdB4E0HV9h5yVfAaBQfJE/8iN9IFuUUQ6GZrdJZWaWf1kD8XyhGnOQAvSzqjLoSw1
 ElPictY8jCJ7QhfEx5XL/BkUF4xjrcEkyCi/DdPvatmMYBo9nrw6IbFBY5I2TP0+ReFyBeq6ieM
 aTJBd3jPVUdrg87Vhxxt3sb+czKXZAnMVWl4JXM/IKNZJAljpRBuzrX2GWByTatgmNBXcs0kXVI
 AFk40j5aJFaRdWcFyDUHeernCRlxI00XA5hkByrxNPnbGy6aVFWbjo4JGJUh7VkIau8O3pVhqhg
 n9i+W9iLErpsrnADVVKBj+uSTlN1a5vLnXlRPNIk4LCithidMpoQ1t+gQUH6FlFKqU7IHE+aq5o
 GkA48OR5dJsP3O3vmbjb1smgIFkwG/rUiL/bTAKOo+O0zy9tpYiEINB8aBxFFeHfKnac3kps2Z3
 DK0uRNhLb5c/hCLKeCAkLWc5fLSxM/Zs7QSddav8A==
X-Received: by 2002:a05:6a00:2d82:b0:842:4982:825 with SMTP id
 d2e1a72fcca58-8455011462fmr1665478b3a.1.1781844544350; 
 Thu, 18 Jun 2026 21:49:04 -0700 (PDT)
Received: from donnager-debian.. ([144.6.172.18])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8455363da44sm870141b3a.8.2026.06.18.21.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2026 21:49:03 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Chris Rauer <crauer@google.com>, Alano Song <alanosong@163.com>,
 Michael Ellerman <mpe@kernel.org>, Joel Stanley <jms@oss.tenstorrent.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org
Subject: [PATCH v9 01/12] hw/riscv/boot: Describe discontiguous memory in
 boot_info
Date: Fri, 19 Jun 2026 14:18:25 +0930
Message-ID: <20260619044838.1054677-2-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619044838.1054677-1-joel@jms.id.au>
References: <20260619044838.1054677-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Nicholas Piggin <npiggin@gmail.com>

Machines that have discontiguous memory may need to adjust where
firmware and images are loaded at boot. Provide an interface for
machines to describe a discontiguous low/high RAM scheme for this
purpose.

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/riscv/boot.h |  7 +++++++
 hw/riscv/boot.c         | 16 ++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index f00b3ca12245..69c99a149613 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -28,6 +28,10 @@
 #define RISCV64_BIOS_BIN    "opensbi-riscv64-generic-fw_dynamic.bin"
 
 typedef struct RISCVBootInfo {
+    /* First contiguous RAM region. If size is zero then assume entire RAM */
+    hwaddr ram_low_start;
+    hwaddr ram_low_size;
+
     ssize_t kernel_size;
     hwaddr image_low_addr;
     hwaddr image_high_addr;
@@ -43,6 +47,9 @@ bool riscv_is_32bit(RISCVHartArrayState *harts);
 char *riscv_plic_hart_config_string(int hart_count);
 
 void riscv_boot_info_init(RISCVBootInfo *info, RISCVHartArrayState *harts);
+void riscv_boot_info_init_discontig_mem(RISCVBootInfo *info,
+                                        RISCVHartArrayState *harts,
+                                        hwaddr low_start, hwaddr low_size);
 vaddr riscv_calc_kernel_start_addr(RISCVBootInfo *info,
                                    hwaddr firmware_end_addr);
 hwaddr riscv_find_and_load_firmware(MachineState *machine,
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 7c9cd6146815..c8418f83f480 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -70,11 +70,27 @@ char *riscv_plic_hart_config_string(int hart_count)
 
 void riscv_boot_info_init(RISCVBootInfo *info, RISCVHartArrayState *harts)
 {
+    info->ram_low_start = 0;
+    info->ram_low_size = 0;
     info->kernel_size = 0;
     info->initrd_size = 0;
     info->is_32bit = riscv_is_32bit(harts);
 }
 
+/*
+ * This can be used instead of riscv_boot_info_init() if the machine has
+ * discontiguous physical memory. The low memory range specified will be
+ * used to place firmware images.
+ */
+void riscv_boot_info_init_discontig_mem(RISCVBootInfo *info,
+                                        RISCVHartArrayState *harts,
+                                        hwaddr low_start, hwaddr low_size)
+{
+    riscv_boot_info_init(info, harts);
+    info->ram_low_start = low_start;
+    info->ram_low_size = low_size;
+}
+
 vaddr riscv_calc_kernel_start_addr(RISCVBootInfo *info,
                                    hwaddr firmware_end_addr) {
     if (info->is_32bit) {
-- 
2.47.3


