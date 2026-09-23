Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF09C9830B
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 17:14:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9QWf-0004su-54; Wed, 23 Sep 2026 13:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QWd-0004mN-HP
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:12:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QWb-0001CI-JX
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:12:55 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NGThTm2470171
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 a93quepVzsQCmaXrVnT0S6jqUGluReByWnrx16eheic=; b=QwSCJ44k7kPTdLIo
 /Nd8mS2uRzYML0ElVbR+XPyVynOiCdGxaRlF+GagE97dTkJWJazJIOdnJ5pwVLgO
 Ps8OlgscUpQni+ficn2RRIlmGtRNw5+/mcBtX53JxhK+BPykV5aot7JBf0FdXIrE
 ffdVfRLHVRolMCpF9lADdMCgO40vD4ApjcqY7x99lP9gi+VphTCGWUz8Oc+n228w
 V+El4I4haz92uIBSORZ3zvaYDYgz//ZiFiuoTuXSdij+fUhgno/eqTb4Sv4rfmG7
 9Lbpuks4AOabLwNC72Wb/novW+gLRIVokLagAIdD4XtlBRTYBPJIOEVgTpKbZ4IK
 qneOjA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjv12s8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:12:42 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-97e9909eeeaso294128241.3
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 10:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790183561; x=1790788361; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=a93quepVzsQCmaXrVnT0S6jqUGluReByWnrx16eheic=;
 b=HHqsawnormiDvS7shu8pwtV05mmF33UTfbhsH0YqsH0P1V6WBUs9+K9HdLQz4ie495
 ygETQIGbhP7m6Y3fPcsMI2MVHHMMlOwqsNK6yzK4Uy59LgCl8gJgEtzuSiByHi+Sr7Mg
 JVEtJMhFxdsYhNtmao3wL0O24s6JCL5/jk2asR+8CFdnXTOYkvHAfZckzvUX+0S/ztb/
 O8TGEJGvAo8RzofIOisRnF5GvSAuoe357C9uFfWJuqWX0EGEIeOtCEmNp1NoAgUYLY/u
 bV5kwVEw/17oHQOy04TyWZOe46IO8PzVOoQxqSsT4lmiWSz8rNvSIwjma3SwqpC/dNXB
 uF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183561; x=1790788361;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=a93quepVzsQCmaXrVnT0S6jqUGluReByWnrx16eheic=;
 b=jdGcpJQoZpN4p6U8POpVN14rkqFNiqCuDKxyn08+hu+zju4niJs1xt7wohPAyto/KG
 Riv1oGNQpRlIDFWSy95MumHnS/g100Z6S2IW3p5lv4U9CrkRTLco/+9Ru8Ww3EvHQ9qB
 otiV8EHIsnUrWPAyp9f95grDjTu+I+j7Z1K8sk/NdERksvtpY5rD2DzQ4zWR/oxniZKt
 mdZdZCjKgIe2AmKnqCMAQ+FOCQRdg0kdMEV/TkJW/dkrFl5jt3cI3+pJTxpW1SZivoOW
 wDbWdAmipJYUHyaLJidA+zbQz36l9vzXpGmcOISRHN6oKxr/WypZ0QyLiPQOipr1xa39
 6LwQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxcNEMFeF6Ri+BdYw3cHfYTSAn7Q4SqalMlQfmnA/DagMzO3RmhqQOcdeNgL3wK+sIwHWUtj5l0a8hX@nongnu.org
X-Gm-Message-State: AFuF++nq4gMRbvOKTtVH1SRys5Io6pYJOTqwyx5Ymhmka8m5MKcbGFpz
 pcrbRLa8P5nrxKLZr/sMZ9cUil1t1N9rzRXgOZ/EXrhjKZrs8i2F0IfXpW+wvKr+w6rmQv6qyIK
 k02DolMnA7oA5CYrlhsD7MoCvl/cwzkRW/Ut7vN6bM/dVCj1gkX7uJt/BBQ==
X-Gm-Gg: AYBFou3DUwo1rWAjic6+C0qVcLAxQ8SUhs1iP8giLPWBwfKFOYr32OZ2P/AMZF3NKRF
 hyHmSW+FjEg2/uXQnEI6SyBvPyJp3aLJ8X2V8anSkE8a1YjL4DnoNDl13fye0xdy7bxruz6P7Qi
 xQneZTgCR8Z1GPWbWWyCvrD8xr9sbWYQAOzlRgua6DzGWGxH83eYLUZMqjUvg/Nmn+F8yaeDF30
 0Fft9XogGj4n63k95TIOlO60zoxAAbI6kZSDBXXFMuUcZSxId7rkiH70dBtlOFEiEGMT2teSHzd
 NsWaYZLDB/N1zn8bRU2MqyW5dSA8VEjs3QXviTPrXGTlvmhnNHd6MNoQIsnjwT51/01QrxdFhFj
 R7hJkWFmxhhfHYNxP98f3gsuLoSZC7aRB7Jc0eILpnRZAKZLWVqw=
X-Received: by 2002:a05:6102:54ac:b0:7a1:f980:e934 with SMTP id
 ada2fe7eead31-7ac1b621439mr3137130137.16.1790183560977; 
 Wed, 23 Sep 2026 10:12:40 -0700 (PDT)
X-Received: by 2002:a05:6102:54ac:b0:7a1:f980:e934 with SMTP id
 ada2fe7eead31-7ac1b621439mr3137110137.16.1790183560488; 
 Wed, 23 Sep 2026 10:12:40 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5b47da1sm1928535e9.0.2026.09.23.10.12.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 10:12:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH v3 11/21] target/riscv: Add riscv_cpu_get_mip()
Date: Wed, 23 Sep 2026 19:11:05 +0200
Message-ID: <20260923171116.31276-12-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923171116.31276-1-philmd@oss.qualcomm.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX6oJUfyuNAg0F
 Fto9rYBqR77itvW61gDATGzX7U4ysUBGAdf1x0T5DBos9wCHs/N1TSjC1I7K9kHfBOuBJ+sIlfo
 ZSKounyomwBuhUXvK+nNHp2yNMEZWyH5ywgnODyajD1uok2fDKV/7TuwTmrKrt5mQV1vyuPqX5+
 2NKfNGmn36DzDI0OGLOgHjqeNZPEJrGLXwCINMh1mc+XDHBAepi+Z7ATEnRoznVlRYVKEDG6yEk
 0ekaUNLyYN5Ite7hfIDekTGdN+IQJW7Cyh1cX8O9YcUZVfi/vS/gNEyheYoAodZdIOg4PGOxUvo
 qUInb5bl6cJ/P8kr5j/MRl+87TcqKE+7mVBeUvkUgECg9oBkJlCKE8mMGmAmivWGc975vmX0PsY
 tujkkBbdBqUvyzCFQEkB8zlNAH996PFjPCLdiNaYzJsJXhQb3yD2MfaMJg8zZxW4qG0CEOr5v1E
 VB3aWoDGPYzPsg7UcvA==
X-Authority-Analysis: v=2.4 cv=aIxlOr9m c=1 sm=1 tr=0 ts=6ab4088a cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=CJh49rvbU3Czu_A6mFUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: evXIVVZzbVshgY9ySsr6mHuoU-_jEWcS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX0oqm+UfxvSY6
 JNi7C17CoHHj/AKliaUVsKq/MFwVEti2cGJ7PGbh47Qe7gYyDc259p1f91H9UoSd8hZlJIQZdCz
 2pIKwWgJ45Ko2d2p03+L/JKIRzFE2j0=
X-Proofpoint-ORIG-GUID: evXIVVZzbVshgY9ySsr6mHuoU-_jEWcS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230068
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

Introduce riscv_cpu_get_mip() and use it for MIP reads in interrupt,
CSR, and ACLINT code. Centralize reads of env->mip before changing
the accessor implementation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/riscv/cpu.h            |  1 +
 hw/intc/riscv_aclint.c        |  2 +-
 target/riscv/cpu.c            |  3 ++-
 target/riscv/tcg/cpu_helper.c | 17 ++++++++++++-----
 target/riscv/tcg/csr.c        |  6 ++++--
 5 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8c8ffe94cd8..be8c937bf5d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -684,6 +684,7 @@ bool riscv_cpu_translate_for_debug(CPUState *cs, vaddr addr,
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts);
+uint64_t riscv_cpu_get_mip(const CPURISCVState *env);
 uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask,
                               uint64_t value);
 void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq, bool level);
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
index da4c1a090b9..62ac4507ed5 100644
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
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index be64f9ee8f2..e524798d312 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -526,6 +526,11 @@ void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
     }
 }
 
+uint64_t riscv_cpu_get_mip(const CPURISCVState *env)
+{
+    return env->mip;
+}
+
 void riscv_cpu_set_rnmi(RISCVCPU *cpu, uint32_t irq, bool level)
 {
     CPURISCVState *env = &cpu->env;
@@ -554,6 +559,7 @@ void riscv_cpu_interrupt(CPURISCVState *env)
 {
     uint64_t gein, vsgein = 0, vstip = 0, irqf = 0;
     CPUState *cs = env_cpu(env);
+    uint64_t mip = riscv_cpu_get_mip(env);
 
     BQL_LOCK_GUARD();
 
@@ -567,7 +573,7 @@ void riscv_cpu_interrupt(CPURISCVState *env)
 
     vstip = env->vstime_irq ? MIP_VSTIP : 0;
 
-    if (env->mip | vsgein | vstip | irqf) {
+    if (mip | vsgein | vstip | irqf) {
         cpu_interrupt(cs, CPU_INTERRUPT_HARD);
     } else {
         cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
@@ -576,7 +582,7 @@ void riscv_cpu_interrupt(CPURISCVState *env)
 
 uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask, uint64_t value)
 {
-    uint64_t old = env->mip;
+    uint64_t old = riscv_cpu_get_mip(env);
 
     /* No need to update mip for VSTIP */
     mask = ((mask == MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
@@ -586,7 +592,7 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask, uint64_t value)
 
     BQL_LOCK_GUARD();
 
-    env->mip = (env->mip & ~mask) | (value & mask);
+    env->mip = (old & ~mask) | (value & mask);
 
     riscv_cpu_interrupt(env);
 
@@ -2064,10 +2070,11 @@ void riscv_cpu_do_interrupt(CPUState *cs)
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
2.53.0


