Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06CC606A31B
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 08:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fiiXmDmo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KcXSKfoN
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOsoy-0006Ys-NM; Thu, 05 Nov 2026 03:27:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xOsos-0006X8-MU
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 03:27:38 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xOsoi-0000a6-Ga
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 03:27:31 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A56U3IO4139212
 for <qemu-riscv@nongnu.org>; Thu, 5 Nov 2026 08:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AGN8kwgakg5OiXRUbfKCSwJgdB2YehlHkW5tpwLRG6c=; b=fiiXmDmoIyy24Bni
 sMCaR5DgQufd1AUeMVRlvmqfRCx8usfGB/QhBBG5YCSJI+amrKGxMYhG6O0Lfbrm
 Fji8kOAzlF+ZdqUe/A/kQ2VdNM+ZO22eEgzSvneoa38hqfAuj6+4ckBwOB3NdJQm
 tFAe4IDNJO13LKqvQTEJ8rQOfDD0I/KRu26xcG/k4tQDrM9mFlXQCo2zM6kLWD+K
 xzMK54S8Lm3BUwfg2aL5lk48KFDcUlmD8/TnJhUVBuRDJnca0LzP+89ndGyA8IZm
 vvkjGPKEifcaYAJFz+yndkyYVxyH/6NsDQEY1ltb0UsVv4Kar4dwiojBS+ST9qqh
 iR7seg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrm9v0he4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 08:27:24 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-1383723dfddso2861922c88.0
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 00:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793867244; x=1794472044; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=AGN8kwgakg5OiXRUbfKCSwJgdB2YehlHkW5tpwLRG6c=;
 b=KcXSKfoNAIxUQk01dWvsQEjF7Mm8L9KFjqVckjPyKBXKmI2HTDdbIl7XlWsGcgX6Vs
 HZ6vc0q4N1lR/zyepFW3oFJTw/4hOAD0kTfjfsPNYozweOfRCq5ne0syJvlC/ctR4Jy8
 oPVO1xfQD8/lp4iKUdJGgE5qtEVI3/Xdq8gvHpJVCojzS6t0k25zPlF7AfM6X3UjZ9hP
 zCc9NvgfRUhQlz2oa7YxtCUpXuTewE04kpuK7OrLYQS/HFYkDzfpIPiQiRsHBq3Q1VSf
 V35V0+NN/OH32F9ADb9Wba/I+9LqUq+XWf4FlETeV/macVLitdvMhp8tCqZCeL3a2FUE
 af/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793867244; x=1794472044;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AGN8kwgakg5OiXRUbfKCSwJgdB2YehlHkW5tpwLRG6c=;
 b=Lx+yGb9AJdINo2dtkIWtGZSi6AclThPEqUh0QvPuT/xfkEv+6MJQd1hzIh4Jix9KwH
 J5o0oeDZwn0wsdrWo9Xu2A5N9YQd7CzKJXOASUcBhs8OcgX0PUKPJBUFfInpIZYpLskH
 d7+anZ2h1KzLUR6rVfdV8oPGOPLJexrSry7C23Ki87BszmPZq7kJ7Plzfr/fyWl8P5Q7
 msmc5v+1QlKZoCbKUytKyJu/nqUeX8F9qrV8E9nE3Th4dRrY4q0lBgU5kVLuC2utxxvQ
 8rfyRLpATJ3u1t0USXB24iyFBjL39nLAx1XWsaZQ25cIDotEyfhlsYe8n3uyF18ZeghH
 8FIA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwhHnwLxlI8LTODH+klZpFN6+QhchX8smij2/NROKljbOsr385V9Tu0WIZDDmIL0SVCOXpa2hhBJSRP@nongnu.org
X-Gm-Message-State: APuU4Z/QrSeuOJudGfufoKyX6mFMi0yI0oT/HP6M81AUfDShDAjy06d8
 /q0mKzf0098HuUG/h4tIWSD1ARkK/G6QbvzZc0v5nrGCY8VSA41x4ur4Mw7Au+tZFynHOPDoVnx
 ym9ltn4tm6gDuL2SbqAANxGrS8Dza4dgK+Xqw4i+wqaLdAg18gr36Zx0HmA==
X-Gm-Gg: AYBFou0NYfol9dX1mU8hzkA7Vsm9M46tpZ5zYSZpHO6SQIWjmuv/2XviBp0eRDZfCc7
 Y8MS3NwJTylwU36P8wTeLHeWOeNYPQZHwcF50ykJVjHwv8Pd9qNrBNpj9nJ3N4LqTWCtt5qzcOG
 NOliPjPOlSrMyQaWR9WzbjOoCEIUpVzBt67LuXEMmxB86rU6fGZjBxZ0uYr8W5bItAlU3jEkUAr
 Flimm3/1TMyvnVNrq59O7IMVucIp+iP+17GT5fgqPEO3355y5omPWBK35gtmKLYbZqJfi/pdATw
 pk1ZrenR0HEK+UbPP1spYE+xdmllIvEr4fmOj8C87YhWFAgFYaCue1Di6oo7yqGrxCmZPINbzmR
 iciwvgKGN9+SZhInxUgmR5/uHuDJORlX1YfCccH1UbGO9bHJzhhinLS/ed39Fa7zv1Ku8H2EEw+
 xW0Z8d5mwUhuRi1uPHgz/LWPPjIWaW4sxLyw8RRxunjw==
X-Received: by 2002:a05:7022:92b:b0:144:fb42:52 with SMTP id
 a92af1059eb24-1ac5de4e892mr32994059c88.28.1793867243832; 
 Thu, 05 Nov 2026 00:27:23 -0800 (PST)
X-Received: by 2002:a05:7022:92b:b0:144:fb42:52 with SMTP id
 a92af1059eb24-1ac5de4e892mr32993931c88.28.1793867242680; 
 Thu, 05 Nov 2026 00:27:22 -0800 (PST)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b245c1c127sm14154206c88.6.2026.11.05.00.27.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 00:27:21 -0800 (PST)
Message-ID: <45433754-3cea-41fc-9f45-65a328d0efca@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 00:27:18 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] hw: expand DEFINE_MACHINE to explicit TypeInfo
 registration
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>
Cc: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 Anthony PERARD <anthony@xenproject.org>,
 Felipe Balbi <balbi@kernel.org>, Aleksandar Rikalo <arikalo@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Niek Linnenbank
 <nieklinnenbank@gmail.com>,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc@nongnu.org,
 Alexandre Iooss <erdnaxe@crans.org>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, =?UTF-8?Q?Cl=C3=A9ment_Chigot?=
 <chigot@adacore.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell
 <peter.maydell@linaro.org>, Chao Liu <chao.liu@processmission.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Alistair Francis <alistair@alistair23.me>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-arm@nongnu.org
References: <20261030151539.1872-1-luoyonggang@gmail.com>
 <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
 <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com>
 <aumYOBw-nKQAWdYK@redhat.com>
 <CAE2XoE8Xwevk523OfB+GgwbRu0iVnyD4VNOx81rj7J7F5aq=OA@mail.gmail.com>
 <54851326-3627-2b86-57d6-c338ed4e4b50@eik.bme.hu>
 <CAE2XoE_P2mZAT8wZwzFsTqJTK8nxNSSqJRrOM2T-AJkQjwJHBw@mail.gmail.com>
 <aunnuwhsx9ZOOXBX@redhat.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aunnuwhsx9ZOOXBX@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMyBTYWx0ZWRfX5+IhNzD+ufl6
 J5pxFMsnfroUuZtOjJno/q3FN0fDGTHcgsDalSGNqe18q0WguHeD9d9GTP70NWH4BvBUKX97VfP
 ub1YwbUPNq5I0zjLr8RoBp89TB1Zmdo=
X-Authority-Analysis: v=2.4 cv=KrHYSmWN c=1 sm=1 tr=0 ts=6aec3dec cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=20KFwNOVAAAA:8 a=sYqyBgSLRBUY3L6MHRUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMyBTYWx0ZWRfX5HaWGXDZjjFA
 I7u4YFZjwk0umzIvKq7hxfxvQBjUEGJ2dMEXtIPZQUmxJxtEBg/uU8NyyJ5Mcy9nPggjrusEUcf
 U0W4wNdNY2YUiLPOvS+ceRyPuIp+L/QdtdWrPMkf0DJT0xCGoWVpfDd4noUwDp0s4vfFtt2KBLA
 Yiu+LhUux1txVK+hgabbByTiHHJ14Ix4FY2PoP/cOrTZlO+JvMC9zKJhV9qMT5tgs529iCdVW6+
 11b9lbFKgx70EPwAd15o213Uzz20/LQF/pn1po41lc55ZtVqL8COmP1eUQRa5TATBbGlzTRnYkF
 w96yXoscpMzpknQt7bg+GRGM/EobXl+WWeNUwM/jgNrXdlcTUkYkY+jI40tibBXa3GSKPwl5dn5
 wNGKh0JkJ8Epvbc8W4sPW5II6E2lPwhux/PRhUCS+woLl3GgSQxRyHMYvFM1cnGXoKI1X21RbgE
 hMvdIKbo0lsaWXKp7Vg==
X-Proofpoint-GUID: KLxzYK7In75zhjAnUjoGo38qRuWUbXBz
X-Proofpoint-ORIG-GUID: KLxzYK7In75zhjAnUjoGo38qRuWUbXBz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050033
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/3/2026 5:55 AM, Daniel P. Berrangé wrote:
> On Tue, Nov 03, 2026 at 09:48:44PM +0800, Yonggang Luo wrote:
>> On Tue, Nov 3, 2026 at 9:23 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>>
>>> On Tue, 3 Nov 2026, Yonggang Luo wrote:
>>>> On Tue, Nov 3, 2026 at 4:16 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>>>
>>>>> On Fri, Oct 30, 2026 at 05:51:44PM -0800, Pierrick Bouvier wrote:
>>>>>> On 10/30/2026 4:09 PM, BALATON Zoltan wrote:
>>>>>>> On Fri, 30 Oct 2026, Yonggang Luo wrote:
>>>>>>>> DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeInfo and the
>>>>>>>> type_init
>>>>>>>> function that calls type_register_static(). A later change needs to
>>>>>>>> pass a
>>>>>>>
>>>>>>> That's the point of the macro to hide the boiler plate code.
>>>>>>>
>>>>>>>> target mask into that registration, and the macros have no parameter
>>>>>>>> for it.
>>>>>>>
>>>>>>> Couldn't you just change the macros to take that parameter instead of
>>>>>>> expanding it everywhere?
>>>>>>>
>>>>>>
>>>>>> Problem of macros is that they don't have default parameters, so you
>>>>>> need variants for everything:
>>>>>>
>>>>>> DEFINE_MACHINE
>>>>>> DEFINE_MACHINE_EXTENDED
>>>>>> DEFINE_MACHINE_WITH_INTERFACES
>>>>>> DEFINE_MACHINE_WITH_INTERFACE_ARRAY
>>>>>> and now would need a new variant, with variant for other existing ones.
>>>>>>
>>>>>> In the end, it's just simpler to remove this and add the boilerplate.
>>>>>> It's written once and never modified, so using a macro just save typing
>>>>>> those lines once.
>>>>>
>>>>> For each machine, it is only written once, but we add machines
>>>>> over time, and every time a new machine is added the code style
>>>>> is slightly different. We introduced all the variuos DEFINE_*
>>>>> macros for QOM to better ensure consistent style and usage as
>>>>> new code is added over time.
>>>>
>>>> I understand that the DEFINE_* macros are bloating because of this.
>>>> Indeed currently the only two macros used are "DEFINE_MACHINE" and
>>>> "DEFINE_MACHINE_EXTENDED"
>>>
>>> There are a few machines using some others but these are the most used.
>>> That suggests maybe we should change the convenience wrappers to match
>>> what machines need but DEFINE_MACHINE_EXTENDED is meant to be the one that
>>> allows all parameters which should be rarely needed.
>>>
>>>> ; each time people want to add a new attribute, the macros is twiced.
>>>
>>> Not necessarily. The SECURE parameter did that to preserve previous
>>> behaviour but if you add new parameter changing all callers (which is the
>>> same as expanding the macro that would also change all callers) then it's
>>> just a new parameter added not changing the number of DEFINE_MACHINE*
>>> wrappers. Rearranging the wrappers to make DEFINE_MACHINE_EXTENDED used
>>> less is an independent change.
>>>
>>>> And the usage of DEFINE_MACHINE_EXTENDED is rare and can be replaced
>>>> with DEFINE_TYPES or TypeInfo
>>>> and be more explicit. When we used as macro parameter, we need think
>>>
>>> But that defies the purpose of hiding the QOM boiler plate as much as
>>> possible. New people are confused by QOM and it's easier for them to look
>>> up documentation on the DEFINE_MACHINE* macros to see what parameter is
>>> what and not care about how it's stored in QOM TypeInfo or what is that
>>> at all.
>>>
>>>> what's that parameter means, and for
>>>> TypeInfo, we can directly know what that member is about(because we
>>>> are assigned with the member name).
>>>
>>> The parameter also has a name and documentation so it's not simpler to
>>> look up TypeInfo than look at the macro definition or docs. In fact it's
>>> harder to guess from TypeInfo as then you also need to get into QOM.
>>>
>>>> That's why I suggest keeping a single DEFINE_MACHINE, just like
>>>> DEFINE_TYPES; as they are the most
>>>> used macros(and simple enough), and won't suffer from changes much.
>>>
>>> That means exposing all the boiler plate for all machines other than the
>>> simplest case. I think it would be better to keep DEFINE_MACHINE_EXTENDED
>>> but maybe rethink the existing wrappers and drop unused ones and maybe add
>>> new ones that reduce the usage of DEFINE_MACHINE_EXTENDED but still keep
>>> the boiler plate hidden.
>>
>> Thanks, I'll go this way, remove unused macros, and keep DEFINE_MACHINE_EXTENDED
>> and extend both DEFINE_MACHINE_EXTENDED DEFINE_MACHINE supports
>> "targets" or "arch_mask" parameter.
> 
> Given that we don't need to do general per-arch type filtering in
> QOM, we could just move 'is_available' out of TypeInfo, and into the
> MachineClass, so it is a regular class level property, which can be
> set in the class_init methods, and thus avoid any changes to the
> DEFINE_MACHINE macros.
>

Some cpus need it also, and it's used for filtering purpose at this time
(to avoid duplication at registration). We already depend on this behavior.

> With regards,
> Daniel

Regards,
Pierrick

