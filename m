Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F11FCDB46F
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 11:38:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbzSa-0007cq-RT; Tue, 23 Jun 2026 07:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbzSV-0007cC-Rq
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 07:38:27 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbzST-0007TL-WE
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 07:38:27 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65NBXmCL3668729
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 11:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UPpoLKGJWRlJieChzufFTnRGpcbnyegvHeqLvZG8LBc=; b=Y+NZ6MdGITg9XXb8
 Xj3Ejdd9pdNr+8/yQVh4Vxj3vpaGhfPaJ+G5wP0hwZ6we0lTf1UPAnydx3kRxvRs
 V7fGJxDoUgWN6/cdhz+cy5AJ/gdoDg/aT1AWw/DCBPNHHZfxq4ds9yEJIiLOAVtb
 kOme/HbTVzO8Lh7ZIi7lXSIDK2HEy8qd0PqCd3qa3xZZsV7bD+10d7oX6dCgAiz/
 YOy1W9o6dr76BJzYF2Vp/iB4/MyPW+Fp3UnCM2Gx7EQQj1U/U39ppkI4wMAg4L18
 02hnSOwEWQIJ5os6ZqadMgnatOi2MTpZmG9VGFVUu7zYV5d85pENDuKrMMgv+vsm
 8FD0QQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyppygsew-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 11:38:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-519e4aaec80so81194051cf.0
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 04:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782214703; x=1782819503; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UPpoLKGJWRlJieChzufFTnRGpcbnyegvHeqLvZG8LBc=;
 b=YQGYNuI+nRRGB6ckOY1YKbf9cVTdvnipGH5YC5aYCWhzjIv4A2eUamyVklQyjvlV7E
 HVZCunEQM5uDWokOBS8vKwWhUTiX0SnzKYgfQNk+29S8DyYNxxRDK/fCYxF/Hn3rSswR
 QskrU6qzIKEv1FYjhIy5x+NfZiclwOOQK3Fj7IEsvikbgSnmiag6TSbW6MrpMKZzbThf
 4Z2XzhdbyBKcj5ju/RoUSW/dZuZ4I1VfElvRe9jgpt5+DX5909HhIsduB4UfpeOceXV/
 pFTHZyvfiPfnGcD8rbBmayINGhbmvf70w4v2fv+MX++3V5l6NiRLreTHZUeqcwm65ipz
 IGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782214703; x=1782819503;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UPpoLKGJWRlJieChzufFTnRGpcbnyegvHeqLvZG8LBc=;
 b=shfIuTP0NxGgMsYqHYZ0SYoQ5399eY55PKAk69B0Z3IcjMsHpvp07xZuboprmbgF20
 M9Cs0t4MBs7veO1Nbb0EuGZIjki+vJuEj7AjQIrpnQxKwla1u29S7/TbGsHt8XCx+0Vf
 bg3qPU+/P0/qNaj19Dqc5n756Qnypv49TkjCxvEd8kiKuOnM0rl/v7EqLLJkY9nM3ZL8
 9y4L9/5H1GzuDd+eAwQuNylkmYH4y16UUJMSG7+bYSS4uyzM+S/p5BxB6KGZYAfNSvl9
 Ehcfj2Y4aOtkf5y3AEWsgq7UU61i5T2Ezu74YX7ah28bxF5dpkHp9ubnz/+1SZaTrLGu
 8fYQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8UPlHKaxalJbh88jn3yiJs9U9g4qJiOdG7zGEqe6E79Ao5+ZAo8ViPM0qlIYEYbew752NwPhJaKlap@nongnu.org
X-Gm-Message-State: AOJu0Yx0lmI7+IVho97oc57+DrQB0Ltay4sAaF4Ri4b1+g+kAYD8HwUd
 13+DSe7a6vBa0lFvM61IwsjhxXTM9UF6aupCI+Y7fXOi/RmNNPABO3DGxaz1MCtiNHsBYwmJdAh
 56dPvijbOdUiyJ6qBQNtlKMphLaMtX2UwU4FapOkmPAYVOLiRPbU1tgYwEA==
X-Gm-Gg: AfdE7cnTJ/tvNpgADI1/inbD9uI6I9LLfueThurr7yoP2wowj9yXrab2JJc1kVIgP7f
 WZPeg2ks/E3LfU/MqTejD8gJOin9NVErHSk8qU/qltZHeA5rZnWrlAFJBRpYEI2APyh+VEY4Hpq
 LsvRUm1SpNdQl60+sGKcAFCARbE+BCX1PWbRBKMgHESj6BJTyR/HY4TK6ewcNqsUITCu9oizRon
 n1xLWfKW5fu7PiwTiN/FkYgtYBe895iMz4gQeMTO3gs3yyhuA1lJ50pRsYuEYrcp0jumTfwQROu
 Is+W9vitn9Nfno4uLcziiAxw1sgDjBs/Ai2dsR/JAamfIABrht+1lekoW2GXFnWneU6yudIiJvC
 zIew92BhKuAW9i8LUMaghlPEI2JuVnjf5krEAd6ktyKR6
X-Received: by 2002:a05:622a:1f18:b0:519:e1b7:5ba with SMTP id
 d75a77b69052e-519e4a52925mr318466841cf.15.1782214702671; 
 Tue, 23 Jun 2026 04:38:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1f18:b0:519:e1b7:5ba with SMTP id
 d75a77b69052e-519e4a52925mr318466311cf.15.1782214702193; 
 Tue, 23 Jun 2026 04:38:22 -0700 (PDT)
Received: from [192.168.15.10] ([187.35.50.240])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51a51afc29csm21296831cf.27.2026.06.23.04.38.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 04:38:21 -0700 (PDT)
Message-ID: <df4a5857-ec4f-4d4f-bc08-1a9c5caae100@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 08:38:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/24] target/riscv: move TCG files and fix --disable-tcg
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu.zevorn@gmail.com
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
 <52c3605c-345f-43d2-8cc6-794980c805fa@oss.qualcomm.com>
 <50ce1e98-2c1f-4cbd-b191-1eac324b71b6@oss.qualcomm.com>
 <704cfba3-e92a-498d-928b-877f7f7641fe@oss.qualcomm.com>
 <9d2737e3-34f0-4f68-813b-37059615bced@oss.qualcomm.com>
 <CAFEAcA8660BZOmX_KXeF7JJaJwgKO3zSRDEmJURg27FK=tqbZg@mail.gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAFEAcA8660BZOmX_KXeF7JJaJwgKO3zSRDEmJURg27FK=tqbZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NCBTYWx0ZWRfX8H9hQx9aYXk0
 piBatIn9gWFWV9P+uNQQuoMFWu8lIsEvtDiJBRVgeSJiu7j2Mct9hqnGIKMV9EYKewljQMLiYLv
 es3R4LEGZK+66xqOMZrma+P+6TZH/TUwSm897FyVrGIPQUdizq2iG3eeyG0rlDUUprcTIKemnjk
 +z6PLxh42P8WJGT4UVTjn+QlpENaMKfkdc8CBpqZ8X+1vJ/1zDyPiZ38qgr+9QP9SmB5tnjUnwj
 FwVXPouIrxsPIhnXEdePULth4X5lD2kMdylB54mG2h8IkejeNOnVWhkiv7npXXq8jzlkBNZW1Ye
 TKmhXxkC0c1MXpTNEeJkHywTQQA8B+nTYT1MWEu+3njhW0QgTdxZny4P9cfHcjmHZbhAZYurK4K
 GI56LH3aewHBr0F6GpzduUTpVcz+rnBAu70X9/X3U3LcyQruGcU9fkYFEkGMvY6kR8SeUN5YqCl
 7DajGVRr/IBkyNZsLXA==
X-Proofpoint-GUID: RAeTWWDpHr3Q3R58I30TxT-mG9-Ff1cQ
X-Authority-Analysis: v=2.4 cv=dvfrzVg4 c=1 sm=1 tr=0 ts=6a3a702f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4zNbLBpji/9weHA2+kqC8A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=4gx32tC3VWhf73K_kkgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NCBTYWx0ZWRfX3lJvyqzLD4O3
 ARB6D+TnhhH7ojf5AqSQxapHMEyoKJqaXCWSAWRlBbQVne9sGi9ugYqs2rbCQLh9hAYTT/Heejy
 SYpB99sfEg8WBKW75TCRPIgujjK2HhM=
X-Proofpoint-ORIG-GUID: RAeTWWDpHr3Q3R58I30TxT-mG9-Ff1cQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230094
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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



On 6/23/2026 6:58 AM, Peter Maydell wrote:
> On Tue, 23 Jun 2026 at 10:49, Daniel Henrique Barboza
> <daniel.barboza@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 6/22/2026 6:34 PM, Pierrick Bouvier wrote:
>>> On 6/22/2026 2:23 PM, Philippe Mathieu-Daudé wrote:
>>>> On 22/6/26 22:52, Pierrick Bouvier wrote:
>>>>> On 6/22/2026 12:31 PM, Daniel Henrique Barboza wrote:
>>>>>> Hello,
>>>>>>
>>>>>> This series looks scary but it's mostly trivial and mechanical work.
>>>>>>
>>>>>> It is yet another attempt at fixing --disable-tcg.  We have a recent
>>>>>> work sent to the ML [1] and we had Phil's attempt back in 2023 [2].
>>>>>> Phil's work didn't get merged and it's now too hard to rebase and
>>>>>> revive, the most recent attempt got misled into the 'what is common code
>>>>>> between TCG and KVM' dungeon.
>>>>
>>>>
>>>>> It seems like series does not apply on top of master, would that be
>>>>> possible to rebase it?
>>>>
>>>> For some reason the RISC-V series are handled distinctly than the
>>>> rest of QEMU, Alistair queues work on his repository and developers
>>>> are custome to base their series on top of it (otherwise Alistair
>>>> can not apply them on his tree and asks for reposts), see the
>>>> riscv-to-apply.next branch on https://github.com/alistair23/qemu.
>>>
>>> Unfortunately, it makes it hard to run any kind of automated testing,
>>> especially for series like this that target specific configs.
>>
>> Don't we have ways of saying in the commit message "these patches applies
>> on top of these other patches" and then the tooling would deal with it?
>> I remember patchew doing stuff like that with that "Based-on: <message-id>"
>> tag.
> 
> Yes, Based-on: is our convention for marking "this patchset needs some
> other one to be applied first". But that should be the exception rather
> than a common case -- if patchsets regularly need to be based on
> something other than head-of-git, this is I think a sign that
> maintainers are not sending out pull requests frequently enough.
> 
> I would prefer it if QEMU didn't develop kernel-style "subsystems
> have their own particular workflows" fragmentation -- I don't
> think we're big enough or that sub-parts of QEMU are sufficiently
> well separated for it to work out well.

I agree that rebasing things on master is better than rebasing it on the
maintainer's tree.  And we could make a better job at informing developers that
submitting a patch for qemu-riscv, vfio or any particular subtree, means that
the patch should be based on a maintainer tree X.

The thing is that sending patches on master only works if master is always up
to date, and that's not feasible with our current style of merging PRs.  This
series we're commenting on is an example: it doesn't apply to master because
there are pre-approved RISC-V patches in the maintainer's tree from 2 days ago
(also my patches, I might add) that caused conflicts that I wasn't aware that
would happen.  This conflict would have to be dealt with at some point by myself
or the maintainer, and it's not like 2 days is too much time without a PR.

We can argue "this is an exception that doesn't happen that often, we should
stick with using master as a base", and to a certain extend that's true.  But
then this sort of conflict happens again, then again, then again, it comes to
a point where it's easier to tell developers to use the maintainer's tree instead
of master.

Maybe I'm downplaying the problem because I've been sending stuff based on the
maintainer's tree since forever and got used to it.  IMO, unless we decide to be
like libvirt and create the "committer" role to allow trustworthy devs to push
stuff to master after acks, making it more feasible to expect master to be up to
date, I'm afraid we're closer to a kernel-style workflow.  For better or worse.


Thanks,
Daniel


> 
> thanks
> -- PMM


