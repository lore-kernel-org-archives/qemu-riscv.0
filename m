Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iD5H4-0000mS-DY
	for mharc-qemu-riscv@gnu.org; Wed, 25 Sep 2019 07:15:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45980)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iD5H1-0000j3-MM
 for qemu-riscv@nongnu.org; Wed, 25 Sep 2019 07:15:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iD5H0-0002QA-0k
 for qemu-riscv@nongnu.org; Wed, 25 Sep 2019 07:15:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40802)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iD5Gz-0002Ok-OR
 for qemu-riscv@nongnu.org; Wed, 25 Sep 2019 07:15:53 -0400
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C9FB37FDF4
 for <qemu-riscv@nongnu.org>; Wed, 25 Sep 2019 11:15:51 +0000 (UTC)
Received: by mail-wm1-f72.google.com with SMTP id o8so1955907wmc.2
 for <qemu-riscv@nongnu.org>; Wed, 25 Sep 2019 04:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Mz/uTOuIgKfe8DOWM5fk18hSi3MAKOgNRieLhwQuus0=;
 b=HjQOTWZUKKuhHksFBAmSpD4mwuRbpjEEvesEOX9Mqe3TI+GIkd5KnRN5WpYqK0WTGT
 fc2L6eJrHmCHFUNzxcgUeNOkbnCfQG4/Xc3/uNAUGTWvPDHL9bZwAOLKhzLVJfaosggK
 aH30ldYV6wiqEfPwHUMEMFnUIEkN6VfRkyQrzUvBYE8Pm38d0xyUm9N3qS31ndXuSI8s
 q8aA32iyTBvZm4EboGqhsspE7TeN3a0XEuGmcSfG1ObkpFS5R0wR8YZVepQY3/cL8EiL
 R9RuDitKZHkEaTrTxzewowQGF1q11UEQcpzAL6E874dJOSWXIYpCkInLeEVa0EgdpsMc
 yqkw==
X-Gm-Message-State: APjAAAXbQh9snoWAEwZYBOTXF9SnrWYcQu7zlpfCLCWtVVPyGVRTX5ng
 BveuRuBTscn8HyCOAcgnVp7WmkySJjZjuRWY8RBAd+XW+QNglrcypqBelDSCxJabLhjfGM3dECt
 1xY1+6dBYM7E8Y4s=
X-Received: by 2002:a1c:2546:: with SMTP id l67mr7333688wml.10.1569410150417; 
 Wed, 25 Sep 2019 04:15:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy1P1JGXoiYjORMP0BrUwaKNAH+aBh02rYeI8FHulHMY+ZAPwCtNpQmYEM3f4Uf+jNfGfoUiA==
X-Received: by 2002:a1c:2546:: with SMTP id l67mr7333652wml.10.1569410150130; 
 Wed, 25 Sep 2019 04:15:50 -0700 (PDT)
Received: from [10.201.33.84] ([195.166.127.210])
 by smtp.gmail.com with ESMTPSA id u83sm6917752wme.0.2019.09.25.04.15.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2019 04:15:49 -0700 (PDT)
Subject: Re: [PATCH v1 5/6] riscv/virt: Add the PFlash CFI01 device
To: Alistair Francis <alistair23@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Laszlo Ersek
 <lersek@redhat.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
References: <cover.1568931866.git.alistair.francis@wdc.com>
 <0a5c141a26fada6d93d06e996a2f24e1b269ec50.1568931866.git.alistair.francis@wdc.com>
 <CAEUhbmVvDKQqQYE-riq=cvSrCe_NMoW_KDsLjh8CVHRUhJvk9A@mail.gmail.com>
 <CAKmqyKOofA3U+8kjMkzQ0sNd1=uwJHq3c9eaLZdoNCb7=e-PAw@mail.gmail.com>
 <CAFEAcA-uFPGf4BiDXH=Om3Df-xXrt7QwjzVF7E3kY4aMWMP4YQ@mail.gmail.com>
 <16bab4bf-b91e-ef0c-2d22-53538f74cfc4@redhat.com>
 <CAKmqyKNitR4YCLh1y8YThfVZqZj603pat3C=i=86Wx8=SWV3Wg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <6719a00c-2527-7a21-b311-6e4966195110@redhat.com>
Date: Wed, 25 Sep 2019 13:15:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNitR4YCLh1y8YThfVZqZj603pat3C=i=86Wx8=SWV3Wg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Wed, 25 Sep 2019 11:15:57 -0000

On 9/25/19 2:55 AM, Alistair Francis wrote:
> On Tue, Sep 24, 2019 at 2:32 AM Philippe Mathieu-Daud=C3=A9
> <philmd@redhat.com> wrote:
>>
>> On 9/23/19 11:46 PM, Peter Maydell wrote:
>>> On Fri, 20 Sep 2019 at 23:23, Alistair Francis <alistair23@gmail.com>=
 wrote:
>>>> On Thu, Sep 19, 2019 at 10:15 PM Bin Meng <bmeng.cn@gmail.com> wrote=
:
>>>>> I don't think we should mirror what is used on ARM virt board to
>>>>> create 2 flash for sifive_u. For ARM virt, there are 2 flashes beca=
use
>>>>> they need distinguish secure and non-secure. For sifive_u, only one=
 is
>>>>> enough.
>>>>
>>>> I went back and forward about 1 or 2. Two seems more usable as maybe
>>>> someone wants to include two pflash files? The Xilinx machine also h=
as
>>>> two so I'm kind of used to 2, but I'm not really fussed.
>>
>> The Xilinx machine has 2 because it matches the hardware.
>>
>>> One of the reasons for having 2 on the Arm board (we do this
>>> even if we're not supporting secure vs non-secure) is that
>>> then you can use one for a fixed read-only BIOS image (backed
>>> by a file on the host filesystem shared between all VMs), and
>>> one backed by a read-write per-VM file providing permanent
>>> storage for BIOS environment variables. Notably UEFI likes to
>>> work this way, but the idea applies in theory to other
>>> boot loader or BIOSes I guess.
>>
>> IIRC Laszlo's explanation, the only reason it is that way is because t=
he
>> pflash_cfi01 model still doesn't implement sector locking. At the OVMF
>> emerged from EDK2, to have a safe ROM vs DATA storage it was decided t=
o
>> use 2 different flashes.
>> When I understood when this config layout started, I suggested Laszlo =
to
>> use a real ROM to store the OVMF CODE since it is pointless to do
>> firmware upgrade in virtualized environment, but he said it was too la=
te
>> to change the design.
>>
>> If you don't plan to run UEFI "Capsule Update" on your Virt board, I
>> suggest using memory_region_init_rom() with your firmware CODE, and a
>> parallel/SPI flash for the data VARStore.
>=20
> We might run that one day, who knows :)

You certainly want to run EDK2, I'm following RISCV progress on the list.

What doesn't make sense on a virtualized platform is the "Capsule
Update" feature IMO. Where it makes sense is on the SiFive E/U boards
models.

>>> I would suggest also checking with Markus that your code
>>> for instantiating the flash devices follows the current
>>> recommendations so the backing storage can be configured
>>> via -blockdev. (This is a fairly recent change from June or
>>> so; current-in-master virt and sbsa boards provide an example
>>> of doing the right thing, I think.)
>>>
>>> thanks
>>> -- PMM
>>>

