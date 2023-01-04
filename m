Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDBuD-0001aM-JZ
	for mharc-qemu-riscv@gnu.org; Wed, 04 Jan 2023 17:06:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBuB-0001Vp-L4
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 17:06:39 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBu8-0005fU-66
 for qemu-riscv@nongnu.org; Wed, 04 Jan 2023 17:06:39 -0500
Received: by mail-ej1-x62d.google.com with SMTP id u9so86132128ejo.0
 for <qemu-riscv@nongnu.org>; Wed, 04 Jan 2023 14:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KN4KqLlugVC+0veh/qHwh2dos/FPn9LDhOhs/UvtQDw=;
 b=z1BU4aoIPYdDRqTnlx0V3zv0CD9t+NMAhobtS9j6dghWzkl+GBC3imIxlMpvEMyTyU
 lH9DINmyyjI0M06yICDcJ0uuJfyxGMn6C6buPS+HRN243d7qRriWbRLUs8VQGni7kkJ4
 jsmxMl+qeS9DoEuv+rX6n/5MX7uVBrdRy33dmARiikb6K+I2xUVS44eVKFStxOZn7XQ4
 4AWA5tW0P5HYeFms0rGALBKAVKOI4O/Hyvtl5b3KCEfAsaJB/O3NTHvs/bH5U18E1E7a
 TLhTQ95AueMkRyXyfe82e94wv8pwaHGl30G0WfbMv71x1G5BHTcLXi5SWwnRZOeDA9rh
 WpJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KN4KqLlugVC+0veh/qHwh2dos/FPn9LDhOhs/UvtQDw=;
 b=wukSoshJR5rqPWPkPGB4UKDBoZ9uW/3OJw1Kq0bCRmXu53xIywWjTLJvm+xUJu4qYU
 ddnr1LnHiZGcUeB8JJ9rWkuVZmXJz3qtFf9JsMquUc044Ca2hM4wPilKcWyMxuQkxJyi
 RTnRBJPBelweHIps6uvJuJ0ur8l2olKmp572n0xA0wwIVu42LdVKDiv9dxVKXWvMutNl
 B28UcEZaGu/33p6IM9WH6T5CcrRucYKBEGRuj0FVF5u08LM3dtZupVMEKpMhsBr8TeY3
 oth9QUu0T6uWRz5xcVUe9hOginT4klSn6n4ZP7jer1Cbt3fqvgJnR0X0o4zkEbMQJAJh
 xnxQ==
X-Gm-Message-State: AFqh2krqeucYp6cJrjAKcYBNzdCiOZW/g/F61kjH81PbB3XlO+6MZP+A
 Pj/pCbLDnoJY1dNrQpY4NZIKQg==
X-Google-Smtp-Source: AMrXdXvMFX4IDRqLxsTznid+IJtag64ozPayTo6+BU6tYMCWpu4S/A12KD1SQSXRgAWs02blwKTeNA==
X-Received: by 2002:a17:907:d387:b0:7c1:6fd3:1ef3 with SMTP id
 vh7-20020a170907d38700b007c16fd31ef3mr41602526ejc.33.1672869995411; 
 Wed, 04 Jan 2023 14:06:35 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 co5-20020a0564020c0500b00483dd234ac6sm12958847edb.96.2023.01.04.14.06.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 14:06:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Mark Burton <mburton@qti.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 12/20] hw/mips: Open-code pflash_cfi01_register()
Date: Wed,  4 Jan 2023 23:04:41 +0100
Message-Id: <20230104220449.41337-13-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104220449.41337-1-philmd@linaro.org>
References: <20230104220449.41337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 04 Jan 2023 22:06:40 -0000

pflash_cfi01_register() hides an implicit sysbus mapping of
MMIO region #0. This is not practical in a heterogeneous world
where multiple cores use different address spaces. In order to
remove to remove pflash_cfi01_register() from the pflash API,
open-code it as a qdev creation call followed by an explicit
sysbus mapping.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/malta.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 43fbb97799..e690f13bdb 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1222,7 +1222,6 @@ void mips_malta_init(MachineState *machine)
     const char *kernel_cmdline = machine->kernel_cmdline;
     const char *initrd_filename = machine->initrd_filename;
     char *filename;
-    PFlashCFI01 *fl;
     MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *ram_low_preio = g_new(MemoryRegion, 1);
     MemoryRegion *ram_low_postio;
@@ -1286,12 +1285,11 @@ void mips_malta_init(MachineState *machine)
 
     /* Load firmware in flash / BIOS. */
     dinfo = drive_get(IF_PFLASH, 0, fl_idx);
-    fl = pflash_cfi01_register(FLASH_ADDRESS, "mips_malta.bios",
-                               FLASH_SIZE,
-                               dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                               65536,
-                               4, 0x0000, 0x0000, 0x0000, 0x0000, be);
-    dev = DEVICE(fl);
+    dev = pflash_cfi01_create("mips_malta.bios", FLASH_SIZE,
+                              dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
+                              65536, 4,
+                              0x0000, 0x0000, 0x0000, 0x0000, be);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, FLASH_ADDRESS);
     bios = pflash_cfi01_get_memory(dev);
     fl_idx++;
     if (kernel_filename) {
-- 
2.38.1


