Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8CBC79FA0
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 17:43:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3dMo-00022f-Ao; Mon, 07 Sep 2026 13:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x3dMn-00022I-AO
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 13:42:49 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x3dMl-0004eZ-I6
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 13:42:49 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 687HZvOF472776
 for <qemu-riscv@nongnu.org>; Mon, 7 Sep 2026 17:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pnHY6uT0WM4jVgM1Po0jY4DaXBX/1Gxf5oUFLhGMbhc=; b=KUxcHDclXvneH8+K
 fp7GiN8ANY0zwfGTwt8lSeRehaobkDsNWr76+aT5Rm6qpaCb/CyY0/XQHGjsBD1D
 38xA/HTWiuuICSGmVRS/zWXtJXUUqCKUUx1iC/IatUXN+Sxkfv0L9z2f524TAo2W
 /Ku1K5ZmVm4/+olOxVyNPqP/jA4x/DJfGHcwN19ENpSYMD4RAuepdQZ9wGNfc89J
 BzI95HidW+4xLcMvDG81SJAHhtED7WknjF9E/+5RmG3UzdxQCgC1FZEXELZ5MpkU
 Yi0D9wNFN8eIQHiNDqI71WVju1J1zKju7Y9IvJXx3I/rZ2pMIgSq/eRa8F7l3d9s
 Ft1D1Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfyj5cj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 17:42:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-52fb6c7b680so50318251cf.1
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 10:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788802965; x=1789407765; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=pnHY6uT0WM4jVgM1Po0jY4DaXBX/1Gxf5oUFLhGMbhc=;
 b=FNxt46lXin1Aar0Jd6XyXGTf6cC9425SwDjiAnJu8JxLfxy2yUJdKlj/ZFeQW1mV84
 1C4VzAE203Qr3CzRlJomd/m4EkV8aq+QWkvVwGkuuFsuQ9rGUCBEgYX9y33GkuzbpdhV
 TwNDtRQI413kDdm6v5yP7aWTzv7IFcLiHOtjnX16V7WXmXCp6Pfs5kug7Bnr3IIdBInR
 x3ARhYTmMHjGtspCitpJjABR+Og+XIoeWHTWcPIpd07TsWuQFfsgdONYlz2JA1WkFTdi
 J+T8ASLp8CTIJQ2JrqUHGuV9T8FiREBwY3HYszbZO8bP/DlIc0aaLrV6YkEewAejQgyF
 sYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788802965; x=1789407765;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pnHY6uT0WM4jVgM1Po0jY4DaXBX/1Gxf5oUFLhGMbhc=;
 b=rldWqCJg/fLrT2JQvx1TfdSvs20Lo3v90VQmCnBaEHJHS5dolzOFdK8cE+uVtop9C2
 FAEpzrg/fNndGA4fEHLewch2LNCTwOlyRcGSWI8tGmb8u7x8ZD59Nq3DfOk9cOxAj/M9
 ZKoyt4EgjuaIPmF3m/NJGTDQzyAtV0sKCKZ5eGhcp3fgE8L8FuLEevQoqllbk0yN2CdK
 vT7akFKJUOyWIz8b8uwsc/VncWnuM7q0L6cr5M25DJvD5dfwDqLu8yD00/49/4TAVOCR
 nR8lHy3Ox/b56Fl4qYSeYq6OxJUOMVJaorOeJ5C5YLyy5pCzYCJJg1mNkF59Fu0mOOUW
 M2Pg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxWOhq7m13CP/Wrosk1dGUVqMSgEKcKdkdqqHluMVffIJ3UcV09SE9kel2Ewzjn59C0X8DqMgyZgMwl@nongnu.org
X-Gm-Message-State: AFuF++mVALRTvCtJB9g5bv+jqFt/WVXH7qeWBEd/zRBXNdZ/9tD0XkiW
 dv8G2Y0M/sNsEYSeTc0Db6a4TCAB2HPYJB37uBqOWz8iXuCoELf8C73DUNsAUWDUVWHAWb3ACEb
 B2xH4mgaY5VBlnJRT5Xo9UtgfXBC6fqVBCRtdim7o+bD1RY+GjRwzeqG37w==
X-Gm-Gg: AYBFou1ZD40KN3uckev7QUN9MOJK3Nui5rUtaVRd+hljFjAjTywkeGl08plJy7b0xyT
 ghdMRHOe+N/03qoMhE+NXSNl0VXZMEKL1Xp/ZYmn1iTJ9uKWqxNXB3HPwPabrgI3H0x6zCka0c9
 JqDrIW5qbf45laPDs9pl+vtzngAXzzNhbLx9xy17dKpupI+eTos217Cr+ZfyW9kRVIaPDdJ7N9d
 bQbM5JbhR6VgHV1+WXWe94WdLWbamiuB7gxnHCAYXqhBz9J0xl9AACeHZ1nNcxh/u7MWqds/NkQ
 emOdUlAqB8+oxsdgCLkA8Y/0RcVdmzn7mLroEVjTNftDE0h/3VCIHMQlI7Tr+m1D+J58tmhp1oF
 CDdskTMlfaBnSzNl7OQf4I6bbeulNGRjQ4xA=
X-Received: by 2002:a05:622a:e113:20b0:530:6131:64af with SMTP id
 d75a77b69052e-5306131715fmr155319301cf.33.1788802965545; 
 Mon, 07 Sep 2026 10:42:45 -0700 (PDT)
X-Received: by 2002:a05:622a:e113:20b0:530:6131:64af with SMTP id
 d75a77b69052e-5306131715fmr155318931cf.33.1788802965067; 
 Mon, 07 Sep 2026 10:42:45 -0700 (PDT)
Received: from [192.168.68.102] ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-53054180b8fsm91577581cf.17.2026.09.07.10.42.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2026 10:42:44 -0700 (PDT)
Message-ID: <dbe38104-3783-4928-9aab-4561b9bdac43@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:42:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] target/riscv: canonicalize reserved CBIE encoding
To: wangyang <wangyang25@otcaix.iscas.ac.cn>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org
References: <20260905093749.491-1-wangyang25@otcaix.iscas.ac.cn>
 <20260905093749.491-6-wangyang25@otcaix.iscas.ac.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260905093749.491-6-wangyang25@otcaix.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bW1mDrd5EwTzjFL_XdssTbV7wB6vovZu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE5NiBTYWx0ZWRfX2VXYb/MQSsMK
 UvjPNIBd5I9nVItPuQKLpIwuJmZ/JAfQIiTSEHfEU4tYj6vvIm/hMshq4KDcXY3V6mAMRBO0lrs
 na0aN2kzxRrfFpYm/IMIK5odNYWHft9uOcLk6Z8pvnYFmzdgWkokgYudntmie4pUJZPy02B0eZt
 F5aQ4sBMTjAbpLA/CuFFjYTwyU+kSazFNibPmGVqeushjxWJDdtcZrG4mSPzzIoNlsTGUxbeuJF
 /+jcZGQ5lgkvZoS1i2+i+17bbXutiqCm6yX8dyDtnW0v0R6eHfyVvplfS0UiUm5BNbpKVXGP5Xy
 99x0etrczGhj20AlU0Jbb1EtkG/bNnFL/jvIqDq0vgNEzX4v+wsiS7sjMb61fg+2Mupo6k/GnJT
 3tDDyFUAtBScskUg9nsjAil2eyMxFFSuNNhOk5IgFLCLRas5YUOQseIJHT+ww55sAj8dX3qd+yE
 QmFB9zWZ+HcZEKzoGuA==
X-Proofpoint-GUID: bW1mDrd5EwTzjFL_XdssTbV7wB6vovZu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE5NiBTYWx0ZWRfX0iD4Wr2hH4Jn
 dwLkZ1gcRHt2DMxzimx+jpS0B2P3ktUQuKlKhY22uPgkUJt6Ctuu94lWkHV8vwH1m5yfM/aIgfH
 W01WVDhyyG3VYM8K3WBGn55QWlWfwZM=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9ef796 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=p0WdMEafAAAA:8 a=x-x9FmLcmKcBr6A0_pgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070196
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



On 9/5/2026 6:37 AM, wangyang wrote:
> CBIE encoding 10 is reserved when Zicbom is implemented, while
> encoding 11 has defined behavior. Canonicalize only encoding 10 in the
> menvcfg, senvcfg, and henvcfg write paths so the reserved value is not
> retained and the defined encoding remains unchanged.
> 
> Tested: RV64 menvcfg, senvcfg, and henvcfg CBIE 10 and CBIE 11
> write/readback witnesses.

Same thing I said in patch 3: please replace 'witnesses' for 'test cases'.


LGTM otherwise.  Thanks,
Daniel

> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4416
> 
> Signed-off-by: wangyang <wangyang25@otcaix.iscas.ac.cn>
> ---
>   target/riscv/tcg/csr.c | 29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
> 
> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> index bd4b6dc114..cf59f9ae54 100644
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -3260,6 +3260,16 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
>               stce_changed = true;
>           }
>       }
> +
> +    /*
> +     * CBIE is a WARL field: encoding 10 is reserved.  A software write of
> +     * this encoding must canonicalize to a supported value instead of being
> +     * retained in the readback.
> +     */
> +    if (cfg->ext_zicbom && get_field(val, MENVCFG_CBIE) == 2) {
> +        val &= ~MENVCFG_CBIE;
> +    }
> +
>       env->menvcfg = (env->menvcfg & ~mask) | (val & mask);
>   
>       if (stce_changed) {
> @@ -3354,6 +3364,16 @@ static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
>           mask |= SENVCFG_UKTE;
>       }
>   
> +    /*
> +     * CBIE is a WARL field: encoding 10 is reserved.  A software write of
> +     * this encoding must canonicalize to a supported value instead of being
> +     * retained in the readback.
> +     */
> +    if (env_archcpu(env)->cfg.ext_zicbom &&
> +        get_field(val, SENVCFG_CBIE) == 2) {
> +        val &= ~SENVCFG_CBIE;
> +    }
> +
>       env->senvcfg = (env->senvcfg & ~mask) | (val & mask);
>       return RISCV_EXCP_NONE;
>   }
> @@ -3422,6 +3442,15 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
>           }
>       }
>   
> +    /*
> +     * CBIE is a WARL field: encoding 10 is reserved.  A software write of
> +     * this encoding must canonicalize to a supported value instead of being
> +     * retained in the readback.
> +     */
> +    if (cfg->ext_zicbom && get_field(val, HENVCFG_CBIE) == 2) {
> +        val &= ~HENVCFG_CBIE;
> +    }
> +
>       if (riscv_cpu_mxl(env) == MXL_RV32) {
>           /*
>            * RV32 stores STCE/ADUE/PBMTE/DTE in henvcfgh, so a low-half henvcfg


