Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvGdw-0001DM-Ig
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 03:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36659)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvGds-000118-U1
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 03:45:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvGdq-00087h-Me
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 03:45:52 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:34039)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hvGdk-00081S-8N; Wed, 07 Aug 2019 03:45:46 -0400
Received: by mail-pl1-x643.google.com with SMTP id i2so39504631plt.1;
 Wed, 07 Aug 2019 00:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=GVXXIEJLxuexj6x8Bo13FQpkNePBMHrwRpuPxXgKVL8=;
 b=ZiEnnFg1aRBARd4kOvaJ509yBILbWWDizd927b5JSxGEW5a22TKJ9zcVyR2c6LCUR8
 jkUe42aJEMUJ7yjDAsdUJvQl7z8iZDl+4WL2++5msFBE2AQXow5O1IXUEEGBBOF+cu9W
 c8FGQaPL3QpYvTVWLSxe//DCH8bKzoMDH9gwpfTxT2foHjvFYIriPw9ksq9K8++09dD1
 y96PlfwjhQH/Sa3FOlUt4RD8TbqfyIhXL/ShcCkJCv0C+veie+DXmud7cZE3/Drpko4P
 MBLzbD5+sMcRtu11G2LV+YGJBH18GIO1lNSjmzYGa4AOCX7KTt8wHW4Miy94fYx+fl1w
 7CXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=GVXXIEJLxuexj6x8Bo13FQpkNePBMHrwRpuPxXgKVL8=;
 b=Fl2AcxizCBNkG6wHTr81vgGTmfr6TJmX6p1Kk52ukxYBpJ361QZUGR0n0icpL+YS9j
 1MOv8fvmZqrvG6uad2O6lUSTYK6zh7OCdub9eiyIrcM5sul+0JzMX7qDrRjl7ZSvzoXS
 Cao3NikK/PKEafg2FvRykqKx9iXSVrr8+DVpvAcIsvcIzCM0odw+0Q6PyUmf1zx2P9Mm
 eFtL+wrUocOW+b6peWhWoLMT1qWiRwqf5vAr4+LGHKhM57mDjudCyX+s4MxXsrUB65gn
 wTyYECj820bkc6JTIQvtsRmgyJN+ZobF3cm8PRu/eXsrVISKBBaGk7r7Af/DyQWe2UTr
 lhCQ==
X-Gm-Message-State: APjAAAWXjc5ihTFT0OvNkEWw563sfNTsXVvQLX1c3Q3xM9flWczzUu+D
 KihtlqNDd3b+io2AhYoAT/E=
X-Google-Smtp-Source: APXvYqzgTqd02lTb442Yp18DMKONZrCGD0PdSm27yBJOlqtvB+2miRGt/Jfz52UBUn+OBaTGeCvPQw==
X-Received: by 2002:a63:2148:: with SMTP id s8mr6453028pgm.336.1565163940243; 
 Wed, 07 Aug 2019 00:45:40 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id l44sm20154449pje.29.2019.08.07.00.45.39
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 07 Aug 2019 00:45:39 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Wed,  7 Aug 2019 00:45:05 -0700
Message-Id: <1565163924-18621-10-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
References: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-riscv] [PATCH v2 09/28] riscv: sifive_u: Update UART base
 addresses
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
X-List-Received-Date: Wed, 07 Aug 2019 07:45:54 -0000

This updates the UART base address to match the hardware.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Jonathan Behrens <fintelia@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---

Changes in v2: None

 hw/riscv/sifive_u.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index fe8dd3e..ea45e77 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -61,8 +61,8 @@ static const struct MemmapEntry {
     [SIFIVE_U_MROM] =     {     0x1000,    0x11000 },
     [SIFIVE_U_CLINT] =    {  0x2000000,    0x10000 },
     [SIFIVE_U_PLIC] =     {  0xc000000,  0x4000000 },
-    [SIFIVE_U_UART0] =    { 0x10013000,     0x1000 },
-    [SIFIVE_U_UART1] =    { 0x10023000,     0x1000 },
+    [SIFIVE_U_UART0] =    { 0x10010000,     0x1000 },
+    [SIFIVE_U_UART1] =    { 0x10011000,     0x1000 },
     [SIFIVE_U_DRAM] =     { 0x80000000,        0x0 },
     [SIFIVE_U_GEM] =      { 0x100900FC,     0x2000 },
 };
-- 
2.7.4


