Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BD3CD98F0
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 11:34:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZoXR-0006rm-2T; Wed, 17 Jun 2026 07:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZoXO-0006rN-1v
 for qemu-riscv@nongnu.org; Wed, 17 Jun 2026 07:34:30 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wZoXL-0007Yu-IF
 for qemu-riscv@nongnu.org; Wed, 17 Jun 2026 07:34:29 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65H8WA4Z2058005
 for <qemu-riscv@nongnu.org>; Wed, 17 Jun 2026 11:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zwyaTYje9gbDOiUGC+Cyk/RTLe+hVlwfL4K6YFXVYgM=; b=hdANukom33sePZ/t
 aYONcUmqEti87wjpE/ihL9jViGidcqjN4o31PftKxJpvwBpEYjowNLd4eNFgahbP
 dbUAaPYE7H/RrYw5YZ5CbDlpLPlV0rv9DSDai0DA/M1bfTJeHqaUJs7P3H1XpOV/
 TqkpyYR8F1BlcP8RkG2FYz/l5UJFvRWSMitMMW8taGzsKLZqJ5H0/ac51PHekjkb
 5b7k60lLLb4KxwXxuskzIgA2KlxqSUCzftm+AO+2NKKX+lEka0rCgpngNPz8+9qQ
 CaQSPTVf2917CleEKyNkzFoGLKvNdd2CR+/iR+xH+1hw6Mpl4zPe4vT198Qk7NbC
 Y1q4hQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueesaw8e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 17 Jun 2026 11:34:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5177f07ea82so111850801cf.3
 for <qemu-riscv@nongnu.org>; Wed, 17 Jun 2026 04:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781696064; x=1782300864; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zwyaTYje9gbDOiUGC+Cyk/RTLe+hVlwfL4K6YFXVYgM=;
 b=ituqJg+PyWA19RInYXKPXtR+5/FEPendT1ryXXvsicoRefCuG1ocArTvyP5Q8tXpZx
 hQswSbefGGX+nQ/7szwH+gfaiOeNm08HU6ZpX0kCYeez8i/3lW48zwyBle2u6kbjhbNu
 azL6WNQjzxFT2WaMhbD0/1GjYUufeSH55hXrpkXIOxY7kV7czYsMlBoEcAVpEc78jroe
 ZhRy7DiCGaLAzruG71gkJF63+XgObn25w7yx6230Wxe+87+nXXjSwChUwLNEy1KWvKHO
 IGwMeFTnnBvF7A+1NhtPjxWs44FmjXBlqcM+rVvH11Hc3C6G9jkb2RqDdTLil2k4Qbb3
 pm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781696064; x=1782300864;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zwyaTYje9gbDOiUGC+Cyk/RTLe+hVlwfL4K6YFXVYgM=;
 b=Xid9zUHnDTot6pcUn3vTcAG/ahjjA1QM4M//kzlo13mxbx7gu6TLTUOZct6SkgMHXV
 FkKkjcJRE25O8g+Dq+wfNipqXTCx4qWqUISpW2F4q/fg3gd5EnYGgWArqvOpeRgBDcg9
 jjbyHMSo25ey723/L3b30mUxlllfqFPKI52g2yX6YXHScMLhF3n/PP72L3kCBAgBqwpK
 tUeoE294vFsdNP119hA3+At1/VBjtt4sffyKzLHThU/m8cwSSs479QZbbRuMepDC2aKD
 wSGFk5TzNX7tUs7BWlIuRwv5+7Y5ftf8C+uE6tt1S0oMxHGarOhQtPo0ms4QrTsx59qw
 NAkQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9xmvyc70q8sD1pXKsZpACT8Iljc4rW1PKCFuUQkARQa7LJOcJ63JnoS6w/I0umuWxCZ/dg+wQJLyCY@nongnu.org
X-Gm-Message-State: AOJu0Yzgdudpge2+3TRf74Q9zfhf/731lcPV8MoMaWF5qkdgzxz7ASXl
 CDti2WJnudF3uqC6uMH/jIidbewjtpsVZP3S0EqGYLgiy4WCHBH7NnEzjxZQAzTtCWMUtw6E3tS
 OK5W7VvDIagnMwi7Ru2KZajI0cHpKFnAZe0Ekq/riFMjjVGlDLJvstI7j/w==
X-Gm-Gg: Acq92OGUwyApj4S9MOs2z+1ZJtcNcFXAmO4+mWG2JeY7wKbL0w3BnL118YXOHyrgKhu
 QPBV063x7O5/w3aUxUVnaucau7esUy5NKcMbFvoxFB8wt/2aN12sEhqQOFOuUB1eaH0PLynlerc
 xRfmdc8U9Ugnv23rTITO2Jz1brfHGOb+FTq2K20Hfp2H8bL9LZnHc6KqW/YVX9DWIbYnRhX8HJ9
 DCGBht2fDyZTi9T376pVsCUPP4j9tBeTaKztbWBzJWUlbkTjAjrpdBdb/D4P2bNjJyrWR1p82LY
 hB6PBoECYfyPquRj8iPV6gQth33LgvxeGCbUE6qndk0mWn5ZY5ZM/ARlYCfbKUnDkt/BmppU9xb
 e4PZ45BROKuFZV/sPO+7fqBjUcYUf4hdEcP32GGxEmM9gfiA=
X-Received: by 2002:a05:622a:14c7:b0:517:580c:bcd3 with SMTP id
 d75a77b69052e-519ac2276aemr39688031cf.19.1781696064054; 
 Wed, 17 Jun 2026 04:34:24 -0700 (PDT)
X-Received: by 2002:a05:622a:14c7:b0:517:580c:bcd3 with SMTP id
 d75a77b69052e-519ac2276aemr39687501cf.19.1781696063416; 
 Wed, 17 Jun 2026 04:34:23 -0700 (PDT)
Received: from [192.168.68.103] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51955b271fbsm131095431cf.22.2026.06.17.04.34.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 04:34:22 -0700 (PDT)
Message-ID: <9cc3db2f-9153-476c-91e7-82020cf60651@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 08:34:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: raise access fault for Zicbom MMIO-like
 accesses
To: ZhengXiang Qin <qinzhengxiang@foxmail.com>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <tencent_AFB2247001B0C72775E3DE202C43F5126107@qq.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <tencent_AFB2247001B0C72775E3DE202C43F5126107@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExMCBTYWx0ZWRfX+0TesHVTvSen
 imKKJjMDYnkqirXRuZCcnv7swGEeSkvpmiDmF+NWD1Fo2aYQfSy2PXa3GsFbO3YJlWRGoIPr3Uf
 f05EPh475yz+8H9+xZJWKX4YM37CRzM=
X-Proofpoint-ORIG-GUID: MFyPvNMRRBggZEzqFFkXgCkdNLAkApTv
X-Authority-Analysis: v=2.4 cv=R6oz39RX c=1 sm=1 tr=0 ts=6a328641 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=p0WdMEafAAAA:8 a=bDN84i_9AAAA:8 a=EUspDBNiAAAA:8 a=D1X-efNntoiCHaPa3eEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=J2PsDwZO0S0EpbpLmD-j:22
X-Proofpoint-GUID: MFyPvNMRRBggZEzqFFkXgCkdNLAkApTv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExMCBTYWx0ZWRfX2MTb2mV0KQEC
 VaSPvQUKOLqWRhSdndt347dmgm91SrD9pmziHZTXnS9JTaWjjsw4bUoG6YQAr+WTfUf5MY3zi2s
 CUm14UHiYJXh3XgPALyU5qZAQtcnOv5FaI38jh4jYVY8+zta3jOQ4zYoEuNXdwQq90pQNOHEoDA
 kzESfMlpENosbpqFaJ2q/hnKFYTxwHIsa6MjImpa56kLZJddtRT23LO+4ZUAwIgbPf2Emgw2Q1H
 ZeGqkF2d/pbFrHtgvkV9Ir8hBjc/YhPCaTN87fsa3fQ3veDi8o13zCR3lr7L7ThFM8OQxP5cpYp
 mZFvF05ZoAeHEzMT/jju9hiaiuTBQn21pWnv2of1L91NwLaTUuiKmH5TxiWygOC6Z0dfwd3G3Xc
 0S7H9E3dBboQNp0PcI6f0PbNt6qBbCNAlSOmVXne1DwVSYtItqydfrEsWPtSBuVIpwgak0A12xe
 4aa+YDNyA4731m2Zu0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170110
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



On 6/16/2026 12:33 PM, ZhengXiang Qin wrote:
> check_zicbom_access() probes the cache block with MMU_DATA_LOAD and
> returns early for any result other than TLB_INVALID_MASK.  This treats
> TLB_MMIO as a successful load access.
> 
> For Zicbom, a TLB_MMIO result does not provide a RAM host pointer for the
> cache block operation and should not be treated as a successful access.
> Raise a store/AMO access fault instead of silently completing the CBO
> instruction.
> 
> This fixes sv39_zicbom_exceptions_Smode.S, where cbo.clean/cbo.flush and
> cbo.inval access a block mapped to a physical address without PMA
> permissions.  Before this change, the CBO instruction completed and the
> following addi was executed.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3501
> Signed-off-by: ZhengXiang Qin <qinzhengxiang@foxmail.com>
> ---

Thanks for taking care of this one.

Without this patch:

$ ./build/qemu-system-riscv64 -d in_asm,int,mmu,unimp,cpu,fpu,vpu,exec,nochain \
	-D sv39_zicbom_access_fault.elf.trace.log -nographic -semihosting -icount shift=1 \
	-machine virt -cpu max,pmu-mask=0xfffffff8 \
	-bios ~/Downloads/sv39_zicbom_access_fault.elf

RVCP-SUMMARY: TEST FAILED - Test File "sv39_zicbom_exceptions_Smode.S"
RVCP: DEBUG INFORMATION FOLLOWS
RVCP: Test Info: "Mismatch during cbo.clean in Test Case 1!"
RVCP: Instruction: 0x0017a00f
RVCP: Approximate address (failure may be slightly after this): 0x0000000080000250
RVCP: Register: x12
RVCP: Bad Value:      0x0000000000000814
RVCP: Expected Value: 0x0000000000000810
RVCP: END OF DEBUG INFORMATION


With the patch, same cmd line:

$ ./build/qemu-system-riscv64 (...)

RVCP-SUMMARY: TEST PASSED - Test File "sv39_zicbom_exceptions_Smode.S"





Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Tested-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>



>   target/riscv/op_helper.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 81873014cb..6c9bd5c102 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -218,6 +218,7 @@ static void check_zicbom_access(CPURISCVState *env,
>       void *phost;
>       int ret;
>   
> +    target_ulong fault_addr = address;
>       /* Mask off low-bits to align-down to the cache-block. */
>       address &= ~(cbomlen - 1);
>   
> @@ -235,6 +236,10 @@ static void check_zicbom_access(CPURISCVState *env,
>        */
>       ret = probe_access_flags(env, address, cbomlen, MMU_DATA_LOAD,
>                                mmu_idx, true, &phost, ra);
> +    if (ret == TLB_MMIO) {
> +        env->badaddr = fault_addr;
> +        riscv_raise_exception(env, RISCV_EXCP_STORE_AMO_ACCESS_FAULT, ra);
> +    }
>       if (ret != TLB_INVALID_MASK) {
>           /* Success: readable */
>           return;


