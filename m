Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CEECDB479
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 00:08:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcB9S-0007X9-SB; Tue, 23 Jun 2026 20:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcB9F-0007UO-Fj
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 20:07:21 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcB9D-0003D2-QE
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 20:07:21 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65NK0YbJ999908
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 00:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IxPWJh8zmFovY0aWY54Yi7sQk2Aa12IwMKCPVPgpVmQ=; b=OSkLF9Tcz0N4lzlQ
 JyFkDw625brarS+qfGevQOoQYcKmtxXhvSD9AJJHKmyU+ATGrAk6RJFeurR3bWji
 YZvJkvPY1+mYwX1KyAfjw7hCvp/EAV7J7WeI7EP0zLsHDf++GqWave2tIi4MmGDE
 MC8uIUBrOmYxc0gHMgLPyGAf+V/JzC6pXtCViKQskT7l9epa8iukBLjokp/ddBZ+
 aAVdxMLNWFGAxTg5OAqBgGYC8Vb1rXBfe81EiNVCn4LtprthSAkxMBAjtOHlLKIg
 KSBlpeTEZX5glNseBk+o9IKzDL4CGtTsnFh8fOZ9LYBIPNd0Ug1f2dd/KU/6GUAy
 f90MPw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr9yu4d6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 00:07:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8dd6a429cb6so5787736d6.2
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 17:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782259628; x=1782864428; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IxPWJh8zmFovY0aWY54Yi7sQk2Aa12IwMKCPVPgpVmQ=;
 b=TdTWl/9UvORQCiX6fK2pMvYggY+oWt8iXWnwZmVdd/PZ6OLWAk0z6f1t0Xh2Om/gYs
 IMVyQ8r0Pvq0LymAMeyrin4IhBTnJLt/mVJliNcP4Jok7HAcdb3Tyt3GOJutemgKBI9W
 3+Pn9Xt6Uec0ocQzwNkxd/nxooq7+i8uCBtx2Dcq/oTpgAaWrFwYJA7hOeY42eqYfqCL
 ofxJGJY5kP93mRK6A11xv1JElteXFpn/WUtUbYfb3ZVDB2Khf4rGal/t+53jhwh6CZE2
 UYjgZgVW0m3Evodxreh9b8LJwA6+ZxTRJjWEky1lFx/mQGc0+mz0Omw8N1yBthHXI10q
 dXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782259628; x=1782864428;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IxPWJh8zmFovY0aWY54Yi7sQk2Aa12IwMKCPVPgpVmQ=;
 b=hQwX4oRoo0jnzhbFTqdrdqLNmk54LJn4vSKp/AH1jmXACvD1YvK76QfT+D4OuYral2
 dwTWYFTXASXugOCMwRauIgARAn5BZUw/eBXoFdgj29P0yAEwyMstgAJ1sqUF4qLHSzNE
 LUbfg0xoRObPmacL8l+0UexjqdRE7zrRnncidHfiQSDsWspcfjFQn3vpoPSTfE9nKPKB
 Y0V2M6auT5cI8SvDKN1B/qa0UMn7kGCOstIAGazQj5VkzVD7CeCmJ44Ud3nHLN+AvpEN
 FeavKEJUhjWXvf/6NA/22W5Rs+rmxo/WqRhsEVznN3zrWALhkSJ/CLAtLuzF41MAHSKL
 oQZg==
X-Gm-Message-State: AOJu0Yxdm2DNUqHo4kl5BMsskNaiwvh7VNY8j3ZX+LB+NRimfZ/I1sWR
 YYdFnpsnxzh2r9yfRZeKxGnurNZE1DrlvN9LjWQSU4eons2OJJdsmEUr1Mrcfj4Pi1Dmb2U6RA6
 WBUvT2NxyU8riyaaK0gueKR1ZQrd5Mw7551utiSPRry3YYQDPbZdf1S/9Me56QdgSrw==
X-Gm-Gg: AfdE7cnIU2xgp8mKO5J/YavE/urldM8/tSA8uTHyWs55hIUeUO1ES7w6nIIGAAzrwdA
 CSAD1wwuVz2IY6osj/666S0AtLJIk7XIst5UFuw6jbjCTzS2qVcdIAipFmPt7HgaDNv5fpPstkp
 TgOFpYfh6mThJcrID5NTp/OLTdRHGJBsBbx10Rea1IaC+sEoYN7xNVe6JRZ7OoFP/YCX5h5YBFT
 f8KA9vEbCK6z4ttiWlpMEXvLFACJeVZM3vKZM+Cly+aXlX7+iVIdJm2ODk+kFZ/HRzvN2s9uGlT
 kC2EClztX9ffPIYHTReYfv+ZNHMBv1NBaTHlw9AZFok81s4KHsfg072v4MdAqcTW+BRiCZaegJw
 SV3+eeCkN3kVmQt/ZfjWuIYdVeXEWVBQCUemAZlhyCRra6Q==
X-Received: by 2002:a05:6214:230b:b0:8dc:f889:d67d with SMTP id
 6a1803df08f44-8e535eee784mr23167496d6.36.1782259627895; 
 Tue, 23 Jun 2026 17:07:07 -0700 (PDT)
X-Received: by 2002:a05:6214:230b:b0:8dc:f889:d67d with SMTP id
 6a1803df08f44-8e535eee784mr23166726d6.36.1782259627394; 
 Tue, 23 Jun 2026 17:07:07 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8df81cdec56sm142422976d6.32.2026.06.23.17.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 17:07:06 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com,
 fritchleybohrer@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 09/24] target/riscv: move csr.h to tcg subdir
Date: Tue, 23 Jun 2026 21:06:16 -0300
Message-ID: <20260624000632.2149359-10-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
References: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JYSMa0KV c=1 sm=1 tr=0 ts=6a3b1fac cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=82-PFmB8izlBMBISFaoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: aBAtQ9c3PTS8VtYlnntZvtn6wJWyTN8R
X-Proofpoint-ORIG-GUID: aBAtQ9c3PTS8VtYlnntZvtn6wJWyTN8R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE5OSBTYWx0ZWRfXziJKswi6O77X
 a44+x5iaSuPCmBkDswmlifq4BwNijuk+e5oeLfavVloMURnWwHF9DDjBLcJsKsK91Oq80L9PDWN
 3BibfuWEb4jQjiv8HjmcDCOUwN+vRlYQqG1Oto+IeIH/GnJi/ZZ0C373PsbSwG+VxVUqX8UGqhx
 43AGIFN0U/ek8M8mJA2PWfcX3ZE/y3X01YKOgoPVjDM7Sa96L0q+jm9Ir7IYyGYY6/mRlk5Q1as
 SbBmmbVPxAizroUPSuYUmT8bdF/VKdcc/TBDg4KGInDHHtzLQeSMEQPFDcrvKmnBmf4EIONr9vy
 jEtefVFjDhTyYSgKGNhq3IpsIA6u9EmddQ7ArrHqa76yL1kybEOP2+zUxKTgEb7IcHhSrOYVTTU
 0ZbzYhGe+uKP7t6rtKsIE6zoCnobMcITr+iHtjSXTpd2vzGnj1Yi3/SsAjuZhFxXTe6tEudCYTW
 7wReeL6MTX1NPgL2W7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE5OSBTYWx0ZWRfX+fmtafRAqZzf
 EhCaGC2ipA7mhzjD3UhyDHaZpKYUkCxojzw2mXaK8TgzMPS7vtKIrOOM1GYg6zc9yoCIyfn4DRG
 0wgnChCTfXq05RVoAQpqd+Trgvu4E0s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_04,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230199
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

After KVM is no longer reliant on csr.h move it to the TGC only land.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/riscv/cpu.c            | 2 +-
 target/riscv/gdbstub.c        | 2 +-
 target/riscv/monitor.c        | 2 +-
 target/riscv/riscv-qmp-cmds.c | 2 +-
 target/riscv/tcg/csr.c        | 2 +-
 target/riscv/{ => tcg}/csr.h  | 0
 target/riscv/tcg/mips_csr.c   | 2 +-
 target/riscv/tcg/op_helper.c  | 2 +-
 target/riscv/tcg/pmp.c        | 2 +-
 target/riscv/tcg/th_csr.c     | 2 +-
 10 files changed, 9 insertions(+), 9 deletions(-)
 rename target/riscv/{ => tcg}/csr.h (100%)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5d44f993e4..96c92de2ee 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -24,7 +24,7 @@
 #include "qemu/guest-random.h"
 #include "cpu.h"
 #include "cpu_vendorid.h"
-#include "target/riscv/csr.h"
+#include "target/riscv/tcg/csr.h"
 #include "internals.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index a2bbaf7f07..f0a5e0d86f 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -21,7 +21,7 @@
 #include "gdbstub/helpers.h"
 #include "cpu.h"
 #include "internals.h"
-#include "target/riscv/csr.h"
+#include "target/riscv/tcg/csr.h"
 
 struct TypeSize {
     const char *gdb_type;
diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
index 7aacd1d89c..f8042db9cd 100644
--- a/target/riscv/monitor.c
+++ b/target/riscv/monitor.c
@@ -22,7 +22,7 @@
 #include "qemu/ctype.h"
 #include "qemu/qemu-print.h"
 #include "cpu.h"
-#include "target/riscv/csr.h"
+#include "target/riscv/tcg/csr.h"
 #include "cpu_bits.h"
 #include "monitor/monitor.h"
 #include "monitor/hmp.h"
diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.c
index b94e8391ed..2647deef91 100644
--- a/target/riscv/riscv-qmp-cmds.c
+++ b/target/riscv/riscv-qmp-cmds.c
@@ -35,7 +35,7 @@
 #include "system/tcg.h"
 #include "cpu-qom.h"
 #include "cpu.h"
-#include "target/riscv/csr.h"
+#include "target/riscv/tcg/csr.h"
 
 static void riscv_cpu_add_definition(gpointer data, gpointer user_data)
 {
diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index d447204721..572a39d660 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -21,7 +21,7 @@
 #include "qemu/log.h"
 #include "qemu/timer.h"
 #include "cpu.h"
-#include "target/riscv/csr.h"
+#include "target/riscv/tcg/csr.h"
 #include "tcg/tcg-cpu.h"
 #include "pmu.h"
 #include "time_helper.h"
diff --git a/target/riscv/csr.h b/target/riscv/tcg/csr.h
similarity index 100%
rename from target/riscv/csr.h
rename to target/riscv/tcg/csr.h
diff --git a/target/riscv/tcg/mips_csr.c b/target/riscv/tcg/mips_csr.c
index 609718f288..884030e91d 100644
--- a/target/riscv/tcg/mips_csr.c
+++ b/target/riscv/tcg/mips_csr.c
@@ -10,7 +10,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "cpu_vendorid.h"
-#include "target/riscv/csr.h"
+#include "target/riscv/tcg/csr.h"
 
 /* Static MIPS CSR state storage */
 static struct {
diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
index 775fd431d6..003f6ebb31 100644
--- a/target/riscv/tcg/op_helper.c
+++ b/target/riscv/tcg/op_helper.c
@@ -20,7 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "target/riscv/csr.h"
+#include "target/riscv/tcg/csr.h"
 #include "internals.h"
 #include "exec/cputlb.h"
 #include "accel/tcg/cpu-ldst.h"
diff --git a/target/riscv/tcg/pmp.c b/target/riscv/tcg/pmp.c
index d93563c36b..41b55519a8 100644
--- a/target/riscv/tcg/pmp.c
+++ b/target/riscv/tcg/pmp.c
@@ -23,7 +23,7 @@
 #include "qemu/log.h"
 #include "qapi/error.h"
 #include "cpu.h"
-#include "target/riscv/csr.h"
+#include "target/riscv/tcg/csr.h"
 #include "trace.h"
 #include "exec/cputlb.h"
 #include "exec/page-protection.h"
diff --git a/target/riscv/tcg/th_csr.c b/target/riscv/tcg/th_csr.c
index 431f4cc286..e6f642991c 100644
--- a/target/riscv/tcg/th_csr.c
+++ b/target/riscv/tcg/th_csr.c
@@ -22,7 +22,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "cpu_vendorid.h"
-#include "target/riscv/csr.h"
+#include "target/riscv/tcg/csr.h"
 
 /* Extended M-mode control registers of T-Head */
 #define CSR_TH_MXSTATUS        0x7c0
-- 
2.43.0


