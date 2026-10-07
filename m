Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B00ECA5FF1
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 14:01:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xESCV-0001XP-R5; Wed, 07 Oct 2026 10:01:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xES6L-0007zp-Hk
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 09:54:40 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xES6I-0004iW-EV
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 09:54:32 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 697BV0WO2969244
 for <qemu-riscv@nongnu.org>; Wed, 7 Oct 2026 13:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Tui9mTR8NgPOLvD11h9XTRIV1yLOkV7DqpwpfF8ODiE=; b=ckK9hYqIp4hkN81S
 BhyW+tkd6erHrwBHiG3gq86822uYfQrLRJs+rSLU4iCgLwMm/RVOBkQssxHXYQg4
 5sIva76avqB2cwPWoX7Y4NbrjUGCPDVGV0Kc6yfep/Y2zLYKQDeELmTJ2yhkY1xA
 YewQC5HVyVt+v4KaqTdn7ZToya9dC0/YNpWQSaUTicBCHhEgcuRugktSLFSUOpuJ
 JydciyRQkq6ACj021czxpOi8vIwknXujt9JkLuESiytaQMLALiOLG6DBQbh+bjJi
 XsyWhzfX4iWSTjwt3KvXM6ZhaJDfbNFIdEi2Oj6IWFCS5NqF/afKRNEoxIvHzG5G
 CDqkpw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c6u2dy9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 13:54:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93c5ab5c136so674555285a.3
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 06:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791381266; x=1791986066; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Tui9mTR8NgPOLvD11h9XTRIV1yLOkV7DqpwpfF8ODiE=;
 b=Ke7Xbqin4/UVdMkpoXWZJFJobpkyJ2JqfVJbDp4sc17jEAT5jaRshTOEvvF3Fcj1o/
 ar58MX+FIBuwMQ8Qt/HBwUSjK+5l/Flz0g8hfsB/t7k4eS3nVUdm8pOUsiSaefx1U4tq
 8BnsQWT7YmCnBJrUo8CvQIWUzzeBz+c8DhiFUy7xQmUsHKDzfqYX3wSRyncLNg0rsWxV
 oR7dHR1tmwoPhtNj93UiAd6x1AckJrxCJz5oMiqa8mZdFTX5gsVqcnbP3DjF3W971DJz
 7GG+N8hqMARlPWlE3bk3RXqe4RVPyss5OQGSbvFg+dZQmZdh/R0Lwmlaceg8FM3DDR69
 yzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791381266; x=1791986066;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Tui9mTR8NgPOLvD11h9XTRIV1yLOkV7DqpwpfF8ODiE=;
 b=gnh5n5j0Edu4eUnA6TMGqKpAKIG/vJdc4VSvA3b1ZbgoGmwSJoBkORY6fjlzJA6Qss
 WDqNLMQ8nvHqelAJSAkafnY4R7P4f3DgcmfBIS7ygsjlnUfxf+ucSPg2I0wtuv/+umPb
 G1i2SBYOpHVlYIdwdoR96ngs1RQOX7sTqMIyJ4msMUbX6pHoFhTFAq6gmbgHBeR5zFt0
 jceU/sfANKxjgK3at0kc4rMYuK9ph0ST0taRfmEDOrDxHpDAvOxQphzn77EJSkhaY0UR
 N8loUtRTc2BRVPOwbzY9g9x9Fclp7CRlD5c7pXOLN7hpGjvN1n7FsoWrwF0DzVBhUnYj
 vsfQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxrkIOFOalcIAoGI1YpHLcVbHh6kdef8F8nRQgYa3kzwZCMewtAlsSFt0yzZSuJ5FJwuhsQER2eMMPR@nongnu.org
X-Gm-Message-State: AFuF++mX6/N4LknSr3j3qWc0WxAb3F5RvhmbOP8aTMAJJ/LlzC5zyEx2
 qMXm4BOp4CDq6BdpYZIM+ftklKnS+rKFx/6r5XZWalhvaac4dn7831o/5YlrlfYxKWcV/dZgsLo
 CqKp7MVfcy6RPTFNE8Xb7feJ/w9/hnlO6bIDbE3BtSaI9UCZL0XO+uagVfw==
X-Gm-Gg: AYBFou3OLu08g+Go2OOpDVW2hbYJE30V9GpoJiSqz58bez6PO3eZbquIGa6Fxuvjt6y
 QmA4wvscXXBd1NJ6PplWfDFbB61+61B/JlBKH8Eb1O+oDrf5HkAu9XKqL134FC5nQlVlg5oKf0g
 5GPD0yKDWw51huEL71Ag5xo6aMxtpmsvhFwRl1sjETTk1Z3qJIBAjaNAuUJtSokc0KUVKo4fJCI
 WgQqUQ6+WZP+xP54b1DXPtru6JFfev/APOiW4LQHptU1zf+OfjnrO1iw97VBnsnemKTjOUarPVK
 s7DQuxQARi+VgYcUDbqeHgGsPClGJMBGnZQ8nGXk3tlMpuZ1sL1VLwwssigSBABPKV7D6EuzRvr
 /gPmj+P+VYwl4ETVUzHppz49QCkA6dT4McA==
X-Received: by 2002:a05:620a:618e:b0:93e:9808:8d73 with SMTP id
 af79cd13be357-93e9b87f19bmr419572785a.77.1791381265440; 
 Wed, 07 Oct 2026 06:54:25 -0700 (PDT)
X-Received: by 2002:a05:620a:618e:b0:93e:9808:8d73 with SMTP id
 af79cd13be357-93e9b87f19bmr419567285a.77.1791381264807; 
 Wed, 07 Oct 2026 06:54:24 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1787e7792sm145694405e9.0.2026.10.07.06.54.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 06:54:24 -0700 (PDT)
Message-ID: <2874719a-ca6d-473f-a29f-e40f56016fc9@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 15:54:23 +0200
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
 <9bf8945c-6472-462e-a275-f0b74912d3ed@oss.qualcomm.com>
 <CAE2XoE9QzGda8J9QCQysRL8OoxBrR86Ft426Rf4TXJxnPm+Vsg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <CAE2XoE9QzGda8J9QCQysRL8OoxBrR86Ft426Rf4TXJxnPm+Vsg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1NSBTYWx0ZWRfX1v4rlpevzKJ6
 yPOqNW514d/tBWVb+IqPZMsAmRxVc+f5xYoC5GVPg5q+qRWaf79tXt2wNNS/aPkSdOCbTOoWa8S
 p4/CWm5UK5gTTlLHULwEE/MXys8Pj5A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1NSBTYWx0ZWRfXyFsQQ+6ClfUB
 2Nv9AqtbvHhTypkSR+nOKYZbh/LIijSKgSejikR4qvqm4SgQLsZDaNWoCa6UuvQhNgLyC9VDm6r
 C6JCPlQtNG6wUxb+toOIKy/ZOPOf0BdOcfRPlpi5+bsYhvUzu091e9pmIdiB+zCYJY/0045qygy
 M0E++kXfS2OSFd9HD6KVzcnUtxJgRsGeJsmAGEkQLqf0GYmsWigla4ZeM4FBprgyuWehj/5zjKv
 05g2kHfpzD2R7yShtFG7H9PshrqLgvGNhvGU5RG4a4tmDAaivW+xwuU7TEJjKDOQTjor69BCYTA
 SlMBYW2DyDzdeP2ACUPH5kq15ZrwLOA3W5/ETZoRnpRQ+XDqclDY1Doj38Bbo4nlxoL5FZBVNLL
 cE6wO3mmZ9Q262UX86SBjTVmdNXIGcqyrRnglSIlebjHuQ2e+hCVY7MBhW929+OLDcsvDLS0k+a
 hOiZOiVv7XO4kggjDgg==
X-Proofpoint-ORIG-GUID: Vcj-xzczbpWn2eQQGl3o2Iszd-0fZNg4
X-Authority-Analysis: v=2.4 cv=T5EZ3PKQ c=1 sm=1 tr=0 ts=6ac64f12 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=69wJf7TsAAAA:8 a=EUspDBNiAAAA:8 a=LnnBb7FsOvHOz9LIuJkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-GUID: Vcj-xzczbpWn2eQQGl3o2Iszd-0fZNg4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070055
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

Phil.

Regards,

I missed it, but again Anton's comment were in this patch
description I wouldn't had barked.

How does this will work in heterogeneous binary with one
RV32 and another RV64 cores running together?

[we tend to avoid top-posting on technical lists]

On 7/10/26 15:39, Yonggang Luo wrote:
> It's here https://lore.kernel.org/qemu-devel/ar9WZip2Q2G0qvQI@hive.localdomain/
> 
> From: Anton Johansson via qemu development <qemu-devel@nongnu.org>
> 
> 
> I wouldn't be surprised if that's the case, although I'm personally a
> bit scared of riscv_cpu_mxl_bits() since it returns 128 for MXL_128, so
> if it's not used carefully or on clear MXL_[32|64] paths you could easily
> get UB.
> 
> 
> On Wed, Oct 7, 2026 at 9:26 PM Philippe Mathieu-Daudé
> <philmd@oss.qualcomm.com> wrote:
>>
>> On 7/10/26 13:51, Yonggang Luo wrote:
>>> On Wed, Oct 7, 2026 at 6:25 PM Philippe Mathieu-Daudé
>>> <philmd@oss.qualcomm.com> wrote:
>>>>
>>>> On 7/10/26 10:43, Anton Johansson wrote:
>>>>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>>>>> Signed-off-by: Anton Johansson <anjo@rev.ng>
>>>>> ---
>>>>>     target/riscv/tcg/pmp.c       | 5 +++--
>>>>>     target/riscv/tcg/meson.build | 2 +-
>>>>>     2 files changed, 4 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/target/riscv/tcg/pmp.c b/target/riscv/tcg/pmp.c
>>>>> index 99345d63dc..2d7194de10 100644
>>>>> --- a/target/riscv/tcg/pmp.c
>>>>> +++ b/target/riscv/tcg/pmp.c
>>>>> @@ -638,19 +638,20 @@ uint64_t pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index)
>>>>>         if (addr_index < pmp_regions) {
>>>>>             val = env->pmp_state.pmp[addr_index].addr_reg;
>>>>>             int g = pmp_get_granularity_g(env);
>>>>> +        const unsigned long_bits = target_long_bits();
>>>>
>>>> We need to fetch this information from @env. Maybe riscv_cpu_mxl_bits()?
>>>
>>> discussed before, there is possible be 128bits
>>
>> Please point me to the discussion (directly, saving us a ping / pong),
>> as:
>>
>>     '''
>>     This was already discussed on v42:
>>
>>     https://lore.kernel.org/qemu-devel/some-message-id-v42-20128438/
>>     '''
>>
>> Having the discussion decision resumed in the patch description will
>> prevent further reviewers to ask again the same.
>>
>> What do you mean by "possible be 128bits"? If we want to cap the
>> value we can use MIN(64, riscv_cpu_mxl_bits(env)).
>>
>>>
>>>>>             switch (pmp_get_a_field(env->pmp_state.pmp[addr_index].cfg_reg)) {
>>>>>             case PMP_AMATCH_OFF:
>>>>>                 /* fallthrough */
>>>>>             case PMP_AMATCH_TOR:
>>>>>                 /* Bit [g-1:0] read all zero */
>>>>> -            if (g >= 1 && g < TARGET_LONG_BITS) {
>>>>> +            if (g >= 1 && g < long_bits) {
>>>>>                     uint64_t granule = 1ULL << g;
>>>>>                     val = ROUND_DOWN(val, granule);
>>>>>                 }
>>>>>                 break;
>>>>>             case PMP_AMATCH_NAPOT:
>>>>>                 /* Bit [g-2:0] read all one */
>>>>> -            if (g >= 2 && g < TARGET_LONG_BITS) {
>>>>> +            if (g >= 2 && g < long_bits) {
>>>>>                     val = deposit64(val, 0, g - 1, -1ULL);
>>>>>                 }
>>>>>                 break;
>>>>
>>>
>>>
>>
> 
> 


