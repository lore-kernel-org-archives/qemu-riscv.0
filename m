Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pJJBf-0001tr-64
	for mharc-qemu-riscv@gnu.org; Sat, 21 Jan 2023 14:05:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pJJBd-0001tj-UJ
 for qemu-riscv@nongnu.org; Sat, 21 Jan 2023 14:05:57 -0500
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pJJBb-00032W-64
 for qemu-riscv@nongnu.org; Sat, 21 Jan 2023 14:05:57 -0500
Received: by mail-qt1-x842.google.com with SMTP id h24so2817573qta.12
 for <qemu-riscv@nongnu.org>; Sat, 21 Jan 2023 11:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1OIV7/IWjD2Q2PsX3VRFNxg4ZxzK66CWQ/k2Sv1g7nM=;
 b=fE6do+b5aYr5zzl7KjN64RXBki8SfWQ3XeuXb83wKI/340TZ/a9DGb+Nd6796Nuv5D
 BUJvEv+jr2wGZObStz+1Ad7ceC4is+fR3YiB0wD2w3miLmqLeVN/y0BVScMwfgRIK3Xh
 O851nbjIPIC/h1bQyGEZdrV7VWlSa+p+elbgIWHvGEm5gkPs9bRibTis9q26fzTtFZ2R
 c2PVAtFbuXBXEbWui2abEldXWDENe19u0dRaQRfN6Up4TKLw88TEgN+xHQtYzhPjlZG8
 VtaroG/bmSl6Kg5UaLd2HvThtBEBpPCdehGnfURlKDwbGNm3N2PM/52EIhHpS9BTBvnU
 o9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1OIV7/IWjD2Q2PsX3VRFNxg4ZxzK66CWQ/k2Sv1g7nM=;
 b=5cB2aEMVlKxthKO33SvpLtwEGgJiEfJ+j0e4bqlEk3q2mzjnKxNAP7HKZNvlHcrec7
 8mIi6wD0fbSU+trtTIR7fS8hEDLLOv4/X8sOIL+3ZD2AMFnUa3UZSesBOE7Pg54mQrwj
 8wnMM1ogc/D0s9tSJo/6d5U7pW5HaJlwznzBFuZwMcP7AoOUJ1hLSKGAXJxQLBMo2FYQ
 UByj2QBkrA49HFJXNz3LMQWjK31YBPCBSfoLl/soitFaprNLKApfev/E6v1llpDYNJn5
 TLqnwUisFv4pcK1YB61114MnbHp5wbx5KaUYd6zGcRxJuYIQzUt1/hz/strVv2Y7dyiG
 2Y9g==
X-Gm-Message-State: AFqh2koYLDehiFOFRONmnKzCUik8wPQBQDBTcNxcHfAoBpkVXPKL6HeN
 uWWQfB6DQBheq4vthTv6Ry56pNalZxyHCOdFOjE=
X-Google-Smtp-Source: AMrXdXtYWXZhk9+bUeKXy/7KicnSDVdO2IZae0ds1nYxVjckRDrncZZJuHw2t59/XvfLb61C9AJKKw==
X-Received: by 2002:aca:2b13:0:b0:355:1e71:768 with SMTP id
 i19-20020aca2b13000000b003551e710768mr8593232oik.39.1674323903693; 
 Sat, 21 Jan 2023 09:58:23 -0800 (PST)
Received: from [192.168.68.107] ([191.17.222.2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a9d7a90000000b0068682fc91a1sm3292784otn.39.2023.01.21.09.58.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Jan 2023 09:58:23 -0800 (PST)
Message-ID: <385b977b-d15f-6c54-1d05-ab68e122dfe8@ventanamicro.com>
Date: Sat, 21 Jan 2023 14:58:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 3/7] hw/riscv/microchip_pfsoc.c: add an Icicle Kit fdt
 address function
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20230119191728.622081-1-dbarboza@ventanamicro.com>
 <20230119191728.622081-4-dbarboza@ventanamicro.com> <Y8ndFjv9prrRXLnL@spud>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <Y8ndFjv9prrRXLnL@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::842;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-qt1-x842.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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
X-List-Received-Date: Sat, 21 Jan 2023 19:05:58 -0000

Conor,

Thanks for the Icicle-kit walk-through! I'll not claim that I fully understood it,
but I understood enough to handle the situation ATM.

Without this change, this is where the FDT is being installed in the board when
I start it with 8Gb of RAM (retrieved via 'info roms'):

addr=00000000bfe00000 size=0x00a720 mem=ram name="fdt"

Which surprised me at first because this is almost at the end of the LO area which has
1Gb and I figured it would be in the middle of another RAM area. I took another read
at what we're doing in riscv_load_fdt():

-----------
temp = (dram_base < 3072 * MiB) ?  MIN(dram_end, 3072 * MiB) : dram_end;
fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
-----------

This code can be read as "if the starting address of the RAM is lower than 3Gb, put
the FDT no further than 3Gb (0xc0000000). Otherwise, put it at the end of dram",
where "dram_base" is the starting address of the RAM block that the function
receives.

For icicle-kit, this is being passed as  memmap[MICROCHIP_PFSOC_DRAM_LO].base,
0x80000000, which is 2Gb.

So, regardless of how much RAM we have (dram_end), the FDT will always be capped at
3Gb. At this moment, this fits exactly at the end of the LO area for the Icicle Kit.
Which is funny because this 3Gb restriction was added by commit 1a475d39ef54 to fix
32 bit guest boot and it happened to also work for the Microchip SoC.

So yeah, I thought that I was fixing a bug and in the end I caused one. This patch
needs to go.


Alistair, I believe I should re-send v2, this time explaining why the existing function
will not break the Microchip board because we'll never put the FDT out of the LO area
of the board. Does this work for you?


Conor, one more thing:


On 1/19/23 21:15, Conor Dooley wrote:
> Hey Daniel,
> 
> Got through the stuff I wanted to get done tonight faster than
> expected...
> 
> On Thu, Jan 19, 2023 at 05:17:33PM -0300, Daniel Henrique Barboza wrote:
>> Are you testing it by using the command line
>> you mentioned in the "qemu icicle kit es" thread?
>>
>> $(QEMU)/qemu-system-riscv64 \
>> 	-M microchip-icicle-kit \
>> 	-m 2G -smp 5 \
>> 	-kernel $(vmlinux_bin) \
>> 	-dtb $(devkit).dtb \
>> 	-initrd $(initramfs) \
>> 	-display none \
>> 	-serial null \
>> 	-serial stdio
> 
> Yah, effectively. It's not quite that, but near enough as makes no real
> difference:
> qemu-icicle:
> 	$(QEMU)/qemu-system-riscv64 -M microchip-icicle-kit \
> 		-m 2G -smp 5 \
> 		-kernel $(vmlinux_bin) \
> 		-dtb $(wrkdir)/riscvpc.dtb \
> 		-initrd $(initramfs) \
> 		-display none -serial null \
> 		-serial stdio \
> 		-D qemu.log -d unimp
> 
> I just tried to make things somewhat more intelligible for that thread.

I tried it out with kernel v6.0.0 (I saw you mentioning in the other thread that
this was the latest kernel you were able to boot this way)  and it booted up until
the kernel complained about missing initramfs. Any tips on how I can build an
initrd disk for the board?


Thanks,


Daniel

> 
> Also in case it is not obvious, I do work for Microchip. As I mentioned
> to Alistair at LPC, I/we don't have the cycles at the moment to do
> anything with QEMU, so the bits of fixes I have sent are things I fixed
> while debugging other issues etc, mostly in the evenings.
> 
> Anways, I'll attempt to explain what the craic is here..
> 
> On Thu, Jan 19, 2023 at 04:17:24PM -0300, Daniel Henrique Barboza wrote:
>> The Icicle Kit board works with 2 distinct RAM banks that are separated
> 
> Ehh, 2 isn't really true. There are 6 possible "windows" into the DDR on
> MPFS, list here as with their start addresses.
> 
> 32-bit cached     0x0080000000
> 64-bit cached     0x1000000000
> 32-bit non-cached 0x00c0000000
> 64-bit non-cached 0x1400000000
> 32-bit WCB        0x00d0000000
> 64-bit WCB        0x1800000000
> 
> These are the "bus" addresses, where the harts think the memory is, but
> the memory is not actually connected there. There are some runtime
> configurable registers which determine what addresses these correspond
> to in the DDR itself.
> 
> When the QEMU port for MPFS was written, only two of these were in use,
> the 32-bit and 64-bit non-cached regions. The config (seg) registers
> were set up so that the 32-bit cached region pointed to 0x0 in DDR and
> the 64-bit region pointed to 0x3000_0000 in DDR.
> ⢰⠒⠒⠒⠒⡖⠒⠒⠒⣶⠒0x80000000
> ⢸    ⡇   ⡇ ⡇
> ⢸    ⡇   ⡇ ⡇
> ⢸    ⡇   ⡇ ⡇
> ⢸    ⡇   ⡇ ⡇
> ⢸    ⡇   ⡇ ⡇
> ⢸    ⡇   ⡇ ⡇
> ⢸    ⡇   ⡇ ⡇
> ⢸⡖⠒⠒⢲⡇   ⡇ 0x40000000
> ⢸⡇  ⢸⡇   ⡇ ⡇
> ⢸⡇  ⢸⠓⠒⠒⠒⠃ ⡇ <-- 64-bit starts here
> ⢸⡇  ⢸      ⡇
> ⢸⡇  ⢸      ⡇
> ⢸⡇  ⢸      ⡇
> ⢸⡇  ⢸      ⡇
> ⢸⡇  ⢸      ⡇ <-- 32-bit starts at 0x0
> ⠘⠓⠒0⠚⠒⠒1⠒⠒⠒0x00000000
> 
> (These diagrams are a bit crap, I'm copy pasting them from a TUI tool
> for visualising these I made for myself. The ~s can be ignored.
> https://github.com/ConchuOD/memory-aperature-configurator)
> 
>> by a gap. We have a lower bank with 1GiB size, a gap follows,
>> then at 64GiB the high memory starts.
> 
> As you correctly pointed out, that lower region is in fact 1 GiB & hence
> there is actually an overlapping region of 256 MiB.
> 
> The Devicetree at this point in time looked like:
> 	ddrc_cache_lo: memory@80000000 {
> 		device_type = "memory";
> 		reg = <0x0 0x80000000 0x0 0x30000000>;
> 		clocks = <&clkcfg CLK_DDRC>;
> 		status = "okay";
> 	};
> 
> 	ddrc_cache_hi: memory@1000000000 {
> 		device_type = "memory";
> 		reg = <0x10 0x0 0x0 0x40000000>;
> 		clocks = <&clkcfg CLK_DDRC>;
> 		status = "okay";
> 	};
> 
> At some point, it was decided that instead we would use a configuration
> with ~no memory at 32-bit addresses. I think it was this one here:
> 
> ⢰⡖⠒⠒⢲⡖⠒⠒⠒⣶⠒0x80000000
> ⢸⡇  ⢸⡇   ⣿ ⡇
> ⢸⠓⠒⠒⠚⡇   ⡟ ⡇ <-- 32-bit starts here
> ⢸    ⡇   ⡇ ⡇
> ⢸    ⡇   ⡇ ⡇
> ⢸    ⡇   ⡇ ⡇
> ⢸    ⡇   ⡇ ⡇
> ⢸    ⡇   ⡇ ⡇
> ⢸    ⡇   ⡇ 0x40000000
> ⢸    ⡇   ⡇ ⡇
> ⢸    ⡇   ⡇ ⡇
> ⢸    ⡇   ⡇ ⡇
> ⢸    ⡇   ⡇ ⡇
> ⢸    ⡇   ⡇ ⡇
> ⢸    ⡇   ⡇ ⡇
> ⢸    ⡇   ⡇ ⡇ <-- 64-bit starts at 0x0
> ⠘⠒⠒0⠒⠓⠒1⠒⠓⠒0x00000000
> 
> Because of how these windows work, the 32-bit cached region was always
> there, just not used as the Devicetree became:
> 	ddrc_cache: memory@1000000000 {
> 		device_type = "memory";
> 		reg = <0x10 0x0 0x0 0x76000000>;
> 		status = "okay";
> 	};
> 
> The remaining bit of memory is being used for some WCB buffers etc &
> not for the OS itself. This was never upstreamed anywhere AFAIK as it
> was a workaround.
> 
> The current Devicetree in Linux & U-Boot corresponds to a configuration
> like:
> ⢰⠒⠒⠒⠒⡖⠒⠒⠒⣶⠒0x80000000
> ⢸    ⡇   ⣿ ⡇
> ⢸    ⡇   ⡟ ⡇
> ⢸    ⡇   ⡇ ⡇
> ⢸    ⡇   ⡇ ⡇
> ⢸    ⡇   ⡇ ⡇
> ⢸    ⡇   ⡇ ⡇
> ⢸    ⡇   ⡇ ⡇
> ⢸⡖⠒⠒⢲⡇   ⡇ 0x40000000
> ⢸⡇  ⢸⡇   ⡇ ⡇
> ⢸⡇  ⢸⡇   ⡇ ⡇
> ⢸⡇  ⢸⡇   ⡇ ⡇
> ⢸⡇  ⢸⡇   ⡇ ⡇
> ⢸⡇  ⢸⡇   ⡇ ⡇
> ⢸⡇  ⢸⡇   ⡇ ⡇
> ⢸⡇  ⢸⡇   ⡇ ⡇ <-- 32- & 64-bit start at 0x0
> ⠘⠓⠒0⠚⠓⠒1⠒⠓⠒0x00000000
> 
> That DT looks like:
> 	ddrc_cache_lo: memory@80000000 {
> 		device_type = "memory";
> 		reg = <0x0 0x80000000 0x0 0x40000000>;
> 		status = "okay";
> 	};
> 
> 	ddrc_cache_hi: memory@1040000000 {
> 		device_type = "memory";
> 		reg = <0x10 0x40000000 0x0 0x40000000>;
> 		status = "okay";
> 	};
> 
> Each of these changes came as part of an FPGA reference design change &
> a corresponding compatible change. I believe rtlv2203 was the second
> configuration & rtlv2210 the third.
> 
> I can't boot the current configuration in QEMU, probably due to some of
> the things you point out below.
> To get it working, I remove the ddrc_cache_hi from my DT and boot with
> the 32-bit cached memory only.
> This is what the current changes have broken for me.
> 
> IMO it is a perfectly valid thing to boot a system using less than the
> memory it *can* use.
> 
> I guess you read the other thread in which I stated that the HSS boot
> that is documented doesn't work with recent HSSes. Ideally, and I am
> most certainly _not_ expecting anyone to do this, when the HSS writes
> the "seg" registers during boot to configure the memory layout as per
> the FPGA bitstream QEMU would configure the memory layout it is
> emulating to match.
> Since direct kernel boot is a thing too, I was thinking that for that
> mode, the config in the dtb should probably be used.
> I don't know enough about QEMU to know if this is even possible!
> 
> The other possibility I was thinking of was just relaxing the DDR limit
> entirely (and ignoring the overlaying) so that QEMU thinks there is 1
> GiB at 0x8000_0000 and 16 GiB at 0x10_0000_0000.
> Again, I've not had the cycles to look into any of this at all nor am I
> expecting anyone else to - just while I am already typing about this
> stuff there's no harm in broadcasting the other thoughts I had.
> 
>> MachineClass::default_ram_size is set to 1.5Gb and machine_init() is
>> enforcing it as minimal RAM size, meaning that there we'll always have
> 
> I don't think that this is
> 
>> at least 512 MiB in the Hi RAM area, and that the FDT will be located
>> there all the time.
> 
> All the time? That's odd.
> I suppose my kernel then remaps the dtb into the memory range it can
> access, and therefore things keep ticking.
> 
> I don't think that machine_init() should be enforcing a minimum ram size
> of 1.5 GiB - although maybe Bin Meng has a reason for that that I don't
> understand.
> 
>> riscv_compute_fdt_addr() can't handle this setup because it assumes that
>> the RAM is always contiguous. It's also returning an uint32_t because
>> it's enforcing that fdt address is sitting on an area that is addressable
>> to 32 bit CPUs, but 32 bits won't be enough to point to the Hi area of
>> the Icicle Kit RAM (and to its FDT itself).
>>
>> Create a new function called microchip_compute_fdt_addr() that is able
>> to deal with all these details that are particular to the Icicle Kit.
>> Ditch riscv_compute_fdt_addr() and use it instead.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   hw/riscv/microchip_pfsoc.c | 46 +++++++++++++++++++++++++++++++++++---
>>   1 file changed, 43 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
>> index dcdbc2cac3..9b829e4d1a 100644
>> --- a/hw/riscv/microchip_pfsoc.c
>> +++ b/hw/riscv/microchip_pfsoc.c
>> @@ -54,6 +54,8 @@
>>   #include "sysemu/device_tree.h"
>>   #include "sysemu/sysemu.h"
>>   
>> +#include <libfdt.h>
>> +
>>   /*
>>    * The BIOS image used by this machine is called Hart Software Services (HSS).
>>    * See https://github.com/polarfire-soc/hart-software-services
>> @@ -513,6 +515,46 @@ static void microchip_pfsoc_soc_register_types(void)
>>   
>>   type_init(microchip_pfsoc_soc_register_types)
>>   
>> +static hwaddr microchip_compute_fdt_addr(MachineState *ms)
>> +{
>> +    const MemMapEntry *memmap = microchip_pfsoc_memmap;
>> +    hwaddr mem_low_size = memmap[MICROCHIP_PFSOC_DRAM_LO].size;
>> +    hwaddr mem_high_size, fdt_base;
>> +    int ret = fdt_pack(ms->fdt);
>> +    int fdtsize;
>> +
>> +    /* Should only fail if we've built a corrupted tree */
>> +    g_assert(ret == 0);
>> +
>> +    fdtsize = fdt_totalsize(ms->fdt);
>> +    if (fdtsize <= 0) {
>> +        error_report("invalid device-tree");
>> +        exit(1);
>> +    }
>> +
>> +    /*
>> +     * microchip_icicle_kit_machine_init() does a validation
>> +     * that guarantees that ms->ram_size is always greater
>> +     * than mem_low_size and that mem_high_size will be
>> +     * at least 512MiB.
> 
> Again, I don't think it should be doing this at all. I see the comment
> about that size refers to DDR training, but given the overlaying of
> memory it's entirely possible to train against 64-bit addresses but then
> boot a kernel using only low memory addresses.
> Perhaps by default & for booting via the bootloader, but I don't think
> enforcing this makes sense when the bootloader is not involved.
> 
> If a dtb is used as the source for the memory layout, requiring memory
> at high addresses doesn't make sense to me. I have no idea if there is a
> mechanism for figuring that out though nor am I au fait with how these
> memory sizes are calculated.
> It is getting kinda late here, so I am sending this without having
> investigated any of the detail, sorry.
> 
> Hopefully that wasn't too deranged and you can at least understand why I
> have been doing what I have...
> 
> Thanks,
> Conor.
> 
>> +     *
>> +     * This also means that our fdt_addr will be based
>> +     * on the starting address of the HI DRAM block.
>> +     */
>> +    mem_high_size = ms->ram_size - mem_low_size;
>> +    fdt_base = memmap[MICROCHIP_PFSOC_DRAM_HI].base;
>> +
>> +    /*
>> +     * In theory we could copy riscv_compute_fdt_addr()
>> +     * and put the FDT capped at maximum 3Gb from fdt_base,
>> +     * but fdt_base is set at 0x1000000000 (64GiB). We
>> +     * make the assumption here that the OS is ready to
>> +     * handle the FDT, 2MB aligned, at the very end of
>> +     * the available RAM.
>> +     */
>> +    return QEMU_ALIGN_DOWN(fdt_base + mem_high_size - fdtsize, 2 * MiB);
>> +}
>> +
>>   static void microchip_icicle_kit_machine_init(MachineState *machine)
>>   {
>>       MachineClass *mc = MACHINE_GET_CLASS(machine);
>> @@ -640,9 +682,7 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>>                                       "bootargs", machine->kernel_cmdline);
>>           }
>>   
>> -        /* Compute the fdt load address in dram */
>> -        fdt_load_addr = riscv_compute_fdt_addr(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
>> -                                              machine->ram_size, machine->fdt);
>> +        fdt_load_addr = microchip_compute_fdt_addr(machine);
>>           riscv_load_fdt(fdt_load_addr, machine->fdt);
>>   
>>           /* Load the reset vector */
>> -- 
>> 2.39.0
>>
>>
>>

