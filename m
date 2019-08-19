Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hzZxp-0004xN-Sr
	for mharc-qemu-riscv@gnu.org; Mon, 19 Aug 2019 01:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43437)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1hzZxm-0004s0-LN
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2019 01:12:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hzZxl-0007BY-Ir
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2019 01:12:14 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:45038)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hzZxj-0006zn-At; Mon, 19 Aug 2019 01:12:11 -0400
Received: by mail-pg1-x543.google.com with SMTP id i18so464352pgl.11;
 Sun, 18 Aug 2019 22:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=FqOx8U2kAH7alGH9O0Bhdd74q1c9v4h+5qf7GRbfQ10=;
 b=Jy7/nHBuuaawv5XjyxPOcAKCk3uTce0ezOHq18XgzgIisIjKvW+vfkJi3DhnFVe4Pn
 ziIXeP7c3D2b0gE733isJ/2213Fn1HR74AZMKkps2CAVZv5wVFKiblnjy17kyBzrcSF6
 ZB+IuVuCGj0riOu0Q9VLiJR3JMNozNJYrohHeKMdMGqkNFSIMIY13Ug6GLiwrJ/OFsMw
 DpLK429tj+/BpqVnaFtM8JQSYnmUnwGGMy7wswP5+d9ijNxVJflqPr1y1DfDMcwk/g19
 fvfZevjiKKHRvgCSIjb2+CDUgLZIHfEfzMhHqQ5kVC0gxnFtsBhhLJp9zRD9a3MsBMIH
 WjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=FqOx8U2kAH7alGH9O0Bhdd74q1c9v4h+5qf7GRbfQ10=;
 b=EB/nfH9AJ27QrAPFzmHNeBd3P8D5LAzu3K9llPY+Zng90uxz/smAaImHHnaVpXX7Xj
 ra8WmB2yDlk6bMPAf8DQTL9gw+pccnTmBtYcDgLN8X2MFklD9lMA97J48Q3cxvAAjEPu
 8LrM/lsFDwzSQicBZyyrwwlpNA2GHOZnEFRMusBcVVnCPG6sckGTQnYyY3vpDi635XeC
 AqJvp3uwsWL0gv99WOm0RL+/HDLndKEaHGGGKnW9+2urwqC8oi+lrqGf8wTmm0Ky2aA2
 kwAgxBDLlzVhiKPp8eguIp93edg6Iao9ESUI1rWrj5XKNpzla8xgh31zBMkbTByFcmIe
 d40Q==
X-Gm-Message-State: APjAAAXiCxkXRqBj9Rdy7JT33JXSgjxTODEL6Sk3uy+ACIFegA1VhTjw
 iuGuTQ7HPcYd6hpzkDpaa5Y=
X-Google-Smtp-Source: APXvYqxcRWJ0tDI5uGI3rcRLuonblxFj2bQN5q9ODJc+hH9d5VrB7kP+LSRY+ZWJ8FJyp0ASPtLEbw==
X-Received: by 2002:a63:d84e:: with SMTP id k14mr18332564pgj.234.1566191530499; 
 Sun, 18 Aug 2019 22:12:10 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id q13sm15464986pfl.124.2019.08.18.22.12.09
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 18 Aug 2019 22:12:09 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Sun, 18 Aug 2019 22:11:36 -0700
Message-Id: <1566191521-7820-4-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1566191521-7820-1-git-send-email-bmeng.cn@gmail.com>
References: <1566191521-7820-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-riscv] [PATCH v4 03/28] riscv: hw: Remove not needed PLIC
 properties in device tree
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
X-List-Received-Date: Mon, 19 Aug 2019 05:12:16 -0000

This removes "reg-names" and "riscv,max-priority" properties of the
PLIC node from device tree.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Jonathan Behrens <fintelia@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v4: None
Changes in v3: None
Changes in v2:
- keep the PLIC compatible string unchanged as OpenSBI uses that
  for DT fix up

 hw/riscv/sifive_u.c | 2 --
 hw/riscv/virt.c     | 2 --
 2 files changed, 4 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 3f9284e..5fe0033 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -180,8 +180,6 @@ static void *create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[SIFIVE_U_PLIC].base,
         0x0, memmap[SIFIVE_U_PLIC].size);
-    qemu_fdt_setprop_string(fdt, nodename, "reg-names", "control");
-    qemu_fdt_setprop_cell(fdt, nodename, "riscv,max-priority", 7);
     qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev", 0x35);
     qemu_fdt_setprop_cell(fdt, nodename, "phandle", plic_phandle);
     plic_phandle = qemu_fdt_get_phandle(fdt, nodename);
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 127f005..2f75195 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -244,8 +244,6 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[VIRT_PLIC].base,
         0x0, memmap[VIRT_PLIC].size);
-    qemu_fdt_setprop_string(fdt, nodename, "reg-names", "control");
-    qemu_fdt_setprop_cell(fdt, nodename, "riscv,max-priority", 7);
     qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev", VIRTIO_NDEV);
     qemu_fdt_setprop_cell(fdt, nodename, "phandle", plic_phandle);
     plic_phandle = qemu_fdt_get_phandle(fdt, nodename);
-- 
2.7.4


