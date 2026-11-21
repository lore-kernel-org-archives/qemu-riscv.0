Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2E1606A33B
	for <qemu-riscv@archiver.kernel.org>; Sat, 21 Nov 2026 12:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gYRWenxQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j4+lCjyk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xUkSJ-0001xL-Tr; Sat, 21 Nov 2026 07:44:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xUkSH-0001ws-7L
 for qemu-riscv@nongnu.org; Sat, 21 Nov 2026 07:44:33 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xUkSF-0002ZI-8g
 for qemu-riscv@nongnu.org; Sat, 21 Nov 2026 07:44:32 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ALCGuvO731968
 for <qemu-riscv@nongnu.org>; Sat, 21 Nov 2026 12:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Da6xAt7hKA/OTIGh2+Uf8diabrWMSKHHVafFvlU5+54=; b=gYRWenxQmJMNdY4t
 4Shf7jQCebofJTYukrEgGfOz9x62CAl+V4iyJnHpuvlsib7LG6DZp9bSSPa1GBzl
 ZTw95XRNoLjLfyE3/sjcnRm3KhoC+1ETIPL5GPTeQYPiGGK4YMCQaauNtxzBL654
 3+EH34o89tVB6bKXY3zODlXWogMGPYG9CD570Rv32b63loMIuei5iGqEKQQQNTOO
 nbnqCtljHafjeOWDz216aNRtjLEOSx6sL+8q6hndLKF1anY/XhQvqsAfVD94vZ5x
 k1fWKd1GsOTTfdwfiKLUjNiwrFttgbg799TSQidLAggeSN2R3YqtTlR7Hp/7Wz31
 +EoQIQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j328rs999-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sat, 21 Nov 2026 12:44:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-91c6c1e082bso52068466d6.0
 for <qemu-riscv@nongnu.org>; Sat, 21 Nov 2026 04:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795265067; x=1795869867; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Da6xAt7hKA/OTIGh2+Uf8diabrWMSKHHVafFvlU5+54=;
 b=j4+lCjykCmj5WcAxtJIkI8BNIsRbSzstoPgeaxZFgcbrRPYhVCmgcyziALdIoTTRHQ
 UsLJ3FS9oEATfcpQbG9umvG5QMI9YfmxVUMQ3C+p7tEvhgARxFw/QzzxCO2KLYgpoXVj
 Qw1wmWPHLJABdCCqf4CmeVteB9sm69JemFzvB3KL2KNsaMjOobFhc2XRz3nEUtOi592p
 75HWig3AcyI5ZK53rkK3wn3YyveohHgGcnZj+W8Rl4nABgKEkHwwjxgwwxnv0QqADYoM
 Akief1M+qDzgNDeKansT+nAk6hxOKzAhMwF4nqOn0tLsopMa8jwjJ1IaYT4IWsk2Bh8c
 voaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795265067; x=1795869867;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Da6xAt7hKA/OTIGh2+Uf8diabrWMSKHHVafFvlU5+54=;
 b=oWNGCbvKSWqOzlMntkyzGrJl4VGI9IFDhmTOfiHj7luzfoJmBU6AeSuwHQBBRoeSNs
 mEjfFlvKbdu53FQMVbjtUV+geAl6HsIDpoRbS/CocBx76dZECh4b3cEcvWgUiNwWCVxB
 hcYU19Hnk9wtJNvBjEVfD/6izvnyPAgZiXCO56BQaiUXT3aCviOB3HTTgFDWaGSnQ9Qz
 hJ1ZidujRPns+moQnK6vgS0oUkivwzRsbsdNybIzdLi//wjAJ+jznp8hOvfX7mVrR24I
 cEcBwGVw8Z+ZkxkuqYUvnA7Wk/EoR9naUpvN2kUroIbt85IC0QmcK+alCplUkhEwFNoM
 HxIQ==
X-Gm-Message-State: APuU4Z92nk5se18Ye2N/YVbtC7jFfoKcqwG4oxeiCC7wxv/+sXfVe5KY
 8KKzZ5L3SVLWbcZ9SU9x6Ecs7arL4VZM6YOmQgW/FWhsnVDR0JwPFvXJtnlIeGV5ucV6QIe4Ml0
 SJ0i57AdlfThO+QVcaMtHge32JsV2fh9LcyNUsxdeSQ3SZQXOixq2qBRdWw==
X-Gm-Gg: AZFdTZegZ5ptOmHvpcaL4twukD7GQk0H4TumlLpxFaYbWEZJxtyXo51pxqTeCzN50fG
 EPa6SlSgrUUcfcGzyZmTSOSjmINHTzgHpExNenjR+RIZJ7ggk+rfkvBwKkybw5liPLzFja3Fk2a
 PcurP63gClxdaUD53vtS5TS/Jgarcg72jAsKBK356FqWSh0mw2P3Hzr01XOe3P1NGDpoTZPIkgR
 c/DNDtnOq5Av4TGmoSs/JhmAwHJWwqVypuGpX41sqY2Hzo/rP7p0LbZFeJxTONcGJ/fz6/bAmu6
 3quga68jbuZh55bI540HSiXbcFKcBnOy+lB5H1WGF8QIo99ZKajuV9qFCHFWwfbH47ku83Vv8CJ
 YIUP8Wvx7nTQdo8c8rG3o2x76yVWL/3N9/yuGsIqsRsGaDbNFkYoJY4KGA9wEvsfgCO+mBsggnT
 bjaQ5X0Uij
X-Received: by 2002:a05:6214:2dc4:b0:921:3475:4bf2 with SMTP id
 6a1803df08f44-92134b9d275mr92478936d6.25.1795265067299; 
 Sat, 21 Nov 2026 04:44:27 -0800 (PST)
X-Received: by 2002:a05:6214:2dc4:b0:921:3475:4bf2 with SMTP id
 6a1803df08f44-92134b9d275mr92478556d6.25.1795265066697; 
 Sat, 21 Nov 2026 04:44:26 -0800 (PST)
Received: from [192.168.68.105] ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-92134a2806dsm51653596d6.45.2026.11.21.04.44.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2026 04:44:26 -0800 (PST)
Message-ID: <e61303cd-34b0-4f3a-92f2-cab9834b24bb@oss.qualcomm.com>
Date: Sat, 21 Nov 2026 09:44:23 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: make mstatush.MPELP writable [GL4220]
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20261112200635.549520-1-daniel.barboza@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261112200635.549520-1-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA1MCBTYWx0ZWRfX+5EC//LRJkiZ
 Tp7bHklBvl3xIlY/ZG2Sru+RKr41hTfvB+GmH50oqPvQ3Qh6Wg/khfRL5vYmvM1HbdTVKNeAN4b
 2RhxrZOc+rH74kmPb8q8DxuIdMoFIB4=
X-Proofpoint-GUID: UCXfIoK8xWHKjBJ1flgZfgmsqwl9Y5k3
X-Proofpoint-ORIG-GUID: UCXfIoK8xWHKjBJ1flgZfgmsqwl9Y5k3
X-Authority-Analysis: v=2.4 cv=c9w+0h9l c=1 sm=1 tr=0 ts=6b01922d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=cg53bU8Wj0-TdxcqrnAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA1MCBTYWx0ZWRfX1Lw4EcCmBw7D
 /SGzUrMyWBb9LZXbVZo2ZPIX4pDCGtFtWBc2eilYqC/QZav0MRa2Gd7RuEEfpIEeY6+yfCJeIlr
 9BSzs9+4KtN8uHhQL0wTg5OVpGBWNhrsRyuB4FQUVHUqvdDNE/my+doH8B+HoCqrtXlm6+lCCd4
 vvIeslUdlz/BjKO0PwWYBkk0q82UKE8dok+CGLIC23y/P7hYUgPvNTnvJCEe1P5O5mVPqWIqMD7
 rZgDBWfwiQ9bfy/745+v5DNay9mpRG1Hfm8CRT42LzTdO7elCpE0LhLxbHPCofuUPMEZICW0RE9
 MaArJwFWP/q7bJzh/r9hxXn21WTDFnkheatBjSrfSF2weJOd2XJy9P3BfFNVMV9nujCKv5s+VLU
 mOVg8L7TIikfst4V55gL5mIInNkaa2+lSDMnk1B5LlT9j7XxI/HOwuN79mYnX3selbKy/Zge4vj
 ltCEb/xgAYetpaZgang==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210050
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Ping review/Sashiko

Let's not miss the great "Gitlab fixes" train coming up in the next PR :)


Thanks,
Daniel

On 11/12/2026 5:06 PM, Daniel Henrique Barboza wrote:
> Add MSTATUS_MPELP in the write mask inside write_mstatush().
> 
> Fixes: 4923f672e3d7 ("target/riscv: Introduce elp state and enabling controls for zicfilp")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4220
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> ---
>   target/riscv/tcg/csr.c                  |  5 +++
>   tests/tcg/riscv32/system/meson.build    |  7 +++++
>   tests/tcg/riscv32/test-mstatush-mpelp.S | 42 +++++++++++++++++++++++++
>   3 files changed, 54 insertions(+)
>   create mode 100644 tests/tcg/riscv32/test-mstatush-mpelp.S
> 
> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> index af444e3e6f..e73455d021 100644
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -2155,6 +2155,11 @@ static RISCVException write_mstatush(CPURISCVState *env, int csrno,
>       uint64_t valh = (uint64_t)val << 32;
>       uint64_t mask = riscv_has_ext(env, RVH) ? MSTATUS_MPV | MSTATUS_GVA : 0;
>   
> +    /* If cfi lp extension is available, then apply cfi lp mask */
> +    if (env_archcpu(env)->cfg.ext_zicfilp) {
> +        mask |= MSTATUS_MPELP;
> +    }
> +
>       if (riscv_cpu_cfg(env)->ext_smdbltrp) {
>           mask |= MSTATUS_MDT;
>           if ((valh & MSTATUS_MDT) != 0) {
> diff --git a/tests/tcg/riscv32/system/meson.build b/tests/tcg/riscv32/system/meson.build
> index 117ae6fbce..415a1c212d 100644
> --- a/tests/tcg/riscv32/system/meson.build
> +++ b/tests/tcg/riscv32/system/meson.build
> @@ -22,6 +22,13 @@ tests += {
>     },
>   }
>   
> +tests += {
> +  'test-mstatush-mpelp.S': {
> +    'cflags': cflags,
> +    'qemu_args': ['-cpu', 'max', qemu_args],
> +  },
> +}
> +
>   if 'qemu-system-riscv32' in emulators
>     tcg_tests += {
>       'riscv32-softmmu': {
> diff --git a/tests/tcg/riscv32/test-mstatush-mpelp.S b/tests/tcg/riscv32/test-mstatush-mpelp.S
> new file mode 100644
> index 0000000000..f70b4dfc32
> --- /dev/null
> +++ b/tests/tcg/riscv32/test-mstatush-mpelp.S
> @@ -0,0 +1,42 @@
> +/*
> + * Test that mstatush.MPELP is writable (Gitlab 4220).
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#define MSTATUSH_MPELP 0x200
> +
> +.option norvc
> +	.text
> +	.global _start
> +
> +_start:
> +	lla	t0, trap
> +	csrw	mtvec, t0
> +
> +	csrr	s0, mstatush
> +	li	t0, MSTATUSH_MPELP
> +	or	t1, s0, t0
> +	csrw	mstatush, t1
> +
> +	csrr	s0, mstatush
> +	and	t1, s0, t0
> +	bne	t0, t1, _fail
> +
> +	j	_pass
> +
> +trap:
> +	j	_fail
> +
> +_pass:
> +	li	t0, 0x100000
> +	li	t1, 0x5555	/* FINISHER_PASS */
> +	sw	t1, 0(t0)
> +	j	.
> +
> +_fail:
> +	li	t0, 0x100000
> +	li	t1, 0x13333	/* status = FINISHER_FAIL, code = 1 */
> +	sw	t1, 0(t0)
> +	j	.


