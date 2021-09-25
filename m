Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mU7ot-0005ec-4K
	for mharc-qemu-riscv@gnu.org; Sat, 25 Sep 2021 09:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU7op-0005cM-NB; Sat, 25 Sep 2021 09:34:19 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU7om-0000DJ-U0; Sat, 25 Sep 2021 09:34:19 -0400
Received: by mail-wr1-x42d.google.com with SMTP id t18so36117528wrb.0;
 Sat, 25 Sep 2021 06:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7I1aMI8lm45lQRDER9IXlE6p2aeABd+5vqCVhp5uc+w=;
 b=n4R5U8P3qzimBg7X1FOQsAjZtIFJ7JpOZP3uSB1w/AGD6X+i5pBAHsC5t4blQvU8DD
 yjsQQDk3+jyK5gyehnfsKRwtbFGXNavcVQAhT9koYeHOYjNm9Nu08o7SB8ezHbdAgXKq
 bl4eUnuCnbNmyvo6wOKsA3it+gup8AfKjgD2A8dgDVnwU3UijHMIwJm4JakMmp95mpdf
 FIJy5tljjHplKiNDf91o8nK4SmnHTP/Lt+25akCjoxpOq7Qyxb4gCfsn9zieN3AD7nR7
 YaEdmK5JRJAc/Xdxee8rUg+DvuCD344zCQRLB3KarTXQ6xnL1xrtiwSj3S7TPTtNAQd6
 AbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7I1aMI8lm45lQRDER9IXlE6p2aeABd+5vqCVhp5uc+w=;
 b=PqOKmp1jNiEZP/8TkrPrJ0xFKzvIRvx4gmfiLsZx89hxJ/sXhnhwIsCJNAiiC1U5x5
 LNnkznp0SnZDXZV1J9c2N1Xj+SMpcqDdLFKcQFPNWlVCV+kfz/tBU44xd1goLIBUHjf7
 2J3gzBzIQY11iiSSUw8/gJbgz1LlbUX/YgcbeBPolqP0+3xmKYc5T/XvjfM/9YdfyJUK
 yegX/d1jiV+qLbYZtAlDDtYhEsQSExyJrYhTkesxzHxMgVhnN3rt1cAAA1bT+Bm1Xhvg
 7I16gJj8s1HoqTefBcIj12p3x6b9vYIUgcZsjXVFZ9094MWkWR6s+VRcpp5JVd9M9GUN
 CgzQ==
X-Gm-Message-State: AOAM533CG21f+te8IqRkPkSBhyU91AtapqJZmS2TTopL1gIJIyzE2C/q
 WrQGzN4fWMHVw8UIw3hn0HPFr5YYp64=
X-Google-Smtp-Source: ABdhPJzAshCviCH1lX89S+tc2UXSWqxuQy/qblI9F1SVPsyPnwO3BcAlNy4YZrb6T8WYI3/nYO0XXA==
X-Received: by 2002:a7b:ce94:: with SMTP id q20mr7333890wmj.83.1632576854849; 
 Sat, 25 Sep 2021 06:34:14 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 x4sm3306588wmi.22.2021.09.25.06.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 06:34:14 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair23@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 1/3] hw/char/mchp_pfsoc_mmuart: Simplify
 MCHP_PFSOC_MMUART_REG definition
Date: Sat, 25 Sep 2021 15:34:05 +0200
Message-Id: <20210925133407.1259392-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925133407.1259392-1-f4bug@amsat.org>
References: <20210925133407.1259392-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
X-List-Received-Date: Sat, 25 Sep 2021 13:34:21 -0000

The current MCHP_PFSOC_MMUART_REG_SIZE definition represent the
size occupied by all the registers. However all registers are
32-bit wide, and the MemoryRegionOps handlers are restricted to
32-bit:

  static const MemoryRegionOps mchp_pfsoc_mmuart_ops = {
      .read = mchp_pfsoc_mmuart_read,
      .write = mchp_pfsoc_mmuart_write,
      .impl = {
          .min_access_size = 4,
          .max_access_size = 4,
      },

Avoid being triskaidekaphobic, simplify by using the number of
registers.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/char/mchp_pfsoc_mmuart.h |  4 ++--
 hw/char/mchp_pfsoc_mmuart.c         | 14 ++++++++------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/include/hw/char/mchp_pfsoc_mmuart.h b/include/hw/char/mchp_pfsoc_mmuart.h
index f61990215f0..9c012e6c977 100644
--- a/include/hw/char/mchp_pfsoc_mmuart.h
+++ b/include/hw/char/mchp_pfsoc_mmuart.h
@@ -30,7 +30,7 @@
 
 #include "hw/char/serial.h"
 
-#define MCHP_PFSOC_MMUART_REG_SIZE  52
+#define MCHP_PFSOC_MMUART_REG_COUNT 13
 
 typedef struct MchpPfSoCMMUartState {
     MemoryRegion iomem;
@@ -39,7 +39,7 @@ typedef struct MchpPfSoCMMUartState {
 
     SerialMM *serial;
 
-    uint32_t reg[MCHP_PFSOC_MMUART_REG_SIZE / sizeof(uint32_t)];
+    uint32_t reg[MCHP_PFSOC_MMUART_REG_COUNT];
 } MchpPfSoCMMUartState;
 
 /**
diff --git a/hw/char/mchp_pfsoc_mmuart.c b/hw/char/mchp_pfsoc_mmuart.c
index 2facf85c2d8..584e7fec17c 100644
--- a/hw/char/mchp_pfsoc_mmuart.c
+++ b/hw/char/mchp_pfsoc_mmuart.c
@@ -29,13 +29,14 @@ static uint64_t mchp_pfsoc_mmuart_read(void *opaque, hwaddr addr, unsigned size)
 {
     MchpPfSoCMMUartState *s = opaque;
 
-    if (addr >= MCHP_PFSOC_MMUART_REG_SIZE) {
+    addr >>= 2;
+    if (addr >= MCHP_PFSOC_MMUART_REG_COUNT) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: read: addr=0x%" HWADDR_PRIx "\n",
-                      __func__, addr);
+                      __func__, addr << 2);
         return 0;
     }
 
-    return s->reg[addr / sizeof(uint32_t)];
+    return s->reg[addr];
 }
 
 static void mchp_pfsoc_mmuart_write(void *opaque, hwaddr addr,
@@ -44,13 +45,14 @@ static void mchp_pfsoc_mmuart_write(void *opaque, hwaddr addr,
     MchpPfSoCMMUartState *s = opaque;
     uint32_t val32 = (uint32_t)value;
 
-    if (addr >= MCHP_PFSOC_MMUART_REG_SIZE) {
+    addr >>= 2;
+    if (addr >= MCHP_PFSOC_MMUART_REG_COUNT) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: bad write: addr=0x%" HWADDR_PRIx
-                      " v=0x%x\n", __func__, addr, val32);
+                      " v=0x%x\n", __func__, addr << 2, val32);
         return;
     }
 
-    s->reg[addr / sizeof(uint32_t)] = val32;
+    s->reg[addr] = val32;
 }
 
 static const MemoryRegionOps mchp_pfsoc_mmuart_ops = {
-- 
2.31.1


