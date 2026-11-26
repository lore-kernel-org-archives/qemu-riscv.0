Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FA7606A31C
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 23:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p7HzMoPN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WadBe7Im
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWj4y-0004l7-4h; Thu, 26 Nov 2026 18:40:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj3e-0003G6-6L
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:39:24 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj3c-0001Ih-F5
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:39:17 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJwFUr3990417
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wLRFKPB7CP+13NTFtFlfHvU882UYml1HqOOHW0ZUVCc=; b=p7HzMoPNGlizMSk6
 cuEiXtS7H3OYz8sBNbwqiVvJx176JEZvs8vsyyvKy+392WE2xGSrp0Sp4GJ+QvE8
 RyQn/fNXEB/ct9zJ+SMZKYeXS0wq+87Tvi+ckJMvOCvSwvRq5aZTDozjHUkDyB2+
 ggwiJJ3J0g8jZwmt164ENDbiZYWvJewl4By1Oty0EaO4iXPEOSNwZLMGksbjmpNp
 9HYbvkl3o6pFOKXIe1+WwVrWHneBTLMO09ed5Jqg1XSDFHyDWQEqN0QkAK8uewkI
 eohFGvyQbVTCLc0XJZw0BeKSwJDPKSTJygTYVd5S7W/7IxwCozbJyMdLcl58e+bA
 WWFZfg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak042w1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:39:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-949b0d322fcso1242952585a.2
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 15:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736343; x=1796341143; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=wLRFKPB7CP+13NTFtFlfHvU882UYml1HqOOHW0ZUVCc=;
 b=WadBe7Im62Iar5+daGqExS887/txhFc9ZcAUA0WYdbWoev0wuHgiF884A20AK+BgVg
 36Ln9z9eHb/aQFOYcG9mcT1Pt/57aaTJhdv1dMa42BceEMxL5I61o8ms3darbtI+XYpG
 Tmh/0/7+iqEXLijAe1le+N8cnT+jg5LVFdBcBXwJA9o3EoX35LPv+p0ETT5Wlk0/FBmN
 Y04rYSQ3qTwbPvQ9qX5SUZvAF/8IUTrJqTgATBhejkCupx+T7kdHvXdo/5tPfdV+c1aY
 HJRfNnJu77EfV4922iqwfqck8HWENcE9VX/u0qfX+OsJw5JwXlJBqC5ljV97iSx/VbT2
 eCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736343; x=1796341143;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=wLRFKPB7CP+13NTFtFlfHvU882UYml1HqOOHW0ZUVCc=;
 b=AnJfqo9MpoJZA7jLkDjvf2NQyAE92ktXFocLeDDk5yuuAf7IFUl1zKcJDH13Rikd26
 PUnPcNh7nbR89wkVC6b8VU13QULX6mQeVQ9nvBFpJH5cs+19BmaZCK217k9vXKvTlmc2
 8RLm3t1vRsKEoAdWHv/whJIYvFBGaNxBlE1Icg9zmd45FfxmLxWm8M43XpxvPmO9uZ17
 l+nabnoA9ycjyAWb3gEtoXpKT9pe0uDQNaN7ye5LxntbQhHOTb9e//qPeEnfSPwScLJF
 RhDPKnSNA4DGzC6UiF2FFBidHQBbKXAozXtb8y1npIOtOFWyO8sduIyxiQnp7fAIDpvo
 hqhg==
X-Forwarded-Encrypted: i=1;
 AL+hErE/guMx6o9M7dggi1iuUTk6pKtJGd7lShlXk7TyGDF/C3kcQBHR+wfEjzxSQjyF9apMrCEdPJ9qjF25@nongnu.org
X-Gm-Message-State: APuU4Z89KU45iKiFhf4kdO9JBsqFVeMfdwJNELuuiWUjH7UPph1+NrAu
 gHOFJkCryaz8HcrPX/HmVXxhvsFkRV8XRqiTMGjIX5g8UCFWHvxIuKjL24pr8xv3QvRnKwRV/cO
 fbgAIajU/kZfhvLBBmtDgHZra2crMVWEUX47WldeqZ7AWBjNP3sxa8mn+ZA==
X-Gm-Gg: AZFdTZcTpjVc6H41f71HbtAN4wKFy5VNl5pi6jwE8gZSYx8ca/6uZs6mEdVpgPHn0bS
 rEXE6/R/Z1F+hkmz3rgwbXumAtCi+66WzZbA97N7a+pzGbEDCrnqEh3dx4jYNsxPUN5VTdXIRik
 I8a88TMcOWUJLDBSOwqNRpa02gQ478oP4QAceU9lD18yFsOq/YtdH1oFGzHl3h6XnExeEQ+tIEC
 ba9G+OvgPXd4E9FAiOD2cO7yltE+VcrBmau789wD3cyKvbYKrNbhxSeRXCyRO0nnYsp787HK3Fr
 t4NIRg9gMVz7hkrNpWxY8+DChYg36tPI4PlDWbv32+a3JWKL3GlM7uTq6kN9fDpdHttGwBpQGjb
 DrCBhrxnWkNRaFGZ8C7RXZ3ogxDDabDXuyGI5UsG5pDMDqE5IbuG5zExplP/bGueVd5IkFV6iCz
 du+AkcXhAK4XU14Q==
X-Received: by 2002:a05:620a:1b81:b0:949:6a66:66dd with SMTP id
 af79cd13be357-949ba96e873mr4358385885a.21.1795736343340; 
 Thu, 26 Nov 2026 15:39:03 -0800 (PST)
X-Received: by 2002:a05:620a:1b81:b0:949:6a66:66dd with SMTP id
 af79cd13be357-949ba96e873mr4358383885a.21.1795736342948; 
 Thu, 26 Nov 2026 15:39:02 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab69bf685asm43934410f8f.20.2026.11.26.15.39.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:39:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 22/24] target/tricore: Use 64-bit TB flags
Date: Fri, 27 Nov 2026 00:36:00 +0100
Message-ID: <20261126233604.67722-23-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b08c317 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ltnaFbhCd6zjLZLej9kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: sym0iBDuzef9EOnZcD1Nfilqa8_GNFQ_
X-Proofpoint-GUID: sym0iBDuzef9EOnZcD1Nfilqa8_GNFQ_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX7dPd71q9R2Z3
 0WcsQ9wKjAloCWpt1mQ6fjwbICoszWtt0XyRUG7qTWvnP+eoqhNJT6IAVdoQK+yI+rjyjMT32f/
 fbpMVRYoUIp5m7Tq/gnvLMeZqVMHi2qo0vac4SYhblOknLkIe7b3OyanLMQ+YK0PH4GkylXTaQm
 E8hEeJ+kEJztxAjWC3HtSwJaGuilRiyVKnHB4YkqkQe9RdL1s7xTOVOtSzOcWprgTihfyvIKEBi
 Qqgr+NRkzy1cTEWBLald1yJM4BnBQ483rq5/kHaKlitbxrQ3KNsN56JgMZ7/82ItMkD1ES1G4bc
 h3dt7UVbdbFwztATM0vHluYPRUqWiITdvR4fj7NXE4d4ocs3no/X8hJ30G3x+uyOq6/UvKPyW9Z
 MR2WZmObeTAM/hFVLLykhOomBh+9krs0mOy8J2q2Ow7xjVVRUiIuMeHFuBeX6jLxmi2VNpgB/9z
 sR1c0yYW0c9sCrUK4jA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX0MgBvO4cnkXE
 PXMl0zFB9F6jQRCn89J0sRVxVVr5q9iWi0trlX0JEpcZWz2QhRLzIIeYAyrAJCaOjypH46Eg8TO
 3bxrmrV8/54aSu7Ls+8cxz18CregCrs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
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
 target/tricore/cpu.c       | 2 +-
 target/tricore/translate.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index fa782f82f00e..b77ad96fe7bb 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -81,7 +81,7 @@ static TCGTBCPUState tricore_get_tb_cpu_state(CPUState *cs)
 
     return (TCGTBCPUState){
         .pc = env->PC,
-        .flags = FIELD_DP32(0, TB_FLAGS, PRIV, extract32(env->PSW, 10, 2)),
+        .flags = FIELD_DP64(0, TB_FLAGS, PRIV, extract32(env->PSW, 10, 2)),
     };
 }
 
diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 8cd6b58f66be..7f343d5626e6 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -8389,8 +8389,8 @@ static void tricore_tr_init_disas_context(DisasContextBase *dcbase,
     CPUTriCoreState *env = cpu_env(cs);
     ctx->mem_idx = cpu_mmu_index(cs, false);
 
-    uint32_t tb_flags = (uint32_t)ctx->base.tb->flags;
-    ctx->priv = FIELD_EX32(tb_flags, TB_FLAGS, PRIV);
+    uint64_t tb_flags = ctx->base.tb->flags;
+    ctx->priv = FIELD_EX64(tb_flags, TB_FLAGS, PRIV);
 
     ctx->features = env->features;
     if (has_feature(ctx, TRICORE_FEATURE_161)) {
-- 
2.55.0


