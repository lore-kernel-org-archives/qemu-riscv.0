Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6596C624CF
	for <qemu-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 09:57:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1LCv-0004Gr-0Z; Tue, 01 Sep 2026 05:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LCs-0004DG-Ua
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 05:55:06 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LCp-0007n8-7P
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 05:55:06 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 681793An705507
 for <qemu-riscv@nongnu.org>; Tue, 1 Sep 2026 09:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bCUerKU8i6MSUxweaHPVhCPYkRB41oDv8MTEbo0FvN0=; b=IoKRzIWQlzAYLFvF
 J5k8+NZLGaeFP+PvCKldGjLZs+UZbpBLIIPdEHIggM1MpZusn/7EMzT0ZyIXkqu3
 JZ219cgqEOECdPxTrAqwb21LH9A7JpuS2jvfSB3E4f9HoFP3yQeHawcDCS0Ejr3L
 eDWAdmkWaKhMduscoisTkZgloGIgJNOXW2C1EYpDk4v6LF61N5Inpz0UuqazLn0Z
 x55Gf7XWs+lLK6VVKsZu5zpujXj9DyVEdnsADFy0Qs3CDL+rpWrZGjngqU9C8+Bi
 OVBL1IuXWF28zUqmcw2ygPjzLablMaoO7LSz0mbfNpqh9jeQrRTTwU9r8ff48KVt
 yh+Tyg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsh6ea-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2026 09:55:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-939281526e1so72003585a.0
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2026 02:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788256501; x=1788861301; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=bCUerKU8i6MSUxweaHPVhCPYkRB41oDv8MTEbo0FvN0=;
 b=SlnsbRZ4oLaCb+tWRJZPZVR2Fr+wEFE9HcrsehhKnpOL2imgL9B1Cgs3EMWzH1SzWl
 uSNZrsA4UUAjeFi9yoQ6z+9kBD8CYBeWL0tNrPDH/CdkdizWfx8fqkFSGr7PXEXiGAeR
 WMkKQB5BRqJIqB1iavDG2TmNrxgPwWMvs7b47uDrjwF92A3INribzMpiY5GFvcdpdY+w
 zLLeeyQ9E1S2Cf3dh8B3pv4bWVN9pXAAKy8UIxG35e/oqUhdxQyPj2mzRDigFehO3M+O
 KEvRS0RwGMl2bbdbBOSnCfVuzHY3N6fxVszGmQ0Zo7nAADSGLVoMrHyqKK/ytcWzS73o
 R9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788256501; x=1788861301;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=bCUerKU8i6MSUxweaHPVhCPYkRB41oDv8MTEbo0FvN0=;
 b=haSvBYO4trPC6a81H6sHNFv9IeWODgo60JCEmbQxDM6zMubuzdosMG+y5MbFhMXash
 bDYJGtpT8/PlqmNrXVXGguTPBtOeTlunB1eGqMOSbyVsD2H1hVi9Zg9T2kUAQHG61ayA
 sjSbLpw4krTpOhH3ZiDaaBb/JAAP3XDr2r7An4iKaBj7SbOomLeUCIUpHg627jwCf20B
 CYn6y3OTFCwMBSSZpUkWlM+xyWl7P2v7wHTV8o0ZLWKDEYuc4fROU3eS6h+Mm7hEFSJc
 +YpHe4aUp02cK3+v8lHUyDEUa8t0mv4ML9/PpjxGsvZi3Y5P5xU5iPS9Pkq4VnIoRvi+
 ZMCQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqV6v9LxVeT0PcY5zrQWubJ+Ti0m1UYNIZzRUXQ9FpMISMpYt4WFrusunJDPaY8ORNsIxMjp/vDKElM@nongnu.org
X-Gm-Message-State: AFuF++mP2PJCvDoy71ukXmGxVVlDEIVrKJV4S0fROsuN35oJXh4nXZTC
 7Lty7c9ynSUzvrPm2FWGsyxg31lCpdfY0kjqPEbt3bpGLWd07TmuhpR1t9aJhAPDTDKj5Xx7ojT
 IaGw102eQanoYsyudwoTDgMRG7PZkkJ2g8PWTnZzNBiZTeSdocykHICZ4mA==
X-Gm-Gg: AR+sD12SAooohbnqE1COi29rVMQAj4j1pkwUxTPHepKpN7cPrfMhuT5w5oeOG8HJEWR
 hQBx7V9v4oGqDkMVbDWy1w2DHh0QQjV1W8pzIm3kFrEMI54eADuCcS+YYS8cnPKAbA23wDxhPNr
 MKgVXQPHu/33YsX+tv/94W3cNNQmEOo1SUiDFZpc8Oytc89B5iJW5/s7THpvQQG3aHaYT3GP/tK
 kCRuHcoYS8Q8TrEqrixQ8ob+9fGuP3EPf///tdM8e77joOMrVVzY90DUdW1bnByHTAE0ki/sazX
 nwpTDXU8JTNvYDOs5LqpIifvmWH/VuYb9U0t5pxNUY9muYiF6MfkctJDHxY0HuAdit9NHEMYjYB
 AvjK3sxzcSWLyHgPVvUGath64O63vHcUtv0iBVmc6
X-Received: by 2002:a05:620a:2812:b0:937:7e90:ecc with SMTP id
 af79cd13be357-939138ae5c0mr3843635185a.25.1788256500497; 
 Tue, 01 Sep 2026 02:55:00 -0700 (PDT)
X-Received: by 2002:a05:620a:2812:b0:937:7e90:ecc with SMTP id
 af79cd13be357-939138ae5c0mr3843630085a.25.1788256499754; 
 Tue, 01 Sep 2026 02:54:59 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48442d37ce3sm3754006f8f.8.2026.09.01.02.54.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Sep 2026 02:54:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Helge Deller <deller@gmx.de>, Song Gao <17746591750@163.com>,
 Bibo Mao <maobibo@loongson.cn>, Xianglai Li <lixianglai@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Glenn Miles <milesg@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Cornelia Huck <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v5 20/21] cpus: Constify @cpu in SysemuCPUOps::has_work()
 handler
Date: Tue,  1 Sep 2026 11:52:26 +0200
Message-ID: <20260901095229.72018-21-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901095229.72018-1-philmd@oss.qualcomm.com>
References: <20260901095229.72018-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX3Naznap1WDkC
 lgy66w9i4rvRO4ykMAEl3wcxwtDVTPbsKVeOoaqYG9CQR+HjXuh4k+m4r9uT96vlJIY/SYT3JKJ
 44PPYV9h9lSIQi9xGos5xkWFZMuH5hQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfXzCxf90wkU7Jk
 IgjwZfCFocnoWGDZHmmi8vw3G3mgXGunFyRA5aWpwSfYqU/3sEN7TZvSTdKzcKGtShc7O6dHMrH
 CTlHsBrZuZ4oBpQ8BI/Rmk6aSA9Q740mii9LSMM/yfSNgRjqYO2dlukzr5Gi3GlEvvmdalzws73
 Vbe06scmVEiPmMrb88CiydmRVmnVEqJQaV6PJ/I9+uVjnrMtcMg5vBF1Ydja+sJR/h/7u/9GtLO
 W7sRZg0R7zW2V/u5Y1pSux87Kgl8VUUjxVT/8meybiQQy7V9cnuTl0MbCVlIH5Y0alJXD1vyf7h
 +rhukfDKxCYVj/Hk58B/EaVvvG8bm6Cbxx8iIgk3pmQ0ie6b0lPLWlASTuzPWfXlR+x4h72l8f2
 /ZlBt+ewr6hD+3Di0d8F/9IjW+5fCWDEzBX7sq/AgO7LwVZVo0FR43XmN+Cli7y1qLoKsYrfEsm
 4arbjwijMdtfpJ9Bdzw==
X-Proofpoint-GUID: s3lhyENF2l6MBK6PTFCIkEIPDHhHX-9w
X-Proofpoint-ORIG-GUID: s3lhyENF2l6MBK6PTFCIkEIPDHhHX-9w
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96a0f5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=cM1bI5kxBi4gRGPUlTgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010087
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

All functions called by target has_work() handler take a const @cpu
argument. We can now fulfill the comment added in commit c2804566f6
("target/arm: do not clear halting reason in has_work helper"),
qualifying the handler const to denote its idempotency.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/sysemu-cpu-ops.h | 4 ++--
 target/alpha/cpu.c               | 2 +-
 target/arm/cpu.c                 | 4 ++--
 target/avr/cpu.c                 | 3 ++-
 target/hexagon/cpu.c             | 4 ++--
 target/hppa/cpu.c                | 2 +-
 target/i386/cpu.c                | 2 +-
 target/loongarch/cpu.c           | 2 +-
 target/m68k/cpu.c                | 2 +-
 target/microblaze/cpu.c          | 2 +-
 target/mips/cpu.c                | 4 ++--
 target/or1k/cpu.c                | 2 +-
 target/ppc/cpu_init.c            | 2 +-
 target/riscv/cpu.c               | 5 ++---
 target/rx/cpu.c                  | 2 +-
 target/s390x/cpu-system.c        | 4 ++--
 target/sh4/cpu.c                 | 2 +-
 target/sparc/cpu.c               | 2 +-
 target/tricore/cpu.c             | 2 +-
 target/xtensa/cpu.c              | 4 ++--
 20 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index 9a45596169a..095bdcd997a 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -19,10 +19,10 @@ typedef struct SysemuCPUOps {
     /**
      * @has_work: Callback for checking if there is work to do.
      *
-     * This function should be idempotent (i.e. not change state) as
+     * This function is idempotent (i.e. not change state) as
      * it will likely be queried multiple times before a CPU resumes.
      */
-    bool (*has_work)(CPUState *cpu); /* MANDATORY NON-NULL */
+    bool (*has_work)(const CPUState *cpu); /* MANDATORY NON-NULL */
     /**
      * @get_memory_mapping: Callback for obtaining the memory mappings.
      */
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 7d1d036e1d3..21d4f8ac23b 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -77,7 +77,7 @@ static void alpha_restore_state_to_opc(CPUState *cs,
 }
 
 #ifndef CONFIG_USER_ONLY
-static bool alpha_cpu_has_work(CPUState *cs)
+static bool alpha_cpu_has_work(const CPUState *cs)
 {
     /* Here we are checking to see if the CPU should wake up from HALT.
        We will have gotten into this state only for WTINT from PALmode.  */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9761bb173c1..ba66359d410 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -141,9 +141,9 @@ int arm_cpu_mmu_index(CPUState *cs, bool ifetch)
  * CPU_INTERRUPT_*NMI anyway. So we might as well accept NMI here
  * unconditionally.
  */
-static bool arm_cpu_has_work(CPUState *cs)
+static bool arm_cpu_has_work(const CPUState *cs)
 {
-    ARMCPU *cpu = ARM_CPU(cs);
+    const ARMCPU *cpu = ARM_CPU(cs);
 
     /*
      * Only another PSCI call can wake the CPU up in which case the
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index a01e6fa4751..a96bef46ff1 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -23,6 +23,7 @@
 #include "qemu/qemu-print.h"
 #include "exec/translation-block.h"
 #include "system/address-spaces.h"
+#include "hw/core/cpu.h"
 #include "cpu.h"
 #include "disas/dis-asm.h"
 #include "tcg/debug-assert.h"
@@ -43,7 +44,7 @@ static vaddr avr_cpu_get_pc(CPUState *cs)
     return cpu->env.pc_w * 2;
 }
 
-static bool avr_cpu_has_work(CPUState *cs)
+static bool avr_cpu_has_work(const CPUState *cs)
 {
     return cpu_test_interrupt(cs, CPU_INTERRUPT_HARD | CPU_INTERRUPT_RESET)
             && cpu_interrupts_enabled(cpu_env(cs));
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 4cc6bd67c28..868aef0cde4 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -364,9 +364,9 @@ bool hexagon_thread_is_enabled(const CPUHexagonState *env)
     return E_bit;
 }
 
-static bool hexagon_cpu_has_work(CPUState *cs)
+static bool hexagon_cpu_has_work(const CPUState *cs)
 {
-    CPUHexagonState *env = cpu_env(cs);
+    const CPUHexagonState *env = cpu_env(cs);
 
     return hexagon_thread_is_enabled(env) &&
         (cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_SWI
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 7b1309a7c38..dbf58466c24 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -134,7 +134,7 @@ static void hppa_restore_state_to_opc(CPUState *cs,
 }
 
 #ifndef CONFIG_USER_ONLY
-static bool hppa_cpu_has_work(CPUState *cs)
+static bool hppa_cpu_has_work(const CPUState *cs)
 {
     return cpu_test_interrupt(cs, CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 1fc02cf94e6..0606ac16664 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -10638,7 +10638,7 @@ int x86_cpu_pending_interrupt(const CPUState *cs, int interrupt_request)
     return 0;
 }
 
-static bool x86_cpu_has_work(CPUState *cs)
+static bool x86_cpu_has_work(const CPUState *cs)
 {
     return x86_cpu_pending_interrupt(cs, cs->interrupt_request) != 0;
 }
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 3b3cbde882f..3fc208e44f8 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -110,7 +110,7 @@ bool cpu_loongarch_hw_interrupts_pending(const CPULoongArchState *env)
 #endif
 
 #ifndef CONFIG_USER_ONLY
-static bool loongarch_cpu_has_work(CPUState *cs)
+static bool loongarch_cpu_has_work(const CPUState *cs)
 {
     bool has_work = false;
 
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 523694d8fbf..da3681fab1f 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -76,7 +76,7 @@ static void m68k_restore_state_to_opc(CPUState *cs,
 }
 
 #ifndef CONFIG_USER_ONLY
-static bool m68k_cpu_has_work(CPUState *cs)
+static bool m68k_cpu_has_work(const CPUState *cs)
 {
     return cpu_test_interrupt(cs, CPU_INTERRUPT_HARD);
 }
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 6013a8def8e..d1d2f0ec7e3 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -127,7 +127,7 @@ static void mb_restore_state_to_opc(CPUState *cs,
 }
 
 #ifndef CONFIG_USER_ONLY
-static bool mb_cpu_has_work(CPUState *cs)
+static bool mb_cpu_has_work(const CPUState *cs)
 {
     return cpu_test_interrupt(cs, CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index c069aa1c0b7..0f39f8fe0a5 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -134,9 +134,9 @@ static vaddr mips_cpu_get_pc(CPUState *cs)
 }
 
 #if !defined(CONFIG_USER_ONLY)
-static bool mips_cpu_has_work(CPUState *cs)
+static bool mips_cpu_has_work(const CPUState *cs)
 {
-    CPUMIPSState *env = cpu_env(cs);
+    const CPUMIPSState *env = cpu_env(cs);
     bool has_work = false;
 
     /*
diff --git a/target/or1k/cpu.c b/target/or1k/cpu.c
index 42d9351b6d7..10b13ae69cd 100644
--- a/target/or1k/cpu.c
+++ b/target/or1k/cpu.c
@@ -76,7 +76,7 @@ static void openrisc_restore_state_to_opc(CPUState *cs,
 }
 
 #ifndef CONFIG_USER_ONLY
-static bool openrisc_cpu_has_work(CPUState *cs)
+static bool openrisc_cpu_has_work(const CPUState *cs)
 {
     return cpu_test_interrupt(cs, CPU_INTERRUPT_HARD | CPU_INTERRUPT_TIMER);
 }
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index ef59c56f416..c72a7168a23 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7222,7 +7222,7 @@ static int ppc_cpu_mmu_index(CPUState *cs, bool ifetch)
 #endif /* CONFIG_TCG */
 
 #ifndef CONFIG_USER_ONLY
-static bool ppc_cpu_has_work(CPUState *cs)
+static bool ppc_cpu_has_work(const CPUState *cs)
 {
     return cpu_test_interrupt(cs, CPU_INTERRUPT_HARD);
 }
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6004da4ac33..5c16c52e010 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -953,10 +953,9 @@ int riscv_cpu_vsirq_pending(const CPURISCVState *env)
                                     (irqs | irqs_f_vs), env->hviprio);
 }
 
-static bool riscv_cpu_has_work(CPUState *cs)
+static bool riscv_cpu_has_work(const CPUState *cs)
 {
-    RISCVCPU *cpu = RISCV_CPU(cs);
-    CPURISCVState *env = &cpu->env;
+    const CPURISCVState *env = cpu_env(cs);
     /*
      * Definition of the WFI instruction requires it to ignore the privilege
      * mode and delegation registers, but respect individual enables
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 69946928995..dfa09a85bce 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -73,7 +73,7 @@ static void rx_restore_state_to_opc(CPUState *cs,
     cpu->env.pc = data[0];
 }
 
-static bool rx_cpu_has_work(CPUState *cs)
+static bool rx_cpu_has_work(const CPUState *cs)
 {
     return cpu_test_interrupt(cs, CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIR);
 }
diff --git a/target/s390x/cpu-system.c b/target/s390x/cpu-system.c
index 84faceb3338..3a0ff46e144 100644
--- a/target/s390x/cpu-system.c
+++ b/target/s390x/cpu-system.c
@@ -39,9 +39,9 @@
 #include "system/tcg.h"
 #include "hw/core/sysemu-cpu-ops.h"
 
-static bool s390_cpu_has_work(CPUState *cs)
+static bool s390_cpu_has_work(const CPUState *cs)
 {
-    S390CPU *cpu = S390_CPU(cs);
+    const S390CPU *cpu = S390_CPU(cs);
 
     /* STOPPED cpus can never wake up */
     if (s390_cpu_get_state(cpu) != S390_CPU_STATE_LOAD &&
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 55c73a1da35..b0ed356d0f7 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -107,7 +107,7 @@ static bool superh_io_recompile_replay_branch(CPUState *cs,
     return false;
 }
 
-static bool superh_cpu_has_work(CPUState *cs)
+static bool superh_cpu_has_work(const CPUState *cs)
 {
     return cpu_test_interrupt(cs, CPU_INTERRUPT_HARD);
 }
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 2baa5036871..8dd9b0d5ee3 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -783,7 +783,7 @@ static void sparc_restore_state_to_opc(CPUState *cs,
 }
 
 #ifndef CONFIG_USER_ONLY
-static bool sparc_cpu_has_work(CPUState *cs)
+static bool sparc_cpu_has_work(const CPUState *cs)
 {
     return cpu_test_interrupt(cs, CPU_INTERRUPT_HARD) &&
            cpu_interrupts_enabled(cpu_env(cs));
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 82b56c3cd56..357f3737053 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -111,7 +111,7 @@ static void tricore_cpu_reset_hold(Object *obj, ResetType type)
     cpu_state_reset(cpu_env(cs));
 }
 
-static bool tricore_cpu_has_work(CPUState *cs)
+static bool tricore_cpu_has_work(const CPUState *cs)
 {
     /* Interrupts are not implemented */
     return true;
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 99c8bd4b5fb..1b299568776 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -140,9 +140,9 @@ static void xtensa_restore_state_to_opc(CPUState *cs,
 }
 
 #ifndef CONFIG_USER_ONLY
-static bool xtensa_cpu_has_work(CPUState *cs)
+static bool xtensa_cpu_has_work(const CPUState *cs)
 {
-    CPUXtensaState *env = cpu_env(cs);
+    const CPUXtensaState *env = cpu_env(cs);
 
     return !env->runstall && env->pending_irq_level;
 }
-- 
2.53.0


