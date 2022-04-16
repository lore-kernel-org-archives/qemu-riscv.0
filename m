Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nfmjw-0008ME-6y
	for mharc-qemu-riscv@gnu.org; Sat, 16 Apr 2022 14:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nfmjr-0008LL-1Z; Sat, 16 Apr 2022 14:01:43 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:43848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nfmjp-0000SD-5Z; Sat, 16 Apr 2022 14:01:38 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 n40-20020a05600c3ba800b0038ff1939b16so5456170wms.2; 
 Sat, 16 Apr 2022 11:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZmqhPo1FcCeCvpPfs6MSRsm8aBEqqCnzKwx66WNqKVg=;
 b=Fon7Ml7nu4eawGP6Kuj+naovFFxBbEyzHfwyH74HSJIYQvhJ+QIf6j82J38dXxA08t
 OKYlpEYGWLpmmKohdx6IHf5c65LbInH4+lMQb4zdunGFQXnfQU4ArXLvJ9ZOqHAYJb8T
 Z9jZtZ79eGes/GkIvFDXDwZhEBIy9lgtV1UYxqEnV1fIb1jeek9OREHp4guHo84GMIgy
 JbTXkE7wd5x+GLHTltatitPmqGTKfrZaKxiAKfQabcbXfHr+jZs1QGIcWGGnjPX/k2Ez
 ff4diAuDVsIKwjX7C6GCkOJtiqVtoJNK0fccBW5bOM7IkaCrPXp8OW0jc9zWvo8O/KYz
 lYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZmqhPo1FcCeCvpPfs6MSRsm8aBEqqCnzKwx66WNqKVg=;
 b=h0w1386ZNra51I+lkpn1q5LKEDwWQy+IPPOtKSFGGDtjvzG+MkPsrh17gzr7Gi3hGR
 2iSHEk0zcjxrV+PqdFYKcV9TfQ4PJSuAnOzFF+Y5Uop5Ltmpj2BnAh8c+YYSjYkROOpf
 R3Mvoi//Ug5a9yePhLrt6LzagtDLXbfw3WPAPKzOxKQCubrzRYMgvgYiWzjOaUjmgJNV
 oUJNWUZYIJ87IYvace4ie0zGs3yciFJfs3pX9JotDO/ewYFlWmepTSmHe2WrEcNUHlyb
 zwOJdzkLwjXCLYtVN/E5CZrkyOGNGpaMmW+iALHItgXRU2tMmOGULzT1c+nFn1zzlZYF
 lkvg==
X-Gm-Message-State: AOAM533cfvntalKf2BxGO9x2SbbzmYh84/JflizOjOZa53FvQpl78xnU
 L8ausn9Vg2m1t0hDm3yKv1k=
X-Google-Smtp-Source: ABdhPJyAdSt8Q8/C+quiDAGu1pQFNpcrx7mbgCiO6IU65PdFwFqm8IG7USqIIK6kutWbU5VxKlCQ3A==
X-Received: by 2002:a1c:f30b:0:b0:37b:b5de:c804 with SMTP id
 q11-20020a1cf30b000000b0037bb5dec804mr8073958wmq.166.1650132095015; 
 Sat, 16 Apr 2022 11:01:35 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:a0d5:a739:3557:2461?
 ([2600:70ff:f07f:0:a0d5:a739:3557:2461])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a5d6091000000b00207a89b952asm6609561wrt.77.2022.04.16.11.01.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Apr 2022 11:01:34 -0700 (PDT)
Message-ID: <4908839f-b3bc-f6bc-cf73-bbf91fe37a8d@gmail.com>
Date: Sat, 16 Apr 2022 20:01:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 08/18] hw/arm/arm_cpus: add arm_cpus device
Content-Language: en-US
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
Cc: mark.burton@greensocs.com, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Vijai Kumar K <vijai@behindbytes.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
 <20220330125639.201937-9-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220330125639.201937-9-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 16 Apr 2022 18:01:43 -0000

On 30/3/22 14:56, Damien Hedde wrote:
> This object can be used to create a group of homogeneous
> arm cpus.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>   include/hw/arm/arm_cpus.h | 45 ++++++++++++++++++++++++++++
>   hw/arm/arm_cpus.c         | 63 +++++++++++++++++++++++++++++++++++++++
>   hw/arm/meson.build        |  1 +
>   3 files changed, 109 insertions(+)
>   create mode 100644 include/hw/arm/arm_cpus.h
>   create mode 100644 hw/arm/arm_cpus.c

> +/**
> + * ArmCpusState:
> + * @reset_hivecs: use to initialize cpu's reset-hivecs
> + * @has_el3: use to initialize cpu's has_el3
> + * @has_el2: use to initialize cpu's has_el2
> + * @reset_cbar: use to initialize cpu's reset-cbar
> + */
> +struct ArmCpusState {
> +    CpusState parent_obj;
> +
> +    bool reset_hivecs;
> +    bool has_el3;
> +    bool has_el2;
> +    uint64_t reset_cbar;
> +};
> +
> +/*
> + * arm_cpus_get_cpu:
> + * Helper to get an ArmCpu from the container.
> + */
> +static inline ARMCPU *arm_cpus_get_cpu(ArmCpusState *s, unsigned i)

Maybe we can avoid using 'State' suffix for CPU (still using Class 
suffixes) and name this:

   ARMCPU *arm_cpus_group_get_cpu(ArmCpusGroup *s, unsigned index);

