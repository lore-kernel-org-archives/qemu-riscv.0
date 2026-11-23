Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866F1606A31A
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 19:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gz3FKKJU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SmU3v6FS
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVZua-00087m-Gs; Mon, 23 Nov 2026 14:41:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVZuW-00086s-5B
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 14:41:09 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVZuR-0001wu-Ei
 for qemu-riscv@nongnu.org; Mon, 23 Nov 2026 14:41:07 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ANJRum41514458
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 19:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EBWOMbY1PzDZv4r62a4+9ALSGe4bdfv7rahik9IOWnc=; b=gz3FKKJUacgZS3+A
 pQ4yvTW+0uLiklZNiVjRHsghMMWS/RuRqI/bWrbERMX5/9wqg5E5VRVlmKYA/yq7
 8c1fa25umXfyUjsdGb758Ln+bpV+8zVIvb357pFIQQ5jWZhNyWV8krqTfamSCUHe
 4xE76gKaOGWV9AUNOuZkrUGc/cJvHUIWYvfWBbaGUX7pRJfJ9de4T0tBJs4N5BKi
 oa00Ekcz/Kt4D6UOXWNczlGpUa65gfhP6OxbmcWOeHT1u4FueNGA/2tz95VP3yxW
 cst8vIrVlsF9fQ/B0SmvOFOsDwV4wnSrJ/mX4StCpXB6kyuT/kcrxG3l8/XQj7VQ
 FVkS6w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0t2rs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 19:40:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-55d3e7ba879so75047681cf.2
 for <qemu-riscv@nongnu.org>; Mon, 23 Nov 2026 11:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795462855; x=1796067655; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=EBWOMbY1PzDZv4r62a4+9ALSGe4bdfv7rahik9IOWnc=;
 b=SmU3v6FSmPekBkA4rZB7JxsNgreuYYVG+AFPXzKZjczYpN40twP7YswOxp/TQtnVbJ
 3dRMwUsBG4rYRBCpmgKWd4GpN0pFC5z0nTU/+OqYjhqmKTPuANCgvETWhHF2nuPbGSMF
 yrQfbBLzVL2c90jKMKPHH+5l/u9t5FhxCF4lFSkyAq+FT4dvgxJfuuISXg1KHth1QDkU
 Dgu0Vpl7suyP8ZnHjic2AMFsPBtJNvNbuxPqY3VEA8Z3rntt3NDOJFabVYYbAxzj269K
 Hx1R5+VmyVpXPCWhQhYuxrf0yEg2eHUR7nHBjbUwfrYJ8ZcaEk/bTxrqFtG129J9jr5B
 MYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795462855; x=1796067655;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EBWOMbY1PzDZv4r62a4+9ALSGe4bdfv7rahik9IOWnc=;
 b=2j1xm7c4zyjBb9bdy9fVgotwy5wyF/+OM4wcZdKhi3yKSTX2pWPIWNWcC9FZeVcbpv
 h7PyHvm1AjwLIMOBH0lgND+CWRa7KqUeBLwWiaRX0WkT+c80dozMP5zUEE8iVt48M0wX
 NPi1OH3I6lGj6YxCJnzPX5TBfEzDNN6eNyA6KNJv5QuUzRsJfITL5Qa/3Jrv6grBK5qP
 6ZyLdyNBsQ/lwuulFMrC+/rRpyrBNkAMIXhl/GABG+8VNhWESFP7QvqkFaf/ACYlr9ST
 IV0wZVdjefSKLH/OKjIrZn0QAr1dMwIRDTCOFwyhmk34LMd2QMB7M0U4AaaVhoWUoAV8
 f/9Q==
X-Gm-Message-State: APuU4Z+86GJEWPxyWezeYGXE/v8Mv19sl6FNcApcnx3r769L4wBWHfr3
 dAlyVocGF3ttYyS10lqNdHYGCMfUSlLfTveQsQpZk1HjNyG3sdUXwGNZ8fP4C6hFt70EoWuK5KP
 ZIaWgRnITbs3Oa26bIISVwABYH+76e/gnQWsFlE6I/HVAXPwsyBIxN+m19Q==
X-Gm-Gg: AZFdTZdBveB9/fJpgKJ03DrG27iQDWz1SoiDk0oaIEAahvgZao61LlKXTd7GAEYsq0l
 j8Ez8oX7Wzp4LgBbn8DPZac3iDr0W2TRXizD92U6auEBG1tyHE+OobCwslxrmT6VPOAw821V/IV
 TMjMmmbtidiAyQRxiGUXvsdEkrWrVAip3Du2oZRcyGQd2WT0wwrQ7WOjEdKH0JkcnX5XLry7Ysp
 l2Vutstr+k7aRY6dFU0o8Uj7b0VrJg5dgNUs1Xm44C1MSdKQXy5Pf8pb6J2hKM45N8jHO0ZQl8I
 GGSU7abQoUI7LGNaXg+zijnYF0cqUAlsViswvlRLGXtA7B86LkiAYDhUeTndMXGGAZaLfgbW2j5
 Nw1vr9+8IUcw6WCBxJufQFCS6EORTY3FLKGNHCinTynXAxbwndykLE7Eo1moa6LPTBcZS3WlQNm
 uV4qOqlILr
X-Received: by 2002:a05:622a:a05:b0:555:50da:f038 with SMTP id
 d75a77b69052e-55d768a3faemr229805681cf.1.1795462855375; 
 Mon, 23 Nov 2026 11:40:55 -0800 (PST)
X-Received: by 2002:a05:622a:a05:b0:555:50da:f038 with SMTP id
 d75a77b69052e-55d768a3faemr229805251cf.1.1795462854862; 
 Mon, 23 Nov 2026 11:40:54 -0800 (PST)
Received: from [192.168.68.101] ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-921349f098bsm112080516d6.30.2026.11.23.11.40.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2026 11:40:54 -0800 (PST)
Message-ID: <a5a6cbd5-4220-425b-be7e-5726ff0221ea@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:40:51 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/1] target/riscv: do not write SXL < UXL [GL4821]
To: Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "chao.liu@processmission.com" <chao.liu@processmission.com>,
 "liwei1518@gmail.com" <liwei1518@gmail.com>,
 "zhiwei_liu@linux.alibaba.com" <zhiwei_liu@linux.alibaba.com>
References: <20261119124141.1279663-1-daniel.barboza@oss.qualcomm.com>
 <fc4c472c8652b624f8964eae5f0f95ec7c3a880a.camel@wdc.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <fc4c472c8652b624f8964eae5f0f95ec7c3a880a.camel@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GfYA6cZF3MjHRMTL4LQT_CSGZscSIe7k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXwrO2Bm+dMwpo
 NzYxULLaR2IJdZa6TX6r73Y83OyPNgiKJmCTFv7aS5QkOp2EsBnLUn46v3a0xyAyaA+3k9KJ8aA
 ZfAcv27D7RTf9juCzbGKuOqnW+qjUVk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX02nvu5/OPUka
 pXPgT5I+8tnaAToIsFqwdgAORETagbgthvOER/m++ojcd3jIO8GenXIW4gQyMZN4PVYQG1qHf6k
 8M32fDonW4HZ398hRuAL1XiR3bpSRClrfR5LbCByX8d5pOBfRVlz3oYMZku1/ZclmNkbkaTqVnD
 /P7kdGEskK3Mk+2gDwSgTXSOY5Hc0HsBqdFz2j3d5coqE/DDHoZjrH1hk+6U3A0LSf+A71PoPwP
 5H/ViGGxhTGC2ZvDcxorKQ/uZLgUk7lmr2gfr5pqoXA4jqoloOlCrcsBkm9iHDGgfFLkWS2f4lk
 B93LSinbdzBYOp1giEzf8WsjhCSVVbs4fAjqeZyWBRxHOphULMUCWPYvdMji53K0KvHsl20M4g4
 t49GmUSb2ZF+u+2CO2LAfHC/1yMs7IQTmGcTs3oBd4NlAMUSd09Uk0U9G6srCNWSCqzEUlp5kOq
 AH2DyjtaFGyVmXOhc3A==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b0496c8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CYUUmzwy_dYJKcM43WsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: GfYA6cZF3MjHRMTL4LQT_CSGZscSIe7k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/19/2026 9:56 PM, Alistair Francis wrote:
> On Thu, 2026-11-19 at 09:41 -0300, Daniel Henrique Barboza wrote:
>> Based-on: 20261110232614.83050-1-christianslima@proton.me
>> ("target/riscv: change mstatus bits for read-only if S ou U
>> unsupported")
>>
>> Hi,
>>
>> In this v2 there are 2 Sashiko-suggested changes:
>>
>> - added a "Fixes" tag;
>>
>> - simplified the 'min_val' calculation when writing SXL.  Sashiko
>> said:
>>
>>    "- [MEDIUM] In target/riscv/tcg/csr.c (write_mstatus), SXL can be
>> set less
>>    than UXL if RVU is absent. The min_val for SXL is only derived from
>> UXL
>>    if RVU is present; otherwise, it defaults to 0. This allows a guest
>> to
>>    write SXL < UXL, violating the intended fix and the hardware
>> contract.
>>    The check should ensure min_val is derived from UXL regardless of
>> RVU."
>>
>> This won't happen in practice since we're basing this patch on a
>> commit
>> that will forbid UXL writes unless we have RVU, i.e. if there's no
>> RVU
>> we can assume UXL will be zero.  But, by this same logic, this
>> ternary
>> is unneeded:
>>
>>     uint32_t min_val = mask & MSTATUS64_UXL
>>                        ? get_field(val, MSTATUS64_UXL) : 0;
>>
>> And we should just use 'get_field(...)' directly instead.  So we're
>> ended up doing what Sashiko suggested but for other reason.
>>
>> No other changes made.
>>
>> Changes in v2:
>> - added "Fixes" tag;
>> - removed the ternary when assigning 'min_val' during SXL logic;
>> - v1 link:
>> https://lore.kernel.org/qemu-devel/20261112163242.509864-1-daniel.barboza@oss.qualcomm.com/
>>
>>
>> Daniel Henrique Barboza (1):
>>    target/riscv: do not write SXL < UXL [GL4821]
> 
> Why is there a GL in the commit message?

Shorthand for "Gitlab".  Makes it a bit easier to find patches that are addressing
bugs in "git log --oneline" and friends instead of reading the "Resolves" tag.

Let me know if this is annoying and I'll stop :D


Daniel

> 
> Alistair
> 
>>
>>   target/riscv/tcg/csr.c               | 39 ++++++++++++------
>>   tests/tcg/riscv64/system/meson.build |  7 ++++
>>   tests/tcg/riscv64/test-uxl-sxl.S     | 59
>> ++++++++++++++++++++++++++++
>>   3 files changed, 92 insertions(+), 13 deletions(-)
>>   create mode 100644 tests/tcg/riscv64/test-uxl-sxl.S


