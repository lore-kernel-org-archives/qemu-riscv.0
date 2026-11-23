Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E10A606A32D
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 17:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b4d/Qkxn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FgzkOyeR
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVXgj-0005Ca-Sk; Mon, 23 Nov 2026 12:18:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVXgd-0005Bq-Ny
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 12:18:40 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVXgZ-0007QF-38
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 12:18:36 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ANGGxVP3730309
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 17:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GU+Fy+aJxNVn6hRJlG//T+aV+gPJBsD2yjDuzqEXxaQ=; b=b4d/Qkxn5Rqn6REZ
 APrUiPiVVJ6CwIpt2jK9d9FVX7E7leEJwRtUHq74hUGwWIBtGanBhqzwyYxm5htz
 ZIMJ9mgHx9KhoIUFbfPYFVN6TbCo7ZyA7boT1bvy4Qid+Gv2Y6RYTtNnK92J7f2v
 sMwmYWQ+a+2nrMXRz2bdOcIQB1y3ZLPnCR+jh5hqQ2shZ1la64yPgjOkX+Qc8CQ1
 YgTaMnKkhsbcZomPVA1yD9zEZifsO2unOatBPIq7A3ThD36H5OW96OoZ50ryQ1no
 50DUSeQ+bQyogg3AQgGaul3KVOrENbU7386ePkfNxhLKeRrBG69L2YHkah8vj8x6
 tnHaCA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd2khp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 17:18:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93f5844e383so578917085a.1
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 09:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795454310; x=1796059110; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=GU+Fy+aJxNVn6hRJlG//T+aV+gPJBsD2yjDuzqEXxaQ=;
 b=FgzkOyeRoiqSMQJrf4CqB0E51D/eDbKPf71Qu+8MQnZ77GM3jfy80dv18ED2y0079G
 ZhxGwOzo/maIZHtGYsjVtNfZO7yw94ubosJ1wXtRdXdUOnkT0mxKsTVWpCOUjFstuMvl
 pxgI+gJH+GXRjUDXSfzo50N1Y82XqS8NhA4rBrG49n3QoCsChCD2y7AqznpDkIjWwZ3B
 gYGuIDH69eHw+pETIGvD4U4D24FlwphYys7HxmtDinf277GBn1I6mZ4j+n5DhyQqsS8r
 +5bAC5CC8dRFm6MZ9eRWcjc6Z8OLERq1It2B/2vY9no/btpLk/BhH124HLMGVrcx1rs3
 dq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795454310; x=1796059110;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GU+Fy+aJxNVn6hRJlG//T+aV+gPJBsD2yjDuzqEXxaQ=;
 b=lqwMMpc84wwc9nkLktXoOtajBZkn77WfniZjRnOweVmYlQhOHmoJOPNm6aZ985EHq3
 I1qNGcJJ4XRF0LNpxvZ7fuSp5f0d51PMaF7MAK+3GCBNAOh7mHb+ibWoCzmpyxnxLCKv
 z3547TewAki5u95Ppfe8EtCI3ifbdgReu73yjemLm10ddcuCRWCdrCWMEd4hHY/c1JUH
 1d7FWlOIfdAKjdzYUCtAQkzse2hwHlDipUncA1k47CWQESBACZel+xswKKifmNOL3VLu
 2zBjLMIGxNaeMhrTe9EstOJTuy0KKPb0qJIxruvhA9W5KQNnEVFZ1MFfeKqVpMH43gAL
 gy/w==
X-Forwarded-Encrypted: i=1;
 AL+hErF8JtvlefM5gwxN7UfAoqcQXATFpoK3kGk9JB8+IDKJN7qSyis1hGHeI0F54XJBhzcjESkiWq42YsFX@nongnu.org
X-Gm-Message-State: APuU4Z+pEfR2bNh5LMmq5QT5WhU/X/wbPxHtTdBReqzsyxY4+j65Zo/Z
 MGTdktCLaoghK5hsA7HQZSOHQAWnuYCkIJRb0dp2FGddtgLVoZoD2NvfCLTeBqCJnly53kVV6zJ
 wE5NIfWPlaFtXTr1Fbyr5GyScu5bmkQ08WQmQ9KDWKrgrL4Gd8Lsf96EGWg==
X-Gm-Gg: AZFdTZeAH6JWH4JBiA1uMKRlXUu8kaSnCf4OSXjcUAr+M+50kP2Bps7Xy0eXTAqj4ot
 DPghKQPbLCvMiKvKnCnTT0ALWHuYxS4rEn5FO3wXgmx6cm5mVTGnmI02IueOioWH6XNa5da66o4
 H+CtmfjvnRfaDOKDvs9s50Tqbh66Lozf0Xbfonm8MK6v2Oto3PtKulX5U60BBPRg3TyN/aRyNg6
 3r1o4ZQO8xmdt6hH6UVKk1d6C9d+GwTXgdga1dAVALBYA1zrf/4StUWLHGvUM4KhSWSM9VJ7doU
 SwNXno/aSOHMpoi16BjwvIs947okDYrv5Lx9Dl0RRY4cbHEoB37p7dDDSBYMVZS/GbHdbpJx/3x
 2S0hIVkesrxp+ZL0l6I4lTgtJUE80NTc1A99oHsi3eEc+bJZxzwHWJJSkGpWMVuEvl+TTSSa6Gb
 KrVlMPMOKl
X-Received: by 2002:a05:620a:f04:b0:939:6de6:9518 with SMTP id
 af79cd13be357-949ba9dcc43mr2131388285a.47.1795454310207; 
 Mon, 23 Nov 2026 09:18:30 -0800 (PST)
X-Received: by 2002:a05:620a:f04:b0:939:6de6:9518 with SMTP id
 af79cd13be357-949ba9dcc43mr2131380385a.47.1795454309669; 
 Mon, 23 Nov 2026 09:18:29 -0800 (PST)
Received: from [192.168.68.101] ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-949bb0315f4sm842513785a.3.2026.11.23.09.18.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2026 09:18:29 -0800 (PST)
Message-ID: <1c13e1bc-a970-456f-a9e4-9a04afc06c82@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 14:18:26 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Reject shadow-stack accesses in Bare mode
To: Zephyr Li <fritchleybohrer@gmail.com>, qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 qemu-riscv@nongnu.org
References: <20261118063027.33313-1-fritchleybohrer@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261118063027.33313-1-fritchleybohrer@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _9y-ASthBog90nZ8SLjDwD7dJSTWFpGy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfXxj/NHq0hA+Vk
 8oQZRyhMpEZDUwJYeDGimH3R59T5VsZjQJva8wrv0gv69op2kmfqZapHbeKCAi7ENYmATdSeqWl
 hVrjONej9Aw2mWnnRzVRM8mUZowL7VPDqh4yxRpvhYK2LJsKUgYWzvHbYV605cSumM9mCRPTFHm
 9x2KIXHdLtuGIfkDX8/PuvR/fHl797oMjeB5RF7DfYByeMbSFZTnU1T+xQwtjFMUTebErXDO7Dw
 +B1yHL6B3OysDAqF50ePEp/el7IkxyjZgpaIukSV/oc0N252ZM5wvJUVNaLfwu8mjx6OHJPsFBZ
 66PO1lvKdSMZ7PfKWMbyw0iQFkN0f0GGU9r6s1oc4wtrLAuqMptEQAVTcM0uqABoUaMpTzVjRgZ
 gb/aap5W6EK4fXLO+fTNR3JyDUoq3P29WYcIkg2Fkhx2y6nZRqA9DszSR5dCbtCF+ajkz1EO4fl
 tUCZT1K2ks9guzuI3kQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX5thjsdYdzzS/
 +k06Hde3yEp1cnBGm07U24NureOcHLeHVZf0o4zt41138vggEdtxu266w6NgXEvFXEE7vBOZXB2
 zEoUNiyNQOldOX2JPbBGPNgQF9XDP50=
X-Proofpoint-GUID: _9y-ASthBog90nZ8SLjDwD7dJSTWFpGy
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b047567 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=p0WdMEafAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=SJ8tTX9GuA0rmjIxmVoA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230068
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
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/18/2026 3:30 AM, Zephyr Li wrote:
> Zicfiss requires shadow-stack memory accesses to raise a store/AMO
> access fault when the effective privilege is below M and satp.MODE
> (or vsatp.MODE when virtualized) is Bare.
> 
> get_physical_address() currently returns an identity mapping with full
> permissions for Bare before applying any shadow-stack checks. A
> shadow-stack instruction can therefore access ordinary memory instead
> of taking the required exception.
> 
> Reject shadow-stack accesses in the first-stage Bare path using
> TRANSLATE_PMP_FAIL, so the existing exception handling reports an
> access fault. SSPOPCHK's existing unwind metadata promotes its load
> fault to the required store/AMO fault.
> 
> Apply the same restriction to the MMU-disabled identity-mapping path,
> while preserving the M-mode fast path.
> 
> Restrict the check to the first stage so a valid VS-stage shadow-stack
> mapping can still be used with G-stage Bare, subject to the usual
> PMP/PMA checks.
> 
> Fixes: 669b4867495c ("target/riscv: mmu changes for zicfiss shadow stack protection")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4432
> Signed-off-by: Zephyr Li <fritchleybohrer@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/tcg/cpu_helper.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
> index 58e98e975c..8f6f980ecf 100644
> --- a/target/riscv/tcg/cpu_helper.c
> +++ b/target/riscv/tcg/cpu_helper.c
> @@ -1131,6 +1131,9 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>       }
>   
>       if (mode == PRV_M || !riscv_cpu_cfg(env)->mmu) {
> +        if (mode != PRV_M && first_stage && is_sstack_idx) {
> +            return TRANSLATE_PMP_FAIL;
> +        }
>           *physical = addr;
>           *ret_prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>           return TRANSLATE_SUCCESS;
> @@ -1181,6 +1184,9 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>       case VM_1_10_SV57:
>         levels = 5; ptidxbits = 9; ptesize = 8; break;
>       case VM_1_10_MBARE:
> +        if (first_stage && is_sstack_idx) {
> +            return TRANSLATE_PMP_FAIL;
> +        }
>           *physical = addr;
>           *ret_prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>           return TRANSLATE_SUCCESS;


