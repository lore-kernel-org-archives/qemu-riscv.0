Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSdBg-0005ba-V7
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 07:16:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdBc-0005YQ-34
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 07:16:28 -0500
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdBZ-0001cG-4v
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 07:16:27 -0500
Received: by mail-oo1-xc2f.google.com with SMTP id
 q7-20020a056820028700b0051fcd5d4ea9so189966ood.6
 for <qemu-riscv@nongnu.org>; Thu, 16 Feb 2023 04:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IsRzuVKvI4u/CB7GOMekmty0tWDZvcYilnQg5bZLd7U=;
 b=DwR/IU3QX1A9EDaob55YE1N3dE3wCV+YYlrM20PLTCXScG0h3LwWqvvJ90NellO9s/
 XDFbtqr9YGELlIUPz+Irq2OE/Lj4FLuI08F7yOl7RPDQ9hFof8mUjkzr7aNhVFrAROER
 Ahf3ATje/GDhUgazUz+wItC5K1Vbw1X4QSwSoaD0ZSRalmOiAqRHBj+gKFihWSS3MN9V
 9M+qxCPEHYVBD10A5EeCqvjfP3bbdWg5d9BPQ/sv2+DFJ1BRRwCnS3NSXgh/s7eWHIXY
 HMCGiJrUNQw4DEs0ImIllkT669Z6roDFPOShgKkGWH7oG0ke5ojpVs+HHy38Y7ldujw1
 cxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IsRzuVKvI4u/CB7GOMekmty0tWDZvcYilnQg5bZLd7U=;
 b=YAGGdWvheRpArR9D7VRu+SZyU8rxczpIqWOT9dNm5djy3y7xq8jYMOV2vvNb4xnj9W
 n2/aZe0GW7IYYGKR0C6Xxzqx2qZ8HtCdO93WmkzWlWn1847DTAF8kXeFaLPJJdAjkok6
 vFXykFZnHSKYEpPaWg/BnIh+IdRfiMzuW218Pr47Kf6Vkj5zxZpKrA3wG6UD3oMQngbq
 iH9/+IAmVeBvVRD0qPv6Tyo2hIyXLBD93IVYdWaUl8mk6phYEHcUeLSp02ElmEV6jAhH
 ZD9hTrGXWBJAQpNt4JWH1AfQOzUc3anqGl0SHTVzRcgs4K5WEreF5AW4z+quSGSfYasf
 r1Xw==
X-Gm-Message-State: AO0yUKWSt9Hz0eFGtLtH8ral0yuS86drpABMGKT/63v8EkpV6MdqL0Yp
 /FSzS/mViHF94egoloGQ8dpaZg==
X-Google-Smtp-Source: AK7set9Ugwtp8cRTchPxwXpI438nvBqfwcSnU2mpMrbsnRui0hQ/JFX2ctLy9Y6RaMg52Jpnijd7jA==
X-Received: by 2002:a4a:c617:0:b0:51a:ac9:775 with SMTP id
 l23-20020a4ac617000000b0051a0ac90775mr2337939ooq.6.1676549780630; 
 Thu, 16 Feb 2023 04:16:20 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a4ad496000000b0051765eb8c25sm572239oos.10.2023.02.16.04.16.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 04:16:20 -0800 (PST)
Message-ID: <66586eb4-b58a-f5b3-eb77-34f948631f18@ventanamicro.com>
Date: Thu, 16 Feb 2023 09:16:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 02/10] target/riscv: always allow write_misa() to write
 MISA
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
References: <20230215185726.691759-1-dbarboza@ventanamicro.com>
 <20230215185726.691759-3-dbarboza@ventanamicro.com>
 <20230216092922.sxxwuizbpj65zt4z@orel>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230216092922.sxxwuizbpj65zt4z@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
X-List-Received-Date: Thu, 16 Feb 2023 12:16:29 -0000



On 2/16/23 06:29, Andrew Jones wrote:
> On Wed, Feb 15, 2023 at 03:57:18PM -0300, Daniel Henrique Barboza wrote:
>> At this moment, and apparently since ever, we have no way of enabling
>> RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
>> the nuts and bolts that handles how to properly write this CSR, has
>> always been a no-op as well because write_misa() will always exit
>> earlier.
>>
>> This seems to be benign in the majority of cases. Booting an Ubuntu
>> 'virt' guest and logging all the calls to 'write_misa' shows that no
>> writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
>> RISC-V extensions after the machine is powered on, seems to be a niche
>> use.
>>
>> Regardless, the spec says that MISA is a WARL read-write CSR, and gating
>> the writes in the register doesn't make sense. OS and applications
>> should be wary of the consequences when writing it, but the write itself
>> must always be allowed.
> 
> The write is already allowed, i.e. no exception is raised when writing it.
> The spec only says that the fields may/can be writable. So we can
> correctly implement the spec with just
> 
>   write_misa()
>   {
>     return RISCV_EXCP_NONE;
>   }
> 
> as it has effectively been implemented to this point.

I'm fine with that. We can always use git history to see the removed code and
reintroduce it back.


Thanks,


Daniel


> 
> Based on Weiwei Li's pointing out of known bugs, and the fact that
> this function has likely never been tested, then maybe we should just
> implement it as above for now. Once a better solution to extension
> sanity checking exists and a use (or at least test) case arises, then
> the function could be expanded with some actually writable bits. (Also,
> I think that when/if we do the expansion, then something like the misa_w
> config proposed in the previous version of this series may still be
> needed in order to allow opting-in/out of the behavior change.)
> 
> Thanks,
> drew

