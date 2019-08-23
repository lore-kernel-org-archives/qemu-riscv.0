Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i11rZ-0004Tt-0s
	for mharc-qemu-riscv@gnu.org; Fri, 23 Aug 2019 01:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45205)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i11rW-0004Pv-2P
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 01:11:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i11rV-0002lo-14
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2019 01:11:45 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:36614)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i11rS-0002jg-OJ; Fri, 23 Aug 2019 01:11:42 -0400
Received: by mail-pl1-x643.google.com with SMTP id f19so4880196plr.3;
 Thu, 22 Aug 2019 22:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=1J7jjy8jLUWT7jcpLwJ9zh0xz5EaKI6AQkwtbjaCVzY=;
 b=UUotAyYzuoqtrjRbgDlMvH8CZ5zveh5MIm9NgtUgdk714iYGHtK/wBp2krheXwh3ex
 mqNnj7P4pcbulfkQriwjD6Cr0jkBSNyRW3HWj5os6Z7YEojvagO1KDzB67H9y2gO2wOJ
 kmzT3oI67QPtrs2X1Ri7W2IZSAMdLqAckGnl318QY3diVogixSRPTdYav8w8b+cR28dk
 P0HowbAv6DtETVdPBg3vsG2frUv/NIYQXtfL/paKqLt2IWH7ucChXoNLJuzhMBsSlcH0
 Z67W2OgvoEobB9JhAH+7iYWbyWwdyV0uQECki8pVxP+/JqV2ccnyYL0IKTpAWYiGXehB
 UabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=1J7jjy8jLUWT7jcpLwJ9zh0xz5EaKI6AQkwtbjaCVzY=;
 b=dviA88FzMoiNUlxb7B9duwW1nHPXj+dpSvwRhCe+6IWVtwapeKNC1E5MfKZEefcvAx
 3EHLBAH3atU4nZGi3orhje/1skwE3ql/yLkrwAZIQEY6yxrIy9otkXayzNFIUhTD1BCY
 J9DSE6n/6qADI7WrHhJ0tV5VZOlGqPSwpspAa76A+M/2QcrLlux9x6JowgXI+zxAkkm3
 o39qPh+t/RVs4VIKrAfpffgFuA2ZHXln2Zw2+RoRsGJkVx9AA/xtK1wL3zute7q0RePT
 aIMjvj4OQLtceHrWrkOUYAujwNcY3vMNJ9ZNmeZnB7H5OmsbYlreRm2ywjFrMDrdHtUk
 ntYA==
X-Gm-Message-State: APjAAAU1K5I5qgC7J9Owtb6J6LnG7TpJVK+/V94aDa0Dx5L+Gtsc1rCd
 Onh5aYzdXqsCil9HIYhlx3A2AbCJ
X-Google-Smtp-Source: APXvYqyaoTommV+D5Yg9Fzuutufy7IGgs16L2JxNUgw6uki3cp5e4BjjjGMPW2sYAp2J+sj6EdSiZA==
X-Received: by 2002:a17:902:6b06:: with SMTP id
 o6mr2597405plk.33.1566537102085; 
 Thu, 22 Aug 2019 22:11:42 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id v189sm1122527pfv.176.2019.08.22.22.11.41
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 22 Aug 2019 22:11:41 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Thu, 22 Aug 2019 22:11:02 -0700
Message-Id: <1566537069-22741-24-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1566537069-22741-1-git-send-email-bmeng.cn@gmail.com>
References: <1566537069-22741-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-riscv] [PATCH v5 23/30] riscv: sifive_u: Update UART base
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
X-List-Received-Date: Fri, 23 Aug 2019 05:11:48 -0000

This updates the UART base address and IRQs to match the hardware.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Jonathan Behrens <fintelia@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>

---

Changes in v5: None
Changes in v4: None
Changes in v3:
- update IRQ numbers of both UARTs to match hardware as well

Changes in v2: None

 hw/riscv/sifive_u.c         | 4 ++--
 include/hw/riscv/sifive_u.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index e0842ad..1a178dc 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -63,8 +63,8 @@ static const struct MemmapEntry {
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
index 2a023be..b41e730 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -64,8 +64,8 @@ enum {
 };
 
 enum {
-    SIFIVE_U_UART0_IRQ = 3,
-    SIFIVE_U_UART1_IRQ = 4,
+    SIFIVE_U_UART0_IRQ = 4,
+    SIFIVE_U_UART1_IRQ = 5,
     SIFIVE_U_GEM_IRQ = 0x35
 };
 
-- 
2.7.4


