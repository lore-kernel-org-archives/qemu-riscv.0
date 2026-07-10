Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD95C43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 21:55:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiJC2-0002Sc-Ek; Fri, 10 Jul 2026 17:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJBp-0002EL-1g
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 17:55:24 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJBm-0007FV-MG
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 17:55:20 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AK3Rh51713145
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 21:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 J0JErute59YZCE1QPeYjwvNPAb/QF8V9CXZId4ouJXI=; b=b6s/YX2LNY2/+VN8
 k0huwEJnq6Qkxnxl0DdqG5PFuA6Nk8dVcIuw/5GCMoGKijPa/TS4gozDM0iUIDPp
 7X8xAwVa3S1UaZoLNxlNU+M1XK4c33fgK1W5on9yxvRR+K51uHxoBpkRSIjsgzmC
 V7hnyLJr5QzWfP/A28V2EZ6iH3G/PvDzB5kmp0tmNmFQWpyRlvvmdiXhV1coByj5
 dekGA7V1/wwx6xKV+xqVa0sVMtYaJNUhw6n+t4SAqD661Edv39E4yuJ6E1zCoBEk
 3HWin5ysxDdpGBJcsPK8iJ2IiP9mstbC3a9blSJffeh/4SWj8yOsA0snRmnLo3Kn
 sgi+4g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb339san3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 21:55:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c0d6a2f4cso15072251cf.3
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 14:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783720516; x=1784325316; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=J0JErute59YZCE1QPeYjwvNPAb/QF8V9CXZId4ouJXI=;
 b=GfqfXWGrJzh6Nov0RfWfGpOAl6HJMLodlQJ50gDCLucTaiU8QmyEYaFIn7Zy3JPqhy
 uzpYGOH93hWEmXwS9Lz0U3Fu0+SkiJId4v08iV4KLB1EVyT1IkSORAxuWT42JP3eYVAs
 8NiqGX1pYhKQyZVq8OujU05fX87l32Lw7OtPxHGUVonF6aImdyzJ+ZooTwsahjZcahO7
 FnJV1x0IE1/3kZGMYdzdP0SZXykEKosaXu6usoiiGBnR6Uk9IlZVwZky9ldlV8C+4a7r
 Ta78cK4OTZLL2ohsI4gjb+Do29XEuPPpl3HCn1kF/n4B9lPEkR+0ATbDq8CR+CLh0XGX
 Tjxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783720516; x=1784325316;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=J0JErute59YZCE1QPeYjwvNPAb/QF8V9CXZId4ouJXI=;
 b=bB9zm+sKDOvKOw6yzr+Bsd0GkiuM/+8CePvCCAbKaCp6Hn44+ypE3LuDh3Uw7ZHT8G
 p9sKzGnVHTl6s8uMFWEsycCo9fc3ZksasQE8/TP+RMUDLkWsfozcyOwwnStBxj0JfwAc
 B7yl55AZp+rsv24VVf4rFopKT+4f8u8hji06U8InQnp3hbFFFZrmDxw4bTQwxB5Lnw0e
 vNtzooa51Enk3nP9Q2k7pUPVRa2daBaDxiEe7e7EhJ9+xbMnW/TFrKSNDvQtWE1cO2g7
 SZ49SeImbJGEkMRfpTQr5vo6wI1xiDUOI9G4k7ygab0tMHSdzrgU+iOS5h/UJb2LdRX5
 eziQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoX7+kQ98f4TQqDu0N8Hi2d7T+OFOErovZLir/wZ+HizB1FhzkpK5nxNQS9HRlnqUdfTXJE1bT6O0t9@nongnu.org
X-Gm-Message-State: AOJu0YyHF1MSGlsj34mNJF9xtblzphwNsBtp28eJq7uX8FEYu9gaXPYP
 co12w3x2EmziuN3M/PBlZsvMFj/MaDYAPLQGmJBQahR4aXKgtRlo1y5tnafEBhePCzC7TAF3Oiy
 QzmKOWWtdAU3nmalsah0iFczeN2i53hNxO+N1A3m9V+Ep3TUnhbz/Rmr67A==
X-Gm-Gg: AfdE7cnoRLA2f0n8OWK1UsTlzqj2kZPwm2b9h2u3DzTgxx64PvrZOtTrB0PQCCxs6UG
 ZApOgGFfeRHSgjPLa0+4F0V4DXEv/bEpTc0/2z2txxjS8paDPXJCkXG6CGqNu2CS5zplh1Ch25O
 LMNImQX01/wmbI98ly/EmnocfJAzyBQpetb+e4ZhzYxyg7DdPkDvHMK0ghUtZFi6pifnW4+uwLr
 e3lzsfIlR3CvDMr8Viy32MFNydXHfb2lpmr4QeMrBuFbu8lH4ISiXP9kYw8Nn2c2m5XstqDLiww
 p/mZPYtr3yNHePuISjnb+MXMrzI86+rev8VhBGTletR5EezZA0eTxJEnv0mZnCscdXOLggZ+Lwp
 CtvL4JeUcnUqzDWHcwDxundNZNvKVR2vIPtTffsgoPJ7asGKCGGSd/lMKFZpj9Q==
X-Received: by 2002:a05:622a:1e0a:b0:517:642c:8196 with SMTP id
 d75a77b69052e-51cbf0701fbmr8242541cf.12.1783720516192; 
 Fri, 10 Jul 2026 14:55:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1e0a:b0:517:642c:8196 with SMTP id
 d75a77b69052e-51cbf0701fbmr8242301cf.12.1783720515802; 
 Fri, 10 Jul 2026 14:55:15 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6df417sm173979145e9.8.2026.07.10.14.55.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 14:55:15 -0700 (PDT)
Message-ID: <78caf14c-d316-4924-bd23-6e7edec997d2@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 23:55:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/51] exec/breakpoint: Return the new wp from
 cpu_watchpoint_insert
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIyMCBTYWx0ZWRfX+yMBCaCJJpXA
 wrWtqdISYaZJFOvUXE4fyFZyaUxIHJ9Obh09nk9hlmxU0/Yf4jpswM/2lmSTFIjjiZhheQzwlaX
 T/f04cElOEvtkZ1lKn4t/lJETXGYzXo=
X-Authority-Analysis: v=2.4 cv=Re6gzVtv c=1 sm=1 tr=0 ts=6a516a45 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=iEHWvvDq4-ptc5kxTzQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: sliXfes_7rkHVjNIcdg7aPvVG4qcallU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIyMCBTYWx0ZWRfX81MYmkN8nDnf
 pUAeQHf2yKHmWTVVpURiEAGmzi1j1RVsecsKsAcwN14aJ5v0+PfvLSEX4zzHY73xm5LBsbv3k5f
 lWH8Uj7cegRjvW+7fH/ITne6MCqmpeIPRhHZ7u0JPZJjiE/kpGJs9I7k/QvQxpeVLst+2L/GLqI
 poOrhuSk1soIRcsvi7gPISpxbgPtNqiv5RdaoWgCR1Q6S2us8wh3Tm4lFrYATcgu48s17Jy2DgC
 ibRerU0wB2maBDjOYjqm7kd9R94q4TJ0/92GhZFfMZKeV+UT61p61ZM4bB+vjZngRbOkzCAuPxQ
 WIEjUcDCK6KkeVhKYvemo4WhJnOaUv1kYMvUnJBSeLiym+WW2hlEDQdn2lLHu8Lu7TWbFvOR+AJ
 p+WTm4oq6nCHn5rVWGzMv+uA0VSklQu9XKipsv0vIujvijFWiLn7zTVz+yZN/7t3G6fNIX+0rHd
 HWfKw5el3C59LMPjIPw==
X-Proofpoint-GUID: sliXfes_7rkHVjNIcdg7aPvVG4qcallU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100220
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

On 10/7/26 22:53, Richard Henderson wrote:
> The cpu_watchpoint_insert function cannot fail, so the error
> return value isn't actually used.  Instead of returning the
> new watchpoint by reference, return it directly.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/breakpoint.h           |  5 ++---
>   accel/tcg/tcg-accel-ops.c           |  9 ++-------
>   accel/tcg/user-exec-stub.c          |  7 +++----
>   system/watchpoint.c                 | 11 +++--------
>   target/arm/tcg/debug.c              |  4 ++--
>   target/i386/tcg/system/bpt_helper.c | 20 ++++++++------------
>   target/ppc/cpu.c                    |  4 ++--
>   target/riscv/debug.c                | 28 +++++++++-------------------
>   target/s390x/tcg/debug.c            | 10 +++++-----
>   target/xtensa/dbg_helper.c          | 10 +++-------
>   10 files changed, 39 insertions(+), 69 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

