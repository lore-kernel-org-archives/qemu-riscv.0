Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCKM4-00082P-TQ
	for mharc-qemu-riscv@gnu.org; Mon, 23 Sep 2019 05:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52720)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iCKM1-0007x2-Dc
 for qemu-riscv@nongnu.org; Mon, 23 Sep 2019 05:09:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iCKLy-0008Dq-MK
 for qemu-riscv@nongnu.org; Mon, 23 Sep 2019 05:09:55 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:28194
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iCKLy-0008CN-7N
 for qemu-riscv@nongnu.org; Mon, 23 Sep 2019 05:09:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1569229793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=jKga1tA8YbDtAFc6D1iqzbhRz2b0Enh0pJ0iCH4FGGM=;
 b=RmZQDKHKbufeW9sKuta9UifPWQF3+SLFEs2GyBeWF7YbfdeNgtWHfELlfbhl9tZbATKa/r
 9C7eg3YYJXafTuRzY9iJf8zs4NlS9duVajNHs6zA1rfQ+pKF8FOTCmnHM+NCJPMZXliG3Y
 2Xj6U2hmmxFoOeR/JfsYIgf77Kj7a6U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-DFOQ5C5uPI2PGm4aP9TdxA-1; Mon, 23 Sep 2019 05:09:50 -0400
Received: by mail-wm1-f70.google.com with SMTP id m6so4705947wmf.2
 for <qemu-riscv@nongnu.org>; Mon, 23 Sep 2019 02:09:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3UZ5UpiM5VMl98zukP4c1o3KaJWeHTA6Ym5KGThfkEM=;
 b=HQyAGEuvAqglK+ODRz22rsbUEhwl7qeyl7wspOWswDVaWMj3t6fXI9ZipTE/2M60Ay
 VyEeW4xFUng1MK+l6kNrX9guFC/iXsW9kTc+YlQeIqBBo3+BUcsmVmI2jD0qgl/HZuH0
 GgGSwf4MTAo8DtvdE4zVwz22ofNFoxKybuR+AOezcJALU0IgFHQfszzeB0scjuslyiEG
 2JFcSu5RZss3WN6UQZtazQVVOrUjAyFDRge+70hUvIlcO7R2PSo6+7n1lQvdWe/K+mtm
 xcNNpIPVF0aewrGvdw/yPxP8kKUGExLjiagziVih3tsQr9DmswDeXaKsI549TJXBGXHa
 mNXg==
X-Gm-Message-State: APjAAAUCxYT2i7sg/lhZLLkHyN6HnoSKpAFeJ36JxMKiWQ/p0i0b0wa3
 4zXUjTiyDFI/CUyMgKqwNSl7tE4L4gJyg5sya84L42lbydVmdc232WIdDDQtBhfCQL3vunCYdrz
 7P4gjDCLwNz2pTIw=
X-Received: by 2002:a1c:7fcc:: with SMTP id a195mr13236494wmd.27.1569229788998; 
 Mon, 23 Sep 2019 02:09:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxBenpdZaKKg5q9L3EU1AiYKwI145GhCLELXT1Fp+0+lNx/eUzMDqapCop+zqB5NYN9Q2+HDw==
X-Received: by 2002:a1c:7fcc:: with SMTP id a195mr13236469wmd.27.1569229788709; 
 Mon, 23 Sep 2019 02:09:48 -0700 (PDT)
Received: from [192.168.1.40] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id p85sm19949506wme.23.2019.09.23.02.09.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2019 02:09:48 -0700 (PDT)
Subject: Re: [PATCH v1 6/6] riscv/virt: Jump to pflash if specified
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <cover.1568931866.git.alistair.francis@wdc.com>
 <a3649f52a79eff39c707546d88ecd25b753dbf33.1568931866.git.alistair.francis@wdc.com>
 <CAEUhbmVcupHEesoyrfnyCfSUg4Q8pZnyUt=3hpC_g11BL1wxwg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <b6236eec-d60a-c502-e010-f3ca137e8b89@redhat.com>
Date: Mon, 23 Sep 2019 11:09:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmVcupHEesoyrfnyCfSUg4Q8pZnyUt=3hpC_g11BL1wxwg@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: DFOQ5C5uPI2PGm4aP9TdxA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Mon, 23 Sep 2019 09:09:59 -0000

On 9/20/19 7:15 AM, Bin Meng wrote:
> On Fri, Sep 20, 2019 at 6:35 AM Alistair Francis
> <alistair.francis@wdc.com> wrote:
>>
>> If the user supplied pflash to QEMU then change the reset code to jump
>> to the pflash base address instead of the DRAM base address.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  hw/riscv/virt.c | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> index ca002ecea7..ed25cc6761 100644
>> --- a/hw/riscv/virt.c
>> +++ b/hw/riscv/virt.c
>> @@ -441,6 +441,7 @@ static void riscv_virt_board_init(MachineState *mach=
ine)
>>      MemoryRegion *mask_rom =3D g_new(MemoryRegion, 1);
>>      char *plic_hart_config;
>>      size_t plic_hart_config_len;
>> +    target_ulong start_addr =3D memmap[VIRT_DRAM].base;
>>      int i;
>>      unsigned int smp_cpus =3D machine->smp.cpus;
>>
>> @@ -487,6 +488,13 @@ static void riscv_virt_board_init(MachineState *mac=
hine)
>>          }
>>      }
>>
>> +    if (drive_get(IF_PFLASH, 0, 0)) {
>> +        /* Pflash was supplied, let's overwrite the address we jump to =
after
>=20
> nits: wrong multi-line comment format
>=20
>> +         * reset to the base of the flash.
>> +         */
>> +        start_addr =3D virt_memmap[VIRT_FLASH].base;
>> +    }
>> +
>>      /* reset vector */
>>      uint32_t reset_vec[8] =3D {
>>          0x00000297,                  /* 1:  auipc  t0, %pcrel_hi(dtb) *=
/
>> @@ -499,7 +507,7 @@ static void riscv_virt_board_init(MachineState *mach=
ine)
>>  #endif
>>          0x00028067,                  /*     jr     t0 */
>>          0x00000000,
>> -        memmap[VIRT_DRAM].base,      /* start: .dword memmap[VIRT_DRAM]=
.base */
>> +        start_addr,                  /* start: .dword */
>>          0x00000000,
>>                                       /* dtb: */
>>      };
>> --
>=20
> Otherwise,
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


