Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA4BC35274
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 13:46:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGJNF-00079P-2P; Thu, 21 Dec 2023 08:46:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vadim.shakirov@syntacore.com>)
 id 1rGHMu-0001Je-E8; Thu, 21 Dec 2023 06:37:36 -0500
Received: from mta-04.yadro.com ([89.207.88.248])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vadim.shakirov@syntacore.com>)
 id 1rGHMs-0001gj-LR; Thu, 21 Dec 2023 06:37:36 -0500
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 015F1C000F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-04; t=1703158653;
 bh=WoCK26ww3cdf2Ruo0rnmxhslHFYOzy6Fn+U8lOlc6O0=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=ikPDChghS/W4P15g0z0JXi6ATjWEQWs/bp2Zgf0gqkMX8VvKXavpxSONmdJW3SjZb
 5yA4ClLeCiHQ5hrUGJwZ3ZidqlbJ5PdyJON7Io1hrMTvlthI6rQuCdrnkh1VreI6Zh
 ZNhQBhf8ln/HGbtHvSKykxYB3ztXhmJTA0emeHEd6G+d4A1VH3xxxCHcOSmrYhesw9
 HbQ165qg4YklyWbgwhyVVq9qcXCaxs+1qFvEsIxmB/TUbj5pkQiNlY7V87fJtAdK9o
 YLlBrAYcNMEM2pdqK2XC/0wBs1jZS0ubHmNoS1jRdEfUZevieqFolM4+YmqHZ4yeOs
 rE5wTaU/nuRLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-03; t=1703158653;
 bh=WoCK26ww3cdf2Ruo0rnmxhslHFYOzy6Fn+U8lOlc6O0=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=Dqx9EShnB5md/tuxoQqnIXsiBbgURbNe7mAfl7g5AL/4w6d5v+lAORI+yvTI+sFFb
 gYGt4eAogxOcfI0aRdRn55C6hXefSGS3DDpS8BUuHNUTGgBIW4xlP0nVauxwCP63/N
 erDgMVwwyjhgD9tKsdJI6CV2xdj9YxAp3GWnx7/6ltQLB2ZpMTZasvJ5s9sekOcDKi
 EutHwZDYIPam85FVMLmRJAPv5JryfC3m+8wxFHJgEyRcxHgkG1qUBmYu1jFSteqUuW
 ZuyXIz/vaa1z4IPYpuYlasn/wdNH1d9jf3L3ZYOZgA0JWM7Ewl/wNUCIOqMaYUMoZ/
 Wjz8NKDzmKUKA==
From: Vadim Shakirov <vadim.shakirov@syntacore.com>
To: <qemu-devel@nongnu.org>
CC: Vadim Shakirov <vadim.shakirov@syntacore.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, Bin Meng
 <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, "Daniel Henrique
 Barboza" <dbarboza@ventanamicro.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, <qemu-riscv@nongnu.org>
Subject: [PATCH 2/2] target/riscv/csr: Added the ability to delegate LCOFI to
 VS
Date: Thu, 21 Dec 2023 14:36:28 +0300
Message-ID: <20231221113628.41038-3-vadim.shakirov@syntacore.com>
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

In the AIA specification in the paragraph "Virtual interrupts for VS level"
it is indicated for interrupts 13-63: if the bit in hideleg is enabled,
then the corresponding vsip and vsie bits are aliases to sip and sie

Signed-off-by: Vadim Shakirov <vadim.shakirov@syntacore.com>
---
 target/riscv/csr.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 36f807d5f6..46a5d0c69a 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1129,7 +1129,7 @@ static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
 
 static const uint64_t delegable_ints = S_MODE_INTERRUPTS |
                                       VS_MODE_INTERRUPTS | LOCAL_INTERRUPTS;
-static const uint64_t vs_delegable_ints = VS_MODE_INTERRUPTS;
+static const uint64_t vs_delegable_ints = VS_MODE_INTERRUPTS | LOCAL_INTERRUPTS;
 static const uint64_t all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
                                 HS_MODE_INTERRUPTS | LOCAL_INTERRUPTS;
 #define DELEGABLE_EXCPS ((1ULL << (RISCV_EXCP_INST_ADDR_MIS)) | \
@@ -1167,7 +1167,7 @@ static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP |
 static const target_ulong hip_writable_mask = MIP_VSSIP;
 static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP |
                                                MIP_VSEIP;
-static const target_ulong vsip_writable_mask = MIP_VSSIP;
+static const target_ulong vsip_writable_mask = MIP_VSSIP | LOCAL_INTERRUPTS;
 
 const bool valid_vm_1_10_32[16] = {
     [VM_1_10_MBARE] = true,
@@ -2416,20 +2416,34 @@ static RISCVException write_sstatus(CPURISCVState *env, int csrno,
     return write_mstatus(env, CSR_MSTATUS, newval);
 }
 
+
+static uint64_t vsi_to_mi(uint64_t vsi)
+{
+    uint64_t mi;
+
+    mi = (vsi & (VS_MODE_INTERRUPTS >> 1)) << 1;
+    mi |= vsi & LOCAL_INTERRUPTS;
+
+    return mi;
+}
+
 static RISCVException rmw_vsie64(CPURISCVState *env, int csrno,
                                  uint64_t *ret_val,
                                  uint64_t new_val, uint64_t wr_mask)
 {
     RISCVException ret;
-    uint64_t rval, mask = env->hideleg & VS_MODE_INTERRUPTS;
+    uint64_t rval, mask = env->hideleg & (VS_MODE_INTERRUPTS |
+                                                        LOCAL_INTERRUPTS);
 
     /* Bring VS-level bits to correct position */
-    new_val = (new_val & (VS_MODE_INTERRUPTS >> 1)) << 1;
-    wr_mask = (wr_mask & (VS_MODE_INTERRUPTS >> 1)) << 1;
+    new_val = vsi_to_mi(new_val);
+    wr_mask = vsi_to_mi(wr_mask);
 
     ret = rmw_mie64(env, csrno, &rval, new_val, wr_mask & mask);
+
     if (ret_val) {
-        *ret_val = (rval & mask) >> 1;
+        *ret_val = (rval & (env->hideleg & VS_MODE_INTERRUPTS)) >> 1;
+        *ret_val |= rval & (env->hideleg & LOCAL_INTERRUPTS);
     }
 
     return ret;
@@ -2630,16 +2644,18 @@ static RISCVException rmw_vsip64(CPURISCVState *env, int csrno,
                                  uint64_t new_val, uint64_t wr_mask)
 {
     RISCVException ret;
-    uint64_t rval, mask = env->hideleg & VS_MODE_INTERRUPTS;
+    uint64_t rval, mask = env->hideleg & (VS_MODE_INTERRUPTS |
+                                                        LOCAL_INTERRUPTS);
 
     /* Bring VS-level bits to correct position */
-    new_val = (new_val & (VS_MODE_INTERRUPTS >> 1)) << 1;
-    wr_mask = (wr_mask & (VS_MODE_INTERRUPTS >> 1)) << 1;
+    new_val = vsi_to_mi(new_val);
+    wr_mask = vsi_to_mi(wr_mask);
 
     ret = rmw_mip64(env, csrno, &rval, new_val,
                     wr_mask & mask & vsip_writable_mask);
     if (ret_val) {
-        *ret_val = (rval & mask) >> 1;
+        *ret_val = (rval & (env->hideleg & VS_MODE_INTERRUPTS)) >> 1;
+        *ret_val |= rval & (env->hideleg & LOCAL_INTERRUPTS);
     }
 
     return ret;
-- 
2.34.1


