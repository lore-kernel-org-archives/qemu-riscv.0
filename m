Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPJgX-0004jp-Qc
	for mharc-qemu-riscv@gnu.org; Tue, 07 Feb 2023 03:50:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPJgU-0004jD-Ox
 for qemu-riscv@nongnu.org; Tue, 07 Feb 2023 03:50:38 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPJgR-0004rp-Mb
 for qemu-riscv@nongnu.org; Tue, 07 Feb 2023 03:50:37 -0500
Received: by mail-wr1-x429.google.com with SMTP id j25so9238748wrc.4
 for <qemu-riscv@nongnu.org>; Tue, 07 Feb 2023 00:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c1wmpMStD/at9Qj/mIVfu7+yS5fkgnfmx9smMKOa9n4=;
 b=JNZV05op4HZda2dO+T7sXrKklXCA3ArqGLpc8Ptv0ANHINIz+Fc3kxqu6saadoiXTc
 mM6tOt9FLQgxvIsDTlpTgvqFlasQtblVwL+8QAH/O1OCfh0333ZXkOJTQSpGlkQQDy6n
 +TFkfl4zZIauavauuRzfIfgDxLGh873q46O87RxJ/nH81bNncpFASiNx3llNENxRHIaG
 lnfpORUrd2ZaKtiwIyHl9L+5g/fdzDzMwyS2mvWvnNKGMwAnj5aA78esVLmYnihOmumi
 qDFVMn8bCyhPTFD+AmC+wjDNUH6kxlZ8CDzi+WiWKIV0Pn1VQpSH+vtI4Eadofj6fuqf
 /1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c1wmpMStD/at9Qj/mIVfu7+yS5fkgnfmx9smMKOa9n4=;
 b=S8tG0+JxRevFer52qp1jtqZ/vHiUPch70ZOrYBzZbdli3p8k+I8t5L5HlZxfbrynXo
 Ouy4K9vH9CsBhsfRF38GL9wGb6JeraSGyk1+cZyevLiukXFy3REN8SluOQ6+RV81CV+Z
 Yv0TZS8iNyKQTPW1Af2DZhUM/ele0i2pedse16+Or2CJz0qNPaJxLbGE3qAPGzQ3ZlR1
 Mm6LMr3V+mASarDtVCWJh0TJnZ8DS6tjIWWNWCrNtZEouzbhzAVtmO0Dh89RTIKpAa7j
 NuC9g5dXZErWA9avYANXBnYsW/SJ6D8jvWjm0hnL/HsjZgmymtTTZGl4FVxkhembb/CM
 98oQ==
X-Gm-Message-State: AO0yUKXvQWaEihregIdra+Z3YSwWScWEfxwjt2Rz5FGQhMewCVMb7vX9
 +HZzNmKDFSyR+hapEvDBDLBqpA==
X-Google-Smtp-Source: AK7set+OiaqMBt/0rAMpqmjdCAdv7ULdCafuzt+SgiC5oqd3/qc6ucj5W3byVft44lMQ9guJDZ+eWQ==
X-Received: by 2002:a5d:6dcb:0:b0:2c3:be89:7c3c with SMTP id
 d11-20020a5d6dcb000000b002c3be897c3cmr10196251wrz.31.1675759833294; 
 Tue, 07 Feb 2023 00:50:33 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s2-20020a5d69c2000000b002c3de83be0csm7965965wrw.87.2023.02.07.00.50.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 00:50:31 -0800 (PST)
Message-ID: <25504aa3-20e3-d7e6-4111-c956370949ba@linaro.org>
Date: Tue, 7 Feb 2023 09:50:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 02/10] hw/riscv/virt: Add a switch to enable/disable ACPI
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Andrea Bolognani <abologna@redhat.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Atish Kumar Patra
 <atishp@rivosinc.com>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Bernhard Beschow <shentey@gmail.com>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-3-sunilvl@ventanamicro.com>
 <CABJz62PFGT1H-AArbfTkpiX24mHU=q3wk7h-bpduZhJyy7tTLw@mail.gmail.com>
 <fe3b5794-be2a-eec7-9d4e-9a13eab48378@linaro.org>
 <20230206125610.nmo2bbbd5kosihav@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230206125610.nmo2bbbd5kosihav@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-List-Received-Date: Tue, 07 Feb 2023 08:50:40 -0000

On 6/2/23 13:56, Gerd Hoffmann wrote:
> On Mon, Feb 06, 2023 at 12:18:06PM +0100, Philippe Mathieu-Daudé wrote:
>> On 6/2/23 11:54, Andrea Bolognani wrote:
>>> On Thu, Feb 02, 2023 at 10:22:15AM +0530, Sunil V L wrote:
>>>> +    object_class_property_add(oc, "acpi", "OnOffAuto",
>>>> +                              virt_get_acpi, virt_set_acpi,
>>>> +                              NULL, NULL);
>>>> +    object_class_property_set_description(oc, "acpi",
>>>> +                                          "Enable ACPI");
>>>
>>> The way this works on other architectures (x86_64, aarch64) is that
>>> you get ACPI by default and can use -no-acpi to disable it if
>>> desired. Can we have the same on RISC-V, for consistency?
>>
>> -no-acpi rather seems a x86-specific hack for the ISA PC machine, and
>> has a high maintenance cost / burden.
> 
> Under the hood it is actually a OnOffAuto machine property and -no-acpi
> is just a shortcut to set that.
> 
>> Actually, what is the value added by '-no-acpi'?
> 
> On arm(64) the linux kernel can use either device trees or ACPI to find
> the hardware.  Historical reasons mostly, when the platform started
> there was no ACPI support.  Also the edk2 firmware uses Device Trees
> for hardware discovery, likewise for historical reasons.
> 
> When ACPI is available for a platform right from the start I see little
> reason to offer an option to turn it off though ...

Yeah I concur. There is no point in disabling ACPI on the RISCV virt
machine IMO.

