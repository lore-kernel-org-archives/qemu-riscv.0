Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6386C606A323
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 13:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OyTVacQt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N+1ReFnC
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWCvu-0002XB-IK; Wed, 25 Nov 2026 08:21:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xWCvo-0002VC-IQ
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 08:21:06 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xWCvk-0000fu-RQ
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 08:21:02 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AP9mAZq2120992
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 13:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=EcMWS94WxnX
 JWso/1bl4w2nn5/lvCpcllnV5sxWLSxY=; b=OyTVacQtcgnCbn/lyKbqpPpg8mv
 E4HhGZsO9mnjORBhTFdfW45JTv0o2utFf6adRdVWZVokWfUcG3LpGa3EakU0h5iP
 6NXmWjsvkKlXQAk51p6o2TugFFJru6wPUUdjZ6AMGxYqVXk5BpzMonlB02Qna+IZ
 vqx7YWXTB9Q8qdZ5nezAjYdSNuTUap5COYJgMHZVF18/ZhsU4gMQAmQwCkSJQTX9
 z4tz9zRulE4AUQ5OGWZkppZ5e8QYY87eLuYlc+X4FJVh+d84OlXTrICIth6PSi+R
 zWQoK4jl+Ug+ODnwnXPX6CTLGVzKA+pkzzWdJfPxnw4qHAoEl3f2/ySZanA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuks0bh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 13:20:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-91c6c1e082bso106995186d6.0
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 05:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795612859; x=1796217659; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EcMWS94WxnXJWso/1bl4w2nn5/lvCpcllnV5sxWLSxY=;
 b=N+1ReFnCO2RfkIW/MYQpu+KEW5dNoHDOrhXtnKL5yMk1RCTBDAQf4rlJ3+xZW40h9G
 yrvcu+r3O98z/EmqtriSOze61Oec0f5JZo06pclCK/OdDlShSpUrg/J5owedxOuevk+e
 T4kK2TKbcdpgHcDqyIWRfcZ2FL8/xTOs+aiNpu0sOPK2+A434L/3Tx4Ah0kjBPLnF368
 r7EeElRCSjQezHkZVyH7odUv6c8PuyFZ13rDs5/nuvw9gauJLOvdQNo4YF9tSPpdPW52
 EUXZmR7s+aEZsUTo/mU3z3zmB6rN2qZ3cWucpiqZXibqiIrTDAR7KOlMs08JlGhdCfu7
 Eslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795612859; x=1796217659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=EcMWS94WxnXJWso/1bl4w2nn5/lvCpcllnV5sxWLSxY=;
 b=n8NXkCvyvHXL6KVJlqYzFEFbbFWdjPR2+tzpRAvL4pqRTIui/e6EiEtJTphoB1zLQf
 Pasri3rmcPHcQDZr7CNUXKLExalQaVZDOOFAi/NewGB8CXYk+Fvz515HTujOnB3dUQar
 VbcKQUauXG3j4DzEP8RqZUTmoq9j7H27gQI0ZOz94GMmzYmvKA7wTUn2E9LXJ0GQnLjP
 Wb5iQrRXO4RwvoY8e2CbHyNqz0mlRJ69dqW/UX77TRkLQooqHe1mbzqirXU/HdOkC3oB
 UJ/VQDgSGYk3STbUjd2ib9iStBJa63nBbOnX89Z9tMxvoJJn99A92GId+xlnRK8guC9Q
 RXXw==
X-Gm-Message-State: APuU4Z+NyekWoVP6iu7E5tEnrXquNccARpCUXKdDBTtGEIde/5v0fBjG
 bk8x45B+stIV8inOvY+AZlF+3n0gKvFqB5sB9XS22sePCB8UwpVNHJ5+nxywJKmVPij9nT6H746
 IJS/SertLxNcWxrBoMgjUf3ilZ4OXw79dNL77+cGWfEJj1vKZO/yCLvMigKJX7tAOvQ==
X-Gm-Gg: AZFdTZdVvyRdXQvhPEJnBz0Y1BjA11KUuICQJ1OS4+iLe5jS31depesE00+AZLN6TEu
 KzzNL/XwrP1bKaD4iTVSNYfHPfAidDR0CKOJEZDViWub1ZZRZz20pL3s/IMnVpUzpcsAoxTNh+e
 /Gkac56Zfnk30n7oI/fZj9pI1x9NX2EE/R9g2EOCYoO5pP/OgPR/k/B+j/1+La/XHnumUoR6cP7
 uF+NfBGpNYp1PR2BBUPKM46ELi6rAfIAdr5cXdEHECzwAQy1CJ72V6tnIpthXv6kLDIrMEKqwvC
 OkNs0qmQeGvRVMD5S6blRGHMZV/OUDS4XtU3RqutYp5Hm6jkEVPOXlOweoFCNXXLklrpmrneSDP
 JROsTMMFWb+1mO+6mhlJvKrrkHFyE6LNJcm0g3CgeWpd4v/emdrk6h0nzlmi3BgUxBfxorIjl0+
 X8bTNX3+whhw==
X-Received: by 2002:a05:6214:3d01:b0:921:6588:53ef with SMTP id
 6a1803df08f44-92165885458mr107646186d6.27.1795612858967; 
 Wed, 25 Nov 2026 05:20:58 -0800 (PST)
X-Received: by 2002:a05:6214:3d01:b0:921:6588:53ef with SMTP id
 6a1803df08f44-92165885458mr107645576d6.27.1795612858340; 
 Wed, 25 Nov 2026 05:20:58 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-92134a08552sm160836946d6.34.2026.11.25.05.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 05:20:57 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 06/15] target/riscv: allow hvip.VSTIP writes when
 (m|h)envcfg.STCE is set
Date: Wed, 25 Nov 2026 10:20:05 -0300
Message-ID: <20261125132015.229955-7-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125132015.229955-1-daniel.barboza@oss.qualcomm.com>
References: <20261125132015.229955-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b06e0bb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=M9ce6HhBX4SvkK6VDRMA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: yq7J6l6XzatYsTwz3herlC0VlVj5Ip4h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfX8Fono39xpTio
 keMa8ZzCyTHPr5BFXD71cQyLdQpo0bR0LpbCWLpIsVFL5fouMrBMqYf7XQOVc0nbUyZ48MGsPb+
 lWupUVcQomQdF2wOX2P739WyZy0L6PI=
X-Proofpoint-GUID: yq7J6l6XzatYsTwz3herlC0VlVj5Ip4h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfX3BNPvsLfA5r9
 eb+wVp2omCfE9DGvq9y0TP6FZfyIlIkqF9WWW11W5FarSciwZK0As4GyHZl2u7IL8GPS8vAXzw0
 +dZaQEH5yJudOXO9D+L8+3LienFZN2A03yaA9E9iESKhs2BhuA+z/efQiPAgfq8ZLFoZym/KnrC
 qTm9VGnulqJ+xjHx+6vYKintqVozUyCghg+LJRFsTZjH6kPrk3U0VdWILAJ3g52Q0+eFfoqnhH8
 ETGng10zK1B/pFGuh9n23xGXeO3AAMz1Id1B4hl/zFbzJXnigPdhNgTl59QNoCprZrOB/ew8ew3
 cocN1UZRU6wggAzL0bVbldMGRJxYz8gIsqz3WgbjhkJsnK7EjyZnOi/MO5usJXrx39VTBQimvDT
 Kc1C+1dUAF59+kyoxr0v1N6CP7NL0jnA9fn7Rxzpr0HO6lICj7om/fiilJhFvW18DefE5WId6x9
 cOYh19bbcBL7x67fHyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250053
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
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Priv spec says in the hvip section: "Bits VSEIP, VSTIP, and VSSIP of
hvip are writable.".  There's no reservation about hvip.VSTIP being
writable, i.e. this should be the case at all times.

The issue lies in rmw_mip64().  The function, used by multiple CSRs, is
filtering out VSTIP based on the STCE bits being set.

Make an exception for hvip.VSTIP.

Fixes: 3cb2edae7401 ("target/riscv: Fix VSTIP bit in sstc extension.")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4593
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/csr.c               |  8 +++-
 tests/tcg/riscv64/system/meson.build |  5 +++
 tests/tcg/riscv64/test-hvip-vstip.S  | 65 ++++++++++++++++++++++++++++
 3 files changed, 76 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/riscv64/test-hvip-vstip.S

diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index 6989393bac..a715f48e01 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -4041,8 +4041,12 @@ static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
         /* STIP is not writable when menvcfg.STCE is enabled. */
         mask = mask & ~MIP_STIP;
 
-        /* VSTIP is not writable when both [mh]envcfg.STCE are enabled. */
-        if (get_field(env->henvcfg, HENVCFG_STCE)) {
+        /*
+         * VSTIP is not writable when both [mh]envcfg.STCE are enabled.
+         * Note: VSTIP is writable via CSR_HVIP at all times.
+         */
+        if (csrno != CSR_HVIP
+            && get_field(env->henvcfg, HENVCFG_STCE)) {
             mask = mask & ~MIP_VSTIP;
         }
     }
diff --git a/tests/tcg/riscv64/system/meson.build b/tests/tcg/riscv64/system/meson.build
index 9684628014..87a26389ee 100644
--- a/tests/tcg/riscv64/system/meson.build
+++ b/tests/tcg/riscv64/system/meson.build
@@ -141,6 +141,11 @@ tests += {
     'cflags': cflags,
     'qemu_args': ['-cpu', 'max', qemu_args],
   },
+
+  'test-hvip-vstip.S': {
+    'cflags': cflags,
+    'qemu_args': ['-cpu', 'max', qemu_args],
+  },
 }
 
 if 'qemu-system-riscv64' in emulators
diff --git a/tests/tcg/riscv64/test-hvip-vstip.S b/tests/tcg/riscv64/test-hvip-vstip.S
new file mode 100644
index 0000000000..f89e3e32b5
--- /dev/null
+++ b/tests/tcg/riscv64/test-hvip-vstip.S
@@ -0,0 +1,65 @@
+/*
+ * Test if hvip.VSTIP is writable with menvcfg.STCE and
+ * henvcfg.STCE set.  See Gitlab 4593 for more info.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+.option norvc
+	.text
+	.global _start
+
+_start:
+	lla	t0, trap
+	csrw	mtvec, t0
+
+	/* Enable menvcfg.STCE and henvcfg.STCE (bit 63).  */
+	li	t0, 1
+	slli	t0, t0, 63
+	csrs	menvcfg, t0
+	csrs	henvcfg, t0
+
+	/*
+	 * write hvip.VSTIP, read hvip again and verify that
+	 * VSTIP was indeed written.
+	 */
+	csrr	t0, hvip
+	li	t1, 1
+	slli	t1, t1, 6 # bit 6: VSTIP
+	or	t0, t0, t1
+	csrw	hvip, t0
+
+	csrr	t1, hvip
+	bne	t0, t1, _fail
+
+	li	a0, 0
+	j	_exit
+
+_fail:
+	li	a0, 1
+	j	_exit
+
+trap:
+	# Any trap is a fail code 1
+	li	a0, 1
+
+# Exit code in a0
+_exit:
+	lla	a1, semiargs
+	li	t0, 0x20026	# ADP_Stopped_ApplicationExit
+	sd	t0, 0(a1)
+	sd	a0, 8(a1)
+	li	a0, 0x20	# TARGET_SYS_EXIT_EXTENDED
+
+	# Semihosting call sequence
+	.balign	16
+	slli	zero, zero, 0x1f
+	ebreak
+	srai	zero, zero, 0x7
+	j	.
+
+	.data
+	.balign	16
+semiargs:
+	.space	16
-- 
2.43.0


