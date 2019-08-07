Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hvGdx-0001FJ-3u
	for mharc-qemu-riscv@gnu.org; Wed, 07 Aug 2019 03:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36660)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvGds-000119-Ti
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 03:45:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvGdq-00087N-MF
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2019 03:45:52 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:42813)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hvGdm-00082x-70; Wed, 07 Aug 2019 03:45:46 -0400
Received: by mail-pl1-x642.google.com with SMTP id ay6so39529321plb.9;
 Wed, 07 Aug 2019 00:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=rJ9o3PjetsKa5rb+xZapTTjmCu2Ub9mNF6ud1wfYiP0=;
 b=LUclFCIr+qCYp8G5hGe8bvlyBqgoGcDJaI7DTlMlCScFTdx7zyXoQw6+7LmQW0xMcr
 fh7/AGlFw/58V7CqAlM43SyYcVqIylSwgkTGu5cXQNBPtl0K6Yx+k4P1/Rdpp5NYEwvT
 sBtHPER+LKWBZ8HrXcv6ztI77VhgOkvB8b8b5t7QSW0aKxBt0G0u4pyHFkJT3xtn8KeR
 wLH8aQojKSHBIMtnQJ+5gHbc1gRKq3AksmIDxsIPnItaO0K8Hn8G+Bugj72D6dkJEuWL
 UFCUFK+ikzGYZIPLYNX1RXLs1Bn8U/KrFIzbryCNme0svZtRPUg2Mom9HJJ6gfVEKq9c
 wL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=rJ9o3PjetsKa5rb+xZapTTjmCu2Ub9mNF6ud1wfYiP0=;
 b=iZdJ9EQiIJ7a8OrRehalHI9wtj6HyWNGKsXNIL2vtM6pE3nz/CX+5DOv9VKXP7HcS2
 jbDUjNbR+51gcv4dAx5aIHdqzttwUOWXCmfCKTGTIUNmQvRTSCvSQAl+eDmiYu0FmAQT
 YFcfWyy74QjhrTeCKzZyardOcl1gXfRaDJ6B0ibGIRcapdgl8I3QZ8F4Jif2Taokhqvq
 MAxK/PnLo00aNQXHVkFxQAI+qx4cgE1QjavvHO/qwbO8gAJ2xuSiCgg43RZyyuqXWqw8
 oNtc/5d225xAmQn/QxBDp2o1/m+zywrl5wccMuKuRIa+NaDHH9PB7SpcY91ZDK/iWSZW
 qW/A==
X-Gm-Message-State: APjAAAVnOcsHcQUtYqqIDTu6oY0YnoJa1WE0ExAqM/WeHE8oLImmj2FE
 Vtd1WBHemFoXY0DVTmFOQbE=
X-Google-Smtp-Source: APXvYqxboaP56WvyUfWBtqd6lBlGDV5tOX2cOBUI0SeayM/f6RjLyHllS/5Xf06ZPOVBfdqj6Zb4rQ==
X-Received: by 2002:a63:6fcf:: with SMTP id k198mr6545857pgc.276.1565163943744; 
 Wed, 07 Aug 2019 00:45:43 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id l44sm20154449pje.29.2019.08.07.00.45.42
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 07 Aug 2019 00:45:43 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Wed,  7 Aug 2019 00:45:08 -0700
Message-Id: <1565163924-18621-13-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
References: <1565163924-18621-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-riscv] [PATCH v2 12/28] riscv: sifive_e: prci: Fix a typo of
 hfxosccfg register programming
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
X-List-Received-Date: Wed, 07 Aug 2019 07:45:54 -0000

It should use SIFIVE_PRCI_HFXOSCCFG_RDY and SIFIVE_PRCI_HFXOSCCFG_EN
for hfxosccfg register programming.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---

Changes in v2: None

 hw/riscv/sifive_e_prci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_e_prci.c b/hw/riscv/sifive_e_prci.c
index acb914d..c906f11 100644
--- a/hw/riscv/sifive_e_prci.c
+++ b/hw/riscv/sifive_e_prci.c
@@ -89,7 +89,7 @@ static void sifive_prci_init(Object *obj)
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
 
     s->hfrosccfg = (SIFIVE_PRCI_HFROSCCFG_RDY | SIFIVE_PRCI_HFROSCCFG_EN);
-    s->hfxosccfg = (SIFIVE_PRCI_HFROSCCFG_RDY | SIFIVE_PRCI_HFROSCCFG_EN);
+    s->hfxosccfg = (SIFIVE_PRCI_HFXOSCCFG_RDY | SIFIVE_PRCI_HFXOSCCFG_EN);
     s->pllcfg = (SIFIVE_PRCI_PLLCFG_REFSEL | SIFIVE_PRCI_PLLCFG_BYPASS |
                 SIFIVE_PRCI_PLLCFG_LOCK);
     s->plloutdiv = SIFIVE_PRCI_PLLOUTDIV_DIV1;
-- 
2.7.4


