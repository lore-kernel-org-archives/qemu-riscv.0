Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbsO-00071m-9X
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49337)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsJ-0006qz-2F
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsI-0006iN-1e
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:10 -0400
Received: from mail-pl1-f169.google.com ([209.85.214.169]:39215)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbsH-0006ht-QT
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:09 -0400
Received: by mail-pl1-f169.google.com with SMTP id x6so116997plv.6
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=ITYx9dUXd0Z/rGh2jtnGQVxEi9rjaCmMj8TUxH8w7iE=;
 b=HxwLKTnA06ObeVnUq8te0pHPo1m68LEUnd9fgX/2kyXSxny8K/TX2pNBY8cmbUw+YD
 ExywEZcoAAd9ZE2BCyD4Yy2eOH5YsneSe8b5MXPzK94tz9HgfwXB10euYJ/wRhDsNUFR
 gX/m4n1SOVu9lGQ2dx4Zkv3CMyObs/XZSq2xXwZuf0pkNFmxO1nCfINHv0xnLm4WzHwd
 abvkV+/5T0Cfuc9xjkSFv2F63QonYK83hlBcxDi1HkHo6zdzN2FqDk8hL47aieejeJ2Z
 RigzQxO8EXUBeELzIT6tmNyvCl4Jm+pJizu2Mef3fvr2rGU4Rno8QoK339S00m6Na9yB
 5A7Q==
X-Gm-Message-State: APjAAAUkWr4l34bjGqN7o31YRJtVK1DP2qq5Ap+QAM3iE2+3Dbk2B+GZ
 h97hE1ZdYpvBNBLWeFIv7aV02lMPqMg=
X-Google-Smtp-Source: APXvYqyUT2835N7xd75T+UMnnDLWSsSjILwm/TFofY8CzjuB8MkKgB82oJC12N5L772yyZ7X80glvA==
X-Received: by 2002:a17:902:b287:: with SMTP id
 u7mr4728744plr.72.1568820488286; 
 Wed, 18 Sep 2019 08:28:08 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 202sm11186691pfu.161.2019.09.18.08.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:28:06 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:09 -0700
Message-Id: <20190918145640.17349-18-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Jonathan Behrens <fintelia@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.169
Subject: [Qemu-riscv] [PULL 17/48] riscv: hw: Remove not needed PLIC
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
X-List-Received-Date: Wed, 18 Sep 2019 15:28:12 -0000

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


