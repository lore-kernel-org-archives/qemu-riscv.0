Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55383606A336
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 21:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SFcfqdWN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bzVinN91
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xRc4D-0003Un-DI; Thu, 12 Nov 2026 16:10:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xRc4C-0003UQ-AC
 for qemu-riscv@nongnu.org; Thu, 12 Nov 2026 16:10:44 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xRc49-0000AT-7x
 for qemu-riscv@nongnu.org; Thu, 12 Nov 2026 16:10:44 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ACJZhCA178931
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 21:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=ZLYQ5NxiO2Z+UUQ4lmXwNpEmHqDgCosPqwV
 /YZfowCg=; b=SFcfqdWNBQcwvRBdEar/4vCPcAX1JH59LSXPlJrymn+HBWyoqGJ
 NvMb31WPJoahD2r1HGRRLQTAonPms0TtZyesHKBsY5d3as+87jpWBO1Je4ByMae/
 aX68f9Lt5wVpE6JatjV2T5HY3+2sF0KqUnqm4CS5QL9sTt9cbwfqARiAkMDD2HVd
 wkPzVpCTbkoKjAGjHj1pQwaAhC9z1w1ryMHEhQ9yZpCjfM+RowueuY+wrFuMuZk6
 J98m+2ZLPIGGMu9puXbywI13fBRP+QhXbzirMgPuYITq/l3JjPFYPLW2cibNhmum
 6yfNp2dKLJqp8qNZWMPW7Uu/vm3UmUJNTcA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e1aw2u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 21:10:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-934963b2bc0so38012885a.3
 for <qemu-riscv@nongnu.org>; Thu, 12 Nov 2026 13:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794517835; x=1795122635; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZLYQ5NxiO2Z+UUQ4lmXwNpEmHqDgCosPqwV/YZfowCg=;
 b=bzVinN911vEKHMvV8GjGGcmXgSy9hygfr9tQ68oiOSWxQOSxTnShayaml7RCl6yXXw
 HTyMvL0Y9KV2YefcvodCU3ZXbBoLhoRqmR2nWi3hku60WOM0DjDT4baw1FywVI0NAOr7
 FNdOSesU9o2PkG6CZjzeG/PNz0/hC37/sh2P06N+2yMxbdwvloJriDbwUStPPXJ8i5T0
 uTtk8H/lQxJnV1gZXpgpqBuYc1rdUor4fqfQGxOoEygpKqI7xUr7JkpaoX3+9wZx0fa/
 eKpi5Dh06PEJs1S1E0KpsPwUuE6bdFZ+AWkfKaGcUBvdO2aFsSZ2vsi+aO/3O819mG5t
 jpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794517835; x=1795122635;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZLYQ5NxiO2Z+UUQ4lmXwNpEmHqDgCosPqwV/YZfowCg=;
 b=lP0dIDhkKcPpUp9kstJxks+ktciKUwNwcoICy0IZmDgZ++pfh1CkAWdsaBi4Jq/MB/
 qOF8M6s7rdOR8MMXYjXFHONrPtzvDr2Lr3b8uH4jUcXsW6btkE9mI1Dy+Jx/N8KmTK0l
 HN1+SqIgsQeKKlJPX5FbLfGHJqZmgbYqiTucCdxFNrkNTpZFg6TiVT15iPsP1B9dk8kX
 or1NcRa+E8tUPCCfg54nmLTLZ7bazkuWOZHhZ1k63dHlPZMlWb7pSNpocYazffBrgOwE
 GzxY+gcvq5DN/dTqnuxPomGbzyIzjuVqkElOKBI+tWPwsr8F0bKNcDSeUqYFh2J6HJRU
 1TZw==
X-Gm-Message-State: APuU4Z9rR6Hv5KwexMvEiFpIoW1hIryhxc8maCBpPoOsUfkVQanK4qTo
 Hgbd0R9gBDFNTFjF9q3GpmfFGEeCmOLjy0Bl3PCrlNKijfH+Zff6id4TgeiYakjz6ZNlS1+ehCb
 VfGy++hKQAFkZ6F2Cmf9i4V3YhxiiGwqfBiCAbRlGfQZY7jpSdGqE3+pIWA==
X-Gm-Gg: AYBFou292h0u24iZVMaOG8Wshq0SiffyezDxSRStdO87yt/1280xp9S25ztY716DtuR
 EQx1Kh6Oj0MCTPlTvkOUjpNymeTF//kIppd22HjGvImpcb679iOD01uMdK2BHQpLtZ6cEIIDD7D
 MDek/QL/ZKR1D0Tkwzv13SvOxGVneiAY7/4Doa+DR+m16xw7GUgrtIjPaw2L/ODThMpXyOCKebn
 Arood9NyqgIKocwHZVDuTNkIGZrMdU3O8TLi7ZsZk7Wc5s5GROCSQ8YX/L6oYNSmDWtKQ9t1TR9
 VTdmYtVm0Zk7WUDvwtsu7NtQ/fW0eim1gJPC/onk1cYcCNGsX8uDwUkGvOePtoOuEpQfkTS2GJ3
 Lcg7GOuFt/mQTIZXnxgSqblCWfr8Dvw5v/BQ0wmBYr28Am2HCaIpxIVUp+8K9fCej+iDBH73oJe
 PPVBLs6gc3k6CUW7ZghW5FdjxIRZhfyfGSZGbS40rj/uxI
X-Received: by 2002:a05:620a:17a2:b0:93c:c7c6:90b5 with SMTP id
 af79cd13be357-9494ba4b603mr107763985a.9.1794517835420; 
 Thu, 12 Nov 2026 13:10:35 -0800 (PST)
X-Received: by 2002:a05:620a:17a2:b0:93c:c7c6:90b5 with SMTP id
 af79cd13be357-9494ba4b603mr107757585a.9.1794517834792; 
 Thu, 12 Nov 2026 13:10:34 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com (189-68-253-226.dsl.telesp.net.br.
 [189.68.253.226]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9494c8d8298sm26998585a.38.2026.11.12.13.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 13:10:33 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] target/riscv: do not clear mstatush after mstatus write
 [GL4488]
Date: Thu, 12 Nov 2026 18:10:29 -0300
Message-ID: <20261112211029.562640-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA4NCBTYWx0ZWRfX6f3UZDWiv4Sm
 eoeRznRi0Z6TF7vAQLbS9p0ezAc60Fy0o0eQUikdvCFK9cGYK/egLUWcSnx/3wdrykURnDODRgR
 BbwojECmXkdsU2IqAdxR1ps3TxU7EW5qV49bpUlQHqpiWKUluXhNGDdJIQr/U1TD5H+qzCdXxAu
 8/Qqf1ZzUzOuzPCIBkDhF+yklOcUd3StzHKcb8zjvbdu6NlpLdjCT8yaVi3DGGTU3CAeV/SWXCa
 BkylG2tQHi4btkuW41C2VMEdRNX4IF3u2wQK3QUWLXQkoxIazkyk6hftZ62vke02nv4mD331q9l
 nT822BiqA11iCbia88F1666Ab5xkpHRGtmnn9DjBEmGb6HGawCt7UYzjtLxs0dAkzendF9EcTka
 q+tRXQuFiIPZQFD8va6ssmso0ByvYgTFmG3Um+g+s0Ncax1UirlZHiGyj68tG/YU+xrRr2phOXP
 eR6fAg+pFfg/Cn5Rg7w==
X-Proofpoint-GUID: jx6Vcynx4sRfjIL-VbUO-CGbemH3VzI-
X-Proofpoint-ORIG-GUID: jx6Vcynx4sRfjIL-VbUO-CGbemH3VzI-
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af62b4d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xcxBfRYLw5hNHjR815/AfA==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=ifGG3HfVTgaK5DfkZOgA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA4NCBTYWx0ZWRfX+1W3TcCcsOsC
 daLduCH5Z+GCSG/GweI+9PcMFnwwjzXknyj6zhKlHC5JE82ZED9X4zDT/VWVYinEuicJlWL2jev
 4MnCQhdiUbiNjqmoYJLWByG6qoo9gjw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120084
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
 tests/tcg/riscv32/system/meson.build    |  7 +++
 tests/tcg/riscv32/test-mstatush-clear.S | 57 +++++++++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 tests/tcg/riscv32/test-mstatush-clear.S

diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index af444e3e6f..ab436244cf 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -2127,6 +2127,15 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
         mask |= (MSTATUS_MPELP | MSTATUS_SPELP);
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
index 117ae6fbce..c70cc12517 100644
--- a/tests/tcg/riscv32/system/meson.build
+++ b/tests/tcg/riscv32/system/meson.build
@@ -22,6 +22,13 @@ tests += {
   },
 }
 
+tests += {
+  'test-mstatush-clear.S': {
+    'cflags': cflags,
+    'qemu_args': ['-cpu', 'max,smdbltrp=on', qemu_args],
+  },
+}
+
 if 'qemu-system-riscv32' in emulators
   tcg_tests += {
     'riscv32-softmmu': {
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


