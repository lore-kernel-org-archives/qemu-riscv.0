Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE02606A31E
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 19:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d+u166cP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cQ0jv+xv
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVaBn-0005Ee-KN; Mon, 23 Nov 2026 14:58:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVaBl-0005EN-QO
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 14:58:57 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVaBj-0008Ss-PQ
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 14:58:57 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ANJuZBG1579821
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 19:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YSgpQqxJciFcWjNalGE8JIxziw4vLy6patis4hX06Ps=; b=d+u166cPCkY4sg4I
 AZ914bFtgJvPKTHSdg9rL7J7A9RMFFMjlfoTQvuYMVwl/5txAyybiE13NJ8Cwc49
 Hxv0mEQmFZRGE8f/PwK4nAnvkGHRj+R8FBY2JpX/0VmY2Z2jfGqOgAm1Xe/kdnSP
 qnntBAKz+1ppfS2qERg4G7SWDhWCW7u0eOjS1JSHi2g8w2XPcI1xBLF2TWkDY0KO
 prMekujZJQfEohZZ0nMpNIro0sHPWI0qZbkV2spbM3mKslaxwcUQd9YTAww0AhWN
 sVNim84HW87QClEd67viVx0ZAo8bf+F1+agDv0k8D0ZI6TyhBNVasT3H9QsPu/tT
 IOZGPw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0t51g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 19:58:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-92125ff2d08so8685936d6.2
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 11:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795463932; x=1796068732; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=YSgpQqxJciFcWjNalGE8JIxziw4vLy6patis4hX06Ps=;
 b=cQ0jv+xvbfObLELB4ffIaWxep82qziSVwozSWE4cogjezlENQkW0Y7MCAfYcf8QTrQ
 GkfWHTFmufmL2/25rKdPNQn3/gzysCmqNmFZ/+gSlg6Q3O1fOuZ0fdzUqT6HUZmvoFE2
 S328xvosHZJpioXhXTa7HLHBiAEIwsT3xM/aF+76XGahmU7uvWC6IoL8XBABo4vjUvdK
 1ty58qHWbSi5vokmSRgKtyIUhM45zwxAcfdB+OI7izj1g4bdXc/lah0HJD8KUidlyzvs
 pFskVYI5ugkMHv3rfjOXJZ/Rt8EbVSaGRuYZoF/l5zJp9G7RECFiJN1uNkKwJVrCcPF6
 qihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795463932; x=1796068732;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YSgpQqxJciFcWjNalGE8JIxziw4vLy6patis4hX06Ps=;
 b=kHjhAO2Fj8JLgY+M4AJl0rWytbtsPtL0lRUqB7t/v8F+ejQR6vFdu34Y04Dys7CBSg
 65kCTw//+u1gfdGHcV/hRw+8POqKGeb2amDGit4FBFbaYQmPXoR21WEOayTpYnZNjy2S
 /lUOSevUjB6FmBa9aVis742v/SDOJVu+T8u+chQKJL28xGyIGlAez9ewypgdLS2++fdz
 jTACnGjCZ4gPuVJhfls6HS3/snMNiZuswwqYp8uv8E4w348Ju88yRVJ1qLNiydlVEKmV
 Snp3lrdrEBafm/fxEA9oYHpBZInXdj09aujpyXPkaC3ebpa+FDiTpK0d2ed6JRgNvWzC
 ODzw==
X-Forwarded-Encrypted: i=1;
 AL+hErEhzpFvPjjT+b7CmC8M0nhb3G0CbD2PZzqN0hxx9y777kUaEvYke17PhtrFyLAvEU3enBse+l9fWXld@nongnu.org
X-Gm-Message-State: APuU4Z+oAVaJ4wxKpa4XWmUd4EN30fLnonNc/TGQjJ04hh19FxE4xcX5
 rXKnIaWW0UGGkN2QT04umLTC3kBdpwWcv0NY3BIQWlOePJYrjWcmRl1ns7HpgUjdYEiiubyI152
 8BzIF2Sb3dlbyNmVpgg/iUAD8uFS3ePLGp3vF5plFdleWptnEICbjm/QihA==
X-Gm-Gg: AZFdTZfBsiLgkDt9siV/6RlzLNFRboX4GcKrv1juXlVlWobTDN3ecpkVizRw0N/AMXs
 m9Qw+jWoAidQOE1oF55bx+HzuO9/4KZKsk4lkWb9GgjGKSTgLqEBok+hXLZnVjtkEKcXk5Q8IWF
 /oIGRCJjb/uIjxXRWSkMb6ROeiipAw0wv5hUO+CAOomFwdp/BShGVfu4tBpiWJUEQhWXQJBzWEb
 kGkAPp4pzfhNK3jbcODd03/tQ9p0AxjUolc4phMJudx8flGJ+vhgeCwgS85t1wFKrUssesIMMd9
 uSQAMldgunGCc7DTDINvvv9x7CJgzv1A0WM/8AqN24OgcSHa9tvCbSAwta4fO12LdHKdnwy9VN4
 zHND2PbdTRrbUrgSG0/awNUR882v2e5lb/6doD6CBxhumyLxaoWrN1Adi7mFxJWTdFDVg6b20gg
 wYDwbM9JjA
X-Received: by 2002:a05:6214:5294:b0:921:332b:a4e6 with SMTP id
 6a1803df08f44-92134a370e9mr221827236d6.16.1795463932143; 
 Mon, 23 Nov 2026 11:58:52 -0800 (PST)
X-Received: by 2002:a05:6214:5294:b0:921:332b:a4e6 with SMTP id
 6a1803df08f44-92134a370e9mr221826706d6.16.1795463931525; 
 Mon, 23 Nov 2026 11:58:51 -0800 (PST)
Received: from [192.168.68.101] ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-92134a0c33fsm112529366d6.36.2026.11.23.11.58.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2026 11:58:51 -0800 (PST)
Message-ID: <841c86f7-9b78-4486-991e-ccec2eede0ec@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:58:47 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] hw/riscv: iommu: Support automatic PTE A/D updates
To: Gong Shuai <gsh517025@gmail.com>, tanchi25@mails.ucas.ac.cn
Cc: alistair.francis@wdc.com, chao.liu@processmission.com, liwei1518@gmail.com,
 nutty.liu@hotmail.com, palmer@dabbelt.com,
 pierrick.bouvier@oss.qualcomm.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, zhiwei_liu@linux.alibaba.com,
 gong.shuai@sanechips.com.cn
References: <20261113151251.30618-1-tanchi25@mails.ucas.ac.cn>
 <20261117143010.1286497-1-gsh517025@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261117143010.1286497-1-gsh517025@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aDEbfwY1dA7tZvIG2WSdrBKz9TsyJqpp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX08hAp6q78tap
 1PZ8R3uq9b0OdlyCIOlIGfqa7G3//sxJfEEu1pTcLmfTtZcemSnjtlekFfhBD/WzQg75/sw3Hpe
 PIVNhePEPAmG2veRn5WDt50BDzPpBbc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX/0Xc3pSV35Ch
 MaqEQFXwmjksTsF0aFOF6uRCg3Uxr9+MQln1zSkXU/Lt3x9mISmgVmbzgS5HI4lsmiSzEY+Kelo
 QX0xqPUAtG60MhbxtrT1M6cJH9u5xGxSGlW1HYjOJLTvQQ8HHvOTAbyo+qLdOeLX4Xgy326ZCCa
 BzFm+4lsbjNu9fY1LkuqcwCyl1tnxESYAJHVgfDOHI6KwCJWN4JCz5nAhrjoTW4M+QhTASB9bFd
 FviN7GOKMCIbku4sEBSbL3K5YQTqKuK8EhbL8pEKx6+PYCFImvV9CZJhewwVqsoExkhOZtIkCgy
 anPWTUpgoamCFNNxl+bgKxAuZ/1SmiPzLZUYVi5ixkyaM+bpzMrusSgr3/q8cCixfaoNT5cZp1c
 8lDm0okhSlS7jkFzrR1WNKl+LXq6X3X+lNuoKOdyk2ayv0YBqFRgdGiyu2c5ux2sY78v0pti/UW
 /M/uKqjtOH/Hg7AlHMw==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b049afd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=zdCvtm5VhrHzK9re4fMA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: aDEbfwY1dA7tZvIG2WSdrBKz9TsyJqpp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

On 11/17/2026 11:30 AM, Gong Shuai wrote:
>> This series adds support for automatic updates of page-table accessed
>> (A) and dirty (D) bits in the RISC-V IOMMU, as specified by the RISC-V
>> IOMMU architecture. The feature is advertised through the AMO_HWAD
>> capability and controlled by the SADE and GADE bits in device contexts.
>>
>> The first two patches fix implicit G-stage page-table access handling
>> and IOATC permission checks. The third patch implements atomic A/D bit
>> updates using CAS, with page-table walk retries on concurrent
>> modifications and G-stage permission checks for implicit writes during
>> nested translation.
>>
>> The implementation has been validated with QTests, Linux DMA tests under
>> KVM and TCG, and concurrency tests covering CAS retries, PTE
>> modifications, and G-stage mapping changes.
>>
>> ---
>> Changes in v2:
>> - Set iotval2 to zero for S-stage page faults, as suggested by
>>    Daniel Henrique Barboza.
>> - Avoid duplicate implicit_read calculations, as suggested by Nutty Liu.
>> - Document the new amo-hwad device property.
>>
>> v1: https://lore.kernel.org/qemu-devel/20261108143934.129923-1-tanchi25@mails.ucas.ac.cn/
>>
>> Tan Chi (3):
>>    hw/riscv: iommu: Fix implicit G-stage page-table accesses
>>    hw/riscv: iommu: Check permissions on IOATC hits
>>    hw/riscv: iommu: Support automatic PTE A/D updates
> 
> Hi Tan Chi,
> 
> Thanks for your work.
> 
> I have tested this series on my nested IOMMU setup.
> 
> - Outer QEMU: this series on top of master, -M virt,...,iommu-sys=on,
>                -global riscv-iommu.amo-hwad=on, emulated NVMe
> - Inner QEMU: needs accel=on support for riscv-iommu-pci, and
>                vfio-pci with iommufd
> - Outer Linux host: needs hardware dirty tracking and nested IOMMU
>                support
> 
> Test flow:
> 
> 1. Boot host and guest, do NVMe I/O
> 2. Clear host S2 D bits and trigger GVMA inval in the inner QEMU monitor,
>     use command: calc_dirty_rate -b 1
> 3. Back to guest shell and do another NVMe I/O
> 
> It completed without a guest hang or I/O error. With temporary local
> debug prints I could see en_s=1/en_g=1 and implicit G-stage page-table
> walks.
> 
> One host-side workaround is that on the host I need
> echo never > /sys/kernel/mm/transparent_hugepage/enabled
> to avoid an hang with THP; otherwise calc_dirty_rate -b can leave the
> guest stuck.


Can you please clarify if this THP hang also happens on master?  It's not clear
to me if this scenario is already broken or if this automatic PTE A/D work is
exposing it.

Even if it's a kernel/KVM side problem (as Tan Chi mentioned in another reply) we
should be wary of adding emulation changes that can regress regular software
usage.  At the very least we should document that we're doing an emulation change
that can break software that doesn't have a certain workaround/patch.

Thanks,
Daniel

> 
> This is only a limited positive test. A Linux guest is not suitable for
> constructing negative cases so I would not claim full Tested-by coverage.
> 
> Thanks,
> Shuai
> 
>>
>>   docs/specs/riscv-iommu.rst |   2 +
>>   hw/riscv/riscv-iommu.c     | 254 +++++++++++++++++++++++++++++++++----
>>   hw/riscv/riscv-iommu.h     |   1 +
>>   3 files changed, 232 insertions(+), 25 deletions(-)
>>
>> -- 
>> 2.53.0
>>


