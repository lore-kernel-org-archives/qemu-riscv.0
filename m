Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF96C5DF94
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 11:19:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wySgs-0001nw-Ns; Mon, 24 Aug 2026 07:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySgq-0001jn-GN
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 07:18:08 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySgX-0005BU-Pb
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 07:17:52 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O99B5N2900603
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 11:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aim88kbyx4mLrKFfSdKR/nIKrzOmFcmOxoRL9bSxY1A=; b=fw+K3U9YmbiSaAvP
 peEI/vv7v+YRiMVg0JYiRY6SZzNo9EVgTZo20AgalFopyJ57ZACsZjTZn5Nil3n7
 2yB+CRT58QhLgemjAs+2dy/J0cVaikjPxZ49b9NxmG067cE4fhXma5FeeF/qJquh
 lcVkFO3gnGySk5EcLmdmkEimoPbmXe1lvizpGFEq4uhAEj7+fiXvSnaf3DFHNj+/
 HelB8XvxeZEY9+tngamLB8LkB2nZPiK0B8hiV5zLxKlPzS9gwPFmxkHdDqDkjUdl
 +iZaLskJCXqxV/AK9I2zt/uANYl25tZvmcHHXrdU14lNr52LJx8aqWlEQWm2FSmR
 ELvkZA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgrxwa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 11:17:48 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-73c040cc990so387631137.0
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 04:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787570268; x=1788175068; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=aim88kbyx4mLrKFfSdKR/nIKrzOmFcmOxoRL9bSxY1A=;
 b=TUhZz+EwUZ4wYsWw1Mg4dfF8mNbiQEAg+sEvILwO+VI6DEg8KNw/Avy2fns0zf36SV
 Kno8nGvI1ta37agmaO/XVnqIau+OVoOyDtptnpHXgTtRNc1UCTO471F+eQHckQbSUM5D
 bvlYDD6yowvnrPDVi//S3erriqAcfPdv2xMgZWJ6m9JoAGVc4jfTssxeGSQKRJFOG/hT
 7uN9OZ8TThGDKVKIQH4YzTYc68u5G6ed5KpatFHtDpyFqaSFxATn1Vsj9n6KxqnvkPYl
 bSq/jtWER/lhfU7wkkj4vpwssWaP7qs/YrmJqVLzkxjYnlf/PA2HhhxdHxxxi6EPh1Pm
 xPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787570268; x=1788175068;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=aim88kbyx4mLrKFfSdKR/nIKrzOmFcmOxoRL9bSxY1A=;
 b=K3XHCpcrzig+xXgURCkluSbQDAFZAc5wTUPeuz7kTLzF3Iz+1Hg5gBovl6a6TBriO/
 Nv665IJFXxZI21Q+eXyLNdasedbKq+5CQhLi70HkHvXcUTtaiADktlZ1NryZTuA3GVG3
 aHjyv6GimiJ4kkH8CG7cS2TnCtdeomu8a0V2GjvYwFHV0w6Xq3hSIXmHQClXpeULLQqN
 V6s/brBdVE78UxDNue/zcOnfhQicE0f/3K/UxERUF9cPZ8cX1qZHqci1HnzLQ6jEYhOt
 rqVfFYe5CR2fgMEGmxctyxpfD2a5BPn9RFQSSUbiaP1kgS9iVICY3ydMJf8IXwUulS8m
 PrSg==
X-Gm-Message-State: AFuF++lKcx9cTcLztnFOCnh//g9M0gbVx5toMSURsBf1cCx0Ptu4GUP0
 vo25ybCpNjJbLa+LebxpDtSaUvqE82adJt/9IKPJs66YuU4d1Q+zjkTL1aYOY8z5tkQOQJ4we40
 u/WK9fGlTQx4Igc5kAYP3nSo0mwlb4q6qslY5v8aisuLF2RZ+jnebQBMLdw==
X-Gm-Gg: AR+sD10oz7slbmPqojLn02tamH/x7dGqNkWYQwziFGP6sx2GdvEDEqLgc43N4/FbDxr
 5oieHCIAsj5uo5H+wEMbug3qoovh1mz44T+76TmZzAqjsRW8wzq2wrnV3HoEjcRzWR5T9OWZ8Oa
 OeICWGoyJ2yX01lq9JqS+yRFapGSdbPFSNJqNf0NlyT2ntHL814OztE8yj+V/3o4wS2Z+BjMnQ5
 G9MKGO/Xmj3F38xkTTYjtpD0M3m83s7qjVTWC4B7UsmzoU0AptVpA9aP/m12jAJSykNF4LUsyLv
 X6i6v+xc85ZilD1tDP9AwhsPOw3/uPVGsJog7QZE/wHAX4t+j5UcOnIfmcceHWWCv7O0Pk7PS2q
 8svgfWYKMMpSVuEeTfT5c5nl3B8iouVRnteMtvwph/fcmiHDFAg==
X-Received: by 2002:a05:6102:5126:b0:779:5099:6ce2 with SMTP id
 ada2fe7eead31-77a62c4430fmr7664393137.7.1787570267881; 
 Mon, 24 Aug 2026 04:17:47 -0700 (PDT)
X-Received: by 2002:a05:6102:5126:b0:779:5099:6ce2 with SMTP id
 ada2fe7eead31-77a62c4430fmr7664375137.7.1787570267407; 
 Mon, 24 Aug 2026 04:17:47 -0700 (PDT)
Received: from localhost.localdomain (44.170.88.92.rev.sfr.net. [92.88.170.44])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a59e1aeab9sm9375743a12.22.2026.08.24.04.17.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Aug 2026 04:17:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v4 03/20] cpus: Add const-qualified CPU environment accessors
Date: Mon, 24 Aug 2026 13:16:52 +0200
Message-ID: <20260824111711.26297-4-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824111711.26297-1-philmd@oss.qualcomm.com>
References: <20260824111711.26297-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfXwgITQfChwIeW
 w7JYfLI2iHNnhbT25bqRy01STtx5dO91zjfiQHDQwYql9+u0yoX1gKl449kMJrBYKz1ea83ennN
 JcWOE9L95BH6uD7mSTswuhyVJFtSflA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX2NbqU5I7F4Hp
 GnW1eyGuxJu5SYFQyzuK7xKrmZsZRDgWJToDonu+FRGcwkllsQu6WJYBdHjV8P2v/lm7mfziqTT
 rR0AKGjkjQLiJ6W+6pKD7SQNYUWC3M2q/S1pM2bWCmzQ+EaAa4zd5DaRNDZOvgBODItKtN5p0XP
 iWlvlMks0UULPixpiXw3/qB2SHXWdD6zU+4jmqvTo4l4R6ovh0ockFNUNNXrPSCPG7/ne0zbNnc
 6vPZ5lwnr48kGFTq5WLsSD4+lGTlydUrAv1sLUB5HSA2QksBlbHIAYLjZYNatKmcPvtj67tjMCP
 g8cj9+FACWuEWypnZHIAoySJuHoPCxfY9RAulqwHApu9TH+AFWUTs8jNtLgGUNQU2nIrtjnuHur
 ZtEl6ncQOjaqGQzh54dLOJ5VQ5X5Vmevux2WRtsfx4Y1ylFvGI7ypueiYGPzpdfFTcl/b2wLvIm
 QTLuO3PJXqArfuuTG3w==
X-Proofpoint-ORIG-GUID: vdYbz4GrhHgu0L4nu7eJ0pu3Rbj74lFH
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c285c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=s1NLoHz9uzatdv2VNqxUSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=x16qC-9I3E3lrIGWYX0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: vdYbz4GrhHgu0L4nu7eJ0pu3Rbj74lFH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240094
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Use _Generic() controlling-expression to add the const-qualified
variants of cpu_env(), env_cpu() and env_archcpu(). This allows to
safely access CPU architecture state when it should not be modified.

Alias env_cpu_const() which is still used.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
Following checkpatch.pl errors ignored:

  ERROR: spaces required around that ':' (ctx:VxE)
  #46: FILE: include/exec/cpu-common.h:89:
  +            CPUArchState: \
                           ^
  ERROR: spaces required around that ':' (ctx:VxE)
  #62: FILE: include/exec/cpu-common.h:101:
  +            CPUArchState: \
                           ^
  ERROR: spaces required around that ':' (ctx:VxE)
  #90: FILE: include/hw/core/cpu.h:605:
  +        CPUState: \
                   ^
  total: 3 errors, 0 warnings, 64 lines checked
---
 include/exec/cpu-common.h | 30 +++++++++++-------------------
 include/hw/core/cpu.h     | 17 ++++++++++++-----
 2 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 6594f7fa1be..60997628cc6 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -85,21 +85,11 @@ static inline bool cpu_loop_exit_requested(const CPUState *cpu)
  *
  * Return the ArchCPU associated with the environment.
  */
-static inline ArchCPU *env_archcpu(CPUArchState *env)
-{
-    return (void *)env - sizeof(CPUState);
-}
-
-/**
- * env_cpu_const(env)
- * @env: The architecture environment
- *
- * Return the CPUState associated with the environment.
- */
-static inline const CPUState *env_cpu_const(const CPUArchState *env)
-{
-    return (void *)env - sizeof(CPUState);
-}
+#define env_archcpu(env) _Generic(env, \
+            CPUArchState *: \
+                (ArchCPU *)((void *)env - sizeof(CPUState)), \
+            const CPUArchState *: \
+                (const ArchCPU *)((const void *)env - sizeof(CPUState)))
 
 /**
  * env_cpu(env)
@@ -107,9 +97,11 @@ static inline const CPUState *env_cpu_const(const CPUArchState *env)
  *
  * Return the CPUState associated with the environment.
  */
-static inline CPUState *env_cpu(CPUArchState *env)
-{
-    return (CPUState *)env_cpu_const(env);
-}
+#define env_cpu(env) _Generic(env, \
+            CPUArchState *: \
+                (CPUState *)((void *)(env) - sizeof(CPUState)), \
+            const CPUArchState *: \
+                (const CPUState *)((const void *)(env) - sizeof(CPUState)))
+#define env_cpu_const(cpu) env_cpu(cpu)
 
 #endif /* CPU_COMMON_H */
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 81af7b9ee1a..18970ea39f5 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -594,11 +594,18 @@ struct CPUState {
 QEMU_BUILD_BUG_ON(offsetof(CPUState, neg) !=
                   sizeof(CPUState) - sizeof(CPUNegativeOffsetState));
 
-static inline CPUArchState *cpu_env(CPUState *cpu)
-{
-    /* We validate that CPUArchState follows CPUState in cpu-target.c */
-    return (CPUArchState *)(cpu + 1);
-}
+/**
+ * cpu_env(cpu)
+ * @cpu: The vCPU
+ *
+ * Return the CPUArchState associated with the CPU.
+ */
+#define cpu_env(cpu) _Generic(cpu, \
+    /* We validate that CPUArchState follows CPUState in target-info-stub.c */ \
+    CPUState *: \
+        (CPUArchState *)((cpu) + 1), \
+    const CPUState *: \
+        (const CPUArchState *)((cpu) + 1))
 
 #ifdef CONFIG_TCG
 /*
-- 
2.53.0


