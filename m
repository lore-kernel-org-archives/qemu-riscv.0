Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kXPoE-000340-Rw
	for mharc-qemu-riscv@gnu.org; Tue, 27 Oct 2020 10:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kXPoC-0002za-PR; Tue, 27 Oct 2020 10:18:44 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:41013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kXPoA-0007j9-Q0; Tue, 27 Oct 2020 10:18:44 -0400
Received: by mail-pl1-x643.google.com with SMTP id w11so822339pll.8;
 Tue, 27 Oct 2020 07:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sY88nsbmTjx5ePHAkYyzlMFFutII/gV5c/TR9sne5r8=;
 b=Iik8VqTCtAInWlaBOFgDKgslRydkXEC78dFqq0zJLk/vpyfLvoNWRGBE3uopvxuzxa
 zTI1kwTVTQIBwAbZLDTvlXVvp3KinPmAh9QFVCblH1/LKkM0X7yny/bCP6EoKDUYFExt
 V4D9KWF3RlUznh1Mzs7GD8doB8XOCqBM1PYXAk2BGnMRvcyc9WkRNh0LHw7DXd3DzJze
 8ofyWevlbhY1q5k49L3dNe07/AlTml1YYB7hYe+YdXRppgKNHj899PEtcLX2Vead0WNC
 z5zuW+HXViMjBz0sLLa2xM0ef+2JpetM1EGN69lY+zmARgmgAVpeKTlZX+PBnbhcy0BL
 uBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sY88nsbmTjx5ePHAkYyzlMFFutII/gV5c/TR9sne5r8=;
 b=lnarzErGVYdbEOlRpxGQ8sd8XIAiTis5Ou4bEG+/K0EbKM3coQe7jdyU5GI2YYBTub
 uvBo/uNANCZ2oIJTlulpvOaMF3ZsIEESc8EFPmWSoFy2eFToiIfcxJEvaZ3XxAqm7b91
 OAPdH+Ss5wYYNciLJAa+juXnddXvG8d5l1hTwCph8Dgf7a5mjpRfoP6whFCb3HUAJme8
 xbRm6oZTeuJh0uqrBKMlh0J6iO76+CiKjxXoSHBczjko07jXvFd+9JHywEaiB+MO+w8+
 OtV6XJ7cUi7OB7NN+epyHKAz0PoYs9FW+MdCc9REof3v4PlBBAGHC7n+YEROCrU8CDiO
 6nrg==
X-Gm-Message-State: AOAM530PTMcMpbil2BjJDdDF+KPptzMoZtJ5KQJGkiKLXf0haVPxsEvU
 /8fk0pj8lIRLlImWPLaX5iM=
X-Google-Smtp-Source: ABdhPJxWq3trOUfP3vk9eT1wrAcKaaBAa0KGZixUAf2Ngru2noZgBlb3XhcICrSyTZH+48hptXwVNA==
X-Received: by 2002:a17:902:7c86:b029:d5:f680:f756 with SMTP id
 y6-20020a1709027c86b02900d5f680f756mr2549572pll.39.1603808321065; 
 Tue, 27 Oct 2020 07:18:41 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id mn15sm1600297pjb.21.2020.10.27.07.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 07:18:40 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Ivan Griffin <ivan.griffin@emdalo.com>, Bin Meng <bin.meng@windriver.com>
Subject: [RESEND PATCH 9/9] hw/riscv: microchip_pfsoc: Hook the I2C1 controller
Date: Tue, 27 Oct 2020 22:17:40 +0800
Message-Id: <20201027141740.18336-10-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027141740.18336-1-bmeng.cn@gmail.com>
References: <20201027141740.18336-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Tue, 27 Oct 2020 14:18:45 -0000

From: Bin Meng <bin.meng@windriver.com>

The latest SD card image [1] released by Microchip ships a Linux
kernel with built-in PolarFire SoC I2C driver support. The device
tree file includes the description for the I2C1 node hence kernel
tries to probe the I2C1 device during boot.

It is enough to create an unimplemented device for I2C1 to allow
the kernel to continue booting to the shell.

[1] ftp://ftpsoc.microsemi.com/outgoing/core-image-minimal-dev-icicle-kit-es-sd-20201009141623.rootfs.wic.gz

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

 hw/riscv/microchip_pfsoc.c         | 6 ++++++
 include/hw/riscv/microchip_pfsoc.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index c595c9c967..4e878c2836 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -94,6 +94,7 @@ static const struct MemmapEntry {
     [MICROCHIP_PFSOC_MMUART2] =         { 0x20102000,     0x1000 },
     [MICROCHIP_PFSOC_MMUART3] =         { 0x20104000,     0x1000 },
     [MICROCHIP_PFSOC_MMUART4] =         { 0x20106000,     0x1000 },
+    [MICROCHIP_PFSOC_I2C1] =            { 0x2010b000,     0x1000 },
     [MICROCHIP_PFSOC_GEM0] =            { 0x20110000,     0x2000 },
     [MICROCHIP_PFSOC_GEM1] =            { 0x20112000,     0x2000 },
     [MICROCHIP_PFSOC_GPIO0] =           { 0x20120000,     0x1000 },
@@ -324,6 +325,11 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
         qdev_get_gpio_in(DEVICE(s->plic), MICROCHIP_PFSOC_MMUART4_IRQ),
         serial_hd(4));
 
+    /* I2C1 */
+    create_unimplemented_device("microchip.pfsoc.i2c1",
+        memmap[MICROCHIP_PFSOC_I2C1].base,
+        memmap[MICROCHIP_PFSOC_I2C1].size);
+
     /* GEMs */
 
     nd = &nd_table[0];
diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
index dc05688d94..74ae789c03 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -96,6 +96,7 @@ enum {
     MICROCHIP_PFSOC_MMUART2,
     MICROCHIP_PFSOC_MMUART3,
     MICROCHIP_PFSOC_MMUART4,
+    MICROCHIP_PFSOC_I2C1,
     MICROCHIP_PFSOC_GEM0,
     MICROCHIP_PFSOC_GEM1,
     MICROCHIP_PFSOC_GPIO0,
-- 
2.25.1


