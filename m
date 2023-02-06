Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pOzVn-0002oH-AC
	for mharc-qemu-riscv@gnu.org; Mon, 06 Feb 2023 06:18:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOzVl-0002nu-6t
 for qemu-riscv@nongnu.org; Mon, 06 Feb 2023 06:18:13 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOzVj-0002U1-Or
 for qemu-riscv@nongnu.org; Mon, 06 Feb 2023 06:18:12 -0500
Received: by mail-wm1-x331.google.com with SMTP id o36so8406545wms.1
 for <qemu-riscv@nongnu.org>; Mon, 06 Feb 2023 03:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kp9wWGYlisByX/SGntQzjUtEe66S3uULw2QfqrHXT7Y=;
 b=ebcZGJD2m9/bvQ42+qEcfKHcpJOBW9XqvIjdQOB2tPtL+H6VlvJKQME/2Y8szQADTh
 DvA9aNTrNk3xginMurohb1iC3GTrHHqd0Hng9FCpcXnlDU1ZOfb9z8FKSbpwGAHXKNvE
 NPEnIBlOTrpffgXvXk4dxAm5HbPF1+8/kjd8DV0JmcYm63AVSgDGnHOZI91Dp9byhYSH
 01l62sRm4j3kZs3G/HYefVL1FXqdAqyumx7FkUY7L3iuF9aqzAQnvY4BIYO03b7PhTJ8
 e0h8NnJjAgy9MUMQZir6EkT2PiiZQ45OXDPogVldQSlUbyowTEpD7E/sK08VMDIkPMKE
 AFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kp9wWGYlisByX/SGntQzjUtEe66S3uULw2QfqrHXT7Y=;
 b=iqbh1vQ4gnktCLrDNiFt1/PrVjbFQSonrUXpxyzMzDNIUz86wI2AEJ3OAPUifn2XPZ
 3yPopgTC+WgrzvMKuDKMyCSEU5mA+bi614zPFIEpozb+peXEBaVQhO87znsd/nPPT4u6
 s/q1JtCFNFiMsg/PbRg+fw+oAme31ai/OvZ44teod1cPcf/S/v43cUE1hceAwtsM6Y4d
 PxpiXFSDippU+3ogZjuSaC5a+zeKn0oB4JMAoTFtzxaAMp1BVhBRzuEPg0w5a4wrWlDP
 KAUSV7FuZeRV2sE7kvTI3GtT4xmxqV5KUHCkwXR5nMBaYvB0YEvsjwJkmCtC1QX+3dOF
 G05Q==
X-Gm-Message-State: AO0yUKVa4mogXZUMuGrdgP1/yVDBWIsphpqKcXfCT/CXu+a9lCB8DLAb
 rIq34CQcBnR5diaAZm7+FY+6Mg==
X-Google-Smtp-Source: AK7set+RlM0y7XO4ihlwYduFQlG7u9sLgngAQVswrPlesHcMjiwdArGO34Jz2hyZoOsI82nt5q0t+A==
X-Received: by 2002:a05:600c:43c5:b0:3dc:5674:66e6 with SMTP id
 f5-20020a05600c43c500b003dc567466e6mr19029897wmn.25.1675682289910; 
 Mon, 06 Feb 2023 03:18:09 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 he7-20020a05600c540700b003df5be8987esm13820781wmb.20.2023.02.06.03.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 03:18:08 -0800 (PST)
Message-ID: <fe3b5794-be2a-eec7-9d4e-9a13eab48378@linaro.org>
Date: Mon, 6 Feb 2023 12:18:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 02/10] hw/riscv/virt: Add a switch to enable/disable ACPI
Content-Language: en-US
To: Andrea Bolognani <abologna@redhat.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Atish Kumar Patra
 <atishp@rivosinc.com>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-3-sunilvl@ventanamicro.com>
 <CABJz62PFGT1H-AArbfTkpiX24mHU=q3wk7h-bpduZhJyy7tTLw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CABJz62PFGT1H-AArbfTkpiX24mHU=q3wk7h-bpduZhJyy7tTLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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
X-List-Received-Date: Mon, 06 Feb 2023 11:18:13 -0000

On 6/2/23 11:54, Andrea Bolognani wrote:
> On Thu, Feb 02, 2023 at 10:22:15AM +0530, Sunil V L wrote:
>> +    object_class_property_add(oc, "acpi", "OnOffAuto",
>> +                              virt_get_acpi, virt_set_acpi,
>> +                              NULL, NULL);
>> +    object_class_property_set_description(oc, "acpi",
>> +                                          "Enable ACPI");
> 
> The way this works on other architectures (x86_64, aarch64) is that
> you get ACPI by default and can use -no-acpi to disable it if
> desired. Can we have the same on RISC-V, for consistency?

-no-acpi rather seems a x86-specific hack for the ISA PC machine, and
has a high maintenance cost / burden.

If hardware provides ACPI support, QEMU should expose it to the guest.

Actually, what is the value added by '-no-acpi'?

