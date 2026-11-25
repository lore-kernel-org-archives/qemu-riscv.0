Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52852606A321
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 13:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dfhVauE/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FIgYJ0Au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWCvu-0002X2-D2; Wed, 25 Nov 2026 08:21:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xWCvk-0002Tl-A1
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 08:21:00 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xWCvi-0000fI-8Q
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 08:21:00 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AP9mGc43126481
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 13:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=4tEQQ7eidww
 jDePy8Iaa7jhpKNmAip5LpHkQJSjkIjg=; b=dfhVauE/H4PshhQF+puX0DpQaie
 DlekQlcD53mSQIHdqEyv1aw3cyQxhyB2LGjgeGCDiRr1n38DkmyxbUgGW+Qc8EGc
 CQ+A2r6H6ethuRSfTR2WPxkMirFrfBaUW6rctCngTN8mbijngzq/I9OQFOCPh6vI
 dGyhCYXhMr2mC4GCFBKHJuwe3bBsTTKLOHfZ0R9ls/CWKWSNBQ2Z0Sxicb3cpkbR
 tyW8TFkTVqkEw1l9xua6fw8xtdEZxAeamImJaJHMt/pi/8GRVS+AZIgUphvcQ0Pp
 XjYxY9NRC3qkk/scxZtGJ+JKZFuIjAZspyB7U7TQnU+gxQA5TnclUEaTvmA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eydcb8q-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 13:20:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91c6c1e082bso106994676d6.0
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 05:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795612856; x=1796217656; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4tEQQ7eidwwjDePy8Iaa7jhpKNmAip5LpHkQJSjkIjg=;
 b=FIgYJ0AuWNDVMMw6K8yNDn+kneVHBDQKJ7gePU5Gdi+KPdDcPqJQTBXa900gqkiXkb
 rD9IsA+rPJCHi7yRJToPFrxQ5fCgx+YkGwGKSjw9gYmYkXbSDw5L836/rRaz6y4huM3N
 WxYzZ7+kWYj/J86KC3jBGdBZXVtOvWhts99mNMdqlFjPHYdsdQ7353WYWWuLFwDb/f6X
 oaiInit9XUhdycUZ5XutP9V/G3uL0IKbQ7Ua6JnbSebbcJ5qQnJpVZYoaqsH59SgfA39
 1REZr2AiE5RiMt8fLzbjtwq0UskKtMfOHbvVAnV4pmu1V04PaYXFydsDhqEkvDHyQKuJ
 KaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795612856; x=1796217656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4tEQQ7eidwwjDePy8Iaa7jhpKNmAip5LpHkQJSjkIjg=;
 b=pLGPi9pnQGT2sroRJTLWl8n/wGIcO/GZcxe+eyy5a/4QdmY5TV5JvmeXvaGrudvQiP
 YOGAdpfwQp3Dp/9aIXKEezu0AtZHr+YleMTjKNOn+0zCj5SH8RA97UBWh3ekewxNiN0L
 0nV7NkTC/MI2iWJzsBQo1Vb8TO6ohECVNKvgUw4LTwZBGZv4TKti2Cx5sOpoaNAAgUPp
 1OgIF37FBtX+yDj9eoTCH17hcvUS5dwx0F/LqTgmGlh3b2BtHTbt3tXLmBoXG4ef3G9t
 LlaSokyIzI3xE4uujB6gyMJPrGivWGbPzIcNBH2qRdwUf46sHmDOiNhulZkFJ8tPXFd2
 l7mA==
X-Gm-Message-State: APuU4Z/MUSHShmdiefON8m79LHhHBh9xsgtjfz/eJ8zUHV49gMrYkyEa
 qOrXZ4GywxliaLZP5dZikQ25RBFAT8L+n55aaf85bPXNZJHBheNG5drU6ewNMQrigRTrILSTrHs
 mgDps2Qe0VMZdDMuxrcctZgmUKXZ5/eDmjZCS8ZfUIt+YuhIGiMB2m0Y8sA==
X-Gm-Gg: AZFdTZdFNj5K78d1vmAWeeSJiho8aisXkLamU/BL/nIjfS03H/oFXlJE42jpxwjwmI5
 vP4QWytAlHvfECyRwrIktH1uGoHhMKCVum3PWFOrkxcKhZoRFJjOTCoJWt1chDtEK0RKFR0giQm
 6kIXs2hmxT7RJ+m4p9//LWknAIX/LnmdmM68onKKOg7nbZduWAeoW1l4wHrvMnDatLvohQ92zsb
 DZToZ7kybL7EcgHIxr7dEBqYUfPhch+8H+GzTvMxcjfkSziaRkjouugtSUqAjaGPQ709QLexiFC
 tA8R6kk2fR2JVcvUXt/ns6J0toB0zB099r5Rm/YFGTrowugG/Gdt0+cWOmLDpdBYCxcJQc2Tuar
 Xh3kcn/ee4TnJ1sD9N0VPT2In/RH0F6uni3owB/CFUm74uNTCkdN+EZ/cH6SZt0EkHWXH73F2Bc
 +w9klFHYAQNQ==
X-Received: by 2002:a05:6214:dac:b0:91f:2374:9b65 with SMTP id
 6a1803df08f44-9212e0e4c4emr333250776d6.21.1795612855880; 
 Wed, 25 Nov 2026 05:20:55 -0800 (PST)
X-Received: by 2002:a05:6214:dac:b0:91f:2374:9b65 with SMTP id
 6a1803df08f44-9212e0e4c4emr333250216d6.21.1795612855222; 
 Wed, 25 Nov 2026 05:20:55 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-92134a08552sm160836946d6.34.2026.11.25.05.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 05:20:54 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 05/15] target/riscv: clear hgatp bits from write mask
Date: Wed, 25 Nov 2026 10:20:04 -0300
Message-ID: <20261125132015.229955-6-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125132015.229955-1-daniel.barboza@oss.qualcomm.com>
References: <20261125132015.229955-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfX0FUwVlzkzxK7
 EfO4VV8MCEq2zvJVQAYC0WeVgCkkFGC74Rvnfr7KIEXSoGMdrIoUr6A77X5fW6rYPh+1po9qn5c
 1sy1XUaOrfjdJnDYQfX11zjhExRNBB0=
X-Proofpoint-ORIG-GUID: lRUnHEfnB9gZzySbdpXu2z9cdjDBS0Oe
X-Proofpoint-GUID: lRUnHEfnB9gZzySbdpXu2z9cdjDBS0Oe
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b06e0b8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=3sS3A2hXxFRu-t1DIr4A:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfXy6C3Jnr5ecih
 1/5kEKQYf6LbUvz7DfTzQHU3FqhSzZFUXTOm+kRapujaj3ndVkPgVXwIihWLN5IrLSXag2/jexE
 PUy8wQbZvDdISCekJyZKUGPaCU55+jUXYxSl/09zh03BBPR32SqpL1f84IHLFkmnvvgtkei7xPc
 b1sOyrxH1z7/s1ZR1tl4jtcRg38GbintH2lGaKBDvrVzXvUIIvYj0ESOySawF/zLOiW568xpz0X
 1VMqIdvizEAizImk0kPYetKQiFpsu/WCBqcC23sI1tKRFKg4Pn1LKwyORVKzStXlG9N70tJUSB2
 j4iJz2tkz8i/rhWIOMRgvwvgrFQfcpq3/2fGFWsTDldKpA5loJd/C+h7XevC5d0PoeFLDdxl90S
 KlnHLgpfl56LDoFB916Mwn9crVLzFzISpFa1MClOaP67O09VE5gU6x2yb0ktU1otvkFIMXDbzat
 1/EhkuE0eU55atdxWiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
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

We're allowing writes on bits that the ISA demands to be zeroed.

In theory we could let PPN[1:0] be writable for Bare modes.  In the
'hgatp' section the spec says:

"An implementation that supports only the defined paged virtual-memory
schemes and/or Bare may make PPN[1:0] read-only zero."

This is our case since we only support sv32, sv39, sv48 and sv57 and
Bare, thus let's make our lives easier and zero these bits all the time.

Fixes: 1349f9695208 ("target/riscv: UPDATE xATP write CSR")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4591
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/cpu_bits.h              |  9 ++++
 target/riscv/tcg/csr.c               |  8 ++++
 tests/tcg/riscv64/system/meson.build |  5 +++
 tests/tcg/riscv64/test-hgatp-rw.S    | 61 ++++++++++++++++++++++++++++
 4 files changed, 83 insertions(+)
 create mode 100644 tests/tcg/riscv64/test-hgatp-rw.S

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 3579789a1f..dcd3f239fe 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -744,6 +744,15 @@ typedef enum {
 #define SATP64_ASID         0x0FFFF00000000000ULL
 #define SATP64_PPN          0x00000FFFFFFFFFFFULL
 
+/*
+ * Priv spec, hgatp section: "An implementation that supports only the
+ * defined paged virtual-memory schemes and/or Bare may make PPN[1:0]
+ * read-only zero.".  This is our case so we're choosing to clear
+ * PPN[1:0] all the time.
+ */
+#define HGATP32_ZERO        (MAKE_64BIT_MASK(29, 2) | 0b11)
+#define HGATP64_ZERO        (MAKE_64BIT_MASK(58, 2) | 0b11)
+
 /* RNMI mnstatus CSR mask */
 #define MNSTATUS_NMIE       0x00000008
 #define MNSTATUS_MNPV       0x00000080
diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index e132690389..6989393bac 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -5355,6 +5355,14 @@ static RISCVException write_hgatp(CPURISCVState *env, int csrno,
                                   target_ulong val, uintptr_t ra)
 {
     env->hgatp = legalize_xatp(env, env->hgatp, val);
+
+    /* Clear HGATP zero fields.  */
+    if (riscv_cpu_mxl(env) == MXL_RV32) {
+        env->hgatp &= ~HGATP32_ZERO;
+    } else {
+        env->hgatp &= ~HGATP64_ZERO;
+    }
+
     return RISCV_EXCP_NONE;
 }
 
diff --git a/tests/tcg/riscv64/system/meson.build b/tests/tcg/riscv64/system/meson.build
index e176587d1d..9684628014 100644
--- a/tests/tcg/riscv64/system/meson.build
+++ b/tests/tcg/riscv64/system/meson.build
@@ -136,6 +136,11 @@ tests += {
     'cflags': cflags,
     'qemu_args': ['-cpu', 'max', qemu_args],
   },
+
+  'test-hgatp-rw.S': {
+    'cflags': cflags,
+    'qemu_args': ['-cpu', 'max', qemu_args],
+  },
 }
 
 if 'qemu-system-riscv64' in emulators
diff --git a/tests/tcg/riscv64/test-hgatp-rw.S b/tests/tcg/riscv64/test-hgatp-rw.S
new file mode 100644
index 0000000000..4bda3c38f5
--- /dev/null
+++ b/tests/tcg/riscv64/test-hgatp-rw.S
@@ -0,0 +1,61 @@
+/*
+ * Test for writable hgatp bits.  See Gitlab 4591 for reference.
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
+	/*
+	 * Write in HGATP the same value written in Gitlab 4591
+	 * testcase (0x8c00000000000003).
+	 */
+	li	t0, 0x8c
+	slli	t0, t0, 56
+	addi	t0, t0, 3
+	csrw	hgatp, t0
+
+	/* hgatp expected is 0x8000000000000000. */
+	li	t0, 0x8
+	slli	t0, t0, 60
+	csrr	t1, hgatp
+
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
+
-- 
2.43.0


