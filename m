Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C4B606A321
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 13:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iwVUm9xR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AxkvKQ7e
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWCvq-0002VF-AF; Wed, 25 Nov 2026 08:21:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xWCvf-0002Sp-Bk
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 08:20:58 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xWCvd-0000e5-IE
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 08:20:55 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AP9mbjo796736
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 13:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=6505ZE7yV1y
 aZ7Tz7xueT/9+yrJHVlZ1qKiE85sneOE=; b=iwVUm9xRJ0L3X23G/Qr6W4mpw/Y
 5q/RxMC6Nt3j74tGUJ37SQVsaKYR4WbBRUqmII8q/lspESY0ZszinEUuS+ch2MQC
 pR8xVAivDV28YTn+LPzyWZRCFTeB+3jub5gYK0mZvCzVbVelsmUuEo+5qiWLt0jl
 R85aZbo2Clx2WgZzGRopAwCWLSCdoR1vo2on0pl0mJWX3fhmcKaZnz0diPe1Rkyi
 LGA5by5NtGoi4CWBPqf4SpjfiMzABz1v+JTiP6Pvwbp4WNMkdNcEsUM9q/buoHBq
 duosP65DGIsNRS7l5SDfILu5n8/zoxdyECteeYnbsIhKnWKZtxBexxXzIrQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rtus5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 13:20:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-55ca6405c20so116159821cf.1
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 05:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795612851; x=1796217651; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6505ZE7yV1yaZ7Tz7xueT/9+yrJHVlZ1qKiE85sneOE=;
 b=AxkvKQ7elcyaVli6OUKF13N3i3TCgo3y3rk5dLx30WcIMGRghCPdvd5vLl3jjAcOQW
 3AMIinUYW41pG429qZX47CiCgHwOnHEu11dT4s7SQOR6aAh55DfFBnvE7eZzF99VaSXj
 XNcDhh/eeJFgyeGfrUJ52erzmUT/0N1rjMvLr4a8WdBSgo9cI9eHTSa3SHmMMtz3E//L
 iwwGtmjLsKg9A6qzl7dj7kw2EAwFZUI71/yY/riAlOPYmsUUU9luGwjIfrY6Ei2gqALo
 HZpQ2v10LD9RH1WiX2dLbNKsRZOlGWaxTaQ6dNF9xGNBSxAOTX6fa/vCZxfDopQ+mG1j
 gb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795612851; x=1796217651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6505ZE7yV1yaZ7Tz7xueT/9+yrJHVlZ1qKiE85sneOE=;
 b=2tknzBKgAyWWQYvsc8BFb4/rsMD2ac/84s60jVTC4ZYKUXfYvmnUcXNHnkaR68TuCv
 Xl1/rEPMIlp2kEGCy2olD1+BKhSTr8aEAycTICwa33azXw3hTodi3iM7TeBMsn1Gyatg
 +ChgaZIo/P3/BylojcTNoHwFOlfYrnmHeuF+YF8tSeWGeTmtim5AKEH3oZItJd6HWJ1D
 fcITj/vet6FRudC2Kt0WGJf++Tj+MzRBS+1sj88jHTRFw0QlKbaxvRiP1ZR56wCK8t8j
 dF7k5+VMYBpCfw1TnLw8MNi5PfJ7rpruu2tIpOlAZk1UU/fElGBovs1upxEnssZWIxHf
 lt5g==
X-Gm-Message-State: APuU4Z8uuzOExRHsV8QypOTh0XY18Q5gEUGMt0xfkaVax7V3qk6Vyusc
 CM7OEQr3byo28e5K3YzGBZW1ZdKLkRCVvApQA6wdV1Jit2iVIMn3kgcHuj2oBQXRXVuwQ1N1MK1
 lsqxQLA4BliHUaHyDgXpfsNRr1NY+mlmh6RQP6oM74vzzbkTio2z+LeE9sw==
X-Gm-Gg: AZFdTZc4N0sZOhfxkBPh1b2DQvbYn6XyWcMyvKxWmnccVmrEx++xlP87NYXG6KeLHy4
 28qdpA/y9LtZWGTL3y98UpcN3x7lCqPEsoPF3A8cZk5K46+44rySWo4vm9M5Ix+d7jk/Sc4JNDL
 AVNFTaXcyC997jd7FaP1V4NpqpZD2ibQg5sAvysmrSyTdm4AIwJXr5ggSMUIULKXsuZY6XHZkbc
 0gjfz2+vl6+bCa454DJND4+xCVCav+M0MX79XfpBMfJVV+/Rfkvs1qkNcKZTIMQcNc5fqcXSopf
 QESD/6/vWyHm6x194viIc5KiMs30tQN+ku8Pdeo+tLNS0U5c76/Ya66A4vlN99sCmxTZKS11Zkj
 VBi7liGzJsgtQ7FfjFmwn/HqqZwI4LNERw/SnrJyhxSm7DQOSmJIan3MmIUyvGWdYouDzS7Er2V
 8FbJXn2x9b9A==
X-Received: by 2002:a05:622a:e3d9:20b0:55d:8484:6506 with SMTP id
 d75a77b69052e-55d8484669emr189581391cf.27.1795612850985; 
 Wed, 25 Nov 2026 05:20:50 -0800 (PST)
X-Received: by 2002:a05:622a:e3d9:20b0:55d:8484:6506 with SMTP id
 d75a77b69052e-55d8484669emr189580881cf.27.1795612850303; 
 Wed, 25 Nov 2026 05:20:50 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-92134a08552sm160836946d6.34.2026.11.25.05.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 05:20:49 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 03/15] target/riscv/tcg/csr: filter bits when r/w HVIP(H)
Date: Wed, 25 Nov 2026 10:20:02 -0300
Message-ID: <20261125132015.229955-4-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125132015.229955-1-daniel.barboza@oss.qualcomm.com>
References: <20261125132015.229955-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfXy5zzCTqJ5JDv
 Emnkeu7QCrlz5mGFBwhIaoDxCtOxFMaG0rwRzqoa/7f1lzwDZSApHuUaWqReHM5dVGNgXj7R0fC
 IZVuCakw1qHCuaOFeNNhRCIdYTE+fWyWfTiab8EPw/65hhOzPPq7WToCticPszDh83yCUOpzNe8
 LGeFlFDXiwWLGopzDT0mb5uQiZqOJWccLCcEicZnqsJjrOz4oELkKBRwf309cj9reiw2rXx236S
 llBa8ZSdLX3aTtfTfCBurBvex1HAjHrSCwsgJob2YQn36HaX3MfThgZrSj7bZ3yusre1folYwVo
 h55yuyiKSrcFWwChnyq+1eVyoAet2piWcIgAJYmhd81V3va5RBvqh4X2AD1mI6QS+cU0yhB0A2t
 8BK0JXPW/IPWUnF+2yGxFr0RE/EXTtS/iN4mMvFjB/VDzbdzfWUqv389Ae2c62EdZ3M+/4DzrSj
 4aF+4MN3bnaZggz3lJg==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b06e0b4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=FibE5N0eoUlo320SlN0A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: mxwZ_o_-UlrigCwumNg9VagdQT86Y5CH
X-Proofpoint-ORIG-GUID: mxwZ_o_-UlrigCwumNg9VagdQT86Y5CH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfX8dnhbnPFM+4G
 WcqvQ5kGJSMN2zp15EhWtYhZnMiXErFfZ3P+EpT/JUVaTPU+u7sAiCvtHNDLhvv3cjyUiYKlLfV
 +wflnYVfShXxTDYnHbQ9440ZnMD7RJ0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250053
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

rmw_hvip64() is not filtering out the bits from mip/sip, hosted in the
'alias_mask' variable, when dealing with HVIP.  The bug is rather
straightforward.  Given:

uint64_t alias_mask = (env->hideleg | ~env->hvien) | VS_MODE_INTERRUPTS;

when env->hvien is 0, alias_mask will be a full 1s mask.  This mask is
then used to retrieve the mip bits (via rmw_mip64) and then later when
filtering ret_mip.  The end result is that HVIP ends up providing read
access to bits it can't write.  The spec says:

"Bits of hvip that are not writable are read-only zeros."

So we're in a direct and trivial spec violation.

Fixes: 40336d5b1d4c ("target/riscv: Add HS-mode virtual interrupt and IRQ filtering support.")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3133
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/csr.c               |  8 ++++++
 tests/tcg/riscv64/system/meson.build |  5 ++++
 tests/tcg/riscv64/test-hvip-read.S   | 41 ++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 tests/tcg/riscv64/test-hvip-read.S

diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index 0e2ef8530b..c94ce88594 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -5139,6 +5139,14 @@ static RISCVException rmw_hvip64(CPURISCVState *env, int csrno,
     uint64_t wr_mask_hvip;
     uint64_t wr_mask_mip;
 
+    /*
+     * alias_mask, aka the bits that comes from sip/mip, should be capped
+     * to just VS_MODE_INTERRUPTS when reading/writing HVIP.
+     */
+    if (csrno == CSR_HVIP || csrno == CSR_HVIPH) {
+        alias_mask = VS_MODE_INTERRUPTS;
+    }
+
     /*
      * Both alias and non-alias mask remain same for vsip except:
      *  1- For VS* bits if they are zero in hideleg.
diff --git a/tests/tcg/riscv64/system/meson.build b/tests/tcg/riscv64/system/meson.build
index 6c3de32965..9754c2a55a 100644
--- a/tests/tcg/riscv64/system/meson.build
+++ b/tests/tcg/riscv64/system/meson.build
@@ -126,6 +126,11 @@ tests += {
     'cflags': cflags + ['-march=rv64gc'],
     'qemu_args': ['-cpu', 'max', qemu_args],
   },
+
+  'test-hvip-read.S': {
+    'cflags': cflags + ['-march=rv64gcv'],
+    'qemu_args': ['-cpu', 'max,smpmpmt=false,pmu-mask=0xfffffff8,smdbltrp=true,ssdbltrp=true', qemu_args],
+  },
 }
 
 if 'qemu-system-riscv64' in emulators
diff --git a/tests/tcg/riscv64/test-hvip-read.S b/tests/tcg/riscv64/test-hvip-read.S
new file mode 100644
index 0000000000..20a1492924
--- /dev/null
+++ b/tests/tcg/riscv64/test-hvip-read.S
@@ -0,0 +1,41 @@
+/*
+ * Test if a HVIP read is returning 0 for all bits it can't
+ * write.  Based on Gitlab 3133 testcase.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+	.option norvc
+	.text
+
+	.global _start
+
+_start:
+	li    t0, 2
+	csrs  mip, t0
+	csrr  t1, hvip
+	bnez  t1, _fail
+
+	li    a0, 0
+	j     _exit
+
+_fail:
+	li    a0, 1
+
+/* Exit through the semihosting SYS_EXIT_EXTENDED call with a0 as the code. */
+_exit:
+	la	a1, semiargs
+	li	t0, 0x20026	/* ADP_Stopped_ApplicationExit */
+	sd	t0, 0(a1)
+	sd	a0, 8(a1)
+	li	a0, 0x20	/* TARGET_SYS_EXIT_EXTENDED */
+	.balign	16
+	slli	zero, zero, 0x1f
+	ebreak
+	srai	zero, zero, 0x7
+	j	.
+
+	.data
+	.balign	8
+semiargs:
+	.space	16
-- 
2.43.0


