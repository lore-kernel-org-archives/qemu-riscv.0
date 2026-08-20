Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AEDC5DF8F
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 20:15:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wx99y-0005dZ-3v; Thu, 20 Aug 2026 16:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx99w-0005bW-UM
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 16:14:44 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx99u-0002CJ-6q
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 16:14:44 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK7YOu4012701
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 20:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QNEBEIJmMwDoBD78bITdTVQWtGt4MTDyYliaVB+vU0I=; b=gZGGVhDdTBzrvOsu
 PUdotq5aoUSVDeLSD4k8pMpfMCeGfZA1aRsZy9dbZBUzaeIp+SjrIdHcvEuRHQW9
 /J4MOqZzcvR/uCsGubXu/kT6VUWBm2pLQyRzCfeaH7S/bdz1Z1VSgXmMNnuuMfcA
 P65YbIwigY5epZqYVNu77Clx2pd0zR8TcsLlIVZ9Y3La+i1cnui8J+Z3B0oqze4E
 KWmx04YUeHGY+swxBV7z3F4eZ8T93lwI8M0xzRhH4rN/Dox8kzYq6p6bXFHeeCgF
 XeJHKgVw3rTqz9Q8WQ0DwbfC3ZFmeii5EdHMVHbvLqsff6NNTQUn3SsNyomYBVxD
 ZV4Iig==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x29k5j3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 20:14:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c083f1818so2664711cf.0
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 13:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787256880; x=1787861680; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=QNEBEIJmMwDoBD78bITdTVQWtGt4MTDyYliaVB+vU0I=;
 b=HRbeOLW8Q2jiMPNV3ugBPD2LUFTIfLoPN5ylrQxxsolLisYR5RwDqiCykme2EabOrN
 0uv+TyT51tF5oCbtbpJ4HNiZxovrRslIBidKXWjuzF9rudm0Ql80P6LYs2t4/zJDyRji
 KBu+d7pDdT3pzeC3Kna+T0K8sSXWWwD8BiJcA0lwhNSVS4c2Cp3zTttiZay5vqlUpiYq
 QpH/7vtv3DT22VkH47nVPUjzMLf5VLgBceAqidVU503XBOQcyn7Af5vsx7CmLtc0dOzi
 ng8yA5Q7JCHiXTa7XaRhFAQsaUlQX7MwbHXHqPXK7ejdGHL7eKp7ZbxhaBty2+mOM9iQ
 Tj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787256880; x=1787861680;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QNEBEIJmMwDoBD78bITdTVQWtGt4MTDyYliaVB+vU0I=;
 b=DZgY8lOWm6hVWihgo0bdHlTHJDJomid/eCi7GRV9SvOzw1Fo8TTjyt3nacf2ipWMt9
 1wRoTOk4JyTH78qhubYjx8DkshoEGMppLr1VdbUlVkFTZkOdg4Oxepxcrp1cYEMRld26
 39enkWRt8RJqrL0eM4rKgGbktKvOOxKCOLdeVe5VfAEkLlZ4M2cTSZY/TQ4zahwjUuTp
 I1/G12RassX8lr73wrmWzffIajWdK8Do6EKAMy+LEk8P3JAovJE7JuF8nt+RZlWMhTGV
 uVOq9dT6vu6LKM8srSs/X1Svho60FPVwsYVOFHlLJk+AlsjHceEgw6CGjiuUhwhmPY9t
 5YZA==
X-Gm-Message-State: AOJu0YzQfeGkg/ny0XHvXKMegFSw0zDUSWuSgoUfplXkIlTWqJnG/Y25
 4JiK2izCIOSh1+vxCfb8pA5VGHmiO7ZXxiiXXR7OQGipzJ7pOioFruBOc8NVKmMoLvACZLjSm+Y
 S4eC1Li1iLyWanCatDL47+gngHL/N0sxX3NKGmly+eTqEWjnytvBKM3DevmV1C+Zf6C7P
X-Gm-Gg: AR+sD10RQFMrsBSZMYX1yQuQcI1LCB7T+b8DU4455bijODIeZLwBv6Gb0EFw441Ljrf
 9DForlHbm710E0KLHWmEW4ELFwQDZRd4xGkLD8d39PbZsQwl4EtUu5BYd04Ke+50cxXYK4BgpUn
 FKj/z0GpReXpHguZYPfo6svaCvOnNFuCe23Qv1T7j/jVY0heCHG7BTz8MSw0iK0rMHA4Y4KHCyZ
 EmKvzPSEqBlUf4asRaliR/Qk02jptp8Kud/HpGW+UejlaZwrqt+CXo3Dll3TXhD21Y8nuRBGPRM
 lx82DO+BVsElIi8xacDf318I92qUIwKKKfQG4HA1+tGg8sdHKitR6wRgt2ky5uRX9z2U1BQ3Tyj
 VffjAOM9SNJ4yRfsfw4I12BMRm9rj0B9iyYhxl1QnuQ==
X-Received: by 2002:ac8:5953:0:b0:52b:4f1a:5ff0 with SMTP id
 d75a77b69052e-52df585f4ebmr9474411cf.19.1787256879747; 
 Thu, 20 Aug 2026 13:14:39 -0700 (PDT)
X-Received: by 2002:ac8:5953:0:b0:52b:4f1a:5ff0 with SMTP id
 d75a77b69052e-52df585f4ebmr9473551cf.19.1787256879155; 
 Thu, 20 Aug 2026 13:14:39 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b10fcebdsm15612963f8f.0.2026.08.20.13.14.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 13:14:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v2 05/15] target/i386: Constify CPU*State for
 cpu_*_interrupt() getters
Date: Thu, 20 Aug 2026 22:13:45 +0200
Message-ID: <20260820201356.29775-6-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820201356.29775-1-philmd@oss.qualcomm.com>
References: <20260820201356.29775-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NeHRMMXEsBgXz7xYZxq6aIi9BopjIceV
X-Authority-Analysis: v=2.4 cv=V8BNF+ni c=1 sm=1 tr=0 ts=6a876030 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=tlxghdvPRZsVr19qFskA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfXwkEM7x4yhiDR
 2XxPQN4xC6TBoOhw5NjBe+fkzwjec8pkHMlt8a4j4fwDovRcx6GVUPCaEBqw7kQaTlzR0k+q5J/
 z2fyIKxC2iB2U5JKHDHgkz/SpBVeFHgopDhRlnoRLm2eBDphqfWz3nsym2KI4kykS2wc+Ergggh
 3MyRhCGXPxRLb9jQXZPVRQL1/sxEjMB0euzga0hIGjM7Todu4WxFl9X/X5TVjj3sgduuD51LV8r
 xq3qL8651nIVmTBZw/ZfU10XnDPovuC4HymwncWkWs7RC0dhsFxGcpOAffZMCgjTQtwLH3MMfpm
 0V3WLm4M/6JOZBp7i3suSoIpQLuU6OKXkc1pExoefjzOf+a6cb8IXu4R621M8nbbFWZZ6H3ATuy
 iBDy8ChDsYXRAGZOCWm4s2UsntAEFB0Uvps6LurEclTkeDhhgn6qhnoep0mTOiFt6odzhhWM0th
 UU6X+n5r95lX8B5pvBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX4RfmEl3c/jEQ
 4pEURn/RbYWvfZ4raUFAH1QSfMY6uf2s7q7ko3XwOWnAVZTBvIQa4wVkcI5K25XxXCpAJ3bqeZ3
 5/IZywauT1/4768TaAYTmOc4+MqytP8=
X-Proofpoint-GUID: NeHRMMXEsBgXz7xYZxq6aIi9BopjIceV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200152
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

x86_cpu_pending_interrupt() and x86_cpu_interrupts_enabled()
only read CPU state without modification, add the const
qualifiers to CPUState and CPUX86State parameters.
Simplify directly using cpu_env() in x86_cpu_pending_interrupt.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/i386/cpu.h | 4 ++--
 target/i386/cpu.c | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index e6a197602d8..72adf075bfd 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2584,7 +2584,7 @@ void x86_cpu_gdb_init(CPUState *cs);
 int cpu_x86_support_mca_broadcast(CPUX86State *env);
 
 #ifndef CONFIG_USER_ONLY
-int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request);
+int x86_cpu_pending_interrupt(const CPUState *cs, int interrupt_request);
 
 bool x86_cpu_translate_for_debug(CPUState *cpu, vaddr addr,
                                  TranslateForDebugResult *result);
@@ -3092,7 +3092,7 @@ static inline bool ctl_has_irq(CPUX86State *env)
     return (env->int_ctl & V_IRQ_MASK) && (int_prio >= tpr);
 }
 
-static inline bool x86_cpu_interrupts_enabled(CPUX86State *env)
+static inline bool x86_cpu_interrupts_enabled(const CPUX86State *env)
 {
     return ((env->eflags & IF_MASK) &&
             !(env->hflags & HF_INHIBIT_IRQ_MASK)) ||
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index e5ffb10d156..1fc02cf94e6 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -10601,10 +10601,9 @@ static vaddr x86_cpu_get_pc(CPUState *cs)
 }
 
 #if !defined(CONFIG_USER_ONLY)
-int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request)
+int x86_cpu_pending_interrupt(const CPUState *cs, int interrupt_request)
 {
-    X86CPU *cpu = X86_CPU(cs);
-    CPUX86State *env = &cpu->env;
+    const CPUX86State *env = cpu_env(cs);
 
     if (interrupt_request & CPU_INTERRUPT_POLL) {
         return CPU_INTERRUPT_POLL;
-- 
2.53.0


