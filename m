Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgukW-0008CE-BA
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jun 2019 13:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54441)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgukP-000880-8T
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgukI-00006O-O7
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:14 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36635)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hguk6-0008Oj-OZ
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:33:01 -0400
Received: by mail-pg1-f193.google.com with SMTP id c13so2889889pgg.3
 for <qemu-riscv@nongnu.org>; Fri, 28 Jun 2019 10:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=Iw6+m+IE1PHOTPzSnV8qMJ+Sj/ZsLxY0VeWDR+SUS50=;
 b=hHXcHI/HGHRPNlebND9lPhzv9B6xenrkoXFbA4E3X/YyLZUog1fenThZ9/+baVuXov
 6JjIzo7vO2gQ6H0QDquNe1Z73XVymIlPkeC9H09CYS47Of0tW4iNzC1dD/LJlXF3ln2O
 65w6vi/1Iv0EujCrVhnbCk1+hJhvimhvFxCyKgIKuQ12+bAW9VG0WVIJGBt5cktFjbsP
 24RNbSixlI9bS0GyGOb2noaCmlWxD7+xisabIhPbaErINdwBsUgeH1ch11bGU8gKITri
 10aUwUEygwMWQztNpcdU+8HBgOu9eDLcbVbQUpJcsmUBqxQFmnFtbjrwEB9yJ/yrujgW
 PMNQ==
X-Gm-Message-State: APjAAAVuvgIKXMwmpxphMEBM1dDmCxt+++Z4jbIqCPIvts1vCTKzLtde
 RDTWepPBn7BPB1z5JOOsPrWK6g==
X-Google-Smtp-Source: APXvYqymAjwa4Tz4sKOs9VqA/HlZehAKSd62LicEez6P7ZcL1MvEl7LLM1kxtkMMt+yIEqwgIbY1wQ==
X-Received: by 2002:a63:b10:: with SMTP id 16mr10133507pgl.336.1561743174451; 
 Fri, 28 Jun 2019 10:32:54 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id l44sm2649849pje.29.2019.06.28.10.32.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 10:32:53 -0700 (PDT)
Date: Fri, 28 Jun 2019 10:31:58 -0700
Message-Id: <20190628173227.31925-6-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190628173227.31925-1-palmer@sifive.com>
References: <20190628173227.31925-1-palmer@sifive.com>
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
X-Received-From: 209.85.215.193
Subject: [Qemu-riscv] [PULL 05/34] RISC-V: Only Check PMP if MMU translation
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
X-List-Received-Date: Fri, 28 Jun 2019 17:33:21 -0000

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


