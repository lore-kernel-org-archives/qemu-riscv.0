Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305A1CCA474
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 15:23:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3yTu-0005Yu-6i; Wed, 01 Oct 2025 11:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yTC-00051u-O6
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:10:22 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yRL-000102-0w
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 11:10:17 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-46e542196c7so6746925e9.0
 for <qemu-riscv@nongnu.org>; Wed, 01 Oct 2025 08:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759331297; x=1759936097; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AIzO+so5KPpKzYj7ZNyXWUr3LlH8ilSE/g0AxNVpzLk=;
 b=frX/pU08FU3nH0HNXJNevCrdIKND5TwEvt4g/ZLwm6F/axJCF8831FIDag2g6BqnTw
 XWc4EbXNoHROVeaCcnFxBsQBGZMU6oomNTHesmXBPY+rAilcJ5JMR1TO+KWkJMHcLkt2
 vV90WZIywuyW1Rpg1EydMjJi2L5w89DJu911O/5bwBU/mT6jRlabNDDdjZ6GMtyKBzlG
 gB9aCNWbVf4TGyL2aaZYir2S1gYgarv1lS7eZs2bd/Plcwr6O8BnPiU+qTcjsK11heC0
 CFpeIlpazO+NCLMjqPKHMjTE7oSG2MWr33/N6HIJIQc9ubKdtU1lnrMGRmru/V2A+gac
 GzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759331297; x=1759936097;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AIzO+so5KPpKzYj7ZNyXWUr3LlH8ilSE/g0AxNVpzLk=;
 b=C1l3y4++EbmfBNsSeVc2Z62EABlZD5jk4YxhhUpmhVBfNro9nhdLVmPuBXkvjJv2cO
 xwoEMYvNV3a7kOjgkN1o3E6HWVI7Q5pi0c72+86zjeBySkw/s1A21Cg/vcE6qsS5CaTk
 QXady1NmUU4c7U4rFRUylFiEE7p1sN7Ow+WZ58l/oG5fOJm6bz1v1zjGhK5naQsYjEEH
 OcKrprKtzpDH9yOYJVwLtXOdgZAOqn4Ibqd1luishhysw/1uChi8enwPwT4awcCjVGnf
 nR4p1Xe4vMcFb0vXAz+cROyJ8ZdDEXuLAJ4M0T+aaC2/OarU9A+EEPjYSIK4hummVe9c
 jX6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1X1YfIY8Xsip9PDtV3E4eKSufKpVOVcwC/cy+giL+6Tz740YrvwRtxHon2wspnDZ+EzVRH18h2F1T@nongnu.org
X-Gm-Message-State: AOJu0YyJCu4rOmwT06ioJCqLaFiWMrFama+g8rCTE3KLElFQEhqvq5R2
 bD/XBQsA8KIE4yniRECq3SUqVH3/NNVsx7mjsJTm5HPbYlp5x2ow7sgScFMeyyqaaV0=
X-Gm-Gg: ASbGnctPmRZt8QjqhR5M/1IAOmESIYc++6kmr+zwL6cqZ6A8TdpKabVnp8Ag63zCogc
 JbTik0ljRRlVlldTtvim20JQkcHTWBLxu8K+KUt6G1fy0GyGHsWVGpEWgCyOhydIp2PWFIXY55l
 FIL8HoOSn87Ig+yDoSE/q9nOlHh6n2ejhWBY4JJlHY8MjckZMSBqR5vlKm+sisz5EHsMj4M7l0J
 8i4GK8cFEXtJ7PQKI9WnzxkqwZfHKtCwghuseBh41Su11Kn3t7WYMunMlKiI6i/B/TkWRE8YDOb
 98378jxMKdfCuHBG9x/jkrpV0YIGx0BRnkHOqiHkcgvRoBZxNlV3BLIcELZKBvrJhundh4audGv
 V9IITpT9YhKA6Pu3KfMcO3HkeKJrwNwAOZb4HG84RxzzOKsu779lUsk2SHHxL97S634y4bEdl11
 qHqEwdfzL32XxsYA==
X-Google-Smtp-Source: AGHT+IF8lK0vCB6Jq0ASp5XON3vV1O5ddVDMpb/bh1bTP5csPrsFSBh6gHEnoWssD9AA1CELhwJX3Q==
X-Received: by 2002:a05:600c:8414:b0:45b:8ac2:9761 with SMTP id
 5b1f17b1804b1-46e612c8a6fmr34590585e9.13.1759331297205; 
 Wed, 01 Oct 2025 08:08:17 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb9768bdesm27674817f8f.23.2025.10.01.08.08.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 08:08:16 -0700 (PDT)
Message-ID: <755adcfb-95eb-46f4-8c73-34c43e6b85ab@linaro.org>
Date: Wed, 1 Oct 2025 17:08:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/22] hw/core/loader: Get cpu first addr space with
 cpu_get_address_space()
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, Peter Xu
 <peterx@redhat.com>, Alistair Francis <alistair@alistair23.me>
References: <20251001150529.14122-1-philmd@linaro.org>
 <20251001150529.14122-5-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251001150529.14122-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 1/10/25 17:05, Philippe Mathieu-Daudé wrote:
> In order to remove the convenient CPUState::as field, access
> the vcpu first address space using the cpu_get_address_space()
> helper.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/core/generic-loader.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)


> @@ -130,7 +131,7 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
>       }
>   
>       if (s->file) {
> -        AddressSpace *as = s->cpu ? s->cpu->as :  NULL;
> +        AddressSpace *as = cpu_get_address_space(s->cpu, 0);

Oops, I missed the NULL check.

>   
>           if (!s->force_raw) {
>               size = load_elf_as(s->file, NULL, NULL, NULL, &entry, NULL, NULL,


