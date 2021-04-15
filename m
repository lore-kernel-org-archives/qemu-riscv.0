Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lX2G6-0004Vv-F5
	for mharc-qemu-riscv@gnu.org; Thu, 15 Apr 2021 09:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@sifive.com>)
 id 1lX2G4-0004Uy-Gf
 for qemu-riscv@nongnu.org; Thu, 15 Apr 2021 09:42:12 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <emmanuel.blot@sifive.com>)
 id 1lX2G2-0008KK-Qc
 for qemu-riscv@nongnu.org; Thu, 15 Apr 2021 09:42:12 -0400
Received: by mail-wr1-x429.google.com with SMTP id m9so10617368wrx.3
 for <qemu-riscv@nongnu.org>; Thu, 15 Apr 2021 06:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bZhQQpdTQsEBhrG8zAEQYhr9aQxWjtWt0wFDSGNe9zM=;
 b=UiRzeKgcVab84vSZL14veYXuFqwal+KSjCGWVzRIpeK9gBVFRc3qoxXp2bsGQi8u5W
 Xg5Qgo7FnwigsGBCz0CMRV+lCrbHoGxFhFlxnldVE7kh6A6Uyw75KMJwYT8JnN2M1/cr
 cBlyFPSvCjHssK396JSnUrBNEm2O0wlP4nXyCDbboK7MQpFgQmIyTDkjvEyiCKQZBp3i
 ne7fj3PnyJiMJli0K2y8TaGG2PGV5Hq6D/PapcOiI1mKBk2DuLoqVj5DsyvGygV/Rzu7
 5M3Z172oCtBdgzAwX+zI4cgphmpi4X12aNUJJ09zy+jXN7W37OVdXqN/zDHpPuMETCnI
 2YvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bZhQQpdTQsEBhrG8zAEQYhr9aQxWjtWt0wFDSGNe9zM=;
 b=MGfLGMuo71SiaEcYtFKXawfO7AN8abLj+fJPu4ADuj53h/9JgyiDmlYK22KdOpldXL
 vVY8o2U83O40dy/gU0UEyh9Y/ZrRonll9yEtBCYIZ39ACFz+GsRcsvL4F1bC8nvZgI0n
 Dxi4R4cFSby8dy62fFPPfm6FARLxIHUEnJ0g/KQ/5i+OGSpd+RlJh85Jwh/8DTvIMoNt
 JGvc1qmoymTWUQNUp4tewlXWxVybdpvR5nXtIgZEjLd+1IyEb0nLxWQt/kMkE4jzy2hb
 gmNYrgb6PhglEdQFe0GrvICleYwWxF0/JDT22JiPo9NTS4idyRKSKojul6wSfkX83HI8
 dMpQ==
X-Gm-Message-State: AOAM533N15iNmvaF0LYwfdBBtsjPjXc4OEBFOoLJxMPttoeqqYWILvjU
 ZXcA+YhfbOxkRal2BpClzefjpTO4xuWwjg==
X-Google-Smtp-Source: ABdhPJx/2DTOE797oSKBDQvD1s7VzBPCjNKy3vAw19ydOfYGNSoexFSgo0j4LOFfgaP9PE1BX8ourg==
X-Received: by 2002:a5d:6182:: with SMTP id j2mr3562030wru.317.1618494128783; 
 Thu, 15 Apr 2021 06:42:08 -0700 (PDT)
Received: from glencoe.iroazh.eu (lfbn-tln-1-134-231.w90-119.abo.wanadoo.fr.
 [90.119.102.231])
 by smtp.gmail.com with ESMTPSA id i133sm2893951wmi.40.2021.04.15.06.42.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Apr 2021 06:42:08 -0700 (PDT)
From: Emmanuel Blot <emmanuel.blot@sifive.com>
To: qemu-riscv@nongnu.org
Cc: Emmanuel Blot <emmanuel.blot@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: 
Date: Thu, 15 Apr 2021 15:41:29 +0200
Message-Id: <20210415134128.32670-1-emmanuel.blot@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=emmanuel.blot@sifive.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Thu, 15 Apr 2021 13:42:12 -0000

Date: Tue, 13 Apr 2021 18:01:52 +0200
Subject: [PATCH] target/riscv: fix exception index on instruction access fault

When no MMU is used and the guest code attempts to fetch an instruction
from an invalid memory location, the exception index defaults to a data
load access fault, rather an instruction access fault.

Signed-off-by: Emmanuel Blot <emmanuel.blot@sifive.com>

---
 target/riscv/cpu_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 21c54ef5613..4e107b1bd23 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -691,8 +691,10 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
 
     if (access_type == MMU_DATA_STORE) {
         cs->exception_index = RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
-    } else {
+    } else if (access_type == MMU_DATA_LOAD) {
         cs->exception_index = RISCV_EXCP_LOAD_ACCESS_FAULT;
+    } else {
+        cs->exception_index = RISCV_EXCP_INST_ACCESS_FAULT;
     }
 
     env->badaddr = addr;
-- 
2.31.1


