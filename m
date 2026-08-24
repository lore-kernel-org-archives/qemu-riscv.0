Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B66C5DF94
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 11:18:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wySgG-0001Tp-JR; Mon, 24 Aug 2026 07:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySgF-0001Sq-JL
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 07:17:31 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySgD-00059G-3i
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 07:17:31 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O99KHm2900986
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 11:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9962qy98qgv78VEwglyReKkX4KojPn8juYKMeNcCxIc=; b=loDqfDzF+qT5np6B
 uv7hRPJK525AtRMk1wD9I19ut8kklyB2D5g6a1mc5daVf0xmSkUgejOtjwQXIT33
 LBVuZTeDnojRjOEUkUVTqoQtn7A6+fvJiAkOrVMfTSLF4mPc5pJCGAEuLwML2XcZ
 pDvdNBmGSsC0QpuR5IwikSKIBzeYKAEzhwDuzCFSDjiUs2oOTyKnYMQiEQVDTW85
 jVkwFdwGNf1jF9oK0NLd74hz2cRz3tAdSQd1CDvQjmEtPZPAAB9ZFDNe0mg3iCJ6
 Lr3t+HhioSE84li4DpQWP9zI/Lg/AdHw07syuQEbrST/jqNU8McnDS3Lh+sFAjrL
 ToMagQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgrxv8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 11:17:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-52d7b3adda4so34892751cf.3
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 04:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787570247; x=1788175047; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=9962qy98qgv78VEwglyReKkX4KojPn8juYKMeNcCxIc=;
 b=awLzf/Orz44M+8FYlVTcin5LjmtxHUNJ3wLRkc9IQLmdO630fj0Es85pMoI8rOWdQX
 413RAM6VK2tSeo0bKOIc9yMYOnCWZ40kZNMZZBG4uOsTvFm0E5FtOUPQX0yjPXfqLuj0
 NkL+pYk2G3GuZLilJZKB+Rvt7uqFoG+j+S44PS6jtZVO0lBHwidgqvo1lO5C7wiouFL1
 aqglgiIOKPxaWLedWN/kszv///C6T5kniVszONZx1RU0Ss+zixj0qmmQzNEVPL61DRR3
 r8EHNUjzRJMoauNcGPrlos2RWjL5iUfTXuMwm8XrHYjJQ96Fml+uuzQwTj1Tv2QLolVK
 DsCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787570247; x=1788175047;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9962qy98qgv78VEwglyReKkX4KojPn8juYKMeNcCxIc=;
 b=arGCJ8rlMEmpd/baPsOOnY1NBYOpn06FVlXxme6NXeCDH1TaSrld1G41nZQum3nN5v
 Lgi4id6oZg3dx/tKHfKqrs4+nwfryKemx5sgFGqMxZUp1yVE6RtFRVq0+RwHs22KBuA+
 sPImTmCrDBGwvfA2iS27R1J6n8k0ZWIC0UG7xLKWnEQWJxkG9JUFZLKvsafBEQ6j+ht3
 PmP8LM9Ljb3TpIIc1odVehSXw0YHfaAWq+5LvkD9+TSNgybBT8n3kUthbXrzfej6BNoo
 yQW4f4FMcZReyltB9eo43931qOctyG11Q/oR49DkKi87i7sPVlneLDLoDVwOBpFvl/F6
 umPw==
X-Gm-Message-State: AFuF++ly49+e6tw7jnB2GHFxuZ1WgazTRMIVoc/tw8hB774LjfDzlCJn
 zFOQgfTQ1uw33Cpty11mgzS69wnsql13yRLnsuFjXmiN5bP+JOOCnWbJBpr68vPpJOvZ3VrVxJP
 jWaDyRpqoO16awBkmvIdHUb3KTjrfwtSSRS2BQ8J1GKTXNZWQDLrJXNLjqHPAJ3YcxQ==
X-Gm-Gg: AR+sD131cCyD08TdjQEUg4cNYFRceohvlDBmJ32js6OLHpcj902fVSeJntFxtX2Oy5F
 REqJmy6v4KfN6nOoOGaYg0BizGwxmEqSPr00NczK0TQNDQh7NuYMVmgiEIMC0pUZOSVMGxGB9g7
 GDOzoSJmr+Okbr0VijAdNC6cNYcvOUczVqGvnb3DyY69jkV1OyjFRy6n4gbaVuVbVkqx4beUqwn
 asnMZh//o+JS/G2amGdS6o+CN4ReAK875SzUW1cgTmodTk5OtufPbDbQdZXDLT4kXIXmZkwljX+
 flXBRKRiFsvdEqZ+LwSdSqdLm39O+r/5IOClI/LCIRkT8MbGc46+TdHjShqzmAdiNaDvNhbjEBq
 dG6sYNsEeyMaAZ3Dln3SchuRgCH+9nWG0OKq8I/pcvaGm8XYMdg==
X-Received: by 2002:a05:622a:4d8d:b0:527:7813:a439 with SMTP id
 d75a77b69052e-52df5a09808mr283860011cf.27.1787570247106; 
 Mon, 24 Aug 2026 04:17:27 -0700 (PDT)
X-Received: by 2002:a05:622a:4d8d:b0:527:7813:a439 with SMTP id
 d75a77b69052e-52df5a09808mr283859341cf.27.1787570246700; 
 Mon, 24 Aug 2026 04:17:26 -0700 (PDT)
Received: from localhost.localdomain (44.170.88.92.rev.sfr.net. [92.88.170.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c24966f9cbcsm1353929266b.29.2026.08.24.04.17.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Aug 2026 04:17:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 01/20] target/i386: Remove const qualifier in ptw_setl*()
Date: Mon, 24 Aug 2026 13:16:50 +0200
Message-ID: <20260824111711.26297-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824111711.26297-1-philmd@oss.qualcomm.com>
References: <20260824111711.26297-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX8hUnR8u3ykvB
 9W0aKiSjHlfQ2AlEVGsMdezdFtPCrxP8Dy5dI+b6/DdjrmEj8bgm6xJccR57vbZLGxHQ7hXXA8Q
 YxVxtMRx9/H2hp4O03I09hYFpgq5FO0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX13/vrduj8STn
 F95i5Lsd5SP6nnDmzgj6w1pCTqYOFXxWc6uEbjR5mvG8R7+WnitaIuNsWOlaTjvDrfIqrH/gI53
 tBk0ALRTHo+ZvQEiyvuyforaKvGHkJiCUNtzI8VYEPaf0n4d20ogWGus8vnHXhDD/2DKsjfDWOL
 7JnE2hCk8NjJhguOAdy+jalP3sMkedG0Y1tXEabBHnzGm0JlOiNoAPQdYLJGwaEn69sDieO2bsC
 ppPDRqX+LOpV9VBnx5PCzfYZXKHeqEVmZ8y3+ynRt/itBWhqKgUjro40bsPqEP6uu5OkOben5tf
 dH2HjbonwLRutauIe5e4oHxVqdz2as1Bkr6NzCReGaWAxjo6I+cspYl73gk4oY7lvKz7z1X7k8K
 eVnwHIGczzrppiK1QQ+UVzSRG/MSuJ2HZZA3+F1JsuG6A22zxNIytw1rw5Fv4pSx7svcfCJtS5l
 MCT3OrJvwY6lFR1ubgA==
X-Proofpoint-ORIG-GUID: V-4Q56Zaox7njeKz9kgAHixqQpw-Cj3G
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c2848 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=s1NLoHz9uzatdv2VNqxUSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6zyGMrF3NIoAil_mprYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: V-4Q56Zaox7njeKz9kgAHixqQpw-Cj3G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240094
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Both cpu_exec_start() and cpu_exec_end() take a non-const CPUState
argument, however here we get that argument via PTETranslate::env
so @in->env can not be const. Remove the const qualifier.

Fixes: 4a1e9d4d11c ("target/i386: Use atomic ops for pte updates")
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/i386/tcg/system/excp_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/system/excp_helper.c b/target/i386/tcg/system/excp_helper.c
index d7ea77c8558..44be98a3c92 100644
--- a/target/i386/tcg/system/excp_helper.c
+++ b/target/i386/tcg/system/excp_helper.c
@@ -106,7 +106,7 @@ static inline uint64_t ptw_ldq(const PTETranslate *in, uint64_t ra)
  * even 64-bit ones, because PG_PRESENT_MASK, PG_ACCESSED_MASK and
  * PG_DIRTY_MASK are all in the low 32 bits.
  */
-static bool ptw_setl_slow(const PTETranslate *in, uint32_t old, uint32_t new)
+static bool ptw_setl_slow(PTETranslate *in, uint32_t old, uint32_t new)
 {
     uint32_t cmp;
 
@@ -125,7 +125,7 @@ static bool ptw_setl_slow(const PTETranslate *in, uint32_t old, uint32_t new)
     return cmp == old;
 }
 
-static inline bool ptw_setl(const PTETranslate *in, uint32_t old, uint32_t set)
+static inline bool ptw_setl(PTETranslate *in, uint32_t old, uint32_t set)
 {
     if (set & ~old) {
         uint32_t new = old | set;
-- 
2.53.0


