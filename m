Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E254C98302
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 17:12:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9QVo-0003aJ-AR; Wed, 23 Sep 2026 13:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QVP-0003RL-RN
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:11:42 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QVN-00011u-C3
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:11:39 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NGTaXF740286
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4+Hm61vbLZRTj0yVKnQACRv0FSYIqQtRBRB3dZnU6TQ=; b=fFnbdV6A61S0S4UU
 VUQ2suoJRD9FzLf9dqjFghtiARh/C4l9OiqydsFIT6tmYRMOO0WotLQ8bKRcvIea
 Z7uumZhqGcWybBiR/UW9MCFDedeWJ19SfIb2+8aiV/Tgpqdh5SmZ7S18n502W7F1
 Qnsng+88oeTg4UaqQ1cFEI1t/fVO9xZA4MOgDwzY9kZFPua0SNNEYep1LuYB7j4W
 DvOOKCKNQK2HSERBS2wCzrVKZDICThOoQ/FUPcD7DJEo7pQ+JDGrVxRsGF+pvBee
 XKH0Cjihq+V5SbKNUQJ54JIbm4sjXX+G+Vv/FDDzNcOM+17EPCKCkT646FbJ10kG
 3qq5ZQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjsh38t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:11:35 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-9806756ea40so949100241.1
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 10:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790183494; x=1790788294; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=4+Hm61vbLZRTj0yVKnQACRv0FSYIqQtRBRB3dZnU6TQ=;
 b=UJqbWfNccvcW3XeUPHCU4hdQPd7/t68uJn9++e3IZWncJdU34iYbk5WAviREkCjZv4
 UBkJUG08wdBxwAxcGfb/iYm7cLnsJG7oralXK2SDYwrL/oMjlWc8qBoz+wgkbJ8jyQ58
 qUXdr4uXPtisfLKjgfdEgzr95QRvvig9cpfZxfGtC8ko8MeE7MgMGfUxIvQh+3sLxOCV
 nTR4EUU/+9YJsvNvf33bd9boF/3SaLjPypb5ipLm6sOfw/7R7My+biN3cDEcVv0gH7aP
 2i9mt0ucqvmeVSZH/bdyHC47k6r9A6xcvz4kqUzXv61YKlcbQdgkfcMe9R061YP4fWod
 p1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183494; x=1790788294;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=4+Hm61vbLZRTj0yVKnQACRv0FSYIqQtRBRB3dZnU6TQ=;
 b=YjQm2xVC5EkLqi/j95PNNklyU1EaFhYMYn2r4oQu64dmLaqUyc3Cvlp3gX2NqnmSjN
 ayzhiYzOnZXen0OHcrYY3v74mSz6yAvmftwQoTdJyoa+sG38dB19IoGPl2kJAY6Ze3qA
 wntkhofBPgdc9v+vNLEE+29c34pJaoR4RBqkjBxfhXzYH7ZSBjGU/9OYj0Exv0ReGs2e
 wkO/9Cj3ELkbDXCNchpUMCoT3QIHUPGwf8/DFEGStMEsDqlZpp74C3EySW0hUrW1gc4k
 JPgdo4PME1Smz43yfOWhzcoQeCI7+0Sbdv7+i4n/gOR0WP/iEUHxSrVsVRiOEitZlrvy
 6lKg==
X-Forwarded-Encrypted: i=1;
 AKwUvByhtoSHuFr5ovkxhK6/JCIEW4h5DaJNdS/TAOGDivdeZjYNnekT69IhoS6+Un4aBWC01kdu6Sb+sYCH@nongnu.org
X-Gm-Message-State: AFuF++kLDTAXD05H4pxJug8iiDrjVutlBh4ZoNsaeUTXHOcXXEDqWJTP
 iQITQa2FTgTSPYwRAp1fsnnTwNTBF0tAMY+oMklbkwugd3Qr7U5Kr21JLqqD6AmR7RzhPDFEiKb
 E313Hd0kn3iJcm7dAFTlsmT2mkum7Hm+s8D+VABjMAoHJTWUoYDeKWqndGQ==
X-Gm-Gg: AYBFou2C5P3Qo9ao6zZduGrrV0RTh6mY6kFblOInHG8LFKjlMPzwayjRcxwmSByrqJr
 Xaoqwt/aBgdbSJQ+niBdeKQ6cxdFtz6n8Eu8eXgzKnYRDHrwsXt1e6tMn1Kr7jQcvoMTlH9c5yl
 /1l+mlx5sFp3zFkXQHwrSKvJttxbQjhAD4oySKzFOt5HamoyJgD5g/Nl7gWii6rNSuc/1RtQKrH
 4dqXvEDZtcEQXimS++cdY6/2AOxdofeE3bBfYXXHVFQds2qX2NZXqRLpL6oup1E4IOaardPSQG9
 X/1sGKTgP7XCwjaS5D16gIz/PTXGHgpETCR+pC+jogjL84MUkvl4ZU/MULpeLautQmbze6CSqLM
 zkVFgyM9bxwJ0hTz+4ZuCWQuh314zb3IqrqrWaX93
X-Received: by 2002:a05:6102:4410:b0:7a7:19aa:8a86 with SMTP id
 ada2fe7eead31-7ac1d4db191mr3142916137.33.1790183494104; 
 Wed, 23 Sep 2026 10:11:34 -0700 (PDT)
X-Received: by 2002:a05:6102:4410:b0:7a7:19aa:8a86 with SMTP id
 ada2fe7eead31-7ac1d4db191mr3142874137.33.1790183493467; 
 Wed, 23 Sep 2026 10:11:33 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe0c3731fsm70878365e9.2.2026.09.23.10.11.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 10:11:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: [PATCH v3 02/21] target/s390x: Use s390_cpu_get_state() consistently
Date: Wed, 23 Sep 2026 19:10:56 +0200
Message-ID: <20260923171116.31276-3-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923171116.31276-1-philmd@oss.qualcomm.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX+MUtJq5q7lVX
 udyifV8dgzVLP4IYUF0uK69SrUOirtzH47p9DOpsqQH9BDNpN+U0t/8PpE2aonY6O57I259rBLN
 C0PswQ1GEt0XkQJG/+vsuQAteb7mfpsdb+CvkyRrc9WbhLKwULZkw0Keh/7EePIDWG0APa2rt9m
 XVyNGkZ5SbjjCEjz8qWGM7cNj2laFIwWCSDsyv6D+Fr55yEwV26Waa9jGy59uFH6FDT6hYWWN77
 b0c8e0tCMUSe+MnuDMlNxRm1SXvhY3/rtxie3lygn+9+zME4fpmrYarjkaJbmgYIuB20YhCqMFp
 oegDgiMr/U/6a8FsdpspMCJD25KX883WaU4gqOLTpQGqZI5nXbKjPMchT0fhDvE0OcaR+9dSYb4
 Tf5fXMbY+umNx5qI55/j/JvK3nTWMNdP1CDwis1yE3d1vwr3XQPBoSW/L64Qc6/HWcd6HpoNyZX
 9R75FHJZuLsElZXXAQA==
X-Proofpoint-GUID: 6mX46HN43uQU36pKuNEfkaJQGDXhIfB1
X-Proofpoint-ORIG-GUID: 6mX46HN43uQU36pKuNEfkaJQGDXhIfB1
X-Authority-Analysis: v=2.4 cv=K4+3jCWI c=1 sm=1 tr=0 ts=6ab40847 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VnNF1IyMAAAA:8 a=z94vmTcaOVfBjqTZL9kA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX7I1+wTSMdROL
 Hmt+QOAiJMGE6rFvU63yRB2Snl1t6OUXv7/14ZMhnSBQuWrbk/BLq3ldulRc6dgnmYb8MgmmOKS
 AFP7qFGZLQK2dN5bCC2gewygEDMaWtA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
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

Replace direct reads of env::cpu_state with s390_cpu_get_state().
This keeps CPU state reads consistent across CPU transitions.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
---
 target/s390x/cpu-system.c | 2 +-
 target/s390x/cpu.c        | 2 +-
 target/s390x/kvm/kvm.c    | 2 +-
 target/s390x/machine.c    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/s390x/cpu-system.c b/target/s390x/cpu-system.c
index cc9685221ae..c938c77d0bd 100644
--- a/target/s390x/cpu-system.c
+++ b/target/s390x/cpu-system.c
@@ -263,7 +263,7 @@ unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu)
                      cpu_state);
         exit(1);
     }
-    if (kvm_enabled() && cpu->env.cpu_state != cpu_state) {
+    if (kvm_enabled() && s390_cpu_get_state(cpu) != cpu_state) {
         kvm_s390_set_cpu_state(cpu, cpu_state);
     }
     cpu->env.cpu_state = cpu_state;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 7c725b8a4a4..85afc5dec9a 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -130,7 +130,7 @@ static void s390_query_cpu_fast(CPUState *cpu, CpuInfoFast *value)
 {
     S390CPU *s390_cpu = S390_CPU(cpu);
 
-    value->u.s390x.cpu_state = s390_cpu->env.cpu_state;
+    value->u.s390x.cpu_state = s390_cpu_get_state(s390_cpu);
 #if !defined(CONFIG_USER_ONLY)
     if (s390_has_topology()) {
         value->u.s390x.has_dedicated = true;
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index b34a9127141..6622886032e 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -407,7 +407,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
 {
     unsigned int max_cpus = MACHINE(qdev_get_machine())->smp.max_cpus;
     S390CPU *cpu = S390_CPU(cs);
-    kvm_s390_set_cpu_state(cpu, cpu->env.cpu_state);
+    kvm_s390_set_cpu_state(cpu, s390_cpu_get_state(cpu));
     cpu->irqstate = g_malloc0(VCPU_IRQ_BUF_SIZE(max_cpus));
     return 0;
 }
diff --git a/target/s390x/machine.c b/target/s390x/machine.c
index f714834a98a..b44fba43f14 100644
--- a/target/s390x/machine.c
+++ b/target/s390x/machine.c
@@ -32,7 +32,7 @@ static int cpu_post_load(void *opaque, int version_id)
      * than via cpu_synchronize_state, we need update kvm here.
      */
     if (kvm_enabled()) {
-        kvm_s390_set_cpu_state(cpu, cpu->env.cpu_state);
+        kvm_s390_set_cpu_state(cpu, s390_cpu_get_state(cpu));
         return kvm_s390_vcpu_interrupt_post_load(cpu);
     }
 
-- 
2.53.0


