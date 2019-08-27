Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i2cwi-0003pP-Ux
	for mharc-qemu-riscv@gnu.org; Tue, 27 Aug 2019 10:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47229)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i2cwd-0003hT-EL
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 10:59:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i2cwZ-0003wq-Uu
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 10:59:39 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:36531)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i2cwS-0003kf-Em; Tue, 27 Aug 2019 10:59:29 -0400
Received: by mail-pl1-x641.google.com with SMTP id f19so11916818plr.3;
 Tue, 27 Aug 2019 07:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=l4mnDEipFGEh17kvXqEfnXVEcHixTpadUgorARruiEM=;
 b=HLCBVXh6PiEHN7SFesL0IEi02juaUmJaVcPPWQzruul4Nq9/oMhFZetytnrK370MNU
 yu7DJte2ZNhnTBdRynP32ARyzcGvrTzqnfUyaVEOi7imendZaapBndy1QWA8zIuR78lQ
 4QrJcxGNTPHmTd5VaBp+t72qKkWqjUi0gr6CSa2KUp1nAsS25XTJ4HlsFPjz26O+/OAG
 rfnSvkiN/3V68AxtSCuu4z1GzW2mBf/lI4xCaJTN+2UVqyHEKfKOQEWVpPXkI3Co68c7
 Etkiq/wC0RBF7SAKUCn9XTBt/DSD1GfedCzwwR84+s8RnIksLI8aYnBzw070vb1fgcom
 4f2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=l4mnDEipFGEh17kvXqEfnXVEcHixTpadUgorARruiEM=;
 b=NaqqVF3uo9qEbuCzHk/eu1b241FgN0PItXiId5a93DiupwATdLQUSBINqhA7RCVCy5
 Tnd5ZYTiW2Ju5FJ2qJA2yWxZios4HfuSDz6T54wTUn9uAIE2wnfBz6GHPpXHpfW8Fchb
 7rvY9QjCXQ1oI9NqrMKlDxDNqxTB2DUgXxWTp9aUx6AigBa5dRm1O0SIaktJ8VfwAZD3
 9RX+mQgfQwa9o4jGklIEI6JxAPHfEohjKcZiDBUg8/mhVxUK/uz88dZFNfmaI9kTQS50
 eRfi+Sdv5N6ntr79xA6lya3ksAyCYUSQAfnyJdwwasKaXhRYqfoGSgNiVCkXOSR+tB8R
 EBEg==
X-Gm-Message-State: APjAAAW5qclx2aYRo9wb9hQ8kw2oXqWY/Z/fPE0FVmLp1tYL2VC27mmd
 exUmlsJgNV+/9l4fFyyd+6k=
X-Google-Smtp-Source: APXvYqzO0X0lNzAPzieS+53NBKuoI1KXh8KEDt8sC9R2zj6OIotLFObxulDzjmJK8FcADVQzkOLRrQ==
X-Received: by 2002:a17:902:b714:: with SMTP id
 d20mr7527653pls.281.1566917951657; 
 Tue, 27 Aug 2019 07:59:11 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id j15sm14839344pfr.146.2019.08.27.07.59.10
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 27 Aug 2019 07:59:10 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Tue, 27 Aug 2019 07:58:32 -0700
Message-Id: <1566917919-25381-24-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1566917919-25381-1-git-send-email-bmeng.cn@gmail.com>
References: <1566917919-25381-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-riscv] [PATCH v6 23/30] riscv: sifive_u: Update UART base
 addresses and IRQs
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
X-List-Received-Date: Tue, 27 Aug 2019 14:59:41 -0000

This updates the UART base address and IRQs to match the hardware.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Jonathan Behrens <fintelia@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>

---

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3:
- update IRQ numbers of both UARTs to match hardware as well

Changes in v2: None

 hw/riscv/sifive_u.c         | 4 ++--
 include/hw/riscv/sifive_u.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 3b1fe46..c7b9f96 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -62,8 +62,8 @@ static const struct MemmapEntry {
     [SIFIVE_U_CLINT] =    {  0x2000000,    0x10000 },
     [SIFIVE_U_PLIC] =     {  0xc000000,  0x4000000 },
     [SIFIVE_U_PRCI] =     { 0x10000000,     0x1000 },
-    [SIFIVE_U_UART0] =    { 0x10013000,     0x1000 },
-    [SIFIVE_U_UART1] =    { 0x10023000,     0x1000 },
+    [SIFIVE_U_UART0] =    { 0x10010000,     0x1000 },
+    [SIFIVE_U_UART1] =    { 0x10011000,     0x1000 },
     [SIFIVE_U_DRAM] =     { 0x80000000,        0x0 },
     [SIFIVE_U_GEM] =      { 0x100900FC,     0x2000 },
 };
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 2a023be..b41e730 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -64,8 +64,8 @@ enum {
 };
 
 enum {
-    SIFIVE_U_UART0_IRQ = 3,
-    SIFIVE_U_UART1_IRQ = 4,
+    SIFIVE_U_UART0_IRQ = 4,
+    SIFIVE_U_UART1_IRQ = 5,
     SIFIVE_U_GEM_IRQ = 0x35
 };
 
-- 
2.7.4


