Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6165CC54FB9
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 12:08:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r532s-0006Rh-JA; Mon, 20 Nov 2023 07:06:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1r532q-0006Ph-5z; Mon, 20 Nov 2023 07:06:28 -0500
Received: from mta-04.yadro.com ([89.207.88.248])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivan.klokov@syntacore.com>)
 id 1r532o-0004px-33; Mon, 20 Nov 2023 07:06:27 -0500
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 841A1C0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-04; t=1700481982;
 bh=WYPOfCv1L3H90LB4jZVlsUVoHv2MYYSum6jrNzaBbj0=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=RBT7k5y0wPPwXpotvzOb9IbPU6O79t4geMqPCYdifNVQCnH+5fWCY3UZWsQZNEidB
 lh8iMsN/HQcrW4J3ytHgmI1xuWhAA9wTE3/k/DE0yl9kOHZ1gz1gP6N+t3iy5llRN4
 fmbxEzAFY11nCjHQ5a35CG+8XHbWPVaxgxoBVQaIdRD6yO9N92SCTk0fKj5qzyPdqS
 wN+anYu5c5mFUpJv8vW37y0WGWN67bwEAwqrzbWOrnIAGP9Y3DwFOsKgj6tYG7hg0l
 6VDYz44na9tGZOXShGDFZ+1yjSTU7owpNn1ZA8V+XfiCJbBQvOKPC03X7ozQkkLbt1
 Qn4sK5NkuzL/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-03; t=1700481982;
 bh=WYPOfCv1L3H90LB4jZVlsUVoHv2MYYSum6jrNzaBbj0=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=g2ynY5EEftayrhgTSJykFPfMTxiH5vqp0+E17n3J8+/7UK0kb8rJeKbpkhm4Obg39
 8ZcOEjnCM3HhF0z5zmxB3TrZHWUPNQKKYxHSwPH58gEcC61NyuKTyxSJowoU5PzYwD
 U89Dgg4zhBV5yFKYCvIlBVs7Gnk8USyf4RxKRGPykckVXfl3xSurK8xkOCdFk8CSZA
 cI9WT+Tg1gWRX+62itnpJolvfH/Ha67lOLDe/DleOy/3mBjTK9SgVZwGfdF9UCSTw7
 jqAlkp5yEt2c7ovY86InaQrzVw6vdKJVWd0s1bb/2mNHVGafQeUUqIDrspMspWIa7v
 NCS963z9RBRxg==
From: Ivan Klokov <ivan.klokov@syntacore.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-riscv@nongnu.org>, <palmer@dabbelt.com>, <alistair.francis@wdc.com>, 
 <bin.meng@windriver.com>, <liwei1518@gmail.com>,
 <dbarboza@ventanamicro.com>, 
 <zhiwei_liu@linux.alibaba.com>, Ivan Klokov <ivan.klokov@syntacore.com>
Subject: [PATCH 1/2] target/riscv/cpu_helper.c: Invalid exception on MMU
 translation stage
Date: Mon, 20 Nov 2023 15:06:08 +0300
Message-ID: <20231120120609.37960-2-ivan.klokov@syntacore.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231120120609.37960-1-ivan.klokov@syntacore.com>
References: <20231120120609.37960-1-ivan.klokov@syntacore.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: T-Exch-05.corp.yadro.com (172.17.10.109) To
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

According to RISCV priveleged spec sect. 5.3.2 Virtual Address Translation Process
access-fault exceptions may raise only after PMA/PMP check. Current implementation
generates an acces-fault for mbare mode even if there were no PMA/PMP errors.
This patch removes the erroneous MMU mode check and generates an access-fault
exception based on the pmp_violation flag only.

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


