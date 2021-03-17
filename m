Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lMaAb-00082V-50
	for mharc-qemu-riscv@gnu.org; Wed, 17 Mar 2021 13:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=703660e7d=alistair.francis@wdc.com>)
 id 1lMaAU-0007xs-2O; Wed, 17 Mar 2021 13:41:14 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:50478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=703660e7d=alistair.francis@wdc.com>)
 id 1lMaAQ-0006uT-5E; Wed, 17 Mar 2021 13:41:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616002876; x=1647538876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hvP1fnwcwS3eNxqGwnTTpW7krCR2yGIVH5UQyMR2jvs=;
 b=Ofgz2JPjzdfNo8sPGFSVt5I9deyX58Wrvo0Ha/H+79WBOXldzZxJ07UY
 ztBzNkQ6J9Cdyxj4CiwJ8AP+NmJAO8paIadSns4fCMFpZHhdzIdjTnci2
 Tb0dN7dTClZozftJYdZF6DBLLdOJLl6X1zrdU4gqSy4ge6mcqClHDAqI+
 Hi91w9JJfHVF0Gaj+9TUn5qQ5q1xg45kYZpVW56b9nQykCXImmC584gEl
 FlPHciAd91MGnkhmwxwISqdDfvLXK0CARG5TeKfSy5N0AEk+A4zVnxemp
 Psl+j4tT1QVy0QkdguEaDEu0N4lbKwQzUlRxqfKwPSARqrz4N76vajT7u w==;
IronPort-SDR: zQ5QFWCkiLOHJ40O6T6tIk39KC+b63ze1qRxyR1HwcaVeX9kftRyxfWbq9oqLKDaugY/i1i2D1
 oOKwW1NLGovJtgcPEH/+pxd4Z9f/Re4E2O0b+s/uM81wnyfKTjRlnNe4LISWjZyT9aB3wlWQFU
 kABxyKSsLITQnUz2iG7wHdaTX+mgpDfPHlYIsLdE/OBRTwB5XThU7NJjhJWkbOb2Usv52z1cuX
 sDzehzpT7mFbaV47WQG3LWrzsCkSptPbACamlDGSLTbhyCIaRHav2wmFnQcsed+jMdgp8HnX7F
 rCw=
X-IronPort-AV: E=Sophos;i="5.81,257,1610380800"; d="scan'208";a="266778852"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Mar 2021 01:41:13 +0800
IronPort-SDR: zkVy/U+FvSQ2XZC7djU5InjGr8dwJcBsA7xKDOu6wWZjHsXT/Dw2CFGr8GcVdJZFLqhlXYobH5
 HFt6ditLDsP6Wo76VX9Mf6eYyTvaftGluhcQoq6KwSmi9XiwcjUDeyNKm1MondWNNhdAmSpH6Y
 k4OfEpZdjEDCrozEYFi8lzh8mYkTmoa/ji8cQgQ6gSDRZcb0PmhLWiMlP7+W0OsSm2YgSv7lCf
 Bvo5jt2tZO1Nxa5sNy1EF2MxuEVNPzz4S8HVpv6uhaBh4wC4R1+RSRDRN/zvz7KYZPuvBsIGHg
 jzlqgRJA5wjYbowYgxmHGJyq
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 10:23:27 -0700
IronPort-SDR: AVFyNUFnF3/BWC4uiXgEDdW7bdA+m9omB+YrGmOE4d2wYZDvy6YBDnDItKEYrjvAhw9DG9jxAY
 iOLpHueRVKTUIMAm4RzGxRMCJohLH7u7FffqtoYopoca0UFnTphexF9Z14e/w0a/K4u6d0+lje
 x//wj8eKOZ1cwRelHvlMPSWTszcxEgBwduUtkjoQoySgKdSMQih78xlNoi4mDZkyGgl8zO9d+P
 dIeDX6nkp2LtD4kFKgrx0KRrJJOah+1+SJII0rJJsutA2l5TOTep1gBM8Eq3Rr9JK7sY58W2Al
 ydo=
WDCIronportException: Internal
Received: from fvwlp12.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.223])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Mar 2021 10:41:08 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 3/5] target/riscv: Fix 32-bit HS mode access permissions
Date: Wed, 17 Mar 2021 13:39:55 -0400
Message-Id: <36b83d45e6cdc072574363b6ea937b0a5dad245a.1616002766.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <cover.1616002766.git.alistair.francis@wdc.com>
References: <cover.1616002766.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=703660e7d=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Wed, 17 Mar 2021 17:41:19 -0000

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index da9baff6fb..d10f47c3fb 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -181,7 +181,11 @@ static RiscVException hmode(CPURISCVState *env, int csrno)
 static RiscVException hmode32(CPURISCVState *env, int csrno)
 {
     if (!riscv_cpu_is_32bit(env)) {
-        return RISCV_EXCP_NONE;
+        if (riscv_cpu_virt_enabled(env)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        } else {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
     }
 
     return hmode(env, csrno);
-- 
2.30.1


