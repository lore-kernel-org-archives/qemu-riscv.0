Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6ZUm-0005AJ-Vn
	for mharc-qemu-riscv@gnu.org; Tue, 25 Feb 2020 07:39:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57504)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1j6ZUj-00051O-NO
 for qemu-riscv@nongnu.org; Tue, 25 Feb 2020 07:39:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1j6ZUi-00047u-L0
 for qemu-riscv@nongnu.org; Tue, 25 Feb 2020 07:39:25 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27394
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1j6ZUi-00047a-Hf
 for qemu-riscv@nongnu.org; Tue, 25 Feb 2020 07:39:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582634364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=prlOgWgQ9Ik+E3eF9Wnb1i83rqLIAzGc5kS9vOvkF4o=;
 b=d9E7m6YFEXVjeg+csDmhL9gg3I+5oG7ElYfH2L4dLzAWgO1uTGtN0MtMHdTPS5QvHLPdz+
 v+vk7wjXhJlb5uMk1/pg01JKo9i2nyTzUnmXtouk0uGiJPKTG8jktLa6Mwk4qeVruwmrfN
 piil4AtQOpurKs2AxeC8+UUx+uAXn4o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-uPpdn3hBO1mvmIT6JIUXLA-1; Tue, 25 Feb 2020 07:39:19 -0500
X-MC-Unique: uPpdn3hBO1mvmIT6JIUXLA-1
Received: by mail-wm1-f71.google.com with SMTP id y125so586334wmg.1
 for <qemu-riscv@nongnu.org>; Tue, 25 Feb 2020 04:39:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kztbPaVB/2XMFABxpPNGrrCj9r6pdnumsQimldYZmLg=;
 b=FVU/v0zzPo0QLA9cGGJXA5zijCiRJyDG6G2P80zyi+nQ1lgQ1I3dn1qEzpZTWvHTYR
 0Q688Tp1HQ3WuzU84khZYgFVSh0laKNKo8k9L6GKDmvqeLWoYZ/t5FHOblJRqQMqs6bi
 2/dpiG+s5clHs7EFE8XsFeZnz9JEuDbxo0W9Pd77ekDV0Duy1Ex5vb8izgDZYoKkMQRd
 KHtUUFnyVGANSgVn6TOVfysfxyGrCpxkJhD646KgeOKSlUOviiB7cbR7qwONlu6MYOH2
 gy31YOAOI/vY+l6r0MkDhCCjTJCJAzaSBJQk4avlrqPyhxV+YpZWUrv2tzfudU1MdOHA
 pSdQ==
X-Gm-Message-State: APjAAAUG/8WFvxiF1W2DAXPxxAo0AOzD827a3J2hTF8MFG6LwXL/MGm6
 HPQosf6o+uMxPYlS37xy1Ri158lH6Ba+PEVC+2evuGCpM4kZzSy1VS+2jMHh9SMBG+cdUzyncfX
 /TKbYtFefxE0gNH8=
X-Received: by 2002:a1c:541b:: with SMTP id i27mr5524339wmb.137.1582634358170; 
 Tue, 25 Feb 2020 04:39:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqwMxOydfsyqbVFz+9ojWD99h41Ff9l0Bl/3ROeYCCGkjzMVH3uMtzNaJvjeoky0SS3gZviSrg==
X-Received: by 2002:a1c:541b:: with SMTP id i27mr5524296wmb.137.1582634357874; 
 Tue, 25 Feb 2020 04:39:17 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:3577:1cfe:d98a:5fb6?
 ([2001:b07:6468:f312:3577:1cfe:d98a:5fb6])
 by smtp.gmail.com with ESMTPSA id w8sm3982443wmm.0.2020.02.25.04.39.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 04:39:17 -0800 (PST)
Subject: Re: [PATCH RESEND v2 18/32] hw/i386/pc_sysfw: Simplify using
 memory_region_init_alias()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
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
 <532522f3-fc33-4405-1819-fe89c3ed088e@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <683355b0-cf04-d57a-92aa-500dbf1b94a8@redhat.com>
Date: Tue, 25 Feb 2020 13:39:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <532522f3-fc33-4405-1819-fe89c3ed088e@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
X-List-Received-Date: Tue, 25 Feb 2020 12:39:27 -0000

On 25/02/20 11:05, Philippe Mathieu-Daud=C3=A9 wrote:
>>
>> pc_isa_bios_init() does a manual copy of a part of the BIOS,
>> from a read-only region. We can simplify by directly aliasing
>> the same part.
>>
>> Before:
>>
>> =C2=A0=C2=A0 (qemu) info mtree
>> =C2=A0=C2=A0 memory-region: system
>> =C2=A0=C2=A0=C2=A0=C2=A0 0000000000000000-ffffffffffffffff (prio 0, i/o)=
: system
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0000000000000000-0000000007ffffff (=
prio 0, ram): alias
>> ram-below-4g @pc.ram 0000000000000000-0000000007ffffff
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0000000000000000-ffffffffffffffff (=
prio -1, i/o): pci
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00000000000a0000-000000=
00000bffff (prio 1, i/o): vga-lowmem
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00000000000c0000-000000=
00000dffff (prio 1, rom): pc.rom
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00000000000e0000-000000=
00000fffff (prio 1, rom): isa-bios
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00000000fff00000-00000000ffffffff (=
prio 0, romd): system.flash0
>>
>> After:
>>
>> =C2=A0=C2=A0 (qemu) info mtree
>> =C2=A0=C2=A0 memory-region: system
>> =C2=A0=C2=A0=C2=A0=C2=A0 0000000000000000-ffffffffffffffff (prio 0, i/o)=
: system
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0000000000000000-0000000007ffffff (=
prio 0, ram): alias
>> ram-below-4g @pc.ram 0000000000000000-0000000007ffffff
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0000000000000000-ffffffffffffffff (=
prio -1, i/o): pci
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00000000000a0000-000000=
00000bffff (prio 1, i/o): vga-lowmem
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00000000000c0000-000000=
00000dffff (prio 1, rom): pc.rom
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00000000000e0000-000000=
00000fffff (prio 1, romd): alias
>> isa-bios @system.flash0 00000000000e0000-00000000000fffff
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00000000fff00000-00000000ffffffff (=
prio 0, romd): system.flash0
>=20
> IIUC migrating old -> new is OK, the previous ROM copy is discarded.
>=20
> What about new -> old, does it require specific handling? Do we care?

Old->new is broken because the "isa-bios" memory region is not found.

qemu-system-x86_64: Unknown ramblock "isa-bios", cannot accept migration
qemu-system-x86_64: error while loading state for instance 0x0 of device 'r=
am'
qemu-system-x86_64: load of migration failed: Invalid argument

Paolo


