Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105B2C197A0
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 09:34:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3Ykn-0007dv-4l; Thu, 16 Nov 2023 04:33:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3Ykm-0007dT-Bf
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 04:33:40 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3Ykk-0001zN-Ht
 for qemu-riscv@nongnu.org; Thu, 16 Nov 2023 04:33:39 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40907b82ab9so10346935e9.1
 for <qemu-riscv@nongnu.org>; Thu, 16 Nov 2023 01:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700127215; x=1700732015; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BKHKZOdUPEdAi4OebjmiImqBlPQ23rLgYgjM01kf4k8=;
 b=NEBsSW9LvXVibOtJaYGptPw6WBex2KYSLRnFixVzqcy0N8Ebprwctip5YxfOzraFdQ
 JooihvsvMtN+nVjlFhBPyUqJDajW717XPVRWT2w8MYJKjXbkvFClu508xPhfEOBwFYdj
 VfW7GGzpD0VFfY0XGCNFe7Swr2FOuXgxQepvdwTiEPfReDMk2Apk2FFJy0tQy0BSZWGv
 rnjXgEO7RPgVL6Sdh4SUYTewwpAvtZ8hMI01cPmViDKguaJimvJVSe6w04gvgfpsDn8t
 sU+SFCHyvWJGpzwxqT68Xi1n1Y53BScKq1P05eocuUhxxWsAwKWXCUcCOk4i2bBQqGNm
 FZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700127215; x=1700732015;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BKHKZOdUPEdAi4OebjmiImqBlPQ23rLgYgjM01kf4k8=;
 b=llC8LZ3HF4lG5M8FaVu3pf8DaN85WzrqcmXQXjnDzzJiCU8G0dNmXEjULSOMLyWSd8
 Rqv5nAWlOTQYY6v6WexnDx4wfs9DafItx1Dt8kBnWGKsHGd6OfHtmwMsvNbsM/D++FCC
 QOzfbkhm0vkp3U368jQMy3yDRY2il+RuN1GK1KwBElYmNkQAP2iPnUoeXfaPBFMunjZb
 AnM5Y3PaQCrUvQYNgBLPffoXYV/ZWmHcA9He9kmQnzJmvrWIHLu3deYTDvE8IPJ/yF1Z
 eWOJwAswp2xw5CXCSlbgTP2nrSkOb9iACBQ43HdZ9kMS8ttCoNZo8uRzu8fLfRgXdwpP
 rz7A==
X-Gm-Message-State: AOJu0YzJzOqwsyOmBXVmlyZ6HD0sRIKRWqdtADZBWlbjpdhJq5mm0Q14
 aOIESeJ+Ew0zVlX6zOt/9ehRtA==
X-Google-Smtp-Source: AGHT+IFEPhS7QanbNHuKpcOCpbU/nu1NEE5rgpyZneU/O1Bc7kxZiSLZV0ikK66kl3i0GsnJkcc5kQ==
X-Received: by 2002:a5d:6da4:0:b0:32d:9d03:29e6 with SMTP id
 u4-20020a5d6da4000000b0032d9d0329e6mr905695wrs.27.1700127215562; 
 Thu, 16 Nov 2023 01:33:35 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a5d6187000000b0032dc74c093dsm13044830wru.103.2023.11.16.01.33.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 01:33:35 -0800 (PST)
Message-ID: <25571924-3569-48f4-8b60-17f14e8261ea@linaro.org>
Date: Thu, 16 Nov 2023 10:33:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 25/31] machine: Introduce helper is_cpu_type_supported()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
 <20231114235628.534334-26-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-26-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 15/11/23 00:56, Gavin Shan wrote:
> The logic, to check if the specified CPU type is supported in
> machine_run_board_init(), is independent enough. Factor it out into
> helper is_cpu_type_supported(). machine_run_board_init() looks a bit
> clean with this. Since we're here, @machine_class is renamed to @mc
> to avoid multiple line spanning of code. The comments are tweaked a
> bit either.
> 
> No functional change intended.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/core/machine.c | 82 +++++++++++++++++++++++++----------------------
>   1 file changed, 44 insertions(+), 38 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 5b45dbbbd5..49e0bc874d 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1387,13 +1387,51 @@ out:
>       return r;
>   }
>   
> +static void is_cpu_type_supported(MachineState *machine, Error **errp)

'const MachineState *'.

> +{
> +    MachineClass *mc = MACHINE_GET_CLASS(machine);
> +    ObjectClass *oc = object_class_by_name(machine->cpu_type);
> +    CPUClass *cc;
> +    int i;
> +
> +    /*
> +     * Check if the user specified CPU type is supported when the valid
> +     * CPU types have been determined. Note that the user specified CPU
> +     * type is provided through '-cpu' option.
> +     */
> +    if (mc->valid_cpu_types && machine->cpu_type) {
> +        for (i = 0; mc->valid_cpu_types[i]; i++) {
> +            if (object_class_dynamic_cast(oc, mc->valid_cpu_types[i])) {
> +                break;
> +            }
> +        }
> +
> +        /* The user specified CPU type isn't valid */
> +        if (!mc->valid_cpu_types[i]) {
> +            error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
> +            error_append_hint(errp, "The valid types are: %s",
> +                              mc->valid_cpu_types[0]);

This hint could be clearer if only an unique CPU is allowed.

> +            for (i = 1; mc->valid_cpu_types[i]; i++) {
> +                error_append_hint(errp, ", %s", mc->valid_cpu_types[i]);
> +            }
> +
> +            error_append_hint(errp, "\n");
> +            return;
> +        }
> +    }
> +
> +    /* Check if CPU type is deprecated and warn if so */
> +    cc = CPU_CLASS(oc);
> +    if (cc && cc->deprecation_note) {
> +        warn_report("CPU model %s is deprecated -- %s",
> +                    machine->cpu_type, cc->deprecation_note);
> +    }
> +}


