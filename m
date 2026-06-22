Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A817ECD98F2
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 19:35:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbkNX-0000Xc-NI; Mon, 22 Jun 2026 15:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkNV-0000WU-7x
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:32:17 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkNT-0001pF-Cu
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:32:16 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MFVdjN1082088
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=AZWlSGpH+zt
 vHihs2CQRxejyQo0DP9CWkQJ0wjaKtzU=; b=Cl1Tho4+u0Df4zipa7Mkuasn/yn
 K9U8uaygIEqMM0U6Z5l3YpCnyEJSQsJxKYNNtFNzDo55wkj2Qb6QHFIp38FbJ7Sv
 MCVDR1OdUq0oqx3EI9l7VvtkQBhyeyejqsRpPF3uSiOiAxgJoweqHr/RGfweiKIf
 vRK0H6896EQ7KWie76xfU9Q7QuyPJlk1w1wByRFQprnjd6JOZJi1L4+64aPIRXZQ
 kzwO+qiZRlub7gGgEiK1YvptJsv3pDw16U7mCh+ELoLO50qPmeLmC6/wgHTFca6L
 534mpXT9ZAivI4trAz3xCOzcQ7xL8f+lNS/eBtAc0vwhmQr8rO6qV3eVoXg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey2yja2f0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-915ba226a9bso1102847785a.2
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 12:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782156733; x=1782761533; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AZWlSGpH+ztvHihs2CQRxejyQo0DP9CWkQJ0wjaKtzU=;
 b=GbB7yqB4idoSPp3/BF1VPxwGODwXwvDlNC7WJ86k40dx4eA92E2tzQZCFXg+NBsMVn
 VlTAD6FhTGtS8D+LJwuFu25O4dijLEatvGVjp8XBO10zAmjc5/gKviFVVwoLcW/JFuiR
 ay7d7zXKR78kN1nAEh0/K3upD6HohjedP8g6o7csatYQ66SZHF4BsiUikRM/1CLzv9kD
 LnC4Z8Gh2ed9Y1R34OfVykrLOlK11Em9Xaj/FGAJobAzaE2HYgt5sPNnSGbCOzo0NCtz
 dfuvcPJ09rhYkX0rJDY4dnebfjVUkEZ82UKTXreI30luycCGLgx9ZIhcwpyLivZXBBP4
 Ds3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782156733; x=1782761533;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AZWlSGpH+ztvHihs2CQRxejyQo0DP9CWkQJ0wjaKtzU=;
 b=JksVKdxLdBwZnMZQFmmPhzvv0NkLb35+tzIejGBChpwSgiWZMNd4J4mOQ0BXTkAzyt
 9rafaeJezpmz+C/Y8df+qQzLJntKZ6TLSFAfAA8JxCvbaxVnC2XDgDFm7nsWi7i7J8qS
 dp96CqapasKkf+s6Uod31pfZsaDJfAEq21o2VIyafYrrTpjQWUog0iX/QhG8RuqSGj3/
 y/u0cZYH/NUXaA5E5TMn1/soB7pehbiY7RPYIkf5op6pUKTry4WFOKF4qNAX5mJeKyrY
 R1TGiLeAlURKzX0T87xNxnsY6Qa5wpwIaXe5kRkpIop5mrPE8EnQAgWgsufr33rVajQB
 v3IA==
X-Gm-Message-State: AOJu0YwnlrHqn5ovjiEYtFWKVuKv2vcDQGRU4H0GEr+83IRO9hNuPpBC
 IVRZADZbfvZXtiesfqOtWhIxLZ5F1/imIcp2h9e2xoWhJAa9Cb1mkb+nQl4TtOr1lSzO2XixN7v
 fQEUcgSWFaxskcRUSitFzmlPNoMjXi3WEgeLdGPLof0K9dN87X4Abp9+MwA==
X-Gm-Gg: AfdE7cm9cCz2rLXPlkEBN8jXCHJF+q51vh+61qqBW8YzEqF3XY5i27cpLoLguVwxV1g
 /RJOcvMyTb2EGwNav1mE7Tl8zhbvu4UDqqT74mTj7NN0SO6/dbPKKn0Jp36lvEd6BifbeWwd7sb
 PbQu34APAn9OqEfrFe3860xM/M/jX6onp8JktFZ21NjkWtvbuzDP9FICaH/kv0OhmIgssnidGEy
 iLv7QI4ApP53Q1oQiNnF1B31b1xF15PVmVOnNGYDU7shZxEVKFGwrPuxAvt5BfwN9jAYlz5Q+mq
 z0BmZ/qCGDG/ZhsOyVuWOVtvHJdaCLd/WVKY13ltZ/sO9quBtQhFPLi+HNEeupF6Wkr/l6bNA0F
 715LSGLiHaR8Hcp6jP8gwiZ+gWxXnvRR4uhfhR+W4rsH47A==
X-Received: by 2002:a05:620a:40ca:b0:915:6cfc:5018 with SMTP id
 af79cd13be357-92093131f92mr2755054985a.58.1782156732934; 
 Mon, 22 Jun 2026 12:32:12 -0700 (PDT)
X-Received: by 2002:a05:620a:40ca:b0:915:6cfc:5018 with SMTP id
 af79cd13be357-92093131f92mr2755050285a.58.1782156732435; 
 Mon, 22 Jun 2026 12:32:12 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-926004ab49csm61489585a.34.2026.06.22.12.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 12:32:12 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 philmd@oss.qualcomm.com, pierrick.bouvier@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 07/24] target/riscv: move debug.h to tcg subdir
Date: Mon, 22 Jun 2026 16:31:23 -0300
Message-ID: <20260622193141.1449724-8-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JaXPJ74dmlOv1fufh57N_nfVul82Ukfi
X-Proofpoint-GUID: JaXPJ74dmlOv1fufh57N_nfVul82Ukfi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfX/NQWK0ebLj3k
 lQm0VXliKq2fkk7820X7hcF/7KSVslHX7i6duu5Bv0pYDH5XZEdqT37zgdspjY/EkhV7LZ5eQ/a
 UgOBosTBL1pQSZZjSNDYmpUufNNMk1I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfX+EuVndM9MBwB
 71z4TX6lfO7jkiP9agsWMNGrXPtyjW8mqVtfhocN3WktxcFZd2e9Lj84APWzhFySXAriGX78Ey6
 B8TH5JBo5ZeHT78JBUefLecxFFPVPoBUo0xlikkYjl0yy6KD3/yGZhJwQU2FeiwX1luOqD42HW3
 /38T0tBSfGKhxxNeMCmtXGMKh9taMihylIUEMxgpa3olyKzz/JW/J7hTr0gvp1gLqX6ehoKD/xa
 6Gy6PVS8HPrx2kgYK5U2gt/gdgmfVTeSwbq63XWObbu8vUW1BlbyI95rBzY0qc5H2roDtey8cg/
 4SQO4blOmQwyRBOOaqwogBEGEQQSOHKVmqTdn+CCgIDFPmp+YySOG/rtbCcl81qpqCSFvatO+HP
 klUnnotMgypwyFtgse0S6bdEAMR49VzRdHZEO9BUpLs3IXWzDbVSIo1OAk1WpIr/NZNwavP0J4D
 Etnx6XaTB6lvEAbxejw==
X-Authority-Analysis: v=2.4 cv=YLSvDxGx c=1 sm=1 tr=0 ts=6a398dbd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=tQvhUsybbcJyJE2uAKwA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220189
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
index 0a7e6f6ed0..f999042178 100644
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
@@ -836,9 +836,11 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
     env->vill = true;
 
 #ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_TCG
     if (cpu->cfg.debug) {
         riscv_trigger_reset_hold(env);
     }
+#endif
 
     if (cpu->cfg.ext_smrnmi) {
         env->rnmip = 0;
@@ -996,7 +998,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
     riscv_cpu_register_gdb_regs_for_features(cs);
 
-#ifndef CONFIG_USER_ONLY
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
     if (cpu->cfg.debug) {
         riscv_trigger_realize(&cpu->env);
     }
@@ -1011,7 +1013,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 static void riscv_cpu_unrealize(DeviceState *dev)
 {
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
-#ifndef CONFIG_USER_ONLY
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
     RISCVCPU *cpu = RISCV_CPU(dev);
 
     if (cpu->cfg.debug) {
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index bd93d6f3a8..4d89486cad 100644
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
index 59edcdd370..9293d61024 100644
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
index 7fb0ad5bc1..b460860409 100644
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


