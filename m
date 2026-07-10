Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72E9C44506
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 21:52:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiJ7n-0006dY-N5; Fri, 10 Jul 2026 17:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJ7g-0006Io-Mg
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 17:51:06 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJ7e-0005oc-Gr
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 17:51:03 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AK3iYT1846459
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 21:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 84ec3fgK8/jEOWef5W0keF0/v+uLogAqU/+LIXNJukw=; b=S4XPX8VzBX9R0xuY
 f5g4wA6OIz1RhRLIsua69rgautEsTdLjTQNN19tZPU/12Dsq57JnLTL0Eu/lvEBC
 FDHppkkidzKYxSHQZMvh7htUXOMySmftwZFQO9x8V7UzMTIw8q4Mw+eUJyS8qYiC
 5yiheq1teeRnSzfOuhsqv4rYVyWjaBy1cJPF8ydCXHU6Klp3xkVOCqFsTVM8w8zs
 Qhkvn5cXffHnb8fY/svjAbK4meH9CsxAK6oBDqNuB2tJgRodLlVjfgU2I8/SabVb
 blcn5MQwPK9ma++nP0mh4m6obQBxbtarWdqjgLAJwACmc38cYOkk14xkJaTM6zbl
 PlmuNQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb649rjxd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 21:50:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c19493ac2so15074901cf.1
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 14:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783720251; x=1784325051; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=84ec3fgK8/jEOWef5W0keF0/v+uLogAqU/+LIXNJukw=;
 b=E4B4gqodDOppf+FLfD4JJcZCSs1+nPenvLYu/I3V0Qjl8xkO744iuP7ayouegs8tma
 F4C6tZIF9VNoL9OvHmMkHnmOg1HxKWMhcD9hK27skDobbDpsp/zPdSk4ktqISuCIKCjr
 k3SIHLmkt1Bo17ychBUMUphy8zsgcSZu1WXCCMRpKpB1OiiBsqF8q20hbHF15WYyy2sJ
 8MxZpfn1qyoHYnZ4cZEbK0nVYEp4/bDMNMq1GddJfbzj8E8BFniNBZzxPIhiLr5A3pLS
 mcesMb2TGNmsy++JAG/C+ehSxtUH7LrdIfagBTuAkiONmk+SqyyxddQdclVbMZburILP
 QPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783720251; x=1784325051;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=84ec3fgK8/jEOWef5W0keF0/v+uLogAqU/+LIXNJukw=;
 b=WG8ONFQkyF0xyNhtDeNfG2bkHBLBMGcJFtIjHls+8rQRvnpoEk6xLzpBl8c5tOyfUx
 I52sK0HCZ+cBu6SOYFKNzdoecDECn3xiFgsRL3CmveOIcvt/K0vl+LnGdfNYlBA5WKHF
 3WNWhdbUHb8XoYZ9SjDl9NiNLGXz+Vl2+dhuRFHbgVPFArftUJ/euk8jBqM02AOrJLeQ
 vGis3iMEN7dglH1jTSvOmhoQJ1qQ3qEHYklOpIRAyy6trmnPuWskYPnPpmvJ44VF7ci7
 4JB3hjlK3fejEVnUv9sXKbGgIlERpLX1cEu15AJtoQJ1PXg67ejm7+lgrw1mKMiNsqAv
 MYZQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoodCrCYM8mvEwR0ESZOQdjtUSpqcWS24m+96AJS0zZNti+R3K3CoeBlEhEL2h0SWBSHLE8lupnJmcs@nongnu.org
X-Gm-Message-State: AOJu0Yx7gdrOJEJ5c0G5Ci6jWmUmgXebktE0rYHlM34eEKlsrkX8Tpin
 9qmPGH5D5ASb+uqjd8uXlyAOFP9f3PTp2Z4eF6MxQppbMnVdujB+kIuU8O4poVZLiuzcD5ypm4Z
 8qiPlYSupo4Zzfo+xuf6c6awzfWgEbpqnLxRq154G3loD8VcmjKKrdSTymA==
X-Gm-Gg: AfdE7cnxUtBy3ODHthPNnM9zoyJqzXTpPrF8Ufmodx6N9o4g8SBlZM9JvkY2XBmd96v
 q/056/afONfWkiChCTmbn2gKRSmr3GDehEjAxSaJ4xYA6aR4F1h+MPuRr9oGecAFtKR0JyWjcol
 +tdIBeeZPDfI3lxHQbTHbeuOK0GWlpb1kvWmEGszgssdKd5gM5K3KK1ZgX7c33CKcjMj3+f6A6L
 1tqkcOi0kfnKQINZmwY8dVRmMVzeFNPXBdCDPNRfdN7ILftLCQ1v+fzvWDuD2CCYSiuAIfq53Y7
 QpWBCsaHTr7xbJm3PMW2lzUwsMwrapD/0AFi5LrzgcM6enqFflHha77BBlclBx61RQ9GqPmmp/j
 H+Ap5R2/TzMBlXb8OW1TkHU8ZbYrKxAvzinvT/8ZpFlUnbKZwOGVwgFvA6dH6eQ==
X-Received: by 2002:a05:622a:1b27:b0:51c:168d:3ae0 with SMTP id
 d75a77b69052e-51cbf07129dmr7848431cf.1.1783720250917; 
 Fri, 10 Jul 2026 14:50:50 -0700 (PDT)
X-Received: by 2002:a05:622a:1b27:b0:51c:168d:3ae0 with SMTP id
 d75a77b69052e-51cbf07129dmr7846281cf.1.1783720245684; 
 Fri, 10 Jul 2026 14:50:45 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039af67sm71706636f8f.17.2026.07.10.14.50.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 14:50:44 -0700 (PDT)
Message-ID: <7eec8cbc-e5db-4ad6-95e5-27d208298a6d@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 23:50:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/51] target/xtensa: Use bp argument in
 xtensa_debug_check_breakpoint
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MB6iB0uLIAQp-U0zifKKnFJKJddBEDLC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIxOSBTYWx0ZWRfX41Wk/K+Mioxr
 zicwU755z5Uci0c7ZfO3inIKg7clfR8n5hvINKZuSX8499a9kSb8ra//UAf8sgKgSNFb6Gt9XJv
 P2ESKB9FLDik/ERXIn8sqOA5o5P9m2PU4XLzG7JjPa2/q0SjEvYo/XzyP4r4JtYKCPu0CX9bNbZ
 Ys/rSakA3qv6uJg9GLSv1/9NBuce4nP9u58X+LEPlwXhD1W0gXbYTGouh9uL9BdoCOlTcPXCV67
 pbxeBHGiEQ5jDZDU8vf5YTh1panc1tSPyGfxyP/OQojR7D/fhdTMZ+nqfqlXV9qz/+8U6gCTsDp
 MSlxq53k865Ypoqnd83ehI2XPHlD7oCPQ9+dpAz3Jb85KkHezx9EGfGdcZP3RjXCVVWbFjaQUe7
 7Y+2Qq4k04RSnxhWwD9b6mDKyePEJRm2QZZ74j/YhGggjwntrArTjc0vbh0G/GLb3CwqlBSm+dx
 CUz5+XqWDHSpN7USvvw==
X-Proofpoint-GUID: MB6iB0uLIAQp-U0zifKKnFJKJddBEDLC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIxOSBTYWx0ZWRfX64Xf/Q0G0+9N
 G9BxypNJah8iu90byAcCE8lR0JsF2MY/txQ6J8EbgPlwu6zOnj+t9e2wWj1WQG7AH9nr1Y71NSM
 YPfiyKMHg7Z/2zHBMCCAOwKfjqh6zkM=
X-Authority-Analysis: v=2.4 cv=VZfH+lp9 c=1 sm=1 tr=0 ts=6a51693b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=8iTtmLh_eV7-T8uE9KsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100219
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 10/7/26 22:53, Richard Henderson wrote:
> Use the ID of the breakpoint instead of a loop over all.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/xtensa/dbg_helper.c | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/target/xtensa/dbg_helper.c b/target/xtensa/dbg_helper.c
> index 557a7852c8..b08bd03435 100644
> --- a/target/xtensa/dbg_helper.c
> +++ b/target/xtensa/dbg_helper.c
> @@ -67,18 +67,11 @@ void HELPER(wsr_ibreaka)(CPUXtensaState *env, uint32_t i, uint32_t v)
>   bool xtensa_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp)
>   {
>       CPUXtensaState *env = cpu_env(cs);
> -    unsigned int i;
>   
>       if (xtensa_get_cintlevel(env) >= env->config->debug_level) {
>           return false;
>       }
> -    for (i = 0; i < env->config->nibreak; ++i) {
> -        if (env->sregs[IBREAKENABLE] & (1 << i) &&
> -            env->sregs[IBREAKA + i] == env->pc) {
> -            return true;
> -        }
> -    }
> -    return false;
> +    return (env->sregs[IBREAKENABLE] >> bp->id) & 1;

or

        return extract32(env->sregs[IBREAKENABLE], bp->id, 1);

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

>   }
>   
>   static void set_dbreak(CPUXtensaState *env, unsigned i, uint32_t dbreaka,


