Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C677ECDB471
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 19:17:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wc6cO-0003Cy-B2; Tue, 23 Jun 2026 15:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wc6cK-0003CK-Rp
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 15:17:04 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wc6cI-00052N-D1
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 15:17:04 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65NHrwsn1156160
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 19:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yhlb1KwFr8oSRcVJExCqe1VmxOor+2a0BhQ8GbaUWIc=; b=Tzh2Wa/QlY/S9UPO
 IenhuwID8lP95r8Dj3FlNR7WtVwW3oP6RYM3Vfqc3zmMHdnDsK5F0BeZtLAa5bct
 7+Bp/mRU2X262Z4rMusqdXD9qNyURNZ5a88kRfPZbReJIclf//Bynoj+TAgwwIes
 C5cOF6AOILJj/zsd8TPq2NYUk1wGaxDcapvcobDea98m5cdNE5b/1a7rJ6jKEMd/
 mGMmGSkMSCd6gEQ19drrTZaR6fc2mzGUJKI0swgrwJN/yvIVwVYgLHna3LOyOF1n
 +UTtVbgYeMR4HJ9r81n80ijeWhrJrvhIMGSiKtHC8TXCKzzlcZKstg5R17jn6wY0
 22VadA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr28tbn6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 19:16:59 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-30c0a27ad86so536958eec.0
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 12:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782242219; x=1782847019; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yhlb1KwFr8oSRcVJExCqe1VmxOor+2a0BhQ8GbaUWIc=;
 b=VTeaSdHpymGfb4l+uCdz0Lk3n0YIDok7x7ZRrc2nZaXpuR07Hvm16xvGH3qHpIRFOU
 729ww175R4XynqhNWTmHWj/TND3MK3O8ph87hSg764Pogm+oq8qMgy3LqY1OzNUFcfXx
 OjOQ5iAOvvJ2y7EE+i0YNi++DejrmIVpA+cc47KjJRf+R/HkwuoVOGwHbs1yyHZlo4qc
 dg/l/9sqcBvrfks8WuXtbjAic15PbE+viDOw8NZQZMJ/ssWsFpRbeb28xNd/q4cxHM4B
 jjYOxZXYwQq4AoJSGvAMA8rMmC+y5v4fKkEk/gd7OnTpIzX098lU7/6jeQ1H5nN56Tow
 I0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782242219; x=1782847019;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yhlb1KwFr8oSRcVJExCqe1VmxOor+2a0BhQ8GbaUWIc=;
 b=gYoalVdh7CoPjUTGwX3KRGXiLkRyuXIkNB4bDr9fsRtKuJlco4Gcu/8gL9cqoC0rhq
 leDJyondw4Rw2H9leg94voD/xyEPtTil2zsk7Pj3O0Lu6QtP/+afWGp2/UjZJhxmGM7w
 Zc8IjWMdFiCF/6r7fbm8K/W+pcLytg6X04zJqLN9F2lrTy9cC8vT2Yvfs1q/qmhH+Kly
 XObu4eGcjq2yFfOcMR0HiOalS0l1a2dOmg+zzzl1rbrEyelueUzmv8dxTxU73g7waVj5
 c2GPBy/cA4VmksBAeLpl8yOHANrNaUs4tt72yvshSacDXOu9FlAUDrwojUcQ961CQKb3
 XTPA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpWNzAqHHOdlGGVtghx2jOkB7tcuSPBeCX9oIIDFMzLj17BkowhOUyPJpL9Je434lD1/nzoqRIPxRri@nongnu.org
X-Gm-Message-State: AOJu0Yy27IkhEofPeu3GKXqvL3MoDwXgA9zSMK1h1wwE5egm/Ohp0emK
 OaNrkTz4DhDTh9ZqnjYihj0x8S5hxtfHyJxOfH7Ydu3WEOthcDjr48S3COPCfbC/XzCUk2sQcBq
 S2x3/e8aysfz+SgzD+SUJJM4nb9lQkCabwJlHI/LkHHUONQG8lCtwMVAjww==
X-Gm-Gg: AfdE7cna8RVFLaEqa/p2hHmVeAp5mmNUQiQ/0AqUl0dCK2KPcIocuPXdGSqdZGro5kV
 8eP5PGu9SgU3kXzkl/ThKMcljVGDKo24SvvotT6I4xPvtBjLgQu2uinbIZ3M2xKAcIlkZGXSTCK
 Ap1N7w28dKNEMOHrhAqkfWXIHuI7/u5SOCIBKErFS5OCOXtOo03PQDX7AmXM18gxYBkQPP1o7Cn
 D9WMBHwGnHkqTt/Yoph6kb6INN9FZAcGs1DGMMLvM93/6MgQPEtInur3BMKPQWukiNxvvnbmHBm
 DDIr7Q9Q8eVcagvENj5e4BUWnTvOrquTHZskFd8H8aen93QYSkf95OIPRm0WuRuW9ntTSWH/hP8
 RQD4TLdnh2vJJIu3u0fPEAtCIhPcm3uGsygz4aKwZjHMh058+K8Q7jlIc4jQKIEARYtKf9xvCCE
 aHltM=
X-Received: by 2002:a05:7300:748a:b0:307:37a4:15dd with SMTP id
 5a478bee46e88-30c69372685mr372838eec.26.1782242218686; 
 Tue, 23 Jun 2026 12:16:58 -0700 (PDT)
X-Received: by 2002:a05:7300:748a:b0:307:37a4:15dd with SMTP id
 5a478bee46e88-30c69372685mr372794eec.26.1782242218062; 
 Tue, 23 Jun 2026 12:16:58 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c1bd8d799sm17097667eec.19.2026.06.23.12.16.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 12:16:57 -0700 (PDT)
Message-ID: <d83a2e21-403f-4146-b129-4d9ee264282a@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 12:16:56 -0700
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
 <0f2205d0-06b5-40ad-9952-e18a6a951078@oss.qualcomm.com>
 <fe77f7a1-1a31-457c-9dec-e1b49cd35371@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <fe77f7a1-1a31-457c-9dec-e1b49cd35371@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE1OCBTYWx0ZWRfX+l7YKG37LGWG
 O37a/xLJ+F301kz+kNn6Dzrzfta/kBuLDKp/tBC7SvCRiI3PGyPfxt7JVGCONoORqO8hsHaJh2Z
 Q7CXwnTidgsCMdRKShkmlDMpUv64TCk=
X-Authority-Analysis: v=2.4 cv=b4KCJNGx c=1 sm=1 tr=0 ts=6a3adbab cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=qCCEDB2cpYgcoe1hdosA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: -jEPri63u44h_TL4DI0OJY4zfTl7BTbm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE1OCBTYWx0ZWRfXynMpM8gz+zQf
 4UZMT8b9ggiVwttyDpPOdbhVG9UFl1vbFd+P8g/O8+6cyw7QB8ydcYBxm1SmdpKIbGYLvgA0A5o
 R3vuoRZ/3TWoOgODHxqOMmDf0/WdsojbSp86YT2f9xljNqx5wfgsARJBtmb6ucUnc/OLErIah2r
 UsimeEdcI0mULdt07bus9bNslbD11yXQChoYZ+jBgseh2Y+NCWylEyHCMSHUmmwIGVGbcFipaiG
 cj4l+8DcO6cuSLvXl6K7mfNyenCrN8k/BWn1Y/awEvHKGSs0U2n1wsjamBjsg41C6V1TJpd/5VK
 q7GpBnUZ29l2/Km1H+yBHtoOntZlWBtkEA9MU+pfJFPXveAnO022OwN0DXcEVsle8u9EpNF0csq
 x0q7bYvgnIcyiZ0wA3jCLzW4tR3EqKc5XAE6JP2srWqDgZCaYNmJX6Jy7aT8qNWxhiYr0UPf5Te
 QLBN44G80H4COFSuO9Q==
X-Proofpoint-ORIG-GUID: -jEPri63u44h_TL4DI0OJY4zfTl7BTbm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230158
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

On 6/23/2026 12:01 PM, Daniel Henrique Barboza wrote:
> 
> 
> On 6/23/2026 1:10 PM, Pierrick Bouvier wrote:
>> On 6/23/2026 4:38 AM, Daniel Henrique Barboza wrote:
>>>
>>>
>>> On 6/23/2026 6:58 AM, Peter Maydell wrote:
>>>> On Tue, 23 Jun 2026 at 10:49, Daniel Henrique Barboza
>>>> <daniel.barboza@oss.qualcomm.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 6/22/2026 6:34 PM, Pierrick Bouvier wrote:
>>>>>> On 6/22/2026 2:23 PM, Philippe Mathieu-Daudé wrote:
>>>>>>> On 22/6/26 22:52, Pierrick Bouvier wrote:
>>>>>>>> On 6/22/2026 12:31 PM, Daniel Henrique Barboza wrote:
>>>>>>>>> Hello,
>>>>>>>>>
>>>>>>>>> This series looks scary but it's mostly trivial and mechanical
>>>>>>>>> work.
>>>>>>>>>
>>>>>>>>> It is yet another attempt at fixing --disable-tcg.  We have a
>>>>>>>>> recent
>>>>>>>>> work sent to the ML [1] and we had Phil's attempt back in 2023
>>>>>>>>> [2].
>>>>>>>>> Phil's work didn't get merged and it's now too hard to rebase and
>>>>>>>>> revive, the most recent attempt got misled into the 'what is
>>>>>>>>> common code
>>>>>>>>> between TCG and KVM' dungeon.
>>>>>>>
>>>>>>>
>>>>>>>> It seems like series does not apply on top of master, would that be
>>>>>>>> possible to rebase it?
>>>>>>>
>>>>>>> For some reason the RISC-V series are handled distinctly than the
>>>>>>> rest of QEMU, Alistair queues work on his repository and developers
>>>>>>> are custome to base their series on top of it (otherwise Alistair
>>>>>>> can not apply them on his tree and asks for reposts), see the
>>>>>>> riscv-to-apply.next branch on https://github.com/alistair23/qemu.
>>>>>>
>>>>>> Unfortunately, it makes it hard to run any kind of automated testing,
>>>>>> especially for series like this that target specific configs.
>>>>>
>>>>> Don't we have ways of saying in the commit message "these patches
>>>>> applies
>>>>> on top of these other patches" and then the tooling would deal with
>>>>> it?
>>>>> I remember patchew doing stuff like that with that "Based-on:
>>>>> <message-id>"
>>>>> tag.
>>>>
>>>> Yes, Based-on: is our convention for marking "this patchset needs some
>>>> other one to be applied first". But that should be the exception rather
>>>> than a common case -- if patchsets regularly need to be based on
>>>> something other than head-of-git, this is I think a sign that
>>>> maintainers are not sending out pull requests frequently enough.
>>>>
>>>> I would prefer it if QEMU didn't develop kernel-style "subsystems
>>>> have their own particular workflows" fragmentation -- I don't
>>>> think we're big enough or that sub-parts of QEMU are sufficiently
>>>> well separated for it to work out well.
>>>
>>> I agree that rebasing things on master is better than rebasing it on the
>>> maintainer's tree.  And we could make a better job at informing
>>> developers that
>>> submitting a patch for qemu-riscv, vfio or any particular subtree, means
>>> that
>>> the patch should be based on a maintainer tree X.
>>>
>>> The thing is that sending patches on master only works if master is
>>> always up
>>> to date, and that's not feasible with our current style of merging PRs.
>>> This
>>> series we're commenting on is an example: it doesn't apply to master
>>> because
>>> there are pre-approved RISC-V patches in the maintainer's tree from 2
>>> days ago
>>> (also my patches, I might add) that caused conflicts that I wasn't aware
>>> that
>>> would happen.  This conflict would have to be dealt with at some point
>>> by myself
>>> or the maintainer, and it's not like 2 days is too much time without
>>> a PR.
>>>
>>> We can argue "this is an exception that doesn't happen that often, we
>>> should
>>> stick with using master as a base", and to a certain extend that's
>>> true.  But
>>> then this sort of conflict happens again, then again, then again, it
>>> comes to
>>> a point where it's easier to tell developers to use the maintainer's
>>> tree instead
>>> of master.
>>>
>>> Maybe I'm downplaying the problem because I've been sending stuff based
>>> on the
>>> maintainer's tree since forever and got used to it.  IMO, unless we
>>> decide to be
>>> like libvirt and create the "committer" role to allow trustworthy devs
>>> to push
>>> stuff to master after acks, making it more feasible to expect master to
>>> be up to
>>> date, I'm afraid we're closer to a kernel-style workflow.  For better or
>>> worse.
>>>
>>>
>>> Thanks,
>>> Daniel
>>>
>>>
>>>>
>>>> thanks
>>>> -- PMM
>>>
>>
>> In this very specific case, where base patches are needed, maybe it
>> would be better to make the required commits appear in this series, and
>> mention in cover letter that patches 1-N are just coming from another
>> series and are already reviewed/approved. IMHO it doesn't hurt, and
>> reviewers are free to skip commits already reviewed.
> 
> That's fair enough but I wonder if that won't scare people away with
> even bigger series :D  in this case here I would need to either send all
> the queued patches, making the series go to 40+, or I would need to triage
> which patches from the queue creates a conflict with this work and send
> only those.
> 
> Now, as for qemu-ci ...  How farfetched it is to make it read a specific
> tag
> in the cover-letter, e.g. "branch-id", that can point to a gitlab/github
> repo with the patches, and use that code base instead of applying the
> patches to the master branch?  Then for the next version of this work
> I could do
> 
> "branch-id: https://gitlab.com/danielhb/qemu/-/tree/riscv_disabletcg_v2"
>

Based-on: is a QEMU specific tag, that is only understood by patchew,
and no other tool to my knowledge.
b4 has base_commit, which allows to give a specific base, but not a
specific repository. I'm not aware of any b4 tag that allows to mention
a base series. It makes sense, series are not branches, and stacking
them comes with a lot of problems.

So it seems like email workflow is quite limited in this regard, and the
only way to deal with it properly is to wait for base patches to be
merged, or include them in the series.

From another perspective, the same problem would exist if we would use a
forge like GitHub or GitLab. It's not possible to stack PR on top of
others, and only solution is to wait, or duplicate patches. IMHO, it's a
sane default, as it forces correct ordering instead of allowing chaotic
development.

> and the tool would still work.  If there's no "branch-id" then it assumes
> that the patches are to be applied on master.
> 
> 
> And yeah, in an ideal world the problem goes away if we just do more PRs
> and
> strive to keep 'master' updated.  I'm just thinking out loud about possible
> alternatives until we reach that point.
> 
> 
> Cheers,
> Daniel
> 
>>
>> Or, a solution I'm not fond of but I ended up adopting most of the time,
>> just wait for required patches to be merged on master before posting the
>> series, and work on something else meanwhile.
>>
>> Ideally, yes, it would be better if maintainers could send PR more
>> frequently to avoid creating those intermediate staging trees. The
>> faster we merge, the less conflicts we'll have.
>>
>> Regards,
>> Pierrick
> 


