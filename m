Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pEr1s-0002E2-Ic
	for mharc-qemu-riscv@gnu.org; Mon, 09 Jan 2023 07:13:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEr1r-00029A-1A
 for qemu-riscv@nongnu.org; Mon, 09 Jan 2023 07:13:27 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEr1o-0007sA-0g
 for qemu-riscv@nongnu.org; Mon, 09 Jan 2023 07:13:26 -0500
Received: by mail-wr1-x42b.google.com with SMTP id z5so6882163wrt.6
 for <qemu-riscv@nongnu.org>; Mon, 09 Jan 2023 04:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oOa558W65nN+mwNWf4ehs5ixKO9EILkwd73Dl1/KY5o=;
 b=PuQuI74czYjUtr2rm0hjfOH1AslxKCn6g1PF6QqtoswM1Sk6U2qcMQ5B/4pTULuZeg
 oDWjOvVp/oUVD4wST9ssqo09Q/KRtsYWCtLIeQ5y4RD5jsok+vnMHmQXBp7GjaFa9aDc
 6JJXy6V9M/8H01dXogYeEaj+tXrBqmEM3pH5BInqskRGLPU2331GjkKAr7tDUZpsGOma
 NDfXpHPa+4g4Nv2fhsklrcV7hPfSlZe5Kw9x4kxAL3Rf/Q05pnQCxGdEqUqws6RZeuWq
 QTHaj/CobfOXIMCiV5absvugbdGvXmc7dLpv0xZBD/K04LoYSP5roTZjaZdfWu7VrP6f
 7gaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oOa558W65nN+mwNWf4ehs5ixKO9EILkwd73Dl1/KY5o=;
 b=WL+ZIQ9z0gGS8+QumTJ+TZCFbCWIURosYXSLi796ZdFbfaxLyP12NDMEd/bav653mG
 pKqYJgBMyTueIVtxRCC5KXq+iN5D0xUYrZ2gq1TsDqBDikEANwJgRxbhoyeC+nYnzx8G
 8c92fvhn+XKbhqfRDyjWJGAf7EPkJYeX/a7uj4GEDfvgUQy8H6us1a6UeY39c8Vbxfx7
 8T4rPvEkom3GPuAxbe9m9iYrt10qfW9JPvsJagr6gkSm6mhNUg6rWrxn359MWoiuxqOc
 AyrXMC4IBbC3CtXqPcExPKpRsnaGStXDwd2Ql4bh5W8ziTqATXEVmEcbLAh41ySA6iig
 Roow==
X-Gm-Message-State: AFqh2kpoIOCxzawVgoNZgksgfA6Mb12MypzAEvOlnOR8JsQIbcZiCijo
 8SRvX3/tNPJbqArdKKCGgOu5K1FMHq4y4TK+
X-Google-Smtp-Source: AMrXdXsHgQ52Ck2tp7xpe9Yo1kEeKssHFEVhiWNTk6eI1v+ApwgdTpbiT4ZQis3l97GX98/KQfVztQ==
X-Received: by 2002:a05:6000:1f1b:b0:2b8:27df:d43f with SMTP id
 bv27-20020a0560001f1b00b002b827dfd43fmr12843832wrb.24.1673266402512; 
 Mon, 09 Jan 2023 04:13:22 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k18-20020adfb352000000b00241fab5a296sm8637861wrd.40.2023.01.09.04.13.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 04:13:21 -0800 (PST)
Message-ID: <0e0f31fd-4d10-7bfe-af6d-3bee3cee1073@linaro.org>
Date: Mon, 9 Jan 2023 13:13:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 00/21] hw: Remove implicit sysbus_mmio_map() from
 pflash APIs
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20230109120833.3330-1-philmd@linaro.org>
Cc: qemu-ppc@nongnu.org, qemu-arm <qemu-arm@nongnu.org>,
 "open list:SiFive Machines" <qemu-riscv@nongnu.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Song Gao <gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109120833.3330-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 09 Jan 2023 12:13:27 -0000

On 9/1/23 13:08, Philippe Mathieu-Daudé wrote:
> Since v1:
> - Do not introduce pflash_cfi_create(), directly
>    open-code pflash_cfi_register() before removing it (Peter)
> - Added R-b tags

Sigh, my sendemail.cccmd command didn't work, so Cc'ing manually the cover.

> Paving the road toward heterogeneous QEMU, the limitations of
> having a single machine sysbus become more apparent.
> 
> The sysbus_mmio_map() API forces the caller to map a sysbus
> device to an address on the system bus (system bus here is
> the root MemoryRegion returned by get_system_memory() ).
> 
> This is not practical when each core has its own address
> space and group of cores have access to a part of the
> peripherals.
> 
> Experimenting with the PFLASH devices. Here the fix is
> quite easy: open-code the pflash_cfi_register() functions.
> 
> Since we were touching the PFLASH API, we restricted the
> PFlashCFI0X structures to their models. The API now deals
> with a generic qdev pointer (DeviceState*).
> 
> Please review,
> 
> Phil.
> 
> Based-on: <20230109115316.2235-1-philmd@linaro.org>
>            "hw/arm: Cleanups before pflash refactor"
> Based-on: <20230109120154.2868-1-philmd@linaro.org>
>            "hw/misc: Cleanups around PFLASH use"
> 
> Philippe Mathieu-Daudé (21):
>    hw/block: Rename TYPE_PFLASH_CFI02 'width' property as 'device-width'
>    hw/block: Pass DeviceState to pflash_cfi01_get_blk()
>    hw/block: Use pflash_cfi01_get_blk() in pflash_cfi01_legacy_drive()
>    hw/block: Pass DeviceState to pflash_cfi01_get_memory()
>    hw/arm: Use generic DeviceState instead of PFlashCFI01
>    hw/loongarch: Use generic DeviceState instead of PFlashCFI01
>    hw/riscv: Use generic DeviceState instead of PFlashCFI01
>    hw/i386: Use generic DeviceState instead of PFlashCFI01
>    hw/xtensa: Use generic DeviceState instead of PFlashCFI01
>    hw/sh4: Open-code pflash_cfi02_register()
>    hw/arm/digic: Open-code pflash_cfi02_register()
>    hw/arm/musicpal: Open-code pflash_cfi02_register()
>    hw/arm/xilinx_zynq: Open-code pflash_cfi02_register()
>    hw/block: Remove unused pflash_cfi02_register()
>    hw/block: Make PFlashCFI02 QOM declaration internal
>    hw/arm: Open-code pflash_cfi01_register()
>    hw/microblaze: Open-code pflash_cfi01_register()
>    hw/mips: Open-code pflash_cfi01_register()
>    hw/ppc: Open-code pflash_cfi01_register()
>    hw/block: Remove unused pflash_cfi01_register()
>    hw/block: Make PFlashCFI01 QOM declaration internal


