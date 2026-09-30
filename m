Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B9DCA5FC4
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 17:45:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xByNN-0006Ow-Jo; Wed, 30 Sep 2026 13:45:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xByNL-0006I3-I7
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 13:45:51 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xByNJ-00016E-JP
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 13:45:51 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68UHfcJV3785217
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 17:45:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 D+42UtXFtsYPVXGSZMwnMSEP8guAR1nanVRzeeC5iLk=; b=Lav77BDXtnlMMP9W
 iO8hLgEDi4Ok66vrOlc0u7B89BvatN2f8tJHiN17PKJ1+oREpRZlqKVgZrIEF1Nx
 5zLJPFBcUzSXM/hphCQoq4fvc1tf9h3Ao9V4Qnr6ASPaB26RJWrXOBLBEes8Oosl
 c6uWePnKMI0uWnYmao6qs5EQdXorMSzIAwHo/Oe6FBJng3k6VZNLSTFLmFCf+vQy
 MqwlDpltm+IfVA83rdU7WVWO37O+cOugyhDjd2yc++uK7M1lBZJd+JanYVbOK2eP
 +/306jVKwnQLWk4Kq0NFma+1hCBdkMvZ8ZZ4i0Sp0UMwDebuajFqANU7oKt7kuOp
 ZeJvCw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0tkn3pqn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 17:45:47 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-988b86c66e5so26835241.0
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 10:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790790347; x=1791395147; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=D+42UtXFtsYPVXGSZMwnMSEP8guAR1nanVRzeeC5iLk=;
 b=O07JUgVUSAQFqWB9HgOzbT2UyzrtMU5DOjMQjUMtFrImuT0XSsMtxuvNqnxd1i32ab
 mPf5zxTgMrqly45qs+IAfxd5TMdYJTMeOAAcu1W4wY1JPeFaOodPn6X8BEw8Th6AtAFs
 V4kc3f8TwVRK6e0UUhtdBkm3wyib9ExDGGiCZOkj9qpHPYlj0HkBrXxP2/lBLP4R/SS2
 RgSWEaJfpTELIwHWogQiKVFVD1ldjBn6ohXS/drJlzn9iUxVDUHd6vRq+N5z2AITHLgR
 RFxGXEqszZod98EjloFMjTuLt09bPpUwpbnYTfkoGOCrR3SkZe6i33WX2ivR7+KGW70G
 WSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790790347; x=1791395147;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=D+42UtXFtsYPVXGSZMwnMSEP8guAR1nanVRzeeC5iLk=;
 b=uUx+jFV3CcAPKpa9AbLUwy7hvGERpKm2H5QKteFE7wozGZUxpK2JYMmRLOUulo499P
 V8UyJlLrRfDaUCtaOnO63vNE4jQ5ziGqlZ69tq8/Xlle4cvUR7yAxPUCyxabCnK3wamd
 Ku50VZp/0vEWBKUn78F2elMpptDE66dnZsJkFJj/3K2Eck+Vd6Tgi6/X1tnYefhira5l
 L9j+GDUWt2EXh6AqCiEd460SQZluEy9v2Ow8/7No0Cjf0BmljoPe/h5Dli9Bdw2EpKzA
 1v248i3KL0qTQjT5Qwpma6Uc/vNErinmV/6McPu7zwabEjvBPZdKkLnp7XQyGk7Ke0CN
 hThw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxdJcG4AfIt+x2Biv/De3i/CpGRM/7UFIxEXC7OCnWfgbqex4k5WT26i3m4Jo5q6DfOP4kwplQi3auO@nongnu.org
X-Gm-Message-State: AFq9FYLBqJ/9dkNQHTgltiIdgaQb7Qt84pFIQ7JI/Rsa5+CZN1up2pc4
 3baIHjzq3wieWJ1p2+qbNfRG1r62yCKQc6drrs5eqsVRE1UgM7Nywxj2xOz4kDCukwwv+aEy6nu
 B/6uW/bDp1HXVb2ZeD1HonhHQzYZbHlofP9h6AwflslUs7LmGdBTUlQFxkA==
X-Gm-Gg: AYBFou2smKiMoZnsZsPPGUlxAgzbWVW6YzfqxDKVJgn0O+KFKwqJV8iRr4SzlKrg34I
 ZNkyW+v5p3WW6Dwfjcixntod954zXx90zZvj2Z+0Xmrb+M2X/SItXl3fr7wSity70KNnPUNIqVE
 L5piE1kZbloNSd+aec3LBHJ7VUgrOSpBNj8pRer62mr/Mg7ZMLTwqhUnwWWJiHHXsDuayR+cRWy
 l73eH/jjCbt9IbDVzdWHBRTj/yim/uRcC7jyQ1SqnEbGGUt7m6Att/F/5eeAj8kbetqDReBW1/m
 ifM3geQPebyf0TYRIfWRybgAm1Gkt87lCNXQNZAaQzSgP9YgibUXZFkuFaLsER/2iQms6U5jbMd
 fAT5ezhDLRMDP0ZB2gjyFQ7y9Ngs7CO5Z2aiqb0kh
X-Received: by 2002:a05:6102:48f:b0:7bf:250f:1402 with SMTP id
 ada2fe7eead31-7bf83a63fe8mr92495137.17.1790790346712; 
 Wed, 30 Sep 2026 10:45:46 -0700 (PDT)
X-Received: by 2002:a05:6102:48f:b0:7bf:250f:1402 with SMTP id
 ada2fe7eead31-7bf83a63fe8mr92486137.17.1790790346157; 
 Wed, 30 Sep 2026 10:45:46 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b06a2d642sm512950f8f.32.2026.09.30.10.45.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Sep 2026 10:45:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v4 5/7] target/riscv: Add riscv_cpu_get_mip()
Date: Wed, 30 Sep 2026 19:45:05 +0200
Message-ID: <20260930174508.81497-6-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930174508.81497-1-philmd@oss.qualcomm.com>
References: <20260930174508.81497-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CKy/zhrD c=1 sm=1 tr=0 ts=6abd4acc cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=8N6ZRiJSE69c2hvtZjkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: xQQWp_HF2PFIqo7zWT1402-UhsMop4VO
X-Proofpoint-GUID: xQQWp_HF2PFIqo7zWT1402-UhsMop4VO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3MCBTYWx0ZWRfX1WLiprS2LWBM
 06wiOiFE+0QYBDdfaKt2c94+9ZkgSaTn6DOEp9tSx6XN4mwo40o85x29TakAOSAoV3Urwi9HC43
 usLZ4AL05SHVBwSUm4ltxoAqcPXVBQMTmC80E94rGEuJIdvi4BfaVNpavtnzVrymKM873UyROha
 WZnhaNpfXo1KgPK828kj5/qabBla7a4XhQDVn8LEKP4jc1R5YPXMWr8RGxNc15RUjcD7P4255o9
 PBZA2IFVnDdI+hCHopJVXrA/Padm/I5Mv2AW246LRZPt4OC5nQh3Cq63mU2ZxPHl0c7S61OFuP8
 uDA6DJZ68nON2ylUezBrgmgWSWOd6OQtR3ewnSKaUMiDneJsIeNA2zJ84lh4E/vSmPWKAEEAf4Y
 VPCDg8rXDNvGpXS5dh3QtZyETY34c6b+N2z9LnURGuVRSSJ3PiYzgWT4+UEjWyt5aLXJFDLTdZ3
 339RXKJzTGYzv4nxBAQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3MCBTYWx0ZWRfX/NXhhMpuvtMH
 Hlnn23M2AE9x06ukaZIY0TyC9fRzCSmFzfxQNiB+U5zQ4Y36hwUi2l4kwntS+kWQ+ZRyOPm0OeT
 avGGRm7JlgF28C2pq+uaHB8cq0uuUxE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300070
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Route MIP reads in the interrupt, CSR, ACLINT and pending-IRQ
code through a single riscv_cpu_get_mip() accessor, so the
implementation can change in one place.

riscv_cpu_update_mip() now reads the old value under the BQL,
so the returned value matches the one written.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/riscv/cpu.h            |  7 +++++++
 hw/intc/riscv_aclint.c        |  2 +-
 target/riscv/cpu.c            |  8 +++++++-
 target/riscv/tcg/cpu_helper.c | 12 +++++++-----
 target/riscv/tcg/csr.c        |  6 ++++--
 5 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e34c0c676d5..ad731bf5d34 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -684,6 +684,13 @@ bool riscv_cpu_translate_for_debug(CPUState *cs, vaddr addr,
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts);
+/**
+ * riscv_cpu_get_mip:
+ * @env: CPURISCVState
+ *
+ * Returns: the current value of the Machine Interrupt Pending (MIP) register.
+ */
+uint64_t riscv_cpu_get_mip(const CPURISCVState *env);
 /**
  * riscv_cpu_update_mip:
  * @env: CPURISCVState
diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index 2d133d0dcf9..4bd359c3380 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -438,7 +438,7 @@ static uint64_t riscv_aclint_swi_read(void *opaque, hwaddr addr,
             qemu_log_mask(LOG_GUEST_ERROR,
                           "aclint-swi: invalid hartid: %zu", hartid);
         } else if ((addr & 0x3) == 0) {
-            return (swi->sswi) ? 0 : ((env->mip & MIP_MSIP) > 0);
+            return (swi->sswi) ? 0 : ((riscv_cpu_get_mip(env) & MIP_MSIP) > 0);
         }
     }
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index da4c1a090b9..b8d6f992ba4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -916,8 +916,9 @@ uint64_t riscv_cpu_all_pending(CPURISCVState *env)
     uint32_t gein = get_field(env->hstatus, HSTATUS_VGEIN);
     uint64_t vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
     uint64_t vstip = (env->vstime_irq) ? MIP_VSTIP : 0;
+    uint64_t mip = riscv_cpu_get_mip(env);
 
-    return (env->mip | vsgein | vstip) & env->mie;
+    return (mip | vsgein | vstip) & env->mie;
 }
 
 int riscv_cpu_mirq_pending(CPURISCVState *env)
@@ -953,6 +954,11 @@ int riscv_cpu_vsirq_pending(CPURISCVState *env)
                                     (irqs | irqs_f_vs), env->hviprio);
 }
 
+uint64_t riscv_cpu_get_mip(const CPURISCVState *env)
+{
+    return env->mip;
+}
+
 bool riscv_cpu_has_work(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 91f5eb72930..f8f779a01d8 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -567,7 +567,7 @@ void riscv_cpu_interrupt(CPURISCVState *env)
 
     vstip = env->vstime_irq ? MIP_VSTIP : 0;
 
-    if (env->mip | vsgein | vstip | irqf) {
+    if (riscv_cpu_get_mip(env) | vsgein | vstip | irqf) {
         cpu_interrupt(cs, CPU_INTERRUPT_HARD);
     } else {
         cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
@@ -576,14 +576,15 @@ void riscv_cpu_interrupt(CPURISCVState *env)
 
 uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask, uint64_t value)
 {
-    uint64_t old = env->mip;
+    uint64_t old;
 
     /* No need to update mip for VSTIP */
     mask = ((mask == MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
 
     BQL_LOCK_GUARD();
 
-    env->mip = (env->mip & ~mask) | (value & mask);
+    old = riscv_cpu_get_mip(env);
+    env->mip = (old & ~mask) | (value & mask);
 
     riscv_cpu_interrupt(env);
 
@@ -2061,10 +2062,11 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     bool async = !!(cs->exception_index & RISCV_EXCP_INT_FLAG);
     target_ulong cause = cs->exception_index & RISCV_EXCP_INT_MASK;
     uint64_t deleg = async ? env->mideleg : env->medeleg;
+    uint64_t mip = riscv_cpu_get_mip(env);
     bool s_injected = env->mvip & (1ULL << cause) & env->mvien &&
-        !(env->mip & (1ULL << cause));
+                                   !(mip & (1ULL << cause));
     bool vs_injected = env->hvip & (1ULL << cause) & env->hvien &&
-        !(env->mip & (1ULL << cause));
+                                    !(mip & (1ULL << cause));
     bool smode_double_trap = false;
     uint64_t hdeleg = async ? env->hideleg : env->hedeleg;
     const bool prev_virt = env->virt_enabled;
diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index 061bc9db77b..a0e32f14276 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -3816,7 +3816,7 @@ static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
     if (mask) {
         old_mip = riscv_cpu_update_mip(env, mask, (new_val & mask));
     } else {
-        old_mip = env->mip;
+        old_mip = riscv_cpu_get_mip(env);
     }
 
     if (csrno != CSR_HVIP) {
@@ -4549,8 +4549,10 @@ static RISCVException read_vstopi(CPURISCVState *env, int csrno,
     hviprio = get_field(env->hvictl, HVICTL_IPRIO);
 
     if (gein) {
+        uint64_t mip = riscv_cpu_get_mip(env);
+
         vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
-        vseip = env->mie & (env->mip | vsgein) & MIP_VSEIP;
+        vseip = env->mie & (mip | vsgein) & MIP_VSEIP;
         if (gein <= env->geilen && vseip) {
             siid[scount] = IRQ_S_EXT;
             siprio[scount] = IPRIO_MMAXIPRIO + 1;
-- 
2.55.0


