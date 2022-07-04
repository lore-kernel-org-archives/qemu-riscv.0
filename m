Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8IsD-00014b-N8
	for mharc-qemu-riscv@gnu.org; Mon, 04 Jul 2022 06:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8IsB-00012J-Uc
 for qemu-riscv@nongnu.org; Mon, 04 Jul 2022 06:00:07 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8Is9-0000OK-9w
 for qemu-riscv@nongnu.org; Mon, 04 Jul 2022 06:00:07 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 9so8494667pgd.7
 for <qemu-riscv@nongnu.org>; Mon, 04 Jul 2022 03:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jbXG5nHD9Kf5UQFUGz6qcmMIViCVERNKm9wbQIX+s2k=;
 b=KubAEpaZkKbp2BOGZOtfSGPN4e545N0AKaaeIMgHWwDpinxgD3/lA4dp2zfR2bnoY2
 SiNpR8zX0bjnXkXN3Wm573hZUXauXmZhmCKYNPWCry/KviXPrFVbDNSKENpiqX37ggJT
 LcQLtZqiq80y9LIDfPEKc2Lw1QLNP9+AOOiY7W89aadC39+J8KuKGlC1DpYRGielWSMj
 oTvOBnjgbjKdVnlMka/ouIlBx9qMwahmyV1cBcEPFUIShAfbE9iwIcz3Qdhx+C+PjaI0
 N0/AFGk2QPxWtK9dUjy+cBZuHlB3fH1RYEmaIGKNZKUcunNw4q/CbfD9sYOnMBxAPYW3
 r4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jbXG5nHD9Kf5UQFUGz6qcmMIViCVERNKm9wbQIX+s2k=;
 b=eJavsYxZ72dm2khOy5zge3baE4skSGqpD7YRO+ox2dBy2Dp7hEouK5/vSmeoGgqqkU
 84Pu/hb8cATBxScaSQyNGJznnnnbhfIYhksGAbrB1nsjB6FV+e6cnIg8fZUDCUsj8GNW
 dQ77Owv1m74WXujn+Q+ijNFL6ubHgQNnjemTMX5i3XW2OFheTxDQuZhjLIUrOOQu9/qc
 Q7zeVXIRFvkaZeBg9J42mQ+XjTrHXlAs8a9li8ELkcZ7dM2HIiF5U+A2rUgqY9doVspu
 ZvoZMutmD6LgQZe5W5VYeuOwQCBOXAikK90VR4ZCAy78yKv6WFRMSF3DNfsw7Tylquii
 UZnQ==
X-Gm-Message-State: AJIora/jWkxKFQil9DpjUi610F9095NuiXVdeJO65LaU5uo0aza+Ulno
 dYxHWZdiKCxQX96/UMBRagjXwA==
X-Google-Smtp-Source: AGRyM1sVfPO5qausPlo/8gyT74P3aAO0AyUWnmKqS/KGuyhhJaiALtR+9fa+UqvHZYJrCnCCyChmlQ==
X-Received: by 2002:a05:6a00:1a91:b0:525:a57c:25f3 with SMTP id
 e17-20020a056a001a9100b00525a57c25f3mr35742143pfv.75.1656928803879; 
 Mon, 04 Jul 2022 03:00:03 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 w66-20020a627b45000000b005286697ec68sm1803043pfc.133.2022.07.04.03.00.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 03:00:03 -0700 (PDT)
Message-ID: <272f1e82-ff1b-9a7a-931b-91472dd244bf@linaro.org>
Date: Mon, 4 Jul 2022 15:29:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 03/11] goldfish_rtc: Add endianness property
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>,
 Laurent Vivier <lvivier@redhat.com>, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:Goldfish RTC" <qemu-riscv@nongnu.org>
References: <20220703212823.10067-1-shorne@gmail.com>
 <20220703212823.10067-4-shorne@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220703212823.10067-4-shorne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 04 Jul 2022 10:00:08 -0000

On 7/4/22 02:58, Stafford Horne wrote:
> -static const MemoryRegionOps goldfish_rtc_ops = {
> -    .read = goldfish_rtc_read,
> -    .write = goldfish_rtc_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> -    .valid = {
> -        .min_access_size = 4,
> -        .max_access_size = 4
> -    }
> +static const MemoryRegionOps goldfish_rtc_ops[3] = {
> +    [DEVICE_NATIVE_ENDIAN] = {
> +        .read = goldfish_rtc_read,
> +        .write = goldfish_rtc_write,
> +        .endianness = DEVICE_NATIVE_ENDIAN,
> +        .valid = {
> +            .min_access_size = 4,
> +            .max_access_size = 4
> +        }
> +    },
> +    [DEVICE_LITTLE_ENDIAN] = {
> +        .read = goldfish_rtc_read,
> +        .write = goldfish_rtc_write,
> +        .endianness = DEVICE_LITTLE_ENDIAN,
> +        .valid = {
> +            .min_access_size = 4,
> +            .max_access_size = 4
> +        }
> +    },
> +    [DEVICE_BIG_ENDIAN] = {
> +        .read = goldfish_rtc_read,
> +        .write = goldfish_rtc_write,
> +        .endianness = DEVICE_BIG_ENDIAN,
> +        .valid = {
> +            .min_access_size = 4,
> +            .max_access_size = 4
> +        }
> +    },
>   };

You don't need 3 copies, only big and little.

> +static Property goldfish_rtc_properties[] = {
> +    DEFINE_PROP_UINT8("endianness", GoldfishRTCState, endianness,
> +                      DEVICE_NATIVE_ENDIAN),
> +    DEFINE_PROP_END_OF_LIST(),
> +};

... and I think the clear desire for default is little-endian.  I would make the property 
be bool, and add a comment that this is only for m68k compatibility, so don't use it in 
new code.


r~

