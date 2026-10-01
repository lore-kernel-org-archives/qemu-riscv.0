Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338A0CA5FD2
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 22:13:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCP1z-0004TV-Aa; Thu, 01 Oct 2026 18:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCP1h-0004Da-6z
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 18:13:22 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCP1f-0003Hf-OT
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 18:13:16 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 691HV6Wd2354096
 for <qemu-riscv@nongnu.org>; Thu, 1 Oct 2026 22:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7K63zxwYyyuo23Dr18/mTlwKCHsXlFHXYttvSvAFLn8=; b=Mh43lHFaKJ4+B1fh
 bbVu0rPOuQi0xUMtZzri0a3D4VcY6IytcfBDor+Xl/Rk//eKnFQ1yob1/IBunW7C
 jPumyJ3DccIhd20HoXOzaevUK//6747VRrbeSDZNACBsTS+veqJnHrkYd65TLE/o
 y1ZOg3Db/gGazSYb3yEBoVigcRV3jROONyW0OKsozrLwgqZU9+A1qme0hORSan65
 JjArU85Wi92UVBAbZRrgLyXq+f1o+1LgFgnEm5rYXokRkPoc5BsB1cC/6s40ug3I
 D53OvYsLKsWlFYToAdqg8jmqWBB39AoA8KS0xScIRueZSyPyyFOiEypOwThlv3qs
 y+43rA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1v03131n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 22:13:14 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-34d84114044so6271888eec.1
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 15:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790892793; x=1791497593; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=7K63zxwYyyuo23Dr18/mTlwKCHsXlFHXYttvSvAFLn8=;
 b=e6H/t2JyGqDQ2Js+gtcKzONCWSjw95Plro4oJm0wt4os/q5eJzT8K+VSZsIunNJCVj
 G6YfxSmm6Xyw91fztZMKDMpdbz2F5sumsQId2obJ4yS32DnQkkMwFBnFrlxNcjIbpb6u
 1LW2ZJljHgxVzvscWCOIMcGkuW00Q7RxLUY/F5tqsY6p8k9JRwwVIUdGR3NWwgX8gT7J
 oXn4skCFsmDksAjCY5eW7A5T/JL3sYz10DmPIPaHJ2jjpX5wU7GeWFfGfCWmVXE0n4Y7
 8Ens518FcWbRl6WXuCFjAWNxqzYIZUsfWByBRV2eGlyfxAe/wXZf7Z5Mws88KNEr4A8A
 AaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790892793; x=1791497593;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7K63zxwYyyuo23Dr18/mTlwKCHsXlFHXYttvSvAFLn8=;
 b=1t/+4p8K73uG+9a6QYAD4nRdHd00ptuhvL/q0+YXgb3ie6nbhvlGRpZAKB+/bK0Dnc
 EUG6V9ZEOTULtVqq0kh+mEyCKfHrv6zE19MC6t7XV/rQ652MU7ALRytQXHiN+fTjvA1g
 X7Pxza2gMuDMud/n/bd0xSoR7il5Vq6HQ688uh6tDV2vTKmwz6/YX2Wtgy8hvnRNKrbI
 Y1IEUAwUKNyKFyTWyCweyuTWUvqy1W/rAwwpYwUq8cKFV3VF1MIpcAr4U9wIBGxaa7Br
 lR3O7Y4R7s8a82MynXm6k7ZsNemyXRi4p3p2PQX2zvUU8D19mL5QW2MWuAv3g7cY9Ogy
 EcgA==
X-Gm-Message-State: AFuF++nTKonWIuYFHi2frUQJBSHldznm9UIx7CH8HriPqVTWbySmew1F
 ufOZCSQPMWk+Eh1YFLyamusKJ/gDTTOTh8q4UpQqDmhm1ebL3VUQNORqGpLtUBmUrw2b4URoB6W
 sCPizGv/9jIsv08x/ZhCKHSx3pQSNa5GFQ2csVIHE5EXnY1BCdraa1zTPEQ==
X-Gm-Gg: AYBFou0dR3vZ1WkrLue4nsBPXRKHu0JmJHs36t4ISo9rxpf04iGRaVsS35mSaMH25KH
 aD/1SBQmitx6QkYq9TSyvCcnN1YHx3yYOloK9I8+oqfpUQYicsyzUO/KQtawkCS3XSsd8ZFS0tk
 HWQ5xzJUas7j3D/ZE+GmJVvW1F9IGNiv2OhXqylLzHveHFaTNE7fuNmb1pBXol9uzKS8B5hyMmd
 Ei/ifTyZtQfOiFhCQYG5NV9mYmTwHx86drl/NUdhxRqWvXPtK4eD4T2FlZRAZISkmw4X9S0xqsf
 fgvNB2WI74/Kl3Y/2my86UfommBYUTmvE1OMLfnkGPWVgx0WzqbZytGnqMamcKOiJMOLOHJocaU
 sACkzG9nzLbLqoM2OB6NyRactpDpGDLsFP3hvspS0eghnmS5dAPKqDRyxGTIKVw0hIyJdCw==
X-Received: by 2002:a05:7300:ccaa:b0:328:2ea5:bd39 with SMTP id
 5a478bee46e88-34f14f10307mr703431eec.4.1790892793463; 
 Thu, 01 Oct 2026 15:13:13 -0700 (PDT)
X-Received: by 2002:a05:7300:ccaa:b0:328:2ea5:bd39 with SMTP id
 5a478bee46e88-34f14f10307mr703399eec.4.1790892792727; 
 Thu, 01 Oct 2026 15:13:12 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-34f14f98527sm1008570eec.16.2026.10.01.15.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 15:13:12 -0700 (PDT)
Message-ID: <ce86b143-1b1e-456b-ad31-ef90dc7833a8@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 15:13:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/18] target/riscv: Compile machine.c once
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 philmd@oss.qualcomm.com, palmer@dabbelt.com, alistair.francis@wdc.com
References: <20261001-rv-dedup-v1-0-ea69b07afd31@rev.ng>
 <20261001-rv-dedup-v1-16-ea69b07afd31@rev.ng>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261001-rv-dedup-v1-16-ea69b07afd31@rev.ng>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA4OCBTYWx0ZWRfXzw4h2t6GZyEN
 DevUJAcaUvYkF2IND6576eyqHG7AlfpH+sqmUEwUbwPqMT/Dz9vQQogJ8u1mIqeOdYKWKcAKxCd
 P5yJq9ivxU6lndwubvwtLXWiahqzeuI=
X-Authority-Analysis: v=2.4 cv=GqfXaU1C c=1 sm=1 tr=0 ts=6abedafa cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=fxbZCB_lKdZGEhcooBcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: q7e7d7HDuDbDIKuO7c4M6P6ZFRfRTUJo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA4OCBTYWx0ZWRfX8DGYy6jdHJRS
 Y2+EyXC5LLmmFHhK6Aeoj5zoGn7sPTjHIeHPOxkIUMPEpQ4XdLGozzeimVgtaPdGrJecwJLY8kD
 JM/IdXpmuoyGehT9alHQd0csVtPkYeydmD9kkwm6S+DKSnY3lmItarhcn+MHWod5ec1GCEHKBxK
 7Xt2yPyJeAEronhVeNA/G8XtMhAO40OZbR185rCID+JG0pMYpD6FXWRbzAC3LZBrYcMFh992ltw
 ErsFfTcfZHHhzq6SgveKcQJKKYg+QNB9k16DkdMHncXUlYdKNiwXqhDsbWyXs7rDYZUFjxokAmJ
 WGDKijlNulAlfivqGAfBZLnQWQO1UZbdm2+Tdn2IYF9oAqujUlDtWJfxXw6xLyGwWZXvGfjhGLH
 jVYlpN9xtFiJx5BwI6dcVi1q/NZGbO6OBic7szfvk+pxfYEojnq24rvZVVx7AUg4j2Uu9uMx8ee
 QlgOXkzvsHXzOIT/gSA==
X-Proofpoint-ORIG-GUID: q7e7d7HDuDbDIKuO7c4M6P6ZFRfRTUJo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010088
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 10/1/2026 8:59 AM, Anton Johansson wrote:
> There's now also no change in migration stream between KVM/non-KVM
> configurations, KVM fields are filtered out via .is_needed().
> 
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>  target/riscv/machine.c   | 10 +---------
>  target/riscv/meson.build |  2 +-
>  2 files changed, 2 insertions(+), 10 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

