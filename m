Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B217606A31E
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 23:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D4yQeOpr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RTXz6Uxd
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWj3P-0002ur-Bf; Thu, 26 Nov 2026 18:39:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj3O-0002ji-0Z
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:39:02 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj3L-0001FR-P9
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:39:01 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJwSxc2574642
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 baCoxPoYsMA8iBuDKvBL9VhxlDzIn+noO4o2ggzg9a4=; b=D4yQeOprxOMDj8nL
 wx6rO+A19je/i2A1tSa4JS3KSLlkAOWO44XIdOwv6TPxqMaRP/zPRnd3bkKaLyHN
 nZVhhh0QNLCJOt40oHRnNWhnHSw1KgOd2dI+A0IcF88nEO9l6A2NMt3OgfSrBn6B
 E1N0Lt4sgoi8EcTbTUdijM4+QG/p7d2+6V7nTVf68hVfXN4UWnpk8BA0kxxyDBRJ
 3G1QGk6vHSIW/Zn+6XaFQf7zsfe2zB1R3jq3jqQr2NJndaa5Fceg2wQGQk8Ir2QG
 iIQYxSeQZDq/Jk/m7OT0xBIJgOEguAAkNhSoyesaHD7Xj5Gw8OFa0+hyySNESpNB
 2k1pbQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u498fv0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:38:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-92179251e32so42169596d6.1
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 15:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736327; x=1796341127; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=baCoxPoYsMA8iBuDKvBL9VhxlDzIn+noO4o2ggzg9a4=;
 b=RTXz6UxdcLdgPDHfKlTc5FWO0zwc2B0BiontVmbGUbI4X99jyqNcuzWL9ZmGfLzPbP
 fVPgQbiZLqPTj5c0cenV6Vl0Ywb1aSS/p/E35qVXloaWnJFJTRB0B9FX4nEZd79eooup
 +0Ufcb4RrLbSG6zbm10EEYfrj8Amzg9AshT7f46zHbi/GlTxnJVyXO8HW4s92H0zzB6M
 Ni3BhZPd/+nKgWDbbU1tb+d4MMQy/HdZIvAdZnPglrbSJiLChc3tMcNLYx66Mqxj0HcW
 e7v3RMlMfhniCEFVBKnR9U9y+/gfuMjlIEpYRsoKQZUEMOTXgC7pHbQp80kAF1nAM8+R
 HKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736327; x=1796341127;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=baCoxPoYsMA8iBuDKvBL9VhxlDzIn+noO4o2ggzg9a4=;
 b=BIVS1uv/K+hlwqQME2tNOvkN3XAVUQI4Izv0xDRMX6QJHIJ9m1d4vftGWoaaWur6mN
 7RS5DR7Q9S0cFxa2Lu5Ye56YDQjr4yiwyjeLdHZwKqlkt7O6smX83mjvzueAcZcq3Z/t
 YXzaVZQD0PIi3FVh0DvGKYEsXwCy9moOcs8zKjSOnev6T2UPz7sGJSyxsCeQHbW9hePM
 qV/btCOr6qAgRDLi0KjPD0jTbFaxD+hMp38T0YlbRQkkqcvg1FV2tFriSc6eKvpCFrTE
 wZ76bGGHmdTDZeI48q1/gDaafINa3SvnIWpG5yKX/HIxuZ7chSx8+LyAcKDW0evJ4Snk
 U/6Q==
X-Forwarded-Encrypted: i=1;
 AL+hErFc+NN2mEjGVZXp0GawQlSgpgPaKKsRi2yUpJvV0t5e1x/FReco8I0zaNkgdPxNIsI1ofUb7/7jYdOV@nongnu.org
X-Gm-Message-State: APuU4Z9LDDFc4B7Ga5okgOv45zlpAJfsC1sSXMdATTHOSzxRtK5nyLSC
 wtmWDn0S68nYKpMIOM/3sjDwFSzL7IRl2S4GtkuBW6c2yEoYXX1CwRNMfPqBw8/jSWh21oeWqRB
 sgCZplE1BiK0onT+mIXWHUC1MhPJv5+RwOdIEkl5vtelNEeO+qmREAL1UUg==
X-Gm-Gg: AZFdTZdHeMVkDGJY/5f+wdJXgA8L9PERf11X5zQah3XuepX+A52lNLuEk0xoltvoTmP
 p4jvjwDe6y33JpB5Am8eICmFv68vzUThUY0qsP15BtBxm4AhpPgbofQYbLKojYMAPbW3kw3X0Rv
 y+4gYoiwIQ9JG4BCivefacVdZSpcKCL5MDwu1+nWneoulzKqooDk0C6nSwf5yY0dwGHdImlvHbN
 3t25pR3vEOUBHSyxZqXj0ub8oOrJM0mGyOsSDiJBHowL+puYyhr7nS49CRKlGCrOi/5sQTTwzsA
 v+66XWdMk3Md1ZVAv7kkGogD4t2JhDvew+WojBdOMAfjGIIi0/wz6iL0qpg5rYeKsJNABRJNu1f
 tf4wsg0ZRjhEShzcSVjs3ldJW3fLWdu84RGftn2v8vKyo2n0aPKK4T+CE9uvfyqimOfHq4uyeCp
 roI7tt+wdTgkLp6w==
X-Received: by 2002:a05:620a:2685:b0:945:c4b9:3de2 with SMTP id
 af79cd13be357-949bab3e44bmr3910282285a.73.1795736327167; 
 Thu, 26 Nov 2026 15:38:47 -0800 (PST)
X-Received: by 2002:a05:620a:2685:b0:945:c4b9:3de2 with SMTP id
 af79cd13be357-949bab3e44bmr3910279985a.73.1795736326763; 
 Thu, 26 Nov 2026 15:38:46 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ad6403fdbbsm34502378f8f.15.2026.11.26.15.38.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:38:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>
Subject: [PATCH 20/24] target/sh4: Use 64-bit TB flags
Date: Fri, 27 Nov 2026 00:35:58 +0100
Message-ID: <20261126233604.67722-21-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZAcUHfDAlBJWbfqIXE0PxhVW0LdBXAuD
X-Proofpoint-ORIG-GUID: ZAcUHfDAlBJWbfqIXE0PxhVW0LdBXAuD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX36fMo7jUjMru
 SVcFBFDUglq+6gUNL3nSnp2mnyJLUwS2xAuyRcUeQJyBG3lLHy38NayY7BxPHZ3uP8tctyCstYX
 0c3HuyP2pNOnWSBHHAnrRuTTXu4cqnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX9cGU/oj8As7f
 ZYGzzUNJmWgDokbDUadqbeDGulhoits0trwCNgGB6U2PWLpFJE33V2sbiOOs8F2HnAvW3MXitYg
 Sf93L/whbmH+dzIJPCLTt4qNnCYmbiA/pBx9OrEC15k1sLM8FLz8dQhIZc5tMiWg3Tj8McCYRQC
 nSEvgG0X8s96RZs0mHwvFmjQJiKuO4mjnvmSJ+pxucxIrl2pQ7z4nrzoRD5R7oqlIm/f3RscDII
 pBN/EMn4vmwPX1R4qZHy+tn9DnsBhXuV9ev3lRpjHd9sM7zJeI6mfxzK4DxCKYrtt+hfQfllrz6
 adHKPbGftxZsVtD0CIO2RlA5Db/zHPXlTeHunaxiz4bi+atl4BitaHQsQX79r/9YGhA+PYp+OdE
 +uBsGCPTIBPdwX4G5/OzVn9J0YfRjlq+miS3MHBv2xCGqgFpyu7kwihw4oiuW+4+E58pCwtNQCm
 7wEW9EsLxwpBsEdX+ug==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b08c308 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=NXUr6bpYQ72ufyVjMZUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
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
 target/sh4/cpu.c       | 2 +-
 target/sh4/translate.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 17731935779e..90e3e4d52b82 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -47,7 +47,7 @@ static vaddr superh_cpu_get_pc(CPUState *cs)
 static TCGTBCPUState superh_get_tb_cpu_state(CPUState *cs)
 {
     CPUSH4State *env = cpu_env(cs);
-    uint32_t flags;
+    uint64_t flags;
 
     flags = env->flags
             | (env->fpscr & TB_FLAG_FPSCR_MASK)
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 5729a757f191..0f43a5dced14 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -36,7 +36,7 @@
 typedef struct DisasContext {
     DisasContextBase base;
 
-    uint32_t tbflags;  /* should stay unmodified during the TB translation */
+    uint64_t tbflags;  /* should stay unmodified during the TB translation */
     uint32_t envflags; /* should stay in sync with env->flags using TCG ops */
     int memidx;
     int gbank;
@@ -2177,7 +2177,7 @@ static void decode_gusa(DisasContext *ctx, CPUSH4State *env)
 static void sh4_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
-    uint32_t tbflags;
+    uint64_t tbflags;
     int bound;
 
     ctx->tbflags = tbflags = ctx->base.tb->flags;
-- 
2.55.0


