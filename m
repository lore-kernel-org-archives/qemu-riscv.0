Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hiapZ-0005xS-3H
	for mharc-qemu-riscv@gnu.org; Wed, 03 Jul 2019 04:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51314)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hiapW-0005rE-NI
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hiapU-0006jw-Mp
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:30 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44130)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hiapU-0006hk-Fa
 for qemu-riscv@nongnu.org; Wed, 03 Jul 2019 04:41:28 -0400
Received: by mail-lf1-f68.google.com with SMTP id r15so1137835lfm.11
 for <qemu-riscv@nongnu.org>; Wed, 03 Jul 2019 01:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=EKsqQug7v7zszsNqo0b9Js3bl54LND9OiSrVub9vLW4=;
 b=SJLuRmNp16luKV62lf1eL1zp/Ye40USmSe5DA6Rwz6Uf9Q6u740P/UUPOO72PUU+eT
 xU0nvIaNhzVVOuJFBeAnu1c+tp4jgUPRFL0J1eZxaavU/oOrjIoBPAGZskXkBWQA0MJF
 NosrfHdXdPRXQvN1UKZQNstdaRlZVHDzHSEaOoNrvf/zMNWFSAFqueu6DDLFBplyFSZ9
 pmU9lwbcCSbRT32Q4iy4ChHymkRHQymj+wmxUiFJCeXEIwgAMFkYJfQAQyno/SZcxHCd
 +jy/LI5OfN02882WgnmBeIAmJVEDhvAgQj5DLTiIi2KfKW40uyieb1F2xZfkF11RQg57
 j8tw==
X-Gm-Message-State: APjAAAWj5yBrw8pHbO0q1pgYR2ClKsDvwMJvLfuWjyG2PRxDJM1Ri1x+
 p3KE2tTJITAoDq1dlR/a9oG7aw==
X-Google-Smtp-Source: APXvYqyn4n9521d2hOkcHVW+EI+Acl3piueTwGMcX5TUUBLc+rBNDW9kGpchGKgfDDrE6NEPdilYhw==
X-Received: by 2002:ac2:5c1d:: with SMTP id r29mr1396312lfp.72.1562143287106; 
 Wed, 03 Jul 2019 01:41:27 -0700 (PDT)
Received: from localhost ([134.17.27.127])
 by smtp.gmail.com with ESMTPSA id w1sm377128ljm.81.2019.07.03.01.41.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 01:41:26 -0700 (PDT)
Date: Wed,  3 Jul 2019 01:40:26 -0700
Message-Id: <20190703084048.6980-11-palmer@sifive.com>
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
X-Received-From: 209.85.167.68
Subject: [Qemu-riscv] [PULL 10/32] RISC-V: Fix a PMP check with the correct
 access size
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
X-List-Received-Date: Wed, 03 Jul 2019 08:41:31 -0000

From: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>

The PMP check should be of the memory access size rather
than TARGET_PAGE_SIZE.

Signed-off-by: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/cpu_helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 66be83210f11..e1b079e69c60 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -452,8 +452,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
     if (riscv_feature(env, RISCV_FEATURE_PMP) &&
         (ret == TRANSLATE_SUCCESS) &&
-        !pmp_hart_has_privs(env, pa, TARGET_PAGE_SIZE, 1 << access_type,
-        mode)) {
+        !pmp_hart_has_privs(env, pa, size, 1 << access_type, mode)) {
         ret = TRANSLATE_PMP_FAIL;
     }
     if (ret == TRANSLATE_PMP_FAIL) {
-- 
2.21.0


