Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B22C982FA
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 16:53:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x93kc-0008K4-EQ; Tue, 22 Sep 2026 12:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93ia-0004xR-CB
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 12:51:47 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93iY-0002d0-LJ
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 12:51:43 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68MEjHTH449463
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 16:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NMMUYlRFOEu4Y+0NjhX8Ge/q9RoTfSWrF7SafoChtWc=; b=a9sDnEEWrb/dnNAd
 Snn8Ix/BsRS1Fn5Mq6hUVkHaQZ8kkozC9WFbv/hEJ1aiA8wndlfwN2CvaYDF0Sjm
 i8gEpmzUI99SeHccSOdZ+NUJzUGRUtC+569up8XbLQNET1nadDL8qtQ/l8N/BsDR
 Fi/vn6999YoD/EKcpjL/GY+6mumthjgZPm0rH1H1QMl6JPyHXWgvmItww5v9EhY+
 /2IOBKvKUimP/MOlOqNZUsfGKm/+88/107Ld4pOz4vgiPkcbtPgs825EAhGipeAy
 K3L4HbXW/62mmUiTAEzCftxcnB79DTbe0TViWaN6PLDdzp4CqyxqoNcOUHV/UGj1
 ChIq8Q==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjytfq1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 16:51:31 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-97e9e2deaa4so17007241.1
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 09:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790095891; x=1790700691; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=NMMUYlRFOEu4Y+0NjhX8Ge/q9RoTfSWrF7SafoChtWc=;
 b=Znx+ShXCwf4t91rd/q2QJw68c4I8nc+6HP5PtIi5RdnPwZriz8WFsQYDqpDPehsxDA
 b6B4z5z3dbFO9bfEh2l4on1r8ypkYPam+Q6Q5rgntVFcdzWZ+/SG/jPMB1l0IUR+iXKR
 uvnQNDbhzeQMRSl982CUFdKOL34GZghIReOCsg2215VkorUJoarY6elwMs+7iej9UGds
 /bqv9o/aTh2bLtM+bVdlq8XJvbUwlG+WGdO9+hJR7JylQrWCgBLowGMCx5eZ6EgE4rAJ
 AC9TCfYpj/eulypvCOmSJLh43TbKhBvIFqS9OoksJ6QyRwjLKW65siubFkjg3tFh+I5A
 l3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790095891; x=1790700691;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=NMMUYlRFOEu4Y+0NjhX8Ge/q9RoTfSWrF7SafoChtWc=;
 b=UE9NRaxpocm9rPBUJZmHlNYfZ/0v5gK7LCwlk8p4kzAqhaHLVeQMTX4x2UhlVLjHE+
 xz6AUGNco7dIPYFhmKO8XgCoYdrbjyJnLTE1BgFA4NTZfDm+/Pw9Cb1PS+e2F82Q3EQn
 3m9/ApO5JHixXorAZWyCCcCfO95F6om2yz1b+HII84AbzgvUUjycwKup/RC0OJHUYv+C
 2JzEO6nvDe/cv60iqnRjPExjSWHsxGH7tnyBtU1TbR5rPh5ERdBJnP9fHtQ+TKP81W8H
 GGMBTMRHxcVSgK/mNOFQFvy2O71eehPye7ZG9iXMCyGS/4kgV/Yq3FDqx1IczFLa7RcT
 thbQ==
X-Gm-Message-State: AFuF++mBtA0JmxXIjfGNlnfChscp6zVgGtvUiAuyuR2Z3XDAhztdB9Jv
 0orREG0gwjX37HmFdiUdEB8zrOgBRLmP+NDQVkg023XcXcbvdgWZc0aiX//mvDAEfPH7sE5jyF7
 ZHeH1RKEcyW5pCmMeHKAZOOt3KQCpK7TrKa0vGH55B1/BfBZUCWImxzaarNihaCiasA==
X-Gm-Gg: AYBFou20BIUCPL6sk6AnZP30QEDKZkE579DN7+HE9ZAxCiCmQPGOpkcOLnRY7r+4sMg
 H4wb/Ktl2RL6R+p7DFBK8Gn8OOgGe9nMxslytSG6G2+UZ5d/G+MRagEydbdev97DcNCkX7Cm05f
 LlZptQEEGsQe4mUFg380tgNlL9U5o5slfKCorCRkuQoHoorOZGmFQ4XgXQmaolVXiLje8SWVh23
 6pzIKSO42SwES2/2MzowLsc/OTuRWm8YqS5/03dtfM4QGPGA/EHl0WlOAXU1N465XkHw0ynhm4R
 98GH3RKC59Q0PoU88jBml4AMlPjgAHKokC32O9ImyQ9at59UJORL6epj6eidTg6hjyrWuN+hwj+
 2X/ZxeDibISPnSMHqoyIRfmKEN1EYKsafYJhdwDGs
X-Received: by 2002:a05:6102:6a83:b0:7a1:f7e2:aae3 with SMTP id
 ada2fe7eead31-7a55ca7b59bmr9262527137.21.1790095890840; 
 Tue, 22 Sep 2026 09:51:30 -0700 (PDT)
X-Received: by 2002:a05:6102:6a83:b0:7a1:f7e2:aae3 with SMTP id
 ada2fe7eead31-7a55ca7b59bmr9262501137.21.1790095890377; 
 Tue, 22 Sep 2026 09:51:30 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fde17dab9sm5197455e9.2.2026.09.22.09.51.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Sep 2026 09:51:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v2 15/17] target/i386: Split leaving-halt handling from
 x86_cpu_exec_halt()
Date: Tue, 22 Sep 2026 18:49:33 +0200
Message-ID: <20260922164936.15189-16-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922164936.15189-1-philmd@oss.qualcomm.com>
References: <20260922164936.15189-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 83tRGu9InjRSPH3xOlz8X2daa4Zjsb1m
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab2b213 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=GiXQl85om2WzCxkx9rAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfXyrmF8u4dfo1k
 47fwGC0l0IW/KIv2ozV1gjoA50V9i7gRkwsQ5Xx/vpr3zSf7ucbNrQIz3YkFMbxByZXWUx/pZQ5
 lAYCMBfKG6oeRJ8u0j34NGT5YOO86/ate4GuZBrtFWNWKr37jXtmOSQZPJtPsf0jxrMcCsAP9gD
 coGZnojVKikDSFNOa2TonG4Ls37z62I+PyO47lHvPrEsFQH/y4EOBpaoMoYr9u+VmsVskPTWgSY
 kKoa3UVfV7UGILBBixsOMBS0FXZrs4RuA0JOJ//puA9DlQbJ0KJgTXZHzIyeMtHGYMAECiCsaHC
 fYHjeGUh7a51YkSCjJKpytCjRV5ChVnoqNUvoGlrwCnbfqaYwqhSYun5mR+0vde0dCTKaMb7hfH
 pqvaK64lC3wMiXtK2EMItKSo1vATlUoV2UYU9UUnHDeKpYM0Ax3lNsyBVfKooO18s2RFsgGBnIZ
 CaS83CN4TIb2H/V6GfA==
X-Proofpoint-ORIG-GUID: 83tRGu9InjRSPH3xOlz8X2daa4Zjsb1m
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfX87DS5TbuBons
 KALWDQLgyH/o+hYrQJYOVUcqo8ffel2HjW1o6m0+z4dDQbeZX9++C7b1v538QfVG8nIAtvPYdzf
 G6xHGtmX3lGZvfgkpb2bkhfFdkZMiac=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
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

Move debug exception handling performed when leaving HLT into
x86_cpu_leaving_halt(). Keep x86_cpu_exec_halt() responsible
for checking whether the CPU can resume.

Document that #DB IRQ delivery through do_interrupt_all() runs
in the vCPU thread and does not require BQL protection.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/helper-tcg.h        |  1 +
 target/i386/tcg/system/seg_helper.c | 25 +++++++++++++++++--------
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index 58e8ca0bc1b..96accb30a80 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -39,6 +39,7 @@ void x86_cpu_do_interrupt(CPUState *cpu);
 #ifndef CONFIG_USER_ONLY
 void x86_cpu_poll_during_halt(CPUState *cpu);
 bool x86_cpu_exec_halt(CPUState *cpu);
+void x86_cpu_leaving_halt(CPUState *cpu);
 bool x86_need_replay_interrupt(int interrupt_request);
 bool x86_cpu_exec_interrupt(CPUState *cpu, int int_req);
 #endif
diff --git a/target/i386/tcg/system/seg_helper.c b/target/i386/tcg/system/seg_helper.c
index 9ce608a0bb7..566b3d4d80c 100644
--- a/target/i386/tcg/system/seg_helper.c
+++ b/target/i386/tcg/system/seg_helper.c
@@ -140,22 +140,31 @@ void x86_cpu_poll_during_halt(CPUState *cpu)
     }
 }
 
-bool x86_cpu_exec_halt(CPUState *cpu)
+void x86_cpu_leaving_halt(CPUState *cpu)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
-    CPUX86State *env = &x86_cpu->env;
-
-    x86_cpu_poll_during_halt(cpu);
-
-    if (!cpu_has_work(cpu)) {
-        return false;
-    }
+    CPUX86State *env = cpu_env(cpu);
 
     /* Complete HLT instruction.  */
     if (env->eflags & TF_MASK) {
         env->dr[6] |= DR6_BS;
+        /*
+         * do_interrupt_all() is the normal TCG exception-delivery path
+         * and runs in the same vCPU thread context, so #DB delivery does
+         * not require BQL protection here.
+         */
         do_interrupt_all(x86_cpu, EXCP01_DB, 0, 0, env->eip, 0);
     }
+}
+
+bool x86_cpu_exec_halt(CPUState *cpu)
+{
+    if (!cpu_has_work(cpu)) {
+        return false;
+    }
+
+    x86_cpu_leaving_halt(cpu);
+
     return true;
 }
 
-- 
2.53.0


