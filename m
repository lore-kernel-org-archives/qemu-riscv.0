Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B6CC43458
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 06:35:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1weoWW-0003zi-My; Wed, 01 Jul 2026 02:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weoWL-0003yI-Pt
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 02:34:08 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weoWI-0002C6-Lu
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 02:34:05 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6615lXYl059316
 for <qemu-riscv@nongnu.org>; Wed, 1 Jul 2026 06:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iCAMIuR+JqZRq8lrovhK5NYiZ2LTW2jGzDfhPWBG7Iw=; b=IL9cvldqtzW2fVfF
 x1Nism00DTPeRh9N4NUDz3utKmyxGUXz842aOnN5omWQ3YnhN4/RcGSFG9NCiPrx
 NXobE2kBc6V4wQXMWM/TKBpbbBXEUJEKQM27cTtTKmi3FdEJQbQn6MVhDmBhhLdx
 tiC/IazafOHppMWGW6rxl0vJIDskJ9KLQUWVEaMCXvFU5MVL6ETnPkWH5IqmbX6G
 0cGyTzpkBP4lb8oB0gjMQNc26TF1iwBBWZozStp1/ekb1yqtA0aeiealS5w1XjoO
 hdsFuJOj/W9wsml7BNVtklD1ExX28cUpl77H81Y0T8sAW8ZaDYBy8i8rxppzdcAf
 cgbRJw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3sjguh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 01 Jul 2026 06:34:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-92ac0a54110so41665685a.2
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 23:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782887639; x=1783492439; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iCAMIuR+JqZRq8lrovhK5NYiZ2LTW2jGzDfhPWBG7Iw=;
 b=A/ncv66H+oZLZxl0uk4NImI+4QTY087q/xLMfSOr3ZRkF91F9Fw1wnNr7CVuH/gL05
 /3gJyR2HOaFDtXMrEa/a/d58tzmV884/VLv7N3ufPYMIniDyG8+N1A5Z5QlaLAUgn2uG
 7yHXalfeyzUaXXnuVBeroVlbmJB9nqPH7Wrr+conSW/8Cpy5vPLuVpou3rAhVCr9t0eh
 wgoKEZfPXhVX7RqQalbkpojepUy7pkLtelYNntsEFk1Ty/4vG2IesLYKn382i8fmDEDE
 juIzNUZPf6pPLPX7TM7ps7ta+jJ0uGOMsBKKE4xGAa5pyfwh8IBCXuXS+Kp/IVkT2eRC
 KVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782887639; x=1783492439;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iCAMIuR+JqZRq8lrovhK5NYiZ2LTW2jGzDfhPWBG7Iw=;
 b=C//2o8nUtAmb6JN6ox8FrE1PXMKkmeoNeiKatkSmY1++lW8e+A6xVypl6cxeSzcrEm
 Md+7wtwmywIy7aOhAwYNfAqtFp5Jsvotk4dqwaaocbAyp3c0htIzXl3EyXGSP6w3HCIp
 PY4YGP9IcfpY1n1zRT9UnZDGWq0UlWCdeWNEpsRvhxxrEx1FyIL4cq0jlauLavrluuxF
 hKREwb5N5dhUrKclRnqtkG36iNyyFLe7pG2WUPAIwJiSeOhQE5CYFIUdmBC13T+K3NtR
 G1O+EitrDuovkb8e+ME6I6hOEHKJYHGgAh2PeXREykr4YG7+q6iaDvhDmdCC58xX+PZr
 uxhg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9ImD5WnOw7h9ZTvnutiXOazHO/28G48RHxt4WiVx//WxrytJzIRLEgj2LHDmvSUPWw3GOZhBs4LIv6@nongnu.org
X-Gm-Message-State: AOJu0YxRgCgR6bU9jfTRGi8dx9fDjBsccBcAthWLUEyMoiebjZQF2zfd
 kQ+RAZXO0EOfGIahBtnxJ78xN146JoYSMiJ9IAnjcG1NSjkdElqnPhV9p/DF60C2ks9j81aAzB2
 aRghaZaXuOtOTfsOMD9RAslsj99WBrCaqTEDzjmvcSW8cke3EQmaOxP2koWibSUPyQg==
X-Gm-Gg: AfdE7ckveWeqJ3yX5Iw2E1nUs2B6hxH38sAghO0Z7Qya9+3AvGI9+f2Uy84njP4IO++
 zyKKjPUdGHxMXBHdIN7ImTUNsF+D0iftrFrPVdLvdLoZFqI/Myil4vOWQ8JaCGoAzaqTEn2GCqt
 dkw8CEdxtnvzdIKbBH9tf7Vx+iB+Hs4kFrTqywwDFX0/SLw9o587AtsoXPI87CvSZWQ8VihT6ae
 SBNbE4GoeGm63P3+tnmk6nfOI7VJjc1xdYHcnUDpvAcsbQnNzHzgtuSO+puyTiidFkFJdOvcpHQ
 GXBxLHGhUWkQpPCpW5WnuQpDsZT5nTmLBy0MO9QeAIwVpzHuQkyCCYG5sALEpkPyXU8bs9QoBsb
 2lYfe9/GF+8iozuNuq4Tg2gQG7OuyvZbQZAeTbqaBj3X/cBITTWiomRiefJ5EmQ==
X-Received: by 2002:a05:620a:4554:b0:92e:573f:c2 with SMTP id
 af79cd13be357-92e7851d814mr47002185a.72.1782887639356; 
 Tue, 30 Jun 2026 23:33:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4554:b0:92e:573f:c2 with SMTP id
 af79cd13be357-92e7851d814mr47000385a.72.1782887638929; 
 Tue, 30 Jun 2026 23:33:58 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-475641e4cdesm15024252f8f.13.2026.06.30.23.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 23:33:58 -0700 (PDT)
Message-ID: <eaccbbdd-98c6-4127-87fe-4340c896e368@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 08:33:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] accel/tcg: Pass CPUBreakpoint to
 debug_check_breakpoint
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
 <20260701030443.1382447-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260701030443.1382447-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1JDd4SwiEpMLCHnjDMcZqgZQFCC5eie6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA2NiBTYWx0ZWRfX13IIxAcFBCpb
 SzRbX7Kr1CI7W0IIgcCBHrS1l62jgHaCmrcc5KiM51TbHptRPKkVHOvhTcYilAqwin5Fy112HOY
 sds1rIBBMDHbvu72ZUO+norJT7ioNsnC4GrzNIOquzWYD273MhioIhe+SfroFhIgj1aJtZoxiPi
 w59NRRV87b0TJKlo6W5ZZ9plnUu8ohOYe8xldhyyePsU+ncZtZmVgt++tApMiqd2vKw3TgJ9e3o
 AfKOL3OBGVMxa8kKWLO1AkjwvFli4WQ2vGICusmLcHd8yJyetEvNlEV9h5zgeDd9COCp6IXom6m
 mq3xvlqRGUcTzntgueA+adqicRlREL+VRY2YMM+u6Ebpg6o8J4hyWZP9p8G5euWlmctZbnnMGQk
 AetL7sX5AXNHAKesHPslQvuMNoX5lrx2w4Qbnl10rFHqYN83nkW7ShdONxdn/ke9fEoWWu0YrVf
 0g8fXvKKpAIabeDpwsg==
X-Proofpoint-ORIG-GUID: 1JDd4SwiEpMLCHnjDMcZqgZQFCC5eie6
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a44b4d8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA2NiBTYWx0ZWRfX7lrO0rpJWjMT
 jMxuTbk6ZjK/GEkU7by3d50Xs+Ata4WKvGif9an7QvA8tNObdPnpR9w6v6KQH8y6Dw34TecX23R
 N02+5hmWs2bU/pBss71C8BG/QjtJp7s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010066
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 1/7/26 05:04, Richard Henderson wrote:
> For 3 of the 4 targets that use this hook, add the argument
> and ignore it so far.  For riscv, drop the loop over all
> breakpoints and use the new argument.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/accel/tcg/cpu-ops.h  |  2 +-
>   target/arm/internals.h       |  2 +-
>   target/ppc/internal.h        |  2 +-
>   target/riscv/debug.h         |  2 +-
>   target/xtensa/cpu.h          |  2 +-
>   accel/tcg/cpu-exec.c         |  2 +-
>   target/arm/tcg/debug.c       |  2 +-
>   target/i386/tcg/tcg-cpu.c    |  2 +-
>   target/ppc/tcg-excp_helper.c |  2 +-
>   target/riscv/debug.c         | 55 +++++++++++++++++-------------------
>   target/xtensa/dbg_helper.c   |  2 +-
>   11 files changed, 36 insertions(+), 39 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

