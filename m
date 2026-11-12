Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971EC606A337
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 13:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SmV89pxo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d+Gyux/O
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xRUig-0006Xo-Ge; Thu, 12 Nov 2026 08:20:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xRUiF-0006J9-5V
 for qemu-riscv@nongnu.org; Thu, 12 Nov 2026 08:19:35 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xRUiC-00075W-R0
 for qemu-riscv@nongnu.org; Thu, 12 Nov 2026 08:19:34 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ACBf9m7442019
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 13:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=2Ms9ESbUqNo
 8NGsWncKyuPiesUhUUjZqf7vmVf/c3Hs=; b=SmV89pxoHkv6v6jiWu1AZ+zI/Qq
 397LQD0FFwYe3uK19iwxgKyWZwPvLBCQY4HeBdd+kg2T6fnhJkoyRfpzTi/yI8UM
 iXCeeiR6YxPsRT+GF21tz2lxnHjIAfJQXniooj5JQijy9MpV7TMxDBFTep4APsO3
 ZIbQPkqk/WfFzPdPaYSCulKdeEeh2GYpM+CriMacUZYkJkZe+EeFFKyIBv95FbXj
 rrAZ0LiegDYNLmYqqC+2A+DFz/xBiBjprgpeHWGt1V4NwJwMfMWQHqbsufeUvRNn
 d5IRwIPXZkRSJDShlaRpZ+N4nETHvSq2dw6Pm12Ph2g/DDYYgVu/xsYMxbQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc1k9w-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 13:19:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-91eb05c8241so74991986d6.1
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 05:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794489570; x=1795094370; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2Ms9ESbUqNo8NGsWncKyuPiesUhUUjZqf7vmVf/c3Hs=;
 b=d+Gyux/O+I2mtXnApebfNlqOXHqfN7kD+x433xImIoyQKzSfxzVv/uKrPq2tPXTUZU
 ikjLAxiHNFUZbV3n9amZgW99KZUkidB4HBUevuVL6uPYyKIlJb831LcxPzJT2vU4PbAi
 M/IAsQFR23Wz3UXUz9e/Sv46/c9RGQ39aNPJBIGxOakaZ5t6KUqTRegVvgEZrhfppT1C
 HwxNKYLPinHJVRhHDwfa69kNc8ZytYZqG8a3RgoPl10+uUpZB4cV+mNPGNC578thmwd7
 nmuCjQh5oV6Zi6jZwYpNcg0BF75FvTBZCtZQyImzzD0D21SMm0JjM/UjwniS4M6pIdp4
 14sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794489570; x=1795094370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2Ms9ESbUqNo8NGsWncKyuPiesUhUUjZqf7vmVf/c3Hs=;
 b=r7mUDXiK9/pRmv5VsG27d7FjoXMlKvDY+9c+bPrcjcGc8AHbHBTXp6e2YK5NRftRo4
 BkP/qiSHIjad2tcgBEaz+828Yg2tiRi4ub0tAw88fKS4AlwEce3FlBHJX6Vv9/bG/RbE
 MDo35qqnREROKLpIrqFFTvXfGTyQA9oIHoDw+ADKGXOtTuSvogEkrnRac6CVMgcHH/sl
 c4VMFMLBWbbwXh/7hbSHKxCkmwoKWC/ox7NpKEKAgvxJfvHMT5qwtnB6glO39soVvu2p
 Fu5nv5TBIbP9ER2RY+3zhO+E8yIBUokgcs1vO0/9wkSzQJSrveLRCQG/fKma1RWjJK8J
 6t0Q==
X-Gm-Message-State: APuU4Z9ABVsD2G6PwBgfEIyE1w1wCNJ16PAAA0X+I2J7wPNUqPsjXr/p
 ItsqM7xrqvzAV+rKDf9uBzRcyh2LIDmiGPrdRWfSn+8ZVHnIFeIl5NC42hj+GzUsTpX79m2zmGS
 zXwh07BwW/aL2qzrRM/jnPD/kkKnwakkBsPO077CjMlWPg4C3D3Hm3avcZw==
X-Gm-Gg: AYBFou33Q2hgRUT2GEIXD/wAEtjtjIdURP+um3UEkyAqugAfYW55jqINm+R8MgFmyHo
 1drBukgR7UY8YOSXDkDLiu7qLZtB634xfUxZsZKFi87ikJ9jE78QpAKB+EvggHTIgRxSG6mLPU+
 VWcKpeU+67BlEr3HnVA/2tLGl+BRHYYErI2MgAKbZY4dqhw7xHqFFk61epB0FYRTnivW7snsyYu
 zNqC/ysFM7GtJmPPurzV9KCGBEf+WH+ILb7TxI1YavGSsGweWW7qqr3Ver6WHuNnQhHJa3dVuMt
 WN1sqFIhB1dNpx1gpA9mNzzXAO663iaqWV7gQfBIXr+ls4Qg1rAhSKYoG0CLBYMLsX8IfXVi1Sm
 LuFWn0mwrjWt6BWgKQNDYwGUPqbngEHGq6werkCmaQFun3h8zBya+oXh+It2L2tmZKTxx6MBbiF
 XJoOLLqX0MTGg5fgqGGIhnpvSBK+M60giAtSl/fTeGUyTe
X-Received: by 2002:ad4:5dca:0:b0:91e:8c55:dffe with SMTP id
 6a1803df08f44-91f04145d48mr92080796d6.26.1794489569979; 
 Thu, 12 Nov 2026 05:19:29 -0800 (PST)
X-Received: by 2002:ad4:5dca:0:b0:91e:8c55:dffe with SMTP id
 6a1803df08f44-91f04145d48mr92080376d6.26.1794489569489; 
 Thu, 12 Nov 2026 05:19:29 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com (189-68-253-226.dsl.telesp.net.br.
 [189.68.253.226]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91f02efe5ddsm46350186d6.19.2026.11.12.05.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 05:19:28 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 1/1] target/riscv/tcg/csr: filter bits when r/w HVIP(H)
 [GL3133]
Date: Thu, 12 Nov 2026 10:19:20 -0300
Message-ID: <20261112131920.485933-2-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112131920.485933-1-daniel.barboza@oss.qualcomm.com>
References: <20261112131920.485933-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QLZvyteDn9P5VfJZ8ln9prq2XyBgVZdw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MiBTYWx0ZWRfX8fnZDVk4TLXD
 Aj1Dhf1M5T2KbmtzpaMiS655/fBQIwQXI6EXZgqyyRboXh5dawJr6p8QgyhwZH+OP/exRrizVSG
 xRfa6i3Sv+AqqtrPnJ5DYKXuIUl9eeI=
X-Proofpoint-GUID: QLZvyteDn9P5VfJZ8ln9prq2XyBgVZdw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MiBTYWx0ZWRfX4JVt0xtW3DzO
 bQ86o6abrdSmnPrbUaYzogPQnpasJKtmJhi0IDRExtn49vigSYZ69LgdDLwkPP2ZOpnnN9iNYhh
 OttfurEuxSSe9inZC7If1tWTIvT4WD3lOEjy0kEkmH++mH7+Z3LZsaIWZAM7AQrNil5Buu+OzlT
 Mneetjh4WV5OzL+U/IxvlqtDsY9uHbU7Q39IpZSRlvWT5QkH2hfTGaOxAW+1S1nHcyi5j7i21Ne
 mFg2ZDOx6RK59alQ0gY/IQ3OLG+8hHkpWvmaaB0ram65HBPssSVlmNlBdY/YAazM1v09MEqluaz
 +GiaJra8G6d5wM2M4NuBNs5wn9DQwcnsVA54sPIjmzAkfgkQWMbEeZo7oyLAfKDLDUGaLVEGDV6
 1nWOsELNZHZHAhy7ptrSajRpBoxWyc37SV+9esQDplAUemHWFzt6lMUJzmyV3c3F6GIirddFixg
 uFCzL2wb6Laik91HLYQ==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af5bce3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xcxBfRYLw5hNHjR815/AfA==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=CAa-Uoc_l-2XtQuzupkA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120052
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
	autolearn=ham autolearn_force=no version=4.0.1
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

As a side rant: I am less than pleased with how rmw_hvip64() is turning
out.  It's doing way too much with way too many CSRs (hvip, vsip, sip
...) and a bitmask salad to go along with it.  Every time an issue
appears we have to patch up a specific piece of it, usually related to
one of its CSRs, and hope we're not breaking anything else.  The
alternative is a full refactor of all the CSRs callbacks involved to
decouple the logic, which isn't the greatest time either. We should
definitely avoid this kind of design in the future.

Fixes: 40336d5b1d4c ("target/riscv: Add HS-mode virtual interrupt and IRQ filtering support.")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3133
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/csr.c               |  8 ++++++
 tests/tcg/riscv64/system/meson.build |  8 ++++++
 tests/tcg/riscv64/test-hvip-read.S   | 41 ++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+)
 create mode 100644 tests/tcg/riscv64/test-hvip-read.S

diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index af444e3e6f..9b67f2d764 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -5078,6 +5078,14 @@ static RISCVException rmw_hvip64(CPURISCVState *env, int csrno,
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
index 3c8b018d9e..7eca59222c 100644
--- a/tests/tcg/riscv64/system/meson.build
+++ b/tests/tcg/riscv64/system/meson.build
@@ -89,6 +89,14 @@ tests += {
   }
 }
 
+tests += {
+  'test-hvip-read.S': {
+    'cflags': cflags + ['-march=rv64gcv'],
+    'qemu_args': ['-cpu', 'max,smpmpmt=false,pmu-mask=0xfffffff8,smdbltrp=true,ssdbltrp=true', qemu_args],
+  }
+}
+
+
 if 'qemu-system-riscv64' in emulators
   tcg_tests += {
     'riscv64-softmmu': {
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


