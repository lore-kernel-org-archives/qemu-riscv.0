Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FEAC35274
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 13:46:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGJNG-0007Bc-9i; Thu, 21 Dec 2023 08:46:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vadim.shakirov@syntacore.com>)
 id 1rGHMr-0001Iu-50; Thu, 21 Dec 2023 06:37:33 -0500
Received: from mta-04.yadro.com ([89.207.88.248])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vadim.shakirov@syntacore.com>)
 id 1rGHMo-0001gB-LD; Thu, 21 Dec 2023 06:37:32 -0500
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com EDA81C000F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-04; t=1703158648;
 bh=ua6ucfDtUdg0ANg7Bk9jHGW29jFZObm2VLLcyHwORMg=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=HR0sGH27KspI0FCpZdInq79LooGzVviAdxdP/FLO0g6fTZ+f8+HErk40CnxByWJpw
 9pcyp0zOoNNf1CEW2IRwH8PNOc1FrVAjs14eaIr3ghaKIquifFKm+jFLOQn3KFmblH
 G0/KV3gI9PClPa2mAt/N4QhYrNHlkd6B7rfmtAKqWZhq7xnp0nsn0qvo3J9cYQFIRk
 WWahSp0/6wZWdiE1uSfLj/3YPAxFen3+R+tTHngQ5KWU0OrE5VcdoEWQTiosReBiOK
 zhRPr5YaSFozOkDatoT01qAacUu68lqkdUbFrnSFwYPgBNoulRRfZyj++dRjsFuiLm
 rRC/8ubW+7Z0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-03; t=1703158648;
 bh=ua6ucfDtUdg0ANg7Bk9jHGW29jFZObm2VLLcyHwORMg=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=sMJQv3oGkyjgUsOI7FHBgs6oWJr2stq+KvDS5Kdc9fEJEaGk6rg6h41GuRzUq57vF
 OydBbG+Ya+cW3oj04DgP1WlVk+N8kxhkNKjC1NdgRVgbgGwRs67MHCsRdHOJdjW6x8
 XbCxfPNlVB1HuzYrTPcf3HWZwh38jsZ9S9vFh9dYzIsEpR0lK9ZY+MX306kgnk8YhJ
 VzGPelZytK25OkYqeBSVgaDcmKj9KRN9sGteWfHLuIYe4YKIZjEYNcRxVPp6OsIkSB
 XdMyDhfzgxdH7p0Qua+mizmMXW5eJB3xoyCJuB1NtPG8qRwp0bLgoXpI/oKA9DViRx
 M1jq6X+d5a4DA==
From: Vadim Shakirov <vadim.shakirov@syntacore.com>
To: <qemu-devel@nongnu.org>
CC: Vadim Shakirov <vadim.shakirov@syntacore.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, Bin Meng
 <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, "Daniel Henrique
 Barboza" <dbarboza@ventanamicro.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, <qemu-riscv@nongnu.org>
Subject: [PATCH 1/2] target/riscv/csr: Rename groups of interrupts
Date: Thu, 21 Dec 2023 14:36:27 +0300
Message-ID: <20231221113628.41038-2-vadim.shakirov@syntacore.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231221113628.41038-1-vadim.shakirov@syntacore.com>
References: <20231221113628.41038-1-vadim.shakirov@syntacore.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: T-EXCH-07.corp.yadro.com (172.17.11.57) To
 S-Exch-01.corp.yadro.com (10.78.5.241)
Received-SPF: permerror client-ip=89.207.88.248;
 envelope-from=vadim.shakirov@syntacore.com; helo=mta-04.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 21 Dec 2023 08:46:04 -0500
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

In AIA spec in 5.1 chapter says that "... the AIA categorizes the counter
overflow interrupt (code 13) as a local interrupt. It is assumed furthermore
that any future definitions for reserved interrupt numbers 14 and 15 will
also be local interrupts" and than LCOFI belongs to LOCAL_INTERRUPTS

Signed-off-by: Vadim Shakirov <vadim.shakirov@syntacore.com>
---
 target/riscv/csr.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d69bff5a67..36f807d5f6 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1120,18 +1120,18 @@ static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
 /* Machine constants */
 
 #define M_MODE_INTERRUPTS  ((uint64_t)(MIP_MSIP | MIP_MTIP | MIP_MEIP))
-#define S_MODE_INTERRUPTS  ((uint64_t)(MIP_SSIP | MIP_STIP | MIP_SEIP | \
-                                      MIP_LCOFIP))
+#define S_MODE_INTERRUPTS  ((uint64_t)(MIP_SSIP | MIP_STIP | MIP_SEIP))
 #define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP))
 #define HS_MODE_INTERRUPTS ((uint64_t)(MIP_SGEIP | VS_MODE_INTERRUPTS))
+#define LOCAL_INTERRUPTS   ((uint64_t)(MIP_LCOFIP))
 
 #define VSTOPI_NUM_SRCS 5
 
 static const uint64_t delegable_ints = S_MODE_INTERRUPTS |
-                                           VS_MODE_INTERRUPTS;
+                                      VS_MODE_INTERRUPTS | LOCAL_INTERRUPTS;
 static const uint64_t vs_delegable_ints = VS_MODE_INTERRUPTS;
 static const uint64_t all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
-                                     HS_MODE_INTERRUPTS;
+                                HS_MODE_INTERRUPTS | LOCAL_INTERRUPTS;
 #define DELEGABLE_EXCPS ((1ULL << (RISCV_EXCP_INST_ADDR_MIS)) | \
                          (1ULL << (RISCV_EXCP_INST_ACCESS_FAULT)) | \
                          (1ULL << (RISCV_EXCP_ILLEGAL_INST)) | \
@@ -1163,7 +1163,7 @@ static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
     SSTATUS_SUM | SSTATUS_MXR | SSTATUS_VS;
 static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP |
-                                              SIP_LCOFIP;
+                                              LOCAL_INTERRUPTS;
 static const target_ulong hip_writable_mask = MIP_VSSIP;
 static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP |
                                                MIP_VSEIP;
@@ -2471,7 +2471,7 @@ static RISCVException rmw_sie64(CPURISCVState *env, int csrno,
                                 uint64_t new_val, uint64_t wr_mask)
 {
     RISCVException ret;
-    uint64_t mask = env->mideleg & S_MODE_INTERRUPTS;
+    uint64_t mask = env->mideleg & (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS);
 
     if (env->virt_enabled) {
         if (env->hvictl & HVICTL_VTI) {
@@ -2693,7 +2693,7 @@ static RISCVException rmw_sip64(CPURISCVState *env, int csrno,
     }
 
     if (ret_val) {
-        *ret_val &= env->mideleg & S_MODE_INTERRUPTS;
+        *ret_val &= env->mideleg & (S_MODE_INTERRUPTS | LOCAL_INTERRUPTS);
     }
 
     return ret;
-- 
2.34.1


