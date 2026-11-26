Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82069606A31C
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 23:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YoA4ihgq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Osjc9Sdq
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWj3t-0003K6-Rc; Thu, 26 Nov 2026 18:39:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj3X-00035b-5p
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:39:12 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj3T-0001Gq-In
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:39:10 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJwAPu781882
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UgHeI5HKxGDMHp/30iu+FcDW1BImaAv//42V+y+PM9o=; b=YoA4ihgqXNoq5Upd
 xhFY7zH8mlpd37OX4/NZtP0LCa+mgB9ynf5XsUg8p6KDkqnnF/0dxHy0aoLAiVR1
 buOEWUUYCxEyNf9sTxCifOUmuoXpN/iid+fpW4Kv1AJflSmknNrkDoUmR76Y++/t
 DtFEFCPyPOTmfImhSc7WgNTaqEoYX9sZJVnAZC0EjbV/fkCQQsX/3tC+F9FvEkE0
 5W7+IYXdi5V944P8P244IzSbeJOOl7AILW5rBfOhPZSBIDXhvRQtdOUlDQpk649x
 c4lTKDx2DlU3ZjaYULUkGEiVXMzj1qTTW4fFpUaIpjtaKYUVAqOwjZHrb0TtfojV
 7pY0Yg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm82mbe-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:38:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-9496ff065bcso1004133785a.3
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 15:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736336; x=1796341136; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=UgHeI5HKxGDMHp/30iu+FcDW1BImaAv//42V+y+PM9o=;
 b=Osjc9SdqCwjpdlx4yyVger9RZtkfiF1h74TxNikpMZtWp9Fd27YeFu6woDkiO8WRvC
 rh+LhfhLkRW4YWEcp+NZYZ5d143VEMynWGJK3YIFKygsG3k9SSOGig9qOhgLWC5fmYUj
 ON5eJ7Kuk2Rff1v66CU9k1yNoFmSkKJ0qjxnRC0RrZzzD1Te9Bz+SgDY0WH8RBLweM0A
 Ait00jC6dkHD+9qa54BMSyWP5TPC+kdG1K7YuhFhX0HfcK/ST17PTyEBGIQyQUKlR2wQ
 jf1iyEXbadwmMWeTLglPVAiAh2ZxHGAztt8WnCL5f4zaPMTXY94OIHhNVppXMOaUzDeJ
 XQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736336; x=1796341136;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=UgHeI5HKxGDMHp/30iu+FcDW1BImaAv//42V+y+PM9o=;
 b=FjntkkNIiTpFwTMCrEwAvJBp2SPA978Krjej7L6piPNWAykVhabfctRFTAAGyJp5QX
 c1SOn0vOBbUNb7VJsH9YMjAYVduvWrfDevii0ANuGcelbtLQNHNxV0JF6fH79BHXSXD4
 ffhb53/zOrWdgvymb3jhqnIklN9HnMYFFcoOqYmX7LNIST4c8PVnpUe0TeMIj0h+EYnH
 vq7GTJypYK2by8jN9qXhZph2N8fI9q5sX8J319qlDQMxwpaAU4rx5g7YPtbhWCHOETpu
 BiN40AQ74gSKYQMv3XWSZYYhdnC8UETEfQJ5Ja19Ta/ROoZNEJML46275xA3pqOCjLWD
 jlxQ==
X-Forwarded-Encrypted: i=1;
 AL+hErHsporooRwaEt4Ge4ZYjl9E1Q3Mm2VSv0yPMKuH7uq4TfkIVJFdnSYK7oertThEpJhOBYFqFIyOOsEt@nongnu.org
X-Gm-Message-State: APuU4Z+4W3ERfJhOHMjfOrKirz3wUEhPxiAS84t2yd/+ughdJEN5gDpA
 BW2EACv/YAerb/LVqD4QQNueUlUMcjRpau9tdFKTNKPRYHkrGeqmSg6iX4pgus/V4loYns3hx3b
 cN3VTtzlSZVdQyMQntdhuurDzXKgf1vC/g6zPsLYvhalOLgmCiQYmzm9gxg==
X-Gm-Gg: AZFdTZfs1/xSFGh1z0yc7ncDVD1dQ4NBDrJTAkWYfDFYOxCtnIjniGe6pJjYLPnZxla
 EnvPUANPNgJ7e4u5YGvGN093oPyKWRReKtPB0bY1jbFMUxiBaFZy+MKsbTYyprSc8A9PicqEy26
 RAUdVo0qF2C0pcpRkvA/GSw3kH80lUVLA8W6dBsGM3EdR3VuYhdlxSCJubdYb1OMkf2D1r5NLa7
 dTlxRn4T9Y4uWXn9E58btR2JAJ6GAlD9K2Wt4awamKD1gUqEGJhCLNtcJJVOfjQZNczOyQ470uT
 GEAewCEtQLdIQMpZ3OFq63KHhmc9tER+X4hnXVpLkn7qfldEStCmATSK2Ho2UkhKwQo4S1STn74
 4wZDWpq816qcQ1Z6qBnWCjnPWRtWdpR6QB4ZjtII5J5CfZMG31kuXDNExmuBtcIkqPqbdsJ1Cm5
 nT188zxORJnWFIdA==
X-Received: by 2002:a05:620a:19a5:b0:93c:8881:8df3 with SMTP id
 af79cd13be357-949ba9cbe9amr4077295585a.46.1795736335784; 
 Thu, 26 Nov 2026 15:38:55 -0800 (PST)
X-Received: by 2002:a05:620a:19a5:b0:93c:8881:8df3 with SMTP id
 af79cd13be357-949ba9cbe9amr4077290685a.46.1795736335267; 
 Thu, 26 Nov 2026 15:38:55 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab69bf685asm43933900f8f.20.2026.11.26.15.38.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:38:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH 21/24] target/sparc: Use 64-bit TB flags
Date: Fri, 27 Nov 2026 00:35:59 +0100
Message-ID: <20261126233604.67722-22-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8xVs23j2Fs2prUe7jc1idiNnyPGaNT0l
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfXw1RjVuaVnmx/
 knYj/DB4VqWm4GMnc+9o5seY0GCkSTpnzw14otE7Sz9+7Is9k8WefNuKV5szJX988ipDtGqNg4H
 OwzuGUXJceROLH8jJ9wL3tF7gokV3eI=
X-Proofpoint-GUID: 8xVs23j2Fs2prUe7jc1idiNnyPGaNT0l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX4IiLy7bKJsVj
 tUIUVurSVJAqMQdTCrltEuARDStzh/lsMVtNmluiwZ5tK2YNmgVJyY8rCLbI1uhyWMoziJZQGki
 dpDq6mNUUcecKdcABL3ANRXGEtKGTnaL402rbn9Zvmdh8YHfJ2Ye5HWd68W0TCQFpab1S1LL+kn
 dfCNLPGfjKD0vwcEnN9XdZVfWtTYWtupY9TSmvPDUCmw/gihCWJIeAK3zbDW+skYeUQYIStTV45
 mOYv+TNn5c3tFt9mUYnggZjPkdpWyDm59UEzZLuwf5I0cX5mR+KNOZK/aeGSjcEdxgcd3IFquVr
 9c2sHGFzzBZdnuV+zA4BPhD9c63eRGzcAXDEm6tO7a1UXzUPW860GBAcENihHRlPhLFvPsAKKpF
 0/fpHQmNhRZgUor/BJ3fCna8EgRzLmpzOkw43JtS60JiLE6LpCnuTVaLFsKXWosFEmxF6LBFgsk
 il9pwChyHnIwd7JkN7Q==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b08c310 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Z3QnZVSG-XGvYK7FhJ4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260093
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

TranslationBlock::flags and TCGTBCPUState::flags are now
64-bit, use matching types for the values derived from them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/sparc/cpu.h | 4 ++--
 target/sparc/cpu.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index 3c1ba223eb25..4ac6e95307a4 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -742,7 +742,7 @@ trap_state* cpu_tsptr(CPUSPARCState* env);
 #define TB_FLAG_FSR_QNE      (1 << 8)
 #define TB_FLAG_ASI_SHIFT    24
 
-static inline bool tb_fpu_enabled(int tb_flags)
+static inline bool tb_fpu_enabled(uint64_t tb_flags)
 {
 #if defined(CONFIG_USER_ONLY)
     return true;
@@ -751,7 +751,7 @@ static inline bool tb_fpu_enabled(int tb_flags)
 #endif
 }
 
-static inline bool tb_am_enabled(int tb_flags)
+static inline bool tb_am_enabled(uint64_t tb_flags)
 {
 #ifndef TARGET_SPARC64
     return false;
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 77294136988b..436e1ada97eb 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -723,7 +723,7 @@ static void sparc_cpu_synchronize_from_tb(CPUState *cs,
 static TCGTBCPUState sparc_get_tb_cpu_state(CPUState *cs)
 {
     CPUSPARCState *env = cpu_env(cs);
-    uint32_t flags = cpu_mmu_index(cs, false);
+    uint64_t flags = cpu_mmu_index(cs, false);
 
 #ifndef CONFIG_USER_ONLY
     if (cpu_supervisor_mode(env)) {
@@ -742,7 +742,7 @@ static TCGTBCPUState sparc_get_tb_cpu_state(CPUState *cs)
     if ((env->pstate & PS_PEF) && (env->fprs & FPRS_FEF)) {
         flags |= TB_FLAG_FPU_ENABLED;
     }
-    flags |= env->asi << TB_FLAG_ASI_SHIFT;
+    flags |= (uint64_t)env->asi << TB_FLAG_ASI_SHIFT;
 #else
     if (env->psref) {
         flags |= TB_FLAG_FPU_ENABLED;
-- 
2.55.0


