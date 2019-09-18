Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbss-0007mx-Lr
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49842)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsl-0007d5-JI
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsk-00073z-Bc
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:39 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39969)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbsk-00073X-6e
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:38 -0400
Received: by mail-pl1-f195.google.com with SMTP id d22so113549pll.7
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=dMC8KBUimeo1KaZM5SCh8e6L1Wsgzgt11zDiG6xpaww=;
 b=IctrDkTLACgv+uY8Pb2ut4g6Kl4oalwzG1TWNzEKbubHxQYWleDgBzrADgumO4HXc8
 bgpAFpfNAdzWbZVIwSoASW7Qco0ehTZrnVsX6MNF7HF1XxXHQB19sWmOg6R1d/rd7uRe
 41Bj1fSwZUEdUDmBwHjW1sIHDftgTp1L8rofuyElUxTi8FFANioXhBzggdyX3XFKUbIl
 u7pXeBks9UDAs6yDM5+0msuA4utnSCy1ARhcWByXj3rQST4FQt/+afbf4AApN+qrPJxN
 or/jFEgHE+9cFhszvzZvvx6A/msuwmi9PjUMjFxTzMByEfRV8KqAgFOWDLwgIDMXn1zz
 okFQ==
X-Gm-Message-State: APjAAAWh/o/z0ivirEmYWAzAE7+EIITchoEX6OpPfKMf+GTeVHRd8CTN
 gplAmPclekXAC+ma3art6j8QrKfo11k=
X-Google-Smtp-Source: APXvYqz2MrhtG5Qm8HtUIz+1t6qoPKJKVpqum/r+LHQj/Vu1aujjvHOIFApVjsUiZIlP2VlyVhVwcg==
X-Received: by 2002:a17:902:720a:: with SMTP id
 ba10mr4911393plb.328.1568820516781; 
 Wed, 18 Sep 2019 08:28:36 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id v3sm2548724pfm.119.2019.09.18.08.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:28:36 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:29 -0700
Message-Id: <20190918145640.17349-38-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
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
X-Received-From: 209.85.214.195
Subject: [Qemu-riscv] [PULL 37/48] riscv: sifive_u: Update UART base
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
X-List-Received-Date: Wed, 18 Sep 2019 15:28:43 -0000

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
index 9e698a11c4..b66eaef607 100644
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


