Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D963CA5FFF
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 10:25:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xEOq7-0003iG-Gy; Wed, 07 Oct 2026 06:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEOq0-0003gs-Ir
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 06:25:29 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEOpk-0006MH-Kj
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 06:25:14 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6977jnQ92711452
 for <qemu-riscv@nongnu.org>; Wed, 7 Oct 2026 10:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VjhEdA9OzuCbz558+ILXGSYykxzlicBuYRhUlO5AT78=; b=O7eFjA0rWCMNXVJ5
 lPvxstwp2zTxDX5edaMPgtsrwTjY7aSKMo22a08qadZzA00HRP+jo5ETZ9VJ/6gp
 lO5upg6l5vKD5B/PgEhOu1D5B4AuiMPoYlYdWI0dTI1tqO/kczAtmwoHtIq8wYqa
 kS52svwgc6oM19nn4BRUjsyEh0cNAl+TD6VtlDhdiC/cjZXX7GEANxsO94mab31A
 BTECFqRLuWy2n5ceM7gn7XGI4HyXAgz/tju1qn672aQk0D6Wv56Mpej7elN47GtW
 aORA3LTNaO16UBRQOzFRmKhUv7uEeateIFAGiim5efbC37XWUNZ3movbLi3YgW2w
 eTxfCA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s1p5p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 10:25:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-9104eedb5b0so113761026d6.0
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 03:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791368710; x=1791973510; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=VjhEdA9OzuCbz558+ILXGSYykxzlicBuYRhUlO5AT78=;
 b=Qr1yHNLPonwxRdX1Y8eJpyUVTbmNNgQMNQR6fq7392NFzKYmjZO/moXLYaKtWrOMCT
 ptuNXRLqxHUNJCphsR1SCHuO7RcVbry1u4gM+e/Rrx8BwjLzT2SVLySDw5ERIjipP9eC
 qr86mHwRLN3HZMf01HFqzMj5JUCMn4Bubu7WZ2uFr0vVVrV5fBSy1LSRc8MaMVKoCX/c
 SugfpeJADo+tn4XkcO+JyUmYrHan14JcbDFLl5XoqId7K5xQzfpxjhnZQMHahNhfTF5k
 fT3+PBQB6w3o/7Y9SPTOVtkJaZU1mMlgTkwmMOKZWLi9H2DIdp4jDujvxK7H3ygK0WH0
 wQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791368710; x=1791973510;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VjhEdA9OzuCbz558+ILXGSYykxzlicBuYRhUlO5AT78=;
 b=WRYuuhtnWTs4f8/PO1FsrvYHf8d5ns7NlBYTMbciQPkCs3DXksjBEAR/QImyCHgigB
 5Igm1Je0lFGpGRuiL+Dmzth2mhbOjUn2V7ttV1MMBANa8YZZwOqUr3QDutOzLL12QqEh
 h/1goifF3ztxaGL+plCdlnY2BLOBL9V0YWZRn6YABUH0wfDlzuMCXuM6udMyCMWni+6V
 g/ziVasXaHv780LpfWYlD3RCBkSxhdf2vyDZYW+lEVsIZwDeWv+KsPGx5J5Zkx240+xF
 ZYIjbt/1pniPASKnm9TMiftK04x8bliF9TrRDg4Utr4Q2wBZKtPTbMSQCoTcZNsgm3Fi
 fjsg==
X-Gm-Message-State: AFuF++k6fNobyK6fjYD3IWLKOs9s1fUr8C8HzkkysOaIkDsIgZkY5+2M
 8mzOqQdsJkBP8uMyD0CaqnNMBf8IL2vt0Z6r8CU4WwRv+zBld60OmEasiTB92CaHLebVbCTswax
 5yVeSipN5FR2kbjUTxiGukSeW0e74r1v1C1aLRELnS2VPvoOR1vv6HyR+uQ==
X-Gm-Gg: AYBFou3TRHPtcTfVufjJdyDgisUaUFrWv64oPfoa08q4ZXcLKdD4uNT1od+9qKaLNcF
 Yt7Do7xq14ob3piVyrvmSeAxSs1fTTGdLtXOLAzibuHfjT6qdDaMxfMaXd2BPeTYkb2dSonUKWp
 pUsjAfapVfO0sN3TB2JJe7txA2PjeRVdkdyBM2KTLdRLXhaOze4TOVYjZfYivjonlVSMjDc7bkR
 w7g98g66xjLhSuFPHLHTk0TQ2ibS7qFLR4bMiWzzA/Xx4F5mlGoYdHNe8HG/IVxFy8yZ3W6yarh
 4CpP6Xmc7sxjYAublWpmEx6MyRBL1eMp8rhvvDKtifNJANZnrCfzyVL3W1HlXHrFmIdBHz2vAiF
 zXOpYkOHbBpOs42Qch0AJlqs6j0WHZBp9pQ==
X-Received: by 2002:a05:620a:4090:b0:939:6dea:4f1b with SMTP id
 af79cd13be357-93e9b808128mr293505885a.49.1791368709681; 
 Wed, 07 Oct 2026 03:25:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4090:b0:939:6dea:4f1b with SMTP id
 af79cd13be357-93e9b808128mr293501385a.49.1791368709043; 
 Wed, 07 Oct 2026 03:25:09 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c71d1f8fbsm4303513f8f.33.2026.10.07.03.25.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 03:25:08 -0700 (PDT)
Message-ID: <17cb7c7c-5f22-4a03-8855-4d1ec91d347a@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 12:25:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/18] target/riscv: Compile pmp.c once
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 pierrick.bouvier@oss.qualcomm.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, luoyonggang@gmail.com
References: <20261007-rv-dedup-v2-0-8a2f0f296a7f@rev.ng>
 <20261007-rv-dedup-v2-14-8a2f0f296a7f@rev.ng>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261007-rv-dedup-v2-14-8a2f0f296a7f@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 31gAcr0pAVzDS0Wmg51Ae-6Y48PRD_7B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfXyKfaxEtWNoeK
 ew206XtcScKKlA2xpi0+URMCyfXhAljo5fCKH4J6EYrcyltpXm9vCS4e4ywFLeXJ6uUZWAWeOk/
 kprOMEcGZm69K6j+yfBskEPudu0jQ0P1+ZAQw166Gt4Kn6YZU8Z9i+O6qW5arFVsJy0VTvBnuXK
 5IoKKExeI1pf66+EMe5PwqiczKm+Zu2190Dd7Dvb5OtLo9yEBtDNCmlUSeuMFGFvYtiNUBEcK5Z
 l5jJ7g4bQ45wUhbtKxn0zc5yt0E9FxM9SNUwG7y1jj1ozkdRMgNh7SgYM1TRE1rgCpi7gtKH6V6
 5D842EW57P9sm53yC4bv7CWXNLBVt3HqQbt6NowGL0GPjipLm1YCi7Ef/iU5QNz/HBJoicHBaRB
 wYyV7NJx29jLHixxIGcXs/aOQE2OTXbYK7Pd35L7JScHtnWp8n9qvtCPHeIol+bhDOJMYaxWbIs
 KI0mjzRIEHZCfJVm1oA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX9JzVways+TOc
 Si/ZzBkZI4AYy/482G44NwF2iauA7BjAn8FB2RAZNPDVild3bNJd3X7WJAfPCdGIWEvmt4hAfA2
 sBLZoQl9xpdJ0fTLqih5ASK7+29fgcs=
X-Proofpoint-GUID: 31gAcr0pAVzDS0Wmg51Ae-6Y48PRD_7B
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac61e06 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_LGBUc0nY78mWi6BnIYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070041
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 7/10/26 10:43, Anton Johansson wrote:
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>   target/riscv/tcg/pmp.c       | 5 +++--
>   target/riscv/tcg/meson.build | 2 +-
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/tcg/pmp.c b/target/riscv/tcg/pmp.c
> index 99345d63dc..2d7194de10 100644
> --- a/target/riscv/tcg/pmp.c
> +++ b/target/riscv/tcg/pmp.c
> @@ -638,19 +638,20 @@ uint64_t pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index)
>       if (addr_index < pmp_regions) {
>           val = env->pmp_state.pmp[addr_index].addr_reg;
>           int g = pmp_get_granularity_g(env);
> +        const unsigned long_bits = target_long_bits();

We need to fetch this information from @env. Maybe riscv_cpu_mxl_bits()?
>           switch (pmp_get_a_field(env->pmp_state.pmp[addr_index].cfg_reg)) {
>           case PMP_AMATCH_OFF:
>               /* fallthrough */
>           case PMP_AMATCH_TOR:
>               /* Bit [g-1:0] read all zero */
> -            if (g >= 1 && g < TARGET_LONG_BITS) {
> +            if (g >= 1 && g < long_bits) {
>                   uint64_t granule = 1ULL << g;
>                   val = ROUND_DOWN(val, granule);
>               }
>               break;
>           case PMP_AMATCH_NAPOT:
>               /* Bit [g-2:0] read all one */
> -            if (g >= 2 && g < TARGET_LONG_BITS) {
> +            if (g >= 2 && g < long_bits) {
>                   val = deposit64(val, 0, g - 1, -1ULL);
>               }
>               break;


