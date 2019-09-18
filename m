Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbsZ-0007J6-Au
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49504)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsU-0007Be-Bi
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsT-0006s4-4G
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:22 -0400
Received: from mail-pf1-f174.google.com ([209.85.210.174]:41086)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbsS-0006rg-TQ
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:21 -0400
Received: by mail-pf1-f174.google.com with SMTP id q7so193737pfh.8
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=r6cr511A/xs0M+5DL630HqnuaMziajwdPSyYPcj6+yE=;
 b=L9mztqbtl6UW2wwsmOC2oF3+SAj+pslQ/jB0HCLYjPBkYteqsTfAn6CuLxy/0yM7EV
 /3yaCnTnygsWMyiZ4PniVPdl5odVumORFS4sg2IcRSsSYcpcQjH5w9EGmcCxXstcb5VO
 xosO7TNTPrZJQxvGUYijOZauX1s+fwhW9uJteBYOjJ8fdcKV8Y6fPCqoz72O09vzb2xJ
 4P+t4wPYP/lTxbj+grTIl1AfrSywd1xoZR3rr6ESzLRkGah8TCNAQShH2TTBQg/D7v6T
 ZeCC6skiwsspLo3xX5LY3gB+DFFDgXXJ8/CSzmHEfJ63FzhOhe1Ta40VUpkqeD6kv45A
 HZPQ==
X-Gm-Message-State: APjAAAVO1R3ciD5p6V6ThdkExMmYWoKSxR8KaqTEBfepaYm7ze34E4i8
 LLZcRWFHXcEbTt/HFR8ztCKM6VlW6C4=
X-Google-Smtp-Source: APXvYqwifxFpkAI3SRm0Bot4DuNoiBJNixgszV8u1U44CAff2UFzq2xDUeemzi+5317GKu7Dtw6c6A==
X-Received: by 2002:a63:1020:: with SMTP id f32mr4670737pgl.203.1568820499505; 
 Wed, 18 Sep 2019 08:28:19 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id g5sm6738029pfh.133.2019.09.18.08.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:28:18 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:16 -0700
Message-Id: <20190918145640.17349-25-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
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
X-Received-From: 209.85.210.174
Subject: [Qemu-riscv] [PULL 24/48] riscv: sifive_e: prci: Fix a typo of
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
X-List-Received-Date: Wed, 18 Sep 2019 15:28:25 -0000

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


