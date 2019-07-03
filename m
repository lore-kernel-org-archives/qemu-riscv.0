Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hiapO-0005V7-CL
	for mharc-qemu-riscv@gnu.org; Wed, 03 Jul 2019 04:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51156)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hiapM-0005QC-DC
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hiapL-0006MT-5r
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:20 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37098)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hiapK-0006Jy-Us
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:19 -0400
Received: by mail-lf1-f66.google.com with SMTP id d11so1167725lfb.4
 for <qemu-riscv@nongnu.org>; Wed, 03 Jul 2019 01:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=Iw6+m+IE1PHOTPzSnV8qMJ+Sj/ZsLxY0VeWDR+SUS50=;
 b=QZAWJtUGHV5Ml6/7+1ASORBt5Y6y4D1LkJlQTKVbKKZoRwVex4fRmUZrpnx5ZvOG0S
 pmyKlltX5notN4XYYpW3b2p6l1U13WIkASxkz0JgYEIbclm8voV1RZae3phvHKcUVtrB
 /4C9Q11sqgCwA22ELiUosms0bH00x6l9DGcjG7YuRpY1dePy0S+0Cvd1OPiXzNwufsLk
 GQIA6hlck4kckjgdte4lj22+yGq1+HgVHjljpbQRaqS89TMF/nIezaDjpRdB5A5He02t
 w8cXXzATeYYbFD8bPPGpHOu+1CHCrcbfytsGel6E/z2/5mbKaNev+jqdulmBuTxHCQpi
 5Uwg==
X-Gm-Message-State: APjAAAXTorC9CT11qZiZexG09AHuOpt67WaH6Jy/fZSufkPgGe4UL3XU
 u9RGl6bSWiEjznXRCumBh88CcQ==
X-Google-Smtp-Source: APXvYqyD2geL54/IecLleCVNRJhL1FuwmL1PgQ0OqEd1/qV28tqnI1mUx0wjwKSQQxY4HIbEgE8X4g==
X-Received: by 2002:a19:ca1e:: with SMTP id a30mr17007066lfg.163.1562143277601; 
 Wed, 03 Jul 2019 01:41:17 -0700 (PDT)
Received: from localhost ([134.17.27.127])
 by smtp.gmail.com with ESMTPSA id 126sm208684lfm.44.2019.07.03.01.41.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 01:41:16 -0700 (PDT)
Date: Wed,  3 Jul 2019 01:40:21 -0700
Message-Id: <20190703084048.6980-6-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703084048.6980-1-palmer@sifive.com>
References: <20190703084048.6980-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.167.66
Subject: [Qemu-riscv] [PULL 05/32] RISC-V: Only Check PMP if MMU translation
 succeeds
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
X-List-Received-Date: Wed, 03 Jul 2019 08:41:21 -0000

From: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>

The current implementation unnecessarily checks for PMP even if MMU translation
failed. This may trigger a wrong PMP access exception instead of
a page exception.

For example, the very first instruction fetched after the first satp write in
S-Mode will trigger a PMP access fault instead of an instruction fetch page
fault.

This patch prioritises MMU exceptions over PMP exceptions and only checks for
PMP if MMU translation succeeds. This patch is required for future commits
that properly report PMP exception violations if PTW succeeds.

Signed-off-by: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 0bbfb7f48b79..a45b05ef8395 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -436,6 +436,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                   " prot %d\n", __func__, address, ret, pa, prot);
 
     if (riscv_feature(env, RISCV_FEATURE_PMP) &&
+        (ret == TRANSLATE_SUCCESS) &&
         !pmp_hart_has_privs(env, pa, TARGET_PAGE_SIZE, 1 << access_type)) {
         ret = TRANSLATE_FAIL;
     }
-- 
2.21.0


