Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvGe2-0001VX-VW
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 03:46:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36725)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvGdu-00016A-Bm
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 03:45:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvGds-00089j-To
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 03:45:54 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:40960)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hvGdm-00083I-EN; Wed, 07 Aug 2019 03:45:46 -0400
Received: by mail-pl1-x644.google.com with SMTP id m9so39339316pls.8;
 Wed, 07 Aug 2019 00:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=PYmQWfCrUBsGOKU899NdMH88IzO+9rIts3A/MmHk1JA=;
 b=mx6GuIP/Vm4f0NYSg0UMP04Tcknz5Dn02OMIfgBwiePzLU2dIM9o2ArdWjrUZs7YiE
 hNEis1gfiefal0fMOOWRCASR6r8eq0wmCND/GmRYNaimdykenRaD/OGPq2bOgtT3KVE8
 +61UcPV3/EEHEEqHcx7AxVuhps2QfFpzu22Uy54oRNB5cO8g2wKfjv/yMeFp41vUwl5r
 SMF0B+b/dVmWoVNd6ryy9MV9INhfIb0KdgwfC3oXdqfXhwABBPr8fCXVIJD+X5Ye4HXI
 WQK+v4yPJIXTAfkyR76mhOKq09uUt1Vop6DS/rNfZngMewXV8fPKIX5rdf0CaSmDz1MZ
 aXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=PYmQWfCrUBsGOKU899NdMH88IzO+9rIts3A/MmHk1JA=;
 b=rV+wjeNPdtNfZP9OUgqD9AIFTKO8BkkgQO4LzFQB61e/BRIMxglPBYUCgVr38kDZvZ
 ck70kyx6Sykhm/NhJ+EZSwnHJIX/nhfY+2aQSnTMUiKKaM00LCphpL9tUFri7gB1CJ2X
 hCs3FpWIdrBNh3sMdzeX2nsXUnuwlHo9NBbFoP5e6Wj5NNSioScKuChah2iA8u+4lQb8
 MFvENix1ubuw7euHwvkkzEONKKFik25braiJAGygCvVbvfKbs6q4bn47pEQZwmI/ptH6
 4IC0sD14TJGOJ+awtN0KaWvEDrNkf4VZ9bDCUlB8cRLGb5DbmZXxMJ2vvLUHxdv3E1oC
 VQlQ==
X-Gm-Message-State: APjAAAVNBjzhFhZUF7xOzeh5yJRKVLplb8baqLmSJDz9oeYY1KGGuMV/
 HZekY6BkaBtjUjE4CiX6bQY=
X-Google-Smtp-Source: APXvYqwsHZF52LU1Qi18Kgh8JzreeQ3Haimxu2PjVmmZsJuO8aYLpPQBYp1N26EcCmP1aEZUyPN9YQ==
X-Received: by 2002:a63:2364:: with SMTP id u36mr6328816pgm.449.1565163944899; 
 Wed, 07 Aug 2019 00:45:44 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id l44sm20154449pje.29.2019.08.07.00.45.43
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 07 Aug 2019 00:45:44 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Wed,  7 Aug 2019 00:45:09 -0700
Message-Id: <1565163924-18621-14-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
References: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-riscv] [PATCH v2 13/28] riscv: sifive_e: prci: Update the
 PRCI register block size
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
X-List-Received-Date: Wed, 07 Aug 2019 07:45:57 -0000

Currently the PRCI register block size is set to 0x8000, but in fact
0x1000 is enough, which is also what the manual says.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

Changes in v2: None

 hw/riscv/sifive_e_prci.c         | 2 +-
 include/hw/riscv/sifive_e_prci.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_e_prci.c b/hw/riscv/sifive_e_prci.c
index c906f11..4cbce48 100644
--- a/hw/riscv/sifive_e_prci.c
+++ b/hw/riscv/sifive_e_prci.c
@@ -85,7 +85,7 @@ static void sifive_prci_init(Object *obj)
     SiFivePRCIState *s = SIFIVE_E_PRCI(obj);
 
     memory_region_init_io(&s->mmio, obj, &sifive_prci_ops, s,
-                          TYPE_SIFIVE_E_PRCI, 0x8000);
+                          TYPE_SIFIVE_E_PRCI, SIFIVE_E_PRCI_REG_SIZE);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
 
     s->hfrosccfg = (SIFIVE_PRCI_HFROSCCFG_RDY | SIFIVE_PRCI_HFROSCCFG_EN);
diff --git a/include/hw/riscv/sifive_e_prci.h b/include/hw/riscv/sifive_e_prci.h
index 7932fe7..81e506b 100644
--- a/include/hw/riscv/sifive_e_prci.h
+++ b/include/hw/riscv/sifive_e_prci.h
@@ -47,6 +47,8 @@ enum {
     SIFIVE_PRCI_PLLOUTDIV_DIV1  = (1 << 8)
 };
 
+#define SIFIVE_E_PRCI_REG_SIZE  0x1000
+
 #define TYPE_SIFIVE_E_PRCI      "riscv.sifive.e.prci"
 
 #define SIFIVE_E_PRCI(obj) \
-- 
2.7.4


