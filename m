Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A385606E87D
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 03:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YbK2MoVA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KqPcjbw8
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJMrE-0001C2-7x; Tue, 20 Oct 2026 23:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMqE-0007Ap-1g
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:18:17 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMqA-00039e-UQ
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:18:13 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2FPOx2566068
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 31qHRvuCzQ9K6ePd7hfaaxt30CRwnArdLmjIbTE9sdI=; b=YbK2MoVA2iAxu2mI
 i1OcKZIQYiunADMGklvayunO7PIwCg0lhRHxan5EKZNViJPdwn2iv/642CGcxTwJ
 k5t2Xr+o4wAgwpKKLMrzhHX8vyWpYkK0vXT+Om0V5y2M2I2XWwHU/4xpi/jpqj4e
 cuacg3Xr/C/Wr+FA/lEqBV/FouWp6PhDI9divKp/rifnvpANoL/DTxMQGQRIrby8
 EsfGr0Uvf9YaZE47b1u1jigv81HKxGSIzaBWTRkZy852ZbgDuWlOQ4f0O/BXS2rc
 xEysIkQlR20GM3L+lUHPGwU5+ulAMhdOJPin3ak2epIxMGzWsU+/+VkDWbk/1VwQ
 6A93fg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd23y7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:17:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93c5ab5c136so54696385a.3
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 20:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552679; x=1793157479; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=31qHRvuCzQ9K6ePd7hfaaxt30CRwnArdLmjIbTE9sdI=;
 b=KqPcjbw8AXu0r+ugmxG/aP4t/uiaXscTnOIFeBBXo2QWReIYKxXwbc7CJ1ILG8qP/d
 RJJqu6kY6cW4vmoJESRqiwrkCZyjXaKH9/fdkDoi/E4EoSvVkWRdfEWtbtCY7l24TCIc
 fAqbRIt9NcYrnzCyPQJ9sF9r93phcsE9Uj+WuSmj7welyo9gnMQO3fQeU88M99wv1UpL
 KS7/RU+7W0RhaII200pTdGw/RKOMNG1Uitf0pnDEFK9EG8xP4+knT5OcIzYYoJjvbyKD
 3kEzF30gx8PF0f1uxz4SLuqfMaQiVVN5CC2Cr8wvGDLRQ68ud8IE0Gd8LYEeq8WhDily
 I5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552679; x=1793157479;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=31qHRvuCzQ9K6ePd7hfaaxt30CRwnArdLmjIbTE9sdI=;
 b=ja+Ep/mJyny1SvcJEZhjlkJerFUBW3Hgz7o1ttpgOxENW+j9DKiv+kCQYLm01AF7f6
 5iKYdYtgLS/bYXZ002ZEC4O9kCz898V+trEyWbijTSYN5XjBDEOQYo8CtgN3E82B4nmK
 Nh5kS2AHz1YECCAM5+7Bd9fBQiG5/hMQidj/YRdgG7WB9u9QXAhKbCTr1VRCMN7y7ynv
 MvaRrP2zRkmONWd2Fcl62Xe5/gLPZ3DRAPHNtbvuUJh1ZnvOz3/rlb63xd2YHpkZRnsa
 KSXLJ6tyx9LiiIz1ieHAt86EIkNAxBHADrnkdMWr/GbCMxADPu2JNV7Xr7NRZVuEK6h+
 RIdg==
X-Forwarded-Encrypted: i=1;
 AKwUvByq52iFu2T+7DL8WSARbnuludHz3CDeH6zSjmos6W6njJ+AspY/hupBqgdKPs78LIXamWHIalBf1IaM@nongnu.org
X-Gm-Message-State: AFq9FYLPGtXiBNsgkLhjXkWU+sUJQozx+sAtx+ZzE18oQ9+wbGx4qf4c
 mnvh1xoUtkVDVwpjp+OZq0u0iZbAIgPc8+/be2ITSUV6XQzycb1wstMVDEpOhnTYDfiu35CBEMs
 WLnMBcMW/mQ1nyz3lTn22beW3AtHGdjdrw4LaPDZEEIciHJtoiTBPKBFeWQ==
X-Gm-Gg: AYBFou3XHySy2SDtEbzaAO2S8nhrPgJmTWGE9+qfwmyPsm5pgIbroMCtxgdrex8MqMO
 1PpuYs8OLHZhWF+pAZFmk5HXMFlI8IsMQ/CpW6d6MRo2BNmMrVK2ThL83YATu4N7qnVskMdNVql
 WTHqvewraZ4VvaFnsLwMQfiJ9E9XEn84k6KeBpIj2vu1Bd80I9F9JvtkKTEdIluktIjzR3En8bl
 BRsU5XyMnRhzrlWBFF/gFvH2IkXFYVmQGsi5n3k/AyX+YpeD2+zZ1w22p+BxD4BoF7pr8ztXBJn
 zVPagwuZX6Na39CiJuXaZKbfL5A23TXs9UN+tUZeTCbXrRDVPhBOQIIxKUpyQa+lraiDjDMDUPK
 qO5ZZN+w9YJN11eDh5cSH+DFCztkOg4BYv45lQVuC
X-Received: by 2002:a05:620a:2987:b0:93e:95ce:53c7 with SMTP id
 af79cd13be357-93f57f05babmr192784785a.4.1792552678665; 
 Tue, 20 Oct 2026 20:17:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2987:b0:93e:95ce:53c7 with SMTP id
 af79cd13be357-93f57f05babmr192782885a.4.1792552678191; 
 Tue, 20 Oct 2026 20:17:58 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1fb864dacsm41027025e9.12.2026.10.20.20.17.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:17:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 29/33] target/sh4: Use a static table in
 sh4_exception_name()
Date: Wed, 21 Oct 2026 05:14:02 +0200
Message-ID: <20261021031407.24862-30-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfXwE/Z2tmie8P1
 JX8mZ2rwfBmZuzqO1VUdr1oCVQNJ3Hv+I7FFdy3ssfemRC8Pfho51EeV2xn1ljA9bwM/RlNcPks
 8TuokguwMMm2xTxApycjc+gf4pP9ynfgWnXZyjnLYW4VeH5+PaLzNV6kL9wobQvw4VwmYQWtRP3
 9AjEvSVoQIhRQCW06eg/3XCxjq7+kfrGno3Ri18FwozpzNSdt1uGFnVX5TzJw7q3iHDFUaUG0RI
 BXYgIXHgYWcu/nkcwhMWZnv3s/ghUHkdA+61CNTYuvIUCH7zo714m44I6uj7JukydfSEQSu+Lzn
 JC04t76B36aRbE96OAglwkcKuvGiUq9EhxHmXj/EXFpRZghmoQOzSNQnU5bRPOXagZQBOx+5eMp
 orDf9VIKrl1RIPYWS+OtN7bJSHxv6oG6lDMFl1Lfo+h5N+K6vT0/UlomOZ2S9IExi23U7vgPAQm
 MypRaTedqsg++sut+dw==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad82ee7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=rdbtYueUxUB_busH31QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 2pprvHV37IqcCKnsT8RebpfRsrWnNDp3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX+ztwByk6A89I
 ah9b/+Pto1LsriEKMMMiQuRqPDqxt5m+HSMNQtIcsARv7+zChaGo+6Mjfu3Ywgg5gJQN4zTNJeQ
 gnrF2AoA1VhHM7TloEYcmXbQIW1Ow2I=
X-Proofpoint-GUID: 2pprvHV37IqcCKnsT8RebpfRsrWnNDp3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210012
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace the switch statement with a static lookup table.

Suggested-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/sh4/helper.c | 65 +++++++++++++--------------------------------
 1 file changed, 19 insertions(+), 46 deletions(-)

diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index 5856bab6983..a4f80b10d3c 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -49,54 +49,27 @@
 
 const char *sh4_exception_name(int excp)
 {
-    const char *name;
+    /* Exception codes (EXPEVT) are multiples of 0x20 */
+    static const char * const excp_names[] = {
+        [SH4_EXCP_ADDR_ERROR >> 5]               = "addr_error",
+        [SH4_EXCP_TLB_MISS >> 5]                 = "tlb_miss",
+        [SH4_EXCP_TLB_VIOLATION >> 5]            = "tlb_violation",
+        [SH4_EXCP_ILLEGAL_INSTRUCTION >> 5]      = "illegal_instruction",
+        [SH4_EXCP_SLOT_ILLEGAL_INSTRUCTION >> 5] = "slot_illegal_instruction",
+        [SH4_EXCP_FPU_DISABLE >> 5]              = "fpu_disable",
+        [SH4_EXCP_SLOT_FPU_DISABLE >> 5]         = "slot_fpu",
+        [SH4_EXCP_DATA_WRITE >> 5]               = "data_write",
+        [SH4_EXCP_DTLB_MISS_WRITE >> 5]          = "dtlb_miss_write",
+        [SH4_EXCP_DTLB_VIOLATION_WRITE >> 5]     = "dtlb_violation_write",
+        [SH4_EXCP_FPU >> 5]                      = "fpu_exception",
+        [SH4_EXCP_INITIAL_PAGE_WRITE >> 5]       = "initial_page_write",
+        [SH4_EXCP_TRAPA >> 5]                    = "trapa",
+    };
 
-    switch (excp) {
-    case SH4_EXCP_ADDR_ERROR:
-        name = "addr_error";
-        break;
-    case SH4_EXCP_TLB_MISS:
-        name = "tlb_miss";
-        break;
-    case SH4_EXCP_TLB_VIOLATION:
-        name = "tlb_violation";
-        break;
-    case SH4_EXCP_ILLEGAL_INSTRUCTION:
-        name = "illegal_instruction";
-        break;
-    case SH4_EXCP_SLOT_ILLEGAL_INSTRUCTION:
-        name = "slot_illegal_instruction";
-        break;
-    case SH4_EXCP_FPU_DISABLE:
-        name = "fpu_disable";
-        break;
-    case SH4_EXCP_SLOT_FPU_DISABLE:
-        name = "slot_fpu";
-        break;
-    case SH4_EXCP_DATA_WRITE:
-        name = "data_write";
-        break;
-    case SH4_EXCP_DTLB_MISS_WRITE:
-        name = "dtlb_miss_write";
-        break;
-    case SH4_EXCP_DTLB_VIOLATION_WRITE:
-        name = "dtlb_violation_write";
-        break;
-    case SH4_EXCP_FPU:
-        name = "fpu_exception";
-        break;
-    case SH4_EXCP_INITIAL_PAGE_WRITE:
-        name = "initial_page_write";
-        break;
-    case SH4_EXCP_TRAPA:
-        name = "trapa";
-        break;
-    default:
-        name = "???";
-        break;
+    if (excp & 0x1f) {
+        return "unknown";
     }
-
-    return name;
+    return ARRAY_ELEM_OR_NULL(excp_names, excp >> 5) ?: "unknown";
 }
 
 #if defined(CONFIG_USER_ONLY)
-- 
2.55.0


