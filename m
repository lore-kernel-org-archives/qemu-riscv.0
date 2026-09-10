Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A1AC79F9F
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 11:46:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x4dDc-0003IS-FS; Thu, 10 Sep 2026 07:45:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4dDa-0003I6-AT
 for qemu-riscv@nongnu.org; Thu, 10 Sep 2026 07:45:26 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x4dDY-0000O6-3x
 for qemu-riscv@nongnu.org; Thu, 10 Sep 2026 07:45:26 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68A8q8wb643932
 for <qemu-riscv@nongnu.org>; Thu, 10 Sep 2026 11:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7lqFDL0oLjUl3F0ftVH44imTKW7jovpyppb/cNvXUwU=; b=bfxbn0+EFmQvzT+H
 1MUwyuAlz5HxXjyCA0S8gRdgOH0LwoQUdyI1oTXyf1moUy1XN78A6hKmiqLqpxrj
 MuwDDYw7Zt/K3k0EFnJIlUOaTdAwFuaXrTjBQriaevFcNRsQGGKwbKifZCMY5l4C
 Vvhe+fIiGGq3D6eMvTcUl7BnAX0YRfGealNF50OnLjOxEuk3JB98jT57I71JY7NT
 KRotGKXfW3ob9k/iXd6Q3Wyvexd1/3PxQH6qHZ+G4wmzd12Moxt7l2IZJOpiqXdl
 8fo2RAyulKRorFNgndQibTFq2asBS3cEIK2obwn7wPg9Eh/w4/ZXf3o3qcNZKdbA
 qsmFlA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg3q72-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 10 Sep 2026 11:45:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-939e1847252so50566885a.1
 for <qemu-riscv@nongnu.org>; Thu, 10 Sep 2026 04:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789040722; x=1789645522; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=7lqFDL0oLjUl3F0ftVH44imTKW7jovpyppb/cNvXUwU=;
 b=PJ4sAsHtvmypR4myVfvJs4i/GYgub+NhedZcG5lq2gcJFnsSb60NfspBGuOSy4+RIF
 lbmR9KXj7nBtT7sFeXZM4grYeSw98qfo8HqJ8Zq2ZaU/vvYBtK1J0/EB9ANJvoKjULGu
 Q1R6e92TU5jk/w8lb3fF8UXrK7lcmvhqkJbE7fxgLjLUtaHMxdP3RRM5SmrAZesrxAii
 jAKez74aGmPA8cLUgyUFeIIsxSnVncNKqlxds8szU+h5D7NErM0UX/CyfR23SBMwq/AF
 /iyGeT9rTOdyzB5OEo0qH/edtkLosdZHGN5rxwrgBYrbUO8qBK2VKc/MT0f4mgnEbMxU
 fsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789040722; x=1789645522;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7lqFDL0oLjUl3F0ftVH44imTKW7jovpyppb/cNvXUwU=;
 b=MmAZZRwk3IbdmL8BOS75xO7//dBhkUvNFU3yvEOw3N+MoquIBXRS2b9PckeeM2HcKu
 u4M2jmhu9xT4qVlpDCHtPgB1EvKTMAbVVhmS4EoLf6ai8+BTWA+QuEewvI0hJCNlqF0H
 1NKxCXJFVED79ETJFF1tz0uTs5x4v/cdtRJw9G7Zc2j94sUtJZrrwUbFgeUlJ5h7S7Nq
 DjSrowGF5fg2640zJKUAD5JGeX+ZtIy9C5RIRVlRMJg+6gFoPUWKezu1auhIKLiKCvpV
 PRL+4bL6ctyZYMfMKthTci0ADWWkloIAassQeL5iRAATMLCMZ6f2VTx5k3reO5WdnaqT
 2Tww==
X-Gm-Message-State: AFuF++kcSFxBg2qm46iNH2uP8rwXOV/KjX6WdzpqDmpLbuQUggbM5yGm
 UCe6kWSnbuAQcU4OIOB6ddmIqpybKhPt86Hoa1scbYbom90alT/E0TbvuhwbQMivma84SeSceQ6
 xHuzYBqv4Pp3wmBjsZ+CcYzOMwCsdHUu7po/a4bdtu4sYrdAYFIf0a5A1iA==
X-Gm-Gg: AYBFou2tgewBntE/cWt04oEiGPPPci4bZbW2W8OGmQLd3+KmKZ1vIPkpcwu6RC8k1Xm
 brhp9ESxZofzHwzf+vElsQ96Ca7BjjqGCVmER/hGmwAjgoSEWMYtqPNLd34AM0c9QoOWHy7bKAe
 zqdRizGrMafI6FdQZvx1MivgrpFO1ZFDoqwARVLpOlQKTomJvSASZEoOiVBuPHbkKhHFLmGIz1i
 ACa1t3m0FHI8EmSKQORx1Fze2CQUPLRqdtYk7JGwTkLGGyLpquQ6cMfE2NhJgQUbBrFUNIMIUy5
 6YuRz4fVeyY0Vm3KW5INlxY27UtJGlHVfo1RcbS2E7m3YpJv9ZPE6vRMk/lPssysfhQJZV8cy1S
 NkfBWogKvE46Ithc/vfNC+LyXYkjMGzNwmXw=
X-Received: by 2002:a05:620a:46a0:b0:939:7cca:ed30 with SMTP id
 af79cd13be357-939d8018302mr517735185a.45.1789040721596; 
 Thu, 10 Sep 2026 04:45:21 -0700 (PDT)
X-Received: by 2002:a05:620a:46a0:b0:939:7cca:ed30 with SMTP id
 af79cd13be357-939d8018302mr517727885a.45.1789040721097; 
 Thu, 10 Sep 2026 04:45:21 -0700 (PDT)
Received: from [192.168.68.102] ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91048476220sm138330086d6.31.2026.09.10.04.45.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 04:45:20 -0700 (PDT)
Message-ID: <1a3404e8-a9c7-40e2-8bd7-5a4d7c386537@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 08:45:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/riscv: stop translating after WFI
To: Zephyr Li <fritchleybohrer@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com
References: <20260910025324.54990-1-fritchleybohrer@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260910025324.54990-1-fritchleybohrer@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vu62kO2n c=1 sm=1 tr=0 ts=6aa29852 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=p0WdMEafAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=voxrwLIUQBIEJ0OO-V8A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 28IsRftZlUZeDW7lgNaYSj2ejaCZJw6b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDEzOCBTYWx0ZWRfX8yI78eCQyE0z
 4d2fKn1et+qK+akcGJOrCliTd7srtBKE9aDFrT60yMM63an7Sme75ccCq/JdpIJNcGsp14LwoXI
 bFDAeNNW1qVh/iP+5fdyW7oYiHMeOk2plh2E7jOxWS2oTVobrqmz/h8MpgoNqoDK84s8he/NSp8
 +yRnJv0biMFyPkLNEiBKqSdHsdRZ36/0izhzigjcab2FZWIOvvUTMcIFq4VIHnw4XrRkARXBjtS
 mrVOEPo8fs/ULYbybMU14GpBq12mWtI3NcvibgU79tDIrTrXcKcpiFpxFy65iPw1rh9yI8sfL9M
 x4Bkdou1IfaCx9Tzh8P8vhGNYQ+1iXx72ssr4ZvO+BUmUfXo3sca4Ks86uvhrbMRfX/21CcHTBd
 H7cA6Gd9bay6gGi+QwLWdTLnrK+kGhKGE9Ee19Qixddyio7hePjwKLGxzlNd+gH0FIZwzp2LsQK
 e/RZ0uRHegb9Cj4TfNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDEzOCBTYWx0ZWRfX4KCfNfX9UPYM
 MWTJX8OIk17jIjQHNpeXH3y0tRTATT+EOkKXjKtpwc5vn8Btzlr82UIhNLFaBjR28A8d6qvwwMC
 2pHgz7J+8r6tihEuLjEj0KpCNbcspQI=
X-Proofpoint-ORIG-GUID: 28IsRftZlUZeDW7lgNaYSj2ejaCZJw6b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100138
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



On 9/9/2026 11:53 PM, Zephyr Li wrote:
> helper_wfi() never returns to translated code: it either raises an
> exception or exits the CPU loop after marking the CPU as halted. However,
> trans_wfi() leaves the translation state as DISAS_NEXT, so instructions
> following WFI can be included in the same TB.
> 
> With icount enabled, this makes the following instruction part of the TB's
> instruction count when WFI exits, causing minstret to be incremented once
> too many. Set DISAS_NORETURN after emitting the helper.
> 
> Add a TCG test for both reported cases: WFI waking for a locally enabled
> pending interrupt with mstatus.MIE clear, and WFI taking a timer interrupt.
> 
> Fixes: 55c2a12cbcd3 ("RISC-V TCG Code Generation")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4230
> Signed-off-by: Zephyr Li <fritchleybohrer@gmail.com>
> 
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

> Changes in v2:
> - Register test-minstret-wfi.S with the Meson TCG test framework so
>    check-tcg executes it.
> 
> diff --git a/target/riscv/tcg/insn_trans/trans_privileged.c.inc b/target/riscv/tcg/insn_trans/trans_privileged.c.inc
> index a8eaccef67..ebbbb01179 100644
> --- a/target/riscv/tcg/insn_trans/trans_privileged.c.inc
> +++ b/target/riscv/tcg/insn_trans/trans_privileged.c.inc
> @@ -145,6 +145,7 @@ static bool trans_wfi(DisasContext *ctx, arg_wfi *a)
>       decode_save_opc(ctx, 0);
>       gen_update_pc(ctx, ctx->cur_insn_len);
>       gen_helper_wfi(tcg_env);
> +    ctx->base.is_jmp = DISAS_NORETURN;
>       return true;
>   #else
>       return false;
> diff --git a/tests/tcg/riscv64/system/meson.build b/tests/tcg/riscv64/system/meson.build
> index 8604c2a45a..2aca68e078 100644
> --- a/tests/tcg/riscv64/system/meson.build
> +++ b/tests/tcg/riscv64/system/meson.build
> @@ -23,6 +23,7 @@ tests += {
>     'test-mepc-masking.S': setup,
>     'test-crc32.S': setup + {'qemu_args': ['-cpu', 'rv64,xlrbr=true', qemu_args]},
>     'test-minstret-ecall.S': setup + {'qemu_args': ['-icount', 'shift=1', qemu_args]},
> +  'test-minstret-wfi.S': setup + {'qemu_args': ['-icount', 'shift=1', qemu_args]},
>     'test-misa-w.S': setup + {'qemu_args': ['-cpu', 'rv64,x-misa-w=true,c=true,v=true', qemu_args]},
>   }
>   
> diff --git a/tests/tcg/riscv64/test-minstret-wfi.S b/tests/tcg/riscv64/test-minstret-wfi.S
> new file mode 100644
> index 0000000000..0fd0158d5b
> --- /dev/null
> +++ b/tests/tcg/riscv64/test-minstret-wfi.S
> @@ -0,0 +1,100 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +	.option	norvc
> +
> +	.text
> +	.global	_start
> +_start:
> +	lla	t0, trap
> +	csrw	mtvec, t0
> +	li	s3, 0
> +
> +	/*
> +	 * A pending, locally enabled interrupt wakes WFI even with MIE
> +	 * clear.
> +	 */
> +	li	t0, 0x8		/* MIE_MSIE */
> +	csrw	mie, t0
> +	csrci	mstatus, 0x8	/* MSTATUS_MIE */
> +	li	t0, 0x2000000	/* MSIP0 */
> +	li	t1, 1
> +	sw	t1, 0(t0)
> +
> +	/*
> +	 * The first CSR read and WFI retire before the second read obtains s1,
> +	 * so the expected difference is two.
> +	 */
> +	csrr	s0, minstret
> +	wfi
> +	csrr	s1, minstret
> +	sub	s1, s1, s0
> +	li	t1, 2
> +	beq	s1, t1, 1f
> +	ori	s3, s3, 1
> +1:
> +
> +	/* Clear the software interrupt before testing the trap path. */
> +	sw	zero, 0(t0)
> +	csrw	mie, zero
> +
> +	/* Schedule a timer interrupt far enough ahead to reach WFI first. */
> +	li	t0, 0x200bff8	/* MTIME */
> +	ld	t1, 0(t0)
> +	addi	t1, t1, 100
> +	li	t0, 0x2004000	/* MTIMECMP0 */
> +	sd	t1, 0(t0)
> +	li	t0, 0x80		/* MIE_MTIE */
> +	csrw	mie, t0
> +	csrsi	mstatus, 0x8	/* MSTATUS_MIE */
> +
> +	/*
> +	 * The first CSR read and WFI retire before the trap handler obtains s1,
> +	 * so the expected difference is again two.
> +	 */
> +	li	s2, 1
> +	csrr	s0, minstret
> +	wfi
> +	beqz	s2, 1f
> +	ori	s3, s3, 2
> +1:
> +	bnez	s3, fail
> +	li	a0, 0
> +	j	_exit
> +
> +fail:
> +	mv	a0, s3
> +
> +_exit:
> +	lla	a1, semiargs
> +	li	t0, 0x20026	/* ADP_Stopped_ApplicationExit */
> +	sd	t0, 0(a1)
> +	sd	a0, 8(a1)
> +	li	a0, 0x20	/* TARGET_SYS_EXIT_EXTENDED */
> +
> +	/* Semihosting call sequence */
> +	.balign	16
> +	slli	zero, zero, 0x1f
> +	ebreak
> +	srai	zero, zero, 0x7
> +	j	.
> +
> +	.balign	4
> +trap:
> +	/* Read minstret before retiring an instruction in the handler. */
> +	csrr	s1, minstret
> +	sub	s1, s1, s0
> +	addi	s1, s1, -2
> +	snez	s2, s1
> +
> +	/* Disable the timer interrupt before returning past WFI. */
> +	li	t0, 0x2004000	/* MTIMECMP0 */
> +	li	t1, -1
> +	sd	t1, 0(t0)
> +	li	t0, 0x80		/* MIE_MTIE */
> +	csrc	mie, t0
> +	mret
> +
> +	.data
> +	.balign	16
> +semiargs:
> +	.space	16


