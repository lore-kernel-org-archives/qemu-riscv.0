Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72853C9830B
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 17:14:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9QVv-0003kd-Tx; Wed, 23 Sep 2026 13:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QVs-0003fW-0E
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:12:08 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x9QVp-00016A-R8
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 13:12:07 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68NGTpju063808
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UKujglBWbXyx/peTL8xZJFCROl5Qun7zX9GPbm8YSWc=; b=BYunODPnvDgTrmX8
 AI/uGa59BRQ/sLvV+G6BbNVixM7sXRAftKeZ6nyMBVO8VDoK1iCdLXs2a3rHqd8p
 q8BesJd3VT/j/xqE8NHgGCCBzY5weM9cdxn2dXAtiYNVk1MtZQp9I1M7/Taa2U4L
 pYGpCBxeBPX/+s8+piU1B+CcYUa7kQlcz9NmE2imtYweP+nyYX4e1KXM1j/v1e5F
 /T6Oivfa782hIw+L5QPgQTeIgM3quiy1eUk0VIU31pkcUd/5zgg+YqVuRbrEOeWh
 xOnuX+yme5cfaubay5P32KeaR5V1yYS1Tg3f0+3cYkKyiBd+uQHjrTllsv8JiOYb
 NbQpxQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfkbh12d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 17:12:04 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-97e9cc5ac86so274200241.1
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 10:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790183524; x=1790788324; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=UKujglBWbXyx/peTL8xZJFCROl5Qun7zX9GPbm8YSWc=;
 b=JtWuW//GBA/1zlf334gkFQdd26cPgIyIveg982mOR9ntVvqNE3gd/ef+jsyCjKqtlO
 efOfoWXSCdbPmcmEH5X2FGU4RVO7TXYI0FNOgdO9xV9H2pXMSbpShuMskiFtD0EaOWqy
 tNs7z7Ansp/AedJZMyxRmHRsRwULKLQJgZezYzs7eAnTGO+FqPrNn/2kxpVmq5I7uLJH
 zRFGZtCvkJYfTb0iCpMBLSZCzBhssdMyIeoqsp/d9FCIZA2sO2RXZUZwsiXjjF28Lz2v
 BiPDtB/OTHtHqrIwJJofK71xfeX1/4OnwlM6ya/rwGxA10yw5aByM96AHAnsEgFwn2cH
 PSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790183524; x=1790788324;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=UKujglBWbXyx/peTL8xZJFCROl5Qun7zX9GPbm8YSWc=;
 b=tywurOScBjil9fjqHoIt2WXtOMn2RsAIbCtPRDOK4qW3V5q1KhBXghQVXRG2uuC7bW
 97zRSkkb5fTcJlJCZj4E2ApYYX0ZRtbxEknaNye10Cg51PgB4ZeWug+z5v6JXAKAei4w
 EvALTJJw0MJmhzosk7ucyXPaH3wCYH0ewMdCToEdkUsFUEiIfHHDyk0kVdk7qA5PLSMZ
 kLq71tsLCCrVcDetrVQsa6/fD9CG7A/3CdZcvL85Kp71VQLxgB30+8dvqRNPJWaGTbYK
 N9vPqh3C1Zx497GfKl9Zn8EN2ezQbR2er51NkuSjTdM2AA4eJ0ocAGv4xpDsvzKlBlLk
 y2yQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByYM+fa3wMAs6PjBltfB45x2JYI9xpPg4ME9Gvw1ryAYmKDAkHGhb9x6z97Dgz8GcFJ9L4DNU6R1OuE@nongnu.org
X-Gm-Message-State: AFuF++niJ/gvXb9ExROZJFiZg5PQRMFfz4JIgzdyXFY5EHusIOYu+421
 3oENs2HjnUW7B1BBvcH8sHJUd/10f1TOBnW9WBKVJChTQWpFDpABBrmCjiYGWw1aD74v57+/jq+
 vRSuOWY7RtagCOCmmujyqAz9rRnyIK7EJWLg2IusQI3NPbxHSxV/T3dGQUg==
X-Gm-Gg: AYBFou1kNuTxJLW7YfmU3h24oI8Ob/GrqbueRlSes9sBpGZ13KuNiPw5CRwmyZ3Ra0D
 S98iBYeQnkBasTlIwmtTAdZ2gF0id5XmM2XhRBOcqMew83br8aDsQ40SIe6096p8oHqGXguTsjP
 8pXB5lvmfjdm8me+ETiUtCcNA6e1Ivy02pQOrrbyL4npgCR5/C0EC5noZCCgU1VW3avB3wsQWV5
 M3KBNdXikmPi65JcgyvxzuSd0iBcjqKdzLPnWoYhNFbR5bPuwkI125lP8YBUuJdyZKVE9sj7XuE
 J0PUTxL4xqDwyQ8xV9UeN/TmjgVfpaKN3oig25eB3uzDyVZPHkmq1olEo/6fkPoqRSslwWyJ4b3
 nOJcwsfYvHtMG08VUzgigVBD9ITffa5ThoqkktbP0
X-Received: by 2002:a05:6102:4b12:b0:7ab:d3f6:6225 with SMTP id
 ada2fe7eead31-7ac17ad2eaamr3347529137.0.1790183524246; 
 Wed, 23 Sep 2026 10:12:04 -0700 (PDT)
X-Received: by 2002:a05:6102:4b12:b0:7ab:d3f6:6225 with SMTP id
 ada2fe7eead31-7ac17ad2eaamr3347506137.0.1790183523743; 
 Wed, 23 Sep 2026 10:12:03 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4886848636asm7952508f8f.6.2026.09.23.10.12.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 10:12:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 06/21] target/arm: Un-inline arm_set_cpu_power_state()
Date: Wed, 23 Sep 2026 19:11:00 +0200
Message-ID: <20260923171116.31276-7-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923171116.31276-1-philmd@oss.qualcomm.com>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfXzLSjXnRrWQz7
 ju/Tp0NkR6rMZBVvFiTkcPH4p0Ycm4lUrK6ysfzvKfVDZpzglTmIncNbn6dMpFWBTOkisZKDFPe
 7YeuAswQQIwlbdPg7YRG7pG7vuyaVdk=
X-Proofpoint-GUID: 8xbS4iK407OECBKdX6PVU9FTxTLNtrFi
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ab40864 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=or-B4SToQ6AIma83kDAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2OCBTYWx0ZWRfX0+Z5ZQJ6/z/4
 /BFfbffTBjrKD9gaPD0uApcmMBsKv5htHaYZvSApYZPUEl/g166ATExaL2Zdfl1/FLMmvlQXQSv
 91+IxwQdwSuln2V+Z3K9qb76cCERwW+F1bnL9mC3EF14U5qiM/SX6YcRc6u6nXbvP3F/mXaCRIY
 +sY4ZOa1eHyLqA5f+0QtxA38FGIc+x8AZY+xmlzbU6jz1QHvNe10VEH8ILZl7jkm6j1F89aOsPD
 AQDs1OLVBM3dHZOFXc7/WfMvUyJAMgUpD4xNHWJH7geKqlZP5wAqiGW+pvauVb+yEiOMEEcOXJ4
 cmy3bkTcVo2XPyL24CrVTWDn4M8ixVwMAee22Qc0cwxEB25BYpW7lg1xD+UrAx8gkIU+85Sbspp
 v8oMv8KzToSLR/WqO3AO0EG9ePUPEbOvN6Vu3+wm73BhQoMbvBZBy8isx5zewSxJ0ITgs4EOHQm
 k3wP/SJ4NL8jUm8LiXQ==
X-Proofpoint-ORIG-GUID: 8xbS4iK407OECBKdX6PVU9FTxTLNtrFi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230068
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

Move arm_set_cpu_power_state() from the header to arm-powerctl.c,
keeping the power-state helper with the other power-control code.
Restrict the call in arm_cpu_reset_hold() to system emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


