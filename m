Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31493606A31C
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 23:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kz69ImYQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dlUH0vax
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWj4z-0004zQ-Nj; Thu, 26 Nov 2026 18:40:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj3t-0003Sd-A3
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:39:34 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xWj3r-0001LV-Gd
 for qemu-riscv@nongnu.org; Thu, 26 Nov 2026 18:39:33 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJvwHA3864039
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Qj7MJJu/ul1fwdHBgKBE67XMkmj67eYZHGt59rGlEe4=; b=Kz69ImYQUuNAAlCO
 EVdzWkXyvDIr/W9JJpvi0wuOE0mPsXLkWnAPscjnT8e5Josj9CgTP3JagOGG8vMH
 UGAlJk+FihlJnu5lCEpnvt3hGiht7sMryuMwLQwLIDrk6srEdr5nxHqPDcNEs6Ru
 DSRLECCjZMgcKvgA5T5r1hItBub0ZxI5gp1nswRLeLXZqXgyOtOvrz1wGMKPGtYg
 +6fBRbJxFsxU3JkVQtera8LT6Ux+HsdioSUY7sJjxhUeAxSKT2Yym2eiFUtfNLZ3
 AGnpIbuMA+kt7csxjf35MjqFWvMxBaJPD5EQcAIEUNy8oaun93UNJsvC+WdIHQ7J
 ElfSuw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55rfvq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 23:39:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-9495dd0f07eso1292047785a.0
 for <qemu-riscv@nongnu.org>; Thu, 26 Nov 2026 15:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795736359; x=1796341159; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Qj7MJJu/ul1fwdHBgKBE67XMkmj67eYZHGt59rGlEe4=;
 b=dlUH0vaxKjQ1IhKOiNgZ8hKSlA0xNXOTJuI9yaQQyZ5UuAawZyOpTsKcQAOtk3Cu0D
 z5owzMy8iurCxd2aIIMGy080UH1YptLwXSnAGNeHBQp+imetv2n/7SeL0nn7yXZ0dOhI
 qACMRJy0rkHC0ullRBSTu+Um29iiP0WBL/5fNE4GQ8Q2+PHwevS3AWIp2wdFKXJ0Q6gS
 3sgIdgYLANkEiQ2Asr5JoodR0sDrhE2zP1TrRBdf/gW0pDuwE+PFKRvAJHQgrEbxXiTW
 T2GJ1n6nHW+Hc5xCrNbJ7xpafUjrjaubv5DjHqHXaOgnPiC6TbDqvKniFjl7cGExNyMS
 BieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795736359; x=1796341159;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Qj7MJJu/ul1fwdHBgKBE67XMkmj67eYZHGt59rGlEe4=;
 b=EBmYcFBmwz919TAfRidr9p+RkWMjs9BTyOqhVSZyyVu0IX9+XeNtrmYCVg5oKl7qu5
 GXdOxpt0jiPBm2R/214PL+kaL3bNgu0qNlF0n06UeuVkQVqhBGgfjoztwiZcuGHsvfXe
 0eosa0szsqcZV1vYK06xyyVrohNU0QfwQeaq0Uq1uazA1n5r/IvUQqlgd8T9r9j4o/JU
 hOmPxJO8hxfQmCpUYOBIPDBNyuZwYIUwz/lmPEgzpHBbNpjtmNvB4yE9auigsbVgXRNL
 k04IuuTfXboooJifKHql9E70dTK/JzqL+yCtf1NUa8503jW/z6o2U5OQ4bGtdGI/Wiwl
 BBQw==
X-Forwarded-Encrypted: i=1;
 AL+hErGkeZQd0k0NVPt4K4kIBA1Ys1hF4/Mm/Zkc23aLzlA6oYtPe36P833ZWmRozAThrg9xYkqPi1KDKQcs@nongnu.org
X-Gm-Message-State: APuU4Z9uRlXaNbTRILVhDqbd1ykEKDtp4Xx6Z9xBV5fADYCi+g+IJmZ5
 Cpkoq6cmCX544GvfUvV78XxN2gQHRCGkhjDb7lS9KKT+bbFtpMBc0BarkvOqny2e+Ra1I6vNNFb
 fkj0EyBr9tXEO5joSr5WJVNCPAmRx516wiVrKhTzH3CGS9/jGZC9eoq4xZw==
X-Gm-Gg: AZFdTZfzWLpNeU+LvQ+DXTyzK4WNn55rWpkJWldLJzj+hgLQ9Js6vUQrVePLcoSebBw
 ukwB2Pi/upv6Vz0MMRItaiwGiF5nOYsVoQUGkJyDoEMHqh2G6Bbmh5I8VEKyLQs48HUTTPnbyJE
 sMdUdRcxw0Rbue9TGa+jrhdMi42LumvTtCWywUF4P5sSDRB58V9J3rjbZKgilzcnPY78gQw93x/
 OaQ7Ee7WG2LLDD/z4hthWr6NlhUjDv/Qxwdi8ceedoxQI8NKIY1+qj4AeXKptrT9qpQR9P+/T6Z
 PzqM+e00B3MtX5l8i58zyZ9ccWR1lLjVZhdN5h2BaQEzQp5oQ5ea1bGWdjH9O3FwejorZgELigg
 9NO38f9u9J3PkptQ2AoXFfPudhV6RL+0Q6mMvLNIFpVZ5ys2YlHj2m79IymuSPxfRivr0X7FmNr
 o3V5fcdMteSJqrvw==
X-Received: by 2002:a05:620a:6496:b0:93f:5519:5e87 with SMTP id
 af79cd13be357-949ba8483edmr3531244485a.4.1795736359006; 
 Thu, 26 Nov 2026 15:39:19 -0800 (PST)
X-Received: by 2002:a05:620a:6496:b0:93f:5519:5e87 with SMTP id
 af79cd13be357-949ba8483edmr3531242885a.4.1795736358486; 
 Thu, 26 Nov 2026 15:39:18 -0800 (PST)
Received: from localhost.localdomain (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab9cf005f2sm35990857f8f.45.2026.11.26.15.39.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 26 Nov 2026 15:39:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 24/24] accel/tcg: Update TranslationBlock::cs_base description
Date: Fri, 27 Nov 2026 00:36:02 +0100
Message-ID: <20261126233604.67722-25-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126233604.67722-1-philmd@oss.qualcomm.com>
References: <20261126233604.67722-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfXy0hSjyethqSj
 ns5VsTnFZk/qMau/jsIaCr0BI/qEGV/LOWwSFOEW118nH3MXmL9060bNtAO6Rx6jESZFz+Y7JPQ
 cU4BkLgKoDJbMqwOBejoosaZwUJYwJA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MyBTYWx0ZWRfX3j9yviNWBI4U
 8ZJItIQuU7Tt2UVura0o49+egXmpOgUL5SwUPJf2SNLFoUAyWHQ6sDWWZumu23n8sGpQK6r7kh/
 SzpglXtg9/OtF70ogxP75E5clTN22ClFyLkThHWTj2CDIM4lgMZDd6cIUYttoUqPWIe176gfZQc
 hRRt52h+U/vrElZdo96hGb7oBABycvcHM/YIIbV7g4RESw02qHMfr4fZGxvDCnArGhAMbFuHW6T
 UIdZL5SpsqZlAU6AKEuuSXLDllM1WfwaCt2arbzWVv/pTJQUqEzrX2gkGAf1WyHiNaGE8jAPA7N
 4dyzVjpDqC0HyLDfwAYkd8s4+xKA66Qibbh0KdJUeUuEZd/8wnD2Fq+fx+TZfPgCf/igjgOyGan
 mnSC1chKqKvW5XxYI0Yd3k/ouHGw8ApBDLsLhVGmwuVbzmt7cOKQdsFLBzAh9coygUPvieabF73
 u58tCK02dan/oZJpWpw==
X-Proofpoint-ORIG-GUID: xQ_fIB1c1_0hVCuftA0rSMzQHBlUL5LN
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b08c327 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=hPUV5sZZM_X0ifaUgZ8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: xQ_fIB1c1_0hVCuftA0rSMzQHBlUL5LN
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Describe the current TranslationBlock::cs_base users.

Commits that introduced target use of cs_base:
  arm:        a378206a205a target/arm: Move mode specific TB flags to tb->cs_base
  hppa:       c301f34e798e target/hppa: Implement IASQ
              ebd0e151149a target/hppa: Include priv level in user-only iaoq
  microblaze: d7ecb757d199 target/microblaze: Ensure imm constant is always available
  riscv:      55b490b58fbf target/riscv: Record misa_ext in TCGTBCPUState.cs_base
              1c88ab9e77bd target/riscv: Use the tb->cs_base as the extend tb flags
  s390x:      303c681a8f50 target/s390x: Implement EXECUTE via new TranslationBlock
  sh4:        4bfa602bc222 target/sh4: Handle user-space atomics
  sparc:      b453b70bd8e6 sparc fixes (first commit matching cs_base = env->npc)
  xtensa:     5d630cef4f91 target/xtensa: rework zero overhead loops implementation

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/exec/translation-block.h | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/include/exec/translation-block.h b/include/exec/translation-block.h
index 491de24d71b9..8fca1bd92267 100644
--- a/include/exec/translation-block.h
+++ b/include/exec/translation-block.h
@@ -60,12 +60,19 @@ struct TranslationBlock {
     vaddr pc;
 
     /*
-     * Target-specific data associated with the TranslationBlock, e.g.:
-     * x86: the original user, the Code Segment virtual base,
-     * arm: an extension of tb->flags,
+     * cs_base: target-specific data associated with the TranslationBlock,
+     * as returned by cpu_get_tb_cpu_state() and part of the lookup key.
+     *
+     * Targets using it:
+     * x86: the Code Segment virtual base (0 in 64-bit mode),
+     * arm: an extension of tb->flags (CPUARMTBFlags::flags2),
+     * hppa: the CS_BASE_DIFF* bits and the IAOQ_B page offset,
+     * microblaze: the IMM prefix value,
+     * riscv: misa_ext (lookup key only, not read by the translator),
      * s390x: instruction data for EXECUTE,
+     * sh4: r0 (gUSA region end) when in a gUSA sequence (user-only),
      * sparc: the next pc of the instruction queue (for delay slots),
-     * riscv: misa_ext.
+     * xtensa: zero-overhead loop end distance and loop begin offset.
      */
     uint64_t cs_base;
 
-- 
2.55.0


