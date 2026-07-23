Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC160C531CB
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 11:59:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wms4R-0003LN-8V; Thu, 23 Jul 2026 07:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wms4P-0003KE-1V
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2026 07:58:33 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wms4N-0002Dx-4z
 for qemu-riscv@nongnu.org; Thu, 23 Jul 2026 07:58:32 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66N8qZSl467333
 for <qemu-riscv@nongnu.org>; Thu, 23 Jul 2026 11:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NK4dhrme4XrzquhYr7cLM+zPTtgLCUpN/ePFbxvjOwA=; b=PWd2QkLsWS3i9wDo
 jUVXmg76VRzvPgQmBwg3F5Fn+x+crLj9xq2PgLz0AvojrUlE+pb6zaj1O8YI2MQL
 sDLBJra2zPqd6F0nzX/S4/SthlmqE9PcoV0lFYRG1Xj6MzNS5dgav96zR/kdgNZE
 wXXHDGhj1vKhoAWP8nJlFcaFdC0VgSudSEw6XYwm3dtNCxTqQ4/vm59/TwXZa2ZY
 sWN1NnWcgrBOHkhkzg/5/aNYYDfF65nIbp5pGpI212UovhvVooCq1jztyljbigNt
 LNrOEVwLiaBUAF61liOSzwhATr+Quhw0Owu0cwa6XhlBG2nkYiQmZD4IJ7wDlMPW
 DdCHUQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xuwgu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 23 Jul 2026 11:58:28 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8eec6acbe21so16691246d6.3
 for <qemu-riscv@nongnu.org>; Thu, 23 Jul 2026 04:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784807908; x=1785412708; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=NK4dhrme4XrzquhYr7cLM+zPTtgLCUpN/ePFbxvjOwA=;
 b=MJO+n8dw0sMOG2ITQNi4dUGFxOE8LzZ83jlPzWAry4ySqao2kGFsA0GVMBW1lZuFYB
 K19sPogAEUAJLtzgAwWVbzIafDXnv2qEXtxohk8Pr60v1VE52fK4oByvuYi1aAKDq8iz
 bwYTw33M1pWExWPqFfFi1wMczpx5R2Aks5TpW13sejALLGX6faAcdbL6YvKmiGZD7Jwz
 l0AEMyIiR52XQTeMOSyaPTlqnBdHoilZMbAvUbKbyLP1CwE5/9Exq4ZbncuizFMiwvab
 MeVBBUQT6OyOrFr3X/i0HStew7O76hZXGzwhzts00ae2a3Z/e40/lLHqlP1wtErOStnG
 FUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784807908; x=1785412708;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NK4dhrme4XrzquhYr7cLM+zPTtgLCUpN/ePFbxvjOwA=;
 b=V2cdgvRaRN195hMJjLr8RziWqbmfrlhmeC8jRBbG6H9v7W0HlVrepOVHtHROaHr2tU
 Ob8afOSts/9axjSQRhHAm0Er4VDsoH9I6O5cEpPuHovE7kekfcA9MCXtNk5Td7rkade0
 TKIFbeZzXVm7fsYvPan0ZBf6LbkCGc/es61ndw0DPTiMSHT+3YHiPhxgfR75fVHrjjiM
 4k+iGk49XMwxwP7rwRWiCO5Lu0svb4hXZwAO7XeuHVK3wuJ9J6cMLr2Nn8whM5jtAmMM
 opZOMpb+p5W9yqWQ+/Q+d/iv0C2yd1PLMpk8aVvzPo3eyuQbGgngnyuUUZDCygon1ZvR
 nHDw==
X-Gm-Message-State: AOJu0YxDqG8fuWA38IDqWEpipQf2LyvgmpAUyeCb7A4NuggRo3GUSWNz
 /NtDAg2ylJOiouP/86pBj/31neomKd0XVo3Nl8/Q2A9NmW6ZjxdOz0PjXRqp0uwod598+Ao4Vgm
 7qAKRV/a+0Dgh5MkZTYhwe5pdEfnRru02O0eX24A51j0E1l4y8+W0ZeUTVQ==
X-Gm-Gg: AR+sD11b7QyBbCgArqr7xANMU6CN7tXbFa1SuuBK1AHJiC81rJprV1Am52Ew0VpvbWm
 oG5t5q6F+8e+bEGwmgf8G/ncnwnJpStOl2mtnNJUbTM02YGhVJ5Qdx+36IkVuCnW9pFw9AdzIwM
 DiHuR4hjSTUAbNyIYRS+v+rVl1rcAesyibLlkb+EIKe4uqxJFVqBixUgrVKsKSHBq0AG/v8o+X7
 ZfjO7/USuY4cCauD4oUCleEwCy3RamwZRXNNf9Vh61cMB9QE5xB3Yo+jWMEJxGcsliQylTQAbMJ
 yILKGE+noPetNY8vv6ZROXjhhwVCIbEWwTMJ+9r5zKC5XLDouPb0uIx+g2g7Rz9qH+ZIr3hQEmo
 vC9gs3j6qFNfl2kQysadUcbLnOTAltHO86mvwhg==
X-Received: by 2002:a05:622a:c85:b0:51c:88b:d7e3 with SMTP id
 d75a77b69052e-5283dda2c48mr23464821cf.3.1784807907478; 
 Thu, 23 Jul 2026 04:58:27 -0700 (PDT)
X-Received: by 2002:a05:622a:c85:b0:51c:88b:d7e3 with SMTP id
 d75a77b69052e-5283dda2c48mr23464411cf.3.1784807906847; 
 Thu, 23 Jul 2026 04:58:26 -0700 (PDT)
Received: from [192.168.68.107] ([152.234.122.204])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-907baa0f4dasm43209446d6.41.2026.07.23.04.58.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2026 04:58:26 -0700 (PDT)
Message-ID: <ab82b172-e605-4a16-b0d6-865caa839b40@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 08:58:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: use SXL instead of MXL for read_sstatus
To: Abhigyan Kumar <314abh@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260720105612.953478-1-314abh@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260720105612.953478-1-314abh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4ThNLKIaeFiSkc-CYVDKhB_VGn3VfzRI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDExOCBTYWx0ZWRfX8G6v073NTuQ5
 V26pS4Wn8JLIiBPIvg//+Wg/EVn4vT17OQf66sgRfeHXK1iKbzCqGvSfCBdAhGRsZ6Wc9PtyucG
 g3yyCcZJMvmFQQjSc21oHRw7QIZ+PQo=
X-Proofpoint-GUID: 4ThNLKIaeFiSkc-CYVDKhB_VGn3VfzRI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDExOCBTYWx0ZWRfX0MBn0tLeygHT
 jTUkIDC581rRkptgKIzKEV6Dt4HblmQDpYgMr8/yISqUQdbbORyGiIKir6yBdq4j9biRpi2b8ut
 Hrolgieri/l2xLWmWEWyGspdew06pdxHh7ulghyKIyWQyn/tvSbxD/Ar8F5lxMNK9COnJEFWVPo
 uac7uwaFmwrIss+qC4BcyKqNv8shRi5ogS1VK+76itkYooFhOeIkbrbli/lMh30SHnGTgSgElOz
 CLSyL1BfyXmc+9cCQ2QrsteNiymPcc392zEzyWcVqfJxhPGG9x6gPC6JALvdOs9PhKd1slfYmnW
 ZJ11awEsb8LuGS7f9h9PsUpB8aIOL/CE5gimDAZEVLSsr36ALdd+FZg3M6A240VLSDQMdYad698
 b4aByTnJnIbQLJpr28vgp5GgQOTD30/gzwgZd4Pww9LwBACv20ZOctUtNmZ182QYWwdFHI7GiP5
 DK6/sDnhK67hoav9Ugw==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a6201e4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=J0RmenBMOwS19r/fhzI3tQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=bBBmsoVW4sAyd_EGzYsA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230118
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi,

On 7/20/2026 7:56 AM, Abhigyan Kumar wrote:
> According to the RISC-V spec, a 64-bit system can have M-mode in 64-bit
> with S-mode being 32-bit (SXL bits or mstatus[35:34] being 1). In this
> case, read_sstatus should use SXL.
> 
> QEMU doesn't allow changing the SXL bits in mstatus in M-mode. This was
> because of the missing MSTATUS64_SXL mask in write_mstatus. Now, both
> the SXL field in mstatus can be safely modified in M-mode and
> read_sstatus correctly uses SXL not MXL.
> 

Please add:

Fixes: b550f89457 ("target/riscv: Compute mstatus.sd on demand")

> Signed-off-by: Abhigyan Kumar <314abh@gmail.com>
> ---

There's a style nit that checkpatch detected:


$ ./scripts/checkpatch.pl 0001-target-riscv-use-SXL-instead-of-MXL-for-read_sstatus.patch
ERROR: trailing whitespace
#32: FILE: target/riscv/tcg/csr.c:2074:
+    $

total: 1 errors, 0 warnings, 21 lines checked

0001-target-riscv-use-SXL-instead-of-MXL-for-read_sstatus.patch has style problems, please review.  If any of these errors
are false positives report them to the maintainer, see
CHECKPATCH in MAINTAINERS.



Other than that LGTM.  Thanks,
Daniel

>   target/riscv/tcg/csr.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> index 36f2004bc..b67a5a301 100644
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -2067,6 +2067,11 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>       }
>   
>       if (xl != MXL_RV32 || env->debugger) {
> +        if ((val & MSTATUS64_SXL) != 0) {
> +            mask |= MSTATUS64_SXL;
> +            val = riscv_write_uxl(env, val, MSTATUS64_SXL);
> +        }
> +
>           if ((val & MSTATUS64_UXL) != 0) {
>               mask |= MSTATUS64_UXL;
>               val = riscv_write_uxl(env, val, MSTATUS64_UXL);
> @@ -4014,8 +4019,8 @@ static RISCVException read_sstatus(CPURISCVState *env, int csrno,
>       if (riscv_cpu_cfg(env)->ext_ssdbltrp) {
>           mask |= SSTATUS_SDT;
>       }
> -    /* TODO: Use SXL not MXL. */
> -    *val = add_status_sd(riscv_cpu_mxl(env), env->mstatus & mask);
> +
> +    *val = add_status_sd(riscv_cpu_sxl(env), env->mstatus & mask);
>       return RISCV_EXCP_NONE;
>   }
>   


