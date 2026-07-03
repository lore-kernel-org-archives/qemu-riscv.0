Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2477C43602
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 18:07:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfiHS-0001OI-Gj; Fri, 03 Jul 2026 14:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiHR-0001NP-E7
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:06:25 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiHM-0002BF-AK
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:06:24 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 663HidtP494923
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 18:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BMay3QsIQ3GQ5gUolp+fx81yahXi7vTluigMlXvOPSQ=; b=eJPMVqChphjiByeO
 IK3au+6Y0rGrIkKFFCpW/2kbJTHaT1BtUHUQnycWKRrhWHH9WQoenG3B5KX1uJIj
 2TaTs0E4VvKgl6Wq6i0ira/dLdFNrszNL9o+yTEgqfs7xeBQsGKkgrv4NXB4Dejy
 CEtVAzuzcTHef37ujXP1Z+2H0avFeQOGQdyN/tNyDZ38UVq2HpJKM20XDaizkze9
 jfDRlNhw2t32J5P3B3cNIWBqnlKEYF0q5nibUZ9vxvVbWCU0kzk6fg73mSReKlTO
 7d8+3ONYq326WzHGt4m1ekuXa9/l345DyyaSEvoeVnuGHQaWjh7p/Bp6gDP6pLKG
 12xsig==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jyta1r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 18:06:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c07f25de2so5324571cf.3
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 11:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783101968; x=1783706768; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=BMay3QsIQ3GQ5gUolp+fx81yahXi7vTluigMlXvOPSQ=;
 b=MOO9d/ytL+F4wCDAa2aS2RdQpx01SD0RxDEk5LnrJL7MULKwOOK158/hC0VkNJc1Of
 0dbFA1ESkqD0i81sitr6RrBmQOgIt52HpAkbKh+Ts3Rx5zfm5yfe4FHWDKRd7103Xa49
 irYCDiqBZQBBewkseTgNaRH7/WiqE0N4S8mhoe7oxth0VbQOVhk/aNYoJnwnm+jce2t2
 jLbka6nccq7VvwdvB/8WUhP8y20v92Y0Qneh7c/CGvnVxNgbN2eS8BrpqQw0g+HAXp1L
 jYpXsElJk/Ah1CBz2MdYpOthYiyRK0ARYzEsl68+0GeHm48h2d23yisC60WtKbtnF6UA
 MXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783101968; x=1783706768;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=BMay3QsIQ3GQ5gUolp+fx81yahXi7vTluigMlXvOPSQ=;
 b=IZaUFIF+ImS5OxtPUQNWEpsKyh4pF2bw4WTpGBkys/X//ruImND/cKeG2tNLUJCFbC
 Jx42cZacmfCDu2mWkCeSdAn0g5SXsWDFwyT+wk9QTjBQ6KJRffk+a15TdwKC0usCgMM6
 DzgqyUOa+7ZGn1eY2yxFM3AZUe2OBjCe4tI4Z1CEZp1Cpqc3U7DWQuOsVsLYF6IYcfuP
 VK8ENqWeVbDprEIfCCk7L7oGmmssMZ5hkoFrb3WZvd8lS2KV5iRByKARcTojsrNQtZ2i
 VItBnHnpwwdo0W2KwUNzEbrA4GnXomMVTd0VjqujZbH5Nm1ymwkEqFGc22zbG6h8F+oW
 e2zA==
X-Gm-Message-State: AOJu0Yxr1VwQDG8r+m7ZzMONCjmmjjZMWDB+J2GW/QBm45Qk+XARL2Y1
 jpM56fS+eaUYlSij0URvTUv3VPxmy/u47KnrZ3JbVkfifD6EBditF6J74VleNtUy+ey9AeRcD2e
 LMguwVbMxAFo9avdQ0NLlbRy3Bjax4A80kPlW9ThK0CcHVdnpaRfzFbDz5Q==
X-Gm-Gg: AfdE7cm/MFQajBj7zXsWWOApEcnntvJEeDZan/ye4XZ08PpagvS1BO0RN0Su4Bh9UDS
 WuQjsIXK6xXWFNNf7TWUoBSxKrKPRYw0W1wGjluXSaLXgg+tIqa74HUdkmPO7OInw+ci4SyJfNF
 BKxUiQhsC/FLyT4Czwjp2BmvNxFsPgRVrzFejzWnJLXicvXa/aYDr7BDhZ7MPQ0/uM15Y99+rDz
 Y0AmAINdFZNDVhIX639MK4/2Cu4Y377TbnU9uKQ0H2IyymuSDpokRK/j6vfJWERGXKAtSV1hXfu
 i8UfRRhOk17fliOG2GKrNSumr/ZBPFqsNZ//AIrV1S7QCoIIYxGVvpgzcj2y8AHMhgclC3YNTGs
 d6jWnEoE/kyfOmtu8vPilwrC6mZ+3DTcywV4hyWrfol4HRg==
X-Received: by 2002:a05:622a:1b02:b0:51c:e78:6213 with SMTP id
 d75a77b69052e-51c4c384961mr8248131cf.57.1783101967858; 
 Fri, 03 Jul 2026 11:06:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1b02:b0:51c:e78:6213 with SMTP id
 d75a77b69052e-51c4c384961mr8247411cf.57.1783101967270; 
 Fri, 03 Jul 2026 11:06:07 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51c41d2d688sm22560081cf.17.2026.07.03.11.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 11:06:06 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 08/24] target/riscv: move debug.h to tcg subdir
Date: Fri,  3 Jul 2026 15:05:20 -0300
Message-ID: <20260703180538.3346781-9-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
References: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfXxQeZmDI6Sm6x
 6PpAUT+r196TKY75CKPEN1LV5jS77HqOyioljHvJJ3gZzpjX1sFiTyzVkKch3OWVE7BjnBvCgtf
 7VZ/z6PbGxXTg9p5c3ZA+cI3XCgkk55j+CpBYCvmebXHZBR5txFUMC3tHIffpDNJJ1CcSt5og7l
 0+WUf77ZNfxUYgrjqpvGMfg1OZA+mtMfg75GMu54s1Xe4qaIpfqmXP9AByAuUlq4iwnVFDtZcfI
 ApViwpg6YqfW82O0M753lU/DLngprNEVLM6cbWMu+DHpaqXgmDPXDx+Bwzprw9Gq7tCVi4H3XOi
 oTcu2NMhC/3lVF7YzustpGdgJHIdsj7hNZfIGP6Qw83HJaOVwC4vatXKJsClTW+2G7kPoLtRsXP
 eYeQmbXNTSyG8L3oPB9NzWjFaxwe0Do48m5v7i99UWDwZ/YTfuXbBuJRFJyDXMjedI2I0Ud5/jC
 Mmk6uNJef5MdsIhRfLQ==
X-Proofpoint-GUID: 3aiuUItp0di2vehjWKXZ8KyBRyuHXo0_
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a47fa11 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=0TWWAF0crFuRuLJakD8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-ORIG-GUID: 3aiuUItp0di2vehjWKXZ8KyBRyuHXo0_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfX8zkLErcwLSUY
 8gnWlqkgSCbK3FNC3kK4Hq5d0BFWXf1DHgUeZmUYSV8pmkfGMF16WtfkvxBTHYl7Fqtt2Kd/XLk
 HpVCs6SsL0jtCioaYH7q31JwEsPYXHU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030181
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

riscv_trigger_* APIs are TCG only.  Wrap the usages we have of them
in cpu.c with CONFIG_TCG.

After that we can move the header to the tcg subdir.  This will be
enough to get this out of the way for the --disable-tcg build.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c             | 8 +++++---
 target/riscv/machine.c         | 2 +-
 target/riscv/tcg/cpu_helper.c  | 2 +-
 target/riscv/tcg/csr.c         | 2 +-
 target/riscv/tcg/debug.c       | 2 +-
 target/riscv/{ => tcg}/debug.h | 0
 target/riscv/tcg/tcg-cpu.c     | 2 +-
 7 files changed, 10 insertions(+), 8 deletions(-)
 rename target/riscv/{ => tcg}/debug.h (100%)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d17ba0474a..a2887adf16 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -39,7 +39,7 @@
 #include "kvm/kvm_riscv.h"
 #include "tcg/tcg-cpu.h"
 #if !defined(CONFIG_USER_ONLY)
-#include "target/riscv/debug.h"
+#include "target/riscv/tcg/debug.h"
 #endif
 
 /* RISC-V CPU definitions */
@@ -856,9 +856,11 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
     env->vill = true;
 
 #ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_TCG
     if (cpu->cfg.debug) {
         riscv_trigger_reset_hold(env);
     }
+#endif
 
     if (cpu->cfg.ext_smrnmi) {
         env->rnmip = 0;
@@ -1016,7 +1018,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
     riscv_cpu_register_gdb_regs_for_features(cs);
 
-#ifndef CONFIG_USER_ONLY
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
     if (cpu->cfg.debug) {
         riscv_trigger_realize(&cpu->env);
     }
@@ -1031,7 +1033,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 static void riscv_cpu_unrealize(DeviceState *dev)
 {
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
-#ifndef CONFIG_USER_ONLY
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
     RISCVCPU *cpu = RISCV_CPU(dev);
 
     if (cpu->cfg.debug) {
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index ef0a8eae24..0ab613a298 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -23,7 +23,7 @@
 #include "system/tcg.h"
 #include "migration/cpu.h"
 #include "exec/icount.h"
-#include "target/riscv/debug.h"
+#include "target/riscv/tcg/debug.h"
 #include "hw/riscv/machines-qom.h"
 
 static bool pmp_needed(void *opaque)
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 885b4172c0..310c18db46 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -35,7 +35,7 @@
 #include "semihosting/common-semi.h"
 #include "exec/icount.h"
 #include "cpu_bits.h"
-#include "target/riscv/debug.h"
+#include "target/riscv/tcg/debug.h"
 #include "pmp.h"
 #include "qemu/plugin.h"
 
diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index 7818d81fb0..36d12b6a51 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -34,7 +34,7 @@
 #include "tcg/insn-start-words.h"
 #include "internals.h"
 #if !defined(CONFIG_USER_ONLY)
-#include "target/riscv/debug.h"
+#include "target/riscv/tcg/debug.h"
 #endif
 
 /* CSR function table public API */
diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
index ba5bc6ae13..3c0fe70101 100644
--- a/target/riscv/tcg/debug.c
+++ b/target/riscv/tcg/debug.c
@@ -28,7 +28,7 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "cpu.h"
-#include "target/riscv/debug.h"
+#include "target/riscv/tcg/debug.h"
 #include "trace.h"
 #include "exec/helper-proto.h"
 #include "exec/watchpoint.h"
diff --git a/target/riscv/debug.h b/target/riscv/tcg/debug.h
similarity index 100%
rename from target/riscv/debug.h
rename to target/riscv/tcg/debug.h
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index b73e3e9dd4..fe6350f497 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -37,7 +37,7 @@
 #include "hw/core/boards.h"
 #include "system/tcg.h"
 #include "exec/icount.h"
-#include "target/riscv/debug.h"
+#include "target/riscv/tcg/debug.h"
 #endif
 
 /* Hash that stores user set extensions */
-- 
2.43.0


