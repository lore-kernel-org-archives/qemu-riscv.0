Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F336606A323
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 13:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gooM8Zg/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dZj5p1hC
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWCvu-0002XR-SO; Wed, 25 Nov 2026 08:21:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xWCvh-0002T0-Bz
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 08:20:58 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xWCvf-0000eb-3G
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 08:20:56 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AP9mrix3644047
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 13:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=6oxiWNkSf6B
 JG8LmX1T6UuxZLH4idLko4HUpZrmuC6g=; b=gooM8Zg/iSB4jhsAAe5AI+5WJ6s
 /H0H+tE6MZmjwqxpJpVQkNCWvrVuHL2QHiZWq7OMR5iOs9KV2zVKRBe8czc5TLJl
 hclDiUno9a0qHqrUnokOLS69eAUKwMh6nD82Yycl+HJjZi0b2ynnWlK7GwSSzneB
 hj5yzvKgyBwX3rvF5sGFVrgT+y5PPdqXN1+cx6RPMopQMDehvtBOCSLipNQUwOwq
 QMLi546W7+9LKHTUR8XuPV0hDQSY23W+pn6i0BeTbGWOAXbsgFMRoCQ3BzcWOWTw
 5QcVK7SHBHF1+nbcc+2YXbHVZzjR6Tb/6gDv4VHDumJOIKkqMkNMiZhoqmw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2b0ty-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 13:20:53 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-990835cec5aso3553198241.0
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 05:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795612853; x=1796217653; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6oxiWNkSf6BJG8LmX1T6UuxZLH4idLko4HUpZrmuC6g=;
 b=dZj5p1hCXCgjddyUmWUCdxOnKCC7fkp5r4zYRZPMBLFxm7s5BfeizFktSrkGViG++W
 dSm56yamk0tFTdvMp3V+NaQGX7M6I0j4gpv1St+pQK2DS/EF8rvlfMNFHsr/u8Pj7CDs
 MBtk1z+Sdn2USAwRXqabhTITxEfEJjALx46ilZswNb7fkTwKCw7hk4qVTvYfXgVGKINf
 tL1mr/XPgl2i8zD7bfGY705hfAekKiN17iBJRcccclZHfh/5YCACHwyCHFLSZ9yp1Hmk
 WYBQ4MIm9viSJGWBH4yq1LAeVujLISPf7k2CP6T0IkIwuz8OQS3I59srmz6k/KTRWd1u
 jW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795612853; x=1796217653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6oxiWNkSf6BJG8LmX1T6UuxZLH4idLko4HUpZrmuC6g=;
 b=H8TK/ad4rKQYW4AAu7nX7GRpjJejGOOIegsMQI3e/vmM7Qa8Yl8DhWPs0Pz34EpV+H
 KcUpiIqUB/cJAxpqMHHILZiDLIEkJMIHyDyUcnWx1DorlJQgoTO0ERSDbI2FFKuzHcA2
 us67hSxpD6AyAgbJfGazBvydteo+r8wYb2c+/md0BjFcwYoFVZvmZgUhworZ2G6SMziG
 UXN3blDCuovyF1YJVZr+rtIvPtl4XnhS4NqDK2J2gK1oCSX2l/d5dvEcTv+8KLeEo9gz
 M7Jx32GFIAz4PjpKVIu/Rj5nXNOo572kHpflpI1ZcfJURlvP32KoPAtdGLh0XP6B33Fy
 e39g==
X-Gm-Message-State: APuU4Z/QhRvXHfGwXxHfr9mZ7fIwTE2fYWuwZJAuMOs4U/hfNf0BN4CM
 EsdcnCxp2iM5d7dkQUk3Qtn2Y3Bgo0XsGsLFLQwqRPtGR4uoU2ED3AiOocNLdy/nQAjtcUawNIp
 q3H8LvmW4Sob1QfiUXK2jwE6Q0ErCMXhtq5uTr+cfW6XKe1g4c1gE3Xm6RA==
X-Gm-Gg: AZFdTZerdslPVi8FHlgP3RR2PzupQ26Vv8tT1XgDT+k023DJabOQV1nqPLllFxl+1Xd
 eFIMg9YHQvqWSeiXRj7HUSPAja8Vb4AxYHlWd0/CNCjXoytjII4rlML+D1LLyOOzjDm/sQNYJOr
 jQ+YamobOaX2D64UaLa42l+FKPY2eNF7uSv6mjZKhh+UCqa0X2O5c8DDB3fdDIKLvhKG+wcI5IL
 KIiJcFhi54RM4kZ/W7bL7P5HpljfoH49x0p5J+JbxsWiVo4uvkXo6+l+kBOf5yaCLSL2RpKYir6
 nb6Hmo8dN3ruWg2AOY9CtLOIeSlC5I1VLMyeCdRpi0LLs13aB5lKfPqTVP29PzXGLt1fOlEeVVd
 AhDwYQonw09AxRPZmgffMclAx2OyEH+qZpG3EKPyyK9IqZ23s8NDug0iny6B+EXQQSc3hjqLeqS
 +2OB8+RjSrZQ==
X-Received: by 2002:a05:6102:26d3:b0:7d6:a8d7:fd91 with SMTP id
 ada2fe7eead31-7d6db989524mr7303468137.13.1795612853211; 
 Wed, 25 Nov 2026 05:20:53 -0800 (PST)
X-Received: by 2002:a05:6102:26d3:b0:7d6:a8d7:fd91 with SMTP id
 ada2fe7eead31-7d6db989524mr7303442137.13.1795612852644; 
 Wed, 25 Nov 2026 05:20:52 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-92134a08552sm160836946d6.34.2026.11.25.05.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 05:20:52 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 04/15] target/riscv: fix hedeleg writable mask
Date: Wed, 25 Nov 2026 10:20:03 -0300
Message-ID: <20261125132015.229955-5-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125132015.229955-1-daniel.barboza@oss.qualcomm.com>
References: <20261125132015.229955-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06e0b6 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=IH4YEds1svsedXLTdUwA:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: D8DyBJY-V9jqhMM86vga_nc8Yn7FDdX7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfXytaelI/kUNzQ
 6WLc+eMZRpOJ+uYqwNoOeHDX4EZROJkyJII2bxETet7r/1zdouQndYeK6unfaeY7TMalXpE1i9g
 wex6i+VwTcan80nSP/XG/JAWoyczbWNwg/1fd/SKwTLrYOJAXHfSN579VOWFbDbw1BicQE6RmmA
 JOMEbnSd59oMI6wO3sfc7vIzBabvRuHZzKbm2sObhdT1zZBT62Y3DQJbfDqWVNO7JQ+bPrWNGpN
 8rue/7fy/MO17jdwCyWIu9i9fBGyYbREOo8Ou/AYc9TUeHKJ4S2mFbz7VrJ1m72LgPTm48+kqAR
 WxDiXRDUECv1CTfnx9j7SdDd20g3cmwbNm+GwoDpnwxtQkDEGiaYaQMmulnqO0/SzOwDP7/JIA3
 FqZxEGsv8i110oJWG229otdjIxnMegtYt0dxfQZ2S/T+ZSE8+8ifAkaOQwRNoqjSbTKLMusY5hT
 kib9VYYkyVc3e2vyp9A==
X-Proofpoint-ORIG-GUID: D8DyBJY-V9jqhMM86vga_nc8Yn7FDdX7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfXxOeLAZg/wQrq
 dhZQLP9GYQzPUQnOFcrtqAivBDyLj5e6y9ll27YbEK2ELABxvOuA8yaleWsxx1zvOnvq9pM4yts
 C/X14Zj3Xx69Sg2YX5thLFb2X2DxI5w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250053
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Bit 19 (hardware error) must be writable in hedeleg, i.e. it must be
delegable.  Add it DELEGABLE_EXCPS.

While we're at it, hedeleg bit 0 is only writable if IALIGN = 16, i.e.
RVC is enabled.  Remove bit 0 from the delegation/writable mask if RVC
is enabled.

Fixes: bc083a51caff ("target/riscv: hardwire bits in hideleg and hedeleg")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4592
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/csr.c                 | 11 +++++
 tests/tcg/riscv64/system/meson.build   |  5 +++
 tests/tcg/riscv64/test-hedeleg-write.S | 57 ++++++++++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 tests/tcg/riscv64/test-hedeleg-write.S

diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index c94ce88594..e132690389 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -1837,6 +1837,7 @@ static const uint64_t all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
                          (1ULL << (RISCV_EXCP_LOAD_PAGE_FAULT)) | \
                          (1ULL << (RISCV_EXCP_STORE_PAGE_FAULT)) | \
                          (1ULL << (RISCV_EXCP_SW_CHECK)) | \
+                         (1ULL << (RISCV_EXCP_HW_ERR)) | \
                          (1ULL << (RISCV_EXCP_INST_GUEST_PAGE_FAULT)) | \
                          (1ULL << (RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT)) | \
                          (1ULL << (RISCV_EXCP_VIRT_INSTRUCTION_FAULT)) | \
@@ -4947,6 +4948,16 @@ static RISCVException write_hedeleg(CPURISCVState *env, int csrno,
                                     target_ulong val, uintptr_t ra)
 {
     env->hedeleg = val & vs_delegable_excps;
+
+    /*
+     * delegable_excps includes bit 0, which is writable only if
+     * IALIGN = 32 (no RVC present).  Ergo clear bit 0 if we have
+     * RVC.
+     */
+    if (riscv_has_ext(env, RVC)) {
+        env->hedeleg &= ~1ULL;
+    }
+
     return RISCV_EXCP_NONE;
 }
 
diff --git a/tests/tcg/riscv64/system/meson.build b/tests/tcg/riscv64/system/meson.build
index 9754c2a55a..e176587d1d 100644
--- a/tests/tcg/riscv64/system/meson.build
+++ b/tests/tcg/riscv64/system/meson.build
@@ -131,6 +131,11 @@ tests += {
     'cflags': cflags + ['-march=rv64gcv'],
     'qemu_args': ['-cpu', 'max,smpmpmt=false,pmu-mask=0xfffffff8,smdbltrp=true,ssdbltrp=true', qemu_args],
   },
+
+  'test-hedeleg-write.S': {
+    'cflags': cflags,
+    'qemu_args': ['-cpu', 'max', qemu_args],
+  },
 }
 
 if 'qemu-system-riscv64' in emulators
diff --git a/tests/tcg/riscv64/test-hedeleg-write.S b/tests/tcg/riscv64/test-hedeleg-write.S
new file mode 100644
index 0000000000..919de1fb3f
--- /dev/null
+++ b/tests/tcg/riscv64/test-hedeleg-write.S
@@ -0,0 +1,57 @@
+/*
+ * Test for writable hedeleg bits.  Based on Gitlab 4592 testcase,
+ * which is derived from riscv-arch-test.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#define HEDELEG_W_MASK 0xcb1fe
+
+.option norvc
+	.text
+	.global _start
+
+_start:
+	lla	t0, trap
+	csrw	mtvec, t0
+
+	/*
+	 * Write a full 1 mask on hedeleg, read it back, see if
+	 * all the expected bits were set.
+	 */
+	addi	t0, zero, -1
+	csrw	hedeleg, t0
+	csrr	t0, hedeleg
+	li	t1, HEDELEG_W_MASK
+	bne	t0, t1, _fail
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


