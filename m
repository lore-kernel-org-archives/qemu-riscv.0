Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iT7g2-0003bF-Qy
	for mharc-qemu-riscv@gnu.org; Fri, 08 Nov 2019 12:04:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38282)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iT7fz-0003VZ-5V
 for qemu-riscv@nongnu.org; Fri, 08 Nov 2019 12:04:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iT7fx-00082S-Iq
 for qemu-riscv@nongnu.org; Fri, 08 Nov 2019 12:03:58 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:39883)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iT7fw-0007yr-T8
 for qemu-riscv@nongnu.org; Fri, 08 Nov 2019 12:03:57 -0500
Received: by mail-pf1-x443.google.com with SMTP id x28so5001664pfo.6
 for <qemu-riscv@nongnu.org>; Fri, 08 Nov 2019 09:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=2HFV5T5YHz0RHL9Vx4v0rUKBOuss5HY1B+DqcpGnOGg=;
 b=HsrIFSvh3S/gnnh+cHhEeLyTHXzS8GzfgqAuuyYVH020rNKecJYRUQAVDIq28+C9yO
 S17QK7jAg5D/ufy9cNtwEtMLDcavXpE/Lm85uctRv+PL2HPY0hX4HOtQ9neaPPpvDii/
 NuZiRLszujiOTNIrTezmLH5vdS1HQoyv8NF2RPN8VkKahazWypbQI+uYswGj0sIPYrq7
 hGYLdQD3InvdxkMl/Uw+X5EQUUvMixAXdntZegaSzvVnarpiDE6hMdb1CilN/T6lUIyC
 Yy1QcZ8IT74m6pMmOT5bbKTWGobGi7NVVmvRlZwHDGAheljH8LsTtf0KhNHZ5SLsZW96
 AkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=2HFV5T5YHz0RHL9Vx4v0rUKBOuss5HY1B+DqcpGnOGg=;
 b=gT5vWBNIpPCV937YkVxZasXyIzqsZoJW1XrnbLoX0Q7fgOb72LDjsVzViKNjcgTiBu
 D9jjLr+JC7Xrs1Fyhc2sUnoq20vo2aTUeqAY5wx+z3Bkty0RiWYJ7BKcK0hgUd4660Ax
 1JDDtzoTz/jPdcccQSHUBUxQ30lq2xF2Wkz+CY9ey5NNy6m8dHiABxdTg3pGEYLcJ2Bh
 k338rojQfax08nZffI4RQd3zd2poXz9tFcYMG7VK8XgdFgSWf+Ciyx5CC0Lcg78xUIWQ
 xvrqIV6vvArFWBcZyQBIq3MGKn2ewN507bmJxjLcrcffBt94Cg5Bz7xdeWu6MRsPYhhL
 Mw0Q==
X-Gm-Message-State: APjAAAXTpzKAofWXUk100JaAK7rwZ6ymr0JoLByeNTh3QlL3mbL4bCcT
 jx4FWqYnumNmjt0awZwXWWqE/w==
X-Google-Smtp-Source: APXvYqwU3v74C1gwZKBJ6cYXmMAjwgLORqWmW7qMnZR37rjUZbnDHzKxsVV6V8Y6dMriohOkWEnpvw==
X-Received: by 2002:aa7:9192:: with SMTP id x18mr13438878pfa.229.1573232635334; 
 Fri, 08 Nov 2019 09:03:55 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id r184sm7784147pfc.106.2019.11.08.09.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 09:03:54 -0800 (PST)
Subject: [PATCH] RISC-V: virt: This is a "sifive,test1" test finisher
Date: Thu,  7 Nov 2019 14:25:00 -0800
Message-Id: <20191107222500.8018-1-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christoph Hellwig <hch@infradead.org>,       qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
X-List-Received-Date: Fri, 08 Nov 2019 17:04:01 -0000

The test finisher implements the reset command, which means it's a
"sifive,test1" device.  This is a backwards compatible change, so it's
also a "sifive,test0" device.  I copied the odd idiom for adding a
two-string compatible field from the ARM virt board.

Fixes: 9a2551ed6f ("riscv: sifive_test: Add reset functionality")
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
---
 hw/riscv/virt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 23f340df19..74f2dce81c 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -359,7 +359,10 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     nodename = g_strdup_printf("/test@%lx",
         (long)memmap[VIRT_TEST].base);
     qemu_fdt_add_subnode(fdt, nodename);
-    qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,test0");
+    {
+        const char compat[] = "sifive,test1\0sifive,test0";
+        qemu_fdt_setprop(fdt, nodename, "compatible", compat, sizeof(compat));
+    }
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[VIRT_TEST].base,
         0x0, memmap[VIRT_TEST].size);
-- 
2.21.0


