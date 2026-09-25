Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57EFC9830E
	for <qemu-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 16:50:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xA97e-0002kg-Pe; Fri, 25 Sep 2026 12:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xA97b-0002k1-Qp
 for qemu-riscv@nongnu.org; Fri, 25 Sep 2026 12:50:03 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xA97Y-00038F-BS
 for qemu-riscv@nongnu.org; Fri, 25 Sep 2026 12:50:02 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68PG0fKw1964685
 for <qemu-riscv@nongnu.org>; Fri, 25 Sep 2026 16:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hsmMaQgqxPNNZVQoNA0BpW7AQv2zWg0p5sPsKfrkAwo=; b=hkimgEVsoyyDzhQv
 UAY0iEkV+5+MvfVc3bBj5cYYWaU8Xhq4gUCWfakZlE+9BR8p/KIPynV7JtojTaY9
 SkwKptpKfgbHI9zWTmA8mSb7SikJULVnu0Yi00r/qkN2joBDnQ4XL2PylYh9zX0y
 5AAmAjaitsn6b3QW6hfWwjdDIWyr69GwvotrW73SgIKbiawXFi0r+7sbzpWy5wZR
 W0kbm6yhdSzfjK9VpkyJdhHr4+44Tl61PY/ZY1iO9bNGEhjWwgtbm6q3OK+3XB2K
 t/0KScqz08hmcsuFbtuj0wdTxXPX4AZqIZvWmo4NIsEEZcluUpn4GMfG0U8iBAOv
 MPvMgA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvt97y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 25 Sep 2026 16:49:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93a0312937eso148790085a.1
 for <qemu-riscv@nongnu.org>; Fri, 25 Sep 2026 09:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790354998; x=1790959798; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hsmMaQgqxPNNZVQoNA0BpW7AQv2zWg0p5sPsKfrkAwo=;
 b=TC89N26Ldqeik6xw0RBbDk8VGNUap+YzLgC9cfV17Gw7JIkUbsUDDFqsdFqlkMWQ7n
 lWyBfhMkknsmPs2QrSv1nJRCBaC2aIeiIwNtzo+xXY5shOyPEPdfKaxO+PB8pcdvHkOp
 iN67s+AFnyX7H2lXXSeEhls20dG9wIR64tFiDue+hxQiZ63+cB34mRNzBN/PGAxwXXwQ
 ZPBtlCfdabCgIBGBXm6fzybVAwGJh28kt+C3BJ5Pr7LqGtyKRmRTu5chSf9PihgmoRPb
 FMjvLM5IFmeTttQ+ZxtuwVbdcLC3jQ2iojVGYWbMsC2sxmtlkzCW5uMiRHPvW2qKDVoH
 CymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790354998; x=1790959798;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hsmMaQgqxPNNZVQoNA0BpW7AQv2zWg0p5sPsKfrkAwo=;
 b=VqSoJ/ZsHMJB2yuLpW9R5/MAq4KgpEdFSx89+GYt/lb0Sxu2o8YVP2VXsRS0dyPTyf
 IHUZ0KnoOgzVay88iV5rbEfSkZG8SG1ecj5qvKtWNCDVhUxFnYmCgXRVeJXb9GA+kQ0h
 LuAMvP9DQfAVADAKI59MCvBjdbZL7s5tnKbcgnVaLiPhFVs5ySzUXhOvuBK4iHhX7Qyd
 Ymt+xADxvbQ0PPhHB0rMnFadm71WeSNfaLJCGVjjM8GQs3fjYgOVkbnizKX/BYxh/B/7
 iXVnx/ZEWWZqtNbkD1vlDncrr8v9iscnEeoT7dIw9DY2vzLZEmIK9eRt5ZNLd5el1huM
 NqSA==
X-Gm-Message-State: AFuF++lhB1EIp8n7Z7oseLVi+M61xf9YA2U94/A1Qi/2K4snJWDulcAW
 DZnh76n0fhu/+NB+jaLR0EYPX/ejbu6a+wjJU5JXUH7UQcL9dbEhEDcizXGQZt2LHs3QxJD7SV4
 2DDwo/BhTe81onMgOgzuHITDjUainwd3GPVmO6pOJcFWawIwzk0eMGQd7jQ==
X-Gm-Gg: AYBFou2MrVPyk8A6IhKL7yUyoHyNpe7SHM71A9PTQwgE1mitHHJtet+dIR+29I1kWSK
 4mzrBGnUuuZFCZaZ186WKIcfsN9xHcBQYgR5OimXccVjqJpKmebD3dQNovHQ1zSLSD7XS9x7V+Q
 Ur/bkJiUFDZCodLAWe0gj970aSftiY7Lw6m+qmHRS0gu8Z3BmTvFfyoW7T7Gs8tUCoVQYfGEmze
 imIyHCMnVoa5fLe8lt1q4X2LbrTQ3kRI1P3fLegn6W6z/EHyN3knitd8lRYujmtEG6XkkS7UPq1
 MMW6WDdtOHzA/XpSP9G09oYyTQD5mGE4QLxjFsU4UsHNIShANqi0bOY9AEZgBSBDfTQQBwB2BCB
 BfnKEFgByGfYMMxj0e1bzDpJ3dgGvn++rTA==
X-Received: by 2002:a05:620a:4450:b0:93a:1fa7:1afb with SMTP id
 af79cd13be357-93c43cb6a76mr584404385a.42.1790354998145; 
 Fri, 25 Sep 2026 09:49:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4450:b0:93a:1fa7:1afb with SMTP id
 af79cd13be357-93c43cb6a76mr584400085a.42.1790354997614; 
 Fri, 25 Sep 2026 09:49:57 -0700 (PDT)
Received: from [192.168.68.102] ([177.94.15.187])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93c44652f98sm224487785a.6.2026.09.25.09.49.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2026 09:49:57 -0700 (PDT)
Message-ID: <4c58ea2b-bccf-48a4-95a6-87f38050eb9d@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 13:49:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: mask vsepc according to IALIGN
To: Zephyr Li <fritchleybohrer@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com
References: <20260915024945.32329-1-fritchleybohrer@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260915024945.32329-1-fritchleybohrer@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8Qqi-P6bXIn8J_LROAo_kIK1jOCNQ9K9
X-Proofpoint-ORIG-GUID: 8Qqi-P6bXIn8J_LROAo_kIK1jOCNQ9K9
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab6a636 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=0kFmPUMe/4ewoYCJjrGTNA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=p0WdMEafAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=WWe3HN8v-xbs8q0Pu_QA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2NyBTYWx0ZWRfX0vAYb8jSc+qy
 +wLPVTxOSltmlV58x3/IwTqORG5SUxEPCgCwuU5NXy7RqUCUOy+coUqr+Ljj25vbLx3dwDjxYYM
 RJGpJhJPhl/su1UGsbG1DSurSWrUv1k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2NyBTYWx0ZWRfX8YmPTyu36gEK
 p9fuTr2zovEppJQg7BvYpGRIOmksNbW+DBLN34TapkyHMaGIYU6/cCMioQxZ8raNkvIo0oUqs6Z
 n849H6SQ7fW1KTWq7FSPdnAjdo29wTqOjkhSVkTgwyCpwNCVgOX7/CGXAUE0K5/wTG0uv9chE9l
 j+Z2jzfAjY6ZnnEMAM9m+HVauX+IW2xJ7F5IjWDwH06GaBVSRWm7pO9XXi7tbPehbw955dUx/XL
 rPhVPOrHHX+71S99O3JvD9rAI1Y8UCZXNvojCr5px/146nx3qiD++U3YSo+QD/DvmrVQ3xhtZJ4
 0fLvgQpGCduFgS91Hm+KnXI71eyHqmt7/HQXaKsLndqmm6c4gQO9oJnC4FyPirmCIkuz+Y9brnd
 d8VSoJccdXNPxEmMqkHhWngdztXZ5+0PD9oHY1A5Ql/j1we08yzPTmMbr878j7Ns2BIZThz/CXi
 c+YQ7NcA0V/WjIj0pxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250067
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 9/14/2026 11:49 PM, Zephyr Li wrote:
> vsepc is the VS-mode counterpart of sepc and is a WARL register, but
> unlike mepc and sepc its accessors do not mask the low address bits
> according to IALIGN.  As a result, values with invalid low bits can be
> observed through vsepc.
> 
> Apply get_xepc_mask() to both vsepc reads and writes, matching the
> existing mepc/sepc handling.
> 
> Add a TCG regression test covering both IALIGN=16 and IALIGN=32.
> 
> Fixes: 8747c9eeb2aa ("target/riscv: Add Hypervisor virtual CSRs accesses")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4420
> Signed-off-by: Zephyr Li <fritchleybohrer@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/tcg/csr.c                 |  4 +-
>   tests/tcg/riscv64/system/meson.build   | 11 ++++++
>   tests/tcg/riscv64/test-vsepc-masking.S | 54 ++++++++++++++++++++++++++
>   3 files changed, 67 insertions(+), 2 deletions(-)
>   create mode 100644 tests/tcg/riscv64/test-vsepc-masking.S
> 
> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> index bd4b6dc114..274c5cfbf4 100644
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -5299,14 +5299,14 @@ static RISCVException write_vsscratch(CPURISCVState *env, int csrno,
>   static RISCVException read_vsepc(CPURISCVState *env, int csrno,
>                                    target_ulong *val)
>   {
> -    *val = env->vsepc;
> +    *val = env->vsepc & get_xepc_mask(env);
>       return RISCV_EXCP_NONE;
>   }
>   
>   static RISCVException write_vsepc(CPURISCVState *env, int csrno,
>                                     target_ulong val, uintptr_t ra)
>   {
> -    env->vsepc = val;
> +    env->vsepc = val & get_xepc_mask(env);
>       return RISCV_EXCP_NONE;
>   }
>   
> diff --git a/tests/tcg/riscv64/system/meson.build b/tests/tcg/riscv64/system/meson.build
> index 8604c2a45a..5d633a266a 100644
> --- a/tests/tcg/riscv64/system/meson.build
> +++ b/tests/tcg/riscv64/system/meson.build
> @@ -24,6 +24,17 @@ tests += {
>     'test-crc32.S': setup + {'qemu_args': ['-cpu', 'rv64,xlrbr=true', qemu_args]},
>     'test-minstret-ecall.S': setup + {'qemu_args': ['-icount', 'shift=1', qemu_args]},
>     'test-misa-w.S': setup + {'qemu_args': ['-cpu', 'rv64,x-misa-w=true,c=true,v=true', qemu_args]},
> +  'test-vsepc-masking.S': setup + {
> +    'test_name': 'test-vsepc-masking-c',
> +    'qemu_args': ['-cpu', 'rv64,h=true,c=true', qemu_args],
> +  },
> +}
> +
> +tests += {
> +  'test-vsepc-masking.S': {
> +    'test_name': 'test-vsepc-masking-no-c',
> +    'qemu_args': ['-cpu', 'rv64,h=true,c=false,zca=false', qemu_args],
> +  },
>   }
>   
>   tests += {
> diff --git a/tests/tcg/riscv64/test-vsepc-masking.S b/tests/tcg/riscv64/test-vsepc-masking.S
> new file mode 100644
> index 0000000000..e5460f8aee
> --- /dev/null
> +++ b/tests/tcg/riscv64/test-vsepc-masking.S
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#define MISA_C          (1 << 2)
> +
> +	.option	norvc
> +	.text
> +	.global	_start
> +_start:
> +	csrr	s0, misa
> +	andi	s0, s0, MISA_C
> +
> +	lla	s1, test_addr
> +	ori	t0, s1, 3
> +	csrw	vsepc, t0
> +	csrr	t1, vsepc
> +
> +	beqz	s0, ialign32
> +	addi	t2, s1, 2	/* IALIGN=16: bit 0 reads as zero. */
> +	j	check
> +
> +ialign32:
> +	/* IALIGN=32: bits [1:0] read as zero. */
> +	mv	t2, s1
> +
> +check:
> +	li	a0, 2
> +	bne	t1, t2, _exit
> +
> +	li	a0, 0
> +	j	_exit
> +
> +	.balign	4
> +test_addr:
> +	nop
> +
> +/* Exit code in a0. */
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


