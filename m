Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F065C624D0
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 11:31:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1jBr-0003Ll-VM; Wed, 02 Sep 2026 07:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x1jBn-0003Kk-Ji
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2026 07:31:35 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x1jBl-0005c7-7A
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2026 07:31:35 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6829NUvL1349347
 for <qemu-riscv@nongnu.org>; Wed, 2 Sep 2026 11:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cSBypMk7UZ10ta6l8Hs0ZmoDf/3ZTmVqdRtsTSdvwWQ=; b=n0ZOYtpu5QRpdKTm
 8L+IcH6EEfcwMqCuMZjpib80c9n3ct67K4Hg7SkvdShqI/0cvJuvEm73sjyw4sVq
 YsVApg9G9qTAZtkrCDd3R3keejY8aaesQPW7YSj6QRtjpdxvYOPaXl8MV6zgP+yd
 TstM8qakATdvt9oTurfGpKc2Mhob6sPUOtF5KLMrxiUTjgvl/JG7NY5a4QLwLGj4
 alZ0DOLjR6dVthMnREIF+6O1dOh6MobHOa/grpBs/0mk2ZfKRVUX/9WeHTAXZdW8
 sU249+CN6SDarc4CsrXivWsAemiYUhFips11QStRIokfB1i2YWtvXsHUu1jK2beu
 6+6Uiw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge3n0up77-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 11:31:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-90cc934fe9eso18961726d6.3
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 04:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788348690; x=1788953490; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=cSBypMk7UZ10ta6l8Hs0ZmoDf/3ZTmVqdRtsTSdvwWQ=;
 b=Z1YhUskbpLbEZpuRStcqpMsg5xDDunydPLiRG+zES67GbUFYz8wZQoizh3xxU8+Q32
 MxuTS3pi9rGmfQ0Gsm/8GlKxA75kpaZ4yoDgcZS8Xh0Xy58WRCnerKoe+83WELPS47lz
 MnF50QddrYT8DhBCTImpGdKqIG3kkWZIJQwuBnqWPGuYGwT05lG0hyq3rAjVm7q35Zzx
 239eHUgQLoU/1fz2yn/yyLcWln8DEjLds5ue+/TRzSk2yk10Z31Eel6fHGnW9AcATJiI
 8B4w6d+Ehtub85lA4sVV/ZNjUp5jS22X1WDdRDQu4b3B5VqZXaNo6fFuDMziewDxhRyO
 Vj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788348690; x=1788953490;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cSBypMk7UZ10ta6l8Hs0ZmoDf/3ZTmVqdRtsTSdvwWQ=;
 b=Yw21LU+m2GGPkmEGpf4X0QY+CYX8h2/tRRsg9K5G6qqv1YjJCvWhNeExAgoYpb7Qfk
 ioh654wA89Rmt6KiUvgHR0sa7nLaVHzi7sypCN/sALnJgLI5ULyE9AhU/d0J3rZmT/cK
 JwMpZqOC/DYttrQvr2zd0ccBWLLZr1kn6Sx+vI4r2owV0asxizjUbMJWTgHhujBVxYdM
 6TV/vQ64l2BhY6jQ50mXQp/NJsrCab0IDbDD7K0ItCYz1whF6J3eBDUytMyG4czfLTtN
 /AVH+KdcOBWl0zMigQ37seMtx4vwnar/xZRsaW5fLUhP6dHM5XVMO/h7d1CZXO68TDX7
 MyHw==
X-Gm-Message-State: AFuF++kUrMuV+DeleMKKgw1/ib6eNJRHXPzOauEYm3yvgL4T1732CGHC
 6qCDjoxUOXwpSxnjTR+s/1vMyAv6cVfpOp+hGGB2kkY226EHl/hpO+jHmuUgcJrii5H+Jmnb0bH
 EldquSNf6wk8+0w7gBCkUf9eo/DlChJqPGKYS4bH4W4Kv+HaQp0ZoolB4ZQ==
X-Gm-Gg: AYBFou18+dixozl8voTsXAyMTY/1zYY4+acrFS4f96k26OFnUBP1VayjpOAGyR4WOab
 dPz1YpDsxhERKDqOoDxieiajew5/TvzThyDLXcA2uDZvSNn+8PMkSceeDJd0LXzIHonEdiTsrr6
 wW7ModUoWXdq3VFNWteZN8Yh32tr2XokInJENWdlkxy9bwJSlxMrBBXEMGlX9ldz2MzvfZgiVsx
 W03i2Om8dBXMAM93t7HICZyDjlKLzbvpkc6dFRWeRDt2iTee//LYhhXbKFDP2JAeRMPFVddbWtM
 aSah28PnBSoVFMKYnjZ5U5Xk5KabylgwxMSOa2a9eprJao7iWPM6md648j/Oz8Ms85kImPRYT8z
 Nlf5DbTTIcb+DRnOhkfJUjl5Ss6NVCge4agMr
X-Received: by 2002:a05:6214:202b:b0:90e:880e:dc2f with SMTP id
 6a1803df08f44-90e9f21f15cmr61227276d6.7.1788348690203; 
 Wed, 02 Sep 2026 04:31:30 -0700 (PDT)
X-Received: by 2002:a05:6214:202b:b0:90e:880e:dc2f with SMTP id
 6a1803df08f44-90e9f21f15cmr61226056d6.7.1788348689584; 
 Wed, 02 Sep 2026 04:31:29 -0700 (PDT)
Received: from [192.168.68.101] ([152.250.131.13])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90e9ee2ed6csm15897426d6.17.2026.09.02.04.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 04:31:28 -0700 (PDT)
Message-ID: <2d8f63f8-721f-42a4-843e-3ec79de2c2ce@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 08:31:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: save ELP in MPELP for NMIE=0 exceptions
To: Zephyr Li <fritchleybohrer@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
References: <20260902015704.101990-1-fritchleybohrer@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260902015704.101990-1-fritchleybohrer@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEwMSBTYWx0ZWRfX+/viNIIjaGQj
 6DTCA/EeG6UzGH7Xar/WhfpAgWsLYEN8cGkdzc2RJKh8Gjl524rLEEX79uITLUZbK5MR/qywb3V
 jIgG0+CHQ9847l875wKjJKpCRUJlk9CFPI0bkJomKTFS7/0gqGAVJSv5N6G9rrDLISi1rBT/Bwr
 nNqVqvkX19sxv9gaCHRLR9sFU3OyOK3uzA5AC3VeB+Oqg2PbazgPmuzDm6yRmtbZ6e0p8hRPRTs
 fBnV8LeD7jt0mNi0IMmyn2qcQ5rTmcGJJZc6DBmHug88yweoRfJolkgDtCtBdx3cpt1kF6SZ1XL
 kVGCUaoimn9sut/WznHlL2fKJwezeiS1NE5rQfIOQyPK08b+aM2tbfs6VwAzJu3p7SA/Pxjze+4
 YQNHD/HDhFk9HNBb6YcST4aBr68kFDIPXv4tFW+HVXZjHKANvBnONT3KARu0Uy2hjSKqLIGan8J
 vmWlOPnKdGhRQIPQBqg==
X-Proofpoint-GUID: N_EmtvONdwYp2GwCHzi0rpuMsQlhJkj-
X-Proofpoint-ORIG-GUID: N_EmtvONdwYp2GwCHzi0rpuMsQlhJkj-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEwMSBTYWx0ZWRfXwjxJCWXz9hvO
 KktwVOhKz0HbKCHPItjiMWx7J5vRhI0dovSXUqlW2G3OmqD95JjV84t/ugAukHPYE1Je9ft7eYM
 WebD7FKHuhwG3MycEgGlwWwu6pew81o=
X-Authority-Analysis: v=2.4 cv=R9oz39RX c=1 sm=1 tr=0 ts=6a980912 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=CXdxNCAnTuDr1kYd6DjE4g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=p0WdMEafAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=XUmsnmsZDxSA-LP2MZ4A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020101
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 9/1/2026 10:57 PM, Zephyr Li wrote:
> When an exception occurs in M-mode while mnstatus.NMIE is clear,
> Smrnmi only changes the exception handler address. Trap state is still
> saved in the regular M-mode CSRs and the handler returns with MRET.

I believe it's worth adding the quote from the smrnmi spec.  It's section 8.5,
"RNMI Operation":

"If the hart encounters an exception while executing in M-mode with the
  mnstatus.NMIE bit clear, the exception is an RNMI exception. Trap state
  is still saved in the regular M-mode CSRs and the handler returns with MRET."

> 
> riscv_cpu_do_interrupt() instead saves ELP in mnstatus.MNPELP on this
> path. MRET restores ELP from mstatus.MPELP, so the expected landing-pad
> state is lost.
> 
> Always save ELP in mstatus.MPELP for M-mode exceptions. Keep MNPELP for
> the actual RNMI interrupt path, which returns with MNRET.
> 
> Add a TCG test that checks ELP preservation across an NMIE=0 M-mode
> exception and MRET.
> 
> Fixes: 0266fd8b56a4 ("target/riscv: Add Zicfilp support for Smrnmi")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4223
> Signed-off-by: Zephyr Li <fritchleybohrer@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/tcg/cpu_helper.c             |  18 +---
>   tests/tcg/riscv64/Makefile.softmmu-target |   8 ++
>   tests/tcg/riscv64/test-zicfilp-smrnmi.S   | 117 ++++++++++++++++++++++
>   3 files changed, 127 insertions(+), 16 deletions(-)
>   create mode 100644 tests/tcg/riscv64/test-zicfilp-smrnmi.S
> 
> diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
> index 07d9222652..a0d79b33a5 100644
> --- a/target/riscv/tcg/cpu_helper.c
> +++ b/target/riscv/tcg/cpu_helper.c
> @@ -2264,23 +2264,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>   
>           src = env->sepc;
>       } else {
> -        /*
> -         * If the hart encounters an exception while executing in M-mode
> -         * with the mnstatus.NMIE bit clear, the exception is an RNMI exception.
> -         */
> -        nnmi_excep = cpu->cfg.ext_smrnmi &&
> -                     !get_field(env->mnstatus, MNSTATUS_NMIE) &&
> -                     !async;
> -
> -        /* handle the trap in M-mode */
> -        /* save elp status */
> +        /* Save ELP for MRET. */
>           if (cpu_get_fcfien(env)) {
> -            if (nnmi_excep) {
> -                env->mnstatus = set_field(env->mnstatus, MNSTATUS_MNPELP,
> -                                          env->elp);
> -            } else {
> -                env->mstatus = set_field(env->mstatus, MSTATUS_MPELP, env->elp);
> -            }
> +            env->mstatus = set_field(env->mstatus, MSTATUS_MPELP, env->elp);
>           }
>   
>           if (riscv_has_ext(env, RVH)) {
> diff --git a/tests/tcg/riscv64/Makefile.softmmu-target b/tests/tcg/riscv64/Makefile.softmmu-target
> index 6a219c306c..8522c3fe6f 100644
> --- a/tests/tcg/riscv64/Makefile.softmmu-target
> +++ b/tests/tcg/riscv64/Makefile.softmmu-target
> @@ -45,6 +45,14 @@ comma:= ,
>   run-test-crc32: test-crc32
>   	$(call run-test, $<, $(QEMU) -cpu rv64$(comma)xlrbr=true $(QEMU_OPTS)$<)
>   
> +EXTRA_RUNS += run-test-zicfilp-smrnmi
> +run-test-zicfilp-smrnmi: test-zicfilp-smrnmi
> +	$(call run-test, $<, \
> +	  $(QEMU) \
> +	  -cpu rv64$(comma)zicsr=true$(comma)zicfilp=true$(comma)smrnmi=true \
> +	  -global rv64-riscv-cpu.rnmi-exception-vector=0x80000100 \
> +	  $(QEMU_OPTS)$<)
> +
>   # Zicclsm: misaligned load/store support. Assemble one source twice: the
>   # default build expects every misaligned access to succeed (zicclsm=true),
>   # the -DZICCLSM_DISABLED build expects every one to trap (zicclsm=false).
> diff --git a/tests/tcg/riscv64/test-zicfilp-smrnmi.S b/tests/tcg/riscv64/test-zicfilp-smrnmi.S
> new file mode 100644
> index 0000000000..b5965bf705
> --- /dev/null
> +++ b/tests/tcg/riscv64/test-zicfilp-smrnmi.S
> @@ -0,0 +1,117 @@
> +/*
> + * Test that an M-mode exception taken with mnstatus.NMIE clear saves ELP in
> + * mstatus.MPELP, so that it is restored by MRET.  MNPELP is reserved for the
> + * actual RNMI path, which returns with MNRET.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +	.option	norvc
> +
> +	.equ	CSR_MNSTATUS, 0x744
> +	.equ	CSR_MSECCFG, 0x747
> +	.equ	MNSTATUS_NMIE, 1 << 3
> +	.equ	MNSTATUS_MNPELP, 1 << 9
> +	.equ	MSECCFG_MLPE, 1 << 10
> +	.equ	MSTATUS_MPELP, 1 << 41
> +	.equ	EXCP_INST_ACCESS_FAULT, 1
> +	.equ	EXCP_SW_CHECK, 18
> +	.equ	SW_CHECK_FCFI_TVAL, 2
> +
> +	.text
> +	.global	_start
> +_start:
> +	/* Verify that NMIE is clear before exercising the exception path. */
> +	csrr	t0, CSR_MNSTATUS
> +	andi	t0, t0, MNSTATUS_NMIE
> +	bnez	t0, fail_nmie
> +
> +	/* Enable landing-pad checks in M-mode, then start a new TB. */
> +	li	t0, MSECCFG_MLPE
> +	csrs	CSR_MSECCFG, t0
> +	j	tracked_jump
> +
> +tracked_jump:
> +	/* Make a Zicfilp-tracked indirect jump to an address that faults. */
> +	li	t1, 0
> +	jalr	zero, 0(t1)
> +
> +	/*
> +	 * The instruction access fault should have redirected to the handler.
> +	 */
> +	li	a0, 1
> +	j	_exit
> +
> +fail_nmie:
> +	li	a0, 6
> +	j	_exit
> +
> +	/* Must match rnmi-exception-vector in Makefile.softmmu-target. */
> +	.org	0x100
> +rnmi_exception:
> +	csrr	t0, mcause
> +	li	t1, EXCP_INST_ACCESS_FAULT
> +	beq	t0, t1, handle_fetch_fault
> +	li	t1, EXCP_SW_CHECK
> +	beq	t0, t1, handle_sw_check
> +
> +	li	a0, 4
> +	j	_exit
> +
> +handle_fetch_fault:
> +	/* This is an M-mode exception and will return with MRET. */
> +	csrr	t0, mstatus
> +	li	t1, MSTATUS_MPELP
> +	and	t0, t0, t1
> +	beqz	t0, fail_mpelp
> +
> +	csrr	t0, CSR_MNSTATUS
> +	andi	t0, t0, MNSTATUS_MNPELP
> +	bnez	t0, fail_mnpelp
> +
> +	lla	t0, resume_non_lpad
> +	csrw	mepc, t0
> +	mret
> +
> +resume_non_lpad:
> +	/* MRET must restore ELP, so this instruction must not retire. */
> +	li	a0, 1
> +	j	_exit
> +
> +handle_sw_check:
> +	csrr	t0, mtval
> +	li	t1, SW_CHECK_FCFI_TVAL
> +	bne	t0, t1, fail_tval
> +
> +	li	a0, 0
> +	j	_exit
> +
> +fail_mpelp:
> +	li	a0, 2
> +	j	_exit
> +
> +fail_mnpelp:
> +	li	a0, 3
> +	j	_exit
> +
> +fail_tval:
> +	li	a0, 5
> +
> +_exit:
> +	lla	a1, semiargs
> +	li	t0, 0x20026	/* ADP_Stopped_ApplicationExit */
> +	sd	t0, 0(a1)
> +	sd	a0, 8(a1)
> +	li	a0, 0x20	/* TARGET_SYS_EXIT_EXTENDED */
> +
> +	/* Semihosting call sequence. */
> +	.balign	16
> +	slli	zero, zero, 0x1f
> +	ebreak
> +	srai	zero, zero, 0x7
> +	j	.
> +
> +	.data
> +	.balign	16
> +semiargs:
> +	.space	16


