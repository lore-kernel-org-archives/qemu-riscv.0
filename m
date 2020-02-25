Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6X5j-0000Vb-1F
	for mharc-qemu-riscv@gnu.org; Tue, 25 Feb 2020 05:05:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58906)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6X5f-0000Tg-DK
 for qemu-riscv@nongnu.org; Tue, 25 Feb 2020 05:05:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6X5e-0004zR-1e
 for qemu-riscv@nongnu.org; Tue, 25 Feb 2020 05:05:23 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:51273
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6X5d-0004yh-UR
 for qemu-riscv@nongnu.org; Tue, 25 Feb 2020 05:05:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582625121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZSIX1w871Hq6Mxq5SHmwwfbUgY7lZAD25opJKpMAAYI=;
 b=i0YVp+JzNN1I6/B7eeTGqzaQN7KLMcVZmP+4Xi/wjl6ugjNaILv/wbPGnsyXwKZuPZONKp
 2ZR+0epOLrX9LF97096POMDy9+FEaNndn860YzfGtiJgNecpEZkkygBH9fZX7i42jqxiSk
 GJWAtiDjlzsGXk39Satv0K5WWFrmNy8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-VmQZHSAHPGuw36vvohWTTg-1; Tue, 25 Feb 2020 05:05:19 -0500
X-MC-Unique: VmQZHSAHPGuw36vvohWTTg-1
Received: by mail-wr1-f70.google.com with SMTP id o6so7037312wrp.8
 for <qemu-riscv@nongnu.org>; Tue, 25 Feb 2020 02:05:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JrMl88kPROecXa+gdgRUv+c9C4/VxCb33UuCKxbI6YM=;
 b=J1HFRxGifsY+c52G9aQQU40R7r3ssxyi2GwGG2O/PIs5etQRZdW8LrkJJbcBARu+6l
 JDqX92AYOxbBuf6ltMNeJ25OI3j9irlzpgqAC31qLQq2QKgLromF0m7v60Voi+kPIwc4
 xKGbRtdA2JxBk8gEZ8sSQE8yhcohFxgJxsRQSN9OwzkVegNko6f1snVw6is3iFPd6dTo
 /29/S4YyhLwIhiKBsNT3TA67hcweDiAJdmvwZFXf7E4BYUGZ7spLRPeU/xZJgy0ARNg7
 wNfeex09S32ngvmUvDNPsMlDDKMDRMRMsipdxGAZEqCwQfsBaacXr7ZpxXlDsu9mn6zU
 QT6A==
X-Gm-Message-State: APjAAAWL/V28nUv0Lhkb+/LPJl5cLfccbQbPAXHdrIiOL+BI487pH+E9
 uijpcJs51IrR7OOkM1L6QPtonDkrhT3kPzkmHHMHjwlKh5SOOMyeExOPgePtfkk9W1bIAXvqOGX
 9cbfe03f7zJ3AyB0=
X-Received: by 2002:a05:6000:1147:: with SMTP id
 d7mr10340030wrx.142.1582625118432; 
 Tue, 25 Feb 2020 02:05:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqzYe3l7SDVBJkTUOCevvYRtz1XtiA/cVK6S6Kiv+mhB7y+XmhkOqVf+uCNcqetz/dosbdJByQ==
X-Received: by 2002:a05:6000:1147:: with SMTP id
 d7mr10340005wrx.142.1582625118150; 
 Tue, 25 Feb 2020 02:05:18 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id z25sm3507524wmf.14.2020.02.25.02.05.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 02:05:17 -0800 (PST)
Subject: Re: [PATCH RESEND v2 18/32] hw/i386/pc_sysfw: Simplify using
 memory_region_init_alias()
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>, 
 qemu-block@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Joel Stanley <joel@jms.id.au>, qemu-ppc@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Magnus Damm <magnus.damm@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Jason Wang <jasowang@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Chubb <peter.chubb@nicta.com.au>, Max Reitz <mreitz@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 qemu-arm@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Michael Walle <michael@walle.cc>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org,
 Fabien Chouteau <chouteau@adacore.com>
References: <20200224205533.23798-1-philmd@redhat.com>
 <20200224205533.23798-19-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <532522f3-fc33-4405-1819-fe89c3ed088e@redhat.com>
Date: Tue, 25 Feb 2020 11:05:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224205533.23798-19-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Tue, 25 Feb 2020 10:05:24 -0000

On 2/24/20 9:55 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> The scripts/coccinelle/memory-region-housekeeping.cocci reported:
> * TODO [[view:hw/i386/pc_sysfw.c::face=3Dovl-face1::linb=3D67::colb=3D4::=
cole=3D26][potential use of memory_region_init_rom*() in  hw/i386/pc_sysfw.=
c::67]]
>=20
> pc_isa_bios_init() does a manual copy of a part of the BIOS,
> from a read-only region. We can simplify by directly aliasing
> the same part.
>=20
> Before:
>=20
>    (qemu) info mtree
>    memory-region: system
>      0000000000000000-ffffffffffffffff (prio 0, i/o): system
>        0000000000000000-0000000007ffffff (prio 0, ram): alias ram-below-4=
g @pc.ram 0000000000000000-0000000007ffffff
>        0000000000000000-ffffffffffffffff (prio -1, i/o): pci
>          00000000000a0000-00000000000bffff (prio 1, i/o): vga-lowmem
>          00000000000c0000-00000000000dffff (prio 1, rom): pc.rom
>          00000000000e0000-00000000000fffff (prio 1, rom): isa-bios
>        ...
>        00000000fff00000-00000000ffffffff (prio 0, romd): system.flash0
>=20
> After:
>=20
>    (qemu) info mtree
>    memory-region: system
>      0000000000000000-ffffffffffffffff (prio 0, i/o): system
>        0000000000000000-0000000007ffffff (prio 0, ram): alias ram-below-4=
g @pc.ram 0000000000000000-0000000007ffffff
>        0000000000000000-ffffffffffffffff (prio -1, i/o): pci
>          00000000000a0000-00000000000bffff (prio 1, i/o): vga-lowmem
>          00000000000c0000-00000000000dffff (prio 1, rom): pc.rom
>          00000000000e0000-00000000000fffff (prio 1, romd): alias isa-bios=
 @system.flash0 00000000000e0000-00000000000fffff
>        ...
>        00000000fff00000-00000000ffffffff (prio 0, romd): system.flash0

IIUC migrating old -> new is OK, the previous ROM copy is discarded.

What about new -> old, does it require specific handling? Do we care?

>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>   hw/i386/pc_sysfw.c | 24 ++++++------------------
>   1 file changed, 6 insertions(+), 18 deletions(-)
>=20
> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
> index f5f3f466b0..e864c09ea8 100644
> --- a/hw/i386/pc_sysfw.c
> +++ b/hw/i386/pc_sysfw.c
> @@ -54,31 +54,19 @@ static void pc_isa_bios_init(MemoryRegion *rom_memory=
,
>                                MemoryRegion *flash_mem,
>                                int ram_size)
>   {
> -    int isa_bios_size;
> -    MemoryRegion *isa_bios;
> -    uint64_t flash_size;
> -    void *flash_ptr, *isa_bios_ptr;
> -
> -    flash_size =3D memory_region_size(flash_mem);
> +    uint64_t isa_bios_size;
> +    MemoryRegion *isa_bios =3D g_new(MemoryRegion, 1);
> +    uint64_t flash_size =3D memory_region_size(flash_mem);
>  =20
>       /* map the last 128KB of the BIOS in ISA space */
>       isa_bios_size =3D MIN(flash_size, 128 * KiB);
> -    isa_bios =3D g_malloc(sizeof(*isa_bios));
> -    memory_region_init_ram(isa_bios, NULL, "isa-bios", isa_bios_size,
> -                           &error_fatal);
> +    memory_region_init_alias(isa_bios, NULL, "isa-bios", flash_mem,
> +                             flash_size - isa_bios_size,
> +                             isa_bios_size);
>       memory_region_add_subregion_overlap(rom_memory,
>                                           0x100000 - isa_bios_size,
>                                           isa_bios,
>                                           1);
> -
> -    /* copy ISA rom image from top of flash memory */
> -    flash_ptr =3D memory_region_get_ram_ptr(flash_mem);
> -    isa_bios_ptr =3D memory_region_get_ram_ptr(isa_bios);
> -    memcpy(isa_bios_ptr,
> -           ((uint8_t*)flash_ptr) + (flash_size - isa_bios_size),
> -           isa_bios_size);
> -
> -    memory_region_set_readonly(isa_bios, true);
>   }
>  =20
>   static PFlashCFI01 *pc_pflash_create(PCMachineState *pcms,
>=20


