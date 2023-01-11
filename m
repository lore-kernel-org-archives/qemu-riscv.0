Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFWdq-0004el-9K
	for mharc-qemu-riscv@gnu.org; Wed, 11 Jan 2023 03:39:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWde-0004Yc-HS
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 03:39:15 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWdc-0005Nw-VB
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 03:39:14 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 p3-20020a05600c1d8300b003d9ee5f125bso7292789wms.4
 for <qemu-riscv@nongnu.org>; Wed, 11 Jan 2023 00:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QVteOLcdgywnZKReax1sWIW2ti3pURJ4pbMPZbXRnEg=;
 b=mi+ETGfUtjY4aRXHXyIPe8/GYdeyKH7gMz7JAghbCiM+M/petCIX8rXccLewBTkQJY
 /xR6FDmI+IOX373gnfR41CdFnwFwrmzkAEQmW6KUrxGnMIFMFII+9kK+86s5Md3B9j4g
 6a9mzEonmcvVRDDlt9EQlZzoYn5g51rocOvFH2jBSB2okRIH/k33LiwimdY+wPRZbMSU
 ejK2bsip6ISmhKIGHWQgAdXgUlTb9F4NvPNKPuXlBuYm8rBgxYnAoZQAnZV/5j6fku4T
 sxoUfdNHq6auIM9mZwMDW7YfGwA6RBrkjRcycwssIwDyovE9E+uXyPpgQGsQ1lVVomoX
 eBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QVteOLcdgywnZKReax1sWIW2ti3pURJ4pbMPZbXRnEg=;
 b=ccHRmOg/BVKWRcgjryUi+2teCdB3qb3DoUJqFO5gnpPNeN4ngVQlwcf55nOy03LKNN
 swW4D6fnEEhZyhpAfTXQGJp69xIm6Ulz6aUmN6pdDahuJfXz7xJl0mizIB32M/g/vCDT
 p600qRNGCAZRgd/5AhRVZray3XrIDdrTXBsYiUb2eJfAlIIkzre4yXGuNApRo2f9Z/t0
 TFGeKP5GgFWoPBBxsbUSuOeP/RvR8VXi9qnmkWC1JFENjFAllFkqx+2QdZdyWLFqMMz5
 XOPnPNP4v1GHiQCOFEzF9IRADTZCVUk4zL8uvIHvwCFFaj+J21H9jRS7M5tPDKUaJtQ5
 HcZA==
X-Gm-Message-State: AFqh2kr6+o21maV7I2AUWZ7ta/w/SdpKon2bKr4zu2jk1WAC9fmbCdrC
 iZ95UV+BWwK6U7ymyC/SE1R06g==
X-Google-Smtp-Source: AMrXdXuJdHbPsisPbdvVRDETb5IqtJaygQ472pbsFDxfyuHdAkPqAPrH3eYe9e+fwIbnR8p2InH4BA==
X-Received: by 2002:a05:600c:539a:b0:3d9:efe8:a424 with SMTP id
 hg26-20020a05600c539a00b003d9efe8a424mr7638806wmb.34.1673426351210; 
 Wed, 11 Jan 2023 00:39:11 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c4fcb00b003c6f3f6675bsm23898568wmq.26.2023.01.11.00.39.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Jan 2023 00:39:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/4] bulk: Replace TARGET_FMT_plx by HWADDR_PRIx
Date: Wed, 11 Jan 2023 09:39:05 +0100
Message-Id: <20230111083909.42624-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 11 Jan 2023 08:39:20 -0000

Since v1:
- Fix checkpatch style violations
- Use HWADDR_PRIx instead of HWADDR_FMT_plx (Zoltan)

Supersedes: <20230110212947.34557-1-philmd@linaro.org>
            "bulk: Rename TARGET_FMT_plx -> HWADDR_FMT_plx"

Philippe Mathieu-Daudé (4):
  hw: Remove hardcoded tabs (code style)
  bulk: Coding style fixes
  bulk: Replace TARGET_FMT_plx -> HWADDR_PRIx
  bulk: Prefix '0x' to hex values displayed with HWADDR_PRIx format

 accel/tcg/cputlb.c                  |   2 +-
 hw/arm/strongarm.c                  |  24 ++--
 hw/block/pflash_cfi01.c             |   5 +-
 hw/char/digic-uart.c                |   8 +-
 hw/char/etraxfs_ser.c               |   4 +-
 hw/core/loader.c                    |   8 +-
 hw/core/sysbus.c                    |   5 +-
 hw/display/cirrus_vga.c             |   4 +-
 hw/display/g364fb.c                 |   4 +-
 hw/display/vga.c                    |   8 +-
 hw/dma/etraxfs_dma.c                | 196 ++++++++++++++--------------
 hw/dma/pl330.c                      |  26 ++--
 hw/dma/xilinx_axidma.c              |   4 +-
 hw/dma/xlnx_csu_dma.c               |   4 +-
 hw/i2c/mpc_i2c.c                    |   4 +-
 hw/i386/multiboot.c                 |   9 +-
 hw/i386/xen/xen-hvm.c               |   9 +-
 hw/i386/xen/xen-mapcache.c          |  21 +--
 hw/i386/xen/xen_platform.c          |   4 +-
 hw/intc/arm_gicv3_dist.c            |   8 +-
 hw/intc/arm_gicv3_its.c             |  14 +-
 hw/intc/arm_gicv3_redist.c          |   8 +-
 hw/intc/exynos4210_combiner.c       |  20 +--
 hw/misc/auxbus.c                    |   3 +-
 hw/misc/ivshmem.c                   |   6 +-
 hw/misc/macio/mac_dbdma.c           |   4 +-
 hw/misc/mst_fpga.c                  | 162 ++++++++++++-----------
 hw/net/allwinner-sun8i-emac.c       |   4 +-
 hw/net/allwinner_emac.c             |   8 +-
 hw/net/fsl_etsec/etsec.c            |   4 +-
 hw/net/fsl_etsec/rings.c            |   4 +-
 hw/net/pcnet.c                      |   4 +-
 hw/net/rocker/rocker.c              |  26 ++--
 hw/net/rocker/rocker_desc.c         |   2 +-
 hw/net/xilinx_axienet.c             |   4 +-
 hw/net/xilinx_ethlite.c             |   6 +-
 hw/pci-bridge/pci_expander_bridge.c |   2 +-
 hw/pci-host/bonito.c                |  14 +-
 hw/pci-host/ppce500.c               |   4 +-
 hw/pci/pci_host.c                   |   4 +-
 hw/ppc/ppc4xx_sdram.c               |   2 +-
 hw/rtc/exynos4210_rtc.c             |   4 +-
 hw/sh4/sh7750.c                     |   4 +-
 hw/ssi/xilinx_spi.c                 |   4 +-
 hw/ssi/xilinx_spips.c               |   8 +-
 hw/timer/digic-timer.c              |   8 +-
 hw/timer/etraxfs_timer.c            |   3 +-
 hw/timer/exynos4210_mct.c           |   2 +-
 hw/timer/exynos4210_pwm.c           |   4 +-
 hw/virtio/virtio-mmio.c             |   4 +-
 hw/xen/xen_pt.c                     |   4 +-
 include/exec/hwaddr.h               |   1 -
 monitor/misc.c                      |   2 +-
 softmmu/memory.c                    |  19 +--
 softmmu/memory_mapping.c            |   4 +-
 softmmu/physmem.c                   |  10 +-
 target/i386/monitor.c               |   6 +-
 target/loongarch/tlb_helper.c       |   2 +-
 target/microblaze/op_helper.c       |   2 +-
 target/mips/tcg/sysemu/tlb_helper.c |   2 +-
 target/ppc/mmu-hash32.c             |  20 +--
 target/ppc/mmu-hash64.c             |  12 +-
 target/ppc/mmu_common.c             |  30 +++--
 target/ppc/mmu_helper.c             |   4 +-
 target/riscv/cpu_helper.c           |  10 +-
 target/riscv/monitor.c              |   2 +-
 target/sparc/ldst_helper.c          |   6 +-
 target/sparc/mmu_helper.c           |  13 +-
 target/tricore/helper.c             |   2 +-
 69 files changed, 430 insertions(+), 424 deletions(-)

-- 
2.38.1


