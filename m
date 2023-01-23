Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pJtvn-0006KL-CT
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 05:20:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pJtvk-0006Hz-9p
 for qemu-riscv@nongnu.org; Mon, 23 Jan 2023 05:20:02 -0500
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pJtvi-0008Ls-Kj
 for qemu-riscv@nongnu.org; Mon, 23 Jan 2023 05:20:00 -0500
Received: by mail-oo1-xc2d.google.com with SMTP id
 u13-20020a4aa34d000000b004f5219f9424so2033045ool.5
 for <qemu-riscv@nongnu.org>; Mon, 23 Jan 2023 02:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3cqjTjRrNXVcRyacZlC+0sgKMvwpwq01NpDqAzLPsHA=;
 b=KF9XgTm4Ky7kV6wjenflewrzevdYU5UJNOtHoYIr4E2o1dkeeqMXqrCjqGyXh3DCJV
 1nybxQPkiEGgfwIJD7NNsa0GHLXL1OB+S4y2ZSVs/Ap5HELlGL47Du9/MeNiX4ZRqyb+
 GxFTHoYv4GMBUDY3uj1zya/c53bmGalvmuhY0a13dh3wNX6tssggy3RaGaBtx1+1jrtO
 wl01CrO9X2fvHrgAZnVA3wDt6VQNh9U8Kd0rX7HyBhbO2PKiYVSB37vROFniYkPgXwqR
 B+pMjlyQ13xZBs5mto/YrLzjwnOyec8CDlnFNRYY1TxLh+yHj2lOIovdsvqd7yNFpg8c
 /mwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3cqjTjRrNXVcRyacZlC+0sgKMvwpwq01NpDqAzLPsHA=;
 b=cAnuFpw1nlh2/LElnGPifX7R/kTDTwf78PgZiUQxWj0eH9sibiAQuKlkHfLuNAVmRW
 fERXxwzgtv/Yo8V6a9JgsJh+o/EKNDB9sG3bbMtwxqASDtWfT1bBU0EfmgpWpu39TsCA
 b2dhkx4ztV/m8b4oHjgVP3mT6CiZemAozJCfxVqAAdlVMRjC16h2ani/WyaNwXIXRKwr
 DHyd0pGvvPZKmEniPvhaLTlbrkX+LHyLw2e+BHlbGw/ASAYgxALHM/hPR//OlBxnlI3y
 fRUGcM6VL3oj0A5DQEOI6Yhb8iDKq2tKlWCJfxo4c4Eee+Gu87LpZLstTtveSwNB6uCw
 ci1A==
X-Gm-Message-State: AFqh2krOG1TwEavRKIBCYn+TJVNFU51ELXhisMgKt3BAX7TmCZ+S2sev
 1PR1FY53EA5J2emXeXD8gAzJMA==
X-Google-Smtp-Source: AMrXdXvsmRNRqy4J19ztiYSTCE9CtIwRUNLt1q/GfrtMPSZslOhYTGBIusDH05oloC0t0NdMyPYlOw==
X-Received: by 2002:a4a:acc4:0:b0:4f2:a1c1:4dfc with SMTP id
 c4-20020a4aacc4000000b004f2a1c14dfcmr10863397oon.6.1674469196573; 
 Mon, 23 Jan 2023 02:19:56 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a4aaa06000000b004f11e1ce173sm22785260oom.5.2023.01.23.02.19.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 02:19:56 -0800 (PST)
Message-ID: <14efb6ee-4de0-ce26-569b-3a7ec6647e7d@ventanamicro.com>
Date: Mon, 23 Jan 2023 07:19:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 3/7] hw/riscv/microchip_pfsoc.c: add an Icicle Kit fdt
 address function
To: Alistair Francis <alistair23@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20230119191728.622081-1-dbarboza@ventanamicro.com>
 <20230119191728.622081-4-dbarboza@ventanamicro.com> <Y8ndFjv9prrRXLnL@spud>
 <385b977b-d15f-6c54-1d05-ab68e122dfe8@ventanamicro.com>
 <CAKmqyKN=XquxtTDGCstEu7jEvoOn=1HpHc=ax8+zs3XxZO2G3w@mail.gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAKmqyKN=XquxtTDGCstEu7jEvoOn=1HpHc=ax8+zs3XxZO2G3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2d.google.com
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
X-List-Received-Date: Mon, 23 Jan 2023 10:20:02 -0000



On 1/22/23 19:53, Alistair Francis wrote:
> On Sun, Jan 22, 2023 at 5:16 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>> Conor,
>>
>> Thanks for the Icicle-kit walk-through! I'll not claim that I fully understood it,
>> but I understood enough to handle the situation ATM.
>>
>> Without this change, this is where the FDT is being installed in the board when
>> I start it with 8Gb of RAM (retrieved via 'info roms'):
>>
>> addr=00000000bfe00000 size=0x00a720 mem=ram name="fdt"
>>
>> Which surprised me at first because this is almost at the end of the LO area which has
>> 1Gb and I figured it would be in the middle of another RAM area. I took another read
>> at what we're doing in riscv_load_fdt():
>>
>> -----------
>> temp = (dram_base < 3072 * MiB) ?  MIN(dram_end, 3072 * MiB) : dram_end;
>> fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
>> -----------
>>
>> This code can be read as "if the starting address of the RAM is lower than 3Gb, put
>> the FDT no further than 3Gb (0xc0000000). Otherwise, put it at the end of dram",
>> where "dram_base" is the starting address of the RAM block that the function
>> receives.
>>
>> For icicle-kit, this is being passed as  memmap[MICROCHIP_PFSOC_DRAM_LO].base,
>> 0x80000000, which is 2Gb.
>>
>> So, regardless of how much RAM we have (dram_end), the FDT will always be capped at
>> 3Gb. At this moment, this fits exactly at the end of the LO area for the Icicle Kit.
>> Which is funny because this 3Gb restriction was added by commit 1a475d39ef54 to fix
>> 32 bit guest boot and it happened to also work for the Microchip SoC.
>>
>> So yeah, I thought that I was fixing a bug and in the end I caused one. This patch
>> needs to go.
>>
>>
>> Alistair, I believe I should re-send v2, this time explaining why the existing function
>> will not break the Microchip board because we'll never put the FDT out of the LO area
>> of the board. Does this work for you?
> 
> I think that's fine. My only worry is that we are losing some
> flexibility that some future board might want.

What if we change riscv_load_fdt() parameters to pass a MemoryRegion/MemMapEntry
instead of just dram_base?

Instead of this:

uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)

We would have this:

uint64_t riscv_load_fdt(MemMapEntry mem, uint64_t mem_size, void *fdt)

Or even this:

uint64_t riscv_load_fdt(hwaddr dram_base, hwaddr dram_size,
                         uint64_t mem_size, void *fdt)


And then we can make assumptions based on the actual memory region that the fdt
is going to fit into, instead of having a starting address and a total memory
size and have to deal with issues such as sparse memory.

We can keep all the assumptions already made today (e.g. the 3Gb maximum addr)
while also having a guarantee that the fdt isn't going to be put in the wrong
memory region/spot if we decide to change the assumptions later on.


Thanks,

Daniel



> 
> Alistair

