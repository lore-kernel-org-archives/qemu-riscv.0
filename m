Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57103D711B4
	for <qemu-riscv@archiver.kernel.org>; Wed, 20 Nov 2024 15:41:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tDmo4-0003bE-CP; Wed, 20 Nov 2024 10:39:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1tDmo2-0003Z8-Ej
 for qemu-riscv@nongnu.org; Wed, 20 Nov 2024 10:39:50 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1tDmo0-0005z2-RA
 for qemu-riscv@nongnu.org; Wed, 20 Nov 2024 10:39:50 -0500
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-724c50c832bso494667b3a.2
 for <qemu-riscv@nongnu.org>; Wed, 20 Nov 2024 07:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1732117187; x=1732721987; darn=nongnu.org;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2KZqQE/UUmVgsvRJGOS0j9UuW1/93sgKbbyM+lCyFz4=;
 b=YAb5WnmpSxkQhZSIaty2aVQ7h3gbL9voOs17wpPW50kp1bEj1p82TIL0JOzudBCXyd
 IOVX14gjku/uslFWLk9c+NabaSfLaRjuhKGXbNZI+m5CeRd6lVIRRULb7T+ilwYQ8OPj
 WkU6Qq20hbSAZBGi2ijdKGy5pjRvxVGYYvF6ZTepX00hCsvGRXn75Jtdf+VCUpVxDRsX
 XpDLAZihiZp0i/tCgqGQtjf0pvawcFnu+zxN+yJHDuEwr0TK6yv1PXduktibXiNxzLfX
 xLu492HgSAmxojNw7ainbCbT/VhBRlB08iSgW/zo8Kxm2Al0I1hUxUys57e4Qj7enUMI
 wNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732117187; x=1732721987;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2KZqQE/UUmVgsvRJGOS0j9UuW1/93sgKbbyM+lCyFz4=;
 b=q2nJSxHOtu9+bOg7i651xEjYm7pi/lzvks63cm5dE7D3RuMTGIa6ivfiOv5pa+v/uL
 P19GCYPctsvIzkaRya54M04ETjeTbwt9gw6EO3Fswb5OkuUEYEQODFb+I1Iv/ir4Fzjm
 d8mFAaJinJwtgYBc6Ypf5MKzL+4a/BBNqtgfBbAJ/SsUf0z4ysNhgD6myi/4aPXIKd11
 DJ1rQlBnnx22wCyYse31+SwtxOUbAh2jsTPxDceuOgB8tJnIOJW1zFhE8X69ofZ3lBsk
 CLtP4Zpwbfy3YhWlZoVx/UlOvFkNpVuTvcBRI5cOuOHommutnoe1Cz1N7SPhjcbib3HA
 oMxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxZQvKx8Q6YK3/wxHNF2AiBvfQZP7+3e9wu46/UDYrtZCjHq1/vq/gshm8rLTJ5/EA32cKqdzHIyBW@nongnu.org
X-Gm-Message-State: AOJu0YwIqdHSESCdWYqvXLgvzhrz5dPYEFa6k0ttoPZJNaYT3eEkKgCD
 yx66ocYjAgpEuxyMziGHENCfLn0aSKnYVy1dve4jYj+1lU32G/D6nZWbt8mSSkU=
X-Google-Smtp-Source: AGHT+IGF3bacYwqDii80+IvMeZTPV28U8Y7akDXQInprbO3IStychSVfUBDnR85ZGLeFPn4iQXO1Kw==
X-Received: by 2002:aa7:88c6:0:b0:71e:e4f:3e58 with SMTP id
 d2e1a72fcca58-724bede9bbbmr4335605b3a.17.1732117187509; 
 Wed, 20 Nov 2024 07:39:47 -0800 (PST)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724bef8da6asm1838903b3a.123.2024.11.20.07.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2024 07:39:47 -0800 (PST)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v4 3/3] hw/riscv: Add the checking if DTB overlaps to kernel
 or initrd
Date: Wed, 20 Nov 2024 23:39:35 +0800
Message-Id: <20241120153935.24706-4-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241120153935.24706-1-jim.shu@sifive.com>
References: <20241120153935.24706-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=jim.shu@sifive.com; helo=mail-pf1-x434.google.com
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

DTB is placed to the end of memory, so we will check if the start
address of DTB overlaps to the address of kernel/initrd.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 hw/riscv/boot.c         | 25 ++++++++++++++++++++++++-
 include/hw/riscv/boot.h |  3 +++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 81d27f935e..bc8074fec8 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -70,6 +70,7 @@ char *riscv_plic_hart_config_string(int hart_count)
 void riscv_boot_info_init(RISCVBootInfo *info, RISCVHartArrayState *harts)
 {
     info->kernel_size = 0;
+    info->initrd_size = 0;
     info->is_32bit = riscv_is_32bit(harts);
 }
 
@@ -213,6 +214,9 @@ static void riscv_load_initrd(MachineState *machine, RISCVBootInfo *info)
         }
     }
 
+    info->initrd_start = start;
+    info->initrd_size = size;
+
     /* Some RISC-V machines (e.g. opentitan) don't have a fdt. */
     if (fdt) {
         end = start + size;
@@ -309,6 +313,7 @@ uint64_t riscv_compute_fdt_addr(hwaddr dram_base, hwaddr dram_size,
     int ret = fdt_pack(ms->fdt);
     hwaddr dram_end, temp;
     int fdtsize;
+    uint64_t dtb_start, dtb_start_limit;
 
     /* Should only fail if we've built a corrupted tree */
     g_assert(ret == 0);
@@ -319,6 +324,17 @@ uint64_t riscv_compute_fdt_addr(hwaddr dram_base, hwaddr dram_size,
         exit(1);
     }
 
+    if (info->initrd_size) {
+        /* If initrd is successfully loaded, place DTB after it. */
+        dtb_start_limit = info->initrd_start + info->initrd_size;
+    } else if (info->kernel_size) {
+        /* If only kernel is successfully loaded, place DTB after it. */
+        dtb_start_limit = info->image_high_addr;
+    } else {
+        /* Otherwise, do not check DTB overlapping */
+        dtb_start_limit = 0;
+    }
+
     /*
      * A dram_size == 0, usually from a MemMapEntry[].size element,
      * means that the DRAM block goes all the way to ms->ram_size.
@@ -338,7 +354,14 @@ uint64_t riscv_compute_fdt_addr(hwaddr dram_base, hwaddr dram_size,
         temp = (dram_base < 3072 * MiB) ? MIN(dram_end, 3072 * MiB) : dram_end;
     }
 
-    return QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
+    dtb_start = QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
+
+    if (dtb_start_limit && (dtb_start < dtb_start_limit)) {
+        error_report("No enough memory to place DTB after kernel/initrd");
+        exit(1);
+    }
+
+    return dtb_start;
 }
 
 /*
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 06b51ed086..7d59b2e6c6 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -32,6 +32,9 @@ typedef struct RISCVBootInfo {
     hwaddr image_low_addr;
     hwaddr image_high_addr;
 
+    hwaddr initrd_start;
+    ssize_t initrd_size;
+
     bool is_32bit;
 } RISCVBootInfo;
 
-- 
2.17.1


