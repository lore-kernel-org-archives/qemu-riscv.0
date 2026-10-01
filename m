Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9A6CA5FCB
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 04:24:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xC8Ku-0007Sg-CO; Thu, 01 Oct 2026 00:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xC8Kr-0007S9-Ee
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 00:23:58 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xC8Kp-0004I4-Gi
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 00:23:57 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6913g5tE4169803
 for <qemu-riscv@nongnu.org>; Thu, 1 Oct 2026 04:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 18Rg/dajCd0tognlWy5soatv6SKrqtyjs7v2WXJTJIo=; b=cN9rrnyZIUwuA0as
 g9+arcdswh4CNlqg4WJQrsYU6sj+t9kGaCKeg97Pe2POchiMXaPpa30X0J4cpG42
 QMYm4+I8IxTsxblirQ4bVhwMVIPHiojoQIn0ztp7LF0epfC/IygX2dgnFmuNhqal
 ifKnB9DeSrSchk0f2t/ty2tVLZpn1Yx8Mp0e5BbGj1zlMh0/4fBnuanWuI6cXfBa
 bksDK3yKcI3oMywMgOkfLQsqkalZI0cFg3ir+kvhp0i+15qfNXn+OIvXhsEzSQTs
 EpjKfXAIMwu9Bx0GXkkfgdpDEU4Sfpa4MJ1UYpA2cD+vNr5pT/tBAovwAh9dyiiC
 9j15cg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh58xx8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 04:23:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-38e8e864ef0so6385440a91.0
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 21:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790828633; x=1791433433; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=18Rg/dajCd0tognlWy5soatv6SKrqtyjs7v2WXJTJIo=;
 b=dbTzc6JkvhFc5J3PK/7eRKZ/ovNloANH+ceNjIfiKU8om0bM2xWSJMhH8lKXToTpf9
 aVQbGFD9uivRCkWhYpVWtLXzJzsIyeB2bEq3joJO+hzuCaLiu745wC59Y6BNaO1MblM6
 bHrUV1+yNakxna2f1itbEY2wsk+GURQXTM4Ln44lG9HIObn4Ezc0czzkt8ImevwzG57i
 cRvk2YFeCYi/9kB/wtq4D3AyEnpAhBqYEaNiaL1ccpihHjEPFzkxfrn+oPL0qdC5mUep
 9NcsZULHoVJxqXR+j44ibL9d21HMApkYMUyh5M4pnUpc+pPNJ8O16TBPBl3yDnhd0hXO
 C1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790828633; x=1791433433;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=18Rg/dajCd0tognlWy5soatv6SKrqtyjs7v2WXJTJIo=;
 b=aCFsC1cgKbJWnVtDUYm/8hhlWCJUhSjqc4zcFdIkUjTTWWnDmfhMPKuVlnYPbb57Mm
 UjP0Hl2HZmgs96tc5Y2CeDPNRYiIWdXY+mUROH/36Xd7HCzknEnB7Jn7z0/8fUuESMXC
 mH1eUBqIV+dUao0iUdoXgGbyZyP1rPVQhnudrWtaQ1B5hMX+Ejcb3xUdhTbm+PCml2M6
 Y3BaAO11UPkZ40eV6z/+elO8zSyYkI9RnCNUAFwRwyPr9yVyKLCxuPZtyL6LhRkB//r1
 FHywuePlpATvtwDorGih0/22w8varlEzP5D0Ic1fYQARCo8P0t9TMASCazTpIXln+Jh7
 FIsA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzht8hY0FwoMJEivmfDujsGDbcxJ4eo57pJ7lyb+ptUthMOqhOVekdpcGUXMi0z9W9YivdVe2gZJT/g@nongnu.org
X-Gm-Message-State: AFuF++mAUbOC6zDbiFVBQqZ1kkoOsp+W+UY0AfSYiFE1I+GEzWQzdRqV
 2mvzundW1TAbrHMo4rY5+0iBRvDhB76aUB5Ji4dPsb0JEgBrWBrrie9UL4vzjeuOFjSywN8hMMR
 SarapZa5ky5xUMg54EBfG5dIoqgw01QpAc6rnv4sMhgoULHBVnwtzp7RjPA==
X-Gm-Gg: AYBFou0t6J/QuGPjGyJEoZrMNQGJAwpUKRAkFIM1jhz6hLJFjcdPiede9MIHVrJpNNY
 KTetoJJ3QKNKuq656JCI8CuVrb5BAb/ph+B0DqTD7eBpGvSt0nHfwrItenoUDH9PigNy1+Km5Vq
 4D6hkUnZ2IlURJh6eevp1HFF1UzuQlrUc6BKd/L/xutDYlOoW86FN544afw1vXDtbxmav92auJ0
 JaKT8hjQ+gFGNg7mebrvamMdmfi8RYO+pc31FGEl+AiHrwgQy9VCg3ulZiVtW9eHHip9eEdaidP
 4sFLJxrZRRaLH3bW9EVIBL5fZFCKd0QVPn59jYePZuYk4/ty+Bdg/CL2bIhnPFVGbup+8p6OxPR
 aOoS9aJWIoroUDxA05KzTvQNWI+6AuV8t9dA5O68WYzIfPYsRJA06nK/c
X-Received: by 2002:a05:6a21:101:b0:3dd:a006:7b3c with SMTP id
 adf61e73a8af0-3de9e75259fmr3425388637.59.1790828632511; 
 Wed, 30 Sep 2026 21:23:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:101:b0:3dd:a006:7b3c with SMTP id
 adf61e73a8af0-3de9e75259fmr3425371637.59.1790828632054; 
 Wed, 30 Sep 2026 21:23:52 -0700 (PDT)
Received: from [192.168.1.169] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-888193d2061sm415713b3a.36.2026.09.30.21.23.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 21:23:51 -0700 (PDT)
Message-ID: <74853ef8-7315-466a-99ac-41c8182f9b13@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 21:23:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/10] machine: allow -M name to differ from QOM type
To: luoyonggang@gmail.com
Cc: qemu-devel@nongnu.org, Chao Liu <chao.liu@processmission.com>,
 Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Song Gao <17746591750@163.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>
References: <20260926081551.29-1-luoyonggang@gmail.com>
 <20260926081551.29-2-luoyonggang@gmail.com>
 <82250296-78bc-4345-9e57-1fcac485d18a@oss.qualcomm.com>
 <CAE2XoE_+nhj58M9_yx6wf532qCSVcERpTw7F4AU7PXN7prhpzg@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAE2XoE_+nhj58M9_yx6wf532qCSVcERpTw7F4AU7PXN7prhpzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAxNyBTYWx0ZWRfX4ONAbyC5hcDe
 HTDLcaStSEhMTOw1FRMOMtPLKIyf/EzRAatvS3R9II2VMu2uEtUa6di6iB4bKmY4w/sE1QlPLGT
 KySJJ2gGdTkleu3NMF48hpLSqKDJ+dMfSmEG+3dU7JQ+oAzEztM8+tQdkhgfEHxMS7L9donJoOD
 o6oscqQ7QKN9Ud5JxPqHqMLSc6c0SXMjJZCrrlZ99vblRktgEMLmNyk0AmmJ5UBwjQW6DOJpGvB
 D+fQi8r9L9gR2j8yhoGTm1NHHhwLVuUDHP+LdKTEsfyOaoRbIHA5EbDGAjezGWjQzRoWyqygRlJ
 oeD9Uz+RlE5Y9KooU9bpmfTRA799n+M4VLv7QL5gglofrnmk0aXqpsXnb+RHPukbNmcFyfrCEqc
 q46ZtjVibYEfqmcLRhVKoerGYYklsUCTCHQxslfHryxBoo0ojduwJqjuO/rsTlvDyRDmK6RpAIP
 elcJelEQtHMaa62gDjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAxNyBTYWx0ZWRfX23IXGPiYRtXv
 tW3uMA+BGi13ysYdiREgCGOM4rGfc++hslkvS1uA/xUEmK52tgchPOgZq4V3KoTlYqjnNtrHL+a
 X8cCwWHK6A/p2a/hjuOpP7lByKIHa6Y=
X-Proofpoint-ORIG-GUID: UJj8YeGTQ-x-2SG3sLa6LGu5lf8Mz-LQ
X-Proofpoint-GUID: UJj8YeGTQ-x-2SG3sLa6LGu5lf8Mz-LQ
X-Authority-Analysis: v=2.4 cv=NrJE4MdJ c=1 sm=1 tr=0 ts=6abde059 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8
 a=yrPBLZhDcz1HLbYK-PQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010017
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 9/30/26 6:55 PM, Yonggang Luo wrote:
> On Thu, Oct 1, 2026 at 2:19 AM Pierrick Bouvier
> <pierrick.bouvier@oss.qualcomm.com> wrote:
>>
>> On 9/26/26 1:15 AM, Yonggang Luo wrote:
>>> - Add machine_class_set_name() so boards can keep a stable -M name
>>>     when the QOM type is uniquified. machine_class_base_init still
>>>     defaults the name to the QOM type without -machine.
>>> - Document that MachineClass::name is the -M name, not the QOM type.
>>> - Sort -M help by MachineClass::name so order matches the printed names
>>>     when QOM types are prefixed (arm-virt-11.1-machine vs virt-11.1).
>>>
>>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
>>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>>> ---
>>>    hw/core/machine.c        |  6 ++++++
>>>    include/hw/core/boards.h | 12 +++++++++++-
>>>    system/vl.c              |  8 +++-----
>>>    3 files changed, 20 insertions(+), 6 deletions(-)
>>>
>>
>> First, I'm not opposed to this series, and if anyone wants to pull this,
>> I'm ok with that decision. It's just unclear for me what will be
>> direction after this step.
>>
>> If I understand correctly, the goal here is to allow to register
>> multiple "virt" machines, while still having distinct QOM types behind
>> the hood, which does no affect behavior of current binaries who have
>> only a single "virt" type at most.
>>
>> That said, if we project in the future where we have a binary with
>> multiple of those "virt" machines, how will the current series help? The
>> situation we'll have is distinct QOM types, that all answer to the name
>> "virt", so we have no way to select them individually.
>>
>> Slightly worse, find_machine() will just pick the first machine name
>> virt, which is a non-deterministic order at the moment.
>> https://gitlab.com/qemu-project/qemu/-/blob/master/system/vl.c?ref_type=heads#L846
> 
> That will handle it properly. For single-target binary qemu-system-$arch.exe,
> this won't be an issue, as there is no conflict as they won't be compiled in.
> For multi-target binary qemu-system.exe, we will choose the target through
> -M $arch:$machine, and when no $arch is specified, the default to arch
> to be "none",
> so still won't be non-deterministic.
>

 > "when no $arch is specified, the default to arch to be "none",so 
still > won't be non-deterministic.

That's my point, the current abstraction will create something ambiguous 
by design. When people will specify -M virt, without $arch:, a random 
machine will be selected. At least, maybe this series should ensure 
there is only one virt alias, or make it forbidden and uses unambiguous 
names only.

"$arch:" is just a workaround to not add -target option, except that it 
comes with additional problems, creating inconsistent command lines.
I already expressed my skepticism about the "machine prefix" based 
approach, being more in favor to strongly filter types per target with 
an unambiguous -target option. I'll accept the community's choice on 
this, but just wanted to see this explained before someone hits the pull 
button on this series, so they know what will come down the road.

> 
>>
> 
>> A possible alternative could be to use ".is_available = target_X" on
>> those virt types, which will ensure only one is effectively registered
>> at runtime, thus, there is no ambiguity on name or who is the "virt"
>> machine.
> 
> That's the issue I want to fix, ensure it is registered at runtime. So
> we can list them
> all when a "none" target is selected.
> 
> 
>>
>> Again, I'm ok if anyone wants to pull this.
>>
>> Regards,
>> Pierrick
> 
> 
> 


