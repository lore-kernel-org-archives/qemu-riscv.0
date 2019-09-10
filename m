Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xwD-00088T-VX
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:25:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57447)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xw8-00080p-B1
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xw7-0006gh-3u
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:12 -0400
Received: from mail-wm1-f43.google.com ([209.85.128.43]:38870)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xw6-0006ej-UF
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:11 -0400
Received: by mail-wm1-f43.google.com with SMTP id o184so2377376wme.3
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=tDJG1p1Bp8CpFD/Bq7K8CLsWHyHj5vOvpUlOoU/iQGc=;
 b=cPsaUfE/cXTnY8BxqbrsixvM9HL/PUoFOmpJMderStmsxzL+lJnaPSKkCP0Tkeyexm
 vmKRPVF+CQEdW6IEG/JK9O/XIDhi7mamk3pOXBl5HvBhdT2VtCp6XAUuxklOZAgT8eDb
 tpPZia7mlvrJwlT7T4L8GWEeMaLYmueQrETLMhgdkMZ0O5JHtF4dw88ZM3nXZFWziLIh
 24f+R6gZ8qgwoiEaLKer8FzW5DMBYgY65BZsU7KmzdegDL/faT5NzM3lRQUVovILe9HR
 mkUI/3fKJjYCEnJYqVLdLma5m5kS2/L68o0G5WehASFoGDDSTavu7x/AOfm9Vw05rVb5
 mORg==
X-Gm-Message-State: APjAAAXQLyTgcZZdrpkbz1mRdpgbLOY00kXQZW80poYNbXgiHjAI/huo
 i9XsNiO0lUK8m2dv3THFnWrWv078VNQixQ==
X-Google-Smtp-Source: APXvYqyEYYly2tpyzGRbaToJmG5d7YSHJxgjTw6YHQvljQO7ws4EdEJAcSpB9PIKgI5zGJa9jkIs2w==
X-Received: by 2002:a1c:701a:: with SMTP id l26mr3051025wmc.90.1568190309436; 
 Wed, 11 Sep 2019 01:25:09 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id i73sm2042693wmg.33.2019.09.11.01.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:25:08 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:04:51 -0700
Message-Id: <20190910190513.21160-26-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Chih-Min Chao <chihmin.chao@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.43
Subject: [Qemu-riscv] [PULL 25/47] riscv: sifive_e: prci: Update the PRCI
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
X-List-Received-Date: Wed, 11 Sep 2019 08:25:15 -0000

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


