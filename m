Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA71CD6E4A
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 09:40:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wV4Z5-0003HN-Qz; Thu, 04 Jun 2026 05:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV4Z4-0003Gv-22
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 05:40:38 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wV4Z1-00071Y-Fb
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2026 05:40:37 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65488cYj313689
 for <qemu-riscv@nongnu.org>; Thu, 4 Jun 2026 09:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9YdSVdULWV9QsfnzZQsnmDQeMltSPy7sm8fj/9xURaw=; b=B1ZUW2VKz5zTr1uM
 qvCRmxEoYFgqcy91q7wmZtBdewspWWrEpxatcWqV4aGzVxLSsVRagPmciDF5XtzA
 RcHmRkMuAaqAizlnF0DuhXvVUvTXyQUrAlh9/+GFiQa9cKDD/0ps3gFyMMDu3nWZ
 WMzQSPi3hz+tKqZArjhGqD1T6svMtZgGb/3oNVMqrZJjwMtVaRTcrx3IBngsg8HI
 g8Jp+FymEv1udW/slV+jS2ikTG9LofDIwGdR954BN/FGrxZneYWeK5cQW0DreHqd
 kSoFtDJUgrud/wVHpX3+538PXoerb1BFpqP+lPg9aAiiJelCi4lYnUhRTGDjJRid
 mfWK9Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy5v1qa6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 09:40:33 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id
 71dfb90a1353d-59d595bfd94so227044e0c.3
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2026 02:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780566033; x=1781170833; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9YdSVdULWV9QsfnzZQsnmDQeMltSPy7sm8fj/9xURaw=;
 b=Ykj0mBmvNrmHEaS/PglU+5nlNhOlHi+Ph9b+Yr+R8HlYPpGaF0E9HKoRjHpl8qDyR1
 dKtG7TAVFiP61poOC+to7quh9GoPFlX1y8nvo7J5nvX/uZwM2cEKyz0cjOTSUBLqj/Ks
 mbdp29R+8X9iOUWlAI96nS/PUkF4Fyjv15Iovbp2VeAOFWDmDyWmM1ZVabqrO3hXSiUt
 ljLUsnDACg5VlqVhcZ+b99pmhnELQTWvMHS2jS3sOPWz7RAUBCiCTY0vARfh2oFbhn4A
 CLB6zXXe89CMOtCiAMkVvMJW1kI8VvdrBGDw77xl6an+sAufs26REQoL9nXmfmS3NsD6
 +O2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780566033; x=1781170833;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9YdSVdULWV9QsfnzZQsnmDQeMltSPy7sm8fj/9xURaw=;
 b=dl30ezULscjGY0HU3DigFBec8rdunCweRi8i8hfNekIAQGj0zCcVb/EujjxUHsPHbE
 lmein9zGSiIXUveG6bP2Q/sbeyJUCSo4OB9j67vWz6T5CerXxJxo79nh3BqZ7/xP93mu
 vfmvRvnX877FL2XjzToFXAlhOSGtAAwYHR6M/Dp7XeJ332W1Zp5Yvi+GD7WN4HQnMI8n
 hU3ehzNByvjhUWyh2fBqLwdrnKPudIGFsIbukpBAbvh7kw2ccBgBRTFkRPIWzgpIvH3b
 b7Z1e7aol16oGmBugTKldCzdY2btFWodaUQIYQLgrIht84eEeC9RwULeB3S0Gqo27vMg
 A0rQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8+EQiIiqSbDVtsPRawOpt6CNlt7JY/C1NCm12zRqw3WnzTU33vdoaChxFveNN0p3xdsS4OQr+vhdWP@nongnu.org
X-Gm-Message-State: AOJu0YzjMLHoy3uS9XMVAuMTiB77gNYdTBG+yaIL8M0Am8J+rGQd/AkK
 xey4wUA+i9JFX6uOQtDgwz9YlvIeG0CTYLrkCLL1qetGizQk368EZLedWHMudbWic9uCt77NFeH
 R1s9obomy0YV9ZQaebbqVmL/pzVjYVDV6Iv5yM2EKrNK+SwAXop5ksG/IAQ==
X-Gm-Gg: Acq92OGY8jaElb4yf3uSM9t+uwi8Kpql08v9wkRnzz9XZqF/RUbputLNhs8F3lETQI/
 F8dZ48TK55ov4e2PybrwUAFMPYKuurTE06SV/QrZCLFkfNqshJpKyGO9Rf+2Ob7oZp8lj67unQq
 vtGNUD04UpAJ6fO7QzkOERBg3ZYQ+2xd+eqFrQWRSGKlpjeafFNKx0CpDHa+2U0LaYfB49wkOfZ
 GN4Eg5QucDTWmNA9ISPXoIck8GquIORuHnoc27idzPKZPXNZO77jU4OALsWZgbJUZXFoTaI8Dtp
 MvvR4WHiPtbWZswpwxShNPi2PT6FzgmBas3+vRwF0z9JQGOU8ZT6DBM5WrXQ4jN4tk2XuSwGaWA
 aWOKO9Uc1VOWx1aw2jliFWzOl9U/Ydus0423emyiZqbYmw3WCz1rP2dsT4kWWfZQvhLtn
X-Received: by 2002:a05:6102:3c8e:b0:6e0:3d72:3044 with SMTP id
 ada2fe7eead31-6ec4c6a62d8mr4258052137.28.1780566033187; 
 Thu, 04 Jun 2026 02:40:33 -0700 (PDT)
X-Received: by 2002:a05:6102:3c8e:b0:6e0:3d72:3044 with SMTP id
 ada2fe7eead31-6ec4c6a62d8mr4258045137.28.1780566032598; 
 Thu, 04 Jun 2026 02:40:32 -0700 (PDT)
Received: from [192.168.68.106] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-96413f91f22sm3997260241.5.2026.06.04.02.40.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 02:40:31 -0700 (PDT)
Message-ID: <383936e5-fcdf-488b-8f77-17fdee41243e@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 06:40:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] target/riscv: deprecate 'debug' CPU property and
 Debug 0.13
To: Joel Stanley <joel@jms.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: Chao Liu <chao.liu.zevorn@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, Tao Tang <tangtao1634@phytium.com.cn>
References: <20260528131214.2251075-1-daniel.barboza@oss.qualcomm.com>
 <20260528131214.2251075-2-daniel.barboza@oss.qualcomm.com>
 <ahz7-1OomsZTMIz2@ChaodeMacBook-Pro.local>
 <b063eb61-a246-4f10-bac2-ee9272afcd2f@oss.qualcomm.com>
 <CACPK8XcjabfXiDLNm5WoaypfHKbGRggqLL3gob2FWz2TZf0ZZw@mail.gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACPK8XcjabfXiDLNm5WoaypfHKbGRggqLL3gob2FWz2TZf0ZZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA5MiBTYWx0ZWRfX3zVhbBPk6uxF
 pESDrzJnyhNSjHmmmIPhfpNvoypi99MPmiiMj5NII1RLabbUt773OUPm274lrT619R4zTpwU/ak
 OrpErXauvzMT0cZru31EgWb6uBmA8M4QB7U/lDEfcA/wvYhzUldXeest4K1661qRMMGQesQZw9j
 WJkXM9d8CgiS1iELID+aCBGSdX163+zsraUlwuZuklOvDUOnRNwgCkpgYz3QeirtsjDIDB2iSYh
 GTo2tt7dWZ3ptsOuCGB1E+l0Z31y4kjAfPp6O57a4RdyRqrtHqKfTw3N1UoTPjtab6i7Px9VZ0V
 sD5DvLuZ6SMUE3NnhIZLPTUKYLOmmLWWIwFpfEQc3upDpOmidbeDAxNzosxcBn6GzHDIpHKj1QS
 Sd0zzGM51R7mY4mVz2QOtXamNrWanmNxvaKpY4wEv7mN0tGQgr29GOnBg7RHU56hLTWl9d5h2ZJ
 i+qJO6OLt1yvP5gaPtA==
X-Proofpoint-ORIG-GUID: EOR0l2ygbWFjWGEhPXdua5hhOIiatWvj
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a214811 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=fTdHOzJe4hWYLAdQJIwA:9
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: EOR0l2ygbWFjWGEhPXdua5hhOIiatWvj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040092
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



On 6/3/2026 10:09 PM, Joel Stanley wrote:
> On Thu, 4 Jun 2026 at 06:27, Daniel Henrique Barboza
> <daniel.barboza@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 6/1/2026 1:04 AM, Chao Liu wrote:
>>> Hi Daniel,
>>>
>>> On Thu, May 28, 2026 at 10:12:14AM +0800, Daniel Henrique Barboza wrote:
>>>> Starting on commit f31ba686a9 ("target/riscv/cpu.c: add 'sdtrig' in
>>>> riscv,isa') the 'debug' flag has been used as an alias for 'sdtrig' that
>>>> is, for now, compliant with Debug 0.13 that was ratified 8 years go.
>>>>
>>>> We're going to add more debug trigger extensions, e.g. 'sdext' [1].
>>>> Thing is that 'sdext' and all other extensions that will follow are now
>>>> adherent to Debug 1.0, ratified Dec 2022.  And so it happens that Debug
>>>> 1.0 and 0.13 are not compatible with each other.  This makes support new
>>>> Debug 1.0 extensions like 'sdext' harder because we would need two
>>>> independent code bases for each.
>>>>
>>>> We consider that most of the RVI ecosystem already moved on to Debug
>>>> 1.0 and is now going towards the extended Debug 1.0 extensions, and we
>>>> should follow suit.  And the best way to do that is to leave Debug 0.13
>>>> behind, by deprecating its 'debug' flag and making it an alias for
>>>> 'sdtrig' that will eventually move on to Debug 1.0.
>>>>
>>>> The following changes are made:
>>>>
>>>> - 'ext_sdtrig' flag was added in cpu->cfg. 'debug' flag was removed from
>>>>     cpu->cfg;
>>>> - All occurrences of cpu->cfg.debug were replaced to 'ext_sdtrig';
>>>> - Two explicit getters and setters for the 'debug' property were added.
>>>>     The property will simply get/set ext_sdtrig;
>>>> - vmstate_debug was renamed to vmstate_sdtrig. We're aware that this
>>>>     will impact migration between QEMU 10.2 to newer versions, but we're
>>>>     still in a point where the migration break cost isn't big enough to
>>>>     justify adding migration compatibility scaffolding.
>>>>
>>>> Finally, deprecated.rst was updated to deprecate 'debug' and inform that
>>>> it will be now interpreted as an alias of 'sdtrig', which is now going
>>>> to be compliant with Debug 1.0.
>>>>
>>>
>>> This patch conflicts with Alistair's riscv-to-apply.next branch.
>>>
>>> f71708fedf target/riscv/tcg: disable svnapot if satp_mode < sv39
>>
>> Based on recent discussions with Alistair (check the "QEMU RISC-V Call" thread)
>> seems like we're postponing this change because there seems to be interest
>> in keeping the 'debug' flag around, together with the 'sdtrig' extension that
>> we need for your 'sdext' extension (and for the riscv-server-ref board).  Seems
>> like someone is going to send patches making it possible.
> 
> I think this was a reference to Nick's work (I got credit for a bunch
> of things Nick said on the call, so swap out "Joel" for "Nick" in some
> places):
> 
>   [RFC PATCH 00/25] target/riscv/debug: Sdtrig fixes and TT Ascalon support
>   https://lore.kernel.org/qemu-devel/20260114044701.1173347-1-npiggin@gmail.com/
> 
> I encouraged Nick to get it out on the list early, to make others
> aware of the work that had been done.
> He mentioned there's some further improvements to make, I'll let him
> fill you in.

I missed this series completely, sorry about that.  It got caught in the
middle of my working email transition and I failed to notice it.

 From what I can read in the cover letter this is exactly what we need. I'll
throw some review comments there so Nick can send a v2 with some R-bs.


Thanks,
Daniel


> 
> Cheers,
> 
> Joel


