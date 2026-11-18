Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A40606A332
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 10:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Py49vLe2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FKboK425
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xTd0v-0008UA-NU; Wed, 18 Nov 2026 05:35:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xTd0r-0008St-Sh
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2026 05:35:38 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xTd0q-0006fQ-1r
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2026 05:35:37 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AI9kUnA1736173
 for <qemu-riscv@nongnu.org>; Wed, 18 Nov 2026 10:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ZLYQ5NxiO2Z
 +UUQ4lmXwNpEmHqDgCosPqwV/YZfowCg=; b=Py49vLe2UeNDFavWTS4PtfqlTR4
 43j75Y/1ssm70+ilfEcX1WHLgJ2dc1pigDC9UM6G9TiXJcrTAx/ymbTXHF8IJkRH
 A44LKF3J2ZefSh68fGOGvNktLu0wePpKqRuwPxnKzT0D0hF7KmVfTBPmljJDifnQ
 XMze9sfrEiUdjJ62RcpkxqAP7yevZyUp+4I+3zqOR9JsP1cSS6zxhEoybRlVtJaF
 feFRQyEft1WPiSbhcWtdPcNkTxlpksciydUvN7HeytWQUB0VLKa1WsyQpVQCp7Tu
 vxyN3/WRHGkUSDYQsb0Df41b7luXWOnoiBBJ5w6D/iwING5GLzNXjtouZuQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvbak5t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 18 Nov 2026 10:35:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-53661e036a2so14275711cf.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Nov 2026 02:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794998133; x=1795602933; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZLYQ5NxiO2Z+UUQ4lmXwNpEmHqDgCosPqwV/YZfowCg=;
 b=FKboK425N8vXDem9nJPSX/T8NntR+lr4+vg2n7BzJegfJpfgsWhJqwhId3NZwZiLll
 i/Sjlh4BqtXllAbl4AViokWuCa93JV1ukXi2Emvb9C1oOEHI0hpjv+fFsHkCjcOOxlY9
 aQEvsKHYcoZvXbAupBm25BFAxoX//SpeebTqDW6bY3VftJcxURFmQ7WT4wxi9Ia0cEyv
 eDMFeR/f0wcNEhCVlkrBsGKAfq1fcajg1Yte3DA8Enx/912TDRc9ir7xAXfs+STVxAv6
 41X3J9gbWXMcRovqF+L7DQ6NWOUW/NUxJtXTviOgl2aYnI5asmr8G4QwFsAmuIhh+bKo
 Q4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794998133; x=1795602933;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZLYQ5NxiO2Z+UUQ4lmXwNpEmHqDgCosPqwV/YZfowCg=;
 b=fWyQTwODVxXIJd77pDr2xBscFjZOydipH3K2hvxrOylqyfHCnhEn9qxvXUKO6kxiYo
 Zs8bdIZlowuooJYt0x8Qsghgvhln7bZxqSP4L0HSj1vWcZeoyOt3zF6z68McKyY0xY04
 6OTg2d46kroKubxDeiSE4rAud7GWT8rJWQpD1YVfb3t23umpoUnr8OfyUcz1yB1sGovM
 IktUrzt31QfuwH+tTKeQ/tsYN7TztIpU7iQvv9iCWKP/bEBAiBRnvNNKr5Yoo6BWmOgy
 LaPOGtuFAdWG5SSdsUV7tnMD0rMrBLA7nSpPTpMji8jMdehh29w6wYjgvP3qkU0Fu1zT
 ROKw==
X-Gm-Message-State: APuU4Z/K9oHvFLkB2YNdKTgfqwS+HVIrNenaBmm0rTrodW4uM6t4FKjR
 XpGA01lehqRW+oOm6B9uYP4yMhoQQsEaTFUwMMYIbB7NvlM9Ju8UKPUCBvWGsYfAhPYSzST/lPT
 GkUTfv8vwi3qW0HDi7Udg2710G6G6AVEdrdPFQ7RtOAXKSMpxMQCphSbRxA==
X-Gm-Gg: AYBFou05jjqafhrU1C8XEmnSxOFPpY10YnybuwYAl15gvWQbMph8oniBvpUmI9XJAdE
 iINKay2fXudtHZkxSzguYgr/CkyPybi87vHeQKY64VBIw87/7ni+vmhRuY3Rn9WNgY6VcjaaKaM
 jB3DfRc0Zx5pC72PTNw0zVWSVuGLZ0QgSpWxd0bmHyCiu2u9veDBUGkSTOQkv+b1u2PyRAA6/5M
 mlUejWN4/Mvdu/Wkca4duvD7chOWftsEpRKNMwyzp06I5ovpXiE/t4bGnTLNYRIzjH6XQjnLHH7
 Grh+DfEZg9HHrtOU2I+oz7DWkw763H4K9VlOMdVdRh1vohkagQqxpXeGIiPi6Pai3HbHjhQ4XrA
 4BzgCl5rT753rzQJnP3jTkYmK7PmC4rgITdpXTaaMpVb2z3sIOyXZdG0DDS9fllifUIF/+MAM7/
 GHlsNtaWs97eE=
X-Received: by 2002:ac8:610a:0:b0:535:157b:ea22 with SMTP id
 d75a77b69052e-55d5a5c9d26mr28672961cf.40.1794998133292; 
 Wed, 18 Nov 2026 02:35:33 -0800 (PST)
X-Received: by 2002:ac8:610a:0:b0:535:157b:ea22 with SMTP id
 d75a77b69052e-55d5a5c9d26mr28672651cf.40.1794998132734; 
 Wed, 18 Nov 2026 02:35:32 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.227.223])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-55d59102ed1sm18927991cf.28.2026.11.18.02.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2026 02:35:32 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 1/2] target/riscv: do not clear mstatush after mstatus write
 [GL4488]
Date: Wed, 18 Nov 2026 07:35:24 -0300
Message-ID: <20261118103525.1192249-2-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118103525.1192249-1-daniel.barboza@oss.qualcomm.com>
References: <20261118103525.1192249-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -I5n2_gcdCMBzJ5OyNUOnc0oaDiG9E58
X-Proofpoint-ORIG-GUID: -I5n2_gcdCMBzJ5OyNUOnc0oaDiG9E58
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd7f76 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=WERq1Tg1Nl5IKGfG0e6imA==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=ifGG3HfVTgaK5DfkZOgA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0MSBTYWx0ZWRfX+0AsArI+ncZj
 SeC8ztGCW05mIkVix7yIMub45E1sbthtHTE0FCDUmMDQVVmYLPBDswpI4S/VSZb3h4ZsjZnvNiG
 SoIc2ZHROeiopP7Jmq9uHW9BLNg5il4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0MSBTYWx0ZWRfXxRXS7rzAogho
 BaxLq2S2gR5pFujd2kNgTQ21+Ae54eEP5BroFnmL48OPuycdf3tcLRWPQXg4fo7o4Br6+W0UvHh
 wtQyJ89khJ/weUMk6uEpTVlpvayEpfs5x/FmdSiepTN3U2Yjuxi5FYpSu3HzM3XXkXeFnkeDW2Q
 hj0uoj2fOifuGR8a/hxiyLlIbk/8/7znDdmHiLa3cILHAGzYTQYxIdsirKmFSe0ak7ZpUl7MIc4
 Irajbqqt3oeTfkxZhe/zkvZet7XnhqKWWDZsw9pxOnz835rwN25TGQlAo38zGc0pcpUWP6AJ4J4
 WipyFhT9HYDhiMU/wPmKqqlzXcJIAk+hW6Kwgxz8PZ2//MTyQyNka8DdJYdB7eFjd5GqQvIgF9D
 0N6Dx3wcJx0kPu1lHGVjI13XelY731MOwrOO52vg6j48toV39dYY9M7MQRlIDrhdyUMR3T3a6kR
 shWwnZmy2da15sqg6Og==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180041
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


