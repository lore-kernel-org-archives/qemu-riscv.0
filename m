Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1592C79FB7
	for <qemu-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 14:50:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4Jc1-0002rO-Lb; Wed, 09 Sep 2026 10:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4Jbw-0002lD-1g
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 10:49:18 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4Jbu-0007DG-1v
 for qemu-riscv@nongnu.org; Wed, 09 Sep 2026 10:49:15 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 689BU25x1810053
 for <qemu-riscv@nongnu.org>; Wed, 9 Sep 2026 14:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=zdD492Xt6kC
 ItyItAdMpgXFLX67x5JL6tQl71pJj8kI=; b=iNO9NRfdgLKzbMHpJRKcgpE4o7x
 jK9QucEdDfz7zD1JqA75nTm8VSQ4odhLydcSP1psq8L30plMG5JVWRPWE6veJLhr
 +cX8J+ZzYoQ7/Kl9BsH7XET8G6zRfEPZXtsmH1BRmDCQj+XBVTxtRZKNJ3LssBuc
 WK4OBYJ5P73dB3yVrUElQzaSxBLyz6AG6HXlii5D0CDBzUexW/iv4ISniK+irF3m
 z7cehvVaRVeIThOhkfk2Hn+NZMwoAGVxcJbuNQrUkN3aQfFFU2xth0W4oqz6E3Kg
 6KEN8bpv5HyW9BsO8scIv3UDYK3uAAcee9oIf0XtzZ/2JUksIsZpVI+bEZQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk4xj1860-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 14:49:12 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-836c9f68dcbso113726207b3.0
 for <qemu-riscv@nongnu.org>; Wed, 09 Sep 2026 07:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788965352; x=1789570152; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zdD492Xt6kCItyItAdMpgXFLX67x5JL6tQl71pJj8kI=;
 b=AwTcLnm8EcBPrX4nmD386m4FLY722mJuzQqjl58tfK8fwk5tzsCajFogI2MiZjBUBE
 P3Mh3jKDrgNhnCafAZwYLy36Jri8jTBm/P5fCPSYp6Jop4Knq5YCH8aBMRbXI9GETBf8
 WnSMQUYbatM7r8k3Lf//wHrjAtUHTyVH5AL3doYBYfp+3jbcrUeKPR/4RqHRpkgM5y9m
 Onzshm7NhwWynsjeNChkfq9y6E08acDalxT7dZ8GmeDUeQ4wgYeRRf+9E0EwhorNtAuT
 s4MAy0CiEEb/6oLDtIvvGfVX2fdrobhPkHW4fM8b1AfeouCVwo/BRv5rUncGpQ71Yfkb
 vhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788965352; x=1789570152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zdD492Xt6kCItyItAdMpgXFLX67x5JL6tQl71pJj8kI=;
 b=OKLNOoJDZt1KdamBUm2uKEl8PcNaj+8YQX+pwwVL5f++Fgt4IQ8DSP0D6qqSfYNnsw
 4Cq73MSEww+ckJvLzKXl5BUP2Rz5zWPOpvVpdx9+3UTQxfUdomYwUf8nO9xFiegrI/Av
 tSZ4FUmG0/mJQsYLjg3hne8dn18vXBx8P8dy3+leyDDSBAzrrdWUP6jymVL4+f81bSVC
 WCJsUefbwZ8x0pjYDGEubEKPc+eFESCrvIWjMAX64nFez+kgb7A74YpVn0EMmWBf0151
 G8/zAij8WJAqXMnF7ZXwUFP/Wb5P7ujVMUAclvnQBvyxUBTJ7Fgs4FLhlvweOi0xQR4b
 fuAw==
X-Gm-Message-State: AFuF++n0C4cqwrEoY9DQw9KfGeggoocXuEV7DgnDLU7r34VMGjCUO+5l
 d+BeGAPltnxgt5nGxZubbnDZ81Ou91ZcTY3n0oe9ewwl+quwD+GqdTyuyePN6nMS+Zg5sb/bTTY
 /btCv4a6kLkmvgzH6hrZdp5Riufh423xv6ZRdNfcFi2Z+JVh715yml7faFwRjOvW9Yg==
X-Gm-Gg: AYBFou07u5Sk8ysp4CDgcEVfo6sGIKLktwIn2H6faygnkOMsOu4ygW9xhXFM/Za7j0P
 1HiOUplmF3hIEk3zOIIs14ufsouZovk2Lsda+b5ykhQE4YISo8gj77CiZId/iq2GdA+57rzTB1E
 qN1RN+PRmRNlV/JD09weLdNYZT7GXxWmBqbiQgj0uYfwobHccEmxhzFcM6ceQQJzO4ko5HLbcyU
 oZnEXEMi2/LRqkIoTcKIGEuo4nouQVGqjs52J/uoQKoC7NtNo30gESxNf5rzzapkDGQq3/usG3T
 BkK2jD0fjfZBLSd1OAvPl2NUcJvadGZyxJcwD/8YY7Oxj45r3D0hH3sEUxuBgyyOwYdejOiYYdV
 Y8x6G1MlmyTIjPKAwuXOm/e1Fm5kH9MjzJr5I
X-Received: by 2002:a05:690c:4f10:b0:86f:e98c:fbfb with SMTP id
 00721157ae682-871284f6f3emr109361257b3.15.1788965347337; 
 Wed, 09 Sep 2026 07:49:07 -0700 (PDT)
X-Received: by 2002:a05:690c:4f10:b0:86f:e98c:fbfb with SMTP id
 00721157ae682-871284f6f3emr109360757b3.15.1788965346841; 
 Wed, 09 Sep 2026 07:49:06 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-910464bf898sm125678886d6.7.2026.09.09.07.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 07:49:06 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v9 7/7] tests/tcg/riscv64: add sdext "not on Debug mode"
 sigill tests
Date: Wed,  9 Sep 2026 11:48:40 -0300
Message-ID: <20260909144841.1766921-8-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909144841.1766921-1-daniel.barboza@oss.qualcomm.com>
References: <20260909144841.1766921-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfX2eLWEKDevlqb
 bcmPptFKfw+0i1bkLWh7i/jMt8ha6auaU0PRzb24Oa4zudFWXHETFX4BvUydf6ZNQRH0vBgXZAL
 hh8AwVnvhyYZ7AzB7vjNJOSVxbkP9EM=
X-Authority-Analysis: v=2.4 cv=J52aKgnS c=1 sm=1 tr=0 ts=6aa171e8 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=lQlWDN6XiApmBSmPJFMA:9 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: yVY3a-TFki8g1c3RPh7hc9DrKm38dM9c
X-Proofpoint-GUID: yVY3a-TFki8g1c3RPh7hc9DrKm38dM9c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfX7raQ7nBvKsoI
 F98l8zYEbuxAA6ZTTM4PxaaqNrtvIGeN70L9+zlNb18alI+2P9n35tY3CDVll6htT7/Zun4vgiQ
 GmYSg3MfxJ9GzOWENj21oMOBNF5uZ8pSnLKe71LZXlKtnNIQH9syae9wvh7KAwwpAEoVv2iEQXa
 iTzjYbNtY0HSDGlpc1/o6wFyeC85rmujNfKY6EkrQdv4waNeXxoZG5jrMuDhTcsbKeqhZOERWKA
 v0KK2WgJGJLfebWg1IFkcTIzMrTnl7I+fMVkfaxGPd7v2/AVkKQQGukjMVm+U6cHpA5o8t6JqOC
 VBh14qQlFf/ztKyMQvhi4KUshyKCK4hjHoePF/ksTm/9MX/h7D3im8rPiHIdHDuGIaA/oCflKT9
 1lGuWknauwE8lA8xmQZ6Ae75hgI+WnYvkdemd6IRHsi2GCPhY06AFyb2RZTsZYUAnHKjCcZHSFF
 9Vi7DitZJhZYtBc9Jow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090165
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Adding proper TCG automated tests to sdext CSRs requires enabling
gdbstub support for riscv64, which we don't have, since the nature of
the CSRs added is that they run in a higher privilege than M mode.

DCSR has bits to allow for context switching from other modes to Debug
mode, but those bits must be set via an external entity (e.g. gdb)
beforehand.

What we can do for now is a "negative" TCG test to ensure that we'll
throw illegal insn traps when trying to write sdext CSRs in machine
mode.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 tests/tcg/riscv64/system/meson.build  |  8 +++
 tests/tcg/riscv64/test-sdext-sigill.S | 83 +++++++++++++++++++++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 tests/tcg/riscv64/test-sdext-sigill.S

diff --git a/tests/tcg/riscv64/system/meson.build b/tests/tcg/riscv64/system/meson.build
index 8604c2a45a..6a836994e6 100644
--- a/tests/tcg/riscv64/system/meson.build
+++ b/tests/tcg/riscv64/system/meson.build
@@ -61,6 +61,14 @@ tests += {
   }
 }
 
+tests += {
+  'test-sdext-sigill.S': {
+    'exe_name': 'test-sdext-sigill',
+    'cflags': cflags + ['-march=rv64gcv'],
+    'qemu_args': ['-cpu', 'rv64,sdtrig=true,sdext=true', qemu_args],
+  }
+}
+
 if 'qemu-system-riscv64' in emulators
   tcg_tests += {
     'riscv64-softmmu': {
diff --git a/tests/tcg/riscv64/test-sdext-sigill.S b/tests/tcg/riscv64/test-sdext-sigill.S
new file mode 100644
index 0000000000..80a6c06465
--- /dev/null
+++ b/tests/tcg/riscv64/test-sdext-sigill.S
@@ -0,0 +1,83 @@
+/*
+ * RISC-V sdext extension "SIGILL" test: check if sdext CSRs
+ * and 'dret' will throw SIGILLs outside of Debug Mode.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+.equ CSR_DCSR,      0x7b0
+.equ CSR_DPC,       0x7b1
+.equ CSR_DSCRATCH0, 0x7b2
+
+	.option norvc
+	.text
+
+	.global _start
+
+_start:
+	la t0, trap_handler
+	csrw mtvec, t0
+
+	dret
+	j _fail
+
+	li t0, 1
+	csrw CSR_DPC, t0
+	j _fail
+
+	li t0, 1
+	csrw CSR_DSCRATCH0, t0
+	j _fail
+
+	li t0, 1
+	csrw CSR_DCSR, t0
+	j _fail
+
+	li a0, 0
+	j _exit
+
+_fail:
+	li a0, 1
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
+
+	.balign	4
+trap_handler:
+	csrr	t4, mcause
+	la	t5, trap_mcause
+	sd	t4, 0(t5)
+	csrr	t4, mtval
+	la	t5, trap_mtval
+	sd	t4, 0(t5)
+	csrr	t4, mepc
+
+	/*
+	 * Skip 2 insns (8 increment in mepc) to skip both the
+	 * insn that caused the trap and the "j  _fail" insn
+	 * that follows it.
+	 */
+	addi	t4, t4, 8
+	csrw	mepc, t4
+	mret
+
+	.data
+	.balign	8
+semiargs:
+	.space	16
+trap_mcause:
+	.space	8
+trap_mtval:
+	.space	8
-- 
2.43.0


