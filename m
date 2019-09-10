Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xw1-0007rH-A7
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57255)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xvx-0007lu-Ei
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xvw-0006YG-90
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:01 -0400
Received: from mail-wm1-f53.google.com ([209.85.128.53]:37616)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xvw-0006Xw-2q
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:00 -0400
Received: by mail-wm1-f53.google.com with SMTP id r195so2393766wme.2
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=ITYx9dUXd0Z/rGh2jtnGQVxEi9rjaCmMj8TUxH8w7iE=;
 b=Lb+2NyiyWS3C4cbdDerDUuGBeXJkfwCfXnN+kIVluTAeRys5/AvZ029I/kn4AIOhLf
 2cEwb12i43Ss5lcDw0LQcb3ah3Pmw56IlVqw250f146oiStunxLiwOU7njD8kB0mIA/s
 jtT0O3L3uFMCfpojbdSRIM8Mzzstph1IoBB8MRmHtyeaK91aZsGE60X5HY3uW4rE5XVe
 NTim7uHL/zwdQs0QGeovotmkGKd85WkfI8CEqS9gfg+lEi4bku4mY57o8WkGF1oz6HON
 4RhX9PKhqXBG95pTnRkj0nmCEPmbBfbMbDZOxz/+9YNoOQAzR5Px+dz4FCrSRw9YMnI7
 lz6w==
X-Gm-Message-State: APjAAAUqyr0xspILgVboV6J2kXEcAketQIp4xUl0112D+7LHM1HKVAne
 5uPk0uIVFVdw1Y1oC3gV8EXqkZwcdlFciA==
X-Google-Smtp-Source: APXvYqwl9oBZ0wkcK29c0WjUTV3QVh7ya06t/opcxheWBP5Vm9pKb/z94R8Zr/t6llakvPB2qSWB1g==
X-Received: by 2002:a1c:c012:: with SMTP id q18mr3040489wmf.116.1568190298592; 
 Wed, 11 Sep 2019 01:24:58 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id s12sm29135219wra.82.2019.09.11.01.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:24:58 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:04:43 -0700
Message-Id: <20190910190513.21160-18-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Jonathan Behrens <fintelia@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.53
Subject: [Qemu-riscv] [PULL 17/47] riscv: hw: Remove not needed PLIC
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
X-List-Received-Date: Wed, 11 Sep 2019 08:25:04 -0000

From: Bin Meng <bmeng.cn@gmail.com>

This removes "reg-names" and "riscv,max-priority" properties of the
PLIC node from device tree.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Jonathan Behrens <fintelia@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c | 2 --
 hw/riscv/virt.c     | 2 --
 2 files changed, 4 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 762223c6fe..e8acdd9b12 100644
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
index 6852178bc2..090512be13 100644
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
2.21.0


