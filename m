Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A58C98302
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 17:16:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9QVt-0003hq-VM; Wed, 23 Sep 2026 13:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QVo-0003av-14
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:12:04 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QVm-00014e-3Y
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:12:03 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NGU6Jc3281127
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EgqFffSwbMUDF9Wxjg2wykGybIoYKV1tdGf6snNqpXM=; b=bZbj92kfUm1Br0LZ
 GBlhqD2VL9omokwwE1mQWYyVx8h6AaKWVrq0/SwGnNG/jXqubxLQ4P8OaTRc9J8t
 YI5O3DBRdic32wWrzkZ/Vse35d8Hx6XqcChRZkxJ3BZsVm+wuSlNkMEcND07kx7u
 yc+aqaFUu8RWCs4vs+1OHBe3J8dXk+TdH0y51tauYdk0yLJG3MHJtvSLJW0uw0Wx
 pPTDyKzG0EBaOHaF/8L5XAf6dgvoZfaSIgB8pwRBsEW0U90/HraODnjdcZppoJtI
 XocGZX8NEn4qM+vNX4JX0IeSyHZ5TJSdkIQ4+WuIIGMXgts+UnyIazphJ7lTZfh2
 X70tew==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqju5h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:11:50 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-78f2fe53829so1227324137.2
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 10:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790183509; x=1790788309; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=EgqFffSwbMUDF9Wxjg2wykGybIoYKV1tdGf6snNqpXM=;
 b=Z4cAvWcZ5bqIkN4XmHIJaTasEHDQEU8CwmwXylNxbhh9ADLimAcY2LK0DccYEsKFd1
 qv6DNf322FCTR3mm3GUZkOGmZjcZEqfuIieF22gEOuDbQcoAMfLJ1wJJ0AhS05O7xlbV
 MzK+YzFf86Pu35J+PKY+9FhrTzyU6j3t0Y8gy9vSClIiyepIWF4gpuI3kY8uYEtWuswT
 PWT2ypD4OyezrLLE6HvyQfymazKJ37NUQmAZHv/QiufU9TaAoYlTdQIJmQkL66LQB/ig
 QK5WouSNYICrOUJWO7SRNVNoXmLE8EKkvZj8oxe4/69vnxXHzmAAzjgn0Ihv9TBQA742
 NqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183509; x=1790788309;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=EgqFffSwbMUDF9Wxjg2wykGybIoYKV1tdGf6snNqpXM=;
 b=VcTumjjthXiweyIHC22mtn21K8/tt7cLY26gj93Rfb7sW3zK2/MejMT3L6Y7D8gKCR
 eJ93e1oBKqMLmL5diLwXWpzBdQrGHhMXmoBVMYK8O0TjYEiqRHdgxhvdbDCFOCgcWVKO
 WvhaWpE2tsJRwa7OdundU3a5enwH2RfhDq5dG4F4GaceKu+Zsrz5QwZCsPclz4PyqeQZ
 6CCZGliV6VWWRBaAs/jmGN/ZC/3tMWjdH85Sb1/zyROi7+PEELLhYXLlQHNFWJMWutp2
 mylMOdSE8PiN+hsrrJ+CMu4Vs+EGwFH1W//Z5Z8NIQ9NHVLOWwhNNsaszQuwt7mfQBUH
 Xagg==
X-Forwarded-Encrypted: i=1;
 AKwUvBx54fP5fjNlilG/ECpGAbihKpFys3nOwEPDC7LJV7b0kpwwkucj0612Xe7WxCCAqEzEp0pFcRNQP/t9@nongnu.org
X-Gm-Message-State: AFuF++lKh7yluYd3v/gCDr/SZLO4//5wUT5OTYTgjcqFjymVHAm9Ij37
 AhBJAN0whXhL3j5g39OKL5FeHXT9+MU+mDKTyY2YAwqG2a5GS+fkZP19NJG0NMlNEHKY/yHMNu0
 nBd0iXuMjmi0OQ0IqTr01DivOsYVlOb6wsKg7+LspSBC9CyRaHWX0Kv1SlQ==
X-Gm-Gg: AYBFou1lOL1qI+7Lvte43RTW8WLOCPRM8hZ4wITGLaE9omYtD9L9PERdHVnFAhrd4Nm
 +cCdMNrIzS8ISEuasVjvmA1hR4YCrDXE4nE1R+4xOZAEOS4INuJrbgE3run+WWN2ShgB5vkYYcc
 fCiZuTBnPpxnUHef6C86S075KU65P0OJU/ksKHSAEUqMfWI1vJoKXuW/vsq2mIFfVl1rJauN9og
 eGHzSM1acXYirwK5o+aUFXQMIAj2umt0sd9fksCL5LT/hCW+ciT/jeGofNBHLJqEuv8jPwyM+ji
 DzKgps+KMCD96sPR4s9gosEeN1kty5zDxJeIppiw8AikBHHbDCa8wYtE8KVohsMKu7I+xZBz2HS
 Y/9lFO0mx0PAvKPbyCF+89tkN+Jhr//reoYV3ZX7z
X-Received: by 2002:a05:6102:3712:b0:7a1:f7e2:aae1 with SMTP id
 ada2fe7eead31-7ac1d0ca801mr2965689137.19.1790183509510; 
 Wed, 23 Sep 2026 10:11:49 -0700 (PDT)
X-Received: by 2002:a05:6102:3712:b0:7a1:f7e2:aae1 with SMTP id
 ada2fe7eead31-7ac1d0ca801mr2965665137.19.1790183509071; 
 Wed, 23 Sep 2026 10:11:49 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48868889337sm8502085f8f.34.2026.09.23.10.11.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 10:11:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>,
 Jason Herne <jjherne@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 04/21] target/s390x: Use S390CpuState for CPU state APIs
Date: Wed, 23 Sep 2026 19:10:58 +0200
Message-ID: <20260923171116.31276-5-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923171116.31276-1-philmd@oss.qualcomm.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FGus8fW3GMoEX9tnIm9cDpY78Ix1tiQJ
X-Proofpoint-ORIG-GUID: FGus8fW3GMoEX9tnIm9cDpY78Ix1tiQJ
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab40856 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=h1LczH6ptyU4K0ekaGAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX2Lw2MlmS53az
 iOZGheWItz4PLt8SjxJwI40NsuUt3QXIZXhREYOJ0LiaejcRV+y8kPRx5VrliuUyLjHjGRVd5He
 zVhtdlAs8fTdJQtGVV18gcfq/HgAC1E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX4v5gLkbunMSM
 0IMKNeeBEOS9Trj/xyOOfpgqHO99B+ZGCCB3fMJQnXpupQFme6WpqoQJ+PHqZgg4BS/DUEECF/N
 /dcXk+9W9MIfonPcD8cRiKaTUWT8KDrmg6CyK+PtUjZX5MOkXdrKRAQCsIsxnU3T0dPH72oGIyT
 cYIJy0AG+VxhyoAL2t5x/hKBPE3LdA8lBkHN4B7wtckJTr8i2EEOOuEqBT9EAOt0mTmB4FuIB99
 FUlrwD+v6fqoxbtWFqkrd3itQ3pNbZz2bmlqk4av7JBiS34w59Qdx+cbZgVQ09/ANmzBunSRrAG
 TlsQjQ3WqXBe4FQJwMH4vv65+5mYUrZMvw7sQPtc1q+kzLW2MPhtmJ/l3jFUMXDv27gXSFndwLW
 PU6CXiHWA/b8fZeDLjrdbckB7W0HJQgqTMNgRe989B6C5pY96ug9WLpSADkEpf3gskgGyAiz0z9
 JnPstnKvUNrd9wB/UDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
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

Use the QAPI S390CpuState enum for CPU state accessors instead
of uint8_t. Handle state checks with switch statements.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/s390x/cpu.h           |  6 +++---
 target/s390x/kvm/kvm_s390x.h |  2 +-
 hw/intc/s390_flic.c          |  7 +++++--
 target/s390x/cpu-system.c    | 18 ++++++++++++------
 target/s390x/kvm/kvm.c       |  2 +-
 target/s390x/kvm/stubs.c     |  2 +-
 target/s390x/sigp.c          |  6 +++++-
 7 files changed, 28 insertions(+), 15 deletions(-)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 2d1dcc7045c..bf9f6ed1de2 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -847,13 +847,13 @@ void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg);
 int s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t sch_id,
                                 int vq, bool assign);
 #ifndef CONFIG_USER_ONLY
-void s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu);
+void s390_cpu_set_state(S390CpuState cpu_state, S390CPU *cpu);
 #else
-static inline void s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu)
+static inline void s390_cpu_set_state(S390CpuState cpu_state, S390CPU *cpu)
 {
 }
 #endif /* CONFIG_USER_ONLY */
-static inline uint8_t s390_cpu_get_state(const S390CPU *cpu)
+static inline S390CpuState s390_cpu_get_state(const S390CPU *cpu)
 {
     return cpu->env.cpu_state;
 }
diff --git a/target/s390x/kvm/kvm_s390x.h b/target/s390x/kvm/kvm_s390x.h
index 3c4fa0489cf..b1ff66f04e3 100644
--- a/target/s390x/kvm/kvm_s390x.h
+++ b/target/s390x/kvm/kvm_s390x.h
@@ -22,7 +22,7 @@ int kvm_s390_mem_op(S390CPU *cpu, vaddr addr, uint8_t ar, void *hostbuf,
 int kvm_s390_mem_op_pv(S390CPU *cpu, vaddr addr, void *hostbuf, int len,
                        bool is_write);
 void kvm_s390_program_interrupt(S390CPU *cpu, uint16_t code);
-int kvm_s390_set_cpu_state(S390CPU *cpu, uint8_t cpu_state);
+int kvm_s390_set_cpu_state(S390CPU *cpu, S390CpuState cpu_state);
 void kvm_s390_vcpu_interrupt_pre_save(S390CPU *cpu);
 int kvm_s390_vcpu_interrupt_post_load(S390CPU *cpu);
 int kvm_s390_get_hpage(void);
diff --git a/hw/intc/s390_flic.c b/hw/intc/s390_flic.c
index 57fd4b2b81c..b5256b3ba88 100644
--- a/hw/intc/s390_flic.c
+++ b/hw/intc/s390_flic.c
@@ -193,8 +193,11 @@ static void qemu_s390_flic_notify(uint32_t type)
         cpu_set_interrupt(cs, CPU_INTERRUPT_HARD);
 
         /* ignore CPUs that are not sleeping */
-        if (s390_cpu_get_state(cpu) != S390_CPU_STATE_OPERATING &&
-            s390_cpu_get_state(cpu) != S390_CPU_STATE_LOAD) {
+        switch (s390_cpu_get_state(cpu)) {
+        case S390_CPU_STATE_LOAD:
+        case S390_CPU_STATE_OPERATING:
+            break;
+        default:
             continue;
         }
 
diff --git a/target/s390x/cpu-system.c b/target/s390x/cpu-system.c
index 52561fffa3a..fffac09f241 100644
--- a/target/s390x/cpu-system.c
+++ b/target/s390x/cpu-system.c
@@ -44,8 +44,11 @@ bool s390_cpu_has_work(CPUState *cs)
     S390CPU *cpu = S390_CPU(cs);
 
     /* STOPPED cpus can never wake up */
-    if (s390_cpu_get_state(cpu) != S390_CPU_STATE_LOAD &&
-        s390_cpu_get_state(cpu) != S390_CPU_STATE_OPERATING) {
+    switch (s390_cpu_get_state(cpu)) {
+    case S390_CPU_STATE_LOAD:
+    case S390_CPU_STATE_OPERATING:
+        break;
+    default:
         return false;
     }
 
@@ -202,12 +205,15 @@ unsigned s390_count_running_cpus(void)
     int nr_running = 0;
 
     CPU_FOREACH(cpu) {
-        uint8_t state = S390_CPU(cpu)->env.cpu_state;
-        if (state == S390_CPU_STATE_OPERATING ||
-            state == S390_CPU_STATE_LOAD) {
+        switch (s390_cpu_get_state(S390_CPU(cpu))) {
+        case S390_CPU_STATE_LOAD:
+        case S390_CPU_STATE_OPERATING:
             if (!disabled_wait(cpu)) {
                 nr_running++;
             }
+            break;
+        default:
+            break;
         }
     }
 
@@ -236,7 +242,7 @@ void s390_cpu_unhalt(S390CPU *cpu)
     }
 }
 
-void s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu)
+void s390_cpu_set_state(S390CpuState cpu_state, S390CPU *cpu)
  {
     trace_cpu_set_state(CPU(cpu)->cpu_index, cpu_state);
 
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 6622886032e..dc67e848864 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -2007,7 +2007,7 @@ int kvm_s390_get_ri(void)
     return cap_ri;
 }
 
-int kvm_s390_set_cpu_state(S390CPU *cpu, uint8_t cpu_state)
+int kvm_s390_set_cpu_state(S390CPU *cpu, S390CpuState cpu_state)
 {
     struct kvm_mp_state mp_state = {};
     int ret;
diff --git a/target/s390x/kvm/stubs.c b/target/s390x/kvm/stubs.c
index ebf3c83994d..c5ec7d3f1d3 100644
--- a/target/s390x/kvm/stubs.c
+++ b/target/s390x/kvm/stubs.c
@@ -128,7 +128,7 @@ int kvm_s390_mem_op_pv(S390CPU *cpu, vaddr addr, void *hostbuf, int len,
     g_assert_not_reached();
 }
 
-int kvm_s390_set_cpu_state(S390CPU *cpu, uint8_t cpu_state)
+int kvm_s390_set_cpu_state(S390CPU *cpu, S390CpuState cpu_state)
 {
     g_assert_not_reached();
 }
diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
index 1801b8caa6e..09004e98a21 100644
--- a/target/s390x/sigp.c
+++ b/target/s390x/sigp.c
@@ -39,7 +39,7 @@ static void set_sigp_status(SigpInfo *si, uint64_t status)
 
 static void sigp_sense(S390CPU *dst_cpu, SigpInfo *si)
 {
-    uint8_t state = s390_cpu_get_state(dst_cpu);
+    S390CpuState state = s390_cpu_get_state(dst_cpu);
     bool ext_call = dst_cpu->env.pending_int & INTERRUPT_EXTERNAL_CALL;
     uint64_t status = 0;
 
@@ -221,6 +221,8 @@ static void sigp_stop_and_store_status(CPUState *cs, run_on_cpu_data arg)
         cpu_synchronize_state(cs);
         s390_store_status(cpu, S390_STORE_STATUS_DEF_ADDR, true);
         break;
+    default:
+        break;
     }
     si->cc = SIGP_CC_ORDER_CODE_ACCEPTED;
 }
@@ -362,6 +364,8 @@ static void sigp_restart(CPUState *cs, run_on_cpu_data arg)
     case S390_CPU_STATE_OPERATING:
         cpu_inject_restart(cpu);
         break;
+    default:
+        break;
     }
     si->cc = SIGP_CC_ORDER_CODE_ACCEPTED;
 }
-- 
2.53.0


