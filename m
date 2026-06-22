Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5F8CDB466
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 19:32:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbkNK-0000QN-Vd; Mon, 22 Jun 2026 15:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkNJ-0000Pa-MD
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:32:05 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkNH-0001mI-PA
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:32:05 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MFX7iP1591652
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=iiBX3jB3KRa
 aFmijhkaFMDZ7Xd5BoK+FVfH4I41MbPA=; b=liu9Sha6UbzYQpxXqA+RDz3wT/Q
 N0RDtfDiPY4EeV1Nzd6JFJjkrF3kQey+WEcaFm5O+FZvNrBNIQk2mVO2WhdtPO4G
 aXuaRrSYGSc4D18LPEJB9FGDDw8eI/vaglZAqLXKMkrBG135KanZ0W8qFTuCGzEd
 Y5vF+FHzWozUHa2/9inZfZfi1NtY/eaBF19HHErPP/1zM4PhkOgLrcUWBiElJH+C
 TAQC/nlMfzIJNjQ8pmNBUEWPZkI5IOuy3knvf70KY+PHhrPRvjx8B7FaWnoZr5L5
 bsFSsb7g51y9hfPkc8myNzbD/wfajInQcLWTUNA4cmslKMBeidZ0ydbjnRw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n41dv6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:02 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-729b2604603so5084373137.1
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 12:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782156722; x=1782761522; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iiBX3jB3KRaaFmijhkaFMDZ7Xd5BoK+FVfH4I41MbPA=;
 b=Fz2YAlcIilZ0qJ0E3s5l0qPoFpYTX6hSw/JcOJFxhzjBKk2++8umAFsVTubb36vfeQ
 TkDCzHuSd2mD92BoJ24PWap2HpJGKEQBJOi/vySpO5Kk3MOvVXcOHuwzjS1CV1p/nhbn
 15EVRvRf26KxOWFBh4bI7OQK8IkHFjkPYDsDDq2hX7ZlRrrSBA4RsbSZxjqHnpVj/84i
 ebpz2KBsYsoFUJXwkP5uwBnL/o4bEa1iG7pS+fAd1akQOJK9ZXUsiu7ygQHx7YmJSg0Y
 0WoffUxYdunC/BAevRDKUzddYMEJ9MQS7YK0LoBgghunH2oH2dgpZkG+ht4j1zCi/Y61
 GaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782156722; x=1782761522;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iiBX3jB3KRaaFmijhkaFMDZ7Xd5BoK+FVfH4I41MbPA=;
 b=Zvcv5V5RFWYJEGzxP26crjmQO51Q4lHXDYk2llDCzOVgIvXMj3Tp7rI/5SkvOy+Qeq
 N3BuKPX6naf7lLrrxli6+MR75sAH+kl7cT80nuapg1MH3BW5CO6usbjEqVSXGRymQtks
 BeYynu1U9nTc3/sAzvOXWf4ZmxTIhbgq2OfcELeqqiCFuckc0BjQ1xKLnT6mV4Tot/q0
 u3i3g/cex5nnpYncOjLzM57a5sLCMJd2CdCY92lHdScSyUlo6/5X4JxVI/zUEqfvJY4I
 ykl2iyjXoT9qGgJXt5fcoSlT7ijc9I7eIIXdHaVdvxXhA3hrb1p8+7WPISlSZm+veNQU
 R6Ew==
X-Gm-Message-State: AOJu0YyqDIsg/831/FgkmKUaCjhDBlHy2ZWo0QyvA11QruW9ke2w2XSB
 puLhNYUrJd+4puVcI6Dvkb8+XHImS3ySEoHo6Rli8IN+//Lrvij42XlaNYZ+LAFGVWV/BfSaHbr
 x5K0EXjTX9bKACw+wcx9LI+H33/gr6ZuCebGLR6GfchdMCoylXKmS4qTBng==
X-Gm-Gg: AfdE7ckqHsdepfHOBrAarwTUErN5poJQeymXeNJkQSUsfDDgjRkBawyIZGA4JMSTtqX
 xs3mJ+Z4cWZ0cTsKcVdZCAUwrnjIwgwsWZ8LtbskIDoK2176KJAZVq4BxDyAxRpCGKs05pRWV72
 QKh6QMLSDwTkYE76f2jy+5XKRz6vuHQQkmxmTExn9hFH8oYWnnNbAvvOQ/v77Splx3yw9dsscm4
 8SXKE2XbcMwM+58F2IqaA2xDsiDIsIRsHnie+iYl/7svr90jUzXpC0H2afz9l23HoMw+Rf0DqRU
 2wXVfj2BB8Sz6MbRoQczHbl4bxz2iQZsYkwK/n3252qmOzH6C8DICKR022kfUbHOnmlkhgWOeh/
 c1GWn4wQ4XIVsugOKsS6YxjCz+UiCJcqdIy3N4mlPu0/6vQ==
X-Received: by 2002:a05:6102:32c3:b0:631:2624:e5ec with SMTP id
 ada2fe7eead31-72a788646a5mr9834131137.16.1782156721962; 
 Mon, 22 Jun 2026 12:32:01 -0700 (PDT)
X-Received: by 2002:a05:6102:32c3:b0:631:2624:e5ec with SMTP id
 ada2fe7eead31-72a788646a5mr9834027137.16.1782156721306; 
 Mon, 22 Jun 2026 12:32:01 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-926004ab49csm61489585a.34.2026.06.22.12.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 12:32:00 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 philmd@oss.qualcomm.com, pierrick.bouvier@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 03/24] target/riscv/machine.c: do not migrate pmp state with
 kvm
Date: Mon, 22 Jun 2026 16:31:19 -0300
Message-ID: <20260622193141.1449724-4-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfX5LdUtTVDwImF
 X92/ZrkXJAKmpJhOZpZv6yaoJgpriUQyWUDzSgogmjYXXBFDXtTm9nnwHWWLqU3BWDOXd9GPsL+
 ziEy8kmuiOKrJYd27VWVNBe4hyQWupM=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a398db2 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=4aX5uSYTwWxERF7RVPIA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: SsPc4lkXZ9_k5bhTrwljHPx-IP16Azag
X-Proofpoint-GUID: SsPc4lkXZ9_k5bhTrwljHPx-IP16Azag
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfX0OdE4c1jb7zJ
 GlgApINn0ReyWUTLzd34m8FScfvO1M6kUKLX4QQTP6iFgpqipEQsOqRppVeemfrKRa1fwrAVntL
 Xj0rSVZCGX07yn/qu1aSz5ZsRjWlCwcdbP9pLx5Y6k0eA9QlE05+IL8QHLZbwB3fWqHMZFg/4OQ
 va5T5g2ja44BgeiOEteBxJbE9r46pq5QCzhmkxzI0rfsuAAWxK2cLucBDa/eqsFRLeC5LLg7LuT
 heAVuc06agGw3/jAvjPskPAiLfi5RlgH2NN4FWiMOOVOuIhpPS5S7rOKkfccNtKr5v1gyd7P6yU
 9lnWaSAkMuk5XncifOKiM/Eowai5+cq/e/qmvC0nlv2VQsicSpFPyIzZdx1AsY5c4ixpO+vBL/5
 1zkPFWjGGjeyB51C3hcUHwcjv5qOsHrEYzBi86KDn5uoH7HGW9wBMG9jcg3gtFNXuyOaV5tB2vO
 bJ/BlPgMO2wCYDlRRnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220189
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
---
 target/riscv/machine.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index ba96ceceef..bd93d6f3a8 100644
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
@@ -29,6 +30,10 @@ static bool pmp_needed(void *opaque)
 {
     RISCVCPU *cpu = opaque;
 
+    if (kvm_enabled()) {
+        return false;
+    }
+
     return cpu->cfg.pmp;
 }
 
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


