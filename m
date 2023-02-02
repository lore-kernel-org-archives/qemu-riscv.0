Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNeSb-000383-Kn
	for mharc-qemu-riscv@gnu.org; Thu, 02 Feb 2023 13:37:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNeSa-00037f-Hn
 for qemu-riscv@nongnu.org; Thu, 02 Feb 2023 13:37:24 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pNeSY-00019Q-RS
 for qemu-riscv@nongnu.org; Thu, 02 Feb 2023 13:37:24 -0500
Received: by mail-ot1-x344.google.com with SMTP id
 k91-20020a9d19e4000000b0068bca1294aaso711372otk.8
 for <qemu-riscv@nongnu.org>; Thu, 02 Feb 2023 10:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GPFvxGEnF1sQlAfliB+1UCjMyTOGxiW+veL8yBnZu5Q=;
 b=mS1gPRkVjEoQJipXldUd0Gvi92ApKK9ILFC6ynHYyQPJCfEYZPzw1liIgnSYaQfG7C
 BePT3VEL1uI/kVQIH5NWaCJdbCIoyx+nxJCWZsztrLRqolIjUR5ltJ9AxSarE/EImiz6
 RcVtHHpLoXOl4L+4drcf7qGCHKKzl3jRlcgN4tneUyEJYDu7vCjV8CjoFmVAl4/BYyvB
 /f/6XZ0kOQjKfYkcrjctlP7DKG0KhUDzmDd727lLHPhCR4kAypemE8QUxjIp8H+KRAFz
 BcvPfnivKYGvX9MH2t/IFtSAlJYzqr05FsNRQ04VNStypU81ion7WdbgxHyh8R79j4Wl
 LmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GPFvxGEnF1sQlAfliB+1UCjMyTOGxiW+veL8yBnZu5Q=;
 b=dP9YPIZmZjXYVgkvNIa7RK4c9UGyhggY1XLtBRDE1LT86tArb37e5bunL/UDSOza19
 LOaXoW5dmBZqZpYiOjGgR1jqS9L++CrIbwUM3+OyQXsgSswEvi1xz6LQNBG6X7ikz8Os
 tB3+xXxafbZBBhfHTZtLiIp1Da/iFY/qviQE9IgzAoJKo7thJVwwF4I/UU0U3EsKiP1C
 5ngRsYGjyY4V4r2Ep7NTgsEyK0oSIt9mK8wXr+vJT6xne8lFgy+l9ddQJ2gifS4sX1z2
 JSo752AKJ25vw1K7ELWeVRBJHCUU0tZ2mXxsSj/Nckm48f6+yG6iwNnL4Hb8CT1dAWhQ
 G/aw==
X-Gm-Message-State: AO0yUKWT2xdO6Z0k95OX5fDlX0rJjgcumHFDv15MSAZjLlphXzvqX+EG
 kbVD6xok2uaSrTR46o645VqRTQ==
X-Google-Smtp-Source: AK7set9BVX1SpT2yJWljAd84dbKYPNcklOdrGucPG6lOgv64Pp1/EbMYkcGMNQZ/lqPeeagzzsyFTw==
X-Received: by 2002:a9d:3a1:0:b0:68b:b06a:5b8b with SMTP id
 f30-20020a9d03a1000000b0068bb06a5b8bmr3840128otf.0.1675363040260; 
 Thu, 02 Feb 2023 10:37:20 -0800 (PST)
Received: from [192.168.68.107] ([177.102.69.207])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a056830208400b0068bd20cf07dsm128048otq.48.2023.02.02.10.37.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 10:37:19 -0800 (PST)
Message-ID: <0568610c-e227-b088-c375-5ee769c7cfc6@ventanamicro.com>
Date: Thu, 2 Feb 2023 15:37:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 0/3] hw/riscv: handle kernel_entry high bits with
 32bit CPUs
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20230202135810.1657792-1-dbarboza@ventanamicro.com>
 <Y9vyEp8ghrbqssJO@spud>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <Y9vyEp8ghrbqssJO@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x344.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-List-Received-Date: Thu, 02 Feb 2023 18:37:24 -0000



On 2/2/23 14:25, Conor Dooley wrote:
> On Thu, Feb 02, 2023 at 10:58:07AM -0300, Daniel Henrique Barboza wrote:
>> Hi,
>>
>> This new version removed the translate_fn() from patch 1 because it
>> wasn't removing the sign-extension for pentry as we thought it would.
>> A more detailed explanation is given in the commit msg of patch 1.
>>
>> We're now retrieving the 'lowaddr' value from load_elf_ram_sym() and
>> using it when we're running a 32-bit CPU. This worked with 32 bit
>> 'virt' machine booting with the -kernel option.
>>
>> If this approach doesn't work for the Xvisor use case, IMO  we should
>> just filter kernel_load_addr bits directly as we were doing a handful of
>> versions ago.
>>
>> Patches are based on current riscv-to-apply.next.
>>
>> Changes from v9:
>> - patch 1:
>>    - removed the translate_fn() callback
>>    - return 'kernel_low' when running a 32-bit CPU
>> - v9 link: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg04509.html
> 
> I think my T-b got lost last time around, but I gave this version a
> whirl too & things are working for me as they were before on Icicle.

That was my bad. I forgot to add the test-by after doing the changes for
the next version.

But I don't think this is the series you're talking about. The tested-by tag
you gave was on these patches:

"[PATCH v5 0/3] riscv_load_fdt() semantics change"

I believe you can add a Tested-by there. And feel free to give it a go - the
patches are on riscv-to-apply.next already.



Daniel


> For the series:
> Tested-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Thanks,
> Conor.
> 
>>
>> Daniel Henrique Barboza (3):
>>    hw/riscv: handle 32 bit CPUs kernel_addr in riscv_load_kernel()
>>    hw/riscv/boot.c: consolidate all kernel init in riscv_load_kernel()
>>    hw/riscv/boot.c: make riscv_load_initrd() static
>>
>>   hw/riscv/boot.c            | 96 +++++++++++++++++++++++---------------
>>   hw/riscv/microchip_pfsoc.c | 12 +----
>>   hw/riscv/opentitan.c       |  4 +-
>>   hw/riscv/sifive_e.c        |  4 +-
>>   hw/riscv/sifive_u.c        | 12 +----
>>   hw/riscv/spike.c           | 14 ++----
>>   hw/riscv/virt.c            | 12 +----
>>   include/hw/riscv/boot.h    |  3 +-
>>   8 files changed, 76 insertions(+), 81 deletions(-)
>>
>> -- 
>> 2.39.1
>>
>>

