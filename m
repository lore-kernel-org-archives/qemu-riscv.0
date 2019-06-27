Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgWFm-0001Vp-It
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 11:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60687)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hgWFg-0001O3-4V
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:23:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hgWFQ-0006gb-V7
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:23:45 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33380)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hgWFN-0006bn-UO
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 11:23:38 -0400
Received: by mail-pg1-f193.google.com with SMTP id m4so1187265pgk.0
 for <qemu-riscv@nongnu.org>; Thu, 27 Jun 2019 08:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=Iw6+m+IE1PHOTPzSnV8qMJ+Sj/ZsLxY0VeWDR+SUS50=;
 b=NuPHN7ibbDMm5zHWxFx2b5GhYMm79dZrpGf9eJG3hE9gwPxIehhbSZeT0PXwqyBYHg
 b/xFFxd+8H8GTtUT2Ukk22yCeH/ljIVJbyxOY3P3SK3Wj0QFnLGWcCRHbE8LIVETfLzX
 xd2Kn9BVrgcRnZjLOOfnm8BekgEjJKwhs0zz/JLxw/1G+mdni4I5cFrUsSaBy2ur8B7M
 n9dtkEZBPM1sP1uh+fD/FQLB5vC5n+UcR9lcASujFpYWtQRdVt9thuufpHywGwcdq3xy
 DBvbTEv/ME/G93fDjCk6twBws2+t7ox12jaJ2LNr+o78ZKjAzlMdhJhdfKqo3YFs/+D1
 yuUg==
X-Gm-Message-State: APjAAAUB9IPIruFDQkhbMgFhwp9CAO7Tq5QasiABSV13EPCCONE+1kNi
 G9a+dyz5HhvlQmgTMk4v78pA+JmWSXKAiw==
X-Google-Smtp-Source: APXvYqx7QFAz0ycxwYn64N6rMCpYYUd5z3YRPOnYVpiuJW21aJOrTXHvztilDPsGl48ZbuyUtf2fIw==
X-Received: by 2002:a63:1864:: with SMTP id 36mr2871248pgy.272.1561649014575; 
 Thu, 27 Jun 2019 08:23:34 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id i126sm3786390pfb.32.2019.06.27.08.23.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 08:23:34 -0700 (PDT)
Date: Thu, 27 Jun 2019 08:19:42 -0700
Message-Id: <20190627152011.18686-6-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190627152011.18686-1-palmer@sifive.com>
References: <20190627152011.18686-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
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
X-List-Received-Date: Thu, 27 Jun 2019 15:23:59 -0000

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


