Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA8D606A31E
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 13:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RwsIq0Vn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bPQw+trR
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xWCx0-0003Tq-V7; Wed, 25 Nov 2026 08:22:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xWCwG-0002mz-0r
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 08:21:34 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xWCwE-0000iB-0Z
 for qemu-riscv@nongnu.org; Wed, 25 Nov 2026 08:21:31 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AP9mOq3555528
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 13:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=LH5/T/WTO2y
 +K7VE019zRy+Z3vALoCprjTmvlwdA3No=; b=RwsIq0Vngbh8/uuOZ7siutWAmIZ
 KBFicPSnSGYqtKXcCbm7yoV+OeTYMPLDclA90iOROInJc9h5c4BleYd1Y/HTB55f
 quCiMVElkte2++xd3lq18nWxMgy7lTYh0yIoenXZ8Q7VeeqqDoiUONHS3+RPyj63
 irOjMSs/sVIvlI4njtzPT/m+IBOIGUH7SyLcIphJ7zmxhdUlOUt1sOYMKs6o2NSg
 tSWLGWwih0EQ77voqnJgLLNfu+9YCohX5SumrOQ3218nyF03DvzkIcygX/yVszHq
 9XwbiCwvskAObh4gZg33Yz4hxICaS4eX7JHDRlyMTxhkLGdJ4XdNghAfU4Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnrymg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 13:21:17 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-7cc48fbca26so920837137.3
 for <qemu-riscv@nongnu.org>; Wed, 25 Nov 2026 05:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795612877; x=1796217677; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LH5/T/WTO2y+K7VE019zRy+Z3vALoCprjTmvlwdA3No=;
 b=bPQw+trRQg07tHiPCkQef+uFuP9EenXNlBhNOzlW/GHf/vM03CuLY3vMNWvG3bnGk6
 LeCNUj9/oHDMmFc+BSFe1UJjM2yVXHUYI3zowMESdOYqfle1msYmAquzBQ04jQND686x
 2NLbkF5E8gOnJZTNxtpu/qmOJUvbwVQCGjIf8tpIy1kGfB18hXf06IAHYOooxu+V10vX
 uca7tFFzLgK0qq/CvQXnBhxUSu+kG3Fdn0o7KUxRr0vzlcSJ+SidwR6V7dmXhAX0ys+K
 iShlfABwrDNS4Rf9qXpCMYlkWOrGqKFjZaKKupqfdeP7RJ5/s40VHvTSMMpKSHGIZEf9
 JApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795612877; x=1796217677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=LH5/T/WTO2y+K7VE019zRy+Z3vALoCprjTmvlwdA3No=;
 b=A0gSI673QmJUsvV8OSwbpDTKriAeccnzAsEwlBLaUOKQnNriRi6YFiIgkJqyhlWxgo
 Zauz82ZM6cIl6cI4Vv/QEiSGbKS6b6OxD5oBEinjpi1CthCr8VvRzMlcVMdBRXEpe+VI
 m/pWBBUL9StazLqvJxhLzBfuC15cfQp+/s49yO0bfCIc6AsRfIWkhQ51OTklBxxPvFV3
 Iy55x705bq4G914XkHZZdLt25UOdbDGKtS0cuh4H+4mGFp6fhPPgnqYulXhTtETxVDIF
 xYkx6JTrbp3wZ8h2L0pLk7p2s3l1QCL6gurxV5xCQH2r8x0HgeXbvCzjyIsFc57Fu9yg
 DwGg==
X-Gm-Message-State: APuU4Z8vnVb55nTUcI00ZfX0CtdxDGdIAzqKdKSvYV/wYYQc0u4Y/YSQ
 pmf5I4tALQI4gwv9/gznuaMeMzcuvIp0xCv32pdY2rx3SnQxpGJWBr+vFaCZl+XuFIieLivyhN5
 zKuiPRxBgAsV08nO+hZ2G6ChGNZgTS2sNlbMfxrXqR2hVTf85no0r5lcgdw==
X-Gm-Gg: AZFdTZeQ3/Z1zKQmFnHvzft6lhEaRodjDBSbZpGfrF+hXLBkfquar7nhuAc84ORXyE/
 hgyj/0A1sYABJ1TWkHP4dC+ttF2hm04bnSqjp57lk1Gtnv3JcAASjJKAQwIuE4ByaBJhHasN2f9
 aSMNrw5VLbBpF/93hBMAmaculNhzB5Qo7mph/PFrHBHKI60PEyGns8ia75TAvLc87dvt8MQXvOu
 +/vSoP3ccW5bX07FLOjLSflvuNeKu4oQTJ7VCEbiXl62ErKQoyDUTkjbFq1U/LFNBh5pUHTJEjD
 WrNdGjvP9T3cHs9X+B1hF7Vs8MkbtjUxwxo9PmIehKedR2hnLxAo8LcJrpfp1Zn0rxQJfIAQ2zC
 SrxLnMqzAmf0kRnH7Gptf8/v2urbkH/LBgkR/YtkSOUEyE1LxT593qC+yRjvG2VSK5usA4z/TZ2
 AO4juynJUBDw==
X-Received: by 2002:a05:6102:3712:b0:7cc:32ce:4c51 with SMTP id
 ada2fe7eead31-7d739696e39mr7717095137.8.1795612877161; 
 Wed, 25 Nov 2026 05:21:17 -0800 (PST)
X-Received: by 2002:a05:6102:3712:b0:7cc:32ce:4c51 with SMTP id
 ada2fe7eead31-7d739696e39mr7717046137.8.1795612876588; 
 Wed, 25 Nov 2026 05:21:16 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-92134a08552sm160836946d6.34.2026.11.25.05.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 05:21:14 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 12/15] target/riscv: clear mstatus.MIE if mstatush.MDT is set
Date: Wed, 25 Nov 2026 10:20:11 -0300
Message-ID: <20261125132015.229955-13-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125132015.229955-1-daniel.barboza@oss.qualcomm.com>
References: <20261125132015.229955-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfXxwJPFbgIkJ+A
 r3XYRldw83LPPAm2NYoDCYvEI1tM7Wuf2OKyFRw4FzigAzzo5K3pIDN7y7ftlkU1K0Q8CwkhodM
 O1PeG5Ox2z9t/rNWcGt8Lukp259dPyatAd0BA4gZs0rybEKZP697BHtsHhnveuKdkKSeOCI933o
 4GvI5G0T7+G9A9m0s0ZGqmegAL6SmJdcE2aX5fwvLMemCFegVmuqx3gf4SwTgG5t48DhPKM+ElR
 vXOriHceWwcWU+wzTaah771kQ5udyFbgwbRPIxgMhykhMd7G2gWGbiE871lETbnf5Q6MqDHmgmD
 ntfunXBM5zEN9qhvVRRqUHt50cY9iRCWw9SkWT/nsyX36Kri8rWpI9xCkvgRtdsVfKRWqj+ckB7
 K58MHzE0u/iVZUlTBfP2qYgcc7POKrOOwkpnvXzYey6RZ+l475zn/9N9NfJ32gzj9t4/GfnVr8w
 hcnGpRKMauzKBxbDWpw==
X-Proofpoint-ORIG-GUID: -ftx2ad2i9THjq0pvKkJQPwsl5VuICST
X-Proofpoint-GUID: -ftx2ad2i9THjq0pvKkJQPwsl5VuICST
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfX4/JnSuUfm66z
 ZRaoFksKAguOIsRb90eko/TodXt/qd8nG+hc7r4BYTDzZrBTTDFK53RfyrobTBCedpeztXTnY4l
 /SWaPHX9rLyvHDSUmUJ7wcicBELmeX4=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06e0cd cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=iTC3F798xIRISN9uQnUA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
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

This is the same logic used by rv64 with the difference that, for rv32,
MDT is located in mstatush and MIE is still on mstatus:

- write_mstatush(): clear mstatus.MIE if mstatush.MDT is going to be
  set;
- write_mstatus(): for rv32, if mstatush.MDT is already set, clear
  mstatus.MIE from 'val'.

The logic for rv64 is unchanged.

Fixes: d2e92f1c6d44 ("target/riscv: Add Smdbltrp CSRs handling")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4827
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/csr.c                    | 22 ++++++++-
 tests/tcg/riscv32/system/meson.build      |  5 +++
 tests/tcg/riscv32/test-mstatush-mdt-mie.S | 55 +++++++++++++++++++++++
 3 files changed, 80 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/riscv32/test-mstatush-mdt-mie.S

diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index 9414f741d5..429d7093a9 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -2091,6 +2091,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
     uint64_t mstatus = env->mstatus;
     uint64_t mask = 0;
     RISCVMXL xl = riscv_cpu_mxl(env);
+    bool is_rv32 = xl == MXL_RV32;
 
     /*
      * MPP field have been made WARL since priv version 1.11. However,
@@ -2130,7 +2131,19 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
 
     if (riscv_cpu_cfg(env)->ext_smdbltrp) {
         mask |= MSTATUS_MDT;
-        if ((val & MSTATUS_MDT) != 0) {
+
+        /*
+         * For RV64, we'll have both MDT and MIE in the same
+         * register so the MDT state that matters is the one being
+         * written in 'val'.
+         *
+         * For RV32 MDT is located in mstatush, thus we'll have to
+         * check env->mstatus to see its current state.
+         *
+         * For both cases, if MDT = 1, MIE must be zero.
+         */
+        if ((!is_rv32 && (val & MSTATUS_MDT))
+            || (is_rv32 && (env->mstatus & MSTATUS_MDT))) {
             val &= ~MSTATUS_MIE;
         }
     }
@@ -2206,7 +2219,12 @@ static RISCVException write_mstatush(CPURISCVState *env, int csrno,
     if (riscv_cpu_cfg(env)->ext_smdbltrp) {
         mask |= MSTATUS_MDT;
         if ((valh & MSTATUS_MDT) != 0) {
-            mask |= MSTATUS_MIE;
+            /*
+             * Priv spec: When the MDT bit is set to 1 by an explicit
+             * CSR write, the MIE (Machine Interrupt Enable) bit is
+             * cleared to 0.
+             */
+            env->mstatus &= ~MSTATUS_MIE;
         }
     }
     env->mstatus = (env->mstatus & ~mask) | (valh & mask);
diff --git a/tests/tcg/riscv32/system/meson.build b/tests/tcg/riscv32/system/meson.build
index 3217c51951..79ad7b89ac 100644
--- a/tests/tcg/riscv32/system/meson.build
+++ b/tests/tcg/riscv32/system/meson.build
@@ -32,6 +32,11 @@ tests += {
     'cflags': cflags,
     'qemu_args': ['-cpu', 'max,smdbltrp=on', qemu_args],
   },
+
+  'test-mstatush-mdt-mie.S': {
+    'cflags': cflags,
+    'qemu_args': ['-cpu', 'max,smdbltrp=on', qemu_args],
+  },
 }
 
 if 'qemu-system-riscv32' in emulators
diff --git a/tests/tcg/riscv32/test-mstatush-mdt-mie.S b/tests/tcg/riscv32/test-mstatush-mdt-mie.S
new file mode 100644
index 0000000000..8763bc8768
--- /dev/null
+++ b/tests/tcg/riscv32/test-mstatush-mdt-mie.S
@@ -0,0 +1,55 @@
+/*
+ * Verify that when mstatush.MDT = 1 MIE is read only zero (Gitlab 4827).
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#define MSTATUS_MIE 0x8
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
+	/* Read mstatus, set MIE, write it back.  */
+	csrr	t1, mstatus
+	ori     t1, t1, MSTATUS_MIE
+	csrw	mstatus, t1
+
+	/* Make sure that MIE is not set.  */
+	csrr	t1, mstatus
+	andi	t1, t1, MSTATUS_MIE
+	bnez	t1, _fail
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


