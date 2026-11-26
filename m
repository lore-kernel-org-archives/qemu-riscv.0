Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EB2606A321
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 23:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ev/RZ3H2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kVtiW0SR
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWj1G-0004FZ-Qg; Thu, 26 Nov 2026 18:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj1C-000497-PZ
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:36:47 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj1B-0004by-7F
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:36:46 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJwmYP3865524
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aKXQ2PUage8tK9Q/lYV3x/9ZrCYklyEq2vLrHsxomHw=; b=ev/RZ3H22mdjFZXF
 i/vUf3YAA60wWIXV8+OLcScme/VXHK8oklyXcTcNG9Yb1ggwIesfJGljsRSAYW2y
 eC4ZSPanhueNKG5naeQwHWuVUyO21v9aUTnmEkjEhWwA6UiZH547BJ1UwGvDKbB3
 h0iPzUpQP4IzGLg0dZRNxKzCKjRi/B2O+YZzl3ZxSBP1bZcuNRYLauMYXznoibwf
 p1F19oOWbmrA1TSsS+X5OXTRiJQeZVoExMU3d68+ERVPHucSUfFKlUivRofeitO/
 jd88hecct8EarVKhO7feG9g5fZDKB58o8/d4ypUOLKIj3qKNhy5SAyjHsgDzDUdW
 7Fc9hw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55rfqh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:36:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93f33438950so1251675485a.1
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 15:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736204; x=1796341004; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=aKXQ2PUage8tK9Q/lYV3x/9ZrCYklyEq2vLrHsxomHw=;
 b=kVtiW0SRyVa06U3PuYPSgDih92AYqtLxF5yZ0eFTLLenhtII3ue8rV8K0BBtUJkvyY
 CHO9kDX5pZ4+ihbc6QS2WbJnR0YfyseKDWlNBF3sUH2PFTKrVwkWdXs/gtQiHIPdIVzc
 LCr4JH7ZGXLyxySjlxaujARUPbXuodkACH87W79QKi25tie1fufCj9MLhl/5gyZKtEVK
 G1c09uauyhM5DiRESsTMpU4N2kmrbLPPa98Fse++SHS+sa1sKiNL+8gZsxplrUd/3P2e
 uDIhMyRkqie3POp8q9Oe1tO++ee0qKlXGqqSaSiTDUl6n2g48MzIyr/qLdrN+QsiIZjx
 uYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736204; x=1796341004;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=aKXQ2PUage8tK9Q/lYV3x/9ZrCYklyEq2vLrHsxomHw=;
 b=F7NDCVziWNOpN3ijWHLG4FObqYm02nO4TeTzdTHLeBSbSf5xyzjJW/KGWb/rbtBin9
 B76BhbFxUZJM1VpfUIFVAm15B+uSbg6ym0u1DtOJ6sNbh4rZ+w6lHIGRDtwGxJH9ozhH
 lDg5hffPZ/1YJ0OvNkHnk6fBBAbpgTvzsEgtCRp7gMfgC3muCmxSbgo9vKnzamMQ1QpK
 5v6NDEuH5k82IREJ+DsBTPuzIsVKO8GoNacnpBCtF9Ar7WjFK2ms3tdFR9fsTnhtwIAm
 0Ijsrurm7CpCXEdN6c9OfrNn0s8D1xJkPn/7cxSNuKS7sG+JFFjOlrT/3JAIJK+HTLSz
 7YVQ==
X-Forwarded-Encrypted: i=1;
 AL+hErE4TPajqqoD9fyd9swtS864HhiberVV/EBh1r4Jc5FlBXg1tXjVxZTwghd1cfZ3ezY1b6tS6uViHnh8@nongnu.org
X-Gm-Message-State: APuU4Z/mFmFOxOzIupDJrR7nYE6i03+tY1WOshh5uFRf+jQFRfN+ISQk
 HgNA13GzdXEDWo16WxijgoKIIL4JMVHjAPzNBQr/9wcVCdwoKIOYi9TowP6ozryniH+Ps2iE7Lc
 usdzaKBt5qkGtUYMMuIoqfy193v4x0tWmt0GPcSbS3038dcuUpWaUMbG4WQ==
X-Gm-Gg: AZFdTZegnF2KjIJ1NJEBM1ts9GCkEXzjyMUXS8TLB78mGyMQvwUSi2L862kzjJaVffQ
 W2gu8nRRiDb/6AhaM07bhQobZZUOvhO4AMjyjKCwbXciJX42VH35G0zU4YjlR+P/KFVqB1jDts3
 0XOlbQjR9tVvfEa07BHo5vRbVS4mrlbBly2S6hLuIarJbj3EdB8mwWZresQnf0xRJVtS5LdHkbR
 egSmfcQ19oX1Q296b6MuKf/6wKs+q9jIr4vSHdx+tNz38CafdwuU3JdWop7jN3zsZpFAIooqzh4
 m0Kkq6hL6dQs5a111KApwMMK4cASwTAO3KOdHbKweYsxkJFn1k8FWuKbXXiA0Uc51+pIzkpJd97
 QAWC9gMXMFTzuuoOHH8WaxXkDmH9MONYjiiwlPZ5sPb0wYc896ACQem8H3MP4Og2z0D0SyDqh80
 67N5CCi180QHafXA==
X-Received: by 2002:a05:620a:4111:b0:939:5cd5:e243 with SMTP id
 af79cd13be357-949ba80f8acmr4042819685a.6.1795736203766; 
 Thu, 26 Nov 2026 15:36:43 -0800 (PST)
X-Received: by 2002:a05:620a:4111:b0:939:5cd5:e243 with SMTP id
 af79cd13be357-949ba80f8acmr4042817185a.6.1795736203361; 
 Thu, 26 Nov 2026 15:36:43 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853b216esm699305865e9.12.2026.11.26.15.36.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:36:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 05/24] target/alpha: Use 64-bit TB flags
Date: Fri, 27 Nov 2026 00:35:43 +0100
Message-ID: <20261126233604.67722-6-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfXwnfmWCWXVGb/
 af8aACxbtbPerxdjn/aymdBwQ7NVLV4vGphN/d3q+oJH0Wj+BlcuKCqeXtK1bM/dK4B8f6nur5t
 y9szkstwfSrEFRRqmMqdkvBvRpRS/sA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfXznxqlXPo7yjN
 Ukd+ZUQCfKwR9Wl+e5BVNvJyKkbXXQMSW49Mp0jUiZkLBXpXzhheb6GGkkYwBuZF/JzYeEUI0w1
 0lJ4qv0UfEaVgFb8QGs+k/N2chxBeqdqJu+/mlYyT1+hps/UAm3lEoomW5z4SCVqR1lNy1Gu41Z
 uVEi0kdeACwiAP7NhC4H8IxY87ObpFpbGvkZGZXowTa2CHHFfA7WyY6WUSIxNyqJbo+GOczdRYk
 b8eOGcxUFjb5IfgAu2dBGZgusf9NaFBUBLXpdr4HMszvC1olnGnCHzIrcmVb5JE8db1wEOhqbPy
 G5HOMsYBKcPtqF2NvxgAmYyWIU9BLzzfG0H0bFWRj+aErHi4lkaUhF3WkLSdCV69cMG1+V2FBid
 cJF/+VfmDSGqr6HLzey6MCbRyK3fsbw4kS8ty1g8CK2YtczN6DHJxoDofpX2OJMvUyi2CETJNZu
 eC2jmUXQag45XS+P5zw==
X-Proofpoint-ORIG-GUID: ZPchzRL3dXgiaJNTXShC93JIF4qZ-twL
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b08c28c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=60FdqjWU91-NsAbpyuYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: ZPchzRL3dXgiaJNTXShC93JIF4qZ-twL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
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
 target/alpha/cpu.c       | 2 +-
 target/alpha/translate.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index fd099c8e70f9..de452c881172 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -44,7 +44,7 @@ static vaddr alpha_cpu_get_pc(CPUState *cs)
 static TCGTBCPUState alpha_get_tb_cpu_state(CPUState *cs)
 {
     CPUAlphaState *env = cpu_env(cs);
-    uint32_t flags = env->flags & ENV_FLAG_TB_MASK;
+    uint64_t flags = env->flags & ENV_FLAG_TB_MASK;
 
 #ifdef CONFIG_USER_ONLY
     flags |= TB_FLAG_UNALIGN * !cs->prctl_unalign_sigbus;
diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 6f18b8d1af62..2063abf3ce5a 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -48,7 +48,7 @@ struct DisasContext {
 #ifdef CONFIG_USER_ONLY
     MemOp unalign;
 #endif
-    uint32_t tbflags;
+    uint64_t tbflags;
     int mem_idx;
 
     /* True if generating pc-relative code.  */
-- 
2.55.0


