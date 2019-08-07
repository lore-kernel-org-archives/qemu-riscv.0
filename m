Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvGe5-0001cv-J5
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 03:46:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36982)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvGe2-0001V3-Se
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 03:46:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvGe1-0008He-Pk
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 03:46:02 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:40797)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hvGdz-0008Fe-Ef; Wed, 07 Aug 2019 03:45:59 -0400
Received: by mail-pl1-x643.google.com with SMTP id a93so39421854pla.7;
 Wed, 07 Aug 2019 00:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=5yv5CdOFuxZYetYZHajkKH0g9WGo0eAwO4vJ1GVM74E=;
 b=rxcMQeAtSU3j5P0tzdOIXFGgZXyA9ioDYNkKey3MM/7mGgost+HUPmgB4S84wncJUI
 +s4VcOnUTE0HVYVJXvglLdRkX84tlX+uPxW01DKon6D5iawwBDLX4gLHnVNdpJUIjh0z
 b9P1gGYa1pXYafGBUlksoU7odwG5ZylKyuyJC16fzXYTR4PwDnr/SlFKkq7w/QFgBPov
 LanzVmYzCjgQ7W26W4+UpZ/2pnHfvEAjVkLeI1dMDI4JN8YULrDHiGXfjlogaoTcsU8f
 LgypqYs3LadMQF2x+gPBTh9/uBV51ol3bMn2hUqIRUp2MmjAPlaR2zUihCmNindXZC5L
 WM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=5yv5CdOFuxZYetYZHajkKH0g9WGo0eAwO4vJ1GVM74E=;
 b=fX0BkRFgkZnNxm5kFlrP6NNplgJF97KUBRnDbBpj5db/yXv+9Z1/0tBueSSGnGSuE8
 VbsjCUgchmq9Q14nATWIoh6iSER3quwBJpXR05scGVooW6+wElJ5jlUKE6Vh3bsCnOcT
 CavH+UXCXY76ZntJINtIbntLK+Xpk3Bvu9eP1suc9rK0u9Q8LVl3Fb07csw9savKZTb4
 YC7ZBIG16trIY2gca8Nfxmvu115XAf6Fy0yN2xj6pRo9gZ7PyoP+8xUFxf8pqXC/VJoy
 +56tS/K0YrWuWB/Zm39oWm5Tb0KJaF+MPZiSzGNCIppKjMKLkRxS17lQZrVjU+JQZGrJ
 +ykQ==
X-Gm-Message-State: APjAAAWDV3Fe37NCu6y2T54zBEESx4WJzVszEqD8v9+h7d7A9UXrmOtI
 goruEtNzZEF8ITKdBRA1gsk=
X-Google-Smtp-Source: APXvYqxIwP3lWtryoHmqTe/Yzx5gZAnOwRceOuyCA24MTBAyVmkAUAM4ujIAOQUCrj5VozOGIqksYQ==
X-Received: by 2002:a17:902:f095:: with SMTP id
 go21mr7130477plb.58.1565163958734; 
 Wed, 07 Aug 2019 00:45:58 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id l44sm20154449pje.29.2019.08.07.00.45.57
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 07 Aug 2019 00:45:58 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Wed,  7 Aug 2019 00:45:21 -0700
Message-Id: <1565163924-18621-26-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
References: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-riscv] [PATCH v2 25/28] riscv: hw: Remove not needed PLIC
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
X-List-Received-Date: Wed, 07 Aug 2019 07:46:04 -0000

This removes "reg-names" and "riscv,max-priority" properties of the
PLIC node from device tree.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Jonathan Behrens <fintelia@gmail.com>

---

Changes in v2:
- keep the PLIC compatible string unchanged as OpenSBI uses that
  for DT fix up

 hw/riscv/sifive_u.c | 2 --
 hw/riscv/virt.c     | 2 --
 2 files changed, 4 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 30e6c43..d7a4aae 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -238,8 +238,6 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
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


