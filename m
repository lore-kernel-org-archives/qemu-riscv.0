Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D14606A333
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 11:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RPn7hpkG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5Vrw4vx
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQk17-0004UG-Ud; Tue, 10 Nov 2026 06:27:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQk15-0004Tw-JZ
 for qemu-riscv@nongnu.org; Tue, 10 Nov 2026 06:27:55 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQk13-00079n-Av
 for qemu-riscv@nongnu.org; Tue, 10 Nov 2026 06:27:55 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AABAGSa3178211
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 11:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cJLV7rD9UkGvq8au20MsrPzWtL4NZDY44vaxSNRaM8Q=; b=RPn7hpkG3O9ZVh3e
 SjmTtS/SQW4GwSMIxlMnS+8gCVUfC4uq1RK+2mSksSbNP+ruuAGG/YnYU5X8A31V
 BXu6523ueBk7zV6kYnSPmGR4dzdektmkpRLHRG8gCmoTWvw09MHxFz5SYIzxjdmZ
 9lximZCqPS72cy0CPzkFt+gtw283+5xYNM8tgYMir/VeU43uebjp8VrEOVtbtGfA
 XkilrLAvnNyzXT0bfnEF3frBaZPgGiWbEjjENVis3IttTSMbp5PiIwWBWucVsdqk
 rXzbKKU00CyI9CHGYnysPwF7FKu5DsjIfpG/36dLVR/J5l/t1OOM4qs7plt9OBzj
 hZhpvA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufrkya-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 11:27:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91eaad6eaeaso34500326d6.1
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 03:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794310070; x=1794914870; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=cJLV7rD9UkGvq8au20MsrPzWtL4NZDY44vaxSNRaM8Q=;
 b=C5Vrw4vxLIObtm+SehysotOnPq6JYl11XJ4xkWNOzCzSohzTVCc3I4ZacLO5vJ7zlm
 21Kv/s42k39dsPDZ+MfDMtjfofMgMW9f9XnHz4AQXJVxPV/9M8Z3ptIV9p0+YywflS4P
 YJtgLl1utQhJ5bC6COEteETX//yl+Q7dd5G2XSBDnYsVf67CdTtJEq4ClNM4qRvPWelL
 KwETFo8V9Ra3vtW9+1Brho/1XC3+my41/lPCBs+cDiqsKL3utS9zu6k9J6b4T2ZBobw9
 FwMUMPTuoEZ6kvj9qJbsxS+fJ1eYDQhTkujK7sfik7G4rwdExItk4wcqctyuyfxHHEmv
 7xdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794310070; x=1794914870;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cJLV7rD9UkGvq8au20MsrPzWtL4NZDY44vaxSNRaM8Q=;
 b=e/jxb4cX3iJtjImnrPj3A1y4NaY9G9Fgi9PhiRHT9peShgnqLhoOuqX3a/XhaqSsPM
 6UTbxj5azbHFyJQepF6vRPG5Qn+0MsWoIxNKNnuh48kOlvRiPG9f/ojXYoNKzG2wSWXd
 9uAxY3uRVp5f0yquJClrNEuE162I1nXOH1i33igDY7tdVZxPvRAaDjxYE98TxrdPadz5
 acX0ifB/2Udy1OnSlTlqEWTTzFUyebpw90r9NQWwOvbWIaIz2n/AertJspiTsch8WX1V
 1HiZXQ3fNlBELXq3cMVfU2oOptKkJdVYKzv1bNfyjnrJkIyuj5XIsgeCAM63xNi6pKYr
 Vl0A==
X-Gm-Message-State: APuU4Z93E3WNK0smyD6RKAP7W7tFKo7KNrJJcGjBDOfpNQcFWrs8zPMW
 NQJREJBzsKQZCQp9JEmt6NY2I1WXX/rmf0E2xj3C6aQHJ9jGf/3pS0tMoihhYpfSxMJ601CyOgG
 h5Cn/KI92IzLOCbYTBZ6lRARcIByCU0De5YIIFwFmPQH5vTuf8XJxCyzrPg==
X-Gm-Gg: AYBFou3STwFVD4CgHRM4ofWrgm0F53KUpHPQCbhSpnX+bzLtUbamR2dEMHhMLFisgJs
 uCmGkZfxhQPShF7BGBb6tMXuiRZjCaisHX9mQKAPBDiZ1WI+3b4nZX2NYqKG71A50f75geRroF4
 /EerP9mJgoYTAkWiVjbfA9ugznHzyZu8AyIuC7eKTRH62WAS1z4LeDmtFXUnjqBLXkcWopkGIKb
 qpdSBLhyA/JjOuzUQ2/dDKODBj/hg/wtvubEJIi9dRvtrcx+ovj1JWoK9kiW/bC/Ugd8Y4zMgNw
 FlPWdSD80qAg8PFf0nW10jDlBeQzsYKyWyr7ZXLOIA53Q02I0q6KRL5N0UisbHk0td4XtSBkSiU
 TqVYMPPyBLYNkYQwJPD6RJJGGwMGRpYeRz33m+M8tV714zVx7TwvMJii4E57fr5ZC8JiDINxmMm
 6jl6caJhfp
X-Received: by 2002:a05:6214:29ec:b0:91b:d5d7:8c84 with SMTP id
 6a1803df08f44-91eef5e13c5mr36824086d6.7.1794310070254; 
 Tue, 10 Nov 2026 03:27:50 -0800 (PST)
X-Received: by 2002:a05:6214:29ec:b0:91b:d5d7:8c84 with SMTP id
 6a1803df08f44-91eef5e13c5mr36823766d6.7.1794310069703; 
 Tue, 10 Nov 2026 03:27:49 -0800 (PST)
Received: from [192.168.15.13] ([191.205.127.185])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ef04ce58dsm18815326d6.16.2026.11.10.03.27.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 03:27:49 -0800 (PST)
Message-ID: <1aa9fa25-374c-4a7d-bf5d-405b3be18131@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 08:27:44 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/riscv: report WRS.NTO opcode in tval on illegal
 instruction
To: Zephyr Li <fritchleybohrer@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
References: <20261106033457.79020-1-fritchleybohrer@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261106033457.79020-1-fritchleybohrer@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6AovL_7cFPVaJV9Eg_gCfSslfVtuYPFQ
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af2ffb7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=yT90tAku5HHnT5ynma8WtQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=p0WdMEafAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=osMKFkf9yhYPNHL0BA0A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 6AovL_7cFPVaJV9Eg_gCfSslfVtuYPFQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfX8Z1Ha9WfqIgk
 EUBcLr1g+vNc4nKuNRsO0Wh7AuhFeXTZOcw+DiKEMrGMopTEpUokTivYFgtPJP/xL6ckH+rNFc/
 LOElJHOkGKkl5m/jQ3o5RAjSFQFVBJ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfX0oNoyCR/9ISM
 9tGEGaPQF3eRUAWmQwEL6ctaUvP1puiqBtlcg/l2blK5+g7er21bhnPhfgb3qUWWZo3qNKbrpbO
 a8U8u2tqKAM8ByHiUS9B+602o5kXCesuZ5A37jTFrt98fvfdPxLn4s6jiTAh+h86RHUi0ieGpW3
 bfcYUCFfmxJPl1hYCAnXudohom6KwlobC9Vz6B0NxIh+uO+NTJ2qMInggJMTRIKFreMsELqjvFX
 4mEN+sR4yJx/N/EOfeCwfVFyi+qB+RFhlXDhbwsl0pYR78GFExMy+JJqwCe6gSyKCuelAyivPNx
 5MQpdVps8sYwIZdlsrxH9cc2/L88rZK2RB6k8mUjT8XI+iSsCnqxAM086kF9p2uhBTWsnpq0kgK
 HDnWvEdPgOqSDi7LOfU6jnzB/ezjMQTBwa6N7S2vk/BxCPILonF20XdUIItrqjdx9FogAktR38D
 nNBda5EbIoX698oJdSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100045
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
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/6/2026 12:34 AM, Zephyr Li wrote:
> helper_wrs_nto() may raise an illegal or virtual-instruction exception.
> However, trans_wrs_nto() does not save the decoded opcode before calling
> the helper. As a result, exception unwinding leaves env->bins stale and
> trap handling reports an incorrect value in tval.
> 
> Call decode_save_opc() before the helper so the faulting instruction
> encoding is restored for trap handling.
> 
> Add a TCG test that delegates the mstatus.TW-triggered illegal-instruction
> exception to S-mode and checks scause, sepc and stval.
> 
> Fixes: b62e0ce76098 ("target/riscv: Raise exceptions on wrs.nto")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4080
> Signed-off-by: Zephyr Li <fritchleybohrer@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

> Changes in v2:
> - Rebase onto current master.
> - Register the test in tests/tcg/riscv64/system/meson.build instead
>    of the removed Makefile.softmmu-target.
> 
>   .../riscv/tcg/insn_trans/trans_rvzawrs.c.inc  |  2 +
>   tests/tcg/riscv64/system/meson.build          |  1 +
>   tests/tcg/riscv64/test-zawrs-stval.S          | 87 +++++++++++++++++++
>   3 files changed, 90 insertions(+)
>   create mode 100644 tests/tcg/riscv64/test-zawrs-stval.S
> 
> diff --git a/target/riscv/tcg/insn_trans/trans_rvzawrs.c.inc b/target/riscv/tcg/insn_trans/trans_rvzawrs.c.inc
> index 0eef033838..ecebec0eef 100644
> --- a/target/riscv/tcg/insn_trans/trans_rvzawrs.c.inc
> +++ b/target/riscv/tcg/insn_trans/trans_rvzawrs.c.inc
> @@ -54,6 +54,8 @@ static bool trans_wrs_nto(DisasContext *ctx, arg_wrs_nto *a)
>        * exception, as handled by the wrs.nto helper.
>        */
>   #ifndef CONFIG_USER_ONLY
> +    /* Save the opcode in case the helper raises an exception. */
> +    decode_save_opc(ctx, 0);
>       gen_helper_wrs_nto(tcg_env);
>   #endif
>   
> diff --git a/tests/tcg/riscv64/system/meson.build b/tests/tcg/riscv64/system/meson.build
> index 3c8b018d9e..d1cbd1b97d 100644
> --- a/tests/tcg/riscv64/system/meson.build
> +++ b/tests/tcg/riscv64/system/meson.build
> @@ -21,6 +21,7 @@ tests += {
>     'interruptedmemory.S': setup + {'plugin_test': {'plugin': 'discons'}},
>     'issue1060.S': setup,
>     'test-mepc-masking.S': setup,
> +  'test-zawrs-stval.S': setup + {'qemu_args': ['-cpu', 'max', qemu_args]},
>     'test-crc32.S': setup + {'qemu_args': ['-cpu', 'rv64,xlrbr=true', qemu_args]},
>     'test-minstret-ecall.S': setup + {'qemu_args': ['-icount', 'shift=1', qemu_args]},
>     'test-minstret-wfi.S': setup + {'qemu_args': ['-icount', 'shift=1', qemu_args]},
> diff --git a/tests/tcg/riscv64/test-zawrs-stval.S b/tests/tcg/riscv64/test-zawrs-stval.S
> new file mode 100644
> index 0000000000..42a9901fa6
> --- /dev/null
> +++ b/tests/tcg/riscv64/test-zawrs-stval.S
> @@ -0,0 +1,87 @@
> +/*
> + * Test that WRS.NTO writes the instruction encoding to stval when
> + * mstatus.TW causes an illegal-instruction exception in S-mode.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +	.option	norvc
> +
> +	.text
> +	.global	_start
> +_start:
> +	/* Unexpected traps to M-mode fail the test. */
> +	lla	t0, machine_trap
> +	csrw	mtvec, t0
> +
> +	/* Delegate illegal-instruction exceptions to S-mode. */
> +	li	t0, 1 << 2
> +	csrs	medeleg, t0
> +
> +	lla	t0, supervisor_trap
> +	csrw	stvec, t0
> +
> +	/* Give S-mode read, write and execute access to all memory. */
> +	li	t0, -1
> +	csrw	pmpaddr0, t0
> +	li	t0, 0xf
> +	csrw	pmpcfg0, t0
> +
> +	/* Set mstatus.TW and select S-mode for mret. */
> +	li	t0, 3 << 11
> +	csrc	mstatus, t0
> +	li	t0, (1 << 21) | (1 << 11)
> +	csrs	mstatus, t0
> +
> +	lla	t0, supervisor_start
> +	csrw	mepc, t0
> +	mret
> +
> +supervisor_start:
> +	/* WRS.NTO must trap because mstatus.TW is set. */
> +	li	a0, 1
> +wrs_nto:
> +	.word	0x00d00073
> +	j	_exit
> +
> +machine_trap:
> +	li	a0, 2
> +	j	_exit
> +
> +supervisor_trap:
> +	li	a0, 3
> +
> +	csrr	t0, scause
> +	li	t1, 2
> +	bne	t0, t1, _exit
> +
> +	csrr	t0, sepc
> +	lla	t1, wrs_nto
> +	bne	t0, t1, _exit
> +
> +	csrr	t1, stval
> +	lwu	t2, 0(t0)
> +	bne	t1, t2, _exit
> +	li	t2, 0x00d00073
> +	bne	t1, t2, _exit
> +
> +	li	a0, 0
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


