Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4512D3C933
	for <qemu-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 04:10:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t2jkE-0007Nu-GX; Mon, 21 Oct 2024 00:10:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1t2jjz-0007Ld-3j
 for qemu-riscv@nongnu.org; Mon, 21 Oct 2024 00:10:00 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1t2jjx-0004EP-AA
 for qemu-riscv@nongnu.org; Mon, 21 Oct 2024 00:09:58 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-20c77459558so33787095ad.0
 for <qemu-riscv@nongnu.org>; Sun, 20 Oct 2024 21:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1729483795; x=1730088595; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OwVJe7wl6Df047z4n/QoSabetufigoEzxYrd+cn69aw=;
 b=VmyvRcgmf6B5iVq3QYy+SKUnuj4INlSXnBVUPne66WgnCWFWPuPjh6peclSPAsp9Qk
 bso5OgQJPbLEzDCfJIzojuAxA8++QUfKuZ8Dk+11kJALmGfK6nVLiR8xGg22DNJtmKwn
 I5nY4jmkZrNxqw75yMrrnksPRuyvknf5VTii5+E+0cNcJggUp9PmIpxp34KcrcfXldAg
 Fm5Gg/InOvDl5z3nlnVMfzoKkizUjnisqBfuXKAbZlYmfe3TAHAngD+P1EytFwR4efMY
 zHEODfU27f5o/N8qepVswtMqdes1AFZzpZtk2TvHrJHrbrBbfXkV9g6pGVxmfcK97AIA
 kVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729483795; x=1730088595;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OwVJe7wl6Df047z4n/QoSabetufigoEzxYrd+cn69aw=;
 b=oE018dheT2yuVyF3WjpynzIm5SdLytfp6i9gncGxDuya3AO7m4M5daD0WkjY1H+PL4
 PhlDCTYtxsDpuGuEljAkDPE51LIN4GHUimE9XjuvsHHr+PimBTZuO5QOSMSpRxGfkSLk
 Esizq0/c82dikHt2dGJW635KCDokmf4RLSAoBLPkZ+oAv0OacPYzzdsyZWPR8dCKL9Eg
 1sHRgZmjUzLfDtCFPJrL6SQXUPMxl0znWgwlDmH2SrbH6tvJbwvNUd4mMddAgXo1no23
 LUn7JqfzbzdlFMaiS8fDJj34+olUdqT+b22uqvKyI5Kq9MHfksHOZuvln9xS7dEV9I23
 LIrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK+mLjLRhM46rvZxf2FTFKwawbp620GF31aJzVCuL4ss5vavZ1ZDT+5bzFJchCSSAczOriHgkKYl2A@nongnu.org
X-Gm-Message-State: AOJu0YwJQGF9AhM63oHhNrPX3Y1fbvA9qhQUxZwbuDkJdcH+wHUwN7wb
 V0JTMjS0NPVum27c4a9HVxX5RiSzj8fvUUZQ6iuZZ+s04r669HlvDOljUnL4DGk=
X-Google-Smtp-Source: AGHT+IEYScQBVVlOFS2dVqmQWINMu2ecqVajApJTE975BxkebBmnPbcyBq5J1gXMVMe85A0RVjEVHg==
X-Received: by 2002:a17:902:f9cc:b0:20c:9ecd:11c2 with SMTP id
 d9443c01a7336-20e5a95025amr125265865ad.55.1729483794962; 
 Sun, 20 Oct 2024 21:09:54 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20e7f0dfc09sm16863485ad.236.2024.10.20.21.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Oct 2024 21:09:54 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>
Subject: [PATCH 2/2] hw/riscv: Support different address-cells for initrd
Date: Mon, 21 Oct 2024 12:09:42 +0800
Message-Id: <20241021040942.400-3-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241021040942.400-1-jim.shu@sifive.com>
References: <20241021040942.400-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x633.google.com
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

The cells of 'initrd-start/end' should follow the '#address-cell'.
QEMU API could support 1 and 2 cells.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 hw/riscv/boot.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index ad45bd7a6a..76b099c696 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -182,6 +182,7 @@ static void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
     void *fdt = machine->fdt;
     hwaddr start, end;
     ssize_t size;
+    uint32_t acells;
 
     g_assert(filename != NULL);
 
@@ -209,9 +210,18 @@ static void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
 
     /* Some RISC-V machines (e.g. opentitan) don't have a fdt. */
     if (fdt) {
+        acells = qemu_fdt_getprop_cell(fdt, "/", "#address-cells",
+                                       NULL, NULL);
+        if (acells == 0) {
+            error_report("dtb file invalid (#address-cells 0)");
+            exit(1);
+        }
+
         end = start + size;
-        qemu_fdt_setprop_u64(fdt, "/chosen", "linux,initrd-start", start);
-        qemu_fdt_setprop_u64(fdt, "/chosen", "linux,initrd-end", end);
+        qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,initrd-start",
+                                     acells, start);
+        qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,initrd-end",
+                                     acells, end);
     }
 }
 
-- 
2.17.1


