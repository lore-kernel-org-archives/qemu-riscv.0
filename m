Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E5FCD6E44
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 May 2026 12:19:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSZhz-00062B-1N; Thu, 28 May 2026 08:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wSZhs-00061Y-DB
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 08:19:27 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wSZhp-0008HJ-Mp
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 08:19:24 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64S8vmDR298300
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 12:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AxNr27xJmLQwJlnpLrQqQmNkk04hpJwrt4IDQXHl8QQ=; b=YbdykUL3y6T2JhUB
 SSlWucU49bGiT0iv7LNTcIXqgch61vbzaBAtwBqN0/YuldQO68NBk/ayF1ZMmt+3
 SB4VOxGzowkGFf6955QQcQBaBE61VwT3QAle/RNy1sAJx9Js2VYj4UfUEqBRkHNM
 1s2mNJxlcHiWdN8rExZ94rqMOi3R+IUl+TxVtyHYFbvoxwwKmAgUSAsbP5nLvJPB
 htEgl9TngABzHmrH3K9RHJ8IeTTJ2lxoV2xarM8aCN6xwq178bZyNtctnzZj2X/9
 WrIMQoxXisC63nvd2A1L5ZohhNU7G03x5pzQCcD1IJiBCNSxgthxMnU4+epAPa58
 Z5X7eQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yajnh8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 12:19:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-514cbe73d00so334284931cf.1
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 05:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779970759; x=1780575559; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AxNr27xJmLQwJlnpLrQqQmNkk04hpJwrt4IDQXHl8QQ=;
 b=e0RSiSHqsgxegWWREW926VdPOXRHRmGut046W5Vwdc1lJqbwZntoBN98KaeKApZV+f
 sjhOBHAdcpCrU5KFLpujLXY488XeW2N2HNQfkvot/0cKkYYZXIW8ZapNW188ygByFOI0
 RqAsjiZfwrPpi4lUHCs2U9zVfrp1n1A+h+3AZR1y8TnSr/3tC8B9b0UuiVjc3dHYiyHp
 wkcGzFxmUBg38ObFgRqEt8lsVNi9FH3jKyJR0oadPt1Z0gLTv+N9AEHG2eNjGehI8VNr
 ru7PaVtJO+hE+6DIhmlH11lA7WeJ6zS8+Xo+aEoMaoy8MWfpv/y+MkuyeGiRauu7XNri
 7JQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779970759; x=1780575559;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AxNr27xJmLQwJlnpLrQqQmNkk04hpJwrt4IDQXHl8QQ=;
 b=KANJDilaZA9mlC4bQ7mtV00/T97a3jVf0Tb1UtGcBqaJrxkASUEqFIumMeenajIfBe
 W0WDxpwaUikwiIdHK5spA7U5kJCvLxmsSzowGrHXChfNshZc9rEuDxw9azJd33ugzsCT
 tGSix97j/qwzSeGS6YJpqVER2fGmGKqFfFkflqrFUhRhHgCICh/gmwEYPezO2EhtOz8u
 F/vhTjH0dY7/DgxlCJI8WYylpqdHEbOlFO4soZpyypRT7iwIlf2LvxDz29Cuih9ou+3s
 xYQAUycg9H+nLPv7o2AUCL3fGfPSDrSEloLwm4StJAUaPsGokWYhx+0CyOIRFPW3GCME
 nScQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8CWk4tUE+0ZOA0yPZafXzBTcFmIQ+1txIkuqhUdvrOKG34y1p8jhswjYkKRnGl9KPfKpJfCv/Kl/mZ@nongnu.org
X-Gm-Message-State: AOJu0YwGXJOCDMkCoiM6Nql4RS1UePfDqDiYzfmsCjd9IcB7uaKuntDd
 DqTUuaioQP+PGCjx9WP9sLwwgxjJToftes8pk4YgQgoVp3oqUJmvBHcKK473LcvzvHV2fqsQZUv
 WZZk6Os4+MCPVAOOPvSRLt5S+lDmrtgPqHHTcjmbRnqpXxx84Llykkxnz1w==
X-Gm-Gg: Acq92OHb2mn4TmtDorSaLZYqHYQlac44FGQYkau2a9ZW/rtaqgAW4hJfDmqx+AqQOad
 bJProyiCLjSpZSzP/bDqbXlTyb9zqO1LSL/1r2HZXoupn7rXamXdAWXp4gv7VJf2JWjuv7yM2pc
 ZRloBio3B0hZeOfbTCeeegM9RmDwKbCDcl1KuG6ON0oKLSwdwQtxz6bhyayLX99F9THtwtSv9GL
 /pTcq9afrrGb+yIo+Xfc8AYhJYArNs0wt23AAcDoEAVpuSja0LHo+2yQZJm50Yah9rV6O95/loa
 pYjzUhT5dNCoi2EAJ7iG4VZ/Jn0wuJeSK0R6MS53I++TDiAQZxRndcYq3xQ2RNC31HMAjEEN7lb
 BcrTvNhZx6+gWnSnbVaCHgXnSel32mtMojY4MKn3lQDoevpmuUJ6yLO5WLbELu4tCxKwE
X-Received: by 2002:a05:622a:480a:b0:516:e7d0:73ab with SMTP id
 d75a77b69052e-516e7d079c5mr276652741cf.40.1779970759064; 
 Thu, 28 May 2026 05:19:19 -0700 (PDT)
X-Received: by 2002:a05:622a:480a:b0:516:e7d0:73ab with SMTP id
 d75a77b69052e-516e7d079c5mr276652391cf.40.1779970758589; 
 Thu, 28 May 2026 05:19:18 -0700 (PDT)
Received: from [192.168.15.43] ([177.170.193.103])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51706af1779sm71769411cf.22.2026.05.28.05.19.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 05:19:18 -0700 (PDT)
Message-ID: <aea1fb23-3d6f-4c0c-b3b7-abdeef78b9a4@oss.qualcomm.com>
Date: Thu, 28 May 2026 09:19:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QEMU RISC-V Call
To: Alistair <alistair@alistair23.me>, qemu-riscv@nongnu.org
References: <e2576b58-9356-4d88-8485-42256b2a2366@alistair23.me>
 <6e25408f-662c-4cd9-93b7-35ea100c81fb@oss.qualcomm.com>
 <81a5c280-973d-4ada-b2f3-3ac4652a2037@app.fastmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <81a5c280-973d-4ada-b2f3-3ac4652a2037@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aaoGZ5QY4NY655IVv6G-CFa2-w6BcUqH
X-Proofpoint-ORIG-GUID: aaoGZ5QY4NY655IVv6G-CFa2-w6BcUqH
X-Authority-Analysis: v=2.4 cv=CaE4Irrl c=1 sm=1 tr=0 ts=6a1832c7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=e/1ukXmujkxnBaF7Br2KEw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=5gouUVbiaFbWkVTVfPYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEyNCBTYWx0ZWRfX+cUP/AhssNpl
 QoFEQoYuhxX+Cg+RnqemOVkGqO/2cdoAbe+3buCmVIk0mcftuLawzxHclq41FTLHbv5eXtIOKCS
 tnUyLxGW3liMhtGd/aheivG8Vmr+U6XTojeqWHksR4ROyUd3X/JWMeNsfOC6xfUHZK+Cneus8Rg
 irkpwsKzv2eW7HDAMFHLlhZ7rB5BPwKgAAvhG9G4wXUeluiIj3NXsK7pkn2oNMwU9iz3WKV6sCs
 GZMEiXbIO+xS8o2H0Gd1A3box1iZth2J/WQMgrVkBik6o8beh8zB8IMah/ha17CDXx8p9XY6/2m
 PtQ6z8eUGlmXKiXcRot2DZrxn3oVFZLg6cc+LlVYKHB5bDvVypoBVulzONXJN6nfAcr93JD36aM
 ffqtYzdKsTi6PyvPn5OSk0wD36vDR4m5Qvm8I+ioWnpLhcTl/GUjFTca+gFYKrLLxkb4DNK7fs9
 7+bMyxlz+6fgfI747KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280124
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 5/28/2026 8:37 AM, Alistair wrote:
> On Thu, 28 May 2026, at 5:13 AM, Daniel Henrique Barboza wrote:
>>
>>
>> On 5/27/2026 9:15 AM, Alistair Francis wrote:
>>> Hello everyone,
>>>
>>> There has been some interest recently about setting up a call to discuss QEMU RISC-V and the current status.
>>>
>>> So I wanted to setup a chat next week AEST (UTC+10) time to discuss a few things on a call.
>>>
>>> I was thinking 1PM on Monday the 1st of June.
>>
>> Can we make it 10AM AEST?
> 
> Sure! Let's do that

Thx!

> 
>>
>>>
>>> Kind of similar to the defunct RVI QEMU calls that never really took off. I know scheduling can be hard, so don't stress about missing anything. It's mostly just a chat to spit ball some ideas and get any feedback. I can send out details about the discussion afterwards
>>
>>
>> I recall that we had some difficulties dealing with RVI calendar not sending
>> invites or something like that, but we got that call from sig-qemu rolling
>> throughout 2023 and mid 2024, IIRC.
> 
> We had lots of issues getting meetings setup, it was a mess.
> 
>>
>> Not sure if things got better w.r.t RVI calendar or if reviving that SIG makes
>> sense.  If there's enough demand for it, I suppose ...
> 
> I'm no longer a RVI member, so I can't be involved there. I think individual members got kicked out at some point.

Well that's unfortunate ... if every developer/contributor needs to
pay the RVI membership to participate in sig-qemu then we can't use
the SIG infrastructure for this community call.  It is what it is.


Cheers,
Daniel


> 
>>
>>>
>>> Currently I'm thinking about:
>>>    * Current QEMU RISC-V extension policies
>>>       * We are getting inundated with extension support patches and I can't keep up
>>
>> Spoiler: there's (a lot) more to come ...
> 
> Urgh!
> 
> Alistair
> 
>>
>>
>> Cheers,
>> Daniel
>>
>>>    * Vector cross implementation issues
>>>    * Any upstream issues and how we can make things easier
>>>
>>> Alistair
>>>
>>
>>


