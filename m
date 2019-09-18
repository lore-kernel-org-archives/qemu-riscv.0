Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbsc-0007Op-Pq
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49536)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsW-0007EL-74
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsU-0006t9-Mf
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:23 -0400
Received: from mail-pf1-f178.google.com ([209.85.210.178]:42849)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbsU-0006sY-FT
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:22 -0400
Received: by mail-pf1-f178.google.com with SMTP id q12so189172pff.9
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=tDJG1p1Bp8CpFD/Bq7K8CLsWHyHj5vOvpUlOoU/iQGc=;
 b=IyQRjVO2JUiEkPkzAnzUKD98fsxLSDK0kgyJk8N+CbmxsyyCi1luNciZdkdBtHjTzv
 zVLkAteW/QJlq59huNfBR+Q5okO1ufIkSLJ8tLaEbHdBzwR1Ob5CCW6AYjemBoRAIQXh
 O1yuy8PNkKiuyBrLkX30SvCeZ92iGP8BmKvqd31Hxgg2OlLLUSfQ031vtZmtcrAIw5W8
 s1CfupwJ3P2/60Gy+VK3YCtE0AFBH56hQ4vthDmG5vknX9qlINWb1ciRjcPwy2DRHE1k
 7lXy5BFFsau3wEqVgizzt3AE+KdGL4LzAtA8sEfQjEqDM2l2OKrH+GzGUvUbjGpmA4ma
 R17w==
X-Gm-Message-State: APjAAAVzzWLqUcWyNYKCtz1nxXWaxaaYU7WpKJkDDdHtSbCvzy0nF6at
 DJ4wyPD2oTYkdki5T10kLViTZxxc4o8=
X-Google-Smtp-Source: APXvYqy+cRT/+fOnG5BSUB9VolPu2Dcg/rkpD2wAniy3O29vmboPhteFLknO2COjItiyYBPB5syO6w==
X-Received: by 2002:a17:90a:bd8a:: with SMTP id
 z10mr4425137pjr.52.1568820500957; 
 Wed, 18 Sep 2019 08:28:20 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id q20sm8662833pfl.79.2019.09.18.08.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:28:20 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:17 -0700
Message-Id: <20190918145640.17349-26-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Chih-Min Chao <chihmin.chao@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.178
Subject: [Qemu-riscv] [PULL 25/48] riscv: sifive_e: prci: Update the PRCI
 register block size
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
X-List-Received-Date: Wed, 18 Sep 2019 15:28:28 -0000

From: Bin Meng <bmeng.cn@gmail.com>

Currently the PRCI register block size is set to 0x8000, but in fact
0x1000 is enough, which is also what the manual says.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_e_prci.c         | 2 +-
 include/hw/riscv/sifive_e_prci.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_e_prci.c b/hw/riscv/sifive_e_prci.c
index bfe9b13a67..a1c0d44f18 100644
--- a/hw/riscv/sifive_e_prci.c
+++ b/hw/riscv/sifive_e_prci.c
@@ -87,7 +87,7 @@ static void sifive_e_prci_init(Object *obj)
     SiFiveEPRCIState *s = SIFIVE_E_PRCI(obj);
 
     memory_region_init_io(&s->mmio, obj, &sifive_e_prci_ops, s,
-                          TYPE_SIFIVE_E_PRCI, 0x8000);
+                          TYPE_SIFIVE_E_PRCI, SIFIVE_E_PRCI_REG_SIZE);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
 
     s->hfrosccfg = (SIFIVE_E_PRCI_HFROSCCFG_RDY | SIFIVE_E_PRCI_HFROSCCFG_EN);
diff --git a/include/hw/riscv/sifive_e_prci.h b/include/hw/riscv/sifive_e_prci.h
index c4b76aa17a..698b0b451c 100644
--- a/include/hw/riscv/sifive_e_prci.h
+++ b/include/hw/riscv/sifive_e_prci.h
@@ -47,6 +47,8 @@ enum {
     SIFIVE_E_PRCI_PLLOUTDIV_DIV1 = (1 << 8)
 };
 
+#define SIFIVE_E_PRCI_REG_SIZE  0x1000
+
 #define TYPE_SIFIVE_E_PRCI      "riscv.sifive.e.prci"
 
 #define SIFIVE_E_PRCI(obj) \
-- 
2.21.0


