Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D73CC5DF81
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 15:28:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wx4h2-0000t1-7x; Thu, 20 Aug 2026 11:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1wx4gx-0000mv-0j
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 11:28:32 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1wx4gt-0003sm-AN
 for qemu-riscv@nongnu.org; Thu, 20 Aug 2026 11:28:30 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KE7ni03650696
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 15:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 D5tEUgkATbXtPs1itPNBDCfx+mXdUP7NE+SgBr2PHD0=; b=Op6Z8uouz/3587yi
 AtpW2oA32elrE7qdvuNLUL7/zrRvZ1dRqm+jg/g8QHGzorCwayTGcu5gDJzw40jy
 Ckuwvz8jT5RFEIwAbDDqy8SgFeWQsqTdgvOLT7QeedGN+WddV5GFf9lW1W/1j2Vy
 ANMnb8f4DAPvIJCbYv1pg+s8zuLh060FmzXaA7AEYvOagCDy/UJuf48iw8yqA11M
 UmWE3JpaeYyVKnlN9YecqJtpKmsPWgn858jootZLhaJpu4679maVQOL7p/Kofb0O
 juwyy+EB4goMYcK+HkKJku5KVkJhxZZ0MibsOeyzdEXipb6EbbFlirjZH6j0WVIm
 yXHFMA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5w499ym5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 15:28:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c1a9764f0so25712661cf.1
 for <qemu-riscv@nongnu.org>; Thu, 20 Aug 2026 08:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787239700; x=1787844500; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=D5tEUgkATbXtPs1itPNBDCfx+mXdUP7NE+SgBr2PHD0=;
 b=gxGq9mtECPu6cCDyaY54EHzLBueNpyHHBpw76+slnhAyIg4e0UnEY/4AmJPM1Iarwu
 pu+1n5HNRifE7h4m84WcyDLaz46C5qWSshGlYS0aFxsYLPta3Zv4jhIHOp0oGwYz3ZM/
 CDdYZ7qikigpyCYTmpdYeuqpNo7D7sRZwgqNqHYpviqH1i5Zte5XmbKWWspFMWD3HKiF
 uxNx6n4+Cg4kaIMtR2gGYSC8bavbA1ntkdjFhF7YEyFmJgLDCNXKy6fLwhhoCrd/97ll
 +zqM+JCwBK+f9hhr6w8zM1HYBriLXvs2s7Z8ztoocvedH4UyYwKa3vdKgPfrnNpzSmwz
 Vb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787239700; x=1787844500;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=D5tEUgkATbXtPs1itPNBDCfx+mXdUP7NE+SgBr2PHD0=;
 b=JXgbecET104tBWGNeVdi+M//11nqt8frOhbdjEc7+pYF6hzlSYCe0w+qwXqyF1zuIP
 kgcYFA1ElzhJzq3JxKw9rfEz11zGtWcLi2iHzRlgpOmKWBb/pUfPjt0J5JZC4McdKJ+S
 dcSqFXQakppa/hOBGTke12eh8P1C5mu6sNyPdR63sML++nkCwLutpUGRs54BcGvRvgrD
 3eKKOKcZErZSpyOY55PtEwop6cdD7p+YAScTnuaoKD746LPsqvhjB/9U4Y/WOlOhzO9j
 8zeL4JkOR3RLwTi8VVx35RqTX9QNGWKrcX8KApTOB7t1NdvsmRVy13Pn24pLEMhkKpT8
 nXjA==
X-Forwarded-Encrypted: i=1;
 AHgh+RreQ6r13kSmP4VabaV1lHUfU2EWf1E173OSmWIFazUiaXjLQwCkCMBHYlkLlPWs7xY7jOTKOjDEKHL+@nongnu.org
X-Gm-Message-State: AOJu0Yz+s3BrO4C93zYcVigdhGUPHeVn3fc+dSTtFjmwEddTJw6GsJzL
 19MBVIG7YgKMwTH4RyioR+QsLFvZyoIJJAXCj/FN5spn8/bA1+Ck4VTCMLlLb3Vf0X5QyVSOg3x
 10J0GapO/TPqGaVRjenTwbyO4AQCYnlxH66tMKXz4w7iTJxTY2+sOLvoEcA==
X-Gm-Gg: AR+sD10z6L5r+kcbRIswI2sbzdr47ITr89fkm8L8FsM9hmmqHrBANE8zfdkzqHqbdif
 ewJg7EtmezBaukmvwkxeAUbH3f1YCUtP17y3/6IEYS1qYWEjJlRvUId7uqi27VbaSoLcYaxW87h
 wHnw5znKWNnNVLt58cafGq0BNDjF37B24b7ABwe0vgkKlav2vHyJNlqsMjoxycR2ThBsh6Grawq
 oxUBgSbssRfBEgPlVXJfw48FJ9ADqC5L3vGyAhvjbw/J73rgz/kN78ZRyWi0jQhbHzujia6KnNm
 2Aiy89bLABcA1dbeq2w+orsyE7PAbmdm4KJy5YN1GgbpqGBWuFtajhEQVECkgdc/kfLzRYyUi3L
 hUjfXzuxk+qYY+clXdbDxRWf3wOL8nm76t2hqPIr+YTSJbP+xUFWSUM/kCc5CQTaG
X-Received: by 2002:a05:622a:147:b0:52d:9879:8532 with SMTP id
 d75a77b69052e-52dd5cd7b84mr104163351cf.20.1787239700332; 
 Thu, 20 Aug 2026 08:28:20 -0700 (PDT)
X-Received: by 2002:a05:622a:147:b0:52d:9879:8532 with SMTP id
 d75a77b69052e-52dd5cd7b84mr104162521cf.20.1787239699721; 
 Thu, 20 Aug 2026 08:28:19 -0700 (PDT)
Received: from [10.222.168.219] (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52dd857b049sm32667231cf.4.2026.08.20.08.28.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 08:28:17 -0700 (PDT)
Message-ID: <fd1d2cd6-c470-4d77-8df9-3511737642e4@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 10:28:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 11/13] target/hexagon: Constify CPUHexagonState in
 hexagon_thread_is_enabled()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
References: <20260820104730.25462-1-philmd@oss.qualcomm.com>
 <20260820104730.25462-12-philmd@oss.qualcomm.com>
Content-Language: en-US
From: Brian Cain <brian.cain@oss.qualcomm.com>
In-Reply-To: <20260820104730.25462-12-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDExNiBTYWx0ZWRfX2HlnE3oPmuYk
 C5W+lOi+Kj/WSmrUDbDew8vC1AyskApJ19k6voOjARlRCRHGGZM15iBd1hXihQKo1KrL1XQ7ZUx
 vez9t81tScic+fxnfR/+/LVxOqfJ/bg=
X-Authority-Analysis: v=2.4 cv=YP+vDxGx c=1 sm=1 tr=0 ts=6a871d15 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GFBKWpBzVshaxgVpWEgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 7EzgBBbGr6VKGEsadvQplUvg3GHj8FaQ
X-Proofpoint-GUID: 7EzgBBbGr6VKGEsadvQplUvg3GHj8FaQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDExNiBTYWx0ZWRfX9QvWcPRHWcJY
 J594HN+yTWe+0TJ30iw6CEdidABmJxltpamMFI3lcmNCc5D2F34I5Jd38+Ie1WarYmMEdHYB+4v
 GvD+wL5sIfaStsgpjPk/+rWFE4fq9fqePFrnZezBBiaLrOysetrIx/ADpF4ugIjaCd/t03L55V0
 454SFTxV0WjuFkJtc/9Ro7GxmqvSCApwlOuWzHuRklMDoipkce4pVEwC6PW0sekJl7sV0kX8uYL
 NFzdvN8aif31TGlJlzIqakwKSYBEQCSn8fm/I4JmK3vfvnxnvSf2Yi93VTcf5vRBW48Q4fuA+ro
 c6S5168U9YOeoxr1ld0pWxkMFczaaQMWArEnMjTXrXiZ/D5GZ9C/b0XPjybpY9LqJuB2qjFRRc0
 bDK4VjYUhnpv8cHEi7pq/W1HmDoGuOwJmXojGOaz5jhUdOfsKDACoyXmCZrg6a/8le/mYmBYjeI
 bLV2lHuXbOGfwpn5s2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200116
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=brian.cain@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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


On 8/20/2026 5:47 AM, Philippe Mathieu-Daudé wrote:
> Use the recently introduced env_archcpu_const() helper and
> qualify @env as being const in hexagon_thread_is_enabled().
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---


Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>


>   target/hexagon/cpu.h | 2 +-
>   target/hexagon/cpu.c | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
> index c50fbb3f72a..e4f120eda17 100644
> --- a/target/hexagon/cpu.h
> +++ b/target/hexagon/cpu.h
> @@ -216,7 +216,7 @@ G_NORETURN void hexagon_raise_exception_err(CPUHexagonState *env,
>    * @return true if the @a thread_env hardware thread is
>    * not stopped.
>    */
> -bool hexagon_thread_is_enabled(CPUHexagonState *thread_env);
> +bool hexagon_thread_is_enabled(const CPUHexagonState *thread_env);
>   uint32_t hexagon_greg_read(CPUHexagonState *env, uint32_t reg);
>   void hexagon_cpu_soft_reset(CPUHexagonState *env);
>   #endif
> diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
> index 9765716b516..7ae5740899b 100644
> --- a/target/hexagon/cpu.c
> +++ b/target/hexagon/cpu.c
> @@ -345,9 +345,9 @@ static void hexagon_cpu_synchronize_from_tb(CPUState *cs,
>   }
>   
>   #ifndef CONFIG_USER_ONLY
> -bool hexagon_thread_is_enabled(CPUHexagonState *env)
> +bool hexagon_thread_is_enabled(const CPUHexagonState *env)
>   {
> -    HexagonCPU *cpu = env_archcpu(env);
> +    const HexagonCPU *cpu = env_archcpu_const(env);
>       uint32_t modectl;
>       uint32_t thread_enabled_mask;
>       bool E_bit;

