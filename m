Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xwB-00084h-31
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57411)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xw6-0007yW-DO
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xw5-0006d0-Cb
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:10 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36213)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xw5-0006ch-7g
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:09 -0400
Received: by mail-wm1-f68.google.com with SMTP id p13so2381713wmh.1
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=r6cr511A/xs0M+5DL630HqnuaMziajwdPSyYPcj6+yE=;
 b=lwinWcLxmpx+vhEu3CmHe9Ikrv0VVi7KILZ/xqR/+aeGHXokBOdcvUpv4ssCEoGR4x
 kSCfxHSBYRmeAUsJkriSEgrjFpWMXp2XBRo72QzeCsUyBLN++rhwjtkjTdbhzWfPuW+M
 OT72op4y7Z9M8KEQiy3ktlpdpWv9Hqxs7Xprbs7b80PJlrFUhqideE/lcooq0U15Bd0E
 AYvmZcNz+iVLqmUPYBbxWV4jKoY94UjIdOdx/dN3CvL2OUf9l42axwhwzqQA01e7gKDc
 pQ1+PeOF2lnohrtLnVhH9oXvuxtFFFwXa6Xe7+tH7o40XSqADX9AN9SR25AjQGTEiFpf
 cEeQ==
X-Gm-Message-State: APjAAAWC2kewLq68kczWXWfbCrUycdhUv2+c3EFiJ//MRWY+PXNniUUD
 zoLwjhwUs3NVPh9Ky71oMIc5RhgWS4BfmQ==
X-Google-Smtp-Source: APXvYqxxwIlQc6/gySCDFOhY0mdlFOM5AulhmwmemVZ0gn6znsVoa8zvDJKESkCbBodWJuaY5+By6Q==
X-Received: by 2002:a1c:f519:: with SMTP id t25mr1534377wmh.167.1568190307865; 
 Wed, 11 Sep 2019 01:25:07 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id d9sm34940700wrc.44.2019.09.11.01.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:25:07 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:04:50 -0700
Message-Id: <20190910190513.21160-25-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 ilippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, 
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: [Qemu-riscv] [PULL 24/47] riscv: sifive_e: prci: Fix a typo of
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
X-List-Received-Date: Wed, 11 Sep 2019 08:25:13 -0000

From: Bin Meng <bmeng.cn@gmail.com>

For hfxosccfg register programming, SIFIVE_E_PRCI_HFXOSCCFG_RDY and
SIFIVE_E_PRCI_HFXOSCCFG_EN should be used.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_e_prci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_e_prci.c b/hw/riscv/sifive_e_prci.c
index b6d32db935..bfe9b13a67 100644
--- a/hw/riscv/sifive_e_prci.c
+++ b/hw/riscv/sifive_e_prci.c
@@ -91,7 +91,7 @@ static void sifive_e_prci_init(Object *obj)
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
 
     s->hfrosccfg = (SIFIVE_E_PRCI_HFROSCCFG_RDY | SIFIVE_E_PRCI_HFROSCCFG_EN);
-    s->hfxosccfg = (SIFIVE_E_PRCI_HFROSCCFG_RDY | SIFIVE_E_PRCI_HFROSCCFG_EN);
+    s->hfxosccfg = (SIFIVE_E_PRCI_HFXOSCCFG_RDY | SIFIVE_E_PRCI_HFXOSCCFG_EN);
     s->pllcfg = (SIFIVE_E_PRCI_PLLCFG_REFSEL | SIFIVE_E_PRCI_PLLCFG_BYPASS |
                  SIFIVE_E_PRCI_PLLCFG_LOCK);
     s->plloutdiv = SIFIVE_E_PRCI_PLLOUTDIV_DIV1;
-- 
2.21.0


