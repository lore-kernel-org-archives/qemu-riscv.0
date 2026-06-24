Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1721CD4F26
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 00:07:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcB8s-0007OR-9E; Tue, 23 Jun 2026 20:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcB8n-0007MU-UC
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 20:06:54 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcB8l-0003AQ-P5
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 20:06:53 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65NK1CdR1259665
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 00:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=MZP7Zk3uinz
 rssBb/EnhDeb4UwEFQe3jIpJKUSipL5o=; b=R5z/PXsNNEO4LptcyIZykvSz17J
 /NBQAK1Y4Rye32v2sd1PmpZhWmDICvHVuhGCkpThy3FFdNI1U4rEXdJTE99QyQxE
 +SRtSKPJJqd9ruiwCkWG12QeAvNxgQPlnROBcDA1fVo27O3wQRrIPOpdVx5IkxRi
 0J0KrgdAJR6lPjrG21r3d3FBpbJo1u/Em7X8Lf7NfJZQnjmWf4jieBO7FdVirtUR
 jrarMBGdI3Wxw5BxdF7vh2/Q0WTizqaKfl7Dzt3c25ZxY3HMPm/QkPRZxiHcryFB
 Ndb8bvPYWiPoVV0n/XQXm10Y9Gi2WvGXBq+JAhTJejsSRvc7zcvYXQ7bDFA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvv3ve-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 00:06:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8cecf8bb835so7670546d6.1
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 17:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782259609; x=1782864409; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MZP7Zk3uinzrssBb/EnhDeb4UwEFQe3jIpJKUSipL5o=;
 b=YunjNv6f44ugL7a/0Y2vk+08yKJRTKo6PVulNoS8ZeWf/vUBESeJnHnHqd5BxVffs+
 QnDGQnPxxn2LaUA9K3iXNWhSiF1PYu270b4DGXjRHcwmCERRvniT/r58r+UFj41wPkKE
 ioy4AwqL0v2UmJR1htdbIDfewrUkGqCgQllxqKcnzIM+S+PWPQ8JJt2VFa+cI+h/WF/d
 fh66qyz+nMXFuqjkbSUfIPLihhYZRpEoZvofWEB3GiIlH87Knbe8fqfxKIdfzVgffSTm
 1AAX+K0bO33ethWN48HG6knN+jVO0sFJQG9HFmdx3g8+yg/h/Wl5g3m6ivjHyJYDCHEd
 8UkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782259609; x=1782864409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MZP7Zk3uinzrssBb/EnhDeb4UwEFQe3jIpJKUSipL5o=;
 b=E7Wncvrmdap8p1xKaOIAyY/XJAKFTXO09BOtc1frLmhAB01na6wfgKWU9FrrYqlYdc
 S24FiAl49lGFCOyJ3o6AuTiUCoRNKZ2RR5Sfd/RMvUagE3TFyKVWFxOsPNHZ1/EGckvn
 /U5anogY0d8SRJ0+0V0xPuC9nwOGQ9fQkR3NYoupFKyfVWzMsaWZmccsQXmmBCp7tobE
 Jp6aWdIlVd6HePXnHCbGqnRXbfIvdoTxhLdP9eFzXRVW+WjGBFv/CpfpGprRrsojA8F9
 5pxfoqucjZlyU3Wylogo8QvqnoJEYwEhuh6B7w7LgjknmJh3VwroRvgrqVZk7v0SA4Hw
 h1Zg==
X-Gm-Message-State: AOJu0Yz926+MGCd0DaAF7T5VwacNShMEtvCcAHdEFJp6NzypzfgyqZiC
 7SOelfiP+7nqqHb9FM+3azbNCcECy6Wd9x8ywEzLeEounnXvAnesU6ufrvHNLmBUXirpDEkc7Py
 p4aafRfHVp3ww3P4NpAQgZM2GiSfoqzSoP7mzQ6HU6I/0bb3Wf3TSa3ElhGP4HAcK3g==
X-Gm-Gg: AfdE7cnHEmMcYBL9muD3iNTwUqMywKQ2/nHAvl6IDQO9d5f7njDF02YTpgQ80N+rZ8f
 2WnVMfrCEKh7MzpBsnvDfg1hv8BDvWz2V6wpx9MZha2v13lEF1/LEeaRFAu8rU7Bdqzd15GXMYz
 7lBeORamBnvnMHfqEfkvXdiH+3IaJ/B0uhHgWsu/XlV1BassuDgssZNwOdeh70mOfZoC2uTTBuj
 FCJzgavik+taZ29Yyl5xvTiH8KRkCTUce8Hbrt+eEPZ6lxrHRJsmf+Cioh9CFF1IuhcbMa4v8/C
 EWK6IjHVgq5lSuJklxoCJlnHbJrOB7wEr2TSjbHazWhsQLhjq2KaJYPJE2XluHAYZIw/t11U+Ub
 j0UBTZcTKsW/eX1FxaJbsBmbcAUlpsURA4r5qyRuzj3DeIw==
X-Received: by 2002:a05:6214:451f:b0:8db:aa76:103c with SMTP id
 6a1803df08f44-8e400e0d803mr92193836d6.10.1782259609266; 
 Tue, 23 Jun 2026 17:06:49 -0700 (PDT)
X-Received: by 2002:a05:6214:451f:b0:8db:aa76:103c with SMTP id
 6a1803df08f44-8e400e0d803mr92193376d6.10.1782259608940; 
 Tue, 23 Jun 2026 17:06:48 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8df81cdec56sm142422976d6.32.2026.06.23.17.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 17:06:48 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com,
 fritchleybohrer@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 03/24] target/riscv/machine.c: do not migrate pmp state
 with kvm
Date: Tue, 23 Jun 2026 21:06:10 -0300
Message-ID: <20260624000632.2149359-4-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
References: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3b1f99 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=oilNxGZmbZYYRX1p_pwA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE5OSBTYWx0ZWRfX4G7TOEjJKzoa
 Qua9YPxjjVll8H1UNUDd29jsr1Z3mREdF3gFGVl5P44ZHC5LQ1saPcX9zR71XeG7wytxTJFrKHv
 My61nzqILgmHY5sAv/59mCgKbWDccLU=
X-Proofpoint-ORIG-GUID: n6qpPc0KDi376tHop859_UoCBgDeb-PK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE5OSBTYWx0ZWRfXyAnHi/T+CIVg
 pHIeLyIXTl/TK6oZmdZ6oL08pRnnRjj4ijWiqmqDh3twOTaHe7UblxKX5tc3j/J3KiO7KgY87wr
 GCQS9Hbk2H269fjkv902EH7HwDwy0aIFsSuiZXldyAAIkEUGCDvGur4vShUwcLIMDPNG4VMPa+Q
 cxulYj5n6B/+1gpzqL7FGWaNgzLqqRFQyqEzVaZJy2buGRGtKjhQwoXkNWm2+q9+9WK5FdANj6C
 mJKH84AZQfkwbMQix7t7L1CTi//C4gvZBENldc7qe5R+DwgFA3jzdz164xC3+A3304iQ3u6OLXi
 J1M5rhNDpacdwqlSNm6YFNeC9ESD9DpbtESmA8ex0/L6mhTYLbfhRFvgdjzDKej9XNeJffhCw0o
 iIoBZ+cF0QQ9ejQU57nvxxQUDTjvKA==
X-Proofpoint-GUID: n6qpPc0KDi376tHop859_UoCBgDeb-PK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_04,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230199
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

The PMP emulation isn't present in the KVM driver.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
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


