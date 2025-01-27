Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895F6C0218A
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 11:40:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tcNSh-0006Dq-Az; Mon, 27 Jan 2025 06:39:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNSA-00060x-1K
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 06:38:56 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNS8-0005El-4F
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 06:38:53 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43622267b2eso44727315e9.0
 for <qemu-riscv@nongnu.org>; Mon, 27 Jan 2025 03:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737977930; x=1738582730; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uL+nnGyGOIubwvzcr2z3yGpj5dC7Jx5PGuyfw3ZHtPA=;
 b=D3Z+TtUVISWfDr/LyuST1J79GYOdUROHyd9KE8M0eqFW3OEcgtWyKAz/viwNSTMIml
 KPJtkar1Vow2Tvx839KRdCB63YhHRDric6PlU6elaRC9/T/QRVDT4dx5U7SE+G0+uMio
 /m/RdQ82SA96z9wHq6XWEiOjV8cr3bzBc40W47YuPJdy/fNEycgs3bCBM1uMODilkJ2R
 Q2zlEyNLVWZ8WvQ4yHUJoXO/uUXHzsHC8w+kQQ8B63b3745FaXb2LD7Y3SQxS61YkTp7
 MytlsrG/5VfBFH7C2EMVxPzcdPFzq2/natLEHWIYg1nAnWakqqoo7C6D+5TDQA9sogCf
 sF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737977930; x=1738582730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uL+nnGyGOIubwvzcr2z3yGpj5dC7Jx5PGuyfw3ZHtPA=;
 b=v18bdlMal40DahD7scWulG6MZ8TLGlN0PVjPDkDhUyt/fi5rQ7XpRu3D48i8xSCk+F
 vcBEnpKqCNZihDcw1wXs2kqFXnF8Yogu2sVZLfjD9VgjB/vl0WDoBK6/x6C+F6Y0/bJ7
 7HE3xpdJcEE62Y8dmeD6fJCc7FefsFNtmV6cEaP+LdKAv1DibPdtUehZ9ekMi+2wheGo
 HO4mmGmqhFwTT8uJQIy9Kpdwvi0hxE+sWEMlVcIof1eIxhjCEbhgibWyGWKUjuHJpJ7j
 g494i6+hdVQJbe7acmcK5cEF3ml+GamSk+eVq55DMuopya4NUlFmk1lzR8cm46Sdsms6
 1TzA==
X-Gm-Message-State: AOJu0YzI/3YWDxigz3j7lkHx/hoVkhKaOvUktX0nfF8l8qBVMc7vKZ+V
 4K0VTsZPqun2P/q2pek1XfgrqbAsF96htBPQ928miA3pD1bLLZ/IcOp94r7nafA=
X-Gm-Gg: ASbGncv5JlvNuu788/5jYGQtigsCLhqyAAvfxhutM9UBQCkwitVFrLaOk5m2tJgw+lu
 eK3SNU+qO39RijsAmXbPe/8rXy6YH8oxa+zqbsnFsjEe47i3r1wa2vdFnHXCJoV1O9qdZUuAcDu
 XUkklZ8wMgJVmS2wEDvUMFTDOgq1kHzzfR1PHYMuS8mQi0AWWHstVZ4cxFFn6aifHWWGpT7bY5K
 ciXgLtgQAl05NCbZwBvxSnJ7BIlP87TCyeRgc9wdFSN3ckUPu3G7P9HFz0QDu9EY7RdppOmyv9Z
 l5J2Dseiw8K9nzpGGRZsJTmLOEVORh9sX172djnc3yCS/DFT0BRqJpk=
X-Google-Smtp-Source: AGHT+IF4ibR7kZRreK3zGw/53OzPbMV5BDzRm6fHb6QGe1KZCCEtl9T0CyI8Zp8iSXw5RdnPvibVFA==
X-Received: by 2002:a05:600c:35c3:b0:438:a290:3ce0 with SMTP id
 5b1f17b1804b1-438a2903f47mr322246355e9.8.1737977930619; 
 Mon, 27 Jan 2025 03:38:50 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd54c0d1sm130524395e9.26.2025.01.27.03.38.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Jan 2025 03:38:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/6] hw/loader: Pass ELFDATA endian order argument to
 load_elf_as()
Date: Mon, 27 Jan 2025 12:38:23 +0100
Message-ID: <20250127113824.50177-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250127113824.50177-1-philmd@linaro.org>
References: <20250127113824.50177-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Rather than passing a boolean 'is_big_endian' argument,
directly pass the ELFDATA, which can be unspecified using
the ELFDATANONE value.

Update the call sites:
  0 -> ELFDATA2LSB
  1 -> ELFDATA2MSB

Note, this allow removing the target_words_bigendian() call
in the GENERIC_LOADER device, where we pass ELFDATANONE.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/loader.h      |  2 +-
 hw/core/loader.c         |  8 ++++----
 hw/arm/armv7m.c          |  2 +-
 hw/arm/boot.c            | 16 ++++++++--------
 hw/avr/boot.c            |  2 +-
 hw/core/generic-loader.c |  6 +-----
 6 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/include/hw/loader.h b/include/hw/loader.h
index 8202c376043..84737c05b8d 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -162,7 +162,7 @@ ssize_t load_elf_as(const char *filename,
                     uint64_t (*elf_note_fn)(void *, void *, bool),
                     uint64_t (*translate_fn)(void *, uint64_t),
                     void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
-                    uint64_t *highaddr, uint32_t *pflags, int big_endian,
+                    uint64_t *highaddr, uint32_t *pflags, int elf_data_order,
                     int elf_machine, int clear_lsb, int data_swab,
                     AddressSpace *as);
 
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 0cd34425e9c..84c7f7987ec 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -413,7 +413,8 @@ ssize_t load_elf(const char *filename,
                  int elf_machine, int clear_lsb, int data_swab)
 {
     return load_elf_as(filename, elf_note_fn, translate_fn, translate_opaque,
-                       pentry, lowaddr, highaddr, pflags, big_endian,
+                       pentry, lowaddr, highaddr, pflags,
+                       big_endian ? ELFDATA2MSB : ELFDATA2LSB,
                        elf_machine, clear_lsb, data_swab, NULL);
 }
 
@@ -422,14 +423,13 @@ ssize_t load_elf_as(const char *filename,
                     uint64_t (*elf_note_fn)(void *, void *, bool),
                     uint64_t (*translate_fn)(void *, uint64_t),
                     void *translate_opaque, uint64_t *pentry, uint64_t *lowaddr,
-                    uint64_t *highaddr, uint32_t *pflags, int big_endian,
+                    uint64_t *highaddr, uint32_t *pflags, int elf_data_order,
                     int elf_machine, int clear_lsb, int data_swab,
                     AddressSpace *as)
 {
     return load_elf_ram_sym(filename, elf_note_fn,
                             translate_fn, translate_opaque,
-                            pentry, lowaddr, highaddr, pflags,
-                            big_endian ? ELFDATA2MSB : ELFDATA2LSB,
+                            pentry, lowaddr, highaddr, pflags, elf_data_order,
                             elf_machine, clear_lsb, data_swab, as,
                             true, NULL);
 }
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index a67a890a33e..98a69846119 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -608,7 +608,7 @@ void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename,
     if (kernel_filename) {
         image_size = load_elf_as(kernel_filename, NULL, NULL, NULL,
                                  &entry, NULL, NULL,
-                                 NULL, 0, EM_ARM, 1, 0, as);
+                                 NULL, ELFDATA2LSB, EM_ARM, 1, 0, as);
         if (image_size < 0) {
             image_size = load_image_targphys_as(kernel_filename, mem_base,
                                                 mem_size, as);
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index b44bea8a821..cbc24356fc1 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -798,7 +798,7 @@ static ssize_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
         Elf64_Ehdr h64;
     } elf_header;
     int data_swab = 0;
-    bool big_endian;
+    int elf_data_order;
     ssize_t ret;
     Error *err = NULL;
 
@@ -814,12 +814,12 @@ static ssize_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
     }
 
     if (elf_is64) {
-        big_endian = elf_header.h64.e_ident[EI_DATA] == ELFDATA2MSB;
-        info->endianness = big_endian ? ARM_ENDIANNESS_BE8
-                                      : ARM_ENDIANNESS_LE;
+        elf_data_order = elf_header.h64.e_ident[EI_DATA];
+        info->endianness = elf_data_order == ELFDATA2MSB ? ARM_ENDIANNESS_BE8
+                                                         : ARM_ENDIANNESS_LE;
     } else {
-        big_endian = elf_header.h32.e_ident[EI_DATA] == ELFDATA2MSB;
-        if (big_endian) {
+        elf_data_order = elf_header.h32.e_ident[EI_DATA];
+        if (elf_data_order == ELFDATA2MSB) {
             if (bswap32(elf_header.h32.e_flags) & EF_ARM_BE8) {
                 info->endianness = ARM_ENDIANNESS_BE8;
             } else {
@@ -839,8 +839,8 @@ static ssize_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
     }
 
     ret = load_elf_as(info->kernel_filename, NULL, NULL, NULL,
-                      pentry, lowaddr, highaddr, NULL, big_endian, elf_machine,
-                      1, data_swab, as);
+                      pentry, lowaddr, highaddr, NULL, elf_data_order,
+                      elf_machine, 1, data_swab, as);
     if (ret <= 0) {
         /* The header loaded but the image didn't */
         error_report("Couldn't load elf '%s': %s",
diff --git a/hw/avr/boot.c b/hw/avr/boot.c
index 6a91dcd12d0..e5a29c7218e 100644
--- a/hw/avr/boot.c
+++ b/hw/avr/boot.c
@@ -73,7 +73,7 @@ bool avr_load_firmware(AVRCPU *cpu, MachineState *ms,
 
     bytes_loaded = load_elf_as(filename, NULL, NULL, NULL,
                                &entry, NULL, NULL,
-                               &e_flags, 0, EM_AVR, 0, 0, NULL);
+                               &e_flags, ELFDATA2LSB, EM_AVR, 0, 0, NULL);
     if (bytes_loaded >= 0) {
         /* If ELF file is provided, determine CPU type reading ELF e_flags. */
         const char *elf_cpu = avr_elf_e_flags_to_cpu_type(e_flags);
diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
index 0ddb3a359a2..5fdbc3f3be2 100644
--- a/hw/core/generic-loader.c
+++ b/hw/core/generic-loader.c
@@ -31,7 +31,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "exec/tswap.h"
 #include "system/dma.h"
 #include "system/reset.h"
 #include "hw/boards.h"
@@ -63,7 +62,6 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
 {
     GenericLoaderState *s = GENERIC_LOADER(dev);
     hwaddr entry;
-    int big_endian;
     ssize_t size = 0;
 
     s->set_pc = false;
@@ -131,14 +129,12 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
         s->cpu = first_cpu;
     }
 
-    big_endian = target_words_bigendian();
-
     if (s->file) {
         AddressSpace *as = s->cpu ? s->cpu->as :  NULL;
 
         if (!s->force_raw) {
             size = load_elf_as(s->file, NULL, NULL, NULL, &entry, NULL, NULL,
-                               NULL, big_endian, 0, 0, 0, as);
+                               NULL, ELFDATANONE, 0, 0, 0, as);
 
             if (size < 0) {
                 size = load_uimage_as(s->file, &entry, NULL, NULL, NULL, NULL,
-- 
2.47.1


