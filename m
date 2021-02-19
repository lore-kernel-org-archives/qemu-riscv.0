Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lD7sf-0000KZ-3R
	for mharc-qemu-riscv@gnu.org; Fri, 19 Feb 2021 10:39:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lD7sa-0000IP-VD; Fri, 19 Feb 2021 10:39:42 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:40333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lD7sW-0008Oc-Cp; Fri, 19 Feb 2021 10:39:40 -0500
Received: by mail-ej1-x636.google.com with SMTP id u20so13474251ejb.7;
 Fri, 19 Feb 2021 07:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sWVSQN365y4RrwajNe3ilvA3SGaPN96YcYwIQ7DCO9k=;
 b=orfUTAaAHV/l+d5pCEp0F4a+d/sndvF/WAjPKlj9DMqAoOaZ9XgYGAsvnZUpguRUFL
 RaggNViwAceiSGNhaTp6iGIGzdn2YPhAY4EPieJV04z13Nx9BO6O+qV4okTkkg5JBRkE
 IP0WzO+NXT8JZrlv9Dtr6iuZwqf8Zugf/UYlnPXmEC85+nkwyCRqocuN2Rt8A+zdxWD7
 02eddxZM50zgwmxM1ajepcrALitVvj+Ki75d5nCdZvTm6sCXQaHXIKrZcnCuefuYAlW1
 3GsFpTPXR9m2JyNHMrys1JrlPwX5BNRfQcnYIwKsfbv+lE6evCEa1vDJ5c12Q3wlqF4b
 uK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=sWVSQN365y4RrwajNe3ilvA3SGaPN96YcYwIQ7DCO9k=;
 b=CozK5SDtmb3334D/sfGab/zo5fr0cUMFBD9AI8wdEKhj6yvtSkILmfxl/I2OJNXqw3
 qvLfjpU6G+3G1/7ybdZvQYGof3ms3PddZL4CsfGl9zVfe5Xo3DTnDV6bjZ3N5lTbtJTJ
 tMDN/+dqAWgWU/ecGEPDsYbi9PrMwSWmmGN5oDrDA/BM6YfSGUYOVsBbGVR1UIM/xFY1
 fQDLWq1/+7r43sx4VWP1FSaCJwqJB+jVqxkbUrjjxhlyXK+Vvh3UyT/HNGl5OnRZ/fQ2
 LtJ435ibsgKkMKS7AAOWQSDnU6J06jEDoYufOaYvcloArpvKjqD7L3mdBwWXZYk8pgnT
 puRw==
X-Gm-Message-State: AOAM530gDvQCrFZo912YXYaXnM6jxHfKs+n4pediDrVbObcG4HMlcslB
 6qvUc/j4Ppm3QhllAmM5vgw=
X-Google-Smtp-Source: ABdhPJwdDp8QkLJtuqYk/soiHIV31Dpw8/vR2aNld9kKe8utJXFvNJqYLiChSsp5sHDjMqFVjMYQdw==
X-Received: by 2002:a17:906:9147:: with SMTP id
 y7mr7982366ejw.243.1613749174795; 
 Fri, 19 Feb 2021 07:39:34 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id t9sm4580314ejc.51.2021.02.19.07.39.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Feb 2021 07:39:34 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 2/4] hw/riscv: virt: Drop the 'link_up' parameter of
 gpex_pcie_init()
Date: Fri, 19 Feb 2021 23:39:13 +0800
Message-Id: <1613749155-84250-3-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613749155-84250-1-git-send-email-bmeng.cn@gmail.com>
References: <1613749155-84250-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Feb 2021 15:39:42 -0000

From: Bin Meng <bin.meng@windriver.com>

`link_up` is never used in gpex_pcie_init(). Drop it.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v1)

 hw/riscv/virt.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index cfd52bc..1d05bb3 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -449,7 +449,7 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
                                           hwaddr ecam_base, hwaddr ecam_size,
                                           hwaddr mmio_base, hwaddr mmio_size,
                                           hwaddr pio_base,
-                                          DeviceState *plic, bool link_up)
+                                          DeviceState *plic)
 {
     DeviceState *dev;
     MemoryRegion *ecam_alias, *ecam_reg;
@@ -669,12 +669,12 @@ static void virt_machine_init(MachineState *machine)
     }
 
     gpex_pcie_init(system_memory,
-                         memmap[VIRT_PCIE_ECAM].base,
-                         memmap[VIRT_PCIE_ECAM].size,
-                         memmap[VIRT_PCIE_MMIO].base,
-                         memmap[VIRT_PCIE_MMIO].size,
-                         memmap[VIRT_PCIE_PIO].base,
-                         DEVICE(pcie_plic), true);
+                   memmap[VIRT_PCIE_ECAM].base,
+                   memmap[VIRT_PCIE_ECAM].size,
+                   memmap[VIRT_PCIE_MMIO].base,
+                   memmap[VIRT_PCIE_MMIO].size,
+                   memmap[VIRT_PCIE_PIO].base,
+                   DEVICE(pcie_plic));
 
     serial_mm_init(system_memory, memmap[VIRT_UART0].base,
         0, qdev_get_gpio_in(DEVICE(mmio_plic), UART0_IRQ), 399193,
-- 
2.7.4


