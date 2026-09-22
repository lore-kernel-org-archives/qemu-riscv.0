Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B6CC982FA
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 16:52:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x93hz-0004Ot-1o; Tue, 22 Sep 2026 12:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93hX-0004Gj-1A
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 12:50:40 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93hU-0002TP-92
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 12:50:38 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68MEjdcM898354
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 16:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 72N0GXBzAI2IR3Q2JwAh1iUuA/4cXofbC72GnfMvljs=; b=A17rl21NYJSn4WOW
 Nuos9WqMytoQDEEkCz99z/UoWrqnmlcv6qghWNoISwzkVbm4A/Sqc4n3l7Qr5mTr
 5LrDoP56uBy4LOn5qTTpp+bXlghoX+LiRAAgsZeXAYcGInUCzJSITlBpK2naLenW
 HCol5uEdJHsvbFp+b6WVwp/bFlDb6hkQMJPJrnkYU+pRSelOI5+u98LYepMvcjFZ
 yCyOcjpHQ3s4cWBptS1Z2+YjkR96FmpAQbUunluYoDVUiM06dk+zrehWtZL7e1sv
 CX70lDkhfgEtxeFKvvn45aVhKG+Ii+s3EYMOgrbnWTYPIjH9OB7AQr4k/tcxPz4U
 qEmFew==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gueybkvts-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 16:50:25 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-5c8337b12d0so47720e0c.0
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 09:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790095824; x=1790700624; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=72N0GXBzAI2IR3Q2JwAh1iUuA/4cXofbC72GnfMvljs=;
 b=Uap2q/C2u5ixRnDLlkf7q1AqGG2ImrOrlo8km8GLhYxP9GyCH9YjgmgSuCPKZrZcbm
 mlK8E5FrlA8eaSQbvwaxVU1njAXUpGkgEF4Fog1XP6xUdvn47GmBWvYD5I36B/k6OW74
 6n8XjUwHpt7BxNXZGJ+iSa5rIk98QdYjOOIPnWxWY+vSBh27H15wqNyD7mVoQwzJq1ZG
 8IZsBCX0NTba8mt5ZV1NtnvEhzpEKR65dbkR5Ks6zK4et1/gMKBrGWJLPHEPpBZkwyEz
 fuGr3qZcK+ez4Lz9d/iSHcVX13igfFaekiO3SWg8iaY/kQDDQYbPLUdJpa6WlVO5WvwU
 fGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790095824; x=1790700624;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=72N0GXBzAI2IR3Q2JwAh1iUuA/4cXofbC72GnfMvljs=;
 b=kGZk6K5C0j8Le6jVCmaB2NRsgojfYZHZJP/ErlcTWKh5gFzmyQXvzOWAH00/fs9RrE
 GTQictR5Hq4DRa3kg2TMk6tXF1yIhPFVm64j3E6qymO3SGZHKA/CimHJSDn3FdaqwiKE
 Ea/BouiHbGvx14oM5DSdps8RChP0a2MGi9UBWEl1Xqyoa7v+J1jrO0nsK6v5YaZlxQpx
 JLvSfKsvP7TaovfqrtHDQpfwZoumOUY+oD5LAToZefHHIY7NwI7GISKQnvk0Pw3hDGFN
 Fjuik0icijVGwJEDv9+HYCKQcTEO8NJDsiZkvs0/u6NVAUYKl9hfRN0vkbG559buGFYr
 nGcg==
X-Gm-Message-State: AFuF++l+t+lt+xhQzpT+YsHzYKyeLh1sE/elncVNM/czZ5R7+NcmVzAe
 OYZWcvFq3BvJp4WNlzOhQaVBSxvxFaHYkyUWiYveySuaUAfzleLWPUmbF29sTOhiPYIJAByauY3
 q/SYg3Ans7npez4J1KWru8TS6tsJSQbfjuDeDq21YINRR2cQBy6iaNmepeQ==
X-Gm-Gg: AYBFou1tVhPKLFsMxcCsXRm8ikVQklJg2CW3bkNfcnvjPfZVCSkQFOAWF6GBCfg5maF
 ZZSzeyhUpgZM0eFfOEXBIYjI7DD1ACO63DwZBmZFcJX4mdIc3vRsXS3CWVLst8EaJnhxTzbfbfn
 g+GKI++VidLWxdV4AsNV/SnjFlDT0HlcV186m2+JdlsgFyMmQr/VrFoF5Dzbuo9J0O02VbMIMrH
 FeTxX0h/ZDSmyik3tKvl8XWGhuXI9wzvA0em9GicmAnX2Kc39H4NQ1Ivukk0oEAnsTm0aG8Y65D
 ayTdTw5absVjrIlMmu56dtV/6Uzi3dlTgB6dAvjKyauqANFeRkNlbOC/ICrwwvAqmsZ5V1nrf/v
 HXkZaBsSI/Ro70klUhf+j/RHm5DjutrVsfWx6Wvqd
X-Received: by 2002:a05:6122:1312:b0:5c9:a60b:e5d5 with SMTP id
 71dfb90a1353d-5c9f1655c76mr124706e0c.15.1790095824527; 
 Tue, 22 Sep 2026 09:50:24 -0700 (PDT)
X-Received: by 2002:a05:6122:1312:b0:5c9:a60b:e5d5 with SMTP id
 71dfb90a1353d-5c9f1655c76mr124660e0c.15.1790095824066; 
 Tue, 22 Sep 2026 09:50:24 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-488626d29dasm6729910f8f.0.2026.09.22.09.50.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Sep 2026 09:50:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-arm@nongnu.org
Subject: [PATCH v2 06/17] target/arm: Un-inline arm_set_cpu_power_state()
Date: Tue, 22 Sep 2026 18:49:24 +0200
Message-ID: <20260922164936.15189-7-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922164936.15189-1-philmd@oss.qualcomm.com>
References: <20260922164936.15189-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bP6Ds/+Z c=1 sm=1 tr=0 ts=6ab2b1d1 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=or-B4SToQ6AIma83kDAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: zlsza1TBGEGQa1po9BiE8AZDg5JW6uI4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfX0Ogx51NGIzMK
 ATkxIa204a46+Gu2BqOY1xuFnmlR9B8JSX99Ztll8xQ/s7flNM9pV2010pkreEOjPqdhkrdbvzq
 92dupGYuF+ocDENplFfMZmqzQUaAXiA5H1ujaCl28o2XPLl06W1DxNPgZhgT6BanAczNWPkekpq
 6RaKUUFRdUBSoUeLjpf0HX0CvqVx3u2SOYNDhap3e0LKmtpsUNiKOmHhxppHLoKK3Ok4Fso5SfB
 l4XR7bIzOWdzi8ihBqUJmY0gUQG1vyhI50w1fy5MVPu5agEOfK0X6dP/HAs1SSTrr6yKK9qM7bh
 pn2QDZXWGCZ6uxaqyNwfy9vY1MpeBwHtT1/owcNM8WWxBq9DXtJcLTBzvaPsrui08dmgIF58MS4
 iEANk/b1PPzqWqsUEfg0duvVgmomz1Mr9Nx3dWeRsMuLg8zqmk/6jv8hCvOlC5+sK/eLkCtZmv8
 GJA6sqRo4iVXnZNPfrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfX5LGkVjx1oMgV
 2+Oqbl1VRFcrWzZ/mJ2dNkrIVR5oGtpKZxuTpYsQWFQ3vAkXH3ppha2xT7/DO1lPRWdTHMzQVel
 UooyV3uwE8IeUET25w32QCAeqEOuycE=
X-Proofpoint-GUID: zlsza1TBGEGQa1po9BiE8AZDg5JW6uI4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
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

Move arm_set_cpu_power_state() from the header to arm-powerctl.c,
keeping the power-state helper with the other power-control code.
Restrict the call in arm_cpu_reset_hold() to system emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/internals.h    | 8 +-------
 target/arm/arm-powerctl.c | 7 +++++++
 target/arm/cpu.c          | 4 ++--
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 1775835ad50..1efda543270 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -2082,12 +2082,6 @@ bool arm_cpu_match_cpreg_mig_tolerance(ARMCPU *cpu, uint64_t kvmidx,
 /**
  * arm_set_cpu_power_state() - set power state synced with halt_reason
  */
-static inline void arm_set_cpu_power_state(ARMCPU *cpu, ARMPSCIState state)
-{
-    CPUARMState *env = &cpu->env;
-
-    cpu->power_state = state;
-    env->halt_reason = state == PSCI_OFF ? HALT_PSCI : NOT_HALTED;
-}
+void arm_set_cpu_power_state(ARMCPU *cpu, ARMPSCIState state);
 
 #endif
diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index a06be5cc997..213e7ae056c 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -45,6 +45,13 @@ struct CpuOnInfo {
     bool target_aa64;
 };
 
+void arm_set_cpu_power_state(ARMCPU *cpu, ARMPSCIState state)
+{
+    CPUARMState *env = &cpu->env;
+
+    cpu->power_state = state;
+    env->halt_reason = state == PSCI_OFF ? HALT_PSCI : NOT_HALTED;
+}
 
 static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
                                       run_on_cpu_data data)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f58a1db843a..76aa47ac503 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -351,8 +351,6 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
     env->vfp.xregs[ARM_VFP_MVFR1] = cpu->isar.mvfr1;
     env->vfp.xregs[ARM_VFP_MVFR2] = cpu->isar.mvfr2;
 
-    arm_set_cpu_power_state(cpu, cs->start_powered_off ? PSCI_OFF : PSCI_ON);
-
     if (arm_feature(env, ARM_FEATURE_AARCH64)) {
         /* 64 bit CPUs always start in 64 bit mode */
         env->aarch64 = true;
@@ -671,6 +669,8 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
     arm_set_ah_fp_behaviours(&env->vfp.fp_status[FPST_AH_F16]);
 
 #ifndef CONFIG_USER_ONLY
+    arm_set_cpu_power_state(cpu, cs->start_powered_off ? PSCI_OFF : PSCI_ON);
+
     if (kvm_enabled()) {
         kvm_arm_reset_vcpu(cpu);
     }
-- 
2.53.0


