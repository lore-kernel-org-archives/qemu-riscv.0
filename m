Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5FEC624D3
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 15:22:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1mlr-0002J8-Bj; Wed, 02 Sep 2026 11:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1mlq-0002H0-0C
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2026 11:21:02 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1mln-0008SL-F3
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2026 11:21:01 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 682D51pd1076444
 for <qemu-riscv@nongnu.org>; Wed, 2 Sep 2026 15:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rWS7+0isPXzWm9cMRAgfswUsXMUQK605HjcD8US5czU=; b=V/5C4+vHy0Fjtg02
 gDJ8QaN9YSP/fttjWRuD1Dti8U0SC7B66bD26F5OZAOcjrlz2R6PY6U7W2XbNVzc
 9XJryUf62zJjYLIzgUHamm5fgSB45t9HDoEpG5VegDqS1QHvXh7E9q0F2YEY6oKN
 0nRLlvjcsyoWHySXw8GKVWzIInrlooEH01SImcA3g6e4/uJpGiDXeCO4uC6rf1NU
 kUY8/SWF485tm1hWfIznky0hRV3tgiBaaKzcGAi7g2gf3QTWv8AYoCNwmWOY/WrH
 3hl/Y38Hr0SmT4Itka8mKeHyBldv88i4jzCZPA0vGBRtzuNZM777HY/NTZy+W23Z
 9n3rbg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemce8j2x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 15:20:58 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-78489ad6d69so1051114137.0
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 08:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788362457; x=1788967257; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=rWS7+0isPXzWm9cMRAgfswUsXMUQK605HjcD8US5czU=;
 b=Z/2MnkhYNrDeBv9j1GOoAGKg0Li2dLpWJkONnwMifcKAj+D6WrFz6oSAk+EgWn/3Vq
 6Zkii6aRtJmiNmoRz7MVqqrkbXtwvTHUVCWMeSO6vhjcx0UWvgpqLm+dBs3+3axcjuPD
 BVVWsg0TSRJ0/kF41sJmn8LjQwaNBRILd9ZfDwfm/K2oI8IhIwJki6oFqaw9uBNUaT2m
 0FQbu22XlqjbtKqmLGT+d/VxDVLfwIbjBYyIYkkFMVkDJnjfTd9k+3AnkPENn4bJ/R8g
 EN+QaVqaH6Xv6dPH086a9hfGyZtaWrqdE5MKrwzLmxvBizql7iVofm/jRAro4NCNeuAe
 gLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788362457; x=1788967257;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=rWS7+0isPXzWm9cMRAgfswUsXMUQK605HjcD8US5czU=;
 b=f/HbxfsXKs3ee8sGRi2c506S5DE8sIyXItIXA+NwEd64nQ0TAVATQRAvzkbfWdhDiW
 JxXs88rjmiVgzZINRGwF3Itt0Ky3HfNVQxvtQZItV7M4sMSI5ziVhbWicL9HwDECCGvO
 olQ4lXSF92y/h5Jb+A36z7U8I0pnCgjgp2PfqDtu0K5prle09jByQZs2YJO1a9rl1cLw
 AKsIjK26T3vFuu5Ii1F8MDSImbPNI0QkD9LXFZGtTo/1uyfbfVFUS4fKqCNJDz/19eJ7
 ajGmHbhkigp9A21T2w49V+BNhm63ZRUEHIPl7ix82as1lCQ1GMPiRa9hWGx8lvLK8yOT
 WwVA==
X-Forwarded-Encrypted: i=1;
 AKwUvByBB9KThCi3gMFH6W9WJeEHf7M0C529KXySWx1838l0i4TynOAOgpdD1ZDLw5cFWtjW/lIfrsLqEFbF@nongnu.org
X-Gm-Message-State: AFuF++mVlpzxjQh3eAQHwezTS3t9CZQnIbobQaAgg25lDUbm9ISbtXlH
 POF/mo/jyjg/f3j5smK3x+WYQZQm5qm+3XfpZiv0nTK4W9C/61XB6yfJKyAHvgSjw0R+EQPqzrR
 Tb44WCcb1udYEDFWyrl+oto6ww54o9KDRy8zfYnd+N9o7lV/Cw8U1mFXBLA==
X-Gm-Gg: AYBFou0bXh58ZOjQscEjwngDHUm78jCRr/nDG3cXsWP9ysRx1DSSycR5BFxdal+eRYZ
 WAPnI1nP0nH0JFNzo9oHynfB0J1kPPFlMgwvRyxqq0hFx9Cu8j0XqYOR/atSfriRK5HDr7io4wQ
 eOoJPEfpIF5SKeTfZOI0CJUkCQXmpZO4BdLqbYBjUXCJ51cWqZmWshF8SoETW2o20GZ48229NoV
 +9SoOh+KoZqHblxlFGOczT/3XH/0QKXUN4crwhT8Kcwa7ovQvy+/P7i7FCtc1g+Jv+BDTivIYdV
 LzR0/EiAACwa/yptITY5gIEOGUlpAV7sxkpCUIrbyva2s73B6Ez13YkRQ617HKcQTKfjiAzW/MC
 p97WYWMeExmNEXtJjlI4jb5cn2EEknw1yqdHQ3gcB
X-Received: by 2002:a05:6102:5247:b0:785:a48a:e3b9 with SMTP id
 ada2fe7eead31-78a1f21a6b7mr2373885137.4.1788362456869; 
 Wed, 02 Sep 2026 08:20:56 -0700 (PDT)
X-Received: by 2002:a05:6102:5247:b0:785:a48a:e3b9 with SMTP id
 ada2fe7eead31-78a1f21a6b7mr2373850137.4.1788362456417; 
 Wed, 02 Sep 2026 08:20:56 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce5927b68sm62703165e9.1.2026.09.02.08.20.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Sep 2026 08:20:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 01/11] target/arm: Call arm*_cpu_do_interrupt directly
 instead of via TCGCPUOps
Date: Wed,  2 Sep 2026 17:20:32 +0200
Message-ID: <20260902152044.31291-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902152044.31291-1-philmd@oss.qualcomm.com>
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEzNSBTYWx0ZWRfX3WDOOz76xdSG
 B3x0T3IhBGmdiysyqhyvM2LYU+68kKZnsHC6iWAZOKmPVxHeopGG6sGx8MB6tROgP2FkecyPPqw
 UlV56NnQrSmwKDqJ58kpQCU95Ojq9IZAh8bezefP+IIhobOOF6L1gAYE+TQoqq0NFGdedS8Lup2
 8tVF/yN+k1XVvq1Uz7S/XaN6QKLM9zzJ7SfqNK2Md6JDguVxhnTyvRJKUaLs2Ei+xeQTfWLwnC7
 9vpJMoh88ZxV3xIej79ueQlH2xi3epjtGmDhr6j0w2cAhOM1e4TH9syyzHlzMVuea3LzuyO14jW
 HUiFshBHJE11sbBVN241lap5ZvLAQpLbfVKc0ZbC8LzNcIFEDE3sZOwHMRfMrEqqLRskAZJ/Qee
 /CoTjRRETE8iR9np3kDcGoRwOeWfBC+NSdpPlFsxKqMJkvTMXxYnNoleVQzKYaXCGpFN10FBV2G
 1bHqexkK20rpw47DAuw==
X-Proofpoint-ORIG-GUID: 70Q-3xFzzYjFvfIOfxZ59niTGR35REb3
X-Authority-Analysis: v=2.4 cv=QfpWeMbv c=1 sm=1 tr=0 ts=6a983eda cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=dCDxpQg89NXWVkCnum4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 70Q-3xFzzYjFvfIOfxZ59niTGR35REb3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEzNSBTYWx0ZWRfX7H/5EzsVnPcu
 bdbulkiPwfIp2XaWaiFudBpfMCGOwica1GAwCIbfAJuzyuAFA/Dde0yfV4eS5x5NVL573N3WmxT
 AwLw/ARPr8hfRhruv9FOKxtbeCJQi/E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020135
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

The TCGCPUOps.do_interrupt handler is a target-specific
callback installed for use by target-agnostic TCG core methods.
Target-specific code should not dispatch through this indirection;
call the ARM implementation directly instead.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/arm/cpu-irq.c     | 2 +-
 target/arm/tcg/cpu-v7m.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu-irq.c b/target/arm/cpu-irq.c
index 883e8a176c3..e8a6520e5ca 100644
--- a/target/arm/cpu-irq.c
+++ b/target/arm/cpu-irq.c
@@ -270,7 +270,7 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
  found:
     cs->exception_index = excp_idx;
     env->exception.target_el = target_el;
-    cs->cc->tcg_ops->do_interrupt(cs);
+    arm_cpu_do_interrupt(cs);
     return true;
 }
 #endif /* CONFIG_TCG */
diff --git a/target/arm/tcg/cpu-v7m.c b/target/arm/tcg/cpu-v7m.c
index 48b31d5eac8..502998dbd1c 100644
--- a/target/arm/tcg/cpu-v7m.c
+++ b/target/arm/tcg/cpu-v7m.c
@@ -34,7 +34,7 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     if (interrupt_request & CPU_INTERRUPT_HARD
         && (armv7m_nvic_can_take_pending_exception(env->nvic))) {
         cs->exception_index = EXCP_IRQ;
-        cs->cc->tcg_ops->do_interrupt(cs);
+        arm_v7m_cpu_do_interrupt(cs);
         ret = true;
     }
     return ret;
-- 
2.53.0


