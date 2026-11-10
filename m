Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529F6606A320
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 19:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lncNufe1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A3UWaJBG
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQrs1-0002aA-1I; Tue, 10 Nov 2026 14:51:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQrrW-0002Py-8R
 for qemu-riscv@nongnu.org; Tue, 10 Nov 2026 14:50:34 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQrrU-0003RE-1z
 for qemu-riscv@nongnu.org; Tue, 10 Nov 2026 14:50:34 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AAIopMV015168
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 19:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=XpLFaKL7kIxdAeTH4jeyEndvwUGhGIW5B+N
 pFZg3FOU=; b=lncNufe1yIr+bvPMi5o0qItAdh1eYboLrH42G8GnK1DR+iRvR0P
 X7ZQYLtxgAgz3ljofs/JtYRwYtyz4dPea2+KDXlGg95wkl3klQ9pto3WjrNfuKf2
 X3NZzXU3mPaQh51hhztC1yLIuh1M5aXD5AX7X33xZXnaRys/iDWWVp+4waLFtMA/
 PmRad9O2/Gck3t0teP1RwuFsm+g/slZKvG0adCxsZLG0dhyY7dvq0P6hUNPQIkpe
 4fC2ieATCKMqksz73g69lyKDnRmjJaW/f6BoI2iJLfl4jAYIy+snOjDCkw2BXpf0
 sYMfHinPG1zrQ34bH1i17Jsjt1GiYnX0IPA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv03ctkb8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 19:50:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91eb16ea5c3so65980366d6.2
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 11:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794340229; x=1794945029; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=XpLFaKL7kIxdAeTH4jeyEndvwUGhGIW5B+NpFZg3FOU=;
 b=A3UWaJBGul6UezaniTcslhjNH7qdjJrQ3Eaf59hpBP3cLGsvp7C6A2c+mBr69qHVDf
 2GM0RIUUwT2ZI8CDjqbXn3A5fVK4ptjPSyMg26lo1RuK+W9nQqg3wKlKQ3DKnEr3wcvK
 cn6iORd6EBw6EVJbBXzQ5R4NMd9h/o2eP5/N9dC0VyrTye81CM2TikuqsHDK29bf3Izy
 Fi8iOP0UXhvvVUNQS0D1NsclahBeyx5U9s16fSkpjenL49fWW/pwfoJJ3iVkY5f+3w07
 fYeVjl5xlUQQHaKQtZVzHSMf+L/sobfOFk36niFIs7yJ6FKhBVu4VHz7LTXlhLo5fduR
 ptbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794340229; x=1794945029;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XpLFaKL7kIxdAeTH4jeyEndvwUGhGIW5B+NpFZg3FOU=;
 b=BVWktEBQh5E+krvuWopIIKrJYncz8wlG9o1PsFvlqPG24zZffk7ibxgOQxfwU2B2wv
 7DDh+2cTUjiE9j0r5k4H2IOVTSCf4sPTIpirLKC7NgAn7dBluqqUcjxcSDfz4sUDNaKn
 +tX3bwZE7NeKLgu/4TqfioyQL6kJzer1WMzZDYDaVEwQuY3Ir75I50Rv6hC6Kg5iNnWZ
 JIQzzp8EGYZ/YNAgF/w1rnWPrDmjnzEay5OK+uYfk1p3XUepzdr1Ic12ViJCjpsNyRei
 l+dQzpSGbLBVPRkWBPR5uZxKViFzau6x/BM3LWKtvPvfviBX7mC438HI37i7PekDKatD
 CCpA==
X-Gm-Message-State: APuU4Z/XuF++yzUU+N3aoM8Bi7GIQLDu8WQXdvdY5QvXPlaSTXP4pDh+
 P+r3RDJKRnnGtLzRmi94bJV/PovkXmuSLJtvCOSS337qXAXVldvuwcvcutmfw2J3EBUAIDHxEhO
 fDKfMnZ5vqxsIXluj/wXZQNN5QPgxeIjghRxbscBo23fJAAuG7OZFk5Ljrw==
X-Gm-Gg: AYBFou3qmWMem6b9xKf5Fmbiswz7SWyP69SGgIrMQ2BFpJR9nKnpgBnESCM9zNKddOT
 NSONQuVezu40CfqjXx+M7Nf2EkZTTQSttPzkPFjGcCUOY9j3rMMYOYlDWOYBxHT1i4mbCxNCEQ9
 2UUBlEAFabnkCgAaOP3AL+nO8XQVEyNEcPN7GcKtm9Xto13xXWv1LzblmCsySd7P3Bg/x5Lis8O
 tvwXMdH8+FZC3YBqd8p7+PrVeii2NH5ui2DpbHAcNp8uKhWSeS/cVXeNxr64gdXWdHHF0UpNWiK
 wRc+mDgS/sqi+ngQWA3Q/0IeGq0T4Btj1Rc9B4gD32BJKf4/AvUKr26KGpl30KkxdP7ALV++6zp
 qG9tUVxD26mA1R7+SzT346zfOfBfmxqsknSQRJ+FuDAQ0l0ANAQIfw5FCPtx/0DDHZLk3wQuEPA
 fGaqd3VG6au3k=
X-Received: by 2002:a05:6214:20e7:b0:91c:9086:ee13 with SMTP id
 6a1803df08f44-91f042339femr5018836d6.58.1794340229087; 
 Tue, 10 Nov 2026 11:50:29 -0800 (PST)
X-Received: by 2002:a05:6214:20e7:b0:91c:9086:ee13 with SMTP id
 6a1803df08f44-91f042339femr5018126d6.58.1794340228365; 
 Tue, 10 Nov 2026 11:50:28 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ef04d9b17sm28949006d6.20.2026.11.10.11.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 11:50:27 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] target/riscv/tcg: clear itrigger_enabled during
 trigger_reset_hold()
Date: Tue, 10 Nov 2026 16:50:23 -0300
Message-ID: <20261110195023.20927-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1rcu1078IPF2QMSnLSy7usrqCEWvE6AD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA3OSBTYWx0ZWRfXzOL92p171Y44
 Y1aNg9dBBLbkODs7q2QF5xayESw3d6B+KePPyl2PblrtnvbLsz5c1jq2352TJ1J9idZCsztcbbV
 t6UnflzDeFYvRnWbRrJK9IPzvtX5LIE=
X-Authority-Analysis: v=2.4 cv=FuiQbGrq c=1 sm=1 tr=0 ts=6af37585 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=zcreZ36wYqc89bCkXXAA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 1rcu1078IPF2QMSnLSy7usrqCEWvE6AD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA3OSBTYWx0ZWRfXxA8QE8TxFZH2
 gc1N+F13ZxqZQjfV8baSDRe3eMzC1yDAbdHU2yhg32QBYxEg8ksbLYkwjPwPTB+SvQiGEUVdMXH
 pfT0uJk+xUL4hJovJdwArmDIHmKNSmNcmr+xnfx7BSZdZBaYEjcxdUTgC8qCp00OnK0avEepd+Q
 NHm0rCEIrGKLPZbnTk+ZW869YgEgW205yO1Ss7aVAanGiL7MUXJocLYchV1pHaXmBNulH2tCEPi
 1J7EnquGnDc/tJUgUyeFGiqh3R0EDJWoWOnfIPRHSBj1bxYfgjEXiLmywAqK9zOJsXyErMKqsn0
 9yXdh0I89NktjQUwX6ZsXzqlLSstfiSZ9QnRN/Ltoz+GIxwNvzBPzsJL9btn81mn9pCauBBAvAb
 Zv3/cSlOkA+vRjy2zoUfPvXV91dcBo8p/naDcMHu4IwCl7XHO+VYZGvESa0OFbDCOIWmfbBTZw2
 fF3DFsSCkxq+0MIo4IA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100079
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

We're leaving env->itrigger_enabled untouched during reset() while at
the same time resetting triggers to AD_MATCH (type 2).

So, in case we reset the CPU during an itrigger session, translation
code will enter itrigger_match helper every time (via ctx->itrigger),
and the helper will do nothing since there's no type 3 triggers set.
And we'll keep doing that until something else clears
env->itrigger_enabled.  This is a niche case that it's a bit hard to hit
but it will cost a bit of performance for no good reason.

Found while reviewing an itrigger related patch.

Fixes: 5a4ae64cac49 ("target/riscv: Add itrigger support when icount is enabled")
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/debug.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
index 8b58cbd07a..988bc815d7 100644
--- a/target/riscv/tcg/debug.c
+++ b/target/riscv/tcg/debug.c
@@ -1213,4 +1213,5 @@ void riscv_trigger_reset_hold(CPURISCVState *env)
     }
 
     env->mcontext = 0;
+    env->itrigger_enabled = false;
 }
-- 
2.43.0


