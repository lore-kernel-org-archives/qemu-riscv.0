Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7871EC43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 10:53:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfbW8-0001Wj-D4; Fri, 03 Jul 2026 06:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfbW3-0001Km-Mk
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 06:53:04 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfbW2-0001N1-5q
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 06:53:03 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66368Ijv3054318
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 10:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 b8Dld42oswU9eWtRizEp44Fgiwn/q+pdpxqDw3ITnf0=; b=bHvyTS/jbwXH6zx7
 +T1EzcYDVYzRqY2jPNVM5ul+kybooXoVC826yMnc6LH9VC4NWzoMIql1uDun+wqB
 pf8GWqAVX3NEK2JfEbniU/yNwyivtMrOBQkE/O4cCnBZlAGxuJi7zpchWxJT52jO
 J/HJDbw5HbJnbEK+QFvybEqDNG3BBxeXBOhdXmC600CKJWnQ7NNSt9zflqDWpymc
 qgTu4r/30pFGe0zjVhk5Ofwg9fS2DUpGWlQ+XPnMGe3EiE3ED7FOTLviq2Wv09Aw
 u7Hz9AvAX4tF80hdA3mkIM/kKywjzHgVADw7YLDt6suMeLkzuTMeKoFz9UtXakQ6
 wRvbCQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j011ch-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 10:53:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e8004d60eso71441785a.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 03:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783075980; x=1783680780; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=b8Dld42oswU9eWtRizEp44Fgiwn/q+pdpxqDw3ITnf0=;
 b=JqatD16PGaPR87h4yKHZ6V+wIUyn7lU4zBOzFngBzRByGO8ZiP6BOm7kPqZk7Tox1I
 QB1wFVCeKsZRigyFlfjXQSFv2VmJgMED0r6pqe+Kag3Oh4tE0AeYgOXThxcX8KcwhcvK
 /OPg3GJHWJhhkxzIgDbkFOKSHev+n6mmSW0unduQZjYrCbui0r7qbb1+30JVnR570atI
 /2ZrxFwJrFbHvcgMZXvA2IiHfE/wQSPiLrKlNSz5hZA2eT8E5bPxgSvkloma8AmOgNp+
 zqtcVqxDZ0dlqRho4riXBT+ZBMMsnUyg3cEONOg1wmovo3rWBQwAALOpchq+0yau/KlG
 uU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783075980; x=1783680780;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=b8Dld42oswU9eWtRizEp44Fgiwn/q+pdpxqDw3ITnf0=;
 b=pDC//qdPRmRfcwBAf3m68d9JLaHF87pO9MxUkXLCEtE7S6o7ZgOZVl0NK0U1BGlm1X
 OppQjN58DDxa52IjEFwsNHGhxdKk7jgvDAwhW9UbR1aU/mAH4ksAGx+IuHfAwEsWfbkV
 UJLJp4uZcPtR+tfMVX9dlQYweGZ9qJeT6Aonk7WD8VffW7Y1PJW0Ci9oEghXAhfUEFbW
 OyNPQBNZ2hzWzzMNSMZVgJSXyaqGcvy8vC9Wbir4ZgNXwJbS2y5shew5QLE7MkMK9NP1
 DLXJUQPCYny2MduNPeKJtPja+69KQWi0O7lGEtE8uO8SrNYgkrWd7fjaZwjhrakQ19SG
 ksgw==
X-Gm-Message-State: AOJu0YzwtpKgUeB/k8OeignKRLhiPeChttEE48H+uNFtciSQLqR07bph
 ekcf2tU5w3mCJtrEyFpBvfZJe9Oi+GllPAuuFkVqqrNWVQAodC5AVpIwmbNnfJUTQbsCRh8wokJ
 h7QfAttRQUuBm+4x0qKEmYrCg+dWfGMlW6YeyGK7HYyO9oMo8OhYSUR7WEQ==
X-Gm-Gg: AfdE7ck2N3pOzJB6SSfWLK0A0AEPDieM/9/KnmuICcxTYGqzCuM1fV4GNC30pFtmOHv
 00w6i0+YVvSX2po93pDSWhjjo4sAtg25KKpdgzBJdT2bXi9epU98Uq55BbJB9JogJvC7YpBh1CJ
 nPQD3RtgfJiZHY0z5mNpss5I6TssFrpreOFdVAhLB1jZxSavlc/CCU3Q2ZHPM/9nPqVwMyyGaRp
 LHLgasn90Cx9f8mKW/t5fx8Q7U3s9S4udk6HbCo2npbbF1+Goq3QwiD1qMlSU85X86p0RCxM6zn
 d552saXzviswvtLlmt8gW9N7/H5gH5lOqOWsyn3ebwNyBu0WvHFDFBiq1s4a8II4NF8Po+tFi3J
 CDUmJZKcjZjpFma1OUCRuSdC5j6Yw2a8KsdzIYoEqS/v3trTnqfbKyEJclHFiRA==
X-Received: by 2002:a05:620a:370e:b0:92a:e2a7:d565 with SMTP id
 af79cd13be357-92e7b3a88f0mr1150721685a.49.1783075979966; 
 Fri, 03 Jul 2026 03:52:59 -0700 (PDT)
X-Received: by 2002:a05:620a:370e:b0:92a:e2a7:d565 with SMTP id
 af79cd13be357-92e7b3a88f0mr1150719585a.49.1783075979575; 
 Fri, 03 Jul 2026 03:52:59 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477dd94cb64sm18019333f8f.23.2026.07.03.03.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2026 03:52:58 -0700 (PDT)
Message-ID: <247d4f24-f560-4312-88c0-fb222d5c0244@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:52:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/24] target/riscv/tcg: remove unused
 riscv_cpu_get_geilen()
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
 <20260702135128.1188021-22-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260702135128.1188021-22-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uAfT7csyJOf9cBwZJqiX7fsbvp9fYTyn
X-Proofpoint-ORIG-GUID: uAfT7csyJOf9cBwZJqiX7fsbvp9fYTyn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwNSBTYWx0ZWRfX/whMft+Lcrrw
 w8ge628fJ27g4Q4zY8BosgV3pduvrwNOtVuEQ3cK30o02v2tYBGhuk1LFywjEbD1BLr9ksnsil2
 vxeQ4j3jKwlTIvhuaQOqCovE3SbmK18=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a47948c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwNSBTYWx0ZWRfX3sMGHpySgUkW
 r8qTm0c5Qg6pWvF+pa/9QMG8Iws+VmST43EMD9NDQsyUQnFF4I7c9GacxQ9MRQskwBiW5HJph0Q
 QL+Nvxq+9RlzhnZsLLhBnPjDKdh3yIkpstOtncO/IUSmM0AXoam+vSxQAbjC4j9XihUy6/YTUzt
 dI5YzUgVQvEmqLUklaWGdezo6BRfMeQKq8A/sXNk0yphnO9pZ+o8ZW9xUuOy4k2H9poE0kqMYO1
 jnmhQbx6XdqAFLDY+TP2EdIhq2K4loufPV+OT9KMWz1Q/ZlfsOtv2FuSbhqNirv4Ujkbfe67mGc
 iEjFm+Iqd7fP/qS1MBXQWYtNqFDoTwLRi3l+voSjA/cUWzocGZoSC5YBjdT7pkZYjb0k0TgW807
 RdvbwFlD7514jdpMaAvh9o3u8pDkl828C+cwL5qECq3ylLoPJogRerjPOdhoWWUiJFg2CctNksP
 nfDuh6n559tnMT6ZZrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030105
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 2/7/26 15:51, Daniel Henrique Barboza wrote:
> No one uses it.
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/cpu.h            | 1 -
>   target/riscv/tcg/cpu_helper.c | 9 ---------
>   2 files changed, 10 deletions(-)

Preferrably before patch #2 "target/riscv: move TCG only files to tcg
subdir" if not too much trouble:
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

