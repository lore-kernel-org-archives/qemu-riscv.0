Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735B3CA5FFC
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 13:26:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xERfJ-0001dh-GI; Wed, 07 Oct 2026 09:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xERfG-0001cs-3G
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 09:26:34 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xERfC-0001lq-Pt
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 09:26:32 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 697DJSTd4056328
 for <qemu-riscv@nongnu.org>; Wed, 7 Oct 2026 13:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cHlk/u6Bu4e+cSEV+iEtuX9GoOkXp1n0O580VXi6hVA=; b=K5Ul4iRB1Ul6InK4
 FeC+RF6nbg4J0MxV9QjVVtM/rv1getLrmTvB4JXjQ/GncRgjJe3Jf8/SuNVCR3WL
 WogDErsBHMRv1VGxDd+7xOBMPuuuIVZOP9oRPoZlgOoIDn9SRoihtKxTGa3oXmk1
 b9mvc92o2q81/aBZHJOSH2UGVtnQw7smzl23DOenJQlg0LR5xUYdtGmUSgf6RyaH
 5JglePW4tDNcgxCK4Bc29S//QzH5X416aYlXw8WXnvrqgiAU/SaBvFSQ5KSX8rKt
 2aZI6YlpDUS5Ym/F+xIdvJbvo9M5qmBmYx8YxGDLEetHpXVg6Ai1tPJF7WrOhSRM
 s0Fn4w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5pv700v1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 13:26:28 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-98087b0c5deso2936971241.2
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 06:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791379587; x=1791984387; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=cHlk/u6Bu4e+cSEV+iEtuX9GoOkXp1n0O580VXi6hVA=;
 b=iOYlPqtwcPDeDPLMDxCetBJJLoPAtCI4IfrFdHqqUBcEw3TzmMy4NN2/hlJIUHAkW7
 7fmPbST2U06wwUBBvXysJfGRXGf2kT6tZpcKW7TCRoRQkGTR3q1EuBp82CjiBb4eZXya
 mjcWv1Qx1M5iGMliMIs7Ix/8njbwxXisFiYtVNGGjun5c+G6TgipKzlYRifyRycVXNeX
 CNEP2cEr4XTwD2A+UTl6mRuJV5lFRdAFk2fEfhmTDhO/gYabHz/dQ29jSbBumcRd3L/J
 vukG9/cEe1NWQZ4d1/i9dKup1WcokaZRN/z0s46KaaPfGCM+rNh0QdZuT6PH7FEloRvA
 J8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791379587; x=1791984387;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cHlk/u6Bu4e+cSEV+iEtuX9GoOkXp1n0O580VXi6hVA=;
 b=PseATUhk/fMmBAx8FagLcuHcMjiEJO0N1Jl28aGViV/XMv5N3Qx44VHHcYLjR9k3bm
 tRndWYEx76VQpzlN/5Ne7p8wrwlFODN9ewVyV5feryl3tjhZfGR2lZ+A0HuHc5Fw4ZIM
 KWTO4ROig4wk23g6xwFWktVS5b2OJnDBVk1WnHWtIAqAdd3iNb6gTQxhcLDwDQAfxT89
 MQc/vKMiifRF/UeVYYMywsC0KAgtmUlUoHDkBTLm5Qz8emn+WvVOuDZgZ0ysEGisNJUn
 a+qfkT1beQdUOqShyFQQyYdj60yNacpCuZJLmylY6tvA+H/jeGupXHEaUsfAt6fz/G/w
 zKLA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxlO+ODrly0/NQumeZK2Xa/8a2UqbLoQMxSF1lxS89sUUP9KNhq0hcBlA80qPoLtKDGRRfU1K5s1o2o@nongnu.org
X-Gm-Message-State: AFq9FYIMSWBo8BnYew8JUv10ylBRHrh0HaPJFh/xUEwMknVA4Oxoj0mH
 RgMPuzBNVumI0jQEheRN6PE7kuu65l3CQwaGgN/tw9V6QSUAyLGQ7l5LK9SOgV7G7rqn4UMri57
 bqnyhcFptyTnzVs91vN9gVcw+isGCQ7F8UTj6H7nNPGYCiA6VPYwMPDIZMg==
X-Gm-Gg: AYBFou1iB8niZb2b5XPsOZaohgVbdMVQCIrjquB/Uk5tE1PxXQsX8WIFhv3DKtjQG1C
 0AkHQK4g3EyjeQMWbgi3Yh000y1p/n0OBEYc05fKygaLMGKg3XRNsUeiVjm6ReVe4M1za+vI1vf
 sYTB5INqonk1vcYU1UIyUZ3r5pi4fGm13yrN49qYa1Y/U2tjQmlB39DqhpdqJ4+5TXf+uTboYx7
 fvTGlsg5emhBLLeti2CcY5uh36ZfNunfHH/bCeXLyKSHF0CWQ5g6NwBO+LRwb9r7GmqVECOdclS
 c+Jt0vBvjYt144BOtI0J9Ho+x8kevj6yFKhy0V1riUj/tPnmAFenPR9rSYv8AMa3uohbVL2HzW1
 By7JSjLSCGHBYLOhl7tTpfgv0C1AW3f70Jg==
X-Received: by 2002:a05:6102:5809:b0:7bf:6218:bc59 with SMTP id
 ada2fe7eead31-7ca38e2032amr728346137.32.1791379587468; 
 Wed, 07 Oct 2026 06:26:27 -0700 (PDT)
X-Received: by 2002:a05:6102:5809:b0:7bf:6218:bc59 with SMTP id
 ada2fe7eead31-7ca38e2032amr728321137.32.1791379586988; 
 Wed, 07 Oct 2026 06:26:26 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c71d1ffd2sm5375821f8f.34.2026.10.07.06.26.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 06:26:26 -0700 (PDT)
Message-ID: <9bf8945c-6472-462e-a275-f0b74912d3ed@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 15:26:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/18] target/riscv: Compile pmp.c once
Content-Language: en-US
To: luoyonggang@gmail.com
Cc: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 pierrick.bouvier@oss.qualcomm.com, palmer@dabbelt.com,
 alistair.francis@wdc.com
References: <20261007-rv-dedup-v2-0-8a2f0f296a7f@rev.ng>
 <20261007-rv-dedup-v2-14-8a2f0f296a7f@rev.ng>
 <17cb7c7c-5f22-4a03-8855-4d1ec91d347a@oss.qualcomm.com>
 <CAE2XoE9eXXKQGZZ0kvmex88+tjch1-+H_-MgB6JEu+4bdPZq8g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <CAE2XoE9eXXKQGZZ0kvmex88+tjch1-+H_-MgB6JEu+4bdPZq8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1MiBTYWx0ZWRfX99w+PQdf9iQ0
 LjXmngLf2njHbcAzUCTn7zv/AOlkF2qah6a1W/6FIO6KsU9OEbEkAIk3TGdH8SAJ3jw2muWgmPo
 5COTE7h/yRlPYeRNmaMlFCaM/NBLXIQ=
X-Authority-Analysis: v=2.4 cv=J4I/fwnS c=1 sm=1 tr=0 ts=6ac64884 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e__1z2AJ6xUVmuhKiqgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: bCHPMlWKtM8GeWO73NMrMHJdSAi4kRmQ
X-Proofpoint-GUID: bCHPMlWKtM8GeWO73NMrMHJdSAi4kRmQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1MiBTYWx0ZWRfX31K/qzfVuWHm
 crYAFHLakWGAtELqjjwBxKWs0YSqUynMFLkKRYHwPg2i1tw67v3daeZ93XS8T39Oph1hDb6J1Vu
 TaKdjfesqlND/eElJDMe6arllOORMRFAJ7Pm75A+jA+3iiM6nkMfGf38TX7PhGkVHx4b06GAErZ
 SlWIVotaJZ5Wf+NSAX9FwGWQKuJ4Q2HY9k1GHWhdZ9cxns3cOmCU3cu8GGTG9PTTSGKb9ytTRAM
 fC2EfdxVSA4tQSOCu3hnqjMeK1ZRyj9WK4vLuBBomaL7w6pe3pNwbTIg3Id+ia4fZwy4kHsj6Bv
 wTxnP4/DDITZnTbxxg0XX2wguYyn8zKAw15fIydCxiXOqMTJjj2M4BclINMEOVImI6lwwpzSxGt
 M4e+M3a5kPELmjC/6U7TTlEyfnqXKC/0UxpgQfRnGKMTN4Ci1KBA2SxPSweYXxLDM4Mj2e6uMZw
 iArzrD7C3QB48q+8Ycg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070052
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

On 7/10/26 13:51, Yonggang Luo wrote:
> On Wed, Oct 7, 2026 at 6:25 PM Philippe Mathieu-Daudé
> <philmd@oss.qualcomm.com> wrote:
>>
>> On 7/10/26 10:43, Anton Johansson wrote:
>>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>>> Signed-off-by: Anton Johansson <anjo@rev.ng>
>>> ---
>>>    target/riscv/tcg/pmp.c       | 5 +++--
>>>    target/riscv/tcg/meson.build | 2 +-
>>>    2 files changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/target/riscv/tcg/pmp.c b/target/riscv/tcg/pmp.c
>>> index 99345d63dc..2d7194de10 100644
>>> --- a/target/riscv/tcg/pmp.c
>>> +++ b/target/riscv/tcg/pmp.c
>>> @@ -638,19 +638,20 @@ uint64_t pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index)
>>>        if (addr_index < pmp_regions) {
>>>            val = env->pmp_state.pmp[addr_index].addr_reg;
>>>            int g = pmp_get_granularity_g(env);
>>> +        const unsigned long_bits = target_long_bits();
>>
>> We need to fetch this information from @env. Maybe riscv_cpu_mxl_bits()?
> 
> discussed before, there is possible be 128bits

Please point me to the discussion (directly, saving us a ping / pong),
as:

   '''
   This was already discussed on v42:

   https://lore.kernel.org/qemu-devel/some-message-id-v42-20128438/
   '''

Having the discussion decision resumed in the patch description will
prevent further reviewers to ask again the same.

What do you mean by "possible be 128bits"? If we want to cap the
value we can use MIN(64, riscv_cpu_mxl_bits(env)).

> 
>>>            switch (pmp_get_a_field(env->pmp_state.pmp[addr_index].cfg_reg)) {
>>>            case PMP_AMATCH_OFF:
>>>                /* fallthrough */
>>>            case PMP_AMATCH_TOR:
>>>                /* Bit [g-1:0] read all zero */
>>> -            if (g >= 1 && g < TARGET_LONG_BITS) {
>>> +            if (g >= 1 && g < long_bits) {
>>>                    uint64_t granule = 1ULL << g;
>>>                    val = ROUND_DOWN(val, granule);
>>>                }
>>>                break;
>>>            case PMP_AMATCH_NAPOT:
>>>                /* Bit [g-2:0] read all one */
>>> -            if (g >= 2 && g < TARGET_LONG_BITS) {
>>> +            if (g >= 2 && g < long_bits) {
>>>                    val = deposit64(val, 0, g - 1, -1ULL);
>>>                }
>>>                break;
>>
> 
> 


