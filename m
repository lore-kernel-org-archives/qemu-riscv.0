Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80744C61DD3
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 05:54:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x20OL-0007no-3v; Thu, 03 Sep 2026 01:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x20OI-0007fX-Na
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 01:53:38 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x20OH-0006Vc-3K
 for qemu-riscv@nongnu.org; Thu, 03 Sep 2026 01:53:38 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-ca12086c06eso1614004a12.0
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 22:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788414815; x=1789019615; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=h84XBkjDHnyNzYT31LGlAcrbsHdqgnWyjCPO93XfIRk=;
 b=KS4gDmj97QUr1lTkAfjEIPuZaTvermoW4ry+sWa5tEadLXSFzj2sTAHsY4CinrgzYl
 wnSBDZpfH6N2eJgLUZdxp4RMZXphh0Vbx6sjZHqihnRycfdy6FWd/NkysWzgNccIodFj
 YMTZp2Ty6oAK/qXbUw2uKfBorMQ0HmgQWV0LnLLcmxUozfvwmogPxh+L/c2LMU9VpxQl
 2uC31XHbWrc7X0G5Tid36vBTD2XEVs/g6v+ygZsoDx0NFV3buw/91jGKdZiIlJ+A0taW
 e3JoBroZZlsJvsgZt2w12/n//jomQGzBIfwfgrdwPyb9tdS9+aUqUb4M4tsyRom6n6qX
 SMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788414815; x=1789019615;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=h84XBkjDHnyNzYT31LGlAcrbsHdqgnWyjCPO93XfIRk=;
 b=hS4Nq7P+rAIa5T/H2GcD2f+48rodCMjcRxHrA9glKKK2vGlea5Le3gLVGBsrUTd5KE
 k7lhSXthcmxX4icGiTvGTPEZ9ah9mHgY8wMpnPm6RyrfMzuMkFOPTumwoDCsCvllrNoW
 c8qYt++sYFMEVyxjz/PHaewVTlRjsUCLrWIWvLbaxND2ne/R509FBa2uBJPDcTjGJD0L
 eYs30Xfta9Dh4gPd0WEa+O2IOLoKcqoxAxgjftoTbOKjwbrH848QFvynSBKokn9VIMGx
 Z27KBRMn4PHd0ZZF2ZM9oqZFHTev2rCh0lxFfLYJQ4LIGlqWNdixFZvPO1PK5YYI6229
 OHzQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwkQNGefWlyr6Bg4pGu5D86TfvghZiXSsmWEuO7TVQ9eBdPxGbYpjxc11NW1WSYyNkaVsbIPQKQHpal@nongnu.org
X-Gm-Message-State: AFuF++lSc7n3T73A7KVcm3pe7s1oPPbuX1wiLoIDt3f0sZL/aUkcGIpk
 AOCrND964TganUAfAQw+1DYeTDAntP8W9gCjIhQgjmk9sGqIWMMlms0x
X-Gm-Gg: AYBFou2G7/JcQPahW5q0CcosgOW+Aq0+IgZtCmBulVM87vpI5PybL+Pp0APFB1dudKb
 fihD/0Zf3R5r1QnX+iFkloB7OzhtBL5eUNrew7ufQm6xY0qwzKLKiRkp8xrIJbiHu/nVaHDjmRN
 ffi6zNf5ILjdpqHHroSBW9ZKVCEiJ0ra3qJBlXt26g2RE8jCqPVOh6Y+zymME2cPqXloFWjNbgh
 x0XI/QYdisyjFWYRDzaXvaPn6XQz4+xUcojKNPui+nfzZB4tFE128ePO6Hj7gj8fOl5c+eWPntm
 IYgQg5ksbzNN08tp0pvAOVVYs0447MyoNSEqZO2+U4RvfW0J1Rq0yATUNjTmoGr9Zw6Lzy8tJkc
 KwHqJBR08e9Ghv8sdK4D1wN4B0UpC+OpzYsymeaq478O8rec1IpEABRDTiUIHNaDW7FH3BAxir9
 LpTXirZTy6nHfZ3pJE/fe1aQKObiCgMDmcsd/zBdHL167YG4//3AXhvAi46191SUSJBJ24t3IiA
 O2G4J3fWuGzkMSYeFgvLAur7B0PoMTpgufF97wR0SWw1VONiaftfs/w9TfncAaF67i4iKdM8cQ2
 bQtnL4Qz2YEOZWkgsdYz
X-Received: by 2002:a05:6a20:2584:b0:3c3:6f6c:aa21 with SMTP id
 adf61e73a8af0-3d9ae8e5abemr13034587637.11.1788414815638; 
 Wed, 02 Sep 2026 22:53:35 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1431990a39bsm2770619c88.3.2026.09.02.22.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 22:53:34 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 13/16] hw/riscv/atlantis: Make TTAtlantisState own memory
 containers
Date: Thu,  3 Sep 2026 15:21:27 +0930
Message-ID: <20260903055131.257903-14-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260903055131.257903-1-joel@jms.id.au>
References: <20260903055131.257903-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

The DRAM hi, DRAM low and bootrom memory containers can be owned by the
TTAtlantisState.

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/riscv/tt_atlantis.h |  4 ++++
 hw/riscv/tt_atlantis.c         | 15 ++++++---------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/include/hw/riscv/tt_atlantis.h b/include/hw/riscv/tt_atlantis.h
index 2ec283d0fd7b..9ca98bfb8478 100644
--- a/include/hw/riscv/tt_atlantis.h
+++ b/include/hw/riscv/tt_atlantis.h
@@ -31,10 +31,14 @@ struct TTAtlantisState {
 
     MemoryRegion *memory;
     MemoryRegion *dram;
+    MemoryRegion ram_hi;
+    MemoryRegion ram_lo;
+
     RISCVHartArrayState cpus;
     DeviceState *irqchip;
     DesignWareI2CState i2c[TT_ATL_NUM_I2C];
     UnimplementedDeviceState uart1;
+    MemoryRegion bootrom;
 };
 
 enum {
diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
index 90b8e1bc904a..d4fe505fe033 100644
--- a/hw/riscv/tt_atlantis.c
+++ b/hw/riscv/tt_atlantis.c
@@ -484,9 +484,6 @@ static void tt_atlantis_machine_init(MachineState *machine)
 {
     TTAtlantisState *s = TT_ATLANTIS_MACHINE(machine);
 
-    MemoryRegion *ram_hi = g_new(MemoryRegion, 1);
-    MemoryRegion *ram_lo = g_new(MemoryRegion, 1);
-    MemoryRegion *bootrom = g_new(MemoryRegion, 1);
     ram_addr_t lo_ram_size, ram_size;
     int hart_count = machine->smp.cpus;
 
@@ -544,22 +541,22 @@ static void tt_atlantis_machine_init(MachineState *machine)
         exit(EXIT_FAILURE);
     }
 
-    memory_region_init_alias(ram_hi, OBJECT(machine), "ram.high", s->dram,
+    memory_region_init_alias(&s->ram_hi, OBJECT(machine), "ram.high", s->dram,
                              0, ram_size);
     memory_region_add_subregion(s->memory,
-                                s->memmap[TT_ATL_DDR_HI].base, ram_hi);
+                                s->memmap[TT_ATL_DDR_HI].base, &s->ram_hi);
 
     lo_ram_size = MIN(ram_size, s->memmap[TT_ATL_DDR_LO].size);
-    memory_region_init_alias(ram_lo, OBJECT(machine), "ram.low", s->dram,
+    memory_region_init_alias(&s->ram_lo, OBJECT(machine), "ram.low", s->dram,
                              0, lo_ram_size);
     memory_region_add_subregion(s->memory,
-                                s->memmap[TT_ATL_DDR_LO].base, ram_lo);
+                                s->memmap[TT_ATL_DDR_LO].base, &s->ram_lo);
 
     /* Boot ROM */
-    memory_region_init_rom(bootrom, NULL, "tt-atlantis.bootrom",
+    memory_region_init_rom(&s->bootrom, NULL, "tt-atlantis.bootrom",
                            s->memmap[TT_ATL_BOOTROM].size, &error_fatal);
     memory_region_add_subregion(s->memory, s->memmap[TT_ATL_BOOTROM].base,
-                                bootrom);
+                                &s->bootrom);
 
     /* UART1, the soc console (UART0 is for the boot microcontroller) */
     serial_mm_init(s->memory, s->memmap[TT_ATL_UART1].base, 2,
-- 
2.47.3


