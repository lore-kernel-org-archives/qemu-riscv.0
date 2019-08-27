Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i2cwU-0003UU-Qx
	for mharc-qemu-riscv@gnu.org; Tue, 27 Aug 2019 10:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46855)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i2cwL-0003Nj-HI
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 10:59:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i2cwJ-0003mz-GL
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 10:59:21 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:45918)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i2cw1-0003Vq-2W; Tue, 27 Aug 2019 10:59:02 -0400
Received: by mail-pl1-x642.google.com with SMTP id y8so11933328plr.12;
 Tue, 27 Aug 2019 07:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=ErrTzEEaH5aNtZRQ7ubqrvTfgn5HEr8cg14yqsqvLuo=;
 b=qm8P/mEUshfOkuRiceSGWGTZqz/IX9pJTLBn3ssIAQwIoievZrh6aVrb7lteyj8aez
 HSM9YD9EAUrVM75wkq1ruOx+F2ZVun+WEbiFRiUs6ls0pEjZAPgy3oycA/9aV/UjFtx7
 Wlj5s67zIUfaspWevWvSYTKrUojo+PVO5P0RlAZXbTq5EsCNL/ihaU4jmGpHI76QmtLl
 jznzRSw62qfNYYEL3Fzxj8NTHw4q2Hymu1mVeUluZWOwI8gAPtMr5xrcg3rcl15Uc/Av
 GbjfN/hHbxKq8ZC3CFd7Gmu6DXBQllDwAHx63pIIgF01pkJAkXhmDmpfVBG4Yg3OmnBL
 NrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=ErrTzEEaH5aNtZRQ7ubqrvTfgn5HEr8cg14yqsqvLuo=;
 b=ebOK87SO3krZUZlDZs34UNMi3jhBkaauCNRSm8C+UtEcdi9CpdYYo/OPufhJ8euAwi
 nzR763fWazz/7DmgMRNe5ln7/U0bMIf1bDQlNgqk/MH5nhHF7W0V8romwpDJ7RHIvIaj
 jOIbF2nax5Asz7FcSuHY6c3/hN21bYNUymK7hW8dEh11at+EGkHSPZgXRHDdokgfUxnu
 CVf2OKaEo+aUYHyrOOrYw7Ra6Mm3BkfLxS8vy7/N3N09ObyBhACL2e09Gzmskm/C6l/h
 Vs957Ecc5Ov8AY6Y/XHPw83t2zCdWcAKythWJuPYIbopjPAxXXz92YhBCEAd/jN7K635
 BtAg==
X-Gm-Message-State: APjAAAWxV4Hl0fh0dov2uds2+hzWPL+Dw8lvXR2smlGX65SQeVxDlHm4
 FQ0bnj0WHrB/QZNVTOQp5KM=
X-Google-Smtp-Source: APXvYqxgnAO+ds4pEnGHY6HBS7KP2AgX9fhJ4WF42+jEC1REw3fMVF5/ogUd2mXbKvOxmBCkus9I4g==
X-Received: by 2002:a17:902:2be6:: with SMTP id
 l93mr25256352plb.0.1566917937079; 
 Tue, 27 Aug 2019 07:58:57 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id j15sm14839344pfr.146.2019.08.27.07.58.56
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 27 Aug 2019 07:58:56 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Tue, 27 Aug 2019 07:58:20 -0700
Message-Id: <1566917919-25381-12-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1566917919-25381-1-git-send-email-bmeng.cn@gmail.com>
References: <1566917919-25381-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-riscv] [PATCH v6 11/30] riscv: sifive_e: prci: Update the
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
X-List-Received-Date: Tue, 27 Aug 2019 14:59:28 -0000

Currently the PRCI register block size is set to 0x8000, but in fact
0x1000 is enough, which is also what the manual says.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 hw/riscv/sifive_e_prci.c         | 2 +-
 include/hw/riscv/sifive_e_prci.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_e_prci.c b/hw/riscv/sifive_e_prci.c
index 71de089..ad6c624 100644
--- a/hw/riscv/sifive_e_prci.c
+++ b/hw/riscv/sifive_e_prci.c
@@ -86,7 +86,7 @@ static void sifive_e_prci_init(Object *obj)
     SiFiveEPRCIState *s = SIFIVE_E_PRCI(obj);
 
     memory_region_init_io(&s->mmio, obj, &sifive_e_prci_ops, s,
-                          TYPE_SIFIVE_E_PRCI, 0x8000);
+                          TYPE_SIFIVE_E_PRCI, SIFIVE_E_PRCI_REG_SIZE);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
 
     s->hfrosccfg = (SIFIVE_E_PRCI_HFROSCCFG_RDY | SIFIVE_E_PRCI_HFROSCCFG_EN);
diff --git a/include/hw/riscv/sifive_e_prci.h b/include/hw/riscv/sifive_e_prci.h
index c4b76aa..698b0b4 100644
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
2.7.4


