Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE93BC5DF98
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 05:59:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyNhD-0000SZ-A2; Mon, 24 Aug 2026 01:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wyNgT-0008Vz-Jy
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 01:57:30 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wyNgN-0004En-2E
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 01:57:20 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-851cbd64814so530125b3a.1
 for <qemu-riscv@nongnu.org>; Sun, 23 Aug 2026 22:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787551029; x=1788155829; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=SAnDMWJL1YbwFQMDLM1WCNCMfPxewQfgUk+BYKKeXhQ=;
 b=sOeG/Hmlz0CBBFAAy1xbmmfSivvkYNkJeKN5+i+mbwaOVfHFMtSNUF0BIMeAlKquQ1
 VCDf1/gHbtZzsBUoxnMSRnkuoosl2VaSOFwuH8/lI/P6or2tMWpSy1EQdYbcCxwXM1Js
 hy0QUWOXFowcafYKMja++vUvAuwNcXfjGuhuI/tOqtC5X56CHZek8GwXM08QF4Jvp/HO
 olZde+kVeeDlqV5jIJn9FRrBaIO1yUvoxdkGhRoH2PgxTi4qU/7tzpYLx//LJFm2AtTq
 n35at8X/t9c+6bxtIVH1AoIqkxIaHeFg4xTCPg9hJz3zXWUIJ2/Ar5xApwFueiNq0lNn
 SrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787551029; x=1788155829;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=SAnDMWJL1YbwFQMDLM1WCNCMfPxewQfgUk+BYKKeXhQ=;
 b=mxTn3Y0hhVyeLUUNmZjKJn4wqKlbWnVVeHDDPof264R428qnfcZMyeR+YYQ1674ORb
 bx+j6xSNi6wJ8RiLo3OWHmIs0TgVMNAb/bJoznKBXiEbaYBqyL51SOZAJZ1xCDQzTg51
 2DA3Y81yOlbf//Zhq9HE/iyjQa3gWHfv8igFIf6dLkk5mC1KKLG4w3MXzCi9cEZgJYYR
 1bg96Mnln840x07ZXQLPHuNKjL6+M2+5JgZYpqJ881oDlFd6phBPLScwOHq9lED10MRb
 ostUEmidMKyNluMxC+iqxi9GvtV6ujyl3Z9ZOqPeGODEbwmLuHQgwbRrGhCW2CHuX4Ry
 aOew==
X-Forwarded-Encrypted: i=1;
 AHgh+RrTk+0L0wx2UW+eFItTcv/y0DDOGvdQ6WRVoZUjqwCcGwNOMLgaGdBJ9sxp38ngkIUqdC+m/dcPDYZm@nongnu.org
X-Gm-Message-State: AFuF++n+Qfw/dzRZop+RLkac9CBX8qAHC4b3aJaAKPapyLURq9ezx3Y7
 gDZEUR1kgi6Q89wntEE04R2bDXAQXdg4Wajgv/P71K5IcrYirOEswEdw
X-Gm-Gg: AR+sD12gYemzIvGieTdIMC92OorbaT7/QWEELEEZ9oTcTtbIfrY5W5MCADSY5nkJLM1
 kgS+j1UDfuC+GzDfvhFXYNLWzofWjZ6/zg5in98oNFPEsRqhm/DkGSo8MxUA8L/M1KYi52ZGCdX
 c7gskBnv1xp3LTxPDEjjAmO+ZJuRJghWNA7kJoEFuIhEfGE6BNRqHWAl/3E6xU7HxHouKBZSivj
 xnidVr2GmVTy608Cxtw4F+nmrBQeRmbH7rkj2WnyWOb2qTtux+TSaeAv3QMfNSr1wSOT+8332/L
 fiDk7+PKHuFL0yxLFeaHjQ8acOApamuxi0wshIG1vrbJ6L+3AN3d2tW+n14OZwO9YeBnqtAf72S
 wbBY5oIqvC5wzRMIMNTKVBSShoUDna0RYBPf59Pf1v2VGo3c55rXZp1fYAKuvltfho6BhSCpe7z
 HJdYE3UvPyVfNfL9xkpHTqXR1H+gNGukOUDk5q3WXkdo97PlUSyWkQgz3T1vZHGfaC5ZvIL9Ba3
 ajsp0KSOLdcFR4S9sVW04aLj0XsvDkBJ9b5tG0E1apE7cy1k0nv6X4n+wvfRpB3fhCdFCc58SeV
 S+EG8yxZ/fibnwP+qgIS0A==
X-Received: by 2002:a05:6a00:8014:b0:84c:4b58:2cec with SMTP id
 d2e1a72fcca58-8520ba2fd59mr29263795b3a.15.1787551029064; 
 Sun, 23 Aug 2026 22:57:09 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8520f03b494sm1583474b3a.33.2026.08.23.22.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2026 22:57:08 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 1/4] hw/riscv/boot: Make RISCVBootInfo const where possible
Date: Mon, 24 Aug 2026 15:26:37 +0930
Message-ID: <20260824055642.41098-2-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260824055642.41098-1-joel@jms.id.au>
References: <20260824055642.41098-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x429.google.com
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

As with riscv_load_firmware, take a const pointer in functions that
reads the structure without writing.

Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/riscv/boot.h | 6 +++---
 hw/riscv/boot.c         | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 4e7bd9a225ef..d23f45d78077 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -50,10 +50,10 @@ void riscv_boot_info_init(RISCVBootInfo *info, RISCVHartArrayState *harts);
 void riscv_boot_info_init_discontig_mem(RISCVBootInfo *info,
                                         RISCVHartArrayState *harts,
                                         hwaddr low_start, hwaddr low_size);
-vaddr riscv_calc_kernel_start_addr(RISCVBootInfo *info,
+vaddr riscv_calc_kernel_start_addr(const RISCVBootInfo *info,
                                    hwaddr firmware_end_addr);
 hwaddr riscv_find_and_load_firmware(MachineState *machine,
-                                    RISCVBootInfo *info,
+                                    const RISCVBootInfo *info,
                                     const char *default_machine_firmware,
                                     hwaddr *firmware_load_addr,
                                     symbol_fn_t sym_cb);
@@ -71,7 +71,7 @@ void riscv_load_kernel(MachineState *machine,
                        bool load_initrd,
                        symbol_fn_t sym_cb);
 uint64_t riscv_compute_fdt_addr(hwaddr dram_base, hwaddr dram_size,
-                                MachineState *ms, RISCVBootInfo *info);
+                                MachineState *ms, const RISCVBootInfo *info);
 void riscv_load_fdt(hwaddr fdt_addr, void *fdt);
 void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
                                hwaddr saddr,
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 5e2dfa091a13..4ac0b8ef6581 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -91,7 +91,7 @@ void riscv_boot_info_init_discontig_mem(RISCVBootInfo *info,
     info->ram_low_size = low_size;
 }
 
-vaddr riscv_calc_kernel_start_addr(RISCVBootInfo *info,
+vaddr riscv_calc_kernel_start_addr(const RISCVBootInfo *info,
                                    hwaddr firmware_end_addr) {
     if (info->is_32bit) {
         return QEMU_ALIGN_UP(firmware_end_addr, 4 * MiB);
@@ -151,7 +151,7 @@ char *riscv_find_firmware(const char *firmware_filename,
 }
 
 hwaddr riscv_find_and_load_firmware(MachineState *machine,
-                                    RISCVBootInfo *info,
+                                    const RISCVBootInfo *info,
                                     const char *default_machine_firmware,
                                     hwaddr *firmware_load_addr,
                                     symbol_fn_t sym_cb)
@@ -348,7 +348,7 @@ out:
  * The FDT is fdt_packed() during the calculation.
  */
 uint64_t riscv_compute_fdt_addr(hwaddr dram_base, hwaddr dram_size,
-                                MachineState *ms, RISCVBootInfo *info)
+                                MachineState *ms, const RISCVBootInfo *info)
 {
     int ret = fdt_pack(ms->fdt);
     hwaddr dram_end, temp;
-- 
2.47.3


