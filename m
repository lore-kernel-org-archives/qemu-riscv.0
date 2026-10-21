Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43C2607D714
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 03:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jAuTI6Eb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PNsL0u3K
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJMnw-0003Rw-RE; Tue, 20 Oct 2026 23:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMnj-0003AN-To
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:15:42 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMnF-0002TI-TG
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:15:35 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2EvFA2562766
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TyexEBPMQhHa25gvne1aS7MprTFHqB40T82Zul38+kE=; b=jAuTI6Ebjm0Zb8er
 AmZ3yRTVMs4bF2WDqqpzdVETA5YMVvYSkuKj+rmJylPr4qGezKONfH7vFh2YeMS0
 uIH5fD4XHAy3YNjRSI1xgHZwvOR01WymUgVD1jE4EXm6o3GkSXPegLwgPYNpExki
 8WsGPw7M94wkie8IjPQpZbQ9ICJ8t1/d4vmMBe7Ik8TleA6swkVgbYlbDQKYamKb
 pf7o8QOLZw5xURWfYFWhr857oTzrNc8NB/kp4KBAl75wKJ8yuJLl0dXdTyiuACqG
 wGVKz3/Qe+yLfRgoEPm1XZAOXHuSQfmdnY7nNWWgWPP+fZBwh5+SCpzfmt/LQPQR
 CSrH1w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd23nv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:14:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-934956beec8so65279985a.0
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 20:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552497; x=1793157297; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=TyexEBPMQhHa25gvne1aS7MprTFHqB40T82Zul38+kE=;
 b=PNsL0u3KKjc2sOUyyZryq5mFZTb2hz4DBvYfd0YX8lkBY05txd4GyUZ/qLZrFQOWcd
 iMx9fn86Mtkp6k1SfOwPBC475aKr44XXyhvgR+f7+c5gMNhBwgHt1x+rWc2NFaDHIarR
 bs69IU/M0RqeACMV10IjLeW+Xk2KNC+39vi5Lsrb3DzhbTKObyr8xPE+eCAf3KkaA0Qn
 +FikK5SaOBSBFxoCfBb/3tKntDjDq2lwjSVd6vigJZdR39UzY6oPOJaZhmgI6lUuld7b
 oeOl8HuNhQVFFIvuCa/RTZQvlf2NxYmWicxifaTfg+VJ0cwl6M0gTMdVBmf+7Ze4Yiqk
 q4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552497; x=1793157297;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=TyexEBPMQhHa25gvne1aS7MprTFHqB40T82Zul38+kE=;
 b=0pyypFbqe5Y4ee7KS0+DZcpAyGh5jwFZLkUXH5ZwvSbWQh6pu9iqxD3SjVW2zqJEm1
 pInNul2tBZ1PZbNqvJWrFhtJmm6iPYeDO4cY/bdVHV4k1LZ13xPzrTTNQmQc3YXumMNP
 f2Q9j3AnJGEPiHk4r/9uIFsIgoLW6pp+JPsdeADdszm/ouKpieKmCppFuAB4b6Dyuxgq
 bAwQWU368Teo+db0nduTIM//8xZ5J477QUYsM2/QhLimd2MVPrwqTGlkBKo/63qjGEY7
 5zRibpySnH4UUlgBWkXQ55ycdyNgZ+LuO9Cd6UI5NauVwfseoLU78Smg+24qCYfxJouL
 db1g==
X-Forwarded-Encrypted: i=1;
 AKwUvBwrUdA6m1PqrHjxd3yOE7QPe32yujCidSfSWisHGt9eR4WnPcaCv5lVHbjfZ6iRMTWLF7PgTsnuepoh@nongnu.org
X-Gm-Message-State: AFq9FYLkyhl70StULfznm/9ibQbRt3qNdx/xUd0kTR3O+qG14bht+U8D
 IXSbG77KA5UyK7/SsLYjpeJtJY6CGZh1D1LUTN6q4K9NPTxwdWsPlzOKwfzR41p+QZCmMBopdwf
 eM8NKBWdlCHFjWJpHEo0MncgAQfcXSJX1QOa+uR2/MQ/wutdFoL3QgJVmqHW6Fmuwl5T5
X-Gm-Gg: AYBFou105ipRP97BRJCNPOb+wocU2YqqEqBl5QUMOB12YPqNdYTkgV7Ao6iGcCgH3kr
 BYijoP+H52UtBQg/kcCe2Ejgd5RlM+F2kY+WtJAJsSeocbEp9do4hmDPa2c9R9S56J/cKxwo6H0
 WZhQFDpu4L613M1Je1fyFaj+bpC9xUbIY4mkZuBIKGAR4OgyUwPCu8MQwI1xeV1r0SwLBpS5oUR
 l9CciaQy4Zl7IH4h61XSSez3BK0E65v/EChLYdyPI0uEDSFrRUpxwc332cQOOgwdFN79XdzU65D
 5L5iW0dEaoyn36WTqrWKmx/6ftl9lG2OfwhlQaeuCl8nP+g7RHGA8O+TvsL6ROR9W4mc0wq+knb
 zUnHgykrA+g+Z7kTOZw+ZjBHXSY/TTmDOsRul4FGZ
X-Received: by 2002:a05:620a:4541:b0:93f:54e4:6d43 with SMTP id
 af79cd13be357-93f57e5e1b5mr213137285a.6.1792552497465; 
 Tue, 20 Oct 2026 20:14:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4541:b0:93f:54e4:6d43 with SMTP id
 af79cd13be357-93f57e5e1b5mr213134685a.6.1792552497000; 
 Tue, 20 Oct 2026 20:14:57 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1fb864dacsm40890855e9.12.2026.10.20.20.14.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:14:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 06/33] target/arm: Register CPUClass::exception_name()
 handler
Date: Wed, 21 Oct 2026 05:13:39 +0200
Message-ID: <20261021031407.24862-7-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX4KArsYWZwXsg
 7XXqd980zTMsZ/mMr/O7p0AC5aDsWcHVNfAYIfUZ7MPRh/2/t4Qhoh+oUYsXHkfUkULqTGn42rq
 7oHoaVwrJF+zTc77gdmnga+spr61+sLzHP4H+SudM45Yh+7/wwokT6IwxW+XZK9xQhVA7LCy2Oi
 cL5prVFUk0DWerkdF1qssrKSGaryUZFNM7mmHgluWVe4r6sb96mczmmR0KTUQDrGyj+6Pj1Qoql
 UENarTDxP5de116vs/zzGQrvMVQ6ed+wIdwY8kIS6ygU05WzUHpPNzZrbgCGEUPZ6pHIeb2RiEM
 a+ooiKJTnSHF4OScyFO+JfElUnrn0h5RwrSUO520v091OGhlkCgUTsN/D2yDZzJc6qvDLVHRm8Y
 4FJwKsbyUd8C6jUi6BgSoKBPkK1abMSFE69bwyCQ40M1XYYQbKeIuS0SbApXdoPyWDrXcIu0Tuf
 7xkL5XE02z1d2INdf5Q==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad82e32 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QvePOBYGvqDf6_zMoJUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 9h_epyWCVsoLdmSRYaueEmTkwMdvBHDH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX3wcS+Ae/s6ZE
 1DWJ8ZPshgM5f38gBhXhAwSsn3hnixiJ/k6I50VVGCFivphX2QsLwHFzNbtJLtLc0wsdZ/KvOrw
 ds5vNBqOjlt5qsbFvKpWRHSxpOpMpBc=
X-Proofpoint-GUID: 9h_epyWCVsoLdmSRYaueEmTkwMdvBHDH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210012
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Factor arm_exception_name() out of arm_log_exception() and
register it as the CPUClass::exception_name() handler, so
the common exception logging can resolve ARM exception codes
to names.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/arm/cpu.h    |  2 ++
 target/arm/cpu.c    |  1 +
 target/arm/helper.c | 76 ++++++++++++++++++++++-----------------------
 3 files changed, 40 insertions(+), 39 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a0355ba9e1a..d76554dfc1f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -67,6 +67,8 @@
 #define EXCP_MON_TRAP       29   /* AArch32 trap to Monitor mode */
 /* NB: add new EXCP_ defines to the array in arm_log_exception() too */
 
+const char *arm_exception_name(int excp);
+
 #define ARMV7M_EXCP_RESET   1
 #define ARMV7M_EXCP_NMI     2
 #define ARMV7M_EXCP_HARD    3
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 81ec1ce21c6..8efbf673a92 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2647,6 +2647,7 @@ static void arm_cpu_class_init(ObjectClass *oc, const void *data)
                                        &acc->parent_phases);
 
     cc->class_by_name = arm_cpu_class_by_name;
+    cc->exception_name = arm_exception_name;
     cc->dump_state = arm_cpu_dump_state;
     cc->set_pc = arm_cpu_set_pc;
     cc->get_pc = arm_cpu_get_pc;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7ac21108d1c..824f0a75d04 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8841,46 +8841,8 @@ void arm_log_exception(CPUState *cs)
     int idx = cs->exception_index;
 
     if (qemu_loglevel_mask(CPU_LOG_INT)) {
-        const char *exc = NULL;
-        static const char * const excnames[] = {
-            [EXCP_UDEF] = "Undefined Instruction",
-            [EXCP_SWI] = "SVC",
-            [EXCP_PREFETCH_ABORT] = "Prefetch Abort",
-            [EXCP_DATA_ABORT] = "Data Abort",
-            [EXCP_IRQ] = "IRQ",
-            [EXCP_FIQ] = "FIQ",
-            [EXCP_BKPT] = "Breakpoint",
-            [EXCP_EXCEPTION_EXIT] = "QEMU v7M exception exit",
-            [EXCP_KERNEL_TRAP] = "QEMU intercept of kernel commpage",
-            [EXCP_HVC] = "Hypervisor Call",
-            [EXCP_HYP_TRAP] = "Hypervisor Trap",
-            [EXCP_SMC] = "Secure Monitor Call",
-            [EXCP_VIRQ] = "Virtual IRQ",
-            [EXCP_VFIQ] = "Virtual FIQ",
-            [EXCP_SEMIHOST] = "Semihosting call",
-            [EXCP_NOCP] = "v7M NOCP UsageFault",
-            [EXCP_INVSTATE] = "v7M INVSTATE UsageFault",
-            [EXCP_STKOF] = "v8M STKOF UsageFault",
-            [EXCP_LAZYFP] = "v7M exception during lazy FP stacking",
-            [EXCP_LSERR] = "v8M LSERR UsageFault",
-            [EXCP_UNALIGNED] = "v7M UNALIGNED UsageFault",
-            [EXCP_DIVBYZERO] = "v7M DIVBYZERO UsageFault",
-            [EXCP_VSERR] = "Virtual SERR",
-            [EXCP_GPC] = "Granule Protection Check",
-            [EXCP_NMI] = "NMI",
-            [EXCP_VINMI] = "Virtual IRQ NMI",
-            [EXCP_VFNMI] = "Virtual FIQ NMI",
-            [EXCP_MON_TRAP] = "Monitor Trap",
-        };
-
-        if (idx >= 0 && idx < ARRAY_SIZE(excnames)) {
-            exc = excnames[idx];
-        }
-        if (!exc) {
-            exc = "unknown";
-        }
         qemu_log_mask(CPU_LOG_INT, "Taking exception %d [%s] on CPU %d\n",
-                      idx, exc, cs->cpu_index);
+                      idx, arm_exception_name(idx), cs->cpu_index);
     }
 }
 
@@ -9967,6 +9929,42 @@ void arm_cpu_do_interrupt(CPUState *cs)
 }
 #endif /* !CONFIG_USER_ONLY */
 
+const char *arm_exception_name(int excp)
+{
+    static const char * const excnames[] = {
+        [EXCP_UDEF] = "Undefined Instruction",
+        [EXCP_SWI] = "SVC",
+        [EXCP_PREFETCH_ABORT] = "Prefetch Abort",
+        [EXCP_DATA_ABORT] = "Data Abort",
+        [EXCP_IRQ] = "IRQ",
+        [EXCP_FIQ] = "FIQ",
+        [EXCP_BKPT] = "Breakpoint",
+        [EXCP_EXCEPTION_EXIT] = "QEMU v7M exception exit",
+        [EXCP_KERNEL_TRAP] = "QEMU intercept of kernel commpage",
+        [EXCP_HVC] = "Hypervisor Call",
+        [EXCP_HYP_TRAP] = "Hypervisor Trap",
+        [EXCP_SMC] = "Secure Monitor Call",
+        [EXCP_VIRQ] = "Virtual IRQ",
+        [EXCP_VFIQ] = "Virtual FIQ",
+        [EXCP_SEMIHOST] = "Semihosting call",
+        [EXCP_NOCP] = "v7M NOCP UsageFault",
+        [EXCP_INVSTATE] = "v7M INVSTATE UsageFault",
+        [EXCP_STKOF] = "v8M STKOF UsageFault",
+        [EXCP_LAZYFP] = "v7M exception during lazy FP stacking",
+        [EXCP_LSERR] = "v8M LSERR UsageFault",
+        [EXCP_UNALIGNED] = "v7M UNALIGNED UsageFault",
+        [EXCP_DIVBYZERO] = "v7M DIVBYZERO UsageFault",
+        [EXCP_VSERR] = "Virtual SERR",
+        [EXCP_GPC] = "Granule Protection Check",
+        [EXCP_NMI] = "NMI",
+        [EXCP_VINMI] = "Virtual IRQ NMI",
+        [EXCP_VFNMI] = "Virtual FIQ NMI",
+        [EXCP_MON_TRAP] = "Monitor Trap",
+    };
+
+    return ARRAY_ELEM_OR_NULL(excnames, excp) ?: "unknown";
+}
+
 uint64_t arm_sctlr(CPUARMState *env, int el)
 {
     /* Only EL0 needs to be adjusted for EL1&0 or EL2&0 or EL3&0 */
-- 
2.55.0


