Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kXe32-0005bR-9z
	for mharc-qemu-riscv@gnu.org; Wed, 28 Oct 2020 01:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kXe2z-0005V0-Mf; Wed, 28 Oct 2020 01:30:57 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:39216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kXe2y-0000jr-2h; Wed, 28 Oct 2020 01:30:57 -0400
Received: by mail-pf1-x442.google.com with SMTP id e15so2258406pfh.6;
 Tue, 27 Oct 2020 22:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XybP5xo4qhD8pmZoNkGDTq4nka9pB/45dbl0jm7hTcE=;
 b=rwvHIMb+jQmHAbC/mmzpp1QjH/Wgp0exoRb9q0YL8ObrkizvxGIz1Nkz89RyosUdPT
 AemxRnj7wyJEgixbRsS4FUkGWLjEaLk/GfLF8SJznOM3WjfCxMIpxccZj31WuZt3KdTL
 peoyM/nsadH6Gxl22oZ8Oh+KVjnuNEcCrPMZVNhifcGYuuH7VOFxLuqxslD7ohbuekSE
 kMS3JAUprFQp//5FYNfFe3HCfBuytpA5xyWPi7ZWPQ2cMGre/KyVanyN+wiNHzgtpxco
 KZi6G5fpiAk/SXgfK9pC2RcCyFwxYvmgOfKFWLDKbO6TI6oeF1R4SjnTLeYAy6l2CZz9
 BiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XybP5xo4qhD8pmZoNkGDTq4nka9pB/45dbl0jm7hTcE=;
 b=qAI/cS7IPrgcuKRSYMsexRH3jsVFHWEbcGRWDa7elYx+PP1tdSeY/pBwd9vwrTTCFA
 DiYwiOhtTsSqVUWV1Yev2FAXNy92Qp2vfQnJzx6QjPDsmMBbet/fhN1WDY3VjmxBFGiV
 Cj97qU2Id9HoEUdKtqcHIWKVhFAOowY/MQ3almE1M4oFkdmU/x8W+dNZEHY4ecSaYLLN
 oiAIQuz5MQLLTkRC17TPqjMr//mNVxP2hQivWHRvzK9tEJSEz+w/zfJKTKz1ktGsXLMJ
 WBqP0+yjzqdAvNtXpE1AHTIpUeL62Wqp/xbfX/pSXOTb61ILQTa/PRC0qFLwLafzVgBR
 F1Xg==
X-Gm-Message-State: AOAM533FmbUZTFr6luet9kWwVM5OcKxnCJlsDg44Bof06Bgz19a+7Lba
 eJUKcISVzAYhu80NIjtOVXk=
X-Google-Smtp-Source: ABdhPJyDWu07WXxcw0JVjxl2C5q4uUCQ2V28paxYmv57bbbz+ijWrqvdioaq4vKEwasPHPWDJnHBpw==
X-Received: by 2002:a63:530c:: with SMTP id h12mr5036918pgb.424.1603863054654; 
 Tue, 27 Oct 2020 22:30:54 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id 9sm5031887pjs.1.2020.10.27.22.30.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Oct 2020 22:30:54 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Ivan Griffin <ivan.griffin@emdalo.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 10/10] hw/riscv: microchip_pfsoc: Hook the I2C1 controller
Date: Wed, 28 Oct 2020 13:30:10 +0800
Message-Id: <1603863010-15807-11-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603863010-15807-1-git-send-email-bmeng.cn@gmail.com>
References: <1603863010-15807-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x442.google.com
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
X-List-Received-Date: Wed, 28 Oct 2020 05:30:58 -0000

From: Bin Meng <bin.meng@windriver.com>

The latest SD card image [1] released by Microchip ships a Linux
kernel with built-in PolarFire SoC I2C driver support. The device
tree file includes the description for the I2C1 node hence kernel
tries to probe the I2C1 device during boot.

It is enough to create an unimplemented device for I2C1 to allow
the kernel to continue booting to the shell.

[1] ftp://ftpsoc.microsemi.com/outgoing/core-image-minimal-dev-icicle-kit-es-sd-20201009141623.rootfs.wic.gz

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

(no changes since v1)

 hw/riscv/microchip_pfsoc.c         | 6 ++++++
 include/hw/riscv/microchip_pfsoc.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 5e31b84..d13d6ba 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -113,6 +113,7 @@ static const struct MemmapEntry {
     [MICROCHIP_PFSOC_MMUART2] =         { 0x20102000,     0x1000 },
     [MICROCHIP_PFSOC_MMUART3] =         { 0x20104000,     0x1000 },
     [MICROCHIP_PFSOC_MMUART4] =         { 0x20106000,     0x1000 },
+    [MICROCHIP_PFSOC_I2C1] =            { 0x2010b000,     0x1000 },
     [MICROCHIP_PFSOC_GEM0] =            { 0x20110000,     0x2000 },
     [MICROCHIP_PFSOC_GEM1] =            { 0x20112000,     0x2000 },
     [MICROCHIP_PFSOC_GPIO0] =           { 0x20120000,     0x1000 },
@@ -343,6 +344,11 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
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
index db77e9c..51d4463 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -97,6 +97,7 @@ enum {
     MICROCHIP_PFSOC_MMUART2,
     MICROCHIP_PFSOC_MMUART3,
     MICROCHIP_PFSOC_MMUART4,
+    MICROCHIP_PFSOC_I2C1,
     MICROCHIP_PFSOC_GEM0,
     MICROCHIP_PFSOC_GEM1,
     MICROCHIP_PFSOC_GPIO0,
-- 
2.7.4


