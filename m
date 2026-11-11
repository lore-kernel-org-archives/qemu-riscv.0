Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA242606A324
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 13:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XTLrdvD7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fqZtbDrG
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xR8XP-0002kZ-8g; Wed, 11 Nov 2026 08:38:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xR8XG-0002h4-EL
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 08:38:48 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xR8XD-00040u-5s
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 08:38:45 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABCZ25c3292079
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 13:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=Z0ikpwZsKqoW2kRg0BMFc5icn+Z9FE20ZZE
 3z2QxyPM=; b=XTLrdvD77c118SbZuoSEIBtWQHgDvzPkLqiJseIsFdSFMx6P4Vb
 I7pSwOwyz4sswgy3Pzc19D4bpNB7GsvxbMmA8gGPpVyEFfybZvpGw9qXviraNSC4
 ghaOMiCM6BE84kO6TUN1HG7aNx7CoKtcFp/1M6/YCBn4Fb/615gaohYojXh0ZAUB
 69x6M2wgTmuehsSAhfSY8CdlVfC5OTjKsL9DZdWu5HmXgVUVvIoEV0U9k6qjqj0O
 8TkysAeWcCB6VLYg0CsHBWMdm6w5d1NbVrEOvbjSlKcl2bxmKim2bc4Ad6GfGZ5h
 2wYgulU5aIeZFamkBF9UgAj+4pBZ9l05rKg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnp2ptq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 13:38:41 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-91c046843f1so76240276d6.1
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 05:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794404320; x=1795009120; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Z0ikpwZsKqoW2kRg0BMFc5icn+Z9FE20ZZE3z2QxyPM=;
 b=fqZtbDrG0Ga8YDZqSccj1A9wu6mtNjXRy5JQVYHPqP9PURtkuL7Ox0o7BuKeTqShRo
 Bx1w1Hg8BiGRGwG0cyb5wT5ToVlCosZXE5hSD9o+x6npnENL5RKou6vKuH73O6BHsby5
 c960hbikeU/YdRfLuI4PqjGD6NG7UYH9dOl1mNz5h9oFcYwdEdcBcrgO7KgoABuVeujF
 TK6DcUoL2BJ8Lggt3D1ft3QtTD9/B9y9Tu9MZlUbF2hycX+eYNahhu69YjtSWPXMJ3ee
 xoGaB4d2RAprsBxjS8qiOb69tW74YndHRtfr9BvC2us3s79UgsMLxfu4wie3+ZXHmeIx
 dHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794404320; x=1795009120;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Z0ikpwZsKqoW2kRg0BMFc5icn+Z9FE20ZZE3z2QxyPM=;
 b=UTB3ZmUYSLWp9qT8epdAQDyfNB54l66MhggilyAlabrVauHkdmxwpDOPVXkHUNDkex
 z3Du6vueduslf2iBHZQ7u4BWh65dcev2tQsmsrrfunjAWBGszUrw/voVaXI+wtcNYPs5
 spq64nhNwjxjIC10pBK+ceSELrMwzqHpJ3FjmaB4KejjsXTy+CuBvHSDqgUPDU9ZV4zc
 lVeuSP8x5OQzeHsHzk2Orl68pu9DjLxDvhRSDQV++5c8wr48XEspuS6mDgC22hDHrwOC
 YuQjSKcbsST9VlgwqZmzEEnX/IEXr+cTg6pOS81BJnm3ksl+gtWXBnCHyOWw+KLRvdns
 97GQ==
X-Gm-Message-State: APuU4Z/KF/KvkkMyVwmXnSrK/KWm4xA+AWbIkTYcKyKD0mEDFUReO7fJ
 44Zmvx0qhgX/8daxalK7jyaqgo1BpzRYz+eI3ZOmv8LZbv/JrU8UpElmvAp+B6YZk2vwnsq8OLi
 WbHmvf0lPRkrb80GShKW8s3TvFTtPIxy+Qqlc/mkeoCAx4fNm/MSgDuHLkA==
X-Gm-Gg: AYBFou3BpRb/G+1FsHz83gbRjX9+4WAPpCylazUFX4E73Q/wouIt/kqNRSskNnzsZHD
 AmGUgFrK/PdaouNxBK3O7qaW0CBK5/TKIpQdHJThr6VJ4vber84Y3+n9jR2BsDKteiVqi9mC4YM
 XAsonx/mLF4e39jMtxkLvV5+b/U+0rZ61N0EyPOael9IrhBrOyHKN2IFAeNWhRHWKi0hVqNw3FU
 HpD4cll3uQZ3y3mvfYbFW2aw5d4cQHgcCnKF+1ZXEpW2j8Hrg7XNz7yrtf9l6OTVS5E5/el+pzS
 r2zvbsXg5JfHEH5DbjFYUVx722IAYCqSX+N48LZ0Ipf+Bmhsv54y4yIh6QsmBi4csDsV92UPYt0
 vukj+sUsM5gegYJS/lOZcCjK79fD5sOJodkC25S2RPbc1i5QAVg+nMWaSUkBQ6vFxuAGtD069QK
 6WppTTxC+NnUfAqWwjryFT/y7MANHQ+/SKOZQgoDmwcWmZ
X-Received: by 2002:a05:6214:4a05:b0:91b:5d39:e13b with SMTP id
 6a1803df08f44-91f04212a11mr41658216d6.48.1794404320023; 
 Wed, 11 Nov 2026 05:38:40 -0800 (PST)
X-Received: by 2002:a05:6214:4a05:b0:91b:5d39:e13b with SMTP id
 6a1803df08f44-91f04212a11mr41657736d6.48.1794404319356; 
 Wed, 11 Nov 2026 05:38:39 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com (189-68-253-226.dsl.telesp.net.br.
 [189.68.253.226]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ef04b01c8sm47374976d6.10.2026.11.11.05.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 05:38:38 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] target/riscv/tcg/csr: filter bits when r/w HVIP(H)
Date: Wed, 11 Nov 2026 10:38:33 -0300
Message-ID: <20261111133833.258917-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NCBTYWx0ZWRfX6lEN1p6+SO0s
 7xJ8kPXUEs/wcjA5Fldhj5HBgoODcJiUev7M/lSnUgFsCKChlRp26i0l/SIiJMIZDYqclPCs05G
 I97PONMcMUFwATuw3se12vunXlQojvuFbHKXxs+qUwFSBQCz44IOc+fPgsMmE80QKs+Jz+hxV/F
 IKUHs5T1iAGT7frlNVkxz/wPInm+COEFe0D6P0/SZDIV3V1Qj1aTvdMBE0yVUtaiIB7veENwJQN
 /2MJ3D1ORUktIJ1IbKpY+hAv7ZfTH9jpNohBWoKJZ13agbvQkEz32BpslHC9ASVZ+XLYsDmI7vN
 JK0pZLQg5xORokKUiDAt39Ivh5M3vkFdwRMliDU/11bxIN9aE6ivW20Eg2jbE7OyVrW7vc/mJa7
 FcC+IAfz5kwA4X5ilFd1PvhNHA3cw4wMEDoXPY1HMtJ60VIxeI2m9nRzFzMw/roZtlOCVvQM3YP
 iSj9T5XfAf6r6Qz3t5g==
X-Proofpoint-GUID: mU9aJ-cjKedeI9Is1Wl1K4bzI2XZL7Qy
X-Proofpoint-ORIG-GUID: mU9aJ-cjKedeI9Is1Wl1K4bzI2XZL7Qy
X-Authority-Analysis: v=2.4 cv=NK1AaE6g c=1 sm=1 tr=0 ts=6af46fe1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xcxBfRYLw5hNHjR815/AfA==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=CAa-Uoc_l-2XtQuzupkA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NCBTYWx0ZWRfX0cgbc4ZWY58+
 Y3Zqii4f2mUVKPuibdoONtYHyN4D+yljuoBf+DEKv+0m+i9JzvWgnkYd2y0D7hWEK0alA7D09Wc
 UpJ34bi1mWpFer5nS+WKHyhTHroXr3k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110054
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

As a side rant: I am less than pleased with how rmw_hvip64() is turning
out.  It's doing way too much with way too many CSRs (hvip, vsip, sip
...) and a bitmask salad to go along with it.  Every time an issue
appears we have to patch up a specific piece of it, usually related to
one of its CSRs, and hope we're not breaking anything else.  The
alternative is a full refactor of all the CSRs callbacks involved to
decouple the logic, which isn't the greatest time either. We should
definitely avoid this kind of design in the future.

Fixes: 40336d5b1d4c  ("target/riscv: Add HS-mode virtual interrupt and IRQ filtering support.")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3133
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/csr.c               |  8 ++++++
 tests/tcg/riscv64/system/meson.build |  9 ++++++
 tests/tcg/riscv64/test-hvip-read.S   | 41 ++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+)
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
index 3c8b018d9e..db494f70c6 100644
--- a/tests/tcg/riscv64/system/meson.build
+++ b/tests/tcg/riscv64/system/meson.build
@@ -89,6 +89,15 @@ tests += {
   }
 }
 
+tests += {
+  'test-hvip-read.S': {
+    'exe_name': 'test-hvip-read',
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
index 0000000000..e1cf6c774b
--- /dev/null
+++ b/tests/tcg/riscv64/test-hvip-read.S
@@ -0,0 +1,41 @@
+/*
+ * Test if a HVIP read is returning 0 for all bits it can't
+ * write.  Based on Gitlab 3313 testcase.
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


