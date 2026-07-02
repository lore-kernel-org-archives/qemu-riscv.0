Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C90EC43327
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 13:52:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfHpT-0001ac-Mi; Thu, 02 Jul 2026 09:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHpR-0001Zd-Ap
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:51:45 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHpP-0007yI-LI
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:51:45 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 662D0nC2522511
 for <qemu-riscv@nongnu.org>; Thu, 2 Jul 2026 13:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=XyY0RFtgZLm
 voD3I1ou+Mc+YGrMUCbU1zECcqBiE4oI=; b=JEfcoyzcFpIlzcn+yCkuuqd3tuE
 3VCvaPbMZ2hg3H/9viPJIm4GOpf0MUoDLrl1PJESFWlqu0Hz+39ci3y48daVFzYa
 a705FDwOZplbO2ev5uCUOBNv9+ijzCcZPC6bzBjtnN7hntOlkmED8uG7X/TnNC7d
 T/Mu3OIq1/8XAjmYQkK/w1pfg11faQh+b3B1PXnjFk//LnG7PcuUcjsZPeWJ+38R
 kh32X4kC40jKMFIrBOChkpsZe575sHenVkIUO47VUGBOOo/upnI9bZrcvqmfvq/o
 M2bpqsl2DWazBr7lkcM5MScu5o572REqbS/CAWs3bgAqEUFea9llW3OA/7Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5knc1gfh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 13:51:42 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-73c040cc990so611364137.0
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 06:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783000302; x=1783605102; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XyY0RFtgZLmvoD3I1ou+Mc+YGrMUCbU1zECcqBiE4oI=;
 b=IhDJ0SF7zDTvQrhWtxYkzIigKglP+oU8yEdAEDNQxqvdWTJcG1dPypmR9kJ9AKGn3B
 cgzSmhDrJInxzVQZ3Hk1By6E/vu3eO0M+OGiApbq+YZ3yGlExNmtMc+cZpggQNS3JUZK
 ui+M0H6ebQb06ia3aLNey/RHJ3RLBDZpGe/WPI+r3Sc5Op6BqhZ4bOOsS6O9FCMmMiAh
 JROREGHQHK7LJg1+1/8gcot702PlgV0+aJoBwkyAb7mpWdScSNzxkXQpEjb/z3gZ4mKZ
 18M9inHWMZpykVImX6t+p+cubng0YXoKvvXBm2Qtmjzc3tQ2hVNFiELOQ/m0g6Gq9zX3
 nitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783000302; x=1783605102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XyY0RFtgZLmvoD3I1ou+Mc+YGrMUCbU1zECcqBiE4oI=;
 b=KuI8lVoWscwITUhG8Lq7zZJ+kOuqZ43sExXOBQP9/gi4PfVDNqJJ0IeqElgUJIFuPc
 KkCFG3UtV68OL70bDrTxBHLBEfjwBVUMc6xSIirz7hOnVLjvFBCXeGOY/Sz6kr3jliXE
 eW8Vw0yKlih3mAzFmjD1kQpeVl4KwfwqlF+pcrDmq+Gcc0hAKq5yDpoHto5VkyzvQUqz
 j2QyHe3Dd/iaxWMvUTTEKhfN+4E9Rmt/9tqa4QEwgTASEY1OogaRAW3e/cUSwqG5khT3
 du7ujYhaSq4qQGnu2T3kkdnBsMvCDkYal6aHNcEP7rsoIrNJPgOgv8I7uoAp7hPOy4j9
 a8AA==
X-Gm-Message-State: AOJu0YzHSYxqakZwjqI7kRSV2EGy2JkMZQLParDGzetGWoxo4HdgSQP+
 hSiR2xKbxB9pyQoeA/yy9MidF70o5W8ajafuBzMyLb4IKVdqb/IoCnU0rIFN3xHX3y1rSGfI65w
 tP2NMrRK30NBDf+v0zNNKWh10AUiu48Qf3M/y6qyRS1k716CSrl8SJKFMZg==
X-Gm-Gg: AfdE7cm5hXTa5VtjmCGnF5GovAfc6sGPsCEgNh7z8LNEHKMoUwi1/c4iEk6ujGDNm2N
 o1isS9oEpEiVA71RTXvV6/h8ovRDTHObsm6q0tzEUPh6LlkHylbDFQXQJGNIiv/+aoBUbUdy6EQ
 yu60rAotar5dcfzEtD+Fk3ElJjWSPKy41j5utwoQ5R3S6ldSuQooA86PDwlmFMxIIj2vK4jwYS3
 4pCCQduwtpwuLDRiMombqwMA84bGzMhG5vj+LMM2LwHUIPPwC+8l+y6hw/hRRzt0sS1tJROJqwP
 MVlH7R3xlczolkgXwmP0yyCi3owInm0Nl+/GrxvyAehJRN8m1mQ7aMP+SmJUVC9/VtejcYGh7AJ
 ZK2lb0bEmuI1KxfMRLdazKtIDh7TWl6YKXzJapI/MIjCY4A==
X-Received: by 2002:a05:6102:5984:b0:737:783d:1900 with SMTP id
 ada2fe7eead31-73dbdf3d358mr2279878137.9.1783000302007; 
 Thu, 02 Jul 2026 06:51:42 -0700 (PDT)
X-Received: by 2002:a05:6102:5984:b0:737:783d:1900 with SMTP id
 ada2fe7eead31-73dbdf3d358mr2279864137.9.1783000301512; 
 Thu, 02 Jul 2026 06:51:41 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-73e1c4e64a3sm1276462137.9.2026.07.02.06.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 06:51:41 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 03/24] target/riscv/machine.c: do not migrate pmp state
 with kvm
Date: Thu,  2 Jul 2026 10:51:05 -0300
Message-ID: <20260702135128.1188021-4-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: v8jXUbmFAhmRCVSRc6rqZYZIwb79JIM8
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a466cee cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=JF9118EUAAAA:8 a=pGLkceISAAAA:8 a=Ho64hfXBz0L1xPz3edQA:9
 a=crWF4MFLhNY0qMRaF8an:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfX7nVG/S68Pwzj
 ZYiNIWg0OV8DTMrnEzznboINbwSfuU7YS6/YywWGWvOnW7tNmFM/UPAUKz1CYNN7zFd5UTxdze+
 M0k25Cv2GsGCSQSc7g9BcRcw6o2koqwOc7VvozhS92yUVvXIckG0+HX4m+K9WdMjLur/D/FrvtB
 v24bgMfUaxRDKaOCLhqQEDID6VUoZXXeeLaZ/KDvIvldFHHiNR8kWw/bMoKSbAwO4Lp+eHdBR5l
 vCHP/YcDoohnmXFsMbpNert07yVbYtHwpN6pXkKpz9xpeTjMoT1tl1O6MCkzzC5tuKArv/WiuDg
 4ijRQ+5y5r1ffxYM6nZjeRrLV1LqoFM95IxQm/ftpW+G5TPJUsIUXigcnRR5SoC0QyoVdcDAAye
 ZighRu+akXk7eSBs3OyQTrRaNMpgvBWjDN22TFWjiTj0TgK+uVRkLGfJJ4b3DQXVhFJt6QZT7GW
 xK8CIMRXlmogpnrD0cA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfX3HuUaZdd5oa4
 lhoT11hsE1pLXXNk6XUGDLCWgUYwP/c8VyWLY4SYiCfxKswR2SXHPJ81Mol27NMIad16z9WOHvj
 XzpoeGnjzKj4JHUTm3ODuAwhceu6x90=
X-Proofpoint-GUID: v8jXUbmFAhmRCVSRc6rqZYZIwb79JIM8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020144
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

The PMP emulation isn't present in the KVM driver.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
---
 target/riscv/machine.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index ba96ceceef..e1cbcaa349 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -20,6 +20,7 @@
 #include "cpu.h"
 #include "qemu/error-report.h"
 #include "system/kvm.h"
+#include "system/tcg.h"
 #include "migration/cpu.h"
 #include "exec/icount.h"
 #include "target/riscv/debug.h"
@@ -29,7 +30,11 @@ static bool pmp_needed(void *opaque)
 {
     RISCVCPU *cpu = opaque;
 
-    return cpu->cfg.pmp;
+    if (kvm_enabled()) {
+        return false;
+    }
+
+    return tcg_enabled() && cpu->cfg.pmp;
 }
 
 static int pmp_post_load(void *opaque, int version_id)
@@ -39,10 +44,12 @@ static int pmp_post_load(void *opaque, int version_id)
     int i;
     uint8_t pmp_regions = riscv_cpu_cfg(env)->pmp_regions;
 
-    for (i = 0; i < pmp_regions; i++) {
-        pmp_update_rule_addr(env, i);
+    if (tcg_enabled()) {
+        for (i = 0; i < pmp_regions; i++) {
+            pmp_update_rule_addr(env, i);
+        }
+        pmp_update_rule_nums(env);
     }
-    pmp_update_rule_nums(env);
 
     return 0;
 }
-- 
2.43.0


