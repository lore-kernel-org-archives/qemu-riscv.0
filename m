Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9BCCD6E4A
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 07:00:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wUfZX-0003we-CI; Wed, 03 Jun 2026 02:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wUfZV-0003w5-AO
 for qemu-riscv@nongnu.org; Wed, 03 Jun 2026 02:59:25 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wUfZT-000682-Fh
 for qemu-riscv@nongnu.org; Wed, 03 Jun 2026 02:59:25 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-c85822059d8so2950887a12.1
 for <qemu-riscv@nongnu.org>; Tue, 02 Jun 2026 23:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780469962; x=1781074762; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=58LAzm/e1KCJqi5R0CKTCeU65PCJcJsIuIaEq/eXBzE=;
 b=LKeaPgh5JrHQY+HjYa6HveMvvgH0ZTD27n5eFhC6bkimuuo4HsE4ToxHa8/f2VuyXz
 WFwq6tBuKDyTVsuL/0NjolUiHsOoznoTK7OOMpVMKU7dUKozLAcW+h6pCRNmlE5pDC16
 9R9bzef2VT2QBB55Dux9HuYC9VK+ry3jGL/rG3YUVzYNvb8jNbIEDynTLoBUrwlCW7Ey
 t7sVq/yjKNjBAbbaGO4w6m/gyW1wv+JHbrOAOSjG1hD3fP3T8/unZzqRh0cYxL7J27/h
 KOdibzoCRV6AZa8AAz1ULYXHTHmrPaneFLAqV2AT91R//LhQCJHjWkpUHqPucjfH4TbS
 rqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780469962; x=1781074762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=58LAzm/e1KCJqi5R0CKTCeU65PCJcJsIuIaEq/eXBzE=;
 b=Jr/g9U4bYs0SCGYIpHlxh2BIJ2akCLPNMxJwCwr0HqDqw1WGKCM3sQZSjEIQiBEj27
 eGt9Nv8wSa3g708K3FpYu6n/HX0YYA9bxaJR2uJ60nBsv52vcwW8hXRq6prNvlYLoD+n
 0XgJ3Svhv+Th6uvG1GTz94dtps7X2NGDPHM3gW/gCblV23q4IyCW2zOfiowU4ePQ5YTT
 i+AYCbO9gA0yPEjEAyHJzmCyMkdi1TX6g9I6uxdXESxTkarZ3Pf89Ny3PmK/ngnwtRQo
 z+l/diniEXplAOnbGBJgpTsspDdrTMgvwwmIj/il54yB1Qi3s8s5HCmeZsxj79EXwkGh
 FsIg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+/JxsJoJhkM5dm1NXTMpwyKNY8kJdDHHHpNwdwkX1VNzcH3pSBLcax6UutbF2AqNthDNFg/a+nSfJF@nongnu.org
X-Gm-Message-State: AOJu0YzoVnkxkzmDcTdZfItG/yAv+KMBRXA9S1ofRIJLRRqKPZ6b/Agi
 kSPM0pUDRBKvx2KrRDp8K/TuPA0aloxU8+6LzI6Q8fS0xKos5PPO5YF7
X-Gm-Gg: Acq92OFqqFEj946aWOUUr2nKOquiSj6NbhN1qhA0Tm4oVpjgGQjDrgofsigosBtNTm1
 bZBT8Db8qN2lw437QtYvUQy+vb/hRdQj1/w9M3AmbbAt7n0LJz+hflzvNoViABxz+8gvAnv4G7O
 iEo6znOK06benxZpCxmbXQfN478wZr3bt8oYAh3ButXnFNKOdJ3x9loPUhR2KBRtMkSCCPPv/R4
 LEb8VqquuRYUuI8yNje31vzID74Ijh1xn7w3+UodGFv2eJQWc/90JWHFqoKBND8RdY4F/hVlZ49
 c6yIqp6+XoecInCm+UPzno8n1jFEqpmDSnUdfQGgEYYP0lgaMS0QfTetA/NPtMGr5imVdezCCIF
 wlWJeTAHf697EQ1YcphqGrsJ/l1vhB8JzvNcO3gjmZnORXNiXWoCHcgJLUkU6EbGptsbAozxGGn
 ujXnTm80Zp0U4xo6oUv8FrPobo2prmKvV+qICnU0ts3WEODABkLSVAZHaHMQ3QYZYZwDVIBHuh6
 Rm2NLkBhW3FiibYmr8eB4Le5yCv1HNNL732EJVhOhk+C8+GSMW9lGXXiuL8v4D7
X-Received: by 2002:a05:6a21:6e88:b0:3b2:924c:567d with SMTP id
 adf61e73a8af0-3b4979438b7mr2327305637.46.1780469962029; 
 Tue, 02 Jun 2026 23:59:22 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c85df033887sm1283261a12.2.2026.06.02.23.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 23:59:21 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Michael Ellerman <mpe@kernel.org>,
 Joel Stanley <jms@oss.tenstorrent.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v8 01/12] hw/riscv/boot: Describe discontiguous memory in
 boot_info
Date: Wed,  3 Jun 2026 16:28:45 +0930
Message-ID: <20260603065859.592063-2-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603065859.592063-1-joel@jms.id.au>
References: <20260603065859.592063-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x535.google.com
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
index ae2f86c7ceb3..b1a020b58aed 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -69,11 +69,27 @@ char *riscv_plic_hart_config_string(int hart_count)
 
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


