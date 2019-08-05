Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hufPr-0000kf-ML
	for mharc-qemu-riscv@gnu.org; Mon, 05 Aug 2019 12:00:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58511)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hufPi-0000e5-S9
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 12:00:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hufPh-0002xC-97
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 12:00:46 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:42400)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hufPe-0002vN-R7; Mon, 05 Aug 2019 12:00:42 -0400
Received: by mail-pf1-x442.google.com with SMTP id q10so39857884pff.9;
 Mon, 05 Aug 2019 09:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=2MH7twmDJfeZRj3jUDtzUjwhHh0CGkZ/MkdqWVYWSCk=;
 b=YkT290T2q3RvuBJ0Z7qI2GlKYk5/YpRjrDAZJh6xeEbrIktmwrwvR4Bw1tLeXXfhnQ
 SWmJ4I1pgxElDSBQqI90YBeuN3mGAwE2TFJh1X1Mc7/1ZPT8YtdD6h6Ej1KehgD+AkGe
 kKSQ5jlDOKh5Mr1Ft3b8RXwnYXYzkr5UUrlgRPXih22WFrEE3FAbxC7EPQcYaeuoLQnY
 gZHZ/qTiTeMB/VrMZ7gZqoqEU45lmTie6npo8+MOFn3TP2D+mDQyrXbb2o/R6Fyy7KZ/
 IOD59y3lXH9JxU3gM0viOhbSaD62yO2eXFFsvv4Lmt0vEgcxIi8FVEBllkmdkLii8pqy
 uwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=2MH7twmDJfeZRj3jUDtzUjwhHh0CGkZ/MkdqWVYWSCk=;
 b=mJEaoE/v1QGNEPAz/aw0UPA0ZB4MVqADIkGQDUJrTpaShjtKUHqXaEGlE27lptH95K
 SwFbD/eVEBjTJ+7nmg2dV8htlDLRhRM1edsws30DlUbOXDz9Fhc+Bjv2nJv/3vR3fZTy
 zlytWWo+ov0sUZM23ZoPk9yGsum2mKRbuEDqMhV4fryMG5Jz7RgBgAZJbxx86Afx2uSK
 GVPBHN7nH8j0ilqPTLnmOZe6i724B7m9/sl7LyP/B7PN1NZYwtZEtpsS83QIE53D7AgI
 xD0eJWvekh9DKc42a76vH+AZBuEuG8FcA+YGoGY3fNQV4N7KI82o0aTXYVycz5CjDjTl
 ykJQ==
X-Gm-Message-State: APjAAAW5J4Q0Uw/BWgtHqkgecTIVxYUINtYlhm/43wUmM2GBVNCMw707
 bBLCyk/YsjfJVAQ6Zjv8re4=
X-Google-Smtp-Source: APXvYqzLAlbXmRq6+RKapxCcfKnpTpATB3orDKl8rPmPdXLfzjaBEGJRkfmpQYft+L7BQKbqsX83jg==
X-Received: by 2002:a62:79c2:: with SMTP id
 u185mr74960737pfc.237.1565020841964; 
 Mon, 05 Aug 2019 09:00:41 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id d18sm47728793pgi.40.2019.08.05.09.00.41
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 05 Aug 2019 09:00:41 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Mon,  5 Aug 2019 09:00:08 -0700
Message-Id: <1565020823-24223-14-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1565020823-24223-1-git-send-email-bmeng.cn@gmail.com>
References: <1565020823-24223-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-riscv] [PATCH 13/28] riscv: sifive_e: prci: Update the PRCI
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
X-List-Received-Date: Mon, 05 Aug 2019 16:00:54 -0000

Currently the PRCI register block size is set to 0x8000, but in fact
0x1000 is enough, which is also what the manual says.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

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


