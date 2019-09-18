Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbsu-0007pF-0K
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49870)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsm-0007f6-SG
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsl-00076I-ND
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:40 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44605)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbsl-00075O-HT
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:39 -0400
Received: by mail-pg1-f194.google.com with SMTP id i18so26673pgl.11
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=lLKWAarlvSIO6KN2Vy3OsCwWDCZvaYqKoz3K8rh/mk4=;
 b=dTSlZYightpb2M+yCo1RxutDMa9UEpv4axrWn+gr10OskkHq7MYQWobhzE4wkOWZbK
 1hMQNqZui+gLJMSeYNh64b2XBWSH4x3JLCNh9Ig8jG1ZL8LZPef6mbCTcapI6EB872xS
 GP0lqm2MVMjDN7/vBbZNrU03+bn5xKIHeapZkmzLJ1ku0fgrKa/t1lo/A+9VJ86qbRVY
 jO42x+C6KJjqvwPNM3b85Espfu6RNNhXBpihMWHne4ndE3jD/ic6AR8seUGF5o85xOZ8
 NxRk3v+6uIIQ1pMFIZYbDfDZ9A0zTqvXZHuBDvykfig1BpzhykN0mUDnyJ4hjvd07nts
 lUdw==
X-Gm-Message-State: APjAAAVga52wDXyFDlYmEKE4lQuADSQKLnDox0QuXio6R5TmkFSxVWRp
 e79N8s7LJHxTu9MWkSvJJhp4BSFP+i8=
X-Google-Smtp-Source: APXvYqxefurZXwlUHHZwFgNAu580GpKGIuQlex55N0m5bTmV5a13L5xkM5/UXsWvnV8hgZvyrn881Q==
X-Received: by 2002:a17:90a:3aa6:: with SMTP id
 b35mr4431131pjc.94.1568820518044; 
 Wed, 18 Sep 2019 08:28:38 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id w5sm6166236pfn.96.2019.09.18.08.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:28:37 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:30 -0700
Message-Id: <20190918145640.17349-39-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.194
Subject: [Qemu-riscv] [PULL 38/48] riscv: sifive_u: Change UART node name in
 device tree
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
X-List-Received-Date: Wed, 18 Sep 2019 15:28:44 -0000

From: Bin Meng <bmeng.cn@gmail.com>

OpenSBI for fu540 does DT fix up (see fu540_modify_dt()) by updating
chosen "stdout-path" to point to "/soc/serial@...", and U-Boot will
use this information to locate the serial node and probe its driver.
However currently we generate the UART node name as "/soc/uart@...",
causing U-Boot fail to find the serial node in DT.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index b66eaef607..24f8c19eee 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -286,7 +286,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     uartclk_phandle = qemu_fdt_get_phandle(fdt, nodename);
     g_free(nodename);
 
-    nodename = g_strdup_printf("/soc/uart@%lx",
+    nodename = g_strdup_printf("/soc/serial@%lx",
         (long)memmap[SIFIVE_U_UART0].base);
     qemu_fdt_add_subnode(fdt, nodename);
     qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,uart0");
-- 
2.21.0


