Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i6Gyc-0004Wk-Cj
	for mharc-qemu-riscv@gnu.org; Fri, 06 Sep 2019 12:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56426)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i6GyZ-0004Pm-2o
 for qemu-riscv@nongnu.org; Fri, 06 Sep 2019 12:20:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i6GyX-0004P3-Rm
 for qemu-riscv@nongnu.org; Fri, 06 Sep 2019 12:20:42 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:40331)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i6GyU-0004I4-SR; Fri, 06 Sep 2019 12:20:39 -0400
Received: by mail-pl1-x641.google.com with SMTP id y10so3370535pll.7;
 Fri, 06 Sep 2019 09:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Vbib0cbUUkIHQRqcWKE2WOfXQ0oindO16nPEQFzl/eg=;
 b=tHxXhu8bWiJR4lnUAWoW+LCQTkxaGXp8Ya5uyz/cZcMju71HSxf9+162I3QHwLzdWR
 KkzLCqbb9IpWYQ1TB0EwinN/Bw8upWDfDFQv2M0ZnMAmbcxlbbNODy4ERfxmU6HdY5lb
 wmX287e33R4V+MxJmHoOcRuhqSZRSybegbOWvomPQbAFDM1qrgJTP6fyyqS6V3pMlJx3
 CUvJ5n1k4k82aOYUNLmAPjGSW2oxIgbjLFaqrnfOMI3Npzi3W03Pokw/upjPuBtDNNeb
 0Abt53U1G2FqY9a9stdzygl/VzHNnYZ3WMZQF1mRFsdKYQ3Q+TbpJHPmfplfwHrX55Dq
 dgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vbib0cbUUkIHQRqcWKE2WOfXQ0oindO16nPEQFzl/eg=;
 b=FTt99TNQEGfjVlybnKbtYJ8v9Rs+oCjxOO7QtW9Q0RWJLaLHxMAWf3ldduMR+iEkiA
 Dw0fdNT/uJEyfuP1N7tRMX33es8Svvr6/zo+LAcj+aNFuzwBgS5pdUkwEnrkNbJU5gnd
 i+9to5USvYpd7h8glEKNDNohb/7bY0saKvQexzveMTJ/AnD8mAR77y7gqYR5DozVuBTF
 rT5/gHeSBP+Hmg4rTLJq9h88/lBrj6dIgzajWmIaiATFKWZqDRNVa1n7jdOcLB5FK0PG
 bpfV9/cOfWAJOKVm0QhJeMldE3lMb+57jDyFLmiHwZoNyUgt6gHw9WjYEgyBDngEl5vt
 kQUw==
X-Gm-Message-State: APjAAAXRbd5cocsVOj4sdzN15sYBqsjLwT1EO7kG4ZXiQ8kdDUyoW9Vv
 0EEU2QnN1t7omGauIKwrj8/Ml3EA
X-Google-Smtp-Source: APXvYqyWVNTrYMLqJxPAOozuciHdJGiZWoQwEV5tJazwS5+LB8UZOyBA/QW5f+QohmszRj0LyDe+Mw==
X-Received: by 2002:a17:902:aa48:: with SMTP id
 c8mr10088169plr.330.1567786838049; 
 Fri, 06 Sep 2019 09:20:38 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id f89sm11146228pje.20.2019.09.06.09.20.37
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 06 Sep 2019 09:20:37 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Fri,  6 Sep 2019 09:19:59 -0700
Message-Id: <1567786819-22142-13-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1567786819-22142-1-git-send-email-bmeng.cn@gmail.com>
References: <1567786819-22142-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-riscv] [PATCH v8 12/32] riscv: sifive_e: prci: Fix a typo of
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
X-List-Received-Date: Fri, 06 Sep 2019 16:20:45 -0000

For hfxosccfg register programming, SIFIVE_E_PRCI_HFXOSCCFG_RDY and
SIFIVE_E_PRCI_HFXOSCCFG_EN should be used.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---

Changes in v8: None
Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 hw/riscv/sifive_e_prci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_e_prci.c b/hw/riscv/sifive_e_prci.c
index b6d32db..bfe9b13 100644
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
2.7.4


