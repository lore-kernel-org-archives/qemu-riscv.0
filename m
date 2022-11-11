Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1otaPL-0003vZ-6u
	for mharc-qemu-riscv@gnu.org; Fri, 11 Nov 2022 15:13:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1otaPJ-0003vI-VG
 for qemu-riscv@nongnu.org; Fri, 11 Nov 2022 15:13:45 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1otaPI-0004Cq-7y
 for qemu-riscv@nongnu.org; Fri, 11 Nov 2022 15:13:45 -0500
Received: by mail-pg1-x52e.google.com with SMTP id 78so5179935pgb.13
 for <qemu-riscv@nongnu.org>; Fri, 11 Nov 2022 12:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/hIUxVxO8TjvOlxq4eDg++WCGB24oDt5Olj4d0qqwrY=;
 b=n3sMmr8a4bpR3jx3xhGJ7B8Mm8DHYDie6Hx5EowziyDL3hS5qKFzi2/VRdQySb4wgD
 C5BdEhexss4wR3s59iXuobf4nLICU6Crx/kwG2Ry51x914l9GJ25Uo8JKE82hRg3kjUO
 rIDGg90xjEB0mXeN1bvvKsyNXUdv/M8wPsQmE1a6LswarCYSy2oDPQMvGiiL6r76Ql9T
 AtbtCEACpgoOyd0w3dw5b7ZkQ/OYW8vEFcn5Ryv6NK/UwB/gcbLFj3u9MUZ9I5ZfKmJq
 DuqCFJzy78UmVcHgUSOBD60uafU642pprvs5yiw+9bhJPfAocGAajbqooaO78OXAibr2
 z2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/hIUxVxO8TjvOlxq4eDg++WCGB24oDt5Olj4d0qqwrY=;
 b=EGjaz0FSazTzINqgb0b+CZAZm2umGzN4dybx2R4CT5+kAIYk2ZM+CZSpi8/lI4h5cI
 YbXv2RUtkWhcRtCVfjMg93m4hkQza1PBgC1V6gDXDz6tNNZ4aWBdzilzfNr7vTnCje+R
 i2YjLaUbDXEIRXIUaXN/Vw9aqqpHMDb/ZPhJcK70D/BDEuMe5bjwkb6qNPAqsuHyKPyV
 kVYGs1s8pI3mI4cj6ffp+FTaA7pqxv/7T1ppajKK89YNxcFDDRb63azMIw/3xpRaMoN5
 t1dkLk909nOimGJvUrTd6EiHNc5+MHUB7yH+BoLhpxcF2vsXj2WtevW+KykK++TNjmag
 cW8A==
X-Gm-Message-State: ANoB5pm4y44HpkRbw65heIq34Me/jABu7vQs7UNPQCE4pyHTanGr6wl3
 C6HWn+LNGb3Dm7Ccc+VEuHyoXg==
X-Google-Smtp-Source: AA0mqf7iCrw8tEQkVYVpOPjqpZlQGpR8P1ZYTlljFzh80HFnkqmUAgNq9qx++8AjFceFL0vIVxng1Q==
X-Received: by 2002:a05:6a00:1488:b0:53b:f208:d7db with SMTP id
 v8-20020a056a00148800b0053bf208d7dbmr4240134pfu.42.1668197622002; 
 Fri, 11 Nov 2022 12:13:42 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 h7-20020aa796c7000000b0056c410fd03fsm1979915pfq.40.2022.11.11.12.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 12:13:41 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <apatel@ventanamicro.com>, qemu-riscv@nongnu.org
Subject: [PATCH] hw/riscv: virt: Remove the redundant ipi-id property
Date: Fri, 11 Nov 2022 12:13:37 -0800
Message-Id: <20221111201337.3320349-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 11 Nov 2022 20:13:46 -0000

The imsic DT binding has changed and no longer require an ipi-id.
The latest IMSIC driver dynamically allocates ipi id if slow-ipi
is not defined.

Get rid of the unused dt property which may lead to confusion.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 hw/riscv/virt.c         | 2 --
 include/hw/riscv/virt.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index a5bc7353b412..0bc0964e42a8 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -546,8 +546,6 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
         riscv_socket_count(mc) * sizeof(uint32_t) * 4);
     qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
         VIRT_IRQCHIP_NUM_MSIS);
-    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "riscv,ipi-id",
-        VIRT_IRQCHIP_IPI_MSI);
     if (riscv_socket_count(mc) > 1) {
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bits",
             imsic_num_bits(imsic_max_hart_per_socket));
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index be4ab8fe7f71..62513e075c47 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -93,7 +93,6 @@ enum {
 
 #define VIRT_PLATFORM_BUS_NUM_IRQS 32
 
-#define VIRT_IRQCHIP_IPI_MSI 1
 #define VIRT_IRQCHIP_NUM_MSIS 255
 #define VIRT_IRQCHIP_NUM_SOURCES VIRTIO_NDEV
 #define VIRT_IRQCHIP_NUM_PRIO_BITS 3
-- 
2.25.1


