Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oVUTi-0001cx-IG
	for mharc-qemu-riscv@gnu.org; Tue, 06 Sep 2022 05:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVUTd-0001WJ-Uj
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 05:02:39 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:44927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oVUTc-00018u-88
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 05:02:37 -0400
Received: by mail-pg1-x531.google.com with SMTP id c24so10042995pgg.11
 for <qemu-riscv@nongnu.org>; Tue, 06 Sep 2022 02:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=N3yZnnmCzzhalF1IzHkzxM7TrD4sWxNKryRCUa4tAr4=;
 b=UfkkTzibWEqs7ugIcV0pje/UhNlrZ9F4M99Ldi9ysXvhucPuUV9lH4h88B+QUBSFMk
 fPm94JiZUzumfML7u7Gn7byCzs0kVSbBPrsZZui9N8f39UbeGPyw3h2fOprZoPV6W95k
 QJMP9w2CaQOS9laS0InwLfUb3qBeO5FZmBb6hgicJHGFST/3j7gPlebehyIZShMFjUk0
 ASC/tZdm87PRK0hYsSNeoNPo9WwMErf2aynLGYuxsnUvilIcc94sNkOmFa0pAW+BTtMS
 Tgd3j1DiNPkbCgZpFPb59UdDM5rX4gpC2wbrgyNXS3JJPGNwisdAag3MKpyG8KwcSgeO
 oNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=N3yZnnmCzzhalF1IzHkzxM7TrD4sWxNKryRCUa4tAr4=;
 b=F3xWky6eTxCTOoejh5OZ0xpiH459C0fAK9M1OY0mL2tpjXqYjeT205TRFx42xVleBa
 h7CiHZgN1VEHI7OTy19L6gC4gAlrCi7k346uqji6N0GFHB7P4lPjLc37R7VFWy037d7Y
 cI8U23R2qznnhLU/apWnnaVw+rxBS1IfZwjGUFOIRIaHzAEUIiTpKPUurTQmvhGZ9d0p
 8rOEVtPrfN9Shc/kH5qQ1aB8bfJTSyQh8gTcwhtNZU17KsltL5N1KNa/Pul62jJaV5Ci
 PCXFJHWdFoWuo+v7/bfzR+JqV6wsBgGuIsYPAHxiRcn82xSUa0lQtQj0yImdmsVvSajM
 4nNg==
X-Gm-Message-State: ACgBeo1SJT9ygq1VfbdLwbObiZUn8gW5lHM7jKG3viCkhXNFYu/C/V6C
 f2aiVUO1K9q0NMxvKRp9xk90JQ==
X-Google-Smtp-Source: AA6agR6gMnIIcUUXBd7P3PQ0vgzIksp8hOSTiy95oEEY4Cgp0TE1hGYP38Jlraa9HS9iOSWO6My/TQ==
X-Received: by 2002:a65:6d87:0:b0:42c:5a17:15c8 with SMTP id
 bc7-20020a656d87000000b0042c5a1715c8mr32414552pgb.409.1662454954977; 
 Tue, 06 Sep 2022 02:02:34 -0700 (PDT)
Received: from localhost.localdomain ([49.206.11.92])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a17090a2f8200b001fabcd994c1sm11987315pjd.9.2022.09.06.02.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 02:02:34 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V4 2/3] hw/riscv: virt: Move create_fw_cfg() prior to loading
 kernel
Date: Tue,  6 Sep 2022 14:32:18 +0530
Message-Id: <20220906090219.412517-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906090219.412517-1-sunilvl@ventanamicro.com>
References: <20220906090219.412517-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x531.google.com
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
X-List-Received-Date: Tue, 06 Sep 2022 09:02:40 -0000

To enable both -kernel and -pflash options, the fw_cfg needs to be
created prior to loading the kernel.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/riscv/virt.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index ff8c0df5cd..b6bbf03f61 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1251,6 +1251,13 @@ static void virt_machine_done(Notifier *notifier, void *data)
                                     RISCV64_BIOS_BIN, start_addr, NULL);
     }
 
+    /*
+     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
+     * tree cannot be altered and we get FDT_ERR_NOSPACE.
+     */
+    s->fw_cfg = create_fw_cfg(machine);
+    rom_set_fw(s->fw_cfg);
+
     if (machine->kernel_filename) {
         kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
                                                          firmware_end_addr);
@@ -1284,13 +1291,6 @@ static void virt_machine_done(Notifier *notifier, void *data)
         start_addr = virt_memmap[VIRT_FLASH].base;
     }
 
-    /*
-     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
-     * tree cannot be altered and we get FDT_ERR_NOSPACE.
-     */
-    s->fw_cfg = create_fw_cfg(machine);
-    rom_set_fw(s->fw_cfg);
-
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
                                    machine->ram_size, machine->fdt);
-- 
2.25.1


