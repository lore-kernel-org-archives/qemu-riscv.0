Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20D0C9832A
	for <qemu-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 14:21:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBYhT-0003Lo-Om; Tue, 29 Sep 2026 10:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1xBYhR-0003JR-QP
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2026 10:20:54 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brian.cain@oss.qualcomm.com>)
 id 1xBYhP-0000h3-Iy
 for qemu-riscv@nongnu.org; Tue, 29 Sep 2026 10:20:53 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68TCqe541577176
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2026 14:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PyBF7lcf4SrKSJZNnkSrBzHyYZWIKwO07PoT2Rls1FE=; b=dgmLft6ruWIO4ZLR
 4MTlugGqxz2bPeQWVFF3pKRcirTM7DeTiWDfTVg1/CVPhiHnHa4pEY2ztL0iSVMi
 lwenY6abDCFSYlYtTJ5mV9F9m2lxzk0+5u0+MitcTZwPPM1e9+UmdbGzGzq4EjoI
 y7tQvByoTruyfOx5GXMkIoTnts+EYaH/ig9QeYH44C2LaLi3WmBvWrKRyxogqqqi
 oDbv0gHvCn8sjbObdY57aQMtFwGJfzDZ0UD9tGaywE0tl8Tms4aR4Dl8GEC7FOvP
 A60ZqcfxQg3SQeNbP+cQ1rLOlyKZkZ6BoqvjeiiEDvMJbqm82sv09BXrmvQ5SreZ
 oaXP3w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h09x4sfgt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2026 14:20:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-9145530f7d3so37399416d6.1
 for <qemu-riscv@nongnu.org>; Tue, 29 Sep 2026 07:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790691649; x=1791296449; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=PyBF7lcf4SrKSJZNnkSrBzHyYZWIKwO07PoT2Rls1FE=;
 b=C1A2ZBAy8namGx/idxvqwO1Tq9mku6jxyvSGa7Q8Fg8rzWuEwpZ8HRmE1zdGBw3RYw
 qq4lg5eofhpCC/6JVfQog5PabfQQqj+WWqbCyKA6QS0ITSKh4Sw/GVye4neZ2MGHuR1+
 z8u3BL5q8+RRFbKNVBzBEsK6mpK2LxYq2izE2dYwKXz3o7DNRCYoFqU9InBDM2IjDOog
 ULbmQLcKHOq0rrlugqhNWlGBdX/OiB4hZqHSBJzfRHQbhOt4sh/ErpY0z+81ILOCm8k5
 A++Or/eNVUjK04Zg513RbSvgfNTFWsCyxoPHH16dpBUhntvDvVDMLtMGK1fU/EOPeKOs
 flcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790691649; x=1791296449;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PyBF7lcf4SrKSJZNnkSrBzHyYZWIKwO07PoT2Rls1FE=;
 b=cZ0JItMheKJTtulZoE3s4wOgR3cGdV9dFQRd/Fk6zREJCjVNAF7hxL/33yGgOOTyEv
 adt7xbdytQtWJjkFddOBVBq6/oNEM8g5ucD1GLRQ7UrGCASU5qKA6A6++18nQIhD75pf
 X+I46OW3YxrkNCfGyipw2UbYqi//rNOXf7+t/c9DEemcHCVsNcLBrRq6xjmXUCkfdtZW
 Tb9RoolBk5Ku3NhEuljVUcGzXUhX48zDsW+9OTzRRGx6X7qU+yB7BDzLD4UiWal/61np
 FI68d5oNuM+XpcMwVNoGTwrkaxdBhSZIBUzJDI0QhA4zWS7dEyHUAqelRC2O7XaCFnpW
 T/kg==
X-Forwarded-Encrypted: i=1;
 AKwUvByWyeBVWUS0hBkJIT0yXLPOfBg5XsIKQc+3M9k9xwHKqJbYCtpAZfpfQCmPebGhrfSjDQohZ5wh0jiO@nongnu.org
X-Gm-Message-State: AFq9FYI3zldV723AgZoqybENjtqGL3DJxbpO1AmH3gDfx7fdDtFlEOdH
 hIwiw9R68rmidmq9wOPOLDVleA+Bml+Wd/uC96vrjSI6P4R1poRl1uCJN+8b0eCSGBi2r5sSHcd
 iD6B2a5edMLoMEMb3G+FPv8R+dTiaUzE9tSiLt/MLGUJTAGz7LIVpcycagg==
X-Gm-Gg: AYBFou1jce4PADn+H2NPEyn4mI6qG94E+Q+PjV13G6WRsQwIqUhGmih+LwzUbKOKqg+
 cyUwEGS43CBe3EdNdDyOEoZhgGgtsgDa5PmZfN0DeGNCtC4ALnvUL+v9ZfrmS94vE8kmo7Lw2hb
 2RxXAjQ0Re8/LYdzRdAYVELewhOIOozL9yA3MVgA+++zoh1iE+zt1CY6Ur9nM+jflFC+Z7+Zjbj
 hEkj9das6mhtyb5kMLl7n72sJsFVGFoQGAc0J4A8ccySXEf05FuYTEPJIlRiNw9uzTqrEanOPMv
 4Kb4e233cW9pMYzj4F2WQ+EeAYBu6Aelx/1e9bM0yHfToKuGjekU7I+ADTheY4Wpjf5ItTOYYSM
 Kg0HggiHVkUIxJSybn9nuWTRAOTAFDXpu5XypgGkscvAo6AlrCKJohSTtw/v7bADP
X-Received: by 2002:a05:6214:411a:b0:914:4bd3:d984 with SMTP id
 6a1803df08f44-9144bd3dc1cmr192166776d6.34.1790691648509; 
 Tue, 29 Sep 2026 07:20:48 -0700 (PDT)
X-Received: by 2002:a05:6214:411a:b0:914:4bd3:d984 with SMTP id
 6a1803df08f44-9144bd3dc1cmr192165996d6.34.1790691647761; 
 Tue, 29 Sep 2026 07:20:47 -0700 (PDT)
Received: from [10.222.168.219] (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9178d34bf62sm11218666d6.28.2026.09.29.07.20.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 07:20:45 -0700 (PDT)
Message-ID: <8e5a5acb-e4d3-4bd4-aad7-a744499c8526@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 09:20:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] target/hexagon: rename helper_wait to
 helper_hexagon_wait
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Song Gao <17746591750@163.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Ani Sinha <anisinha@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chao Liu <chao.liu@processmission.com>,
 Weiwei Li <liwei1518@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
References: <20260926110818.1912-1-luoyonggang@gmail.com>
 <20260926110818.1912-4-luoyonggang@gmail.com>
Content-Language: en-US
From: Brian Cain <brian.cain@oss.qualcomm.com>
In-Reply-To: <20260926110818.1912-4-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1NyBTYWx0ZWRfX5LHIwmcnEHiP
 oPbDZsYtHoqWwYYNES9TbjYYR50YtJwMQOVE09CsHBcO6SlMhrz70qeDmLS4N9e6/UmP4pSLcmg
 GE8vB3psyG7hcz38KqKGhG+SmWZ0oYg=
X-Proofpoint-GUID: 62dBF7OLmgPaNQZxZ8E-J1B1cCWe1imv
X-Authority-Analysis: v=2.4 cv=I5Hw19gg c=1 sm=1 tr=0 ts=6abbc941 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=rQifD2TXtPwWjqCNY9UA:9
 a=HBa1ZSjM1EYUQL3W:21 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 62dBF7OLmgPaNQZxZ8E-J1B1cCWe1imv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1NyBTYWx0ZWRfXy0HtaKBz7mnz
 +ZPIexFVBssH/UbMcL90nMrdUHqOsuEgPgk75GLbkljw2Juz2cHEuRoIIUcT2WjILbm9D/wxBae
 PdvtbEUAWxWljeffdDMDeQ2rZxgop6STvo71B+9rkLnbESNkp9zanS/U6lzGguu/TNckqCf6YSg
 SncRk09uDX3iL2GFvrGgUiwx7ib1X7JQfd4iMSp//3mV9BXYJt1R7k3YBYQYxKhpS9+QVJbPwQN
 ieR2Hh0sLnEZSckdNrYyZ0Oxh0jIxHwFK2KG2GLuSlOS7NTVtARaPV88wt2/6+/RnYJ1qElrCi7
 xjMcaoYIsbRnutHoFUesVh70Q9Tb/GXGkNKlPYrUHCNsrqPdS3vEjGAQGTfR7zlgDV1nk/6pF+y
 R5t4ZhR3d8DcPEQUds3vzW6SOpZPIuF2sZMAqlikqSSi+o0J+XL+n4+//VFijz92F0KJ6p8qFtn
 1HJm63kWHNbckb2iuBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290057
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


On 9/26/2026 6:08 AM, Yonggang Luo wrote:
> helper_wait is a global C symbol. Prefix it and take the resume PC
> as vaddr.
>
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---

Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>


>   target/hexagon/gen_tcg_sys.h | 2 +-
>   target/hexagon/helper.h      | 2 +-
>   target/hexagon/op_helper.c   | 8 ++++----
>   3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/target/hexagon/gen_tcg_sys.h b/target/hexagon/gen_tcg_sys.h
> index af5032214c4..489d2780470 100644
> --- a/target/hexagon/gen_tcg_sys.h
> +++ b/target/hexagon/gen_tcg_sys.h
> @@ -80,7 +80,7 @@
>   #define fGEN_TCG_Y2_wait(SHORTCODE) \
>       do { \
>           RsV = RsV; \
> -        gen_helper_wait(tcg_env, tcg_constant_tl(ctx->pkt.pc)); \
> +        gen_helper_hexagon_wait(tcg_env, tcg_constant_vaddr(ctx->pkt.pc)); \
>       } while (0)
>   
>   #define fGEN_TCG_Y2_resume(SHORTCODE) \
> diff --git a/target/hexagon/helper.h b/target/hexagon/helper.h
> index 71c8da4c46d..030ed6dcef5 100644
> --- a/target/hexagon/helper.h
> +++ b/target/hexagon/helper.h
> @@ -136,7 +136,7 @@ DEF_HELPER_3(sreg_write_masked, void, env, i32, i32)
>   DEF_HELPER_3(setprio, void, env, i32, i32)
>   DEF_HELPER_2(start, void, env, i32)
>   DEF_HELPER_1(stop, void, env)
> -DEF_HELPER_2(wait, void, env, i32)
> +DEF_HELPER_2(hexagon_wait, void, env, vaddr)
>   DEF_HELPER_2(resume, void, env, i32)
>   DEF_HELPER_1(resched, void, env)
>   DEF_HELPER_3(modify_ssr, void, env, i32, i32)
> diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
> index 4f00ca773f3..7f026292ce8 100644
> --- a/target/hexagon/op_helper.c
> +++ b/target/hexagon/op_helper.c
> @@ -1741,7 +1741,7 @@ static void set_wait_mode(CPUHexagonState *env)
>       SET_SYSTEM_FIELD(env, HEX_SREG_MODECTL, MODECTL_W, thread_wait_mask);
>   }
>   
> -static void hexagon_wait_thread(CPUHexagonState *env, uint32_t PC)
> +static void hexagon_wait_thread(CPUHexagonState *env, vaddr pc)
>   {
>       CPUState *cs;
>   
> @@ -1768,7 +1768,7 @@ static void hexagon_wait_thread(CPUHexagonState *env, uint32_t PC)
>           return;
>       }
>       set_wait_mode(env);
> -    env->wait_next_pc = PC + 4;
> +    env->wait_next_pc = pc + 4;
>   
>       cpu_interrupt(cs, CPU_INTERRUPT_HALT);
>   }
> @@ -1836,12 +1836,12 @@ void HELPER(resched)(CPUHexagonState *env)
>       resched(env);
>   }
>   
> -void HELPER(wait)(CPUHexagonState *env, uint32_t PC)
> +void HELPER(hexagon_wait)(CPUHexagonState *env, vaddr pc)
>   {
>       BQL_LOCK_GUARD();
>   
>       if (!fIN_DEBUG_MODE(env->threadId)) {
> -        hexagon_wait_thread(env, PC);
> +        hexagon_wait_thread(env, pc);
>       }
>   }
>   

