Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbtA-0008Ab-R7
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50064)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsy-0007wJ-1e
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsw-0007EG-Np
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:51 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37961)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbsw-0007Dl-Hw
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:50 -0400
Received: by mail-pf1-f194.google.com with SMTP id h195so207809pfe.5
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:28:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=QB4DlvulPZzUlgaey1nZw8B8imJR4kB3iDL99emwfxg=;
 b=nt6rhZAtBeUO+nXAd56MFW4fNLTC/RoGZl0HzwIzPG0FL8bv0XjRCXNTMJtRUnMTrX
 R1BFQEnlxzFs7JU8fT8CmjAnyz7+MfF83gFObbXAE9597OJ0AGcne0R0SD4nVRJN9Vz/
 A+DRi6KN2IfYa5jsmfhmXZLHsxridzQs3vSQp+h0ncFXH4JOFfQG49p2X5ywRwBLtRs9
 GMNAOMHiq/D2ViqalyL5oxNIO1Lj46uJ78/WotJoz4IVMhYFXyxyJ26TvxTAeqWQAtKp
 pqrsrrP4NI348HOahRoV4XAxDSbf1YI3ayIlhYJ52yDdNmWagWUxvLpobquFcMoL55hP
 Fc4Q==
X-Gm-Message-State: APjAAAWxowE1jCL4wuhZptR/h9Qd/Uvr2Bbt4yqe1l/ycvJo3PdGUCbA
 RbFp5Z1qOK4JH7Z+5JRE3GLI1f1L7OE=
X-Google-Smtp-Source: APXvYqyh4Tei9pFzhVxmZxH3vuFBwYLPZFN5hoNNnLrh2rbOH/VMC/CRzUnsyu6X+HTl32Q52CoOJQ==
X-Received: by 2002:a17:90a:983:: with SMTP id 3mr4473226pjo.57.1568820529141; 
 Wed, 18 Sep 2019 08:28:49 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 193sm8474716pfc.59.2019.09.18.08.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:28:48 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:38 -0700
Message-Id: <20190918145640.17349-47-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.194
Subject: [Qemu-riscv] [PULL 46/48] target/riscv: Fix mstatus dirty mask
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
X-List-Received-Date: Wed, 18 Sep 2019 15:28:56 -0000

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


