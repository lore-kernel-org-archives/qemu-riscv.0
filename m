Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3E0C0218C
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 11:40:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tcNS8-00060B-3i; Mon, 27 Jan 2025 06:38:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNS4-0005zA-DR
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 06:38:48 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tcNS2-0005Ds-O7
 for qemu-riscv@nongnu.org; Mon, 27 Jan 2025 06:38:48 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3862f32a33eso1972471f8f.3
 for <qemu-riscv@nongnu.org>; Mon, 27 Jan 2025 03:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737977925; x=1738582725; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=duOqb1GCMJx47PEXJD6iEC2jwq3vPcsjz9INrZ4jd4c=;
 b=a1Gvi2c8CdABavKz3SYRmeVC1qz4mcgQyD7/kxnuGXAZS2raUuqMMsCZDNhlG8whOa
 FNZPG5sw2UwFRofV5CTiIN/jKGFiY0EyIPDI8EcOvzgCnynKqcrxWtCVhu7g9r/8b+Qs
 260qRmKM5KFOvxv+3q6pdZxT17Pym2Yk9F0mdzmebRQIQUIA5ZDYfb/Zje32tBSGo7Jk
 1h5G0x/Gv61tyS2cBPMrwDcN0R5eGWJJ8Zp0NP2Z1HjhX4mXBPnTerJoK5fLNN481Drn
 UaAu4QULdr0vMCmLhfmO6QuhLPfXSoaPgG/MasC4aavHu43u41D69IfthxDNujWNwE05
 1O0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737977925; x=1738582725;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=duOqb1GCMJx47PEXJD6iEC2jwq3vPcsjz9INrZ4jd4c=;
 b=jErSENh3jtX+j505XD2JssNlNS0WUtWJWYctBsNCYLkTtSdEJJTs+qQkycygkUtYii
 t8QtiIRPmOpqaejEeSLdqBWAY2zp5XpxO9Nv45GvVy/7tNh2Pn6HnBQgf4rXcW2aeam4
 AkmUzBzBGdi9zchPQiDSiVuayvcR04Gx/V/uepzzwV3g9STY4Mkg6QTRxo1XLS5HUsW4
 RrBjXMMcz5HdvzL9rY96j4Qz6egATRVPJ0rFBWF1mALDCF/fBB57VPBYNPtVVUCQLwgT
 2R/3oYXmJHd26QqmHWlE5fU7UIIqy4mP17q1pHHG+ddfQE4QkuiJE3USdudDv0NmPWiP
 ivPw==
X-Gm-Message-State: AOJu0YxzrDcU+31SsA5ETW75JTXhwRtyPoi8TSQjc4KPK7Ij8WygSM/9
 ZpZ1UhOdsjuReRQCOPnQDilcKKi2GNr49FrW39SPXZhn3uiFHi8y00A1LQXBLXQ=
X-Gm-Gg: ASbGncv1yNf9rcNA1FsuXCHJHqZno2oM1Ve9Uo0j4XYyYnPhnV1JjI0aDlajUKrQSSj
 qcFXx9g1kpZb0I2xoYwPAAQ52BINoocWRKCvh4u1Ws7K3eJjYke8HRDcStwt6QapIScoBJo6sdV
 n9s4ejzfF/2NkspWQ0rd595KS7of1/cFK4Dkme5xKXRpL1QR9MaGOIyeA03RqQiLDHo3U0EgVr/
 VZCRozL8u0Lz/SbitkvUE6v3o5ztsytb0fW65YM0qWwiySxJtLSZPdDgl7Ad/gbYjXC3nCbTkLN
 DTBx60Fd1ykMtie8lhnLtp2/MHz2qJZ+m+XxnlrINPBJKMoM2lrxVT7IQiOY2yuw7Q==
X-Google-Smtp-Source: AGHT+IE9m0Pju6AwqBuwa4CUoGUL98YIzUfDhFgQ9YFtEW+7z1/21S1cV6mkfoT9w9qLyFOOF1CAqw==
X-Received: by 2002:adf:eb10:0:b0:385:fc00:f5d4 with SMTP id
 ffacd0b85a97d-38bf566ce7dmr28102438f8f.29.1737977925293; 
 Mon, 27 Jan 2025 03:38:45 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1c3994sm10608811f8f.81.2025.01.27.03.38.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Jan 2025 03:38:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/6] hw/loader: Pass ELFDATA endian order argument to
 load_elf_ram_sym()
Date: Mon, 27 Jan 2025 12:38:22 +0100
Message-ID: <20250127113824.50177-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250127113824.50177-1-philmd@linaro.org>
References: <20250127113824.50177-1-philmd@linaro.org>
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

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/loader.h |  4 ++--
 hw/core/loader.c    | 23 ++++++++++-------------
 hw/riscv/boot.c     |  3 ++-
 3 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/include/hw/loader.h b/include/hw/loader.h
index 9bb34e6f062..8202c376043 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -120,7 +120,7 @@ const char *load_elf_strerror(ssize_t error);
  * @lowaddr: Populated with lowest loaded address. Ignored if NULL.
  * @highaddr: Populated with highest loaded address. Ignored if NULL.
  * @pflags: Populated with ELF processor-specific flags. Ignore if NULL.
- * @bigendian: Expected ELF endianness. 0 for LE otherwise BE
+ * @elf_data_order: Expected ELF endianness (ELFDATA2LSB or ELFDATA2MSB).
  * @elf_machine: Expected ELF machine type
  * @clear_lsb: Set to mask off LSB of addresses (Some architectures use
  *             this for non-address data)
@@ -151,7 +151,7 @@ ssize_t load_elf_ram_sym(const char *filename,
                          uint64_t (*translate_fn)(void *, uint64_t),
                          void *translate_opaque, uint64_t *pentry,
                          uint64_t *lowaddr, uint64_t *highaddr,
-                         uint32_t *pflags, int big_endian, int elf_machine,
+                         uint32_t *pflags, int elf_data_order, int elf_machine,
                          int clear_lsb, int data_swab,
                          AddressSpace *as, bool load_rom, symbol_fn_t sym_cb);
 
diff --git a/hw/core/loader.c b/hw/core/loader.c
index fc2e8f91267..0cd34425e9c 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -428,7 +428,8 @@ ssize_t load_elf_as(const char *filename,
 {
     return load_elf_ram_sym(filename, elf_note_fn,
                             translate_fn, translate_opaque,
-                            pentry, lowaddr, highaddr, pflags, big_endian,
+                            pentry, lowaddr, highaddr, pflags,
+                            big_endian ? ELFDATA2MSB : ELFDATA2LSB,
                             elf_machine, clear_lsb, data_swab, as,
                             true, NULL);
 }
@@ -439,11 +440,11 @@ ssize_t load_elf_ram_sym(const char *filename,
                          uint64_t (*translate_fn)(void *, uint64_t),
                          void *translate_opaque, uint64_t *pentry,
                          uint64_t *lowaddr, uint64_t *highaddr,
-                         uint32_t *pflags, int big_endian, int elf_machine,
+                         uint32_t *pflags, int elf_data_order, int elf_machine,
                          int clear_lsb, int data_swab,
                          AddressSpace *as, bool load_rom, symbol_fn_t sym_cb)
 {
-    int fd, host_data_order, target_data_order, must_swab;
+    int fd, host_data_order, must_swab;
     ssize_t ret = ELF_LOAD_FAILED;
     uint8_t e_ident[EI_NIDENT];
 
@@ -461,22 +462,18 @@ ssize_t load_elf_ram_sym(const char *filename,
         ret = ELF_LOAD_NOT_ELF;
         goto fail;
     }
+
+    if (elf_data_order != ELFDATANONE && elf_data_order != e_ident[EI_DATA]) {
+        ret = ELF_LOAD_WRONG_ENDIAN;
+        goto fail;
+    }
+
 #if HOST_BIG_ENDIAN
     host_data_order = ELFDATA2MSB;
 #else
     host_data_order = ELFDATA2LSB;
 #endif
     must_swab = host_data_order != e_ident[EI_DATA];
-    if (big_endian) {
-        target_data_order = ELFDATA2MSB;
-    } else {
-        target_data_order = ELFDATA2LSB;
-    }
-
-    if (target_data_order != e_ident[EI_DATA]) {
-        ret = ELF_LOAD_WRONG_ENDIAN;
-        goto fail;
-    }
 
     lseek(fd, 0, SEEK_SET);
     if (e_ident[EI_CLASS] == ELFCLASS64) {
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 90e75c69a04..c309441b7d8 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -246,7 +246,8 @@ void riscv_load_kernel(MachineState *machine,
      */
     kernel_size = load_elf_ram_sym(kernel_filename, NULL, NULL, NULL, NULL,
                                    &info->image_low_addr, &info->image_high_addr,
-                                   NULL, 0, EM_RISCV, 1, 0, NULL, true, sym_cb);
+                                   NULL, ELFDATA2LSB, EM_RISCV,
+                                   1, 0, NULL, true, sym_cb);
     if (kernel_size > 0) {
         info->kernel_size = kernel_size;
         goto out;
-- 
2.47.1


