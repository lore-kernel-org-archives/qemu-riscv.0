Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A47FC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 22:09:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLsNU-0005Yk-Fp; Fri, 05 Jan 2024 17:09:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLsNQ-0005YC-Ik
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 17:09:17 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLsNM-00061e-Nr
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 17:09:16 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40d2376db79so394725e9.0
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 14:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704492550; x=1705097350; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0gROPC5fs6NdeS9QyqedB7eGwku9xj7SxpScPW1yzcI=;
 b=tcK6KC1d1RB/QrbCJ7csUU/0mRrp9+w1o4hop4VfRmFlTobdFysxdGkLPglQEvq2wZ
 SMzWp7ZN61WEB1aDAxl/XjcKuCL6hL/MbXITjkCXcnvjpsOFAhMAHOHnhO+BXyXczn4E
 /MKU+d6lU/DhbYc0c7mdkvJbHkYr/JM5CdARU7Gx69/9Z/haPTF93qXk8JJlQ73+Ojm+
 0J8SdqY+wp2t+UDdSDzjRpA8nkWPCBabhZMKksiaLMsQBvvv9U5nYMIae4DX81jZ1l9i
 VZ5CthR68Oy1jvz2n4W1zo42QMwElH00i0t8BWHhucrfOaCOSP1FgZ26h36qZGOnkaJb
 JwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704492550; x=1705097350;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0gROPC5fs6NdeS9QyqedB7eGwku9xj7SxpScPW1yzcI=;
 b=wNpSy1wajiAdSh8R1tRrqSRmYolZgw5I2YcrJ6C4/bIqqvJf8/racfAMg3cITKDiUn
 2s7Wg0FQngxZaiZ8H0+WcAdudhOdXwjvNrJQ5LMVbq1CusbNCVE/TLvoeAjH0JZK/LjM
 yOJDyTFgG9dr+vHRxBm/mA3VzsNaBpX9ft+gLQ3lRNFu8ma5+dKCrkZf7dO+6j6NtLLu
 m3c9LGt5n03o02eHTwNLQN+sg0j7oCtIWylROuBj0qh3at+r9YCIGT00/Hc1RAWd15sB
 +mJvDJixtQz9QWRUuj2KoFt4iVQWVBQOaCwx1IyCWRKcUKOA1iXbzMVsW2Oiluyzlfsw
 Atpg==
X-Gm-Message-State: AOJu0YxsqVN0OOawvWDzaOAHb4q/r93zN/C2sKtVBAb/WXClaFoxIKR4
 iz6YSbZOET6ucQRiNyHNEYXr5RaS2bzFSw==
X-Google-Smtp-Source: AGHT+IH8fV5TA1ZDPkRIyoPDUuzDFPXq1YmM7tMcmRnfI5JhhsyxLrZDlEoB9Pw9h8P3jQ38k5A8cw==
X-Received: by 2002:a05:600c:4f46:b0:40c:692e:257c with SMTP id
 m6-20020a05600c4f4600b0040c692e257cmr76464wmq.125.1704492549911; 
 Fri, 05 Jan 2024 14:09:09 -0800 (PST)
Received: from [192.168.69.100] (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 p7-20020a05600c468700b0040d30af488asm2768347wmo.40.2024.01.05.14.09.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jan 2024 14:09:09 -0800 (PST)
Message-ID: <3ef0442a-800c-47ac-a685-2f31b0cb136c@linaro.org>
Date: Fri, 5 Jan 2024 23:09:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/9] machine: Improve is_cpu_type_supported()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, imammedo@redhat.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, armbru@redhat.com,
 wangyanan55@huawei.com, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
References: <20231204004726.483558-1-gshan@redhat.com>
 <20231204004726.483558-4-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231204004726.483558-4-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 4/12/23 01:47, Gavin Shan wrote:
> It's no sense to check the CPU type when mc->valid_cpu_types[0] is
> NULL, which is a program error. Raise an assert on this.
> 
> A precise hint for the error message is given when mc->valid_cpu_types[0]
> is the only valid entry. Besides, enumeration on mc->valid_cpu_types[0]
> when we have mutiple valid entries there is avoided to increase the code
> readability, as suggested by Philippe Mathieu-Daudé.
> 
> Besides, @cc comes from machine->cpu_type or mc->default_cpu_type. For
> the later case, it can be NULL and it's also a program error. We should
> use assert() in this case.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> v9: assert(mc->valid_cpu_types[0] != NULL)                   (Phil)
>      assert(cc != NULL);                                      (Phil)
> ---
>   hw/core/machine.c | 20 ++++++++++++++------
>   1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 1797e002f9..4ae9aaee8e 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1400,6 +1400,7 @@ static bool is_cpu_type_supported(const MachineState *machine, Error **errp)
>        * type is provided through '-cpu' option.
>        */
>       if (mc->valid_cpu_types && machine->cpu_type) {
> +        assert(mc->valid_cpu_types[0] != NULL);
>           for (i = 0; mc->valid_cpu_types[i]; i++) {
>               if (object_class_dynamic_cast(oc, mc->valid_cpu_types[i])) {
>                   break;
> @@ -1409,20 +1410,27 @@ static bool is_cpu_type_supported(const MachineState *machine, Error **errp)
>           /* The user specified CPU type isn't valid */
>           if (!mc->valid_cpu_types[i]) {
>               error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
> -            error_append_hint(errp, "The valid types are: %s",
> -                              mc->valid_cpu_types[0]);
> -            for (i = 1; mc->valid_cpu_types[i]; i++) {
> -                error_append_hint(errp, ", %s", mc->valid_cpu_types[i]);
> +            if (!mc->valid_cpu_types[1]) {
> +                error_append_hint(errp, "The only valid type is: %s\n",
> +                                  mc->valid_cpu_types[0]);
> +            } else {
> +                error_append_hint(errp, "The valid types are: ");
> +                for (i = 0; mc->valid_cpu_types[i]; i++) {
> +                    error_append_hint(errp, "%s%s",
> +                                      mc->valid_cpu_types[i],
> +                                      mc->valid_cpu_types[i + 1] ? ", " : "");
> +                }
> +                error_append_hint(errp, "\n");
>               }
>   
> -            error_append_hint(errp, "\n");
>               return false;
>           }
>       }
>   
>       /* Check if CPU type is deprecated and warn if so */
>       cc = CPU_CLASS(oc);
> -    if (cc && cc->deprecation_note) {
> +    assert(cc != NULL);
> +    if (cc->deprecation_note) {
>           warn_report("CPU model %s is deprecated -- %s",
>                       machine->cpu_type, cc->deprecation_note);
>       }

Since we were getting:

$ qemu-system-s390x -M none
QEMU 8.2.50 monitor - type 'help' for more information
qemu-system-s390x: ../../hw/core/machine.c:1444: _Bool 
is_cpu_type_supported(const MachineState *, Error **): Assertion `cc != 
NULL' failed.
Aborted (core dumped)

I added a check on mc->valid_cpu_types before calling
is_cpu_type_supported() in the previous patch. See commit acbadc5a29.

