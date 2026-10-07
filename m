Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F9ECA6002
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 23:25:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xEb0T-0000lA-IS; Wed, 07 Oct 2026 19:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEb0P-0000Wq-LH
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 19:25:01 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEb0O-0001Tz-0B
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 19:25:01 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 697Ltrts1467416
 for <qemu-riscv@nongnu.org>; Wed, 7 Oct 2026 23:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 At+ZoAnAYbyyH5SRpHNHONWM9IzSg9N8gSi7ahyrOFE=; b=SgvW4mjjVSahtbBl
 0ub6z7cogbQliHwCH5Rz/FIABCJ01Hs+dhCQ14dlxZsg/NGK+/iDTzrhL10eoDWH
 e9SrP79fiCrSSXujq9ldDADMdb5lomXLWtKGQ0h4LaY/CJZ4IoKjoQA8+15GnCQT
 j05o8Ey2D06ljSlbZs5f9ZLXtsOWBJ3/9ZGNrnGecdpcApGdKySrTN4BWstkK7Z8
 o8bWHYup29T6ukW0hhESu0ZcgsJKc3jMyT6WlHAzT60SAdfHScf+LG0ysaVN3JDn
 z779Z4A1Zf0DSqrIL5y97+YRxnCEhPVfcc2Penrq2cLE0bcyr5XuCXFih3Ge7WWR
 3BxJiQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe409qe-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 23:24:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-917a7c17166so100836026d6.1
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 16:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791415488; x=1792020288; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=At+ZoAnAYbyyH5SRpHNHONWM9IzSg9N8gSi7ahyrOFE=;
 b=RRfY6mouZLRjUGVqrsVBY9NnJOtZjeGzSkQKln3V504tJJMXACeD7jyecU26DxJ5gO
 4okxSRQE5DhxJ2xBQ9H7krg4vcrGp9eATj0dOn1zZL5V4vq84zBRNeoaggWqx8XlmLep
 /ErG1U4gf/+NfSjeA0nwANDd/iIlgQWhqR1rso3P7mV8EyDzkltmqwgxq9ntl1UiAyRm
 k6y7NLLhEgEJCWfnWvZ4RXKt1QNDEk2df+aWcv4rafezsZZ9A82fc0bfKgJSx9e0Su7R
 81cqk7pu53x40XJrcWvw+ndeEz7YB+gVjHFErBqo2XKYXWNQT400ccexgP7opMZPfRgb
 zLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791415488; x=1792020288;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=At+ZoAnAYbyyH5SRpHNHONWM9IzSg9N8gSi7ahyrOFE=;
 b=uGfzVFME66wRzWluNjklz8FX/uo/HTAK7Okbqt5/bOssS4vUkujbrt/xuU8SzK6naK
 7Mue9IQ6Mlyy3F0X/uz1ps1vRDzBvbvSM2U0zDBv/B4l2ZlxOxYWoXdKDrBpNpU2XWjZ
 mMIurXKgDZHpQ7Hc3dqgJuypfPZOrCwRUiJ9rfr8tlZT5Gcxsv3u2PGwuKFOupKww30f
 WEstvjCInaFuQWUfnlaePkS9AWbGbjynD7O6UJZTFRvpzyurgF3w3OQplUO0/x1zC9TV
 RFSBznIpnlNJRzMF8VO1EWnhSJMA6BcG4SvErdSpQqrudsgsPbe7kYKA5eH4vcZ0QpDd
 xnCQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzCHEyQwi1J5VXRBevvnK1LxNIpw3WYrk2yBp0JGhCSJZFqQ+rHCFRzj83IiqV0+PZV7MUN35COA7VK@nongnu.org
X-Gm-Message-State: AFuF++kL2F/qd8n1YtcBsGMWV7weW03yIewYiRkvRBLYwyqRoPktWqVb
 cqdB/AzYCSgvaKursTXXsFcjFv6LrkWQEeEP0sywSU036zoW+RdI/FQp+b5A6hbklG1THQ/iVCu
 sBf2EIkTHjRZD8k2qd4t5qQSWtK/VCNxSJMGP9VcEWxx+cAplm7PEhaM6gg==
X-Gm-Gg: AYBFou1LDsLDsUbxq2O4C8yKr0yA7ZfrklJ89iubQDHJiyZuHTphDSDieMTcTDcfJ3P
 /OGvAQcTgnOSXPt2xrqb9wWh/ck/b8c4AQs55Ii3BSDH47f/bgAuZDSK65VEm8N10EL3ZDvpAOQ
 0rnC+At9HOQkkOIAUNT2D3RyCD8rl/TBHu5pfoIODHnMjbAPzEBIl3Aom2O0SZk06Od8qMhrLmQ
 XZEUSSHPYm9qN69ZeUVIRrlTuINoGFhiKYGpzRPfjjmmmjzju5Jw3bCODeaMEDLtorZBiPY2w0Q
 hY4rXZ0ArC+E9SrjM+ZMxTuZrjXP9CMCJ44njZdSyypFE9P8Z72uJD4wFue3CElt6+E4jTNe9p0
 HYpW5pD7yFOw+i/CtCiTLGumHI4hJ7iTeR5x9IvUc
X-Received: by 2002:a05:620a:444a:b0:93e:980a:2ff6 with SMTP id
 af79cd13be357-93e9b807938mr732618485a.74.1791415487578; 
 Wed, 07 Oct 2026 16:24:47 -0700 (PDT)
X-Received: by 2002:a05:620a:444a:b0:93e:980a:2ff6 with SMTP id
 af79cd13be357-93e9b807938mr732615785a.74.1791415487148; 
 Wed, 07 Oct 2026 16:24:47 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1834fcdaesm10730455e9.1.2026.10.07.16.24.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 07 Oct 2026 16:24:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-ppc@nongnu.org,
 Yonggang Luo <luoyonggang@gmail.com>
Subject: [PATCH 10/10] include: Remove TARGET_LONG_SIZE definition
Date: Thu,  8 Oct 2026 01:23:25 +0200
Message-ID: <20261007232326.66240-11-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007232326.66240-1-philmd@oss.qualcomm.com>
References: <20261007232326.66240-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zQHNxTv7xG_5uxY2l9Dnh-wvINysHhWo
X-Authority-Analysis: v=2.4 cv=AbwkjHXG c=1 sm=1 tr=0 ts=6ac6d4c0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=514NUbYOmUOWgLp1GpQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA5MyBTYWx0ZWRfX1OWPlID0Gut0
 ZZSMMjORDk9rD5LR/1k7o7dtLjxiyzDAuV8/zlqINMdc7d9ukBfhPgRk8UccYxhDSPlm6BNwCxb
 1og6C1LUbj6Ip5sF5cq03jPCAwabsSo=
X-Proofpoint-ORIG-GUID: zQHNxTv7xG_5uxY2l9Dnh-wvINysHhWo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA5MyBTYWx0ZWRfXzNqRKxgBtwYx
 IGFF8wGAC07393SL33kEFEG4AuKnITDJXOf8pH9I5OgCcJbAMO5puESwJcYp77GpI9N3pLEFeUm
 8FMMi4WxPjbKD77QOdJ1yrKoi2mcoO+ZD6w7u4L4Lm26mzLaeYeKUoqdFLoonId4NxSGHL+G7l+
 viU7Wuy34FD0lwLPF5cE7DtY5wyFoPSEhwH1SCHDNGCgRccPX4ZfFhiVl3N2UfcjDgnm1ZlIYzg
 FhDtupgl1jFx9Y/qn736LeD2tdiP+rlFqN8CgF/SHB2ifwQKEcGu78RenA587nkkc5nAsmxQevH
 VASqIAC240JNk6SrbHmzfn1jQ4QTPgYdFgCjt3IIJwAKdqvO1JGkAEsxNCoYhLNV+TjLNoqeCb9
 hGeaGLQXVS/uS+R/YX/z3kCMEvYBbJQeTcpZ21o5fkOEC3ePtUWX+M6KhQEUVE+jjM814+kHjNL
 5uElVoRjczX2vr4fp1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_07,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610070093
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

All the code base uses TARGET_LONG_BITS,
remove TARGET_LONG_SIZE as unnecessary.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 include/exec/target_long.h  | 8 +++-----
 include/user/tswap-target.h | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/include/exec/target_long.h b/include/exec/target_long.h
index 3cd8e26a23f..5d403c60402 100644
--- a/include/exec/target_long.h
+++ b/include/exec/target_long.h
@@ -20,17 +20,15 @@
 #error TARGET_LONG_BITS not defined
 #endif
 
-#define TARGET_LONG_SIZE (TARGET_LONG_BITS / 8)
-
 /* target_ulong is the type of a virtual address */
-#if TARGET_LONG_SIZE == 4
+#if TARGET_LONG_BITS == 32
 typedef int32_t target_long;
 typedef uint32_t target_ulong;
 #define TARGET_FMT_lx "%08x"
 #define TARGET_FMT_ld "%d"
 #define TARGET_FMT_lu "%u"
 #define MO_TL MO_32
-#elif TARGET_LONG_SIZE == 8
+#elif TARGET_LONG_BITS == 64
 typedef int64_t target_long;
 typedef uint64_t target_ulong;
 #define TARGET_FMT_lx "%016" PRIx64
@@ -38,7 +36,7 @@ typedef uint64_t target_ulong;
 #define TARGET_FMT_lu "%" PRIu64
 #define MO_TL MO_64
 #else
-#error TARGET_LONG_SIZE undefined
+#error TARGET_LONG_BITS invalid
 #endif
 
 #endif /* _TARGET_LONG_H_ */
diff --git a/include/user/tswap-target.h b/include/user/tswap-target.h
index 4719330dbbc..1c66a5b9344 100644
--- a/include/user/tswap-target.h
+++ b/include/user/tswap-target.h
@@ -11,7 +11,7 @@
 #include "exec/cpu-defs.h"
 #include "exec/tswap.h"
 
-#if TARGET_LONG_SIZE == 4
+#if TARGET_LONG_BITS == 32
 #define tswapl(s) tswap32(s)
 #define bswaptls(s) bswap32s(s)
 #else
-- 
2.55.0


