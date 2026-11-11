Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3AC606A98E
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 06:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o6hveQB/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BQBbQUMX
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xR2Hw-0001wz-0I; Wed, 11 Nov 2026 01:58:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xR2Hs-0001ux-6z
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 01:58:28 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xR2Hq-0007uL-Od
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 01:58:27 -0500
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AB5KO282021256
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 06:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=V0lfivLAx81
 qjccHpGn6e3n3pqQvnE2uIqshAxKN1NI=; b=o6hveQB/PALGku4Rxq9pDou96de
 lZukATrjT5OzoT/2JuvD+KgOS8qebcHQtyxP5TXHUWgU9Sw8g/ET5AP1pTjFRUum
 WOuudsVWTkIz6JKbk1UG3dG/gh7tsnbU4OKJI3ssIBubp9um1uCO1CJ5JVLZzFle
 cxzx0SrQtEHmr/uocsWuadFAWkLY4qrW+XqBO7esYEfTisiGza5lbD0Ihh5eY8p3
 aHyBhCihHdKKiDG/zhuDB4h823hEVrLHklu8kqCnF2WRo4LTID4cr74EZnLVQmRs
 Cwr9Br5U+4qQIv39bVnVt+z2mZEpv0/3oTaPaQv2FYqHoiEqYgLJlBPhrVA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pvbn6k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 06:58:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-94607500fb0so473633885a.2
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 22:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794380305; x=1794985105; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=V0lfivLAx81qjccHpGn6e3n3pqQvnE2uIqshAxKN1NI=;
 b=BQBbQUMXcm9ZVsw9dTnMScA8UfTwhCmOKPgqSYsPu9KYzZKI+GHNTMY/CHLD26d8dH
 FYtyN+1jfSYi4Vld8HqMWxxGO7apKghW2QXfI6ZQZabwX2bXVRzkSrWV96P/JUiQGbsa
 lRYbUdzzGNficWphgqbmhvZp8FZneWsj3XkFfgsZgRl/eOEpTmj4SEmqSXpAT1A/9vH6
 V4190T8A5GB0clXNjdN2BmZwlDUU8XXzZhc/wbUhcssm882KZMsoYELOYjOYYDLnpJm9
 JuCDw+XR/IOs2yI6TKCV0Jvw/HAEuMcYQxUfHbh7ulHx1fY8zSTGNC4zxejMrK/slW0T
 /l8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794380305; x=1794985105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=V0lfivLAx81qjccHpGn6e3n3pqQvnE2uIqshAxKN1NI=;
 b=SObYdX+MKxP9yBir9l6UuhUfAyBOSXRt+kcOFCC35EpwYK8KJLcFnAPatFYvZjAE3h
 3mqSpV0ihAj1a+WWiIWfTRXO8L8GHOUHxExlgid+Lw6XV+jbjefwuxR+QoKKryrzMrkc
 nJCtpropGWE44ZYyyBfzibu1fR9vW3Oab3oUjsKcIvkGN+uWfGhUC4L5ybg9uoZfnkbE
 12mLrsRO6iMShHOLxXJCrqkJoUmDubj+1Q7EGMfRixYZILEjBlzk4mkyi2LqafpHg+M1
 Exr0vhU5K1FEjofahc3uVZCQrOsb8SF3xXMYgRzh4NHtY9vPmqkCyxuJEWdZ554kgwlE
 dshQ==
X-Gm-Message-State: APuU4Z+BACedGSS1EiVLVZOcjqfOzNGJj8R/q7UwYmhtCrUFWCU1BaS8
 5ddSjuTLo1Pwt6HVskqlBN1ixIFbQ6YkIAgR1YeHZ5XLQMjttJrOdJNzQSgXU5/4HyuzRs2Z0G4
 dbqmZsnlX0YuJcwr2j1pK0fPTQ4l3i/rsNl3aDvOuypCP8IYDegxax+CulBcZjgiv4Q==
X-Gm-Gg: AYBFou1d1ioVZecycjSn3WQa/qoD7PQQVSegXCBJE0Wvy2x0l9UHGQWmX+b9qrQMhH/
 Ha/6g8Fbie9Am+Pq/gH5Nd8LAEL3Dt+aUa6wgXHdw/ELtqXhaqxOnWQmd36AwjfnSnsDz8MGotQ
 fSP1m4ZGuIrPgsUPIWgttNpPT3PSrJSMZCfHNZzpaB6EaXDJYc6vXdzgvIK+iri8yIM7rCYvGBt
 Sjmc0y9/I4d8R6SqnpDkbMdFxv09pB7odxvHi3fz/8sOfQtwTxfBdRT779HJfZzq/QcOQA63UM7
 qNNga93hA79Is1tbKHfWqFHQqeFTx9DcEcgSozKrxC5FfypzdC99rFZecPGIE2m8fcwTX9eovl1
 OJw/Y9fu8gDiYspVnMtrGzX8bqtfLUcKXNPiB1ug+Vibjk/XW+DvInSvPx2x399tD9sGr94Nd5m
 qiy3P0TtPElEc=
X-Received: by 2002:a05:620a:2687:b0:93f:2aa8:c555 with SMTP id
 af79cd13be357-947b006d9b5mr236662285a.57.1794380304719; 
 Tue, 10 Nov 2026 22:58:24 -0800 (PST)
X-Received: by 2002:a05:620a:2687:b0:93f:2aa8:c555 with SMTP id
 af79cd13be357-947b006d9b5mr236659385a.57.1794380304294; 
 Tue, 10 Nov 2026 22:58:24 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9479e734698sm424919385a.13.2026.11.10.22.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 22:58:22 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 philmd@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v5 1/2] target/riscv/tcg/op_helper: avoid env_archcpu() to
 access cbom_blocksize
Date: Wed, 11 Nov 2026 03:58:14 -0300
Message-ID: <20261111065815.167869-2-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111065815.167869-1-daniel.barboza@oss.qualcomm.com>
References: <20261111065815.167869-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af41211 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=un_eBsdixQ8VRd_I7m4A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 1XFqu_795RMwGhVBK_YY0GfFD0s20Y1e
X-Proofpoint-GUID: 1XFqu_795RMwGhVBK_YY0GfFD0s20Y1e
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyNyBTYWx0ZWRfX4mk60r3Bd14t
 yyGCTMQWpToEJlz7CWWPvDBhvJpHk4b7ynSqvS8SJgZKWUZUulbnyji4RHvM0wOUoKSCKQe7Ge4
 WXLXHYxUQZ6f78+bUx1LglwWj/T1SQc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyNyBTYWx0ZWRfX2wddr0Xqqi0u
 xM7B1kttuLjsN/xrPth/6w/L05tRzdHzN96G0huwSE25ruscvhLLM0JKN5fagdnl2FfyXJs+/ow
 ItKXQ+ag6bfx184lnnW2I4RW+yGYfeO8RncmwH1IiuvAZ2BTcAA7hR4T4RLPV5okoe4K82s0uyK
 iLREBdu5b9iPLap5EPKEGMiFzCZptLw7HdkEpC+DxZPKuYFBGjK/vv52eyr8M28226eHbnFRvpL
 lC3uDI2DQPOBwjiqlIPMZ+mGcIePskACB2Alx4+n8+5v3aUBXcRD96w2dEgA4VSaRy+ZMcoILiS
 9eCSQ1tlNUSZ2TwJc5urOz0oWoPexDVlX01SjwrX8bUL6tq3+0eiWBp0QspAGmZx2QPrqACoJVJ
 dUOEEhYbdp4QcdM/ZbunLt0noEUnJxQKFYnRZ9y7YU1I3wDeiZEWUKJ+GdzlspGppeFxfxRAndH
 zc9PLpgskaSz4pikw8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110027
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There is no other use for the RISCVCPU* pointer aside from accessing
cpu->cfg.  Use the riscv_cpu_cfg(env) inline to retrieve
cfg.cbom_blocksize instead.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/op_helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
index f9c79fe6b9..d7af56ef61 100644
--- a/target/riscv/tcg/op_helper.c
+++ b/target/riscv/tcg/op_helper.c
@@ -229,9 +229,8 @@ static void check_zicbom_access(CPURISCVState *env,
                                 target_ulong address,
                                 uintptr_t ra)
 {
-    RISCVCPU *cpu = env_archcpu(env);
+    uint16_t cbomlen = riscv_cpu_cfg(env)->cbom_blocksize;
     int mmu_idx = riscv_env_mmu_index(env, false);
-    uint16_t cbomlen = cpu->cfg.cbom_blocksize;
     void *phost;
     int ret;
 
-- 
2.43.0


