Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A73C5CFDB
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 18:17:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuZz9-0001qp-QI; Thu, 13 Aug 2026 14:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuZz5-0001mw-7B
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 14:16:55 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wuZz3-0001z0-7e
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 14:16:54 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67DFU4PH3500650
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 18:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 If9D7G1AX8bwDN7nlcPuG21QsgSh5nNyafUcgJBgDj8=; b=ANdea7Q7Zh4mt7eL
 3lMOeJuXOtA0ua3yxADRhT+amAjuVzB+khJGoST9pX7AFfQ7M0PPl6hD02KLNinM
 9EyKPhB7tCguxnHp+tGwaoKbnQpikt0jZhsY4T5xCCI7Zs72xA7iqGgB3qB369cs
 567L17gyoMj+8NX5/TE6oCIYN8At0e57BpvKm0Nil4pw204xFvcuP+Z8xVfVVIOY
 iVRIPsR2BmeD4yxczdVaIIVsbBsqIDiYYoKPBpcdqpyPHgKK/UCyswVTRZ36NCpx
 ibSxr8D6W0/M7O/SBqcuqmYH2lyctnSOmr4wyfm3Lr8IBnKfnENwMc2z1a4NPwd0
 0oHmeA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g181836qm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 18:16:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c083f1818so3030341cf.0
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 11:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786645011; x=1787249811; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=If9D7G1AX8bwDN7nlcPuG21QsgSh5nNyafUcgJBgDj8=;
 b=KQa1rRs9W3mJ2DIJuYzOKSup+ACYJC40T/AH/K9wp4CuXUcIDiJOhEqtg6Ucvqf/uK
 0WpSGt7C4lLkAHLpVAR4Jy1e57PsWwyQs3yIdkziSUz3z3RIqS3S1/J5BwVGdzNwi+4C
 X3hUttNZJtSvDyPXDwoiA1SPSy2PkLLfuvxfBWDTcmrgUcC/7HFEP7L9lv7dS1yaNKxd
 kcddrpimS7doD7oIr16XytF4pzHV/X+gz2CWSJVPRxSpYOZuXsBe8K4137CEa1+ENNpP
 MEPi7D6fbEEAEjxGmd2E7kgbu5ExneMY7yKBNxKvNH4I6e0EEW+H8GJ8OBA29GuaPpQ7
 JBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786645011; x=1787249811;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=If9D7G1AX8bwDN7nlcPuG21QsgSh5nNyafUcgJBgDj8=;
 b=rC2wz47o16gjxKLe+awahABZb5CHOQ6BXdCeTC6HZ75lBhsTOSCmQdfG5ObO7ls5JA
 ccI3URYygdyePzJpUUE4AsA9MFtRiyJVulJxXIBSrAr2j96JdZSIlFUvgkeMQDPZ2D3g
 XaK6Vqm1YwRugzEoAAd4zyP5z2pBwC13yYKNbRA0tcxZtOBpSpju3EVDABKlmaZpdRXA
 cW0yQkxuRupckFxXJOUI03uD2wws86Ep+RpxsfTRJd8E5GqchjSZqtb29HKWgI4dMYxX
 mwaKOe6a224HMON7q1iEqO6gxzx2DOOcCmkLyO2rqEBzq+rJcTOBxA2HST8aIBi3Wlia
 XTIA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrmHHvaINTpiTJn1vpe1gRp4kL7at/JZQYhfJ8jctW1hvzmUBupJKU2SpWITo9JeyKTrDwq5eR8gXga@nongnu.org
X-Gm-Message-State: AOJu0Yw/caQ156hNBlre6Vl/2LB6QorATXyg8ZXJiI/4qoukChLg4xrG
 OXJSbw4rIcsuM7exR+MRlUedQGQlZgAtTCYjQ2P7t47eP/6m7WV1XVY+7BqIihw134IHEAcUvLG
 cwF/u4AG0eCNDwGFENvS0cdM4c6P2nn0lo8hllUwjNWeQ3AOyRa+wMTTUpw==
X-Gm-Gg: AR+sD10HJLBPRQWGNUqrfxcy9KBgB1zpGp5Azj04Nr4J25n/0Q9s60nohCHLviXpE5U
 rbS8p/v71HtbLZWjKOOwNzsB3B6XK8T1FWjF19u9sTouQc6HNkEQS6fbZ0mPWPp12OLq7rO5b6I
 EQXX6bUDZlj8v3gsn+sSOGOInciWaMWvKvOJhhRAK3pNt1deVMlv5b4n1WLO95o4RErqU7jqPTC
 DDykAMpjXIW6PPqdfVTX47lLfsIqpQDHUZuhWOkS55sK0hypDmZEbhapommAWmurcXG2OURE87Y
 DMPIK5AeUtckdTK+115oIOBvC7ZOnXxQyaXhXLY5WUu+WaxvhJMWNSqc69Hef94aZwh1iVCyOAo
 z8eE0J4jFFsYlnqkWA+4o1JbekXDP/lh5q5o6yC2I2A==
X-Received: by 2002:a05:622a:e0c1:20b0:52d:771a:231f with SMTP id
 d75a77b69052e-52d771a25e6mr48080641cf.12.1786645011140; 
 Thu, 13 Aug 2026 11:16:51 -0700 (PDT)
X-Received: by 2002:a05:622a:e0c1:20b0:52d:771a:231f with SMTP id
 d75a77b69052e-52d771a25e6mr48079961cf.12.1786645010616; 
 Thu, 13 Aug 2026 11:16:50 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2c129dsm1038781f8f.26.2026.08.13.11.16.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Aug 2026 11:16:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Magnus Kulke <magnuskulke@linux.microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Wei Liu <wei.liu@kernel.org>,
 =?UTF-8?q?Doru=20Bl=C3=A2nzeanu?= <dblanzeanu@linux.microsoft.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Reinoud Zandijk <reinoud@netbsd.org>
Subject: [PATCH 01/16] accel: Label outer / inner vCPU execution loops
Date: Thu, 13 Aug 2026 20:16:24 +0200
Message-ID: <20260813181640.6537-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813181640.6537-1-philmd@oss.qualcomm.com>
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX3KNLgl1Ka5AU
 4YELEVTGoSU0ZZ49L8c8ciGfqnhkhFV/iZrL7IyKgf4OC5zLxQSg7GHyDPLXPSMjOQcIkEl0CZH
 WuajCGdX1Ky/Uv1VZ4EVN5KDEXMalG4=
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a7e0a13 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=IxD3LLwSwie1VK6kbxAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: bqqXMFqPGyb8xRr6VARGS-IdoJNPF9C9
X-Proofpoint-ORIG-GUID: bqqXMFqPGyb8xRr6VARGS-IdoJNPF9C9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX47WKSkga2LX7
 bY4hU7qqBZCJ57qpw+8hFWo1T8KgjchJiMSprEFrnY0v5wetf/yI4FDt6CKtxicb6LbaSTpTLjT
 v85/8xmA28zdkbhteanlpvy1VOJRa4TipdionhPYC7CYonWLRVCQ2y71XMt+s0h2As93JNbzAc5
 jLbf9VSMGM1E19vJFq2UYRQNjnmozHTS0Cwn20IaqUL4BHwpqgBMT+T21r5Siu4dhgsHBtmyB6T
 u5u+x12HKwOry+LsKrfsJ9wm9fZdY9T6SyZ1K/xMFq38WRK1NuwiAvRaNEJFeh5HNEIuE2np9BG
 b4p1U25NXVROMkTTKixWTtipcX+gsfCrBRXBk3j9cHWOQD4/hphhPhKQWgarw7qk9pxfK2PD7+E
 59zN5WmV2kICDIuy93560VkfsIYdEawHXytbWOj4W8kNfxWyc2kku9yCeZzoyEzb3naDa44cjfJ
 wK2EOopZj5qEEcihagw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130132
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Distinguish between the 2 levels of vCPU execution loops:

 - "Outer vCPU loop" handles CPU events in vCPU thread
 - "Inner vCPU loop" handles actual vCPU execution

This helps following the same pattern between all our accelerators.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 accel/dummy-cpus.c                | 1 +
 accel/hvf/hvf-accel-ops.c         | 1 +
 accel/kvm/kvm-accel-ops.c         | 1 +
 accel/kvm/kvm-all.c               | 1 +
 accel/mshv/mshv-all.c             | 2 ++
 accel/tcg/tcg-accel-ops-mttcg.c   | 1 +
 accel/whpx/whpx-accel-ops.c       | 1 +
 target/arm/hvf/hvf.c              | 1 +
 target/arm/whpx/whpx-all.c        | 6 +++---
 target/i386/hvf/hvf.c             | 1 +
 target/i386/nvmm/nvmm-accel-ops.c | 1 +
 target/i386/whpx/whpx-all.c       | 1 +
 12 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/accel/dummy-cpus.c b/accel/dummy-cpus.c
index 5752f6302c8..f9a8d5fff07 100644
--- a/accel/dummy-cpus.c
+++ b/accel/dummy-cpus.c
@@ -42,6 +42,7 @@ static void *dummy_cpu_thread_fn(void *arg)
     cpu_thread_signal_created(cpu);
     qemu_guest_random_seed_thread_part2(cpu->random_seed);
 
+    /* Outer vCPU loop */
     do {
         qemu_process_cpu_events(cpu);
         bql_unlock();
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index d2276d8513e..d8fc7be707f 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -172,6 +172,7 @@ static void *hvf_cpu_thread_fn(void *arg)
     cpu_thread_signal_created(cpu);
     qemu_guest_random_seed_thread_part2(cpu->random_seed);
 
+    /* Outer vCPU loop */
     do {
         qemu_process_cpu_events(cpu);
         if (cpu_can_run(cpu)) {
diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index c8e7aa38709..73ff93aab67 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -47,6 +47,7 @@ static void *kvm_vcpu_thread_fn(void *arg)
     cpu_thread_signal_created(cpu);
     qemu_guest_random_seed_thread_part2(cpu->random_seed);
 
+    /* Outer vCPU loop */
     do {
         qemu_process_cpu_events(cpu);
 
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 83cbd120a84..b74c7f96866 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3438,6 +3438,7 @@ int kvm_cpu_exec(CPUState *cpu)
     bql_unlock();
     cpu_exec_start(cpu);
 
+    /* Inner vCPU loop */
     do {
         MemTxAttrs attrs;
 
diff --git a/accel/mshv/mshv-all.c b/accel/mshv/mshv-all.c
index 72721d0f0de..af172a8ee34 100644
--- a/accel/mshv/mshv-all.c
+++ b/accel/mshv/mshv-all.c
@@ -616,6 +616,7 @@ static int mshv_cpu_exec(CPUState *cpu)
     bql_unlock();
     cpu_exec_start(cpu);
 
+    /* Inner vCPU loop */
     do {
         if (cpu->vcpu_dirty) {
             ret = mshv_arch_store_vcpu_state(cpu);
@@ -705,6 +706,7 @@ static void *mshv_vcpu_thread(void *arg)
     cpu_thread_signal_created(cpu);
     qemu_guest_random_seed_thread_part2(cpu->random_seed);
 
+    /* Outer vCPU loop */
     do {
         qemu_process_cpu_events(cpu);
         if (cpu_can_run(cpu)) {
diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttcg.c
index 69560fdb9d8..e33e35dab3d 100644
--- a/accel/tcg/tcg-accel-ops-mttcg.c
+++ b/accel/tcg/tcg-accel-ops-mttcg.c
@@ -86,6 +86,7 @@ static void *mttcg_cpu_thread_fn(void *arg)
     cpu_thread_signal_created(cpu);
     qemu_guest_random_seed_thread_part2(cpu->random_seed);
 
+    /* Outer vCPU loop */
     do {
         qemu_process_cpu_events(cpu);
 
diff --git a/accel/whpx/whpx-accel-ops.c b/accel/whpx/whpx-accel-ops.c
index ca5a119521a..535667061b3 100644
--- a/accel/whpx/whpx-accel-ops.c
+++ b/accel/whpx/whpx-accel-ops.c
@@ -42,6 +42,7 @@ static void *whpx_cpu_thread_fn(void *arg)
     cpu_thread_signal_created(cpu);
     qemu_guest_random_seed_thread_part2(cpu->random_seed);
 
+    /* Outer vCPU loop */
     do {
         qemu_process_cpu_events(cpu);
 
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index da3ec521fc7..3eeb9f70de4 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2600,6 +2600,7 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
 
     flush_cpu_state(cpu);
 
+    /* Inner vCPU loop */
     do {
         if (!(cpu->singlestep_flags & SSTEP_NOIRQ) &&
             hvf_inject_interrupts(cpu)) {
diff --git a/target/arm/whpx/whpx-all.c b/target/arm/whpx/whpx-all.c
index 00a5de8cdc1..5e4c25bb7d5 100644
--- a/target/arm/whpx/whpx-all.c
+++ b/target/arm/whpx/whpx-all.c
@@ -407,9 +407,9 @@ int whpx_vcpu_run(CPUState *cpu)
     }
 
     bql_unlock();
-
-
     cpu_exec_start(cpu);
+
+    /* Inner vCPU loop */
     do {
         bool advance_pc = false;
         if (cpu->vcpu_dirty) {
@@ -495,8 +495,8 @@ int whpx_vcpu_run(CPUState *cpu)
     } while (!ret);
 
     cpu_exec_end(cpu);
-
     bql_lock();
+
     current_cpu = cpu;
 
     if (--whpx->running_cpus == 0) {
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 150598418e2..0ffa3658dc5 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -1009,6 +1009,7 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
         return EXCP_HLT;
     }
 
+    /* Inner vCPU loop */
     do {
         if (cpu->vcpu_dirty) {
             hvf_arch_put_registers(cpu);
diff --git a/target/i386/nvmm/nvmm-accel-ops.c b/target/i386/nvmm/nvmm-accel-ops.c
index dd5d5428b1c..da28fbe3de8 100644
--- a/target/i386/nvmm/nvmm-accel-ops.c
+++ b/target/i386/nvmm/nvmm-accel-ops.c
@@ -41,6 +41,7 @@ static void *qemu_nvmm_cpu_thread_fn(void *arg)
     cpu_thread_signal_created(cpu);
     qemu_guest_random_seed_thread_part2(cpu->random_seed);
 
+    /* Outer vCPU loop */
     do {
         qemu_process_cpu_events(cpu);
 
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 634d5428219..b4f499905a7 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -2251,6 +2251,7 @@ int whpx_vcpu_run(CPUState *cpu)
         cpu_exec_start(cpu);
     }
 
+    /* Inner vCPU loop */
     do {
         if (cpu->vcpu_dirty) {
             whpx_set_registers(cpu, WHPX_LEVEL_RUNTIME_STATE);
-- 
2.53.0


