Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2E8C5B572
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 18:19:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wua1I-0004Uu-1V; Thu, 13 Aug 2026 14:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua0s-000359-Eu
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 14:18:48 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wua0f-0002Fn-G0
 for qemu-riscv@nongnu.org; Thu, 13 Aug 2026 14:18:42 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67DFTj8M3707129
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 18:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 V1XUkcAOBdCmt+f6LujKVgOfRbrqLf8eqAKYfrk8/gI=; b=K4ShfWpvQbhhvufj
 8t/5NMf0CpYEEoRHoYloXGQt3OB4BRFdi1CWOEZseiPgULp6nL/HLmP1VgNLeNDA
 3Q8Qw3T3K3Ov+oBU+2GmNRI+pYcU+KxxWrV83QEPtw/vxP3dEN44ZsGozWGNeh9u
 0G6aG4sOZzqgyAAnzZb2DHLlZk4Twl2kQVJ8QJ3mD+/43iNcXSaEHtfbkPqQp4eN
 6kMmMxF6zu3JZUPSt6nTbP2F61n4dTRUFccn4E9RVjqnx1vo4Yomm/cNcp8q1RMy
 pGud0v+8ArXD5IHSq1LRVwTDa+QrKPg8uOid70ZnUuP9+Gu+bZcs3BUVLdufiNQq
 7DnBNw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g18c5k6mn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 18:18:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c0408254aso20258941cf.0
 for <qemu-riscv@nongnu.org>; Thu, 13 Aug 2026 11:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786645099; x=1787249899; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=V1XUkcAOBdCmt+f6LujKVgOfRbrqLf8eqAKYfrk8/gI=;
 b=jPU/CUMRvS+/+3SnFQC04tii9kZiwNG+P87E62snsY1jjhThM8FO/bWjMexuX7d8hJ
 dyot05wcQ4W+q074+qVPl1KuBuwCdf6xL44tZNMmtrvOSGxlctpct823XhlCukLhS8Bq
 WbAgmZhlnDUgnARqPtS//cQdSTYSOWcZnT27JKacolOEPZA4D9fFBPz1zf2vKMrcOWw3
 4H+fUwQBVuBD57GZlZyC8MRV67gUEseCnyuh5Vc7hjxq9JLxWS2cwiI4IBOQEuD47s2/
 fSCwCibwhB94ua0AqUvJhni9f3vPhwBVc6/4pIwfDxT712S6lA3Sw/vVcaQDc23oP5ie
 7dSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786645099; x=1787249899;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=V1XUkcAOBdCmt+f6LujKVgOfRbrqLf8eqAKYfrk8/gI=;
 b=oIdFRkbLo+4YZveSmBQCxstdlZkOsQmktQPGxlVDkBfPqpS/i0dyiF2yIwnZsklOT7
 LeaBSea7k2+TI4uhrt3fNlDkX4L87wUKwjIKbr0hgeKM7Cs+mTnyejjK787ccx7VsWO4
 dP1XedBvftxwgYHYo4Jip8qw3ThVH1V4/27aWqqcEIkj9kIPbtP2TSKON1SAvP9occYk
 J0897hIVMZRHmQHlrCpWpzDxKHssPZjuEbGpHy4ZhNUQkgeEChoOCxTW/8B4NOTeYrXI
 4UEfZsELFdL3A+HUEXbzZXFr5SBYomZR84+pxFtd84C4yucauIQ2EItmd2p6vgTTnpnk
 E1mA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrU1RwV40UoR1xyJQxzln7X83mAqLU4cuTQbAych128k4t7YugmzqqWCDwNcRxAJT9jWkIp9VgJVG98@nongnu.org
X-Gm-Message-State: AOJu0Yw7Ch2SvpZw8zEn3flIo+w24g0fxMlmL8hiA7Zvtbq91ckSwQUC
 1I37z7VrdrT+y9vkH1u3/cWND5cyRHY0skYvppeNPieIkUZidgGBmxmznaXhT516HoqSCiK0Wys
 GSiHiqnCMJtMalce5lJAWkslgdjNjXaJGRcPxf3U+9ERtAdXPA49MTy1wXA==
X-Gm-Gg: AR+sD10hS8PZd4MWKuqG3Jk/kh7x8Vt04fY/tez+eZqhnbcqkYU6F4V2ERtpPTth1M0
 myP8tNa5NnwuKLTzyioXspILWHN5uhN+GOfieVuzlNiL0BIzrPUUPsR/ZFRGMVGTAolM90lqm4a
 FrhDo1ZPoDAvJsCYWVvPsJIBFH+RkL9l+khE4naXCjNh1xehaJUfIiIXVagEZzPfgn9cxoZPcMJ
 c1Y8HzKA9Wt/P3Bveu1jwlMtn7p5H5+rxqjK1+vOxB67R01XlfC4OcsS1WRJ+57/as4jJzbIMqi
 IaHc3zk8UhTcTzmnLhwFPJ0ylfD0wshJyhtIcp6Z4GbKVQMHaftpKmidK1t4JVnF29LrOjbvB77
 I6eIl5LiNZbh3ngVrlkC0pTgXWAZbw6U5HwMfl4yk9Q==
X-Received: by 2002:ac8:5f95:0:b0:52d:6f91:86e with SMTP id
 d75a77b69052e-52d74b6c8c2mr77157151cf.15.1786645098801; 
 Thu, 13 Aug 2026 11:18:18 -0700 (PDT)
X-Received: by 2002:ac8:5f95:0:b0:52d:6f91:86e with SMTP id
 d75a77b69052e-52d74b6c8c2mr77156511cf.15.1786645098222; 
 Thu, 13 Aug 2026 11:18:18 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2005bcsm1289151f8f.6.2026.08.13.11.18.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Aug 2026 11:18:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Magnus Kulke <magnuskulke@linux.microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 13/16] target/arm/hvf: Lock BQL outside of the vCPU inner
 execution loop
Date: Thu, 13 Aug 2026 20:16:36 +0200
Message-ID: <20260813181640.6537-14-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813181640.6537-1-philmd@oss.qualcomm.com>
References: <20260813181640.6537-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfX09dzpEBsIylF
 SL4tGSnvtWpcYuMSySUThOlbJ4jl2yJ3sbXghabenwrl1PIt3sv6qicfHgmgVBo9vyL6knHSu01
 /zL8Q9N3hh5WgMjODJp5IQDhahfjSGE=
X-Proofpoint-GUID: mEbMEZCHJRH7-VXUl_u5YtrH0Y3HBMNn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEzMiBTYWx0ZWRfXy++OJ2NRsGbz
 0F+Lv/5oBHPexwsUJlwfCxGRiaJ72CrocERp91sF3qUsvNSU7vaA6Q/1BzuhkdL343Swfoibun2
 5LLIq58DdQubXvqiIsFeaQ3ZhkOshG9KmqpHmLo2gtN3I8Oac6MJdq1GQ9mUcowhpIx4JwDraIS
 ZgMUmShGtsgFjXs4i7eMImR4Dyb3eUxtlYBJVnXPm1vcWG19YMy1evyA2fKg8sY7wYTu0u4ETOa
 kSnjxadgEsD8/ru5TN2M1GZyKbKniwIUPC+mbV8r7KrqsRYjMk9HkudNHPR4YWkwRt/CdRA0Fk+
 MV0B5ohspS2X25973Tt2bDP+H3msCH9pviF12pCXsQI4Btt7LouxiHRuyt3SC0bXi/nQaSWrU6Y
 XoEK03gan+cE35pznoQ/JFz9KMYocCioJeVuXfWh4F/4kAqEuIrTjdzyYYlc4IU9m7l/nSpQnDY
 k+bEqCFH3kDRHArHJBA==
X-Proofpoint-ORIG-GUID: mEbMEZCHJRH7-VXUl_u5YtrH0Y3HBMNn
X-Authority-Analysis: v=2.4 cv=VebH+lp9 c=1 sm=1 tr=0 ts=6a7e0a6b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=WxR_XFPUuro4_54D_dQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130132
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

Reduce lock contention by acquiring / releasing the BQL
outside of the entire vCPU inner loop.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/hvf/hvf.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index c14ea54a67f..9c6408d2e25 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2598,20 +2598,20 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
         }
     }
 
+    bql_unlock();
+    cpu_exec_start(cpu);
+
     /* Inner vCPU loop */
     do {
         if (!(cpu->singlestep_flags & SSTEP_NOIRQ) &&
             hvf_inject_interrupts(cpu)) {
-            return EXCP_INTERRUPT;
+            ret = EXCP_INTERRUPT;
+            break;
         }
 
         flush_cpu_state(cpu);
 
-        bql_unlock();
-        cpu_exec_start(cpu);
         r = hv_vcpu_run(cpu->accel->fd);
-        cpu_exec_end(cpu);
-        bql_lock();
         switch (r) {
         case HV_SUCCESS:
             ret = hvf_handle_vmexit(cpu, cpu->accel->exit);
@@ -2624,6 +2624,9 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
         }
     } while (ret == 0);
 
+    cpu_exec_end(cpu);
+    bql_lock();
+
     return ret;
 }
 
-- 
2.53.0


