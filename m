Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD526606A320
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 06:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eIhSOu9J;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pf04Qum4
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xR2Hz-00023T-34; Wed, 11 Nov 2026 01:58:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xR2Hw-0001xK-IB
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 01:58:32 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xR2Hu-0007un-Ng
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 01:58:32 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AB5KI3B1386357
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 06:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0lTxAsMA3QpN+9zMtyW0vyhW8QFqCxQaW0AWlpp1bQc=; b=eIhSOu9JDhC+k81b
 Mj0vOImDZI8greZa0huICkZ9dIDxrXSV5u8J4coQ/eFpuwSAH/Xoxmg7ikBwVlCs
 zywUTkWfh0fNYcNh46116qIlYk+mifuRHaF7xt7pBRiYv68Ah98cGoBWaMIFb/aA
 hBo0VWyfh/RBXl+lFeShzXYuyebNHV8NdYAcriyCAIsa+rQZJsc7CrG6L5BdsI8m
 W4W/ZqfKgqS6r4VtUTh7mOJYdOePtI+yLQ7V3AcSMPJVCLiVB9iKfzRpnmmT11i7
 epVmGam1jILN4s+J6A35xZMozgk05J1R0o1X69TkS0XNOoYnQyf5GZtre9nZKqKf
 zRT3hw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnm99d8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 06:58:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93f5844e383so555652385a.1
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 22:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794380308; x=1794985108; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=0lTxAsMA3QpN+9zMtyW0vyhW8QFqCxQaW0AWlpp1bQc=;
 b=Pf04Qum4DYgYNskyt2IuVhHt2KLRpYRIi9ZWozMWX3ForIIMbIFjBj2+Wi8XmscLjT
 KKQhokQoj/bMcQE+ibeqXuRKfaG7avjsrQRdQ1gJqwhuGc3IlBpakKF7/aboU/8gvoi6
 J0GdLFB9XrfDikHFqWJlhNNmMLqosxkF8oggdjY7y+gZ6kz8txob4OpqFukmNxJiEEUk
 SE4wQ6KU5i4dqVAP7YWkCN0seidkkLq86SSpIe0RgaqGPQ3Wz44itsJL7fsqRF+f23Jm
 lpPusCnyo3uzY97fg2xK9LQFNrxBh/8/dVZdBg4qGeRj5Fu7Iq54nMNC7Jhuizy5aPyO
 5+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794380308; x=1794985108;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0lTxAsMA3QpN+9zMtyW0vyhW8QFqCxQaW0AWlpp1bQc=;
 b=yX/yVZM0BCpkzZriGVUfNrvTjbShp7O+SXDZlc7VSiLSGKfNJsBMi/NYb8k3FfhwkW
 KWOaAc9XEv3atmdKsG9Cwu6oBbD0oo3ejjcVUfBPn3I9G70U8XJO3eDtvn/kajUnGdht
 mEqgDkkanmztJSpL6tS7uQTldpmdcSbIG86+BUp3fVeib4D86uqriNYC4D3n4xBsjZ+T
 NjGs8wr9ItA+UqX+5yQbhIKH5qTwthjQlwU8MgtnZa0qWDNFqo7wRIvwRUa34Byyb8Cf
 3DQpwryapjXHPf5+5kU7kx65LZqewTYaN6+7/pwn222ylOmH9n8Z2MEnJmCwOe8CpgT9
 znmw==
X-Gm-Message-State: APuU4Z9ud2Ur0VmEXRJouRPrCbohTggTr26f2rRfvnN6ho1/DXA3ZrOv
 ff7RUUIH7jdk7WmiZ0jhtwBXF3UFCStwcyZ/ShH0kGYrnGLGj41pxRMAdq11gSs+X8gabw742p0
 //sj7oF3g8lauCdSKMPYXvmRLimJZbl4Dxvg1Aol00y1t59rubovH/2+hvg==
X-Gm-Gg: AYBFou171MUoKp0+eR+803/6unUB3vdzBKP2Uju/Njk3sg30ENdkHpdjbgWJBQPyzto
 f2qVixv1+BUUna1rtvQSZQ9dEmFhJbfqKeGr8F4tqAvQ2VL/xdV3B1rEdH782HtwwUoCkf0+Bk7
 vfBmPl93NFtOGUTFBxleO9e9fC2Qvs7TLOYBp5VuFfO6WuV5keTq/jxcK/NX1Q/ETdM7N0GxiQb
 N9q3OMBDy9H5eYm8fksMEsQQZ3tcuLbq2xa/L8KF60526xlnvGoe4jnO8Dwf9sbNPcBP8V7DBl8
 PCEKMkgYH2XQf3pVFRGH1dX1bEoCufNaMAWQKhH5TxpYa+4frDcIMoMR7py33djKp0vPX4FwKxo
 FaF6WMfwYPV0sR3WSg7jWL87fC4WKld6SVVA4tTEYQ6jORvbiWHJC2JjBKsny4JYyAh7ktREWQU
 3Z8TR0NNRENV0=
X-Received: by 2002:a05:620a:4629:b0:93e:acdd:acd9 with SMTP id
 af79cd13be357-947afb8bf57mr246333285a.7.1794380308545; 
 Tue, 10 Nov 2026 22:58:28 -0800 (PST)
X-Received: by 2002:a05:620a:4629:b0:93e:acdd:acd9 with SMTP id
 af79cd13be357-947afb8bf57mr246331085a.7.1794380308092; 
 Tue, 10 Nov 2026 22:58:28 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9479e734698sm424919385a.13.2026.11.10.22.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 22:58:26 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 philmd@oss.qualcomm.com, ZhengXiang Qin <qinzhengxiang@foxmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v5 2/2] target/riscv: raise access fault for Zicbom MMIO-like
 accesses
Date: Wed, 11 Nov 2026 03:58:15 -0300
Message-ID: <20261111065815.167869-3-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111065815.167869-1-daniel.barboza@oss.qualcomm.com>
References: <20261111065815.167869-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mhdbmexWaG3xR0iMXN70IdKs04Uk2UhU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyNyBTYWx0ZWRfX7yy/4iZ/MfZK
 knUsq6yYwYNc8TI8aD8MH+TfCqsAl6CavpcxnxODNE00MHx0H0iu2+N9V7jo/WhvxRl5igWfoYY
 utotVzq9DoP5t2X6p1ucHMQpAjd9iLc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyNyBTYWx0ZWRfX8qBJWKzx9Zac
 EXSEF1B0dzRTGQ7+XfZnQPSZ4/Z2VlI4bmHA5WeNA7u0uijhzVcmdFXmdbBmN2i9hKYu0Lhs1wa
 SPd2HbgSvtm52fT0u0lmXKfHZ2QA8Dw0xfv+PehiflQXPSR4K8TFpCX1G0Wjepm4j457TFv2f1b
 ZL5pdxdo2iOxuE5mmSQZm+L0zz8SsoLJOcEUpTMVPTywge3VG/Z8k2wEIB4DGJj5aXfOUpqo3ge
 znhFddAqrd09WAf6rw/y7FttlNKGuJ2IpsTsYrU9jJUtlwnvwgBwz0024Lv9dBdgZlRplZS2Yeh
 j6zkdOcShOSCK41POlaAFIwTk+HtgD1TpxXiAUc82h1FB7V82wQj9LpT/X4OslVNl2XssvH64TU
 TMwV9hZvImXZi3WxajGUAf9fHDLz22kYqdvL81iY8NcKaic9+rko2U7QNTi4BCalkHFXnfqvuGD
 +ujJw8LyPR8aZiqyhRw==
X-Proofpoint-GUID: mhdbmexWaG3xR0iMXN70IdKs04Uk2UhU
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af41215 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=p0WdMEafAAAA:8 a=bDN84i_9AAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=f9I5WbiLg-2XRRu5Er0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=J2PsDwZO0S0EpbpLmD-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110027
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

From: ZhengXiang Qin <qinzhengxiang@foxmail.com>

check_zicbom_access() currently treats any probe_access_flags() result
other than TLB_INVALID_MASK as a successful access. However, a result
with TLB_MMIO means that the target is MMIO-like and should not be
treated as a normal cache block management target.

Raise a store/AMO access fault for Zicbom accesses to MMIO-like regions
so that cbo.clean, cbo.flush and cbo.inval do not silently succeed on
non-cacheable/MMIO-like memory.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3501
Fixes: e05da09b7cfd ("target/riscv: implement Zicbom extension")
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: ZhengXiang Qin <qinzhengxiang@foxmail.com>
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/op_helper.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
index d7af56ef61..52aa545eec 100644
--- a/target/riscv/tcg/op_helper.c
+++ b/target/riscv/tcg/op_helper.c
@@ -231,6 +231,7 @@ static void check_zicbom_access(CPURISCVState *env,
 {
     uint16_t cbomlen = riscv_cpu_cfg(env)->cbom_blocksize;
     int mmu_idx = riscv_env_mmu_index(env, false);
+    uint64_t fault_addr = address;
     void *phost;
     int ret;
 
@@ -251,7 +252,10 @@ static void check_zicbom_access(CPURISCVState *env,
      */
     ret = probe_access_flags(env, address, cbomlen, MMU_DATA_LOAD,
                              mmu_idx, true, &phost, ra);
-    if (ret != TLB_INVALID_MASK) {
+    if (ret & TLB_MMIO) {
+        env->badaddr = fault_addr;
+        riscv_raise_exception(env, RISCV_EXCP_STORE_AMO_ACCESS_FAULT, ra);
+    } else if (ret != TLB_INVALID_MASK) {
         /* Success: readable */
         return;
     }
-- 
2.43.0


