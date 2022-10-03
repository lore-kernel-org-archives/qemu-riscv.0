Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ofKhl-0001SU-GH
	for mharc-qemu-riscv@gnu.org; Mon, 03 Oct 2022 08:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofKhV-0001Oh-J0; Mon, 03 Oct 2022 08:37:46 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:42524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofKhT-0007tE-RN; Mon, 03 Oct 2022 08:37:37 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 o20-20020a05600c4fd400b003b4a516c479so5763844wmq.1; 
 Mon, 03 Oct 2022 05:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=QM2N5TlIhsBR4QhgHEfzOoBq009ImxjESnOg2bIvGAg=;
 b=AThql3WLlR0DiPQ2ymtKYseiAjaLw33VJgxJDFHTp/5mNjQFZ3uIfIvHMW7TSuXeSE
 YoUkS03DjMSSAsnPIfqASM0tihj0nnHEbD37qRwa/Ax8UEaXZNe24JaXgY0PGDJbSERP
 EdJoPRXfxcTuZKaUKAsXZW/wlgckXT32gIPv3M7ar4C9tRJefHfUNnQL+uxoDbANC7E4
 i1PGYBm/PuuNs7IVNxdc8dM8Q1+Ok8zJefW+tym0KqztC49hgAMOume6LHixRkhgk4++
 u6A8c5z3KrgHpH1ya+4YhEi1aeR1HkEQo62YhQhGSgCEIly8gxqbuKX8I2ULTF14LcGa
 Ggtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=QM2N5TlIhsBR4QhgHEfzOoBq009ImxjESnOg2bIvGAg=;
 b=nver49FQfPLaDK0HOofQufgH9+xxQpqO3ViyVAxk57E3LpARx3PfU2EryFLdQRryWo
 b3msu4ShIacUzqAP2QHcRXJ0gfVu7O+CrnNlaJxCJFwrvPb8bvjVh0IFfzyi9RsMn24V
 swhgVcytKOdmeqyEbJ7I2jB7JHxWZfWC7d46EuqbII8C1jCN8pdsBGnV/JVJwA2I/sNw
 d2TnD7mJjxS4xRuj0o7zm1p/gfEWWgUGC5/NwBr634UE0XnVjqGJMnLSETgCO5W/Pod5
 Udr4EN9G+xdtDq6gp5MCE7tv8oXk7cL2tnBvC3zNCWMunyzSSEPxly01LUuCnwfVh4C6
 5w3w==
X-Gm-Message-State: ACrzQf1Tl2k2wHw5C9da9eUlUK2DO2B4HCgPkZ7pzISMhRkX4XvX09Ce
 o8f1t//BMn6wbSIyO1RV798=
X-Google-Smtp-Source: AMsMyM5Nl61SuIfVMpFz8grAYBFaq64nkqX8gwEAHTme6nk7d1EgBLla5vPMoe9xt4zis9VGIfEy4Q==
X-Received: by 2002:a7b:c404:0:b0:3b4:faca:cf50 with SMTP id
 k4-20020a7bc404000000b003b4facacf50mr6636539wmi.67.1664800653863; 
 Mon, 03 Oct 2022 05:37:33 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m64-20020a1ca343000000b003a6125562e1sm11612655wme.46.2022.10.03.05.37.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 05:37:32 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <659e3df0-a384-88e0-b121-7fd7416b09a7@amsat.org>
Date: Mon, 3 Oct 2022 14:37:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: Question about RISC-V brom register a1 set value
Content-Language: en-US
To: Eric Chan <e14002270@gmail.com>, qemu-devel@nongnu.org
References: <CACv+nXAT-tfuabs04y5+DE-R=Hn81nmM3bKsgOkVkWTOYpTHFA@mail.gmail.com>
Cc: qemu-riscv@nongnu.org
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CACv+nXAT-tfuabs04y5+DE-R=Hn81nmM3bKsgOkVkWTOYpTHFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.467,
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
X-List-Received-Date: Mon, 03 Oct 2022 12:37:49 -0000

Cc'ing the RISC-V specific mailing list.

On 1/10/22 01:48, Eric Chan wrote:
> Hi, qemu
> 
> As I know, brom will pass 3 parameters to the next stage bootloader, ex: 
> openSBI.
> a0 will pass hartid, a2 will pass fw_dynamic_info start address.
> although a1 doesn't use directly in openSBI.
> a1 read value is determined in compile time rather than read from the 
> original a1 that passes from brom.
> In qemu/hw/riscv/boot.c
> both 32bit and 64bit machines read 4byte that offset 32byte from the 
> brom start address.
> 
> for 64 bits machine: a1 read low 32bit data member magic of fw_dynamic_info,
> the value will same as FW_DYNAMIC_INFO_MAGIC_VALUE because risc-v is 
> little endian.
> 
> for 32bits machine: each data member of fw_dynamic_info is 4 bytes, so 
> a1 will read the version rather than magic.
> 
> Do the 32bit and 64bit pass different parameters are expected?
> If it is not expected, I guess the original version is 64bit machine, 
> and then supports 32bit but misses this detail, I hope I can have an 
> opportunity to fix this problem.
> If it is expected, why they must be done?
> 
> Thanks,
> Eric Chan
> 
> qemu/include/hw/riscv/boot_opensbi.h
> #define FW_DYNAMIC_INFO_MAGIC_VALUE     0x4942534f
> qemu/hw/riscv/boot.c
> void riscv_setup_rom_reset_vec(MachineState *machine, 
> RISCVHartArrayState *harts,
>                                 hwaddr start_addr,
>                                 hwaddr rom_base, hwaddr rom_size,
> uint64_t kernel_entry,
> uint64_t fdt_load_addr)
> {
> int i;
> uint32_t start_addr_hi32 = 0x00000000;
> uint32_t fdt_load_addr_hi32 = 0x00000000;
> 
> if (!riscv_is_32bit(harts)) {
>          start_addr_hi32 = start_addr >> 32;
>          fdt_load_addr_hi32 = fdt_load_addr >> 32;
>      }
>      /* reset vector */
> uint32_t reset_vec[10] = {
> 0x00000297,                 /* 1:  auipc  t0, %pcrel_hi(fw_dyn) */
> 0x02828613,                 /*     addi   a2, t0, %pcrel_lo(1b) */
> 0xf1402573,                 /*     csrr   a0, mhartid  */
> 0,
> 0,
> 0x00028067,                 /*     jr     t0 */
>          start_addr,                 /* start: .dword */
>          start_addr_hi32,
>          fdt_load_addr,              /* fdt_laddr: .dword */
>          fdt_load_addr_hi32,
>                                       /* fw_dyn: */
>      };
> if (riscv_is_32bit(harts)) {
> reset_vec[3] = 0x0202a583;  /*     lw     a1, 32(t0) */
> reset_vec[4] = 0x0182a283;  /*     lw     t0, 24(t0) */
>      } else {
> reset_vec[3] = 0x0202b583;  /*     ld     a1, 32(t0) */
> reset_vec[4] = 0x0182b283;  /*     ld     t0, 24(t0) */
>      }
> 
>      /* copy in the reset vector in little_endian byte order */
> for (i = 0; i < ARRAY_SIZE(reset_vec); i++) {
> reset_vec[i] = cpu_to_le32(reset_vec[i]);
>      }
> rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
>                            rom_base, &address_space_memory);
> riscv_rom_copy_firmware_info(machine, rom_base, rom_size, sizeof(reset_vec),
>                                   kernel_entry);
> }
> 
> opensbi/firmware/fw_dynamic.S
> fw_boot_hart:
> /* Sanity checks */
> li a1, FW_DYNAMIC_INFO_MAGIC_VALUE
>          REG_L a0, FW_DYNAMIC_INFO_MAGIC_OFFSET(a2)
> bne a0, a1, _bad_dynamic_info
> li a1, FW_DYNAMIC_INFO_VERSION_MAX
>          REG_L a0, FW_DYNAMIC_INFO_VERSION_OFFSET(a2)
> bgt a0, a1, _bad_dynamic_info
> 
> /* Read boot HART id */
> li a1, FW_DYNAMIC_INFO_VERSION_2
> blt a0, a1, 2f
>          REG_L a0, FW_DYNAMIC_INFO_BOOT_HART_OFFSET(a2)
> ret
> 2: li a0, -1
> ret


