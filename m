Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mOQdQ-0007GH-1C
	for mharc-qemu-riscv@gnu.org; Thu, 09 Sep 2021 16:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=87996f883=atish.patra@wdc.com>)
 id 1mOQdP-0007Fy-0I; Thu, 09 Sep 2021 16:26:59 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:38860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=87996f883=atish.patra@wdc.com>)
 id 1mOQdM-0000Qk-QP; Thu, 09 Sep 2021 16:26:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631219216; x=1662755216;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OUpxuQwgM63cpijDUX+aSzm40706iupwmIz2OuxTpCc=;
 b=lQatOevammF9/nB9c+oiEed7EZjda9exLdIk2LJPKWOUMl/7ei3DNMFy
 KmUSahtOJ/BidCozgASBcbrk+NB2vqRyKEZhFx5jBqmISYCjHJFMvB0lc
 D/+jv6jxUP7vJJOpxPTfoIMV1dFcM7JflorENFoK/w8Fe0bQUVmR6A8J1
 +FA10qqwfUlqx87EDGMKwrgwDpjrb/cvgO82pZlfZsXhY1R3Q3xkwzWH5
 UKxcfJpLD4VKQi6e+KKTKllbUjFA69wGPQ1tDYtgWGLWQj0MMAnAw/Sgs
 R1vHe/ptnTUGjwmRTllUJLmyrS6yP3PAWC1h9zaGRniPcrS+qzsTS6+d7 Q==;
X-IronPort-AV: E=Sophos;i="5.85,281,1624291200"; d="scan'208";a="178710290"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Sep 2021 04:26:51 +0800
IronPort-SDR: WgGzA9hl5CZxZw8ijrM73oMSgBEujkjUuRJ2WRswR2FN895xFsSO45v1SwkTFlA2WBFDOoET9B
 Ou25D8EI0S5PRBrPpZp7p9YxF8ke/Mvv/xzyaC3JvBAptGc6UyVdPKYgJD1daN/UXbsES3ziHc
 C4h3bPsWoEELd1x6wjknew5fVw2/Anlu42M987e7JpZNWLNa6yM5bTV+cFqHMAppBxAB23Vzdh
 bFTOV6i2mCLfwpBiwgulOxd6iPOWBYuq4rfM/hJu06K/X6Dwr+bZIyQGuLUtCOVOo71G1LlVaF
 yg5ygE9iSqxurwUdydFsfME8
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 13:03:25 -0700
IronPort-SDR: ebjzbzG2gJL7pZdtHd9V3hbd0Y4dgRRpwLNdVY6mvql/uZXkabMr8zl6vioZJY6nDyc8FmE956
 /vGi8Awbpv/XKe+PDV5bQ+iQ861ih3WDynjiaYMezcI7HOp0Q4eQJVX3xOpxra86AgmF3NOnj/
 fFW+TEyQa9OFiSpuzq83ypZ2dg4h68W+9AFiZe0ORSmLytt5aFZ2fKW7RUQhenDNo3Qyo9vTk9
 Lo4Em2Chk3xjSzJ1IaTb1ugqpBbT3buNjBpDgHMNPambZmtjyiu0UQp7H6ZR13aAnzRK7snvxc
 JVk=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Sep 2021 13:26:51 -0700
From: Atish Patra <atish.patra@wdc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [ RFC v2 1/9] target/riscv: Fix PMU CSR predicate function
Date: Thu,  9 Sep 2021 13:26:31 -0700
Message-Id: <20210909202639.1230170-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909202639.1230170-1-atish.patra@wdc.com>
References: <20210909202639.1230170-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=87996f883=atish.patra@wdc.com; helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Thu, 09 Sep 2021 20:26:59 -0000

Currently, the predicate function for PMU related CSRs only works if
virtualization is enabled. Ideally, they should check the mcountern
bits before cycle/minstret/hpmcounterx access. The predicate function
also calculates the counter index incorrectly for hpmcounterx.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 target/riscv/csr.c | 62 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 58 insertions(+), 4 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9a4ed18ac597..0515d851b948 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -62,12 +62,64 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
 #if !defined(CONFIG_USER_ONLY)
     CPUState *cs = env_cpu(env);
     RISCVCPU *cpu = RISCV_CPU(cs);
+    int ctr_index;
 
     if (!cpu->cfg.ext_counters) {
         /* The Counters extensions is not enabled */
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    if (env->priv == PRV_S) {
+        switch (csrno) {
+        case CSR_CYCLE:
+            if (!get_field(env->mcounteren, HCOUNTEREN_CY)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_TIME:
+            if (!get_field(env->mcounteren, HCOUNTEREN_TM)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_INSTRET:
+            if (!get_field(env->mcounteren, HCOUNTEREN_IR)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
+            ctr_index = csrno - CSR_HPMCOUNTER3 + 3;
+            if (!get_field(env->mcounteren, 1 << ctr_index)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        }
+        if (riscv_cpu_is_32bit(env)) {
+            switch (csrno) {
+            case CSR_CYCLEH:
+                if (!get_field(env->mcounteren, HCOUNTEREN_CY)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_TIMEH:
+                if (!get_field(env->mcounteren, HCOUNTEREN_TM)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_INSTRETH:
+                if (!get_field(env->mcounteren, HCOUNTEREN_IR)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
+                ctr_index = csrno - CSR_HPMCOUNTER3H + 3;
+                if (!get_field(env->mcounteren, 1 << ctr_index)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            }
+        }
+    }
+
     if (riscv_cpu_virt_enabled(env)) {
         switch (csrno) {
         case CSR_CYCLE:
@@ -89,8 +141,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
             }
             break;
         case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
-            if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3)) &&
-                get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3))) {
+            ctr_index = csrno - CSR_HPMCOUNTER3 + 3;
+            if (!get_field(env->hcounteren, 1 << ctr_index) &&
+                get_field(env->mcounteren, 1 << ctr_index)) {
                 return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
@@ -116,8 +169,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
                 }
                 break;
             case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
-                if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3H)) &&
-                    get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3H))) {
+                ctr_index = csrno - CSR_HPMCOUNTER3H + 3;
+                if (!get_field(env->hcounteren, 1 << ctr_index) &&
+                    get_field(env->mcounteren, 1 << ctr_index)) {
                     return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
                 }
                 break;
-- 
2.31.1


