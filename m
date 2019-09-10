Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xwd-0000KA-Hw
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57978)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwY-0000Dh-UF
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwX-0006yS-Ou
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:38 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35509)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xwX-0006y2-Jg
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:37 -0400
Received: by mail-wm1-f68.google.com with SMTP id n10so2387876wmj.0
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=hEFvw8Q4h+2ImCXdycbkvzEGKttDjRBeJ0Zb0arlL54=;
 b=rh1MtD6ju6Bc8tQWbf4WEos/0/zkk5yaGYFoVnkuCPISPxdMrmJt88ylgez7/6BdX0
 mCt4hZgLphXAyFUl2oBQoTPrcrjrsG0lr00jx6CqvsSwxmNUFGN6TaWmKdH5pEReaEpe
 XMBYhyrQBFEv4EL68vEcX0B69wNd8GehEXGeT35o7hNCFSQ6UcCAUJzKQFgvVtOdCEnr
 4BLtYcXx41dgc+F8UFILYz1Wl4pqTOWA3FwCKfeg4NItikyJbHSPfXSyuB/1fwcHpCta
 7OBEVrG0FQvZ4x5foqcKmGC7+YIawr2QSR/IlmufDq4Yl/0VKF0UnTW5AHMhK7SvLnbU
 hy0g==
X-Gm-Message-State: APjAAAXQIpZBWno7qhwdDdbKmttWehY0yZDT+KCuL9lSeqRX8yJ3o5Se
 Do4oCx6RH8rj5P5TBArwdDEbaP8TIKVQZg==
X-Google-Smtp-Source: APXvYqxJd91LJ2r0TLiLCMTwuqBHyWBKum6LW94RLWS0d32rVYRadjk0whp7EmEmtm3V3XpCTkkHZg==
X-Received: by 2002:a7b:c1cc:: with SMTP id a12mr2703067wmj.73.1568190336111; 
 Wed, 11 Sep 2019 01:25:36 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id q19sm28409669wra.89.2019.09.11.01.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:25:35 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:05:10 -0700
Message-Id: <20190910190513.21160-45-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: [Qemu-riscv] [PULL 44/47] riscv: sifive_u: Update model and
 compatible strings in device tree
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
X-List-Received-Date: Wed, 11 Sep 2019 08:25:41 -0000

From: Bin Meng <bmeng.cn@gmail.com>

This updates model and compatible strings to use the same strings
as used in the Linux kernel device tree (hifive-unleashed-a00.dts).

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 507a6e2fa9..ca9f7fea41 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -96,8 +96,9 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
         exit(1);
     }
 
-    qemu_fdt_setprop_string(fdt, "/", "model", "ucbbar,spike-bare,qemu");
-    qemu_fdt_setprop_string(fdt, "/", "compatible", "ucbbar,spike-bare-dev");
+    qemu_fdt_setprop_string(fdt, "/", "model", "SiFive HiFive Unleashed A00");
+    qemu_fdt_setprop_string(fdt, "/", "compatible",
+                            "sifive,hifive-unleashed-a00");
     qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
     qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
 
-- 
2.21.0


