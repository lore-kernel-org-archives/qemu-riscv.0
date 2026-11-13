Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF5C606A321
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 08:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nHj2NdZQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gl9AumJK
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xRmwt-0003hx-DU; Fri, 13 Nov 2026 03:47:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <himanshu.chauhan@oss.qualcomm.com>)
 id 1xRmvo-000323-Vs
 for qemu-riscv@nongnu.org; Fri, 13 Nov 2026 03:46:51 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <himanshu.chauhan@oss.qualcomm.com>)
 id 1xRmvm-0007WW-Gw
 for qemu-riscv@nongnu.org; Fri, 13 Nov 2026 03:46:48 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AD8UwWA2181507
 for <qemu-riscv@nongnu.org>; Fri, 13 Nov 2026 08:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=0RzR1pxJS8n
 dYfZXJ6e+dMQ1yaqrJS/JgCUH4n/9grs=; b=nHj2NdZQfLibkIfT+7rzaGnNDfY
 KkIIVF2sXBndrwW1NLmVfm3eZ+gBC+NJl4Zt3lX8rgI3UKM8EQ2Tpp9NQ3bGQiRt
 AEzjnJBEOObZqFu18DvJeElkVnDGjSs49gHPeDWTbg6YACv8Wy/XhYfT2PkL0eF1
 2ple0hVZg4rqnxkdBwaVwf+yUPF9K3gyCgoQzdN+NdBzfB7yGSxoAWcYFAGddx08
 YPbVXc+NuJQa4sPYfZJ1WCCV7zwqNkclLLTXMpmb7utQkttTAItqclwVgfUujx4Q
 JwMzbQh29D/80FcfBb3/2waGY4PDo1wIm503x0ufZ4v5CEN12eyzwnBLA8Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6rjph-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 13 Nov 2026 08:46:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-378722fd4a3so874492eec.0
 for <qemu-riscv@nongnu.org>; Fri, 13 Nov 2026 00:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794559604; x=1795164404; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0RzR1pxJS8ndYfZXJ6e+dMQ1yaqrJS/JgCUH4n/9grs=;
 b=gl9AumJKo22oXuyN47kGSFarFrVpyVjYmlO7yHh6aZ4bXkIpKz3H4e5uNMa8hnZDqO
 lal1IW79lU5xMKivNsPlDoOfxZPjXK+LkJgerqoUteci7GvDh71e99atT41ReRplkbpD
 o1l9ETCBO0KwDiOfS+jPWrdxASp0ltdnOIdRfPU9lk2lYSiWqDkJ8NRoq2fwsrjxS+9K
 QDyZaLTY19M7Fcy8IlxXAD4W8mu1ftSbER9z7t1MWeHooqZH2hYcVgsrFoVymXX9e3g7
 NWmiRpkG9buR5Cac4FG0VkJenQ5h8qIbQSFl0ts3a+AylgLkrGicSKH3ptJaJ5VSSig9
 XOxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794559604; x=1795164404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0RzR1pxJS8ndYfZXJ6e+dMQ1yaqrJS/JgCUH4n/9grs=;
 b=1bnUdofCMPwdaOp1NrtiRwW9IpVOt3GJX/DBPlbWnoEQk//bVMv0rmbPTvlOpjbejs
 vXAEaZb8Exts/TzhcBxixRThBR5wTF5xEUSZ6k9C8jyXlxLF4Pj0xxYFD092I5dkGJZO
 4qacG0LPKE7kf3F4xvGXXvuKXUg/xWGqyJSdJwEXP364SCPbYxBuZQrpBbstHczNOavT
 OxOZ1qMl48RlG7R/xGC6XnsNkwCQxXPL6gVUzqTfzJATGavn1k/LidtdTsLeNJW+UZ+E
 xk4SvzPCcE0f5f2glWPMHj5OqPfwMcVs65QNfgOzeWosFKliIjnPCVqwlG8P1ljB2Icw
 5O1A==
X-Forwarded-Encrypted: i=1;
 AL+hErHiESbTdZRsog+o7mN75OAjvcpzIudNEdd5k592tHLmtaIuSW4KgscyUsATOcA/wjTgyiMaUF4YfnrU@nongnu.org
X-Gm-Message-State: APuU4Z9c5EeQP2tH4d2LgCCdXnPAkmcUjKmcAfYNphw2P6FF+RJXieqi
 Js1OfJ1d569tWtzjYDLYuyIhnluqQn4vwjceG5yycqgNDN7OpoDacmB8h1P01GSWOxQU108mXRE
 u1SFZAo98KOTkQJHBqstuVPM8e0BJY6e1jL0sEE7NXbJfDO5Y8JKfwo62fg==
X-Gm-Gg: AYBFou2fzHi5/FQYZOscmzjeZel+p+UqTqxbEBqEdg9Oqh2/l1QJIIOZDnUP0wrjmrY
 a12nDrc4gm8DzpJxp2BKEN1uHkfs/RuZYBtRCt/wIVT+HZufTjKG3Y9kutDEkIHYRpDPB/uY1Ek
 LjPmNWWD99Jf0e3nZz0thUvHFcPWaRNvmWiXNJS0d8ef8/QEv8uvvCENWXoVfrPTS2APP35U7x1
 gr0ZY1cHcejAC+y+PnQkiwh9w2/KYqYoEeKgXIb9He16piRXr4CyfLiHh0kR+tjzb/9myXDVstx
 XkUXN/wSAJsGZ+zxsIHCSrTA0NuKJpcsD+JpNpQdJnPsB/dBerfui28y+mvFiBh1Ah0K/+ZbSHK
 smuwz/jPpjS4S/5u7/hxwHcMjx2WEDDSGXw44dcAe9tAXcNOakVKKNIjTcqAx6YFxvG2rHiKzHD
 csjiUr0SOIaOBinP7+CAlCHw5CZPSixGYPrAYMCMH3uQxROHTCIcD3rJr2ZrEsn8yplIL/dFv8
X-Received: by 2002:a05:7300:d406:b0:35f:2bc:82d3 with SMTP id
 5a478bee46e88-379662913ddmr1345866eec.15.1794559604214; 
 Fri, 13 Nov 2026 00:46:44 -0800 (PST)
X-Received: by 2002:a05:7300:d406:b0:35f:2bc:82d3 with SMTP id
 5a478bee46e88-379662913ddmr1345844eec.15.1794559603551; 
 Fri, 13 Nov 2026 00:46:43 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-379559189e8sm5689242eec.11.2026.11.13.00.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 00:46:41 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v3 2/2] target/riscv: Fix icount trigger exception PC
Date: Fri, 13 Nov 2026 14:16:22 +0530
Message-ID: <20261113084622.738278-3-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113084622.738278-1-himanshu.chauhan@oss.qualcomm.com>
References: <20261113084622.738278-1-himanshu.chauhan@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX3331mlYfqO5L
 thcEM0z7uVSrBlSZcuoHvSHRGEPPIlGufFO6yc+KgaCnK4MFBF/6FQdnxjscfO60Ib+b3XDxWnq
 NGuHmlT3aKI1UROwO7QrxCWHF7UOHw8nCqkT7WQXb8xQc1cDEytezrYymJJs5x710TzPCA8o3tu
 ZU14MwFJHF14/biCLdHX2uZf4NZd5VfB93TJTw71UixZtx7qQrRRE67CXW35CfdGRb0iuohK+EE
 2wLuD9UKqhJm8sEapvBxLk9W36BonMrJnUm39r5xNtROXucDjHTq4snTHoCEbWOd+xZukFzCY/x
 dtobKNso7KaDtw0l6j+o56Q+2wmC2XP/fU5EPMSdVLxN+1rNvTDNDhtoL7kwoAfZDg9olt5ks2v
 THkzyAVzQSxB4NhLVzYv+cGZOxYBfEk54VVPrYA8gENlPoyBbhEwBPhMyqu1YcdP3dSZ5j5j7ZD
 OlV/n98bWF9JI9esQfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX9I/VdPlwAsFX
 xvaRzdVO9VVayxlZm8FwMsRYYQPiZ0BMAC2A9Vx+dsRuf7EU13V/dAHx1s6B1EDijQWD3po9hno
 sAMBvOdhRrECyu8qUcoWUExQ/d5uU1M=
X-Proofpoint-GUID: zkyK5NGOScX3-l9J3S6K4olzV1as1fL9
X-Proofpoint-ORIG-GUID: zkyK5NGOScX3-l9J3S6K4olzV1as1fL9
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af6ce75 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ZnDpHCPyknFz56Ji1pYA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130034
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=himanshu.chauhan@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Per the Sdtrig specification, on a breakpoint exception with icount, xepc
must contain the virtual address of the next instruction to execute so
program flow is preserved. A one-instruction trigger must therefore fire
only after the counted instruction retires, and xepc must contain the
architectural successor PC: the branch target for a taken branch, or the
fallthrough PC otherwise.

QEMU previously disabled the translated-block trigger flag when icount was
enabled and relied on timer and privilege-change callbacks to update the
count. That allowed the trigger to fire outside instruction retirement
before the guest PC advanced, causing Linux to observe the old PC and
re-enter the same breakpoint while single-stepping with icount.

Fix this by publishing the icount trigger flag in translated blocks even
with icount enabled. The translated helper now decrements the trigger count
after the instruction has committed its successor PC and raises the trigger
action only then. Privilege-mode changes, context CSR writes and migration
post-load refresh the cached enabled state because icount trigger matching
depends on the current mode and context.

Remove the old itrigger timers because instruction counting is now tied
to translated instruction retirement instead of virtual-time callbacks.

Fixes: 5a4ae64cac49 ("target/riscv: Add itrigger support when icount is enabled")
Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 target/riscv/cpu.h            |   5 +-
 target/riscv/machine.c        |   5 +-
 target/riscv/tcg/cpu_helper.c |  10 +--
 target/riscv/tcg/csr.c        |   3 +
 target/riscv/tcg/debug.c      | 121 +++++-----------------------------
 target/riscv/tcg/tcg-cpu.c    |   7 +-
 6 files changed, 33 insertions(+), 118 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 49a1186bdb..3109d71470 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -484,8 +484,7 @@ struct CPUArchState {
     uint8_t trigger_cur;
     /*
      * num_triggers is the length of tdata1, tdata2, tdata3,
-     * cpu_breakpoint, cpu_watchpoint and itrigger_timer
-     * arrays.
+     * cpu_breakpoint and cpu_watchpoint arrays.
      */
     uint32_t num_triggers;
     uint64_t *tdata1;
@@ -493,8 +492,6 @@ struct CPUArchState {
     uint64_t *tdata3;
     struct CPUBreakpoint **cpu_breakpoint;
     struct CPUWatchpoint **cpu_watchpoint;
-    QEMUTimer **itrigger_timer;
-    int64_t last_icount;
     bool itrigger_enabled;
 
     /* machine specific rdtime callback */
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 0de06e9588..74176e7c6e 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -22,7 +22,6 @@
 #include "system/kvm.h"
 #include "system/tcg.h"
 #include "migration/cpu.h"
-#include "exec/icount.h"
 #include "target/riscv/tcg/debug.h"
 #ifdef CONFIG_KVM
 #include "kvm/kvm_riscv.h"
@@ -339,9 +338,7 @@ static int debug_post_load(void *opaque, int version_id)
     RISCVCPU *cpu = opaque;
     CPURISCVState *env = &cpu->env;
 
-    if (icount_enabled()) {
-        env->itrigger_enabled = riscv_itrigger_enabled(env);
-    }
+    env->itrigger_enabled = riscv_itrigger_enabled(env);
 
     return 0;
 }
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 58e98e975c..0375b930be 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -940,10 +940,6 @@ void riscv_cpu_set_mode(CPURISCVState *env, privilege_mode_t newpriv,
     g_assert(newpriv <= PRV_M && newpriv != PRV_RESERVED);
 
     if (newpriv != env->priv || env->virt_enabled != virt_en) {
-        if (icount_enabled()) {
-            riscv_itrigger_update_priv(env);
-        }
-
         riscv_pmu_update_fixed_ctrs(env, newpriv, virt_en);
     }
 
@@ -982,6 +978,12 @@ void riscv_cpu_set_mode(CPURISCVState *env, privilege_mode_t newpriv,
             riscv_cpu_interrupt(env);
         }
     }
+
+    /*
+     * Icount triggers are scoped by U/S/M and VU/VS mode bits.  Refresh the
+     * cached translated-block flag after privilege or virtualization changes.
+     */
+    riscv_itrigger_update_priv(env);
 }
 
 /*
diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index af444e3e6f..7c05c866fd 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -5732,6 +5732,9 @@ static RISCVException write_mcontext(CPURISCVState *env, int csrno,
     }
 
     env->mcontext = val & mask;
+#if !defined(CONFIG_USER_ONLY)
+    env->itrigger_enabled = riscv_itrigger_enabled(env);
+#endif
     return RISCV_EXCP_NONE;
 }
 
diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
index 2067657c81..a84d8eb4cf 100644
--- a/target/riscv/tcg/debug.c
+++ b/target/riscv/tcg/debug.c
@@ -32,8 +32,6 @@
 #include "trace.h"
 #include "exec/helper-proto.h"
 #include "exec/watchpoint.h"
-#include "system/cpu-timers.h"
-#include "exec/icount.h"
 #include "accel/tcg/cpu-loop.h"
 
 /*
@@ -768,21 +766,6 @@ itrigger_set_pending(CPURISCVState *env, int index, int val)
                                    ITRIGGER_PENDING, val);
 }
 
-static bool check_itrigger_priv(CPURISCVState *env, int index)
-{
-    target_ulong tdata1 = env->tdata1[index];
-    if (env->virt_enabled) {
-        /* check VU/VS bit against current privilege level */
-        return (get_field(tdata1, ITRIGGER_VS) == env->priv) ||
-               (get_field(tdata1, ITRIGGER_VU) == env->priv);
-    } else {
-        /* check U/S/M bit against current privilege level */
-        return (get_field(tdata1, ITRIGGER_M) == env->priv) ||
-               (get_field(tdata1, ITRIGGER_S) == env->priv) ||
-               (get_field(tdata1, ITRIGGER_U) == env->priv);
-    }
-}
-
 bool riscv_itrigger_enabled(CPURISCVState *env)
 {
     int count;
@@ -790,7 +773,7 @@ bool riscv_itrigger_enabled(CPURISCVState *env)
         if (get_trigger_type(env, i) != TRIGGER_TYPE_INST_CNT) {
             continue;
         }
-        if (check_itrigger_priv(env, i)) {
+        if (!trigger_common_match(env, TRIGGER_TYPE_INST_CNT, i)) {
             continue;
         }
         count = itrigger_get_count(env, i);
@@ -817,7 +800,12 @@ void HELPER(itrigger_match)(CPURISCVState *env)
         if (!count) {
             continue;
         }
-        itrigger_set_count(env, i, count--);
+        /*
+         * This helper is emitted at TB exit after one guest instruction and
+         * after the translator has committed env->pc to the successor PC.
+         */
+        count--;
+        itrigger_set_count(env, i, count);
         if (!count) {
             /*
              * From the 1.0 spec: "When pending is set, the trigger
@@ -832,6 +820,9 @@ void HELPER(itrigger_match)(CPURISCVState *env)
              *
              * Note that itrigger_set_pending() is a no-op if we're
              * running debug 0.13.
+             *
+             * Software writes still validate pending as a read-only field;
+             * QEMU only toggles it internally around the trigger action.
              */
             itrigger_set_pending(env, i, 1);
 
@@ -844,53 +835,13 @@ void HELPER(itrigger_match)(CPURISCVState *env)
 
 static void riscv_itrigger_update_count(CPURISCVState *env)
 {
-    int count, executed;
     /*
-     * Record last icount, so that we can evaluate the executed instructions
-     * since last privilege mode change or timer expire.
+     * Icount triggers are matched from translated code after an instruction
+     * has committed its successor PC.  Timer and privilege-change callbacks
+     * therefore must not decrement count or fire the action here; they only
+     * refresh the cached TB flag state.
      */
-    int64_t last_icount = env->last_icount, current_icount;
-    current_icount = env->last_icount = icount_get_raw();
-
-    for (int i = 0; i < env->num_triggers; i++) {
-        if (get_trigger_type(env, i) != TRIGGER_TYPE_INST_CNT) {
-            continue;
-        }
-        count = itrigger_get_count(env, i);
-        if (!count) {
-            continue;
-        }
-        /*
-         * Only when privilege is changed or itrigger timer expires,
-         * the count field in itrigger tdata1 register is updated.
-         * And the count field in itrigger only contains remaining value.
-         */
-        if (check_itrigger_priv(env, i)) {
-            /*
-             * If itrigger enabled in this privilege mode, the number of
-             * executed instructions since last privilege change
-             * should be reduced from current itrigger count.
-             */
-            executed = current_icount - last_icount;
-            itrigger_set_count(env, i, count - executed);
-            if (count == executed) {
-                do_trigger_action(env, i);
-            }
-        } else {
-            /*
-             * If itrigger is not enabled in this privilege mode,
-             * the number of executed instructions will be discard and
-             * the count field in itrigger will not change.
-             */
-            timer_mod(env->itrigger_timer[i],
-                      current_icount + count);
-        }
-    }
-}
-
-static void riscv_itrigger_timer_cb(void *opaque)
-{
-    riscv_itrigger_update_count((CPURISCVState *)opaque);
+    env->itrigger_enabled = riscv_itrigger_enabled(env);
 }
 
 void riscv_itrigger_update_priv(CPURISCVState *env)
@@ -925,18 +876,10 @@ static void itrigger_reg_write(CPURISCVState *env, target_ulong index,
 
     switch (tdata_index) {
     case TDATA1:
-        /* set timer for icount */
         new_val = itrigger_validate(env, val);
         if (new_val != env->tdata1[index]) {
             env->tdata1[index] = new_val;
-            if (icount_enabled()) {
-                env->last_icount = icount_get_raw();
-                /* set the count to timer */
-                timer_mod(env->itrigger_timer[index],
-                          env->last_icount + itrigger_get_count(env, index));
-            } else {
-                env->itrigger_enabled = riscv_itrigger_enabled(env);
-            }
+            env->itrigger_enabled = riscv_itrigger_enabled(env);
         }
         break;
     case TDATA2:
@@ -945,33 +888,17 @@ static void itrigger_reg_write(CPURISCVState *env, target_ulong index,
         break;
     case TDATA3:
         env->tdata3[index] = textra_validate(env, val);
+        env->itrigger_enabled = riscv_itrigger_enabled(env);
         break;
     default:
         g_assert_not_reached();
     }
 }
 
-static int itrigger_get_adjust_count(CPURISCVState *env)
-{
-    int count = itrigger_get_count(env, env->trigger_cur), executed;
-    if ((count != 0) && check_itrigger_priv(env, env->trigger_cur)) {
-        executed = icount_get_raw() - env->last_icount;
-        count += executed;
-    }
-    return count;
-}
-
 target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index)
 {
-    int trigger_type;
     switch (tdata_index) {
     case TDATA1:
-        trigger_type = extract_trigger_type(env,
-                                            env->tdata1[env->trigger_cur]);
-        if ((trigger_type == TRIGGER_TYPE_INST_CNT) && icount_enabled()) {
-            return deposit64(env->tdata1[env->trigger_cur], 10, 14,
-                             itrigger_get_adjust_count(env));
-        }
         return env->tdata1[env->trigger_cur];
     case TDATA2:
         return env->tdata2[env->trigger_cur];
@@ -1163,8 +1090,6 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
 
 void riscv_trigger_realize(CPURISCVState *env)
 {
-    int i;
-
     if (env->num_triggers > RV_MAX_TRIGGERS) {
         error_report(
                 "Invalid configuration: 'num-triggers' must be less than %u",
@@ -1177,12 +1102,6 @@ void riscv_trigger_realize(CPURISCVState *env)
     env->tdata3 = g_new0(uint64_t, env->num_triggers);
     env->cpu_breakpoint = g_new0(struct CPUBreakpoint *, env->num_triggers);
     env->cpu_watchpoint = g_new0(struct CPUWatchpoint *, env->num_triggers);
-    env->itrigger_timer = g_new0(QEMUTimer *, env->num_triggers);
-
-    for (i = 0; i < env->num_triggers; i++) {
-        env->itrigger_timer[i] = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-                                              riscv_itrigger_timer_cb, env);
-    }
 }
 
 void riscv_trigger_unrealize(CPURISCVState *env)
@@ -1193,11 +1112,6 @@ void riscv_trigger_unrealize(CPURISCVState *env)
 
     g_free(env->cpu_breakpoint);
     g_free(env->cpu_watchpoint);
-
-    for (int i = 0; i < env->num_triggers; i++) {
-        timer_free(env->itrigger_timer[i]);
-    }
-    g_free(env->itrigger_timer);
 }
 
 void riscv_trigger_reset_hold(CPURISCVState *env)
@@ -1225,7 +1139,6 @@ void riscv_trigger_reset_hold(CPURISCVState *env)
         env->tdata3[i] = 0;
         env->cpu_breakpoint[i] = NULL;
         env->cpu_watchpoint[i] = NULL;
-        timer_del(env->itrigger_timer[i]);
     }
 
     env->mcontext = 0;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 5834ec1524..027fe5b46a 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -181,8 +181,11 @@ static TCGTBCPUState riscv_get_tb_cpu_state(CPUState *cs)
              ? EXT_STATUS_DIRTY : EXT_STATUS_DISABLED;
     }
 
-    if ((cpu->cfg.debug || cpu->cfg.ext_sdtrig)
-        && !icount_enabled()) {
+    /*
+     * Publish itrigger state even when QEMU icount is enabled.  The helper
+     * runs from translated code after committing the guest successor PC.
+     */
+    if (cpu->cfg.debug || cpu->cfg.ext_sdtrig) {
         flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
     }
 #endif
-- 
2.43.0


