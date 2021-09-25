Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mU7p2-0005jO-31
	for mharc-qemu-riscv@gnu.org; Sat, 25 Sep 2021 09:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU7ot-0005ey-Lx; Sat, 25 Sep 2021 09:34:27 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU7os-0000HP-30; Sat, 25 Sep 2021 09:34:23 -0400
Received: by mail-wr1-x433.google.com with SMTP id t8so36107829wrq.4;
 Sat, 25 Sep 2021 06:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=614XFzlTEarTRy3LGVUK4v93mZwN/uZLaywbdLBpLD4=;
 b=Tq5xiyopZSoBQTEKkjZaHU+1BqPjUQrcHksLvyWg5E0XfgqoP8tT64SHTWuIVEWOuF
 hQqvwTtByOXTZjeOOScHyQhD2qtDlA872IvjSfxM8Fqfjx3nN6ID3AIK8A2qWzhtJ2LA
 Ap8qjF2sMzL6nrWJYqv9bMFfN6nBvYtTcJGrTC0/5KGm59w9ufWvHGsHP3wA+hFgMp97
 jlevRe2jDLtTLlLwC2pAdK1rApuSwClh5Y7gMZJWD1uZXacllD/kKcH+2VhAOJAR45NQ
 7RAk3TkofTXBJ52B/CSA8lpZ+E/d5DqLx76zvApRxi+vwYn3/ZifIl5vAGB07S7UkViQ
 U2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=614XFzlTEarTRy3LGVUK4v93mZwN/uZLaywbdLBpLD4=;
 b=Yno1PhHtWb58MN8wH02y7wJG/+Y5NGfOz/TYfRMFdnpXL6MKXQlJTnsjbIkkVAy9Hn
 giGVRcxnknVZIov4qpU0Z8h7xMC9C/SxWHseZ1nKYrHeBhOcTCFHr/kV3Nh2o13sEBeC
 EMjLIeOSixrktqme/qouLUM9q/0RLrxk7n83Fjbip7sqc2M9+rLcY7rGCtDug5xQyMby
 qTEqv1Msp/xWfkblskUVBFGpC91kwCkMYkSWhV5v0ZxdIDJ8sNb0S/MQ3/ehdfhoddiA
 J7GndCrbZoYSn9VSYWGIvaNQqZ8oOjiMZPDiK9A6b/C8f06CzpHpJx0ylopKWfAhUvcR
 z6gg==
X-Gm-Message-State: AOAM531jWRZ/ETBiIYjPIcLBivPHPQnANg7fY7duFgAI9IyOq4kVUyjg
 KeIJDhD5zA1i2mGBRFyXH/ZzpL2iRgI=
X-Google-Smtp-Source: ABdhPJz4ZgC1WiLqx+H12UHTcskiozWwfHMksJZwZMReybNsr+yQIpuYAtl/cwVHe4gBcC7je+nmXQ==
X-Received: by 2002:a7b:c4d5:: with SMTP id g21mr6818808wmk.47.1632576859677; 
 Sat, 25 Sep 2021 06:34:19 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 u6sm13140224wrp.0.2021.09.25.06.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 06:34:19 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair23@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 2/3] hw/char/mchp_pfsoc_mmuart: Use a MemoryRegion container
Date: Sat, 25 Sep 2021 15:34:06 +0200
Message-Id: <20210925133407.1259392-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925133407.1259392-1-f4bug@amsat.org>
References: <20210925133407.1259392-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 25 Sep 2021 13:34:29 -0000

Our device have 2 different I/O regions:
- a 16550 UART mapped for 32-bit accesses
- 13 extra registers

Instead of mapping each region on the main bus, introduce
a container, map the 2 devices regions on the container,
and map the container on the main bus.

Before:

  (qemu) info mtree
    ...
    0000000020100000-000000002010001f (prio 0, i/o): serial
    0000000020100020-000000002010101f (prio 0, i/o): mchp.pfsoc.mmuart
    0000000020102000-000000002010201f (prio 0, i/o): serial
    0000000020102020-000000002010301f (prio 0, i/o): mchp.pfsoc.mmuart
    0000000020104000-000000002010401f (prio 0, i/o): serial
    0000000020104020-000000002010501f (prio 0, i/o): mchp.pfsoc.mmuart
    0000000020106000-000000002010601f (prio 0, i/o): serial
    0000000020106020-000000002010701f (prio 0, i/o): mchp.pfsoc.mmuart

After:

  (qemu) info mtree
    ...
    0000000020100000-0000000020100fff (prio 0, i/o): mchp.pfsoc.mmuart
      0000000020100000-000000002010001f (prio 0, i/o): serial
      0000000020100020-0000000020100fff (prio 0, i/o): mchp.pfsoc.mmuart.regs
    0000000020102000-0000000020102fff (prio 0, i/o): mchp.pfsoc.mmuart
      0000000020102000-000000002010201f (prio 0, i/o): serial
      0000000020102020-0000000020102fff (prio 0, i/o): mchp.pfsoc.mmuart.regs
    0000000020104000-0000000020104fff (prio 0, i/o): mchp.pfsoc.mmuart
      0000000020104000-000000002010401f (prio 0, i/o): serial
      0000000020104020-0000000020104fff (prio 0, i/o): mchp.pfsoc.mmuart.regs
    0000000020106000-0000000020106fff (prio 0, i/o): mchp.pfsoc.mmuart
      0000000020106000-000000002010601f (prio 0, i/o): serial
      0000000020106020-0000000020106fff (prio 0, i/o): mchp.pfsoc.mmuart.regs

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/char/mchp_pfsoc_mmuart.h |  1 +
 hw/char/mchp_pfsoc_mmuart.c         | 11 ++++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/hw/char/mchp_pfsoc_mmuart.h b/include/hw/char/mchp_pfsoc_mmuart.h
index 9c012e6c977..864ac1a36b5 100644
--- a/include/hw/char/mchp_pfsoc_mmuart.h
+++ b/include/hw/char/mchp_pfsoc_mmuart.h
@@ -33,6 +33,7 @@
 #define MCHP_PFSOC_MMUART_REG_COUNT 13
 
 typedef struct MchpPfSoCMMUartState {
+    MemoryRegion container;
     MemoryRegion iomem;
     hwaddr base;
     qemu_irq irq;
diff --git a/hw/char/mchp_pfsoc_mmuart.c b/hw/char/mchp_pfsoc_mmuart.c
index 584e7fec17c..ea586559761 100644
--- a/hw/char/mchp_pfsoc_mmuart.c
+++ b/hw/char/mchp_pfsoc_mmuart.c
@@ -25,6 +25,8 @@
 #include "chardev/char.h"
 #include "hw/char/mchp_pfsoc_mmuart.h"
 
+#define REGS_OFFSET 0x20
+
 static uint64_t mchp_pfsoc_mmuart_read(void *opaque, hwaddr addr, unsigned size)
 {
     MchpPfSoCMMUartState *s = opaque;
@@ -72,16 +74,19 @@ MchpPfSoCMMUartState *mchp_pfsoc_mmuart_create(MemoryRegion *sysmem,
 
     s = g_new0(MchpPfSoCMMUartState, 1);
 
+    memory_region_init(&s->container, NULL, "mchp.pfsoc.mmuart", 0x1000);
+
     memory_region_init_io(&s->iomem, NULL, &mchp_pfsoc_mmuart_ops, s,
-                          "mchp.pfsoc.mmuart", 0x1000);
+                          "mchp.pfsoc.mmuart.regs", 0x1000 - REGS_OFFSET);
+    memory_region_add_subregion(&s->container, REGS_OFFSET, &s->iomem);
 
     s->base = base;
     s->irq = irq;
 
-    s->serial = serial_mm_init(sysmem, base, 2, irq, 399193, chr,
+    s->serial = serial_mm_init(&s->container, 0, 2, irq, 399193, chr,
                                DEVICE_LITTLE_ENDIAN);
 
-    memory_region_add_subregion(sysmem, base + 0x20, &s->iomem);
+    memory_region_add_subregion(sysmem, base, &s->container);
 
     return s;
 }
-- 
2.31.1


