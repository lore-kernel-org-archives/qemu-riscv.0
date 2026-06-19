Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B91CD98F8
	for <qemu-riscv@archiver.kernel.org>; Fri, 19 Jun 2026 04:50:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1waRAo-0008UI-Ot; Fri, 19 Jun 2026 00:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1waRAn-0008Tu-41
 for qemu-riscv@nongnu.org; Fri, 19 Jun 2026 00:49:45 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1waRAl-0005aB-HK
 for qemu-riscv@nongnu.org; Fri, 19 Jun 2026 00:49:44 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-8422871b42dso1191993b3a.3
 for <qemu-riscv@nongnu.org>; Thu, 18 Jun 2026 21:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781844582; x=1782449382; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h/4gPFTvEOiA6bvBc5b2RKGBkvJS7RvJu6EipcSXEpI=;
 b=qKxhYi5CxIsmD/2SXjY2yJoJ26ZHx42ZRsE9u6ekLhAfmCQFIWrWxY+hsXkDFyVm+e
 EbocD+hJT+JKGDrXUIu2hxt8lynVCpm/aT0EgKv5ppHycY4cyX4KTXg1GqRccAiTxFNV
 TXomXSNbA3UblmyxtIjtUybNl2vQ0EWkaD70OHM8YBSKWdR3SxV0d90bFkRrlwy4juah
 aK4CKo8Obny4hFn57vW5sBPmbCmpxiMDjIzJHvGoixXIt0sWUbGy+U2GmroZ88C6ca+m
 ZhUWLoJwLAj8YnSR5NBuZk8T9kRaZESAB9TLqef1O0r+tQZXpQf5VtwhU4LwqRmEykoA
 x8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781844582; x=1782449382;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h/4gPFTvEOiA6bvBc5b2RKGBkvJS7RvJu6EipcSXEpI=;
 b=KvETIG9/eJZXBeTJuKGPqUlyExN/kBRCAJqjdsUIUFW022JPQp6OA3IvgDX1Le+bzl
 UROVQiwvm/Prhby7tXgy7sAXS/lQBPaBINEY0GvGn3uCZuhBdfZBHogbm6fmh5QNO8i4
 3X7bYVlF6LRK2wkmOAfAZb6d9wcLM0zDe5L3vjs8KTzR8WRgkWWIXIWhDPTQuYq2nv26
 PtVJ7A8YF1SzLAW/PlcM7J5JeZKQsYPKpsHTqm0a6LlNzmPgKfmpwyvFhpr/Cn9UPrTD
 0tIboUoeopvBxDZhtJYcyrtAMwQ9SFJngu081k2XEzsfnkvUm72Z9ocHsC04lo1fSZpr
 2iaQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+txuHiH7Wsp2nqauA3O5NIrYAMtPaWygChcuBTANe9FVb5uPW0bv74nERCgt9wgXUtlGl3kmZIfR0S@nongnu.org
X-Gm-Message-State: AOJu0Yzaw+XkAKn495aXgVXWHVSsrtfdEOKAJTuco8KOsq8Au92w748Q
 4PKfZs1rIaikfSiD46LTqICIwlMLek8/R8MM352KyQj/uAjXkXmk1Jdn
X-Gm-Gg: AfdE7cn9rGjY2uYdHQt2BDik1BsERCyX4At6LcuwBYvWHZv+LbKDF/mgtjv/u4Af6vU
 lLQoRyc0W/R5C4kftBvKzxtb+ulhW9nfEX9EZ2LJRN78HGzbo6XzY84OPOA/fELGv5jOcsxUY82
 MSwIzVDZa3udv+pJ0iNWXbRnBarKA+dkkQHzV/2PRFboy6/EfpfqXSgiEqxgsgbM0Bg5LilUU4e
 qW6I/JgZLXNXipanVJS5ELRTNyBF4d1AGbkKDKc4devLjmPUho75HikJvr6e+PbgdJP1coTo90a
 w0UXqQWH0uLNiIQ5xpUJyHip1DE8fIFQHS2UGqZw/gxfG5kacwla5asf+rI394CkBqCx1iFD4jQ
 u+l5aHCDzjSr7oG6dFt/LHCeKwYLMQiDp0IooBT8Dor7R+J4N8rHGA6AlIZFR5uxHLdy827sf72
 SkJ3FV+SB2Deit3WnorlxaSLzegwpq77BKSHYeR0Rj0liWqr+59dMcx48T7SRfCKVYyCnb7NGSM
 te/PA5EHB/tSEmZXTCsuDVMWe97jc6u8uIlWr0hMg==
X-Received: by 2002:a05:6a00:18a3:b0:845:4888:74c5 with SMTP id
 d2e1a72fcca58-8455612ed04mr1166726b3a.23.1781844582268; 
 Thu, 18 Jun 2026 21:49:42 -0700 (PDT)
Received: from donnager-debian.. ([144.6.172.18])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8455363da44sm870141b3a.8.2026.06.18.21.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2026 21:49:41 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Chris Rauer <crauer@google.com>, Alano Song <alanosong@163.com>,
 Michael Ellerman <mpe@kernel.org>, Joel Stanley <jms@oss.tenstorrent.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v9 08/12] hw/riscv/atlantis: Provide a simple halting payload
Date: Fri, 19 Jun 2026 14:18:32 +0930
Message-ID: <20260619044838.1054677-9-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619044838.1054677-1-joel@jms.id.au>
References: <20260619044838.1054677-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x42b.google.com
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

OpenSBI hangs before any console output if the domain init code sees the
next stage is not in an executable region.

If no kernel payload is provided to QEMU, the next stage address is
NULL, and the riscv virt machine memory map ends up covering the 0
address with the catch all S-mode RWX region and so OpenSBI prints
console messages and does not hang until the next stage boot.

The Tenstorrent Atlantis machine address map has RAM starting at 0 and
it loads OpenSBI there, so it is M-mode and not accessible by S-mode,
tripping the early check and hang.

Add a helper to set up a simple payload that gets OpenSBI messages to
console, until OpenSBI can be fixed.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/riscv/tt_atlantis.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index 1f0cd08ac959..c3016d6d4c9e 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -340,6 +340,30 @@ static void load_fdt(TTAtlantisState *s)
     create_fdt_memory(s);
 }
 
+/*
+ * This works around a problem with OpenSBI hanging with no console output if
+ * no payload is provided. By chance, machines with memory at 0x80000000 do get
+ * output, but Atlantis memory begins at 0x0 which takes a different OpenSBI
+ * error path.
+ *
+ * This can be removed when OpenSBI is fixed in QEMU.
+ */
+static void tt_atlantis_setup_halting_payload_opensbi_fixup(
+                                        RISCVBootInfo *info, hwaddr addr)
+{
+    /* Store the payload vector in little_endian byte order */
+    static const uint32_t payload_vec[] = {
+        const_le32(0x10500073),         /* 1: wfi           */
+        const_le32(0xffdff06f),         /* j       1b       */
+    };
+    rom_add_blob_fixed_as("mrom.payload", payload_vec, sizeof(payload_vec),
+                          addr, &address_space_memory);
+
+    info->kernel_size = sizeof(payload_vec);
+    info->image_low_addr = addr;
+    info->image_high_addr = info->image_low_addr + info->kernel_size;
+}
+
 static void tt_atlantis_machine_done(Notifier *notifier, void *data)
 {
     TTAtlantisState *s = container_of(notifier, TTAtlantisState, machine_done);
@@ -377,6 +401,9 @@ static void tt_atlantis_machine_done(Notifier *notifier, void *data)
     if (machine->kernel_filename) {
         riscv_load_kernel(machine, &boot_info, kernel_start_addr,
                           true, NULL);
+    } else {
+        tt_atlantis_setup_halting_payload_opensbi_fixup(&boot_info,
+                                                        kernel_start_addr);
     }
     kernel_entry = boot_info.image_low_addr;
 
-- 
2.47.3


