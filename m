Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87931606A31A
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 17:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BJ5nYVa9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W8waei82
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xMUFW-0005Gu-9n; Thu, 29 Oct 2026 13:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xMUFR-00054G-8F
 for qemu-riscv@nongnu.org; Thu, 29 Oct 2026 13:49:12 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xMUFP-0004BA-Io
 for qemu-riscv@nongnu.org; Thu, 29 Oct 2026 13:49:09 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69TGD3KX1143410
 for <qemu-riscv@nongnu.org>; Thu, 29 Oct 2026 17:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cHbtURLlpwMmkNshmZKhwV0pzhPmlNhIdtdUA6h5gkw=; b=BJ5nYVa9oLkjHtFt
 p+LXvw4Kp2bawv0jk193jZBjUXve8KmtUZa1+bhlB0/tzkMG+f7xFtWotT3z4Et/
 +VbDzyXtZAFGqAPlsBKdOIhIe4HljstYMeJvm9NKc/ILp7adc/y6WhBBzzUuhzBn
 4/G9mRKtNuQq73eRrSYFWjiEZK7vFObUMjHyrtAzqAKdZy9qaFtCTt6Q6zKLJ5vH
 fMbPgaMS5DYvUM9rJwvMDD+IaAxmw6MM7nEAO+/CCdDCuM86/t7IqgfjSTCOjToZ
 CfTYrHW/zkM3UxgonWOwANJkY2EJ2BLCWu9GG6Xr+K9JBeSGKt6rqCnrEynLbBWX
 HvIE/A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm76chu6h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 29 Oct 2026 17:49:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91c7a0f8250so51345086d6.2
 for <qemu-riscv@nongnu.org>; Thu, 29 Oct 2026 10:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793296144; x=1793900944; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=cHbtURLlpwMmkNshmZKhwV0pzhPmlNhIdtdUA6h5gkw=;
 b=W8waei82xVkCB31HDgEeoNaD2azcy70/XfT3ALCfKqmc4D8n9xhGbtPf7fWgvVI9Gc
 P3NwyXkNQlef3mgs4UGpGL6J57sQvMkUmq7UBysvM8TSmJHYcpWeYVzd82WmYHUZiJqP
 ZuoemayMIuC/BXDyfbtRD8+9jiX2Evf3xWz+sy9Z15fQV33nz+80XcwDA1rqGaDVTLfA
 nil4p8YuUPCELhGFigyVJcK0+6S76yJnbHLPnLwBKf2Vr5VnT47qzxPiO6RZaQOB/Z7I
 GpsqCP6CKEG3/BUOMX0YMcFY2M+ayOPpFBXCxMGEv86ZWuhTv8Fxy1oR+PIjCP0dIkOS
 KSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793296144; x=1793900944;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cHbtURLlpwMmkNshmZKhwV0pzhPmlNhIdtdUA6h5gkw=;
 b=LpDamQUQLBhaACWfiQ3zjk68ksczrzNYAJVvChXvH/4n9TDueytP8b7AFHockrEKyL
 JK1BCI76i0f+axtN5QBn2QK6DaB2dzf0N1LRemDDSeaNlIdR2C2xFbZeNsW1doESNBvY
 aAHo9iNrLeahDp7jqNydIf6dnTvW3P2APsCw3vY59d2lzOylyaP4E9qcgs8COg9b/0yX
 woz+PHtg4SJnfboMbyj4+e/meDM3UyC21qs/KOYkOGwkObyw6VdpmEnQ/4BQcsS/e1wy
 kC8X+hdf9oMyHDuq/5Ra/RDocq7ME/GBwydoyOEhmkOkjFS3MHnSlP+Kz55Fdvg4b8Dm
 Tkaw==
X-Gm-Message-State: AFq9FYIYwyYiyKRMy1oLOltvLN5vEKYekDWIManpZ4Z290W2vdAeYa4c
 IZymWC9GNBdH5u7sP9RxtkgjiURBcP3bjA2tJMakXLiVwHrxYpz9aPG6duZIRMYXtRtmQYi2Rfa
 FgudB7Xlk7nw+tLOdvTPijsNmXa+8UgOD/GfGcwDieqDJjamRchLgvUuWqA==
X-Gm-Gg: AYBFou3B/Ji0N5ka6ps6WtfiOLm2KKyTUAhyXFEMxDCx8HKYHafWnaMCFgUfQIjcIUc
 162TDLMSsJ4InTGZSd//cWyVQl5jJtP1IZjezQF1pvVU+d60fb+HOLiACY9jXivoaKOKTmKjBc8
 +7sYMViKdFi2e3TXG11qqqrOsDTLMV5KJOrYuN4phzN6nNcA5xEegkKTc5VnaxDUVqpzYjh+VPH
 0uc4n8XejctXtwtLdl+8vphe84iG7buPhgwrTQB+FvHEmK+S8FWrQK2Yn1GgTKERQkG6T2UYuQf
 NUTQj6jUj1fQ9vNL9Jh+NDaO3SDkp7NrU1CD63xxyPq0q+qj4aZZuJ0Tzta9ql4CAS6BtAf1QvK
 2/vz1y/9TSjmJBfMvcKmDuGRZdHDr9U7kS6Ps5jtFhmtkq45ETCq5mkPQKz5THs3SiWnozoQKRd
 akTjA0MFXqCA==
X-Received: by 2002:ad4:5cad:0:b0:91b:8724:8a28 with SMTP id
 6a1803df08f44-91c7d1b1484mr91387116d6.34.1793296144016; 
 Thu, 29 Oct 2026 10:49:04 -0700 (PDT)
X-Received: by 2002:ad4:5cad:0:b0:91b:8724:8a28 with SMTP id
 6a1803df08f44-91c7d1b1484mr91386786d6.34.1793296143424; 
 Thu, 29 Oct 2026 10:49:03 -0700 (PDT)
Received: from [192.168.68.103] ([152.234.122.251])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ca2fb5c9bsm2293746d6.4.2026.10.29.10.49.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 10:49:02 -0700 (PDT)
Message-ID: <54728202-684c-4559-a3f6-8e2d6594342a@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 14:49:00 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] target/riscv: Honor Zama16b for halfword AMOs
To: GavinQin <qinzhengxiang@foxmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com
References: <tencent_7F0BF077B0C2A71AE38EA05BC3F112773207@qq.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <tencent_7F0BF077B0C2A71AE38EA05BC3F112773207@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PF5O-QB-M8x7fiLbLHsgnI_VGCHp3SF1
X-Proofpoint-ORIG-GUID: PF5O-QB-M8x7fiLbLHsgnI_VGCHp3SF1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2OSBTYWx0ZWRfX9CDj9fC6H15c
 9MKW1dmhxzhWwJEcBUH87O+VzlTuZQwJ67ok9oM/HDhRTYoA/OTwnRUKlffKRIKsihRgtbL9+xD
 BilcIAVvcDjp1Z+JO0tyMAWm6UUm07U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2OSBTYWx0ZWRfX63ztIEoSX5+z
 epclPKZtBNMGugWcECTHFJhtQOYDU4xacQYaS9jLqVYTA68tdIo2PUvjaPjub96xIRhuiksO/qW
 VelMVdeEfnhrZEfGM2icf5nzVzx5kxWKDZMf8MrfEy7k8jB5sj/jnCooevVmcCsRj84DRZ6ObrD
 a0M6ZGBCb2dCrs39yQ5BsEBTSbCVEXxATVwqpi1C+IcTxbfNlJwUCgYEOnTgncSs45F7ZH4mYW0
 FwG/iz50t6bEOa01A4TLrxwIWwBhrqBnq/+LcMyjlgsG7jBbJKwB7Hw92xY+FNwbnb/iFOXkfXa
 GZVTHTLYClfk4e8UoV4SP4KbaLIPxuUPRUz2iREIeQeKSPtIOdqrPTC+LDOXI6rOXkiz9RqMR47
 Ji1OodlqK40nMoB0MaQ/oiqqFGRjcA==
X-Authority-Analysis: v=2.4 cv=NPtAaE6g c=1 sm=1 tr=0 ts=6ae38710 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=QOY8BskYDu05dfarAz2gNQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bDN84i_9AAAA:8 a=EUspDBNiAAAA:8 a=bbsZSauHe3uP5S6po8IA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=J2PsDwZO0S0EpbpLmD-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 suspectscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290069
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/24/2026 9:02 AM, GavinQin wrote:
> gen_amo() only applies the Zama16b atomicity requirement to accesses
> of at least 32 bits. Halfword AMOs therefore retain MO_ALIGN and
> raise an address-misaligned exception even when the access is
> contained within a naturally aligned 16-byte granule.
> 
> Include halfword accesses in the existing Zama16b handling.
> 
> Signed-off-by: GavinQin <qinzhengxiang@foxmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/tcg/translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/tcg/translate.c b/target/riscv/tcg/translate.c
> index ede9c2563f..70c1088338 100644
> --- a/target/riscv/tcg/translate.c
> +++ b/target/riscv/tcg/translate.c
> @@ -1159,7 +1159,7 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
>       MemOp size = mop & MO_SIZE;
>   
>       mop |= ctx->mo_endianness;
> -    if (ctx->cfg_ptr->ext_zama16b && size >= MO_32) {
> +    if (ctx->cfg_ptr->ext_zama16b && size >= MO_16) {
>           mop |= MO_ATOM_WITHIN16;
>       } else {
>           mop |= MO_ALIGN;


