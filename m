Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F1AC4167B
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 09:30:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r7uPV-0002ve-6S; Tue, 28 Nov 2023 04:29:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r7uPU-0002um-3D
 for qemu-riscv@nongnu.org; Tue, 28 Nov 2023 04:29:40 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r7uPP-0000hJ-3p
 for qemu-riscv@nongnu.org; Tue, 28 Nov 2023 04:29:39 -0500
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a00cbb83c82so743164066b.2
 for <qemu-riscv@nongnu.org>; Tue, 28 Nov 2023 01:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701163772; x=1701768572; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=du8yRDrQyafQjmDYUSBdE7OyJ1dquNjYM+twJVYf+lA=;
 b=UIFejMT0raZE4kACA9ryh6IVJ5f3mpkwcxhX3KEhloX79HPKdtD53PdDJbveu78QYL
 Vc4WuZAROZ9b2m1Q+P51JN33qn/IotRz+gx3tKT8Xxt1Nkk9dVO/1VCYYaI3ErZDwNMI
 47tYmpfMxrt4eKwIomH0Q1A0YQ5JS/BpbpRTzIshuRe1Sr+/Dxei6dFBPQGnxLsqrYUN
 3zN8bvt+dMIF+0idcbzu/KYI0cKBgWvOF7wihkY0U0sjGBH+ubfuFRE4kvC5W+lJyykE
 Qqk2nabfQxUQE/gmuQaJpZB6VZ7Mlvt0G6ojyoiA8drg/AhwQ7Ub4D/psafZ6sBHwacm
 kcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701163772; x=1701768572;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=du8yRDrQyafQjmDYUSBdE7OyJ1dquNjYM+twJVYf+lA=;
 b=RU2cLbCo3uuKFGt5JNs+qTaKh4M1cCkrvvE8nWJtVDG881Lsido/xEmTtjcqFa0VfB
 z7eFMW+Te0GEf9gzkHiY80ihUkpNCYnvvk4mXC5FjDsF00/7pkX3mahi3hPa6cw6cHcB
 zOmjP/nZnIFVVyuqP1qIlDySdjk0Yd4j3Og2aKFImy9VlErxEOsfhTmCnkss4oCWhW/M
 ScIXdDbiHlBB+YlhHfQNFi8S+0CT9BYB3skUGtaeCwRCQwOaPpdi77kjrhfTZI5npLed
 wWMju5B3HwBjrHezFFQZ54LMRJntlQvmV1w9QuQv+owK3+sWp/7oN0nf1RsWGf6bRJlu
 m61w==
X-Gm-Message-State: AOJu0YwwMnAbdUST3OiftIy3d15S37XZ9G0gWQeSDxhp6Z77+bYA668H
 tWhETwyNsKF2ZIl2cx6qS+8SNA==
X-Google-Smtp-Source: AGHT+IELN/RXpeeLeLQhIC5uKxQ7qTuGdRztTEibcNSv7OgUa45hfT7F+L3zZCxP7lP0zlysKxPCOg==
X-Received: by 2002:a17:906:99c7:b0:9ba:65e:7529 with SMTP id
 s7-20020a17090699c700b009ba065e7529mr13204547ejn.68.1701163772119; 
 Tue, 28 Nov 2023 01:29:32 -0800 (PST)
Received: from [192.168.69.100] (crb44-h02-176-184-13-61.dsl.sta.abo.bbox.fr.
 [176.184.13.61]) by smtp.gmail.com with ESMTPSA id
 bw24-20020a170906c1d800b009fc24437439sm6580993ejb.158.2023.11.28.01.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 01:29:31 -0800 (PST)
Message-ID: <f3bf354b-cf46-40d1-89b2-35bdd5074840@linaro.org>
Date: Tue, 28 Nov 2023 10:29:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/8] hw/arm/virt: Hide host CPU model for tcg
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, richard.henderson@linaro.org,
 quic_llindhol@quicinc.com, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
References: <20231126231210.112820-1-gshan@redhat.com>
 <20231126231210.112820-5-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231126231210.112820-5-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
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

On 27/11/23 00:12, Gavin Shan wrote:
> The 'host' CPU model isn't available until KVM or HVF is enabled.
> For example, the following error messages are seen when the guest
> is started with option '-cpu cortex-a8' on tcg after the next commit
> is applied to check the CPU type in machine_run_board_init().
> 
>    ERROR:../hw/core/machine.c:1423:is_cpu_type_supported: \
>    assertion failed: (model != NULL)
>    Bail out! ERROR:../hw/core/machine.c:1423:is_cpu_type_supported: \
>    assertion failed: (model != NULL)
>    Aborted (core dumped)
> 
> Hide 'host' CPU model until KVM or HVF is enabled. With this applied,
> the valid CPU models can be shown.
> 
>    qemu-system-aarch64: Invalid CPU type: cortex-a8
>    The valid types are: cortex-a7, cortex-a15, cortex-a35, \
>    cortex-a55, cortex-a72, cortex-a76, cortex-a710, a64fx, \
>    neoverse-n1, neoverse-v1, neoverse-n2, cortex-a53,      \
>    cortex-a57, max
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/arm/virt.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


