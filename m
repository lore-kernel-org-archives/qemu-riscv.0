Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xwj-0000T4-N5
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58023)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwb-0000HM-KB
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xwa-0006zu-Fs
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:41 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38647)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xwa-0006zU-Ar
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:25:40 -0400
Received: by mail-wr1-f67.google.com with SMTP id l11so23431336wrx.5
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:25:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=QB4DlvulPZzUlgaey1nZw8B8imJR4kB3iDL99emwfxg=;
 b=fC+sviaI1BqoImqownQa9fF/za1h6QiCdui1VJKT9s0ak+rdNcxhIpevM7KlUyiUVZ
 /c9hWOGVsF06nR3QtlxfSBx/txeFwx62FUzdPO4msvAFg85aKeiURtbc5NtwNby9IdNG
 2QLozm+u+rgp2OOBIzcKxezsgaHVoXEYVSFR+JOwOsKUI28jNNjaAitbS+p3+GGFcGmQ
 0CxbATY5Wj5hNWzd85A3zoLn9ObhwtbtpqPkURDgqY4H9fmqdICRqPg3AqyTAUskAvSb
 XA476Z+EdKvc8mEZGN6UgPU1AWAow3V0oNZleHK7S1cTaQwQiOqEHFw+2x9CgJlwBSpb
 3dSw==
X-Gm-Message-State: APjAAAVtr8OGAkFhU4bO/Sfd0r4zaWz8XoLoJF8PAfX/aj8G1hsGbChT
 1sTfrOacBOH+db7smDXocttplWUtndWW9g==
X-Google-Smtp-Source: APXvYqySMhkyTSZ60wpMMUzTTqVPElAoQ+8pTP4Z5PS3qMY7B5Jpmj8ilJUui7Jkqj8RGxs+aD90Vg==
X-Received: by 2002:a5d:4b46:: with SMTP id w6mr20703928wrs.223.1568190338956; 
 Wed, 11 Sep 2019 01:25:38 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id m18sm26670979wrg.97.2019.09.11.01.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:25:38 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:05:12 -0700
Message-Id: <20190910190513.21160-47-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: [Qemu-riscv] [PULL 46/47] target/riscv: Fix mstatus dirty mask
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
X-List-Received-Date: Wed, 11 Sep 2019 08:25:45 -0000

From: Alistair Francis <alistair.francis@wdc.com>

This is meant to mask off the hypervisor bits, but a typo caused it to
mask MPP instead.

Fixes: 1f0419cb04 ("target/riscv: Allow setting mstatus virtulisation bits")
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 2789215b5e..f767ad24be 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -335,7 +335,7 @@ static int write_mstatus(CPURISCVState *env, int csrno, target_ulong val)
              * RV32: MPV and MTL are not in mstatus. The current plan is to
              * add them to mstatush. For now, we just don't support it.
              */
-            mask |= MSTATUS_MPP | MSTATUS_MPV;
+            mask |= MSTATUS_MTL | MSTATUS_MPV;
 #endif
     }
 
-- 
2.21.0


