Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755B7C5DF82
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 10:50:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wx0Ks-0003gO-1o; Thu, 20 Aug 2026 06:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0Kq-0003eC-EN
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 06:49:24 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0Kn-00066x-SC
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 06:49:24 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67K7LCH72753039
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 10:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TipPX5YNw3dRxG7nvDBKnheNZjk+0BKwSN/9tefKD8U=; b=UFq2n4f72oI3NZzM
 970zhHT+nPKPzK0LMS/mg4AB/Sc9TQJf2a6mJI3puKWQzMnMQmGfmQsLbnk7Scmx
 UtxWCGkLLE3eNpwstdsPpSDaum4+50H+LPfk+5ssallogIk14EldgZFulyP+aEIS
 2LyBI4bWnqQJ5llLBoxWkwbOhulI79IL5PeFNNwTY9M57GVtV3yvWQu+YS2EN/nd
 coyZjh0xjLCqkJt8XJQC+qH7ihFu9leTx+ZhSZwH29bcrYT05jkqcIGp7nphzTGW
 HIGpUrs7kn2CADKU0O/87TJ4C1edRBjg2IzjcExmjQreD2POaIHE/hSvw5R477cW
 7x9lyQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5w498t37-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 10:49:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-936e393061dso192668485a.2
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 03:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787222949; x=1787827749; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=TipPX5YNw3dRxG7nvDBKnheNZjk+0BKwSN/9tefKD8U=;
 b=AX+U1f0iOKvcA3mlNbrL/KhL++rwpH+hE3yIHXN3UQ8ycAL5vRPMCwmhBSmtXw9oAZ
 mxjNqbHakXfFvDyJGsaEZW04DoiUy4qIlMkz47fv/t9bzl/E/NigD4kgpdU+QveY2H5W
 wshGm2tPSTslTHUM2s0Y8zmLPmA4eQb/VJsTu7cQN7elf91YKb1J/kK5G/6xU+RqKG2E
 OEoYQuAGYGQF1YQYw8Jx4coovEQVs9zS5purYGAGUukFwTcIeQy8Rd36FlvDt8kJ5W9d
 kOV1VrdsGg2/rHaXl9WyRUMaMsHE+yzIiPMcFaAqj1wr4j66bda6PXCrxKXoLZIUZKnf
 LMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787222949; x=1787827749;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=TipPX5YNw3dRxG7nvDBKnheNZjk+0BKwSN/9tefKD8U=;
 b=fMflSOnVQZgi7VZI8fXNPJJU5HUlesbWkF/nknFz/wTcSngZnkOH+8LcNZtViBaenB
 CQ9jrUW/EkkXkVweQ5IvnUa5zCPQRq7/wWH9r/S/e1ANdZ/qRTAA26aQVKFdshirZB4G
 4j77XxTVcdjn8nGLmLfpiDHDsZMNg5WhzJoJU/2E4Y8AvNZEFA8VXxVuB7PJLVdirgqk
 WZa2ZcVy0SCggftqr6qsbceGpd+ILFUzDkm5AKE1GG/z2q7FBRYaGh+3McHXcwqXTS7w
 3jHGOmJktksXhy4i/Zvx+FVcFvyUrYlcsRYBmtSWv3ZRz7UxVSyMcU4n1AKjm9r0CY1L
 qk2g==
X-Forwarded-Encrypted: i=1;
 AHgh+RpS59L5GQH6XWYpscT01Q87UUEZfFmMkK+wFDtwVnkNLeoXEifpalZhkQlSMKrqAHmV5ab3ozBY3X2W@nongnu.org
X-Gm-Message-State: AOJu0YxufCXNiqAjcZV6s5uA4m8xomNFTw1F6FxR3pT9iAIRoyXrx15c
 +jyxF60FGdExkmHMM4kvDa7hutm0QiFZY0zwFsAvgwxR39Eu9+frTBXjnb/ha9lx1L8Er+F/oe6
 Y6PCvYGZmKIXlEIRipnuTUeHXvwv1eRO9XXXODWbtEadlGGANzj+h3OGZxQ==
X-Gm-Gg: AR+sD12dpg+TgvtnzM0Ae8P6jimAl6f/FzzFCntSh2mdJ4ObBGhITKET9rZZkLTlcMv
 9iWMj9KfZYKxFuwiQYhPpZp6Kpw7FxbHhN/EQlMmPB8V4O05kv0ZIMJhN7b4Dia1WttbE48F1Yz
 D2DN5R36lRg4pdQGto0kTasV5Zn1szZNMjSuqOdZdC8ERVhFnZvjgct0jF8eN6bOhxnV7ab9nbv
 3XGiuTgsUKOadASHhY1ZlfH9odqXmAv/xNvgWro5OTPHHulqgA3hsBfxPNGdHm4TPyAvne2oKrN
 zWBPZ0lITqwHkBme3Vf7pL+fZ079W8fhRGbHUnES1Lv4RyP4Q6PrCvjP9+GXHhbwFDiHQt/YMn8
 aPeCRLaaxE2zzxfv9rbe3473qTa3yIjOEHuQs9Hr3Ng==
X-Received: by 2002:a05:620a:2891:b0:930:a348:6ae with SMTP id
 af79cd13be357-9371e31723dmr968864385a.38.1787222949256; 
 Thu, 20 Aug 2026 03:49:09 -0700 (PDT)
X-Received: by 2002:a05:620a:2891:b0:930:a348:6ae with SMTP id
 af79cd13be357-9371e31723dmr968860185a.38.1787222948714; 
 Thu, 20 Aug 2026 03:49:08 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b1441753sm13942403f8f.5.2026.08.20.03.49.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 03:49:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Helge Deller <deller@gmx.de>, Zhao Liu <zhao1.liu@intel.com>,
 Song Gao <17746591750@163.com>, Bibo Mao <maobibo@loongson.cn>,
 Xianglai Li <lixianglai@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
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
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [RFC PATCH 13/13] cpus: Constify @cpu in SysemuCPUOps::has_work()
 handler
Date: Thu, 20 Aug 2026 12:47:29 +0200
Message-ID: <20260820104730.25462-14-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820104730.25462-1-philmd@oss.qualcomm.com>
References: <20260820104730.25462-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfX/Gm7xxIJzEuu
 K+wsUHfRePyZLYLPI5rMqWx2MMEnh6x6mBliYETyY/NBLxfle685BJuL94slJ4qUDeGWndl3Gbz
 XeDKSPJV4fueR16i8v0Hqlwfjlr8l/Q=
X-Authority-Analysis: v=2.4 cv=YP+vDxGx c=1 sm=1 tr=0 ts=6a86dba6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=SERbGe8VzmIjvadycG8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: bF3fYb-S2CwGqtUr-a36FFsx_TEwHwlS
X-Proofpoint-GUID: bF3fYb-S2CwGqtUr-a36FFsx_TEwHwlS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfX966CWyCIMWkA
 1dd1uLDjU3dbyPPHptfnqVpNzlKpV2pyOT7WiWe8m1XSLrLz3sXnQqpq9UAGi/j1S1z08nkc4t+
 +gYhaMVhmsHKfsgl8EiIXGW8UsLvrdu6jz8ieTzZ30gXJx9zSUcUt03cpGuCE0bYrmr5baw79C3
 KMNW7xOX4bHqsEYmB/2UnWKgcu0imslLv1qa7ImWVhlrzle8w2DCMXLci4L4S54meMMdRdhe72O
 NeIrfMQ7kQi5Rhe9oYkbaTsVCP3IdLtl2oGVbzcDzC28rY+66+TXynWaP4UgpM49hujK7FaHO1c
 4CWAu/evcq45G5vDLj1rEzrGXRj8vqU0rtcsp6YOlgF+AAEI9e+lLd8KrrI69cxLpEjnSuXCG3X
 4X0zOkp0CV+LUStIfZxo3UlYSUdi75ewlrYLTIj2eV+0R5y6n16JZtq4qlktI2kUVBoZj6IFiHP
 TLS3bybNo+bj2EvoIpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200079
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
---
 include/hw/core/sysemu-cpu-ops.h | 4 ++--
 target/loongarch/internals.h     | 2 +-
 target/riscv/internals.h         | 2 +-
 target/s390x/s390x-internal.h    | 2 +-
 target/alpha/cpu.c               | 2 +-
 target/arm/cpu.c                 | 4 ++--
 target/avr/cpu.c                 | 5 +++--
 target/hexagon/cpu.c             | 4 ++--
 target/hppa/cpu.c                | 2 +-
 target/i386/cpu.c                | 2 +-
 target/loongarch/cpu.c           | 4 ++--
 target/m68k/cpu.c                | 2 +-
 target/microblaze/cpu.c          | 2 +-
 target/mips/cpu.c                | 4 ++--
 target/or1k/cpu.c                | 2 +-
 target/ppc/cpu_init.c            | 2 +-
 target/riscv/cpu.c               | 2 +-
 target/rx/cpu.c                  | 2 +-
 target/s390x/cpu-system.c        | 2 +-
 target/sh4/cpu.c                 | 2 +-
 target/sparc/cpu.c               | 4 ++--
 target/tricore/cpu.c             | 4 ++--
 target/xtensa/cpu.c              | 4 ++--
 23 files changed, 33 insertions(+), 32 deletions(-)

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
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index 6a733e6c3a5..d86029bcb31 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -38,7 +38,7 @@ uint64_t cpu_loongarch_get_constant_timer_counter(LoongArchCPU *cpu);
 uint64_t cpu_loongarch_get_constant_timer_ticks(LoongArchCPU *cpu);
 void cpu_loongarch_store_constant_timer_config(LoongArchCPU *cpu,
                                                uint64_t value);
-bool loongarch_cpu_has_work(CPUState *cs);
+bool loongarch_cpu_has_work(const CPUState *cs);
 bool cpu_loongarch_hw_interrupts_pending(const CPULoongArchState *env);
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 5d84e4de960..782f12abfaf 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -203,7 +203,7 @@ static inline target_ulong get_xepc_mask(CPURISCVState *env)
 
 #ifndef CONFIG_USER_ONLY
 /* Our implementation of SysemuCPUOps::has_work */
-bool riscv_cpu_has_work(CPUState *cs);
+bool riscv_cpu_has_work(const CPUState *cs);
 #endif
 
 /* Zjpm addr masking routine */
diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 54b62808d83..00917473a54 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -248,7 +248,7 @@ bool s390_cpu_system_realize(DeviceState *dev, Error **errp);
 void s390_cpu_finalize(Object *obj);
 void s390_cpu_system_class_init(CPUClass *cc);
 void s390_cpu_machine_reset_cb(void *opaque);
-bool s390_cpu_has_work(CPUState *cs);
+bool s390_cpu_has_work(const CPUState *cs);
 #endif /* CONFIG_USER_ONLY */
 
 
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
index a01e6fa4751..1024c0ae9a2 100644
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
@@ -43,10 +44,10 @@ static vaddr avr_cpu_get_pc(CPUState *cs)
     return cpu->env.pc_w * 2;
 }
 
-static bool avr_cpu_has_work(CPUState *cs)
+static bool avr_cpu_has_work(const CPUState *cs)
 {
     return cpu_test_interrupt(cs, CPU_INTERRUPT_HARD | CPU_INTERRUPT_RESET)
-            && cpu_interrupts_enabled(cpu_env(cs));
+            && cpu_interrupts_enabled(cpu_env_const(cs));
 }
 
 static int avr_cpu_mmu_index(CPUState *cs, bool ifetch)
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 7ae5740899b..4ad1cae354a 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -364,9 +364,9 @@ bool hexagon_thread_is_enabled(const CPUHexagonState *env)
     return E_bit;
 }
 
-static bool hexagon_cpu_has_work(CPUState *cs)
+static bool hexagon_cpu_has_work(const CPUState *cs)
 {
-    CPUHexagonState *env = cpu_env(cs);
+    const CPUHexagonState *env = cpu_env_const(cs);
 
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
index 8777bcbae85..93b617f94dc 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -10639,7 +10639,7 @@ int x86_cpu_pending_interrupt(const CPUState *cs, int interrupt_request)
     return 0;
 }
 
-static bool x86_cpu_has_work(CPUState *cs)
+static bool x86_cpu_has_work(const CPUState *cs)
 {
     return x86_cpu_pending_interrupt(cs, cs->interrupt_request) != 0;
 }
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 82ec35e081f..4c1aae4fb01 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -96,12 +96,12 @@ bool cpu_loongarch_hw_interrupts_pending(const CPULoongArchState *env)
 #endif
 
 #ifndef CONFIG_USER_ONLY
-bool loongarch_cpu_has_work(CPUState *cs)
+bool loongarch_cpu_has_work(const CPUState *cs)
 {
     bool has_work = false;
 
     if (cpu_test_interrupt(cs, CPU_INTERRUPT_HARD) &&
-        cpu_loongarch_hw_interrupts_pending(cpu_env(cs))) {
+        cpu_loongarch_hw_interrupts_pending(cpu_env_const(cs))) {
         has_work = true;
     }
 
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
index c069aa1c0b7..0f9374d98a9 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -134,9 +134,9 @@ static vaddr mips_cpu_get_pc(CPUState *cs)
 }
 
 #if !defined(CONFIG_USER_ONLY)
-static bool mips_cpu_has_work(CPUState *cs)
+static bool mips_cpu_has_work(const CPUState *cs)
 {
-    CPUMIPSState *env = cpu_env(cs);
+    const CPUMIPSState *env = cpu_env_const(cs);
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
index 85a91ff4bb6..fd63cd6ab09 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7224,7 +7224,7 @@ static int ppc_cpu_mmu_index(CPUState *cs, bool ifetch)
 #endif /* CONFIG_TCG */
 
 #ifndef CONFIG_USER_ONLY
-static bool ppc_cpu_has_work(CPUState *cs)
+static bool ppc_cpu_has_work(const CPUState *cs)
 {
     return cpu_test_interrupt(cs, CPU_INTERRUPT_HARD);
 }
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ab2868dc1e2..b455b997561 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -950,7 +950,7 @@ int riscv_cpu_vsirq_pending(const CPURISCVState *env)
                                     (irqs | irqs_f_vs), env->hviprio);
 }
 
-bool riscv_cpu_has_work(CPUState *cs)
+bool riscv_cpu_has_work(const CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
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
index cc9685221ae..22ed2b097bb 100644
--- a/target/s390x/cpu-system.c
+++ b/target/s390x/cpu-system.c
@@ -39,7 +39,7 @@
 #include "system/tcg.h"
 #include "hw/core/sysemu-cpu-ops.h"
 
-bool s390_cpu_has_work(CPUState *cs)
+bool s390_cpu_has_work(const CPUState *cs)
 {
     S390CPU *cpu = S390_CPU(cs);
 
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
index 2baa5036871..f7c04daf0c9 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -783,10 +783,10 @@ static void sparc_restore_state_to_opc(CPUState *cs,
 }
 
 #ifndef CONFIG_USER_ONLY
-static bool sparc_cpu_has_work(CPUState *cs)
+static bool sparc_cpu_has_work(const CPUState *cs)
 {
     return cpu_test_interrupt(cs, CPU_INTERRUPT_HARD) &&
-           cpu_interrupts_enabled(cpu_env(cs));
+           cpu_interrupts_enabled(cpu_env_const(cs));
 }
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 6d448727005..33a5875ef24 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -111,9 +111,9 @@ static void tricore_cpu_reset_hold(Object *obj, ResetType type)
     cpu_state_reset(cpu_env(cs));
 }
 
-static bool tricore_cpu_has_work(CPUState *cs)
+static bool tricore_cpu_has_work(const CPUState *cs)
 {
-    return true;
+    return true; /* XXX */
 }
 
 static int tricore_cpu_mmu_index(CPUState *cs, bool ifetch)
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 99c8bd4b5fb..fe7965651f4 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -140,9 +140,9 @@ static void xtensa_restore_state_to_opc(CPUState *cs,
 }
 
 #ifndef CONFIG_USER_ONLY
-static bool xtensa_cpu_has_work(CPUState *cs)
+static bool xtensa_cpu_has_work(const CPUState *cs)
 {
-    CPUXtensaState *env = cpu_env(cs);
+    const CPUXtensaState *env = cpu_env_const(cs);
 
     return !env->runstall && env->pending_irq_level;
 }
-- 
2.53.0


