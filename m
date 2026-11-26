Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD97606A329
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 23:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y48YnaH7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ePiMwXuU
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWj2n-0006yJ-3S; Thu, 26 Nov 2026 18:38:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj24-0005YX-3r
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:37:42 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj21-0007VJ-Q4
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:37:39 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJvp6j1010009
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pONMgjkcfzt1CoJc+Gdzjl6xhtVbxaTei73ogfz5mfw=; b=Y48YnaH7Z3vdBe/U
 oW+nDGA9zZGoyP1P9eT7uYSnjgK46uNLl2ysGhe/EthvOYCR8+o/Cjq4Jg2UpwWU
 uGL9UVySM6JtM2yQMml0AEKUmY8toef2DrnWZpnJ4bOJl/PFT8sROGuoR32b1/a2
 8tDwRBZK15BWGj/P0GzqyeAli01vfA4oeNLirpVhtTVnKWSvNxdzY7GZHT/QZHAg
 WfScUW65/LIKYrGPQCTE1IJy13J0oRSI4PLNUHLjb7ahmEbhDgtrx0FXYpyGdaCd
 s2eqMjRZXSfxBWf0h2mdwS+WUtAWRcLvN3FQ7ngH0oddx28CdakzKwY8vZ80uQsQ
 Hf5cwQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf910a2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:37:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-944138ed63fso615842485a.3
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 15:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736245; x=1796341045; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=pONMgjkcfzt1CoJc+Gdzjl6xhtVbxaTei73ogfz5mfw=;
 b=ePiMwXuUB/ju2b9YnM2hNAgove+Xdqf5EN8Pxi2IPk2NEZGbvbMig4UjS+mdqbSHTr
 n26SOUqYvdqn9iCiCEHqitQAUR6DIDyEwbbenAST93q8wnv949X4wvorBy4QjqRLZ5IN
 RIQq/AcTbnqDFvDAiGOStyj21cW18pvom9iziNhZ/156wdHyD4H4Bj+klKJ753+q2+Mq
 JoHmttJpCY4E0WBSXWc+PZTJj/QEyYDzSw1fh+HawQOb3yv6oTuh3jGl7VBl/nrnlF/E
 mrjjDGFUCYWxneW3gnCjk6Z0PrHqZPmdAStG6BkxxjEUy5kO3KQbsN3TEYz90qqz3owU
 X63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736245; x=1796341045;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=pONMgjkcfzt1CoJc+Gdzjl6xhtVbxaTei73ogfz5mfw=;
 b=RfHYZqDNNCcx2TW+nDTxBlsZoyhxQ89Y/uz8bP5yPhBCsEYkReZ40it0GlDd6ZpEFF
 L3OSEPOHF0lkPb9TUBVSScTsQA+HqennsG+rTpBlO2c8NIgh50GQ8RyJFcDxnYFmugQB
 L6InVJWO8cJH8kq5gvwppCWqW+RGj0coxt9xHieFw7aMCmfC/BYIwK9N3gR1IINyD29w
 6uuwNoRCWOFi0MKeGWqnIKLKFuHEobOZ17cAFOxZfTA3Xxkn00QozFfkpFOMSFD70Nxp
 vhv3kOTNVA/y92bsb19A6yIpS4T12h2zt/lRlOA/my70LWzCb6ZOQtdcIqCThhCQwdbm
 EheA==
X-Forwarded-Encrypted: i=1;
 AL+hErF+mBuHxczcuX+ShVTXfmCPavFV1pVnG9LdYk7tI46z3n693NTM1d+yEPiXP3q1VRHLqs3tQKnFhx8/@nongnu.org
X-Gm-Message-State: APuU4Z9fSDmd/9HotJz2kfqMedH5j9RA+VaNODuh2+v6s2SkWTNkeDya
 KJTjWVAHZq6imlscP1xZE6we4rdeRELcSvLokuFBJCCWCSUbz+ijFpxMuH2dEEegGJhiKUKugoV
 O0OquT1aG1spWIJnI7eZSC/Pidd+8oXr7IVBvuN7WhriQSiNR72upM+Vr9Q==
X-Gm-Gg: AZFdTZf9NdkFX87rYF3Ah+0ayUt96GtF95/6aq2W+Er9QGMrN6yPcVFWXVJL0zdrsut
 WZoU5SiscBRGSluV3muHlyHWqA//jea2O/iTmAHsZoM91H1gUmLQ4ZLFtsWCMkcf0CycuQFkzZK
 DKkdLUp1JBbjO37z5leY2jT9rEoU6kw+3gtHHtD7dacLpcK2zskDbuWElzA6Wo6OLv1MQ+s2EbM
 WKRy4UFo4a+aZrTgBOgnInTIARqwA9WUb1Os5onjbsmjtU3JXGRVhnZbaFs5t14fKFLKCgAxOj5
 GS9vutiX3xhRT4RqmCp44JqFRpW2BqsTOKKPA71W7q2R2VnKyj+Qga4uNarNGR++qmFNkJ0IQ67
 CB3QbhJK6xO3x1uiTyyoqDDkXExFPd9jo6RXKtdi7VqmXZFrKcTW3g1O8eMK9kURlm6UFpNCIut
 Xslz0ov1nojtuG0w==
X-Received: by 2002:a05:620a:2b98:b0:949:6655:1dc6 with SMTP id
 af79cd13be357-949ba81a551mr3979792385a.1.1795736245387; 
 Thu, 26 Nov 2026 15:37:25 -0800 (PST)
X-Received: by 2002:a05:620a:2b98:b0:949:6655:1dc6 with SMTP id
 af79cd13be357-949ba81a551mr3979790085a.1.1795736244945; 
 Thu, 26 Nov 2026 15:37:24 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88442693sm578685765e9.1.2026.11.26.15.37.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:37:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Song Gao <17746591750@163.com>, Bibo Mao <maobibo@loongson.cn>,
 Xianglai Li <lixianglai@loongson.cn>
Subject: [PATCH 10/24] target/loongarch: Use 64-bit TB flags
Date: Fri, 27 Nov 2026 00:35:48 +0100
Message-ID: <20261126233604.67722-11-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5M5XAT68C42ksuISydnYIOvU4y5zeXxV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX7lyiJEgJDd+z
 ulRGn4ujJ46xMLZJxcenmTO9Vb8sJW5j8DL405Tc0Ga5wbN3p60PCkAaK24BYW06Xd1/e6/A521
 joDfV++i2Aud75E/Meo9FRCJO+N1pBu25+vDoUdbHANZPfu/r4o9I5siNFhlnESTBNttsnN1kOt
 X9C1Zc36v5JpKFEY2WgaJD7g7ij+WfL0y+FsyTxSPMuFBMJH62Q5hdVg9RNzvMkIN46+KRU+CGB
 JIrAZ6DqpIhsbnijUSiW4gVyKUJaCuPAlDq0HXGytMi/sNTG0XTVwdl+xdQoVbQdhjHJ3ulVeF3
 xyiGXQmgTsZlLVR8pSvphZs46wxPGhOwqJQFfW4vH5roe05h6eryBxPf33nVp+whGmOHI0Ev9yw
 j2AmHeQfyaZexTP9c0neWQgBUGc6T3nDJbLeJOtekIoVJZ3aJ6PTHYlyIwJNEVSQiTCw0JVdWCX
 JaoiVrDiiVjIjUkEs+A==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b08c2b6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=S0uXi-gFYYn6Qnaxpy0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX7d4JgP2a5dFZ
 Leu9F7UR6hqRmUzLTIBKqAXqU9WJkFwwnLqXQ2M/iyCu/Ys/ErsgMTvAY9wY1vEO0wt4opQ7JQx
 VcUHkmvlCkDj5NirKcUPuGR0ddf2Dkk=
X-Proofpoint-GUID: 5M5XAT68C42ksuISydnYIOvU4y5zeXxV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260093
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
 target/loongarch/tcg/tcg_cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/loongarch/tcg/tcg_cpu.c b/target/loongarch/tcg/tcg_cpu.c
index 0549506035f3..743b682f1fb0 100644
--- a/target/loongarch/tcg/tcg_cpu.c
+++ b/target/loongarch/tcg/tcg_cpu.c
@@ -236,7 +236,7 @@ static TCGTBCPUState loongarch_get_tb_cpu_state(CPUState *cs)
 {
     CPULoongArchState *env = cpu_env(cs);
     CPUSysState *sys = env_sys(env);
-    uint32_t flags;
+    uint64_t flags;
 
     flags = sys->CSR_CRMD & (R_CSR_CRMD_PLV_MASK | R_CSR_CRMD_PG_MASK);
     flags |= FIELD_EX64(sys->CSR_EUEN, CSR_EUEN, FPE) * HW_FLAGS_EUEN_FPE;
-- 
2.55.0


