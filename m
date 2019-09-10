Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xwS-00004t-NU
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57791)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwO-0008RF-S6
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwN-0006sH-G6
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:28 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43602)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xwN-0006re-9M
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:27 -0400
Received: by mail-wr1-f66.google.com with SMTP id q17so18736203wrx.10
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=hvq3cQzVhqnjD5sToLYOJWwVWK77baMHrPI+LlHeGgQ=;
 b=HXODvtKz0Is4T7JodlXVBka8F4KIpzmwF0J+WdfpnoRw+rf14kC+xzvJkwn37cvmI+
 kdgIiY8VNRHQ0wVmbqMkcU37zE4SYxNoEkvvgfRQKQ8R8XG95hm5qMlhhJgch1Ec9B2O
 6/PtBg8inygzO559mUJdO3MqCdxMzZyhZTxaPTonGpwwaZT2xucf8S3wPM5PVzSMyZyq
 f8qv3g0ExJ2oiCvaxUXy8+oMh9HwiMqbwwuLh/Ld4GtuXWL63PA/C+E+0Kwbset/T02l
 TO33g1AK/8V/2Div2dcU9S0MkWRxaWNfiu1+3VR/KYkj2eqBNwvEvR9+Q8QZoD/NVOVK
 /jzA==
X-Gm-Message-State: APjAAAW3i5lbn0uDDOGM6SVnxbCP68nPbE4Hv7FKXSWhvsP88d3R5wut
 Z9sjnNV8/KpeB2zvGXN+AbNrPMhkwab8BA==
X-Google-Smtp-Source: APXvYqwU7MFwul3i6OMrNI4nd4cze/bUITUKrYtiPBgHlTB0LZ/GJa6gCzj+2KcAJhG4mEVmeETzBg==
X-Received: by 2002:a5d:46c4:: with SMTP id g4mr27590437wrs.189.1568190325830; 
 Wed, 11 Sep 2019 01:25:25 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id s19sm30988286wrb.14.2019.09.11.01.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:25:25 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:05:03 -0700
Message-Id: <20190910190513.21160-38-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Jonathan Behrens <fintelia@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: [Qemu-riscv] [PULL 37/47] riscv: sifive_u: Update UART base
 addresses and IRQs
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
X-List-Received-Date: Wed, 11 Sep 2019 08:25:32 -0000

From: Bin Meng <bmeng.cn@gmail.com>

This updates the UART base address and IRQs to match the hardware.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Jonathan Behrens <fintelia@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c         | 4 ++--
 include/hw/riscv/sifive_u.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index ea21095513..a3ee1ec0a9 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -62,8 +62,8 @@ static const struct MemmapEntry {
     [SIFIVE_U_CLINT] =    {  0x2000000,    0x10000 },
     [SIFIVE_U_PLIC] =     {  0xc000000,  0x4000000 },
     [SIFIVE_U_PRCI] =     { 0x10000000,     0x1000 },
-    [SIFIVE_U_UART0] =    { 0x10013000,     0x1000 },
-    [SIFIVE_U_UART1] =    { 0x10023000,     0x1000 },
+    [SIFIVE_U_UART0] =    { 0x10010000,     0x1000 },
+    [SIFIVE_U_UART1] =    { 0x10011000,     0x1000 },
     [SIFIVE_U_DRAM] =     { 0x80000000,        0x0 },
     [SIFIVE_U_GEM] =      { 0x100900FC,     0x2000 },
 };
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index bb46745356..7dfd1cb22e 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -65,8 +65,8 @@ enum {
 };
 
 enum {
-    SIFIVE_U_UART0_IRQ = 3,
-    SIFIVE_U_UART1_IRQ = 4,
+    SIFIVE_U_UART0_IRQ = 4,
+    SIFIVE_U_UART1_IRQ = 5,
     SIFIVE_U_GEM_IRQ = 0x35
 };
 
-- 
2.21.0


