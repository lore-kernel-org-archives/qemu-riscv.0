Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71375C43458
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 06:37:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgzQi-00044s-AE; Tue, 07 Jul 2026 02:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgzQe-000445-LX
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2026 02:37:12 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgzQa-0000k6-V8
 for qemu-riscv@nongnu.org; Tue, 07 Jul 2026 02:37:11 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66748XxS2514295
 for <qemu-riscv@nongnu.org>; Tue, 7 Jul 2026 06:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gyhyvNqw+sY098FiAKq3jXmEgXGgny3uZCW+G62LH3c=; b=FmpBuW6lIo37JcRc
 vMHKXRXcPoaNsj3w/NfQ1O2DtzLKA5xChp5MfLHkCOY+yh0pZLRigFuZQnEnqQOn
 EhO/+ialvq7XMCEDeNcnWYnOvd7w1LcKO7wCSk7wTzJBN/zuq3yaNbqzLx1uK1kR
 y/WUIw4cmgR2PJa9lsNRgjbYKzBUNgbfqKYEhQ/KfO9Giz+BqheXHjU6WcgVVnd8
 OqVxM+cSpT37cLscdTgU4j9/4CiLLRQB5hsoMmn2NYx0eMgkHfxbjzvLgODpUVRy
 2zmp+kTeCS2O0extNHh98EfVTpQ8GyLrbiX+A7Zi7HiV/w/wPq3ri7OUm6hXMCzZ
 ZOShLg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8gjtu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 07 Jul 2026 06:37:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51a8b0a08d2so29961061cf.0
 for <qemu-riscv@nongnu.org>; Mon, 06 Jul 2026 23:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783406225; x=1784011025; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gyhyvNqw+sY098FiAKq3jXmEgXGgny3uZCW+G62LH3c=;
 b=jA8bUR8E8OdygWNW9aXBr8T2uUvnzUPpgWUslLb/ONhKa7+WDfHTSNowGztFf4NVAG
 H7cMNB8ygyD+cQKfbgKmVogha23HfO+eGE5JSbWMIccWOHXc7SXh/YlT5F2WudEPg8i4
 fWfZXjMGjq8XtmtVsDJVf4PDUpTXJAG0fOPQA4vDAtsesUHwt3kI0/Cb6O2GWAOgipEE
 IpGuzaw1dOET+WslUufgWrb5kcpVDqoGxcglwuTli1yC1u7jm+dvUBSLYISPcUafXwWM
 DUVux89HgWB5jBYJhrMnRUUNkCqcuJBzmBKZa90HuBcY6Y3oxojDKy4ZQ4jlvQ0i/ITZ
 tbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783406225; x=1784011025;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gyhyvNqw+sY098FiAKq3jXmEgXGgny3uZCW+G62LH3c=;
 b=SLhtVKI2fIFI8mGfayGePlwn/tWDL/PPR7OHepNpWSpfpWOMv8Yu75iKqdTONEE8Vo
 tpj7A49qe+TGaeZ4G9fOx7fUAJ/tWhY5PHdVSGFJXOIZLilLCM+xcFSl0lPyC9uD9IAO
 U20aSZCwPOZ+36j/BvlEOo87fJT4OugmkRuDCM9gN0B9ooj5jto8arXlEGnP7M4tGVkB
 FEUSZYTrAVVldQQITok80wl2kcRu5T/+t3FgZoBZrSEXh+CHzpT/Z7TuD6omQmR1/zKK
 7VwXcQHpS0cF/OJTtB2SXR7XITmJSIl2m+bcFRc9qn4ZjW0wkYguKXvOrg7QaurBunIO
 3NYA==
X-Gm-Message-State: AOJu0YwZsJVRv57bd6c8nMEoJT9m6pioEVL9NU+xdROROz59Trn+NLSE
 y6AAqQtaZxP4D1CcT07qmXlk5Nbnw8IvlBP75+T/A9VqP/2dvBvORUXtzt2s/3VFL6WXcvXXGlp
 mOsQxAKP/IxhRIDr/zXiqXp/4sw+R8Fe4GIbPYPWlu3PWfdLY7B1mcdwRvQ==
X-Gm-Gg: AfdE7cntWhldrM7y+GKz0tFVGXeE91ItATEhjkqfHprEL6BOKCP3JxLcEOXNt7URFbT
 X2ffUtSI7mZHJ5OKgMFL+sft071+MaCXJSSSKWEl+YiTvvbZjPgYASYQ7++V/aNIAEkj0qIyJAJ
 h3kdzqRTp1jdlBGcYaKqz6jaRt5fsIB2IUcnL/zZ8GDw2ZezYZiTd3cgU8iIx+W/4Ldl/G12tMl
 2VQBHx/r3C40JfqEOVF/NpCYviAHOyk/YSkfbQ7XdtxPbAHeQ6omavjap4fIM4EA02iLrmoqzbW
 kr6Fea5Wg3/EvNeN0AGTZa3NnAiKSaAT10D7l0qE0LuetYXDxZgLy9AdvK+zjjEnUTdNCKGQmEv
 plIUi3ke/Q7OXhXVSiGbVLVuFQUDbQWe9MkUxgf9Kcb4ZWxM+ORVrmLNUSSrbfw==
X-Received: by 2002:a05:622a:4087:b0:51c:161e:25a9 with SMTP id
 d75a77b69052e-51c74881c80mr43925991cf.62.1783406224771; 
 Mon, 06 Jul 2026 23:37:04 -0700 (PDT)
X-Received: by 2002:a05:622a:4087:b0:51c:161e:25a9 with SMTP id
 d75a77b69052e-51c74881c80mr43925881cf.62.1783406224330; 
 Mon, 06 Jul 2026 23:37:04 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9de1d910sm30202737f8f.6.2026.07.06.23.37.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 23:37:03 -0700 (PDT)
Message-ID: <4d295fc2-bd35-4705-b94e-e16d85e81094@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 08:37:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/riscv/riscv-iommu.c: set ftype and iova in
 riscv_iommu_ctx()
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 andrew.jones@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260701092241.307801-1-daniel.barboza@oss.qualcomm.com>
 <ad3fe9c2-6205-451d-9dc4-4961a04ed34a@oss.qualcomm.com>
In-Reply-To: <ad3fe9c2-6205-451d-9dc4-4961a04ed34a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2MSBTYWx0ZWRfX1UPviBWpytDN
 IiC+42c1lFT/pyeHStCK96aWECT4y2MHjRdiXaqRqJWw/5jxz+bjDINlERH37e0TLeEWLgMWy7I
 5uORKmBkhcbg2gBz7nRzYHVvj4O1LwbE7ZAMHLeIc9/Y4RvZpXxex+SJWq3/96Te/QZpl7GymPK
 MrbQS9oGBOEZVZt8uLEp5DVtXvY3dXE5VPAFvyMD1CE4yHZj4MH6dr3YzGmavOofaSAdhTI7MDC
 6jPo+/a1DcSMAehlHgmZMt+YX8mcNNWJzCcFUTndNByPYc+BgfuiYHj5c85ajZHKSmG52jzQ/0j
 LUEfIizdoTdoWathER0tMHeC5PsIlmfASlaRXyCdK/fWkNTv+vYi78bNnx+O7dmwprjeTlB6n4O
 xvT8sQtjdyuMcm7ztd/LuCIYUxrmoOgBPgGOaypCLchI8yFuwMuitVXDLOuqswmzK8/ElPxj3gb
 voqlIbOovc78oQf323A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2MSBTYWx0ZWRfX0ofXvYqcT1yt
 KneyOvQTQ4Ri22s5pj+xixhlpQjaIaOlE6K4JUfN+wgsbjTuDpBJzC5mZjgyP+66VZ4/vef4PjQ
 kNHsojYCUNYzpatv/S7gMN6TgD/F3Mo=
X-Proofpoint-GUID: fJZTKSI_8oP64VUb1uuN7h7jKzKi236V
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4c9e91 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=1T0qjp31RWeM4IvRkRAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: fJZTKSI_8oP64VUb1uuN7h7jKzKi236V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070061
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

On 7/7/26 08:35, Philippe Mathieu-Daudé wrote:
> On 1/7/26 11:22, Daniel Henrique Barboza wrote:
>> We're hardcoding faulting type as READ, where it could very well be a
>> write access, and we're not recording the faulting addr/iova.
>>
>> A note was added in the fault_type logic because I wasn't able to
>> trivially handle a probable code repeitition it in this same patch.
>> Something to do in a later date.
>>
>> Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
>> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3564
>> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
>> ---
>>   hw/riscv/riscv-iommu.c | 29 +++++++++++++++++++++++------
>>   1 file changed, 23 insertions(+), 6 deletions(-)
> 
> 
>> @@ -1339,6 +1340,7 @@ static RISCVIOMMUContext 
>> *riscv_iommu_ctx(RISCVIOMMUState *s,
>>           .process_id = process_id,
>>       };
>>       unsigned mode = get_field(s->ddtp, RISCV_IOMMU_DDTP_MODE);
>> +    uint32_t fault_type;
> 
> s/uint32_t/enum riscv_iommu_fq_ttypes/ (can be cleaned later).

(and if cleaning that, also riscv_iommu_report_fault() argument)

