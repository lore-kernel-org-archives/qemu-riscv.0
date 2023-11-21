Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0B0C5ACB3
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 07:18:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r5L1U-0007H0-9s; Tue, 21 Nov 2023 02:18:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1r5L1R-0007EP-GF; Tue, 21 Nov 2023 02:18:13 -0500
Received: from mta-04.yadro.com ([89.207.88.248])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1r5L1O-0003j9-KC; Tue, 21 Nov 2023 02:18:13 -0500
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com C5F7FC0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-04; t=1700551087;
 bh=xJISpx4rx9AoHbDVBMOwJVn71cS/lx+g2kjhdfZOPT4=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=Dejf1RVyz+z1rzVbwBFRTdoxDjNHswDPLykO1z6vEBLncjM53YhJgrC/G1T9fJrs/
 j333g2u/szaPsaGSx/zt2sfdTkP6jGP8mwLU1jwQEK0Pk8J75L1gdluEedz5B0QXNG
 t8XubIg1u9w34Kk4XNKkbIZ8LO2nSGrVjT/ET650ktqA2IwxKIeZNRYgOqNVJtgBU/
 T+tjTEQ5G22YlbbgxBW73L5e7XuoPvrY+4diKv0Ev2X/EMnEWQMBsDNw0JTmySlhIs
 6bpj6/7+GOf9yZtTJBXsUcjkxB1Zch8reaeJw9TuJZEN55DeEJC9LpAJgeJizE4p29
 sv2utYVERiYIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-03; t=1700551087;
 bh=xJISpx4rx9AoHbDVBMOwJVn71cS/lx+g2kjhdfZOPT4=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=sfZ3PJQ2x+PtyxXwcExTIQqSLuI0jF2hKASHv0Kk6Qc5nFFH+fdIiOTMvpcKXYMEf
 jf2SanA4A0Ml4R/bPfDAHuj3KTJcCTOQOPxQUu6meFwD8sb5ORUsVq+D+8pExC585g
 JfaTwPpwqQUXuLhyfgtsbFDZz2LwjHh+d4mTrL20echrufKEdvypuNnijbwi2YInAt
 4ZAS+BlOh7I3SKrMC8Ieco+94M3Rnw4Cg+MHef0gFBgJZS+OLSLBY2LYzypm7OG/d+
 i5GBZMW6YSTyGX3noCjAmx7H/bl7kuvb7Smf6u2NvVABwrk7pB2+f9TFFjPNoG3EmD
 aDuSch3+y+szw==
From: Ivan Klokov <ivan.klokov@syntacore.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-riscv@nongnu.org>, <palmer@dabbelt.com>, <alistair.francis@wdc.com>, 
 <bin.meng@windriver.com>, <liwei1518@gmail.com>,
 <dbarboza@ventanamicro.com>, 
 <zhiwei_liu@linux.alibaba.com>, Ivan Klokov <ivan.klokov@syntacore.com>
Subject: [PATCH v2 1/2] target/riscv/cpu_helper.c: Invalid exception on MMU
 translation stage
Date: Tue, 21 Nov 2023 10:17:56 +0300
Message-ID: <20231121071757.7178-2-ivan.klokov@syntacore.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231121071757.7178-1-ivan.klokov@syntacore.com>
References: <20231121071757.7178-1-ivan.klokov@syntacore.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: T-EXCH-08.corp.yadro.com (172.17.11.58) To
 S-Exch-01.corp.yadro.com (10.78.5.241)
Received-SPF: permerror client-ip=89.207.88.248;
 envelope-from=ivan.klokov@syntacore.com; helo=mta-04.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

According to RISCV privileged spec sect. 5.3.2 Virtual Address Translation Process
access-fault exceptions may raise only after PMA/PMP check. Current implementation
generates an access-fault for mbare mode even if there were no PMA/PMP errors.
This patch removes the erroneous MMU mode check and generates an access-fault
exception based on the pmp_violation flag only.

Fixes: 1448689c7b ("target/riscv: Allow specifying MMU stage")

Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
---
 target/riscv/cpu_helper.c | 30 +++++++-----------------------
 1 file changed, 7 insertions(+), 23 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index b7af69de53..9ff0952e46 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1143,47 +1143,31 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
                                 bool two_stage_indirect)
 {
     CPUState *cs = env_cpu(env);
-    int page_fault_exceptions, vm;
-    uint64_t stap_mode;
-
-    if (riscv_cpu_mxl(env) == MXL_RV32) {
-        stap_mode = SATP32_MODE;
-    } else {
-        stap_mode = SATP64_MODE;
-    }
-
-    if (first_stage) {
-        vm = get_field(env->satp, stap_mode);
-    } else {
-        vm = get_field(env->hgatp, stap_mode);
-    }
-
-    page_fault_exceptions = vm != VM_1_10_MBARE && !pmp_violation;
 
     switch (access_type) {
     case MMU_INST_FETCH:
         if (env->virt_enabled && !first_stage) {
             cs->exception_index = RISCV_EXCP_INST_GUEST_PAGE_FAULT;
         } else {
-            cs->exception_index = page_fault_exceptions ?
-                RISCV_EXCP_INST_PAGE_FAULT : RISCV_EXCP_INST_ACCESS_FAULT;
+            cs->exception_index = pmp_violation ?
+                RISCV_EXCP_INST_ACCESS_FAULT : RISCV_EXCP_INST_PAGE_FAULT;
         }
         break;
     case MMU_DATA_LOAD:
         if (two_stage && !first_stage) {
             cs->exception_index = RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT;
         } else {
-            cs->exception_index = page_fault_exceptions ?
-                RISCV_EXCP_LOAD_PAGE_FAULT : RISCV_EXCP_LOAD_ACCESS_FAULT;
+            cs->exception_index = pmp_violation ?
+                RISCV_EXCP_LOAD_ACCESS_FAULT : RISCV_EXCP_LOAD_PAGE_FAULT;
         }
         break;
     case MMU_DATA_STORE:
         if (two_stage && !first_stage) {
             cs->exception_index = RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT;
         } else {
-            cs->exception_index = page_fault_exceptions ?
-                RISCV_EXCP_STORE_PAGE_FAULT :
-                RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
+            cs->exception_index = pmp_violation ?
+                RISCV_EXCP_STORE_AMO_ACCESS_FAULT :
+                RISCV_EXCP_STORE_PAGE_FAULT;
         }
         break;
     default:
-- 
2.34.1


