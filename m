Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65057C43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 18:10:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfiHp-0001ey-Ed; Fri, 03 Jul 2026 14:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiHZ-0001aM-0L
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:06:34 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiHW-0002C6-97
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:06:32 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 663HiX3N695798
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 18:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oV/rrpKdOo1+daXKPVWuCkLqM2UYYttxN4Dv4KcC4nM=; b=mgb9f/z7xEyo6ZHy
 M/giZCDDOKuCr8TS/t0Y0Ym1UfV/wc9UNvxizyAm9ch4GEmjtM/CGKX7/LLBJPbD
 aOxrnKGLtkaIslVr4TyKntTsHX366PsTYh9X3SEnFnz8fwF2t0+HCEdAsm8TohZ8
 SBZUqT0MnP0avS7+N0pBqL3IGr0hlGjXhPtXOm8KZ7hGGpt7Oob5aaF6Bxn0Nrb+
 Tjwgevi2xpNHqHK+fJ02R1ToxHtBpevpANNEBvqZkeIe0STsXoKFS0/2h/zEKWIh
 BBwwtqn+nmSiIrYsBcJd03g9bXBq9tf4HD6hPJMRsLv3TuNAqnj/ZtbxYlYSMoct
 pep15w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6a849uw9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 18:06:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c0408254aso20078021cf.0
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 11:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783101973; x=1783706773; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oV/rrpKdOo1+daXKPVWuCkLqM2UYYttxN4Dv4KcC4nM=;
 b=ZgCBKMPQLSodRMlvLTtFrBVfYs2p+1nzdm6hH1qzNM7IBHlX/tp2DZUfG0Ko/SSMp7
 Xe43rV6sxgDRrzyd5XaFSBpMD+C6kpuqIECG4CfODmea7H0MVh/jzj5cNnIb1i0qDXso
 8IP+esJUQig4UtJBXNrau1ebZc/9whufXMppd+naxEaHmVGE9V8KgcsNNHhO3ZUx4lTe
 m0xADfy2uFgaJNqEV59hMQK1vdOfNM1inBXlXL/u92gZN4Aq6AwJexDawmAWogIqzbCf
 0xEa2pWoKmmDHfeODzZcfDnBYVjMouuX4uKNQAr0qcfrHG4/ElZuV9wygfUz6Z8JON6K
 Q94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783101973; x=1783706773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oV/rrpKdOo1+daXKPVWuCkLqM2UYYttxN4Dv4KcC4nM=;
 b=XWK/du844qu1B2svzSlWVqoKy8IchRRzgb9KTqBImaatpJS7CfzSTbRx+rX+LHC3AF
 y2y5gZtrCEF1bHaWrpFE1vXG1LuuhNVwreeUo5D949riRYs4xs1otdkHV3qKYXowI5Gv
 lUTXSGbwd97LlSjacNq0Rk/zmMGYXdAP5pmir/aZ6oWbWr3uhAQgGvayRiP3XI347EsF
 4t8YzQvtxA3lCwcBB589wCMxSskdYyx1mdWrCTnGIg/famlw3xIZDNjxL8asAcskX1D1
 t26ynydCVWNSEa/cgQgAvyoo0hcwQv7EBw0CXFaw6IkPNuPSORcD+Vtg/Ywp01vlQ6mJ
 8hqw==
X-Gm-Message-State: AOJu0YyEZWTvrgvOYQ793QCyZTuOImm2AiGPw86IIbof9s6z6xxMAJsL
 MR+5VFEreaExcelspiZcR6NOsgsPEMO3zqpVJWiqo2HaU3HlVVK3Q+23J5MPosh5oMGPSa+eYR4
 /h+e3/VHezWCFIZ74D/jzo/JxU6S+yf+T93eRkaTlt6Fcz8J3yVugZsWYDncX9V3ytg==
X-Gm-Gg: AfdE7ckwUDIzxhUdSGbIJQXT8VHX9BoPTOVP1UrCE5/gJZuNXuT6cSe1QwhZepip8Fs
 VsliAwVAgTJG0QQNwjjWGSbFeWqF+FCPbUsYWkJ/x2ygESVds8FSAXuGlxSRpNTbGXBZeDvjNfZ
 nwxH8n7dVr20cn40rei9CcZ3JEZCpzbJGDb9UCMsIBV9eQjo3wQGPV7ZHvYh3VjWj8bCZazZND4
 KfQFloNKf50rImId5dnMc+HOO3OjpsZbJ+/c4rFme9u7IQbQpU//IgO2t6/pE3eLYItmIDWuG5Y
 UmTX59t5t8WI+0f2VoJKeCjHwdL/houZdP0sPzJDzdJeAoTbDyu/i7mT+o8v7VHNq9m44RDZJeG
 AtnLn7OSk0nfOQ/6EPwLJFmedHLQzqA2x4BOJ3JE5+Cg7RQ==
X-Received: by 2002:a05:622a:1104:b0:50d:a8bd:dc07 with SMTP id
 d75a77b69052e-51c3c359523mr63632361cf.35.1783101973432; 
 Fri, 03 Jul 2026 11:06:13 -0700 (PDT)
X-Received: by 2002:a05:622a:1104:b0:50d:a8bd:dc07 with SMTP id
 d75a77b69052e-51c3c359523mr63631581cf.35.1783101972857; 
 Fri, 03 Jul 2026 11:06:12 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51c41d2d688sm22560081cf.17.2026.07.03.11.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 11:06:12 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 10/24] target/riscv: move csr.h to tcg subdir
Date: Fri,  3 Jul 2026 15:05:22 -0300
Message-ID: <20260703180538.3346781-11-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
References: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: r214zWVTeSpP_elAUpUMuCa7_OE01A27
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfX7fJL7pgb9x/T
 05KScc5oTirrvGEuzaxG332p/H4zM/SqI7NY8uew1jBOjkjNfDO904NO6hTvyEopXBtdRT6u283
 tlxzBlL6p482OE4y6VYWKModFjX2AJs=
X-Authority-Analysis: v=2.4 cv=a6QAM0SF c=1 sm=1 tr=0 ts=6a47fa16 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=82-PFmB8izlBMBISFaoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfX9+yEYFUwVhaY
 CGXQxOHz2HOOumuzwQjoitO1uptN+H6AIR1SqrNAfAQJctRlkqTWVofLkkRcPf/Hlgppp2hOrfQ
 9zv1f8DNJj1Q9v89BvWMHowQk5PQA1ftK5g/uGIFHHrDHZAmrUwbMplSYzNBQY3I18QW/hQRJxD
 mXRkrdaO10jOkVzBiQ0qS054fXBOIrZekNyomL0OWER8j6DfikcTT1uKCSRi1roLooZA7Yo60JN
 l+nroYPmEWDUB1n9uTNtqwn8MYOUpnZvty03sgUe4wT/POpEOwMxhf2Wa0VzH6RKngYYfexouCA
 hi+i+CBX+g39Acawxe0qODk+zgCUhK9faoWVyuVMnVxZtEGJk+gPkox0XNlAKLzXJtAttS4HRH/
 2QguCwjeKHsHehyxasAbwFTrX9hUE5HiBWLsA6VuCGNt4R3Y2FhWEglGQeMwZlikW6GzSMVan0e
 8W6q4iq5ekNFJ6uZD2Q==
X-Proofpoint-ORIG-GUID: r214zWVTeSpP_elAUpUMuCa7_OE01A27
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
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

After KVM is no longer reliant on csr.h move it to the TGC only land.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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
index ba75c0de39..c5b03847bf 100644
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
index 9c7e9d0e4b..36f2004bc5 100644
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
index 6d4849b135..ba3c7da375 100644
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


