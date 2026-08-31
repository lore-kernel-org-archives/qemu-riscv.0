Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D17C61DE2
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 09:49:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x0ydY-0006VW-9g; Mon, 31 Aug 2026 05:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x0ydX-0006V9-7q
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 05:49:07 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x0ydV-00086e-EX
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 05:49:07 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67V9A7bP3182589
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 09:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eN48iTdEO9eyFztg0WuIybzBtG38C6lTtw9tqNlqPvE=; b=RSTkkhqrOmZEUiP5
 9+G0uUSDl5Biwl05KrO0SMo8eaJPdmAECHk7x8W8H4/7fGpa49UKihzlqE0pM8uO
 ad1ZnyCPtJDw6GaI4e77KmxYzeQM0WwE8FdiP+aVXu+UQ1+jRdSVmP+vUYavgxsb
 ViMOy1vabBO/lKfeXIdz1pdfPlm2Vpe4Ct6QlUshU/pS7RHTYDongFXdFOn2BqCr
 7tPS5gzflCgx95T9yLAzF236Uz6Uhz8T6jvHVJLIHZHu1Z7mOiiX0FoOQEk0o8tV
 +wvfcW8gWN3zVJjIES7zrka+/DW+aknKqewQrKdGxm65OC06uQnedq5FoZrpBWrM
 OKUUiw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6rb8545-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 09:49:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-52ef04756caso49306781cf.1
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 02:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788169741; x=1788774541; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=eN48iTdEO9eyFztg0WuIybzBtG38C6lTtw9tqNlqPvE=;
 b=iXM+oBScvIFTw9iEr0NK+Jc6QtugfBuMNnYnddvzqQOuH7b9jknhWCq51VHyq4MNgD
 r0MX25ZVTMoxIBpr6UR5Ct8fkOGyCDzgxNe62y248rxkZu/O3SJtu7x/2SGzAoEg+doV
 piDIxUR12CM9iSzNarifQTNw6IcF0f1TiIiCznU7KhXhmWxJgMN4T7bXYualS61MjHfm
 Q1L6fZGMIxGpnC/6mt1zbSwIh+jlBuPgyI3Kq4888fJz9gcFKZZbafbak4HJPE3WL25l
 p09OKbz7UZITLrST035PQ8/5Ot1iz02QcBLsonA7DMZEuQrt9Dv3bED8fv7cGtQRyM5j
 kYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788169741; x=1788774541;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eN48iTdEO9eyFztg0WuIybzBtG38C6lTtw9tqNlqPvE=;
 b=sYwuVSeAy2V6zKnpttaHz97yg73EUvhktbIhhiuCJRJwx2RqYPpiG8dycMAATcnJ+O
 GirjApPVHFmtId24w18lrArxwO7UR00Dvb2qH1sC7rs91e8UlJU5+JlUKsCfVPFR5ZCF
 K6nHyqd1ha450noGg1FL7qoTWESNjhQ7Ma1hv9lcuvdykx+r/7vEJ7Rtx3WrVHvOJx9d
 RZWIDkVc+YJLkgMWl2L1EmOKiO3oXqc9jbrOfN5DOtcheq07xFvg6DbHD+aXDXsk0trh
 FGny40PNZAqn+rdvAncIaXksYTiUvOUTZFyi3LEm+BElFeNWftdaRM1SfmZ8BKy/GXGX
 e8RA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrAFx9skkVgZ3kyElb/VfWDCaeZHETkPha3BfmmLnF3fF+rzlR6P/a+4U45iVE5pEv7OZyBbP4ZenfV@nongnu.org
X-Gm-Message-State: AFuF++lAQ+AwPGqEbnYstn4ArndpmUXYgPLVs8T29wwIy8fJv8AhxF/X
 DVHbukR8cQSStXiQv2xp1NVgdxjyRBq+QdD8bt0aa1/54iqueXHQLxnRfbGs1WwrOx/ZiK22ScU
 TjhBN/86CwQcFMVQ2kFPcchzn2jpvNXbAjfDeTvrpSHNhCzgr929imO6NoA==
X-Gm-Gg: AR+sD11NPBFT/TDDvuUfkyDgJhsojCfG3iiwPx0fS9iy6fuzXPZ0TCttfEco1/fF1fe
 /Q5JE6LIvBw3vqR4rnVY6fgwf2W67VfNON1nu+TAO9lUSs/k007Pm5xyg97iFVZmtxjKvolOcVm
 P4zAjWt7kg7JuxItkgxCmi3LC+G6FuGTOrqIh1xipmNDWU5PWZK7nyj/LNDQJbRlmP3tFhKwiXo
 RUBUVtn17WlhQIVQ7A9WyeDJ4p8FNXq3Q1BfAcinN5WZmDGUgS+JXspQ9U9wghYaSYfuQd3NE6N
 HPNHo62p7Ytpw2CF3COSyAkXTO7NID0JsswyD87SedAZJybXSlKXW6W5LuuyrGXtfQaeULvHpmq
 A52mxhBeLeA+CyegAysqnVINFjgs7rZuIoJbb
X-Received: by 2002:a05:622a:228a:b0:52f:b1b6:a4aa with SMTP id
 d75a77b69052e-5301b1943d6mr16197661cf.4.1788169740687; 
 Mon, 31 Aug 2026 02:49:00 -0700 (PDT)
X-Received: by 2002:a05:622a:228a:b0:52f:b1b6:a4aa with SMTP id
 d75a77b69052e-5301b1943d6mr16197331cf.4.1788169740261; 
 Mon, 31 Aug 2026 02:49:00 -0700 (PDT)
Received: from [192.168.68.100] ([152.250.131.13])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52fbe878f4esm69173531cf.31.2026.08.31.02.48.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2026 02:48:59 -0700 (PDT)
Message-ID: <6d3b5400-4f73-4049-97bd-55cff8bcc4ef@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 06:48:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/16] hw/riscv: Add property to hart to allow private
 memory
To: Joel Stanley <joel@jms.id.au>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20260826220528.54516-1-joel@jms.id.au>
 <20260826221154.54577-1-joel@jms.id.au>
 <20260826221154.54577-6-joel@jms.id.au>
 <be675569-27ef-46cf-82bf-563852bbe66e@oss.qualcomm.com>
 <CACPK8XczvftDPUVb=2pX9ofRNA31jhLopeFPse-o6s7h27BVuQ@mail.gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACPK8XczvftDPUVb=2pX9ofRNA31jhLopeFPse-o6s7h27BVuQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: A7PBaoTJCUhqncdSzNNAstdvFABfh6RZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4NCBTYWx0ZWRfXyrDRHGz1ie3L
 k9mMRPDWijZQD6kR6J3PWBfDQcZieyUM1T5ovyZnVPZysdOUJ0avCbB6mfFQ4AJkUMLlV607mpk
 0FB/1rCbnNtl5eQQHMAvY710EAvhXmC9RA4YGIobGS/ChKL8Kknm7gnug3JUFPtaAPRqFWrNxJW
 D1CHGJHJZwCTtI3fsTtlMl2jKKjjoasRHoMYLo2emBnf4LVOKLjNR8qCev5lfyBEFh3vIqUw+Eu
 D9CBpmDqIrf1KHajmgn5g0hM+DW5btZnqUdSdJu9dgAkbE3yQUVY4lgjBnW2j80qI+MMIt11iae
 SqHBQLrfZHc05lPfRIQGd9r30cw5x60SqTh9OdqHAZWvQKTINM1+iQvSdmSn/axa+/A8T6QlUCz
 DADQvRyfV+HHDq4Ffs5KQKjBPavHUsJDp48gnLhJimQTiMTmSgtC7gvownGj7KCfpA+nbOvK/fV
 RwFpO5nxOA4F2RQoGhA==
X-Proofpoint-GUID: A7PBaoTJCUhqncdSzNNAstdvFABfh6RZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4NCBTYWx0ZWRfXwUo0wwuyFyaK
 kkX4UKXwf/lX2WZY/lCgN/2V7aD2u64WbKpq8jKjplSEY/EHly4mNCeQWn6DMI222YAgf9r2Ppq
 5IxwUbFNQaOvkNU4lNKl687horlbAT8=
X-Authority-Analysis: v=2.4 cv=d/fFDxjE c=1 sm=1 tr=0 ts=6a954e0d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=CXdxNCAnTuDr1kYd6DjE4g==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=t9496tuAAAAA:8 a=AtdzOuRA7NdErCjRmd4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310084
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



On 8/30/2026 10:57 PM, Joel Stanley wrote:
> On Thu, 27 Aug 2026 at 21:48, Daniel Henrique Barboza
> <daniel.barboza@oss.qualcomm.com> wrote:
>>
>> On 8/26/2026 7:11 PM, Joel Stanley wrote:
>>> From: Portia Stephens <portias@oss.tenstorrent.com>
>>>
>>> There are platforms where CPUs have different mapping of system memory.
>>> The global system memory does not allow for this. This adds an optional
>>> property to assign a specific memory region to a hart. This allows for a
>>> machine to alias the hart's memory to system memory while the hart only
>>> views memory from its own memory region.
>>
>> LGTM but please clarify in the commit msg that the memory region is being
>> assigned to the hart array, not "to a hart".
> 
>  From the machine side you're right, but I agree with the commit
> message that the memory region assigned to the hart. The property is
> being set on the individual hart, not on the array:
> 
>      /* Use private memory instead of system_memory if provided */
>      if (s->memory) {
>          object_property_set_link(OBJECT(&s->harts[idx]), "memory",
>                                   OBJECT(s->memory), &error_abort);
>      }
> 
> How about:
> 
> "This adds an optional property on the hart array to assign a specific
> memory region. The array passes the region to each hart it creates,
> so a machine can alias the harts' memory to system memory, while
> the harts view memory from their own memory region."


That works for me. Thx!


Daniel

> 
> 
>>
>> E.g.:
>>
>> "(...) This adds an optional property to assign a specific memory region to the
>>    hart array. This allows for a machine to alias the array's memory to
>>    system memory while the array only views memory from its own memory region."
>>
>>
>> With the commit msg change:
>>
>> Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>


