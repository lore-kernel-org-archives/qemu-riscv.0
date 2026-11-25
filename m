Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C618606A33C
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 13:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YX5F9lJF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c5VPYG+i
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWCwf-00038H-1P; Wed, 25 Nov 2026 08:21:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xWCwA-0002g2-Sm
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 08:21:27 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xWCw8-0000hi-LG
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 08:21:26 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AP9mHdX3763959
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 13:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=4CBm32AKdCK
 GSgkhdP/5MnR7wS0Yjt7U3ZvOWnO8J5g=; b=YX5F9lJFng0QRNrOIyqnI1Uncq7
 FUzam25aBPb2++jwIPeikPq8LoqZU4pfNEsk9j5/dHqGUj+VnnofFI5aNaEx3XO1
 FwFjZZE1hpwiQIQ71ebMi1IGC+EUoSoTAotpovcjXm20qrYRv7IEdXMz+aq2HXut
 JAqySfxV+uVcMkZmpPK9HNuJtz+RbXncE97diW8YShDmFkbRK23emyQIiwzGBrnL
 y4NLo/NkKvfyfCwL6WrQCyJyQgTH1oc6APYIB1WP1yRMHXGRdkYA7ZOIDKZBZ4n8
 /vt+qesGBpgeF+AUpbByVBWZwiC5JZNFFAOvwUJd7bsBofqDVgwJdoZQzqw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2ry1t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 13:21:13 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-990c957f129so2085100241.1
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 05:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795612873; x=1796217673; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4CBm32AKdCKGSgkhdP/5MnR7wS0Yjt7U3ZvOWnO8J5g=;
 b=c5VPYG+iKrEvzCkNKI+RglER+RpOwTjNgsCM1q2JmsB84c5IDV7AtKdj7z9d7eRQXE
 BMpHkeecS4YvYD4hxAmBV6/Gz7TYOCSVS6IqQQ+FXZbPSn4gdhT7ukCtPPmb+e0MUYzB
 vAX2S6t/MgBpL9hwg9hR/GzrWIUij1qQ1TRZmwqy4XAJJo1oGv/ERs4LVyzkcSnyfpzA
 W+VRFsST5imAD2Npe8/G9CbKWBbI2ubJxAPa1/10q3Pi2KPql2TeeYTTVNuOZpKqx3jW
 lcJLYbL+9OH+rD3CQfe/7KJPgcpmUL6/xvU31GYwIE/u9DAfA6Jcx/I0e9cJMvhOxJP8
 n5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795612873; x=1796217673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4CBm32AKdCKGSgkhdP/5MnR7wS0Yjt7U3ZvOWnO8J5g=;
 b=E2jS+wdyXsfRSVP0+HP3dDrvjc65T/7ztmbRLVK7jC56l69QePA5r5YU2XaNbMsMRC
 tcHZ/cFaD1PI9sYLBe4jR7BEmsdXQ2QGzbhcC1whLhIZedatWHaXM0kiCNNdJZGCBQqP
 Oh+ZeyoKg2OtznpaB/rgCz4oInN5OmyoYOzYAnHIkkIzpafK7R7a/PAfjKnVW0hJ1Bdr
 PEzvD9ndVOFD4jO3c632v7+fSFvunzK1uIFrNKpnj14+3G06CVyaO/6ZY3Q5kWT21yXq
 AKvb7o+08Hp7oZF/iaDJpuTWs0vdU0W1XA2Q1LEorkaMsanUlJDWJ2XIm+llEqXzr4qQ
 pNyA==
X-Gm-Message-State: APuU4Z9e4LwoyR+fc9fU8IN/lr+EYksKn1tf18c3WRXDqTBQATxzuH/2
 6Q4dYqrIVcH2EC3404nX3N6FBa95XN8vwH+h3qHuhSX+z9aTehwTVBITmiFjk+F0EjMhHY9mEN3
 yYeW4PjaDxMT2aeRj1cDVmlcAmXwwc4gXFhT+gapQNFpNcVqFaLsePkaMmQ==
X-Gm-Gg: AZFdTZcEP8urEgShsw1+WFWuNF9EJYSMUtnqw/FNjyDA4mJ/rbCEyVvg80XD6p9Rx+s
 IZvxghG2W/m6WlGUwMB1w+PGy5RsN1NKx2l6w7ynbOJPV9V8/fcVynsLNtkeI8+UozbPkRsHhqO
 eakDJYkWnmS1SLXNquyCRBzSvJTDrNMEA7bgqDfS0BXNFmURs4LQ1gsV2jy2uuVdyRsfab7zjsi
 0tfsy+dAhOKRwSDBD148H9Io7eLHnst8GR8zdI9opnFJqsC0XxPpa1MjzbPXbLLmhgKImIGXzN+
 RUnQQmAFZD8u38lBNdDdAOfO04PafWKr8X25RjFZ/kOzpI8LtdT3hYVPm6MMPBg4tZfSeJXycq3
 VOuMpyAofDP0h6wRk5627bRLDL2dd8iJajIwl6lFRT+HiLybqoR+Icv2x14G9WrolRv7ekES/PY
 hx4I/N+O4DYw==
X-Received: by 2002:a05:6102:41a3:b0:7a3:b2c2:2e70 with SMTP id
 ada2fe7eead31-7d7395e32c3mr6028395137.11.1795612872793; 
 Wed, 25 Nov 2026 05:21:12 -0800 (PST)
X-Received: by 2002:a05:6102:41a3:b0:7a3:b2c2:2e70 with SMTP id
 ada2fe7eead31-7d7395e32c3mr6028376137.11.1795612872326; 
 Wed, 25 Nov 2026 05:21:12 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-92134a08552sm160836946d6.34.2026.11.25.05.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 05:21:11 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 11/15] target/riscv: do not clear mstatush after mstatus write
Date: Wed, 25 Nov 2026 10:20:10 -0300
Message-ID: <20261125132015.229955-12-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125132015.229955-1-daniel.barboza@oss.qualcomm.com>
References: <20261125132015.229955-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfXy/+h8cDj2926
 vtsc8MwCa5nflxzHfezFT0eKMzorVG8SbGaseDN+bxLUs8g/tSi1HIC/0PR8jupYhtOkjWCh4PZ
 +1s+Mf94NCxbebXoEgSi956dPaIlcyo=
X-Proofpoint-GUID: hH1AqnvMQ4Km8S3FtAeTFILu187id5Dp
X-Proofpoint-ORIG-GUID: hH1AqnvMQ4Km8S3FtAeTFILu187id5Dp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfXwfvbW6dv6KtE
 3iQllIgJo8kiUtm8oYrIZT/UXdWGspW0ri+1sJ+Rz8uBCRAiBZPmJXGAR5xnuN6p0RcFm8z2HSg
 c/k8UA/LG0VjRX2kq7oepYiT72gdPehpv8OmY/7ETtXTB63M0lBu/hSYA9HIJZiNy6p3ZPANSY/
 aYaZVs26wZI9T+NkEV9av6zyROASoOO5KO8wyE5RyANtoahPVuoWD4sVYhrS3wkHPyeaCu7TZue
 vhq1/3oi9mvBKt212ZtEO1jmuNI4/5XZ9WjlHjS/f4UxffefW9c93paioS4RKWMXJOml3X+iV8E
 vmnF2u/INzuZnZUJdL5tJjZMgPvSb1nB+xTBphbTo+tZkstV7aiLZI5WkAzhFU8yoaT+6UeOT4f
 bKyhxYw/GDqh/PePk/oc8oryX3iaKc3wlJCGGhfKjzQSmXaUzWYycquGO1Zpkn63R1HkNHGaGWL
 X2Y8yfsb4WfbkAG79zA==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b06e0c9 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=ifGG3HfVTgaK5DfkZOgA:9 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250053
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
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For RV32 we have mstatus and mstatush, both 32 bit CSRs, that shares the
same 64 bit container in env->mstatus.  mstatus will read/write the
lower 32 bits of env->mstatus, mstatush will read/write the higher 32
bits of env->mstatus.

We forgot about that in write_mstatus() and, when running in 32 bits,
we're happily setting the write mask with bits that belongs to higher
half of env->mstatus.  The result is that whatever was written there via
mstatush is being cleared.

The solution is to clear the higher half of the mask if we're running 32
bits.

Fixes: 284d697c74ef ("target/riscv: Merge m/vsstatus and m/vsstatush into one uint64_t unit")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4488
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/csr.c                  |  9 ++++
 tests/tcg/riscv32/system/meson.build    |  5 +++
 tests/tcg/riscv32/test-mstatush-clear.S | 57 +++++++++++++++++++++++++
 3 files changed, 71 insertions(+)
 create mode 100644 tests/tcg/riscv32/test-mstatush-clear.S

diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index 929ee0a279..9414f741d5 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -2161,6 +2161,15 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
         }
     }
 
+    /*
+     * For 32 bit accesses we're writing just the lower 32 bits of
+     * the env->mstatus container.  The higher bits are written via
+     * write_mstatush().
+     */
+    if (xl == MXL_RV32) {
+        mask &= MAKE_64BIT_MASK(0, 32);
+    }
+
     mstatus = (mstatus & ~mask) | (val & mask);
 
     env->mstatus = mstatus;
diff --git a/tests/tcg/riscv32/system/meson.build b/tests/tcg/riscv32/system/meson.build
index 415a1c212d..3217c51951 100644
--- a/tests/tcg/riscv32/system/meson.build
+++ b/tests/tcg/riscv32/system/meson.build
@@ -27,6 +27,11 @@ tests += {
     'cflags': cflags,
     'qemu_args': ['-cpu', 'max', qemu_args],
   },
+
+  'test-mstatush-clear.S': {
+    'cflags': cflags,
+    'qemu_args': ['-cpu', 'max,smdbltrp=on', qemu_args],
+  },
 }
 
 if 'qemu-system-riscv32' in emulators
diff --git a/tests/tcg/riscv32/test-mstatush-clear.S b/tests/tcg/riscv32/test-mstatush-clear.S
new file mode 100644
index 0000000000..5053832700
--- /dev/null
+++ b/tests/tcg/riscv32/test-mstatush-clear.S
@@ -0,0 +1,57 @@
+/*
+ * Verify that mstatush is not being cleared after writing mstatus
+ * (Gitlab 4488).
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#define MSTATUSH_MDT 0x400
+
+.option norvc
+	.text
+	.global _start
+
+_start:
+	lla	t0, trap
+	csrw	mtvec, t0
+
+	/* Write mstatush.MDT.  */
+	csrr	s0, mstatush
+	li	t0, MSTATUSH_MDT
+	or	t1, s0, t0
+	csrw	mstatush, t1
+
+	/* Check if mstatush.MDT is indeed written.  */
+	csrr	s0, mstatush
+	and	t1, s0, t0
+	bne	t0, t1, _fail
+
+	/* Read mstatus, write the same stuff back to it.  */
+	csrr	t1, mstatus
+	csrw	mstatus, t1
+
+	/*
+	 * Make sure that we didn't clear mstatush.MDT after
+	 * writing mstatus.
+	 */
+	csrr	s0, mstatush
+	and	t1, s0, t0
+	bne	t0, t1, _fail
+
+	j	_pass
+
+trap:
+	j	_fail
+
+_pass:
+	li	t0, 0x100000
+	li	t1, 0x5555	/* FINISHER_PASS */
+	sw	t1, 0(t0)
+	j	.
+
+_fail:
+	li	t0, 0x100000
+	li	t1, 0x13333	/* status = FINISHER_FAIL, code = 1 */
+	sw	t1, 0(t0)
+	j	.
-- 
2.43.0


