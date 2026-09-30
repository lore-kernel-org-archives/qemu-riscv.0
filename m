Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94057CA5FC5
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 17:46:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xByNU-0006gC-5F; Wed, 30 Sep 2026 13:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xByNS-0006f7-3y
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 13:45:58 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xByNQ-00016u-Fm
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 13:45:57 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68UHfEYl2902252
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 17:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PBc1D2oz+JV1vmUOlpvPkS3S0H2UGK2jXUvplCDqDjM=; b=EAdZKoyLVYJ8HKfB
 TmfIrYRVvA68Bq5zCdXvaY/qlkeVa2O/BfAdM7FjOfml5bgvnV+LPbPV/PO86JIF
 V7yYZm2YQXJO112gfQJ5SHJ/qh1BYbxQubVCBjza9uSBMRzJy4lHS0h/uA6OFXam
 KNnWm2a+gW6rqXlGx/5NMEV3r15pWEqQ+3DszGC6UXBP/JIl8LNzBwxb29h69owA
 lyHYhY4dw7f7K/OCSwZ3j38UFNbuPg3IDxU3IhI6YabffOIwOLW3MaZZ42r6AvOT
 XhUhteCGgSnToKcZp9P9icM/3il2aZqcaLGZSEECyWicjkaKI1pcjtkvvwmb2Sdb
 TmcePg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c2rs5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 17:45:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93cb6391e89so23256585a.1
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 10:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790790354; x=1791395154; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=PBc1D2oz+JV1vmUOlpvPkS3S0H2UGK2jXUvplCDqDjM=;
 b=B0zoBlhq4YqrYKsLsdiQrioIi6hQfwFaGi3fHpSAZ/7dP7xLuHQ1hcEnIscSkCnl7h
 Q7IPlxfNt9XRrXGRuy4NGyW9jp2W7i5i0Hs7UlcC2/jwdAz24A8o+twwKGzvP2JyGMCP
 Ti9pK65bj/BThxUiYgZ4N3HWLBx8cuYf+FQH3laae4OyA/NI2/qZX7iUU66yCeedZ4Ls
 0nNJ2VeFPdCp08wK59+0G9xYmEuV8lp9dU07k5NdcNJX/k/yM/yxXNGyDLOp9YFw/Np8
 hli10ns6mzdA10cG7VW9OQQbCsHZ6GgaYRYct0qtOu9dB2s3jnFM3g4sCiu8CMq+Sg7U
 E+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790790354; x=1791395154;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=PBc1D2oz+JV1vmUOlpvPkS3S0H2UGK2jXUvplCDqDjM=;
 b=u4OhZRi/w+WhY2TR0LAGy2y6vYfTKfmHVpyF0aCAYY14HD+FQ9TwOFq2VccaF0/RiN
 7CHUTqvlPgvlJOKgQ2WBMOlgpx73CzT0JM6CefDZhjD9J0VFNDzXWjv9iEhoM0kjO+Gw
 6iFduTacxzZ9VDAClB85DmGH9mUAhc/7j79Ieyhv0DVbuHdZ509Bt7dfMn8Uokjj8yZu
 M2N2PEszxbTUyUCFsvA87b79I9NS8ggzoXPqFBSXC4tHrqxQP6dk7FuEjSeo2qr+ETRB
 /vHmt6v0DO4IqXjf940mFeW+dVmvzTVlmLR9sI+Wd39OYdLBVhqt/rOahsS/YcURf2k7
 atQg==
X-Forwarded-Encrypted: i=1;
 AKwUvBx8whh5Kc3IcGSyDhhg9xVfz8X9/OYtsl7h8gD3krUa9n7zbQ2gTud21j6kgtkqWEeddxmD1ZpUjKI8@nongnu.org
X-Gm-Message-State: AFuF++npYsJf5LkRm9Y/mLEPYZUI5Bh5QSZuszYRouVSWHEIinff1O3u
 TmKJiDQttTVyop5MJsACK1uNjK4j9mYp4F/gIEX/zXmjsLALGULwV9bvKHiHRigW6/aWDCjWxQ4
 FPg6Nkgnx/eOFxlCBaHt1EkXd8CJya4WQJ/CgHPMq9vmzNb7HfKerV4yMSg==
X-Gm-Gg: AYBFou3J4mqdWOCCyfKDrK6501Qwd6fMmDkwruLYSYmhVu+qyO5oWy+vCjohEaQ3B+u
 EUfXXZryYMQKHnkyaI+tl5b96AzutDG9CEfJNzQ/D0yompo7pGPSAnqX1Fjr2QhDC2vFJnM4tah
 Nq5zvwDyN4O1V2hRkHOqNcht+OZWrkv2QN77UD4EzI2V1sEd5gLijjt3UpDCWiuZFcP2vk41gub
 fHK4tH/n59hBeY+OPOzCaAXqA+Cd83lOppx9yVv7ErFmCgrxc7DasRjGNp+Pjs/lEljbJxyEukB
 rLZlkV0VZQEkRYJLdSsro1qDyS/coSTAT/O0lPuev7+R91AmXVnLTc+nvkDyhwgC4NdEYAMz8Wr
 1xwBpgB1zSVjkAaGgdL+VmICz0GFeC+nk3pmC0jnl
X-Received: by 2002:a05:620a:2686:b0:93c:7a5c:77d8 with SMTP id
 af79cd13be357-93cabf2a172mr343988185a.4.1790790354097; 
 Wed, 30 Sep 2026 10:45:54 -0700 (PDT)
X-Received: by 2002:a05:620a:2686:b0:93c:7a5c:77d8 with SMTP id
 af79cd13be357-93cabf2a172mr343980885a.4.1790790353412; 
 Wed, 30 Sep 2026 10:45:53 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b068bc9b1sm702103f8f.4.2026.09.30.10.45.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Sep 2026 10:45:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 6/7] target/riscv: Access MIP atomically
Date: Wed, 30 Sep 2026 19:45:06 +0200
Message-ID: <20260930174508.81497-7-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930174508.81497-1-philmd@oss.qualcomm.com>
References: <20260930174508.81497-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3MCBTYWx0ZWRfX2Z6uWSv5Xuy3
 YtUf7VTN2KcqSuIRlsn4IBDTidItM81LmDZN4zoC5DRJWMRZM075wWDta2wTEWnD+2HpKMOUtb+
 i2G7RxIaF14AM2yiduDqQ3RqXPSzX8M=
X-Proofpoint-ORIG-GUID: ZLK8vzUX4uwh3lUTxljF_TeB56Mo1YOb
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abd4ad3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=snbnvTbt-5-dSQZ-83gA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ZLK8vzUX4uwh3lUTxljF_TeB56Mo1YOb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3MCBTYWx0ZWRfX3A82aAhcRpRy
 sV31qxlEQJ0eHfh9c84GpiDZnt3BTinuMPsG10e8C2tdB/812bNIbG6D5yBfMlO4iccyrvp8YDy
 gZMnheOnoDV4JpNTebgKswvyrRCrTLdxY+IwCZ6/MqDdITwNdiMEMRSuSehHJzbxG5JFmhKjbU1
 jKgB1+jzmig1F95xep68DdS0Ar0d1DJVQ3E5L9zQLcFwZbMEWGOrbziG4yOufM6xGn1kmSwdW0b
 UPFCSZ6aDlFZVtARBY7+N/WxlNZ0rPb1ICMTTd+fwdhH+EjE/uzhaHyuEkZ2SfWpbr8mJ88evBC
 y2K0/f3Q3HUbX5yzOubA/zQ68Xv7SmnL7cqtiM1Jl9QzTH9Gu6tbHURz2f8BrzGMvpj2pQ+Zrc/
 7pZX2JW5CKzsUZJwmDt4pTLtppAYnzbURSGc9uXnoOb03MuwqgwSDDQRxXTnqF2URjzb8T5ynnU
 1iV7tBCYbjanJz2mQIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300070
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

Make riscv_cpu_get_mip() read env->mip with qatomic_read() and
riscv_cpu_update_mip() store it with qatomic_set(). This makes
MIP reads and writes safe for riscv_cpu_has_work(), which may
run without the BQL.

Reported-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.c            | 3 ++-
 target/riscv/tcg/cpu_helper.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b8d6f992ba4..45e82fc30c5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -22,6 +22,7 @@
 #include "qemu/ctype.h"
 #include "qemu/log.h"
 #include "qemu/guest-random.h"
+#include "qemu/atomic.h"
 #include "cpu.h"
 #include "cpu_vendorid.h"
 #include "target/riscv/tcg/csr.h"
@@ -956,7 +957,7 @@ int riscv_cpu_vsirq_pending(CPURISCVState *env)
 
 uint64_t riscv_cpu_get_mip(const CPURISCVState *env)
 {
-    return env->mip;
+    return qatomic_read(&env->mip);
 }
 
 bool riscv_cpu_has_work(CPUState *cs)
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index f8f779a01d8..db7f2bd6de7 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
+#include "qemu/atomic.h"
 #include "cpu.h"
 #include "internals.h"
 #include "pmu.h"
@@ -584,7 +585,7 @@ uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask, uint64_t value)
     BQL_LOCK_GUARD();
 
     old = riscv_cpu_get_mip(env);
-    env->mip = (old & ~mask) | (value & mask);
+    qatomic_set(&env->mip, (old & ~mask) | (value & mask));
 
     riscv_cpu_interrupt(env);
 
-- 
2.55.0


