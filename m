Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbt5-00086t-VA
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50004)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsv-0007rK-6N
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbst-0007C3-SI
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:48 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44520)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbst-0007Ba-NS
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:47 -0400
Received: by mail-pf1-f194.google.com with SMTP id q21so182334pfn.11
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:28:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=oPwMt36c+qjgfMs2sORHI/jyAZMzpgus3H9ildbbPVw=;
 b=Jtd7hriBdLkOy8K8RjiimX6lX3v1K3YHfeSAMhM9BAc4y4o62VZZVGM8eRV4WeoWZT
 FNJvTJwS9f3MPl+80w3g54nGennVZBFiMuFYyiHwRPEdtB8477dX3mn0ALjzcvlRRNOy
 R9PurYLeVoQfshpLZIPDg8Hxz8Huf7MqgpLdfdJIiE7JzRe71lHbDQXfbleEYPpu7A9C
 4f/BX8UIMQKBAmptt4jGcLSQsmn5/Ko6yWt0Fts/mDtgeINo5/bDojPX48+aDznhjvGD
 ROVs9dX2MhzkyK9kKekos5rXZLafJcztlpHJP74AdaOs8osaA726RnLsUhpcu5bDVCAz
 +awg==
X-Gm-Message-State: APjAAAVCL+bA5ZERwf++flqzMhIqB8psEkmtoVyPM5Me2OLPs8d9oLkM
 /GfDkZhu/MHKG2uXd6fEZOFWHEPu98o=
X-Google-Smtp-Source: APXvYqy54FRPgOoq321R1y28p5bMKtWiDdHc9O/jShzz6Mn+b5D+avw3d0oiHP7PPLnoKtdFkNzrSw==
X-Received: by 2002:a17:90a:aa82:: with SMTP id
 l2mr4552715pjq.73.1568820526378; 
 Wed, 18 Sep 2019 08:28:46 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id o42sm3331187pjo.32.2019.09.18.08.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:28:45 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:36 -0700
Message-Id: <20190918145640.17349-45-palmer@sifive.com>
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
X-Received-From: 209.85.210.194
Subject: [Qemu-riscv] [PULL 44/48] riscv: sifive_u: Update model and
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
X-List-Received-Date: Wed, 18 Sep 2019 15:28:52 -0000

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
index 444c699f49..9f8e84bf2e 100644
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


