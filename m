Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jthAG-0003Ik-50
	for mharc-qemu-riscv@gnu.org; Thu, 09 Jul 2020 20:45:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmerdabbelt@google.com>)
 id 1jthAE-0003Hh-KR
 for qemu-riscv@nongnu.org; Thu, 09 Jul 2020 20:45:18 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:38475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmerdabbelt@google.com>)
 id 1jthAC-0007Ez-4j
 for qemu-riscv@nongnu.org; Thu, 09 Jul 2020 20:45:18 -0400
Received: by mail-pg1-x544.google.com with SMTP id e8so1735249pgc.5
 for <qemu-riscv@nongnu.org>; Thu, 09 Jul 2020 17:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=J1UpzMZlOeaM972X/gFqPoo1VAgPgIckz2WY7EjALcE=;
 b=IkhZW8l/Sz4zoGH/ZsyVjSDJX2px++IaB1CXaFCgnhzZ6FSWNXu0GfAcjs/7CM9p8q
 uPmd4seWQDV1uR+EBHK8ejkXS5i79agal1qjYaEDAyiKq5LbXG8QF7snG10WpZqcoPzo
 GLjf3CBA7OTYIwUu8Qi6gj2v6N6HRk/BRyi7P+t3bz6hwNfudQ4SqhOFGltbKc/r2fhi
 jsMLRkq/Yygu5puBxnfcCgkgPjKegwqs0qIW1JxQk0bQnik6PmYfP4CmKOTqgt/hSzJ0
 stCTxDgiS9SKSBXaDr2NbZ+f+39PVZ3myWqUiXxeMDXmqX17gHuofv2AGlJWdZyyiemJ
 ALUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=J1UpzMZlOeaM972X/gFqPoo1VAgPgIckz2WY7EjALcE=;
 b=MGjobOU6xO/oCwR7ttfnZ/1kXQdYadCbLjCbk20buyvD0nJuw+Px5hrQKF+hjzxHAn
 iN2YGwh6BeYpNDc13GQ11wJoZ8OVxt+KL8zC2snhvd1HQRmneduSPm8+NSEIJAtImkkq
 dwjln5cMBVAE4IsMWIS/0fD0ci3Fj1EQmWwp2DyEfktpsQ3rG3BR4TgX/H0P4eMa0yqy
 rFXmBOIWPiIoEJ/Q99bDGj7xhdVVvdv6NPuRD2IseqqhlT3dj9xRm2Co8R9yP1hKdPwa
 Gct601J9klmyxP1DKIkvFQt7CGQUK8XsWOisDRkNeLZvawRFmaI3kVvgaUTvHuS9rMEu
 y6bw==
X-Gm-Message-State: AOAM530AeN8bXHRvHyC/XFIG5+waHsvKB8/vx82kaxp8NDzHXdtArKs2
 cx/Lv6J3Pi0NFKrUP/uZm8iNRQ==
X-Google-Smtp-Source: ABdhPJxVe8oqIBBadnSd/zhmDGORQpd75WoYuixC1x20+OwxUx1GKMCFyKxnt3tOiwmkF62p3IJnQA==
X-Received: by 2002:a63:20d:: with SMTP id 13mr56638069pgc.166.1594341913243; 
 Thu, 09 Jul 2020 17:45:13 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w1sm3664549pfc.55.2020.07.09.17.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 17:45:12 -0700 (PDT)
Date: Thu, 09 Jul 2020 17:45:12 -0700 (PDT)
X-Google-Original-Date: Thu, 09 Jul 2020 17:45:10 PDT (-0700)
Subject: Re: [PATCH v2 2/2] hw/riscv: sifive_u: Provide a reliable way for
 bootloader to detect whether it is running in QEMU
In-Reply-To: <CAKmqyKPvn7dALUHhK=na1svr==oZ2rvyFOnw8FvRJZP23uHN7Q@mail.gmail.com>
CC: bmeng.cn@gmail.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 sagark@eecs.berkeley.edu, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: alistair23@gmail.com
Message-ID: <mhng-842d31db-ac34-4bab-a523-808f1f542101@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=palmerdabbelt@google.com; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jul 2020 00:45:18 -0000

On Thu, 09 Jul 2020 15:09:18 PDT (-0700), alistair23@gmail.com wrote:
> On Thu, Jul 9, 2020 at 3:07 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> The reset vector codes are subject to change, e.g.: with recent
>> fw_dynamic type image support, it breaks oreboot again.
>
> This is a recurring problem, I have another patch for Oreboot to fix
> the latest breakage.
>
>>
>> Add a subregion in the MROM, with the size of machine RAM stored,
>> so that we can provide a reliable way for bootloader to detect
>> whether it is running in QEMU.
>
> I don't really like this though. I would prefer that we don't
> encourage guest software to behave differently on QEMU. I don't think
> other upstream boards do this.

I agree.  If you want an explicitly virtual board, use the virt board.  Users
of sifive_u are presumably trying to do their best to test against what the
hardware does without actually using the hardware.  Otherwise there should be
no reason to use the sifive_u board, as it's just sticking a layer of
complexity in the middle of everything.

> Besides Oreboot setting up the clocks are there any other users of this?

IIRC we have a scheme for handling the clock setup in QEMU where we accept
pretty much any control write and then just return reads that say the PLLs have
locked.  I'd be in favor of improving the scheme to improve compatibility with
the actual hardware, but adding some way for programs to skip the clocks
because they know they're in QEMU seems like the wrong way to go.

> Alistair
>
>>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>
>> ---
>>
>> Changes in v2:
>> - correctly populate the value in little-endian
>>
>>  hw/riscv/sifive_u.c | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>
>> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
>> index 3413369..79519d4 100644
>> --- a/hw/riscv/sifive_u.c
>> +++ b/hw/riscv/sifive_u.c
>> @@ -88,6 +88,7 @@ static const struct MemmapEntry {
>>
>>  #define OTP_SERIAL          1
>>  #define GEM_REVISION        0x10070109
>> +#define MROM_RAMSIZE_OFFSET 0xf8
>>
>>  static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>>      uint64_t mem_size, const char *cmdline)
>> @@ -496,6 +497,26 @@ static void sifive_u_machine_init(MachineState *machine)
>>      riscv_rom_copy_firmware_info(memmap[SIFIVE_U_MROM].base,
>>                                   memmap[SIFIVE_U_MROM].size,
>>                                   sizeof(reset_vec), kernel_entry);
>> +
>> +    /*
>> +     * Tell guest the machine ram size at MROM_RAMSIZE_OFFSET.
>> +     * On real hardware, the 64-bit value from MROM_RAMSIZE_OFFSET is zero.
>> +     * QEMU aware bootloader (e.g.: oreboot, U-Boot) can check value stored
>> +     * here to determine whether it is running in QEMU.
>> +     */
>> +
>> +    uint32_t ram_size[2] = {
>> +        machine->ram_size,
>> +        ((uint64_t)(machine->ram_size)) >> 32
>> +    };
>> +
>> +    /* copy in the ram size in little_endian byte order */
>> +    for (i = 0; i < ARRAY_SIZE(ram_size); i++) {
>> +        ram_size[i] = cpu_to_le32(ram_size[i]);
>> +    }
>> +    rom_add_blob_fixed_as("mrom.ram_size", ram_size, sizeof(ram_size),
>> +                          memmap[SIFIVE_U_MROM].base + MROM_RAMSIZE_OFFSET,
>> +                          &address_space_memory);
>>  }
>>
>>  static bool sifive_u_machine_get_start_in_flash(Object *obj, Error **errp)
>> --
>> 2.7.4
>>
>>

