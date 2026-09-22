Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86839C982FA
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 16:52:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x93gu-0003f7-Df; Tue, 22 Sep 2026 12:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93gt-0003eC-4d
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 12:49:59 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93gp-0002EE-U8
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 12:49:58 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68MG5sqf884576
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 16:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lESZqux2tT8zaKL4sOF2SXzC6djv6bY/JcFrRBVPU1Q=; b=UxntCIoChXyNmnvh
 NRfBjwDIt8pLkxx5F8hjl3dsEmmo0QxZKbnm/oUwOgiAohfteDu0VqmgyLmmYn7v
 H7vf0ihw5zh49XlPQj+A4G2g7P9VuUQhNPvv4okOOEZ8Iux90gkocqqliHrw8rnS
 PA46Fv7pQPz51YXn445Q5wpWSvMSimTwzYZ1cjgqdpTDgi26mUTwKoKXqCSJpznE
 urx2dcc5Z2KSzCb9FIJTPkDC0bxLpKVT282BnLhMgT9mh6zcr5yxCFkG/ki7kkcF
 LIzI16Zj9A0lP0NUR1vKO7nxt52ma2FB7Ln7G+0Zigdz8vdv9j+eO3980vSZR9F/
 5fz1Dg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guvw7g6pd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 16:49:54 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-97cb18cfa04so28934241.0
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 09:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790095794; x=1790700594; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=lESZqux2tT8zaKL4sOF2SXzC6djv6bY/JcFrRBVPU1Q=;
 b=Hau8qiP+nACFTSGaiZA1P6/5SHFF3PxuTjArOiRo/iZBDyOZdsbE8c8n3X5Z6QfGIh
 Tex0JvPSPS/d3PhAmE1H7PHdTqlbACk3IMshOVdfgKo8gPayaDqhpGzNhfHuTr3FZXLW
 /tUSm/wr/gGkppOjPxwZkbW4kYRVuZwKbxtunWKzQ2GN/wuf3trHhMvq0pStOpEwBY3B
 CTPigoaoWds2mBSU2hAeIvoGYEGnXjfIyEk4uJjpp6/MuuClogMUSRkqNTsvyRxGnfrB
 Ln1KR+NILUcjxJ48FKBe5lxQDiOaG+rNlWd6FZOUIFwDInu5cl9EYUQ33yA9plkW6vJh
 qZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790095794; x=1790700594;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=lESZqux2tT8zaKL4sOF2SXzC6djv6bY/JcFrRBVPU1Q=;
 b=g7aCXeGdd8pv628lLcnmAOSp4FNRpeWB+dk0qW8QZbGfaCtlV8V0F+E6Vll0WagRUe
 qfgmsEB9QT88Lfe7FoaYRTG5aes33KXGfj9DPElkVSS+G/V6/CZJ7C6gOaTqbOQS/JE1
 p/h5cAEyeOHNqtRdhbFGbkduJTOVTRslLYfWDtEsy4UKBFgK9AQIRJPIPiWPb9p0y8NS
 OhxhnGcHmc4tKEPslppIGc8s77dMmdFGtKW68orNfBGptKTQnuqxBgGRq8XXi9DsZvjD
 fx6RnQ+50mJDq59n+1aEMU68YwNQkPL9FME2wziNS4DtFn6a8GpG4V/wG5dccTOW7vva
 ndKg==
X-Gm-Message-State: AFuF++kcRrtm3Y1eoAwyNqPm4Y3ZB6n7P3sU0mXGa77UtkCr2X1eDr7S
 tyrDac7s1bwjY1DlTMzlYTqGJyD/e/V907Rija/NputiXx0gXjhT8cRL7W7D0R/Q8FRx7RSIZXq
 8xtbm9F06HM9UW9g66+kxPHZJ45xmlFLwUIu6p73ayKh+eB0jcW2zcu0Exg==
X-Gm-Gg: AYBFou1U4HKp5lwXKngk5CtY5Zaq7mCMtfgqydr9QyfJraqnAENyT6Ayh4iZ+vIKxsr
 k6KNhZEeTnU5umZtnHqrq3X/8FZDIWDGPxsASQ7hljPL5iqfKohStDRS2juVEJgLA2e92/LX327
 fhPgTz3CVvMFO33lJ2Itazfla2hMEUNOC1QYDsJyI6dUqIuUvTv7uhF11clJhoGuBBe2uvust9m
 gckwpvAPgn5/gFZR6Vs4okAFZSlJCoK/oUhrDT/e9kS4KZ9SNUmnPwDOqq+0ddBL4y2zBsRu3zT
 SVVDv2ag9pIYefC3HKAwLdYL74eHWeNyhow9gHE1dOWdl2a/pE4vUvXpi4fUcm9xLI1Vz6zEb+J
 SFzX9KwNawKqrn128bLDeqZfVxY0AlekQyrLVfrMA
X-Received: by 2002:a05:6102:149a:b0:7a7:ce1f:6b93 with SMTP id
 ada2fe7eead31-7a7ce1f80e8mr7184930137.3.1790095793783; 
 Tue, 22 Sep 2026 09:49:53 -0700 (PDT)
X-Received: by 2002:a05:6102:149a:b0:7a7:ce1f:6b93 with SMTP id
 ada2fe7eead31-7a7ce1f80e8mr7184873137.3.1790095793383; 
 Tue, 22 Sep 2026 09:49:53 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fdaa9dbd6sm69580415e9.2.2026.09.22.09.49.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Sep 2026 09:49:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Cornelia Huck <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: [PATCH v2 02/17] target/s390x: Use s390_cpu_get_state() consistently
Date: Tue, 22 Sep 2026 18:49:20 +0200
Message-ID: <20260922164936.15189-3-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922164936.15189-1-philmd@oss.qualcomm.com>
References: <20260922164936.15189-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfXyEJKuuydzjJM
 faM0cT8JuCTFoMtHCKVSPeNAeTpgOcbIYwW10TRUcrdb7PN8vkfVlp3hZakyly+uePUCGer36JA
 TnDcXl/amrbOWM1yF99spvsCNeW9q2k=
X-Authority-Analysis: v=2.4 cv=ZYqIpcVA c=1 sm=1 tr=0 ts=6ab2b1b2 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=z94vmTcaOVfBjqTZL9kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: B6-eh3c11eppORse0tadz807r5JyvFm9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfX6dABgGrwso6v
 atClmPqX9gLeM23ltbyahmJmIbTrVA0leQRsA18dqSjSlmebapb+RAC97rPlOgg8OUwnEFgxKbk
 BXlwAv94r+bHnoRJEOUwGU/KumkrKA5FsCc3C8Y6bBi1OJ8J5h2trSt0HyXCJfu8y37GqEkBC0l
 0EDMGM6SXxnG+walNbcnIz7pwLViwVIV2J62D8P/lToA4QgSZu5DOFyMF/fntn4PykAQMYUavks
 jQP9vPOWmIPiT4q+DJW25YHNNfwFsVfPI34PPsJgqsthu8os8Gc2bruQTSUuX+BQgBWndYzZR/0
 rclkZ4QW9DxelkdGkg1FAFb9l/D5Scjb29XKiyN5j9rzwqiQ5b7rYnuo6cbJuALKAdWGM4dhJHI
 FQ9qF5kMqHiHwO3sST7ach4tN4aFMSmOqTeTS4xumtQmTsZoZ6IYwqQb3AqzeE1vDVi57ILH/bm
 ARlFu2sOJdkXxvOb0Wg==
X-Proofpoint-GUID: B6-eh3c11eppORse0tadz807r5JyvFm9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220246
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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


