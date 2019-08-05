Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hufQX-000186-CD
	for mharc-qemu-riscv@gnu.org; Mon, 05 Aug 2019 12:01:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58895)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hufQ9-0000ru-7w
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 12:01:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hufQ7-0003IL-Ab
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 12:01:12 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:36152)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hufPv-00033A-JF; Mon, 05 Aug 2019 12:00:59 -0400
Received: by mail-pg1-x542.google.com with SMTP id l21so39966118pgm.3;
 Mon, 05 Aug 2019 09:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=QuZdLhzlK6U3bx0vMCzbBKTSmmAROtKOFTMKflTzqlM=;
 b=AcWqlgO0cypZGI6ilOkZhM/0Bb3oeP3PufzGnjSQfn7KwvdAlebCsGUz32toaCkSTE
 zuzA1jC6BfD86y+Wl6bYVZRTslDXNy0enkB3XF29tbsJeh3l9pjL3r6WMlRwIgEj8N95
 ZeHQczuGbn4O1flVIUyRlidP8iTU1vY1hkXnVMZBroYACR9WOqTKTWhs685tt3efX+o4
 18Unl14riC2gdkkhSPRjOmxRmGOHKA7h24o/X+g6H4w4hD/hlywiKwmiTnL0W/XU+hF1
 7iXVzW0h6eqb/0Es7ukGUDi1SxBzFsUeGsErK/UhrrCc1l+1eIFWFvP0CKTjkAb545fA
 Kyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=QuZdLhzlK6U3bx0vMCzbBKTSmmAROtKOFTMKflTzqlM=;
 b=D6xTbjMExfq+H/kCF+PFhJJasvffmPuoKpYOhjWdg4DbcxPn4Q8Y7NkfUFUxQWPprp
 ZNTJQdCkTc5/QcOVLxY1PdzrPNLAEn3D4V2rTxoQYZqmsHXHXXxxKgow4RiSc5zE8QcC
 MPNNRHHwbYTz1/Pa0gsvqKMiR3EVfyFtLfL9/p1a+DiWbY10+ylGzTbQgNRY3bPmCc6P
 kjXIcdBznGaKOyIAlQuUfN98wnY1jrjLsz93w2QXPkIr6sYvJPcCwnwM35FE1oY6dO9b
 /04UU+B7QvRHYzzzT1B4BLIrDe9nUnqiaYdsd6Un8zH3CDik0BRliqJEn6eZhMqsUnaJ
 7bMA==
X-Gm-Message-State: APjAAAWMN7MJdSU8KafxLpv/OFpW04Kl63FTIocT1hPUExK6u8L/aIf+
 kenZ3ssNFletC9wXSnZmAP0=
X-Google-Smtp-Source: APXvYqyhX/egnDcggEsDg6Ds4qcSJmzE3zeIUXODv8hVpIfFGW/4HySVpVWjhStG3FOAG9jNZkKKyA==
X-Received: by 2002:a63:e09:: with SMTP id d9mr20468055pgl.442.1565020855326; 
 Mon, 05 Aug 2019 09:00:55 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id d18sm47728793pgi.40.2019.08.05.09.00.54
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 05 Aug 2019 09:00:54 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Mon,  5 Aug 2019 09:00:20 -0700
Message-Id: <1565020823-24223-26-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1565020823-24223-1-git-send-email-bmeng.cn@gmail.com>
References: <1565020823-24223-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-riscv] [PATCH 25/28] riscv: sifive_u: Support loading
 initramfs
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
X-List-Received-Date: Mon, 05 Aug 2019 16:01:14 -0000

The loading of initramfs is currently not supported on 'sifive_u'.
Add the support to make '-initrd' command line parameter useful.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/riscv/sifive_u.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 85cd4b5..d77b3c3 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -323,7 +323,18 @@ static void riscv_sifive_u_init(MachineState *machine)
                                  memmap[SIFIVE_U_DRAM].base);
 
     if (machine->kernel_filename) {
-        riscv_load_kernel(machine->kernel_filename);
+        uint64_t kernel_entry = riscv_load_kernel(machine->kernel_filename);
+
+        if (machine->initrd_filename) {
+            hwaddr start;
+            hwaddr end = riscv_load_initrd(machine->initrd_filename,
+                                           machine->ram_size, kernel_entry,
+                                           &start);
+            qemu_fdt_setprop_cell(s->fdt, "/chosen",
+                                  "linux,initrd-start", start);
+            qemu_fdt_setprop_cell(s->fdt, "/chosen", "linux,initrd-end",
+                                  end);
+        }
     }
 
     /* reset vector */
-- 
2.7.4


