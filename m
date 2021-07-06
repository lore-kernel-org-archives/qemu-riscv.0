Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m0iH1-0006qg-1v
	for mharc-qemu-riscv@gnu.org; Tue, 06 Jul 2021 06:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m0iGy-0006il-Oz; Tue, 06 Jul 2021 06:25:48 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:44966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m0iGv-0007Rs-Rx; Tue, 06 Jul 2021 06:25:48 -0400
Received: by mail-ej1-x62d.google.com with SMTP id he13so14701731ejc.11;
 Tue, 06 Jul 2021 03:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W/JuhvKQLOnsIlTO9avFmh0xmJK3sQ76sT8oXdcL4bE=;
 b=iiN8l1Fb4GHIFNMpF/TKUKCbEA7CuLsdTfvm2ps2EHac70HawujaflDLaOAA4Bg71w
 W6chgNsuN2z1Tq4Hhyxt7RYwwgnJorD5TpHVzsMYoOHLx/ev0IhYVUkaQmk4izQOHaxp
 hH3ILaCXE9qUuUGpgm8pmTl0FYr1ev/M8fyqTNl8AEXle2XW/YDaa9Uq/KRjC/PCBjdm
 7v8xlo2tfqwIvHXoQnns0+ji7dWhJ6LAP6CgFrGvbzZ9zVl9S8LbNFl45zdYGJuo/Q02
 ZFrMT9l7SIVuq4WDHF6KaEAJ+OKL1W/2Pfkob0viVLHPqU19/2kS+L/OHz9po7rkXCtE
 oHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W/JuhvKQLOnsIlTO9avFmh0xmJK3sQ76sT8oXdcL4bE=;
 b=LhBKDOViaBU6YZwOkXHKx0u+ljh16hzxUn5gAaZvigzjT+T8FEQFbWR2BrgO5MxYwJ
 ej3iOt8IknSV9X+Zw7z658G+zZPYMnrP79zbuPtQueWK5NDGviM0RCZQkcQ+2vHklvqO
 IsbufqEkb92eOTZw91LywfQnKq3NACo9d+ywvhSoj2/S7CxauI0IzmG8oPE0NPAMIvMf
 HWFaDkjRnIA9DaXjQNKHiF0Rb20xVzbWgmegtZmEs6RV2DK7ks8uAUU69QbTFl1Txfia
 iDc1BYnjqXCTIGvky66pOuOPn6x5gxhJxjeM6VX20uB52BmmhsARq7Tm3UUGVMi3K+R3
 tQrA==
X-Gm-Message-State: AOAM530dB8DdTxuqsv3ay5BdLymSBjrkcITJttcbFtj0J1NviTSlkwZl
 KvaHzlS1MHMm0DUYqIy/SQ2gVl9joN4=
X-Google-Smtp-Source: ABdhPJxQl7lILzUz+6bTtWO32MUhRK0dca/1gmMkJtWS9i2NfTzZbIXG+oJdTMmwBfnbi7eO3gLtSA==
X-Received: by 2002:a17:906:1701:: with SMTP id
 c1mr17866292eje.425.1625567143806; 
 Tue, 06 Jul 2021 03:25:43 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id cq6sm5074158edb.1.2021.07.06.03.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:25:43 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH] hw/riscv: sifive_u: Correct the CLINT timebase frequency
Date: Tue,  6 Jul 2021 18:26:16 +0800
Message-Id: <20210706102616.1922469-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Tue, 06 Jul 2021 10:25:49 -0000

From: Bin Meng <bin.meng@windriver.com>

At present the CLINT timebase frequency is set to 10MHz on sifive_u,
but on the real hardware the timebase frequency is 1Mhz.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/riscv/sifive_u.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 273c86418c..e75ca38783 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -62,6 +62,9 @@
 
 #include <libfdt.h>
 
+/* CLINT timebase frequency */
+#define CLINT_TIMEBASE_FREQ 1000000
+
 static const MemMapEntry sifive_u_memmap[] = {
     [SIFIVE_U_DEV_DEBUG] =    {        0x0,      0x100 },
     [SIFIVE_U_DEV_MROM] =     {     0x1000,     0xf000 },
@@ -165,7 +168,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
 
     qemu_fdt_add_subnode(fdt, "/cpus");
     qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
-        SIFIVE_CLINT_TIMEBASE_FREQ);
+        CLINT_TIMEBASE_FREQ);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
 
@@ -847,7 +850,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
     sifive_clint_create(memmap[SIFIVE_U_DEV_CLINT].base,
         memmap[SIFIVE_U_DEV_CLINT].size, 0, ms->smp.cpus,
         SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
-        SIFIVE_CLINT_TIMEBASE_FREQ, false);
+        CLINT_TIMEBASE_FREQ, false);
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->prci), errp)) {
         return;
-- 
2.25.1


