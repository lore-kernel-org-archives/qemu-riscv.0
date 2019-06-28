Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hguP0-0007zL-V9
	for mharc-qemu-riscv@gnu.org; Fri, 28 Jun 2019 13:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49395)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hguOw-0007sI-DH
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:11:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hguOq-0000UF-M5
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:11:04 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43881)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hguOq-0000Sa-FO
 for qemu-riscv@nongnu.org; Fri, 28 Jun 2019 13:11:00 -0400
Received: by mail-pg1-f194.google.com with SMTP id f25so2856573pgv.10
 for <qemu-riscv@nongnu.org>; Fri, 28 Jun 2019 10:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=qsZxWBRfqOSKuGdf+FUzca3A9uj05+G06E/pE6sKexs=;
 b=AmLLfvZJTkPPwU21LUbLMuHZyRE1IsmZFKyk43e9H0V5AaC3M69uAhHm4yANWvvC7Z
 e0I+SDqr1cMH/KwcxT7uspMzNIgukgHUZ7fZ5HEQ1l9cuI3we/DG3QVYnIOAxiWvyktn
 L+xxk4fBpzbjp8D2FOB8vYXndOfqrTMiRtmo9J5ZbfodfgwutsGX//mha6S47y/X9RZg
 A9kzCn9ahjwp7rrlwEGk0dC2l0WAsMyHooEJvRCVTTUt9OuSBQemh7t4eNKjhdCEEk/3
 v0vcRZaT1uLuXfnJvqW0vBVB6elFZXehVSuk0rqm4SsCLyKNXtzQmuoR/ul9NRWywsKe
 knlA==
X-Gm-Message-State: APjAAAWMaMzFXFpdBkt7AZugTCjo6+v7PH5msBQKTBB9WWISkkrvr+ne
 JzS8jJ6UT5Pme/nCEL0XDdUZFw==
X-Google-Smtp-Source: APXvYqwhxy7rUFmQTQByUy2VCRxXG9iJcpKMVJXC5kdigBen8pIygSmMaAna3DamSvqYxVt6qO/COg==
X-Received: by 2002:a63:2985:: with SMTP id p127mr9643736pgp.400.1561741857530; 
 Fri, 28 Jun 2019 10:10:57 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id s16sm2774612pfm.26.2019.06.28.10.10.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 10:10:56 -0700 (PDT)
Date: Fri, 28 Jun 2019 10:10:56 -0700 (PDT)
X-Google-Original-Date: Fri, 28 Jun 2019 10:09:52 PDT (-0700)
In-Reply-To: <CAKmqyKP1c5GHKaDuOvu11UtCwnrUosxTtoDAeW7GOS=s+h27aw@mail.gmail.com>
CC: jonathan.cameron@huawei.com, Peter Maydell <peter.maydell@linaro.org>,
 bmeng.cn@gmail.com, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-6abcb5c2-bf03-436b-a614-a9ba5a0aca7f@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.194
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL 33/34] roms: Add OpenSBI
 version 0.3
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
X-List-Received-Date: Fri, 28 Jun 2019 17:11:09 -0000

On Fri, 28 Jun 2019 09:12:45 PDT (-0700), alistair23@gmail.com wrote:
> On Fri, Jun 28, 2019 at 2:47 AM Jonathan Cameron
> <jonathan.cameron@huawei.com> wrote:
>>
>> On Thu, 27 Jun 2019 08:20:10 -0700
>> Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> > From: Alistair Francis <alistair.francis@wdc.com>
>> >
>> > Add OpenSBI version 0.3 as a git submodule and as a prebult binary.
>> >
>> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>> > Tested-by: Bin Meng <bmeng.cn@gmail.com>
>> > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>>
>> I sent a late bug report on this one.. Hence posting here as well
>> to make sure it doesn't fall through the cracks!
>>
>> Right now you can't actually build the opensbi64-virt firmware
>> due to cut and paste error in the Makefile.
>
> Ah, thanks for the bug report.
>
> @Palmer Dabbelt I'm just going to send you a fixup commit. Can you
> apply it to your tree and send a PRv2?

WFM.

>
>>
>> As a side note, I hit this because OpenSBI 0.3 is resulting in a login
>> loop on a debian test image and the current upstream isn't.  I haven't
>> debugged yet, but someone else may hit that problem.
>
> Unfortunately OpenSBI 0.3 is a little old now, in saying that I didn't
> know there are bugs in it? Which kernel are you using?
>
> Alistair
>
>>
>> Thanks,
>>
>> Jonathan
>>
>> > diff --git a/roms/Makefile b/roms/Makefile
>> > index 078d3fb70563..562ed726fd6b 100644
>> > --- a/roms/Makefile
>> > +++ b/roms/Makefile
>> > @@ -37,6 +37,8 @@ find-cross-prefix = $(subst gcc,,$(notdir $(call find-cross-gcc,$(1))))
>> >  powerpc64_cross_prefix := $(call find-cross-prefix,powerpc64)
>> >  powerpc_cross_prefix := $(call find-cross-prefix,powerpc)
>> >  x86_64_cross_prefix := $(call find-cross-prefix,x86_64)
>> > +riscv32_cross_prefix := $(call find-cross-prefix,riscv32)
>> > +riscv64_cross_prefix := $(call find-cross-prefix,riscv64)
>> >
>> >  # tag our seabios builds
>> >  SEABIOS_EXTRAVERSION="-prebuilt.qemu.org"
>> > @@ -52,18 +54,21 @@ EDK2_EFIROM = edk2/BaseTools/Source/C/bin/EfiRom
>> >  default:
>> >       @echo "nothing is build by default"
>> >       @echo "available build targets:"
>> > -     @echo "  bios           -- update bios.bin (seabios)"
>> > -     @echo "  vgabios        -- update vgabios binaries (seabios)"
>> > -     @echo "  sgabios        -- update sgabios binaries"
>> > -     @echo "  pxerom         -- update nic roms (bios only)"
>> > -     @echo "  efirom         -- update nic roms (bios+efi)"
>> > -     @echo "  slof           -- update slof.bin"
>> > -     @echo "  skiboot        -- update skiboot.lid"
>> > -     @echo "  u-boot.e500    -- update u-boot.e500"
>> > -     @echo "  u-boot.sam460  -- update u-boot.sam460"
>> > -     @echo "  efi            -- update UEFI (edk2) platform firmware"
>> > -     @echo "  clean          -- delete the files generated by the previous" \
>> > -                               "build targets"
>> > +     @echo "  bios               -- update bios.bin (seabios)"
>> > +     @echo "  vgabios            -- update vgabios binaries (seabios)"
>> > +     @echo "  sgabios            -- update sgabios binaries"
>> > +     @echo "  pxerom             -- update nic roms (bios only)"
>> > +     @echo "  efirom             -- update nic roms (bios+efi)"
>> > +     @echo "  slof               -- update slof.bin"
>> > +     @echo "  skiboot            -- update skiboot.lid"
>> > +     @echo "  u-boot.e500        -- update u-boot.e500"
>> > +     @echo "  u-boot.sam460      -- update u-boot.sam460"
>> > +     @echo "  efi                -- update UEFI (edk2) platform firmware"
>> > +     @echo "  opensbi32-virt     -- update OpenSBI for 32-bit virt machine"
>> > +     @echo "  opensbi64-virt     -- update OpenSBI for 64-bit virt machine"
>> > +     @echo "  opensbi64-sifive_u -- update OpenSBI for 64-bit sifive_u machine"
>> > +     @echo "  clean              -- delete the files generated by the previous" \
>> > +                                   "build targets"
>> >
>> >  bios: build-seabios-config-seabios-128k build-seabios-config-seabios-256k
>> >       cp seabios/builds/seabios-128k/bios.bin ../pc-bios/bios.bin
>> > @@ -162,6 +167,24 @@ skiboot:
>> >  efi: edk2-basetools
>> >       $(MAKE) -f Makefile.edk2
>> >
>> > +opensbi32-virt:
>> > +     $(MAKE) -C opensbi \
>> > +             CROSS_COMPILE=$(riscv32_cross_prefix) \
>> > +             PLATFORM="qemu/virt"
>> > +     cp opensbi/build/platform/qemu/virt/firmware/fw_jump.bin ../pc-bios/opensbi-riscv32-virt-fw_jump.bin
>> > +
>> > +opensbi64-virt:
>> > +     $(MAKE) -C opensbi \
>> > +             CROSS_COMPILE=$(riscv64_cross_prefix) \
>> > +             PLATFORM="qemu/virt"
>> > +     cp opensbi/build/platform/qemu/virt/firmware/fw_jump.bin ../pc-bios/opensbi-riscv64-virt-fw_jump.bin
>> > +
>> > +opensbi64-virt:
>>
>> Cut and paste buglet.  opensbi64-sifive_u
>>
>> > +     $(MAKE) -C opensbi \
>> > +             CROSS_COMPILE=$(riscv64_cross_prefix) \
>> > +             PLATFORM="qemu/sifive_u"
>> > +     cp opensbi/build/platform/qemu/virt/firmware/fw_jump.bin ../pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
>> > +
>> >  clean:
>> >       rm -rf seabios/.config seabios/out seabios/builds
>> >       $(MAKE) -C sgabios clean
>> > @@ -173,3 +196,4 @@ clean:
>> >       $(MAKE) -C u-boot-sam460ex distclean
>> >       $(MAKE) -C skiboot clean
>> >       $(MAKE) -f Makefile.edk2 clean
>> > +     $(MAKE) -C opensbi clean
>> > diff --git a/roms/opensbi b/roms/opensbi
>> > new file mode 160000
>> > index 000000000000..ca20ac0cd4c0
>> > --- /dev/null
>> > +++ b/roms/opensbi
>> > @@ -0,0 +1 @@
>> > +Subproject commit ca20ac0cd4c099006d4eea4d9ac7bd7b58e2ae0f
>>
>>
>>

