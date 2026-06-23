Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2023CCDB46F
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 16:10:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wc3hc-0000yE-Nv; Tue, 23 Jun 2026 12:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wc3hb-0000xm-5h
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 12:10:19 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wc3hX-0001cn-Ne
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 12:10:18 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65NBXbPl1155214
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 16:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Nn68GzsSOPTN4V54dVGdEL6Il1YL42paCKU0WkAvG3o=; b=cjOigWNm6r5CFP8K
 Z3yE2KPZaImFdN8VAo/5lQPG5F7KN9JcI9zIYLwRgA4GhVHtn8M8MdF9328jPyTV
 HHOCoQJXhE1saoBR/Us0TpBP3OH/bEqUn/yJPkB7WAAfQtlcqOlD+V/3ZMSyOd7y
 U2Ry+5FRk2IfOe/cWnu9NPTFLXBLTkVADQosNW6LifiE6KIJDspiyUjbgCjIn7sg
 ZD0+1d2OO6uWMwMdbhif798ccyd5yQO8KZ2fJU5zUPwi/+IKe7LX24DdDVidLzIJ
 jKOnM2dES0guDJE9GntLQ+a6y3Ev6THsageo99rcc0goSQWnd7xlIY5Y3SU76aPD
 yFygnQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr28sgah-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 16:10:12 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-30ba395b047so6157232eec.0
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 09:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782231012; x=1782835812; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nn68GzsSOPTN4V54dVGdEL6Il1YL42paCKU0WkAvG3o=;
 b=eKtr7dg7sym+PAAlLiUGuFUy6dgaxbG9HdnEABxwzYpO69vgV5cIqgH4prS6C+LrvR
 UBGlBtmRiMHE3prB4naCYjb0t/4UDzuypDa+3J9TLbYo12O+MWLB55zGw/B+6vscOjSR
 7X/2AI1ZX870rSKwJ2UQddOiDbf2azJAOPZigqRTdqYLhu40xQP1cuLU+AfBJ1FKdfMp
 mqbnggcSeunah5OtbTMVzrHF//4yoX87n/qcOW7GSAJAA4Ybk940hMZ6CmLMGprJsW9T
 Pin612fnMGlVTXoogJ/1vaJqpSbTacQIUxhAHQaVq3EUu8EiOV4Z8U3idVkwbxjLwl0B
 JdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782231012; x=1782835812;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nn68GzsSOPTN4V54dVGdEL6Il1YL42paCKU0WkAvG3o=;
 b=FdDKI30gLde1ZWxhEQhyAflCYxPZE+deciBbBroD3txzLol+y7h+7ppYuPYXtyFeVA
 CWnsAKM3rVzHToG0K7/XGa7+YrSDMxw9VMOYc7RKkPAMv9VLIYMBCd0jRhTd4HzOlBjk
 bPTqSkCs7DkesxCLYIekZ7DznLJilfkz0V2JFp0wX9amBeodx+QhqEZRO1DZCtcWYcXu
 JFJo9lSOASxVlqWut1nC3DMnAH9tHTx1FQJa9cvAQLT0YTSqbkH9fQecY+JVOFsNekxG
 VileT75+k+A0k+aBaVB7xi/4SlOKdQSGZbmuGyppskTJPPMUOu0HnxfmHcyZ+vw53k7y
 iZwg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrJBbZgq9qCK1IVPc+LFXgAv9WXXVI0DyiZXJ5Qm54SR864c6F1vcdHtUXrvxA208MEUNnREK+ZrWo6@nongnu.org
X-Gm-Message-State: AOJu0YxVcRPkM9tfjp5Glw47vyZtaEzt1bhjIxJ6P65VW4Yxkl//zCd1
 UBkS5wXcIxExfJHW0s0RUlQwSUxuEy22QPBS2vLagSuafbzBREoi7r2xxrDT6E56rEtbynmJdsJ
 t90EAnbsH9FkubbprIG0D0+HBcYWvLQyjcfEtjH7DNvLzyOFafmMMb+nobQ==
X-Gm-Gg: AfdE7cnRDFZgV9waTbGB8kV9VI5ME765ySIn0ou8rNlP0J5orZ0F8PcBmEKTnOMu40s
 /qY+gLKlwlAA/Bmhv2PL5DJ+Eo4J/t7mq33r43dxJBKre08o7BNoUFJNvHV8CJ+iKVclcyyrYSy
 I/rUywter5qDOKw8u34NRFbMXEaKpNlCWmEemvgm//qC3gMBQkf1G6NysahmKQeUIEPFSGIitVo
 R9Wd53roZh5PFdyMnPQFOlhxqzfeKOIMso+wr3lhmCZTlED6SbIPsJZ7vlt3Kd4c1/9CwtiYLvO
 2Vt7FDbU4ZRgDiikaAOI1RLnjI/AY83L5/VKco9EEOqtZBK/FT+qKfJYLOC6E5FdaCaiIhWockW
 fHDrhxZyE8MD3iYXG945YAtzZwOWJE+O1ZBEcM5VeXg5a0sRTvx+noMvVrBjEDwBZ7PdTNSzXfC
 UPtGI=
X-Received: by 2002:a05:7301:9f0f:b0:30c:5534:e6f1 with SMTP id
 5a478bee46e88-30c5b962df4mr2726551eec.29.1782231011558; 
 Tue, 23 Jun 2026 09:10:11 -0700 (PDT)
X-Received: by 2002:a05:7301:9f0f:b0:30c:5534:e6f1 with SMTP id
 5a478bee46e88-30c5b962df4mr2726511eec.29.1782231010980; 
 Tue, 23 Jun 2026 09:10:10 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c1bd8d779sm17030447eec.17.2026.06.23.09.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 09:10:10 -0700 (PDT)
Message-ID: <0f2205d0-06b5-40ad-9952-e18a6a951078@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 09:10:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/24] target/riscv: move TCG files and fix --disable-tcg
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu.zevorn@gmail.com
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
 <52c3605c-345f-43d2-8cc6-794980c805fa@oss.qualcomm.com>
 <50ce1e98-2c1f-4cbd-b191-1eac324b71b6@oss.qualcomm.com>
 <704cfba3-e92a-498d-928b-877f7f7641fe@oss.qualcomm.com>
 <9d2737e3-34f0-4f68-813b-37059615bced@oss.qualcomm.com>
 <CAFEAcA8660BZOmX_KXeF7JJaJwgKO3zSRDEmJURg27FK=tqbZg@mail.gmail.com>
 <df4a5857-ec4f-4d4f-bc08-1a9c5caae100@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <df4a5857-ec4f-4d4f-bc08-1a9c5caae100@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzMiBTYWx0ZWRfX5txLy19KISNu
 X2BcUfAgyTDlUkh8+TlolgK7jxD02+MI2u8lqD7QhlU9IEUhqghg/WpxBaUn/67mVftnZRvV5HR
 ZzmSmQW3MeKz0A1a7Gd9DKPWpBaOKsQ=
X-Authority-Analysis: v=2.4 cv=b4KCJNGx c=1 sm=1 tr=0 ts=6a3aafe4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=N8n3KahPn3zQMflmis8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: v2jEupuA1vjiaqPOMpWVYvJxe-K0Fr5Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzMiBTYWx0ZWRfXxWrNpfO0ekbK
 h3oOAA7fUVPjuVNJu0L7vtxL0wTT2p2ryKB8lC8/OCHfiScfQzdDgc86fTrWlDScolaAFD+4YDZ
 Pis8B5Bl06BpsMgsc48AIYcG6RY3MycgXn4t4BibN7hyiFGM6nTdelwO/UnPNpfh20GqZYNWcYh
 E2mfbwr9oNdPXi1TLUW4m6+8E1zGspeFIu8g/K+KCKKPLQobBYKmbvS+JTAcq+YpuFMtzZ757VS
 g2YL1lfIEzHfyWD2kmIGEZbmf6m1TiepZxJDa7MgZxJCHsxlvtBrTrr4sXvARe86ivsBoAZdWX/
 lNqlMHRgmocxDfJTVeCkZFIG5oERDjYpemRSRwbk/6S6YeFNH3GRLYUlcDMepip/BDBxtHVAGjH
 EHwO2GWSTwfmh/VJCRiZ+c+MW7mDdUj1m07WbqoQHfYHDwakCfNfUWeuRDcNWgQCzQEMON813d3
 XkP14Jy1X2z3I3LfaoQ==
X-Proofpoint-ORIG-GUID: v2jEupuA1vjiaqPOMpWVYvJxe-K0Fr5Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230132
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 6/23/2026 4:38 AM, Daniel Henrique Barboza wrote:
> 
> 
> On 6/23/2026 6:58 AM, Peter Maydell wrote:
>> On Tue, 23 Jun 2026 at 10:49, Daniel Henrique Barboza
>> <daniel.barboza@oss.qualcomm.com> wrote:
>>>
>>>
>>>
>>> On 6/22/2026 6:34 PM, Pierrick Bouvier wrote:
>>>> On 6/22/2026 2:23 PM, Philippe Mathieu-Daudé wrote:
>>>>> On 22/6/26 22:52, Pierrick Bouvier wrote:
>>>>>> On 6/22/2026 12:31 PM, Daniel Henrique Barboza wrote:
>>>>>>> Hello,
>>>>>>>
>>>>>>> This series looks scary but it's mostly trivial and mechanical work.
>>>>>>>
>>>>>>> It is yet another attempt at fixing --disable-tcg.  We have a recent
>>>>>>> work sent to the ML [1] and we had Phil's attempt back in 2023 [2].
>>>>>>> Phil's work didn't get merged and it's now too hard to rebase and
>>>>>>> revive, the most recent attempt got misled into the 'what is
>>>>>>> common code
>>>>>>> between TCG and KVM' dungeon.
>>>>>
>>>>>
>>>>>> It seems like series does not apply on top of master, would that be
>>>>>> possible to rebase it?
>>>>>
>>>>> For some reason the RISC-V series are handled distinctly than the
>>>>> rest of QEMU, Alistair queues work on his repository and developers
>>>>> are custome to base their series on top of it (otherwise Alistair
>>>>> can not apply them on his tree and asks for reposts), see the
>>>>> riscv-to-apply.next branch on https://github.com/alistair23/qemu.
>>>>
>>>> Unfortunately, it makes it hard to run any kind of automated testing,
>>>> especially for series like this that target specific configs.
>>>
>>> Don't we have ways of saying in the commit message "these patches
>>> applies
>>> on top of these other patches" and then the tooling would deal with it?
>>> I remember patchew doing stuff like that with that "Based-on:
>>> <message-id>"
>>> tag.
>>
>> Yes, Based-on: is our convention for marking "this patchset needs some
>> other one to be applied first". But that should be the exception rather
>> than a common case -- if patchsets regularly need to be based on
>> something other than head-of-git, this is I think a sign that
>> maintainers are not sending out pull requests frequently enough.
>>
>> I would prefer it if QEMU didn't develop kernel-style "subsystems
>> have their own particular workflows" fragmentation -- I don't
>> think we're big enough or that sub-parts of QEMU are sufficiently
>> well separated for it to work out well.
> 
> I agree that rebasing things on master is better than rebasing it on the
> maintainer's tree.  And we could make a better job at informing
> developers that
> submitting a patch for qemu-riscv, vfio or any particular subtree, means
> that
> the patch should be based on a maintainer tree X.
> 
> The thing is that sending patches on master only works if master is
> always up
> to date, and that's not feasible with our current style of merging PRs. 
> This
> series we're commenting on is an example: it doesn't apply to master
> because
> there are pre-approved RISC-V patches in the maintainer's tree from 2
> days ago
> (also my patches, I might add) that caused conflicts that I wasn't aware
> that
> would happen.  This conflict would have to be dealt with at some point
> by myself
> or the maintainer, and it's not like 2 days is too much time without a PR.
> 
> We can argue "this is an exception that doesn't happen that often, we
> should
> stick with using master as a base", and to a certain extend that's
> true.  But
> then this sort of conflict happens again, then again, then again, it
> comes to
> a point where it's easier to tell developers to use the maintainer's
> tree instead
> of master.
> 
> Maybe I'm downplaying the problem because I've been sending stuff based
> on the
> maintainer's tree since forever and got used to it.  IMO, unless we
> decide to be
> like libvirt and create the "committer" role to allow trustworthy devs
> to push
> stuff to master after acks, making it more feasible to expect master to
> be up to
> date, I'm afraid we're closer to a kernel-style workflow.  For better or
> worse.
> 
> 
> Thanks,
> Daniel
> 
> 
>>
>> thanks
>> -- PMM
> 

In this very specific case, where base patches are needed, maybe it
would be better to make the required commits appear in this series, and
mention in cover letter that patches 1-N are just coming from another
series and are already reviewed/approved. IMHO it doesn't hurt, and
reviewers are free to skip commits already reviewed.

Or, a solution I'm not fond of but I ended up adopting most of the time,
just wait for required patches to be merged on master before posting the
series, and work on something else meanwhile.

Ideally, yes, it would be better if maintainers could send PR more
frequently to avoid creating those intermediate staging trees. The
faster we merge, the less conflicts we'll have.

Regards,
Pierrick

