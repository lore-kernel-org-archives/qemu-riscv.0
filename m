Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ouiks-0005IN-HK
	for mharc-qemu-riscv@gnu.org; Mon, 14 Nov 2022 18:20:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouifW-0005tR-UC
 for qemu-riscv@nongnu.org; Mon, 14 Nov 2022 18:15:18 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouYW4-0004Eh-N8
 for qemu-riscv@nongnu.org; Mon, 14 Nov 2022 07:24:46 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso10539537wme.5
 for <qemu-riscv@nongnu.org>; Mon, 14 Nov 2022 04:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JQZ0w7BBOuzs1TWd474FOkYAGshwH2dUWhpkOrTyXt4=;
 b=XnpkQpgQe5YFzEvyLyLSzR6qA7E0dxH3R/dLCI+R1fkp/LFU6VgLiIQM7sX1P6EI9d
 yFoGUVqDqA9FHuIobAAkMrKlxcioKrTBWXgskkNbcX/54iWk8FDIkCO+SPmdpTp0NpPm
 XB0BrmFT5AD/jD3kt7ca8TxLIBwrycMhfHaJqtlcM1daCL49QItoax+wp0RMbKYGOikg
 HPH5gspNyyq4t05YuQpyRooTqiMCOHQZc8MXuK52VBJl9GDrWgkb+6zZ2icuA0l1I9MD
 I6/R5yt5sBwbnl/NHuwDYm7ob4uq6KBp1p7PRDcPuS7Jk+EBYdt4P78O+Gvdpvcfa2HV
 36kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JQZ0w7BBOuzs1TWd474FOkYAGshwH2dUWhpkOrTyXt4=;
 b=mtdwqpkV4W4bh0LTgAE4SV7+VAHLYUIwfuDlOm56iw6cmhZa8oNoSRNvPrJrHLPrvX
 IX1qBjDTyFmkyBG2kov1EnlJVtULb04EmGLHd7yPLg7GmXBp3+EjQAMQ1Xe09C1zGwUH
 FT7DhycKaQK0Ch2g2YXZOVb7vdblC6V1mQWsXIV/2quapGMUgATknObLQ3xe97ROep23
 9jwMK40WeTQeStdEECo8u5foC6IJdSKLJzYURi9+6hJEv72DTgHUtmREizNYohEPWvzz
 MBAc0zFzd6GrEvqAqww/C2qzgX0W+J/J2y8gwTBdJBbrMTThrx4G9aAV5fMK1Ee2t+Gx
 Ncpg==
X-Gm-Message-State: ANoB5pnukKnUAnJUymIMKt11jUpUfKLmf0VhqOf3CvPT7658P6Upxcf/
 SvOlqMqJc8DDJwNsACuJS8L73w==
X-Google-Smtp-Source: AA0mqf7myNLz9GyRLRgyx/VASU1bp8ZZW5PztG5I9cMZgSK6yiXDljyxm9cVeb/cqTUKBjnh4bfgPg==
X-Received: by 2002:a7b:cd07:0:b0:3cf:75f4:794a with SMTP id
 f7-20020a7bcd07000000b003cf75f4794amr7729735wmj.16.1668428682742; 
 Mon, 14 Nov 2022 04:24:42 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a1ccc05000000b003cf7292c553sm11989984wmb.13.2022.11.14.04.24.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 04:24:40 -0800 (PST)
Message-ID: <ed19482f-e825-ac35-544d-1d2d102d2837@linaro.org>
Date: Mon, 14 Nov 2022 13:24:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH] hw/intc: sifive_plic: Renumber the S irqs for numa support
Content-Language: en-US
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, Alistair.Francis@wdc.com,
 bin.meng@windriver.com, palmer@dabbelt.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20221111121913.1531030-1-frederic.petrot@univ-grenoble-alpes.fr>
 <48729f3f-80eb-8c7b-7bbb-7cd6bfa65a3e@linaro.org>
 <d87890a7-023f-ba7c-4a61-aa085d0134de@univ-grenoble-alpes.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <d87890a7-023f-ba7c-4a61-aa085d0134de@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 14 Nov 2022 23:15:20 -0000

On 14/11/22 11:34, Frédéric Pétrot wrote:
> Le 14/11/2022 à 09:40, Philippe Mathieu-Daudé a écrit :
>> On 11/11/22 13:19, Frédéric Pétrot wrote:


>> Eventually we could unify the style:
>>
>> -- >8 --
>> @@ -476,11 +476,11 @@ DeviceState *sifive_plic_create(hwaddr addr, 
>> char *hart_config,
>>           CPUState *cpu = qemu_get_cpu(cpu_num);
>>
>>           if (plic->addr_config[i].mode == PLICMode_M) {
>> -            qdev_connect_gpio_out(dev, num_harts - plic->hartid_base 
>> + cpu_num,
>> +            qdev_connect_gpio_out(dev, cpu_num - hartid_base + 
>> num_harts,
>>                                     qdev_get_gpio_in(DEVICE(cpu), 
>> IRQ_M_EXT));
>>           }
>>           if (plic->addr_config[i].mode == PLICMode_S) {
>> -            qdev_connect_gpio_out(dev, cpu_num,
>> +            qdev_connect_gpio_out(dev, cpu_num - hartid_base,hartid_base
>>                                     qdev_get_gpio_in(DEVICE(cpu), 
>> IRQ_S_EXT));
>>           }
>>       }
>> ---
> 
>    IIUC hartid_base is used to set plic->hartid_base, so agreed, along 
> with the
>    style unification.
>    I'll send a v2, then.
>    Since Alistair already queued the patch, how shall I proceed?

I didn't notice Alistair queued (he usually send a notification by
responding "queued" to the patches). If it is queued, then too late
(and not a big deal) -- you can still post the v2 and let him pick
it :)

