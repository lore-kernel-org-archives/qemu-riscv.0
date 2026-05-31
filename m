Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AA1CD6E56
	for <qemu-riscv@archiver.kernel.org>; Sun, 31 May 2026 19:53:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wTmDl-0000v1-M7; Sun, 31 May 2026 15:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wTmDk-0000uh-1e
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 15:53:16 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wTmDi-0007BU-HP
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 15:53:15 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64V2F1EL303910
 for <qemu-riscv@nongnu.org>; Sun, 31 May 2026 19:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 F0I9zbbd5W6x0Xb8ZvPu/QkdgllHVFeYCk7Y+KB0bR8=; b=ThqPnszVNncStfoD
 esLp5P35hzf5JYG87vsm4vDepbRpM6rkKk1CnZySRp36xVFrnN27OghhFxDF6rOb
 JSR+7twbHmH6OF1OwPhtVWIXE1TjjfpEtmoOdA45vDZzFCY4+ox7jZPDleMC7LIP
 qHjSpv7NyHbB7RjBwr89zPmsrXyvteMe8qEELona3LONdegqDUHaivhp92vDqMV4
 /10+4Jn/MER7i1YJCag6bdLeuLxTQR+Xyx6+zV8fvYrvySMNP9aXgAJ3fVBZK/qc
 27YNY6oNdkCOPCSvOsATdM0Q4QMAlHc0/Ts5gvRE81HxC5YpR7XF/4ZnnvY7w3bV
 Ug6nQg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efn8pn0w3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sun, 31 May 2026 19:53:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-9155e04bb81so63553085a.1
 for <qemu-riscv@nongnu.org>; Sun, 31 May 2026 12:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780257190; x=1780861990; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F0I9zbbd5W6x0Xb8ZvPu/QkdgllHVFeYCk7Y+KB0bR8=;
 b=d7+UHZxFIXM7ct21G8QN6gRYMldBbGVI+0DxErK0CIvEu8zASC1Qu++LI73VBWONUj
 NpkHTYXJN7+VNodD1YZD2PELTTzukd2cHgkzt3OWkpYXUPGBUoPxiKjLPJori6s7BMsg
 hr96VETCoipQFyZyW7fCfokzJJ6TLp3UoDlf7w19bqOrXWCPoOgfuhAvc40DOKIRtNlU
 xWc9LgDT/iBFMT7kJSVOmX12oJVb4c38XBNsQP6RG2b/V+lo3W0PdsuPxf8WjHo9evyq
 cxB/SaTUj4kWpj096NaNlXcDJw21Eo2m/O7LDNE5gvhGgyc6qeby0ASS5/9FE1VOaXCT
 9Ylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780257190; x=1780861990;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F0I9zbbd5W6x0Xb8ZvPu/QkdgllHVFeYCk7Y+KB0bR8=;
 b=M+IIm99stqdEKxYAvF2TYsZ6eHrMwHahRiaOCBpc13Fg7/DvtU9PWGfTkqwrPDFpj1
 1Np8yrKTtNhrH6e7QpiUWBmionqjlJxyMz7eZqsxI+wevImmcY4Z5+gCGJR7F0aKjyjl
 xA7RO02JFNef8Ue/LiOyXNoqkFsOb5Z9D3LsaTyq7f1/qy9mqf93h2RE8+c5kCtVdRpT
 aUC0Aj9/2Z1MXSoHQMy7rbJFFXw1uzMAVz/93fmTDVHv319UfbUWzNa1B1VUWPfyu5C7
 DsqqHG7BsxvGlqbY7mQoHgXXczVYirkiHIckH662hrbOn8y21tIngYUU2BQSXpyL72DU
 FV6w==
X-Gm-Message-State: AOJu0YwaredQdKEogkXWR0rhMDrrBrWXu4HQCo/L0hNzdjchf+tNe6Xx
 3Udnp4BHaA/lIvBXuzyZZJb0YzF6xSOQOlHl/hjboTRZscxJGshngsLaeb6sivMDJQi4uCaQVrg
 DBTN/d0LO6nWhMgB35Euu9/c2pNrgxb5oU0+tcd7BQFt0OBr0fi7G0om5zg==
X-Gm-Gg: Acq92OGf57ka7fBsIgpRup3uDLWpMRc9e7TF+lltd6EJDldPrlQALbMddO+nl3QNHiO
 IeP+3GuopqbSWEcbmlesaLH9bVBD0mWlkDqvIwVWN/FhtDDOF5rVuYr+HxB42jUT6hkDSLFZ6Ss
 ARWrdEx5XWOMf1Aq1FY0oblpv/w2pAcKrsrxF1vXqfOgKkcHTS8Hnw5mmXVCvuilpSmNAc1SYxH
 gYAjUHnnQJ/dFGfeUwsRoehwmIsN1fB1SYIbGC26mH158cZcOREOMIm1G6tkIINHB9ReH5aZRV3
 yd9KdgJutadChlKkuyM9uH+le57sfuqcd1NYOKZh3mjYJHadjZxgMaLHXs6yR6BGgvqs1UmYPQf
 eFKcR0LH1ahmfh2ED9k1IDmukhx7fn/giT0468p/LVj6jAjixLV2pd3SJmKhmsRdxivJg
X-Received: by 2002:a05:620a:1b95:b0:8cf:d717:c22e with SMTP id
 af79cd13be357-9153d9f87a7mr1355164385a.28.1780257190056; 
 Sun, 31 May 2026 12:53:10 -0700 (PDT)
X-Received: by 2002:a05:620a:1b95:b0:8cf:d717:c22e with SMTP id
 af79cd13be357-9153d9f87a7mr1355158485a.28.1780257189559; 
 Sun, 31 May 2026 12:53:09 -0700 (PDT)
Received: from [192.168.68.106] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-915325fbaf7sm840674985a.31.2026.05.31.12.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 May 2026 12:53:08 -0700 (PDT)
Message-ID: <0ecca170-beed-400e-a606-d32c6211be7e@oss.qualcomm.com>
Date: Sun, 31 May 2026 16:53:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/riscv: mask vxrm csrw write to the low 2 bits
To: Abhigyan Kumar <314abh@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260530102100.78150-1-314abh@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260530102100.78150-1-314abh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Yjpxoc8MEcjCNUAB6DTNiM5D3wOSXLdJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDIxNiBTYWx0ZWRfX/CBsTTmr5/FG
 OX1S4UVrhz5bStCOrDE9NtZiMqT1sQWVedMIvPa9Sx0N2+d7K4gBZtW/XYDvDs3M83FyamUgfCD
 QIPdo20qKUc0kzl1rOX7lhFgApvcWfsUIqZVY69do/S38JeinTbTi0Q5feykYCNTPbZBtN9T2MF
 VsnM4i8piqGqmTyfQpj9Hsa9W/DJr/UxaIqI1aR2gI9t3gY2YLCB72nZEd6YTUb59acvamwEe3W
 Dlk6uOllfzPI+c0246bzsgK17mdKlOtys26C5pwt+/gph7jbmR9D/IJJAxEdhg1Q0GB8XdCJcUU
 t3OQsIJOsEcqx/J6KgWNdShtYwRhzTtcVbEXDOfpnGGFC2MnkNxGUlc68qGrfAJ1CA+IGj4k7gU
 mebAa7PfWSUcODfsrxLdXngS3ww7qZLeXmWowtkN/lxZkEk/Tw+PA+Jr69HHaX5J4lRQFMiHUXj
 0cf9t1xUo083fiwV95A==
X-Authority-Analysis: v=2.4 cv=NvvhtcdJ c=1 sm=1 tr=0 ts=6a1c91a6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=p0WdMEafAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=SJkb1_gNzY3JbkFYywgA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Yjpxoc8MEcjCNUAB6DTNiM5D3wOSXLdJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310216
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



On 5/30/2026 7:21 AM, Abhigyan Kumar wrote:
> Citing the RISC-V specification:
> 
>      "The vector fixed-point rounding-mode register holds a two-bit
>      read-write rounding-mode field in the least-significant bits
>      (vxrm[1:0]). The upper bits, vxrm[XLEN-1:2], should be written as
>      zeros."
> 
> QEMU wrote full value into env->vxrm causing read of upper bits too.
> Used existing macros for bit-masking. Previous had a hard-coded value.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3470
> Signed-off-by: Abhigyan Kumar <314abh@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/csr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 5514e0f45..7b98d66db 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -977,7 +977,7 @@ static RISCVException write_vxrm(CPURISCVState *env, int csrno,
>   #if !defined(CONFIG_USER_ONLY)
>       env->mstatus |= MSTATUS_VS;
>   #endif
> -    env->vxrm = val;
> +    env->vxrm = val & (VCSR_VXRM >> VCSR_VXRM_SHIFT);
>       return RISCV_EXCP_NONE;
>   }
>   


