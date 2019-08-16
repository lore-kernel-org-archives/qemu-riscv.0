Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyZ3d-0005Ei-5F
	for mharc-qemu-riscv@gnu.org; Fri, 16 Aug 2019 06:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34670)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1hyZ3Z-0005CO-3r
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 06:02:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hyZ3X-0000xM-PG
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 06:02:01 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34955)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hyZ3X-0000wM-Dv
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 06:01:59 -0400
Received: by mail-wm1-f67.google.com with SMTP id l2so3597399wmg.0
 for <qemu-riscv@nongnu.org>; Fri, 16 Aug 2019 03:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GI/EzkhAlPTCaafFlruhK2NwuW2KBxYpRI4/Zpxnrmg=;
 b=DJm/wWoxwk+wEICCukzvMaMVesOkBVPYXqpNIWy7ozBenUl4NUtDTJ67Ki2dqPBKJJ
 iclJe0OcPowXzGNR9hmqb1+66pxLHUyxB9Vlrmti4JiHThHx3Qso5qgBFaGHoDv7w1J9
 jm/Bd2MAbmhFiU5D/00PNjHLMt4OWZOoetz0BiMjgFPFMvmicxAjNQ4+wi4TGBehhO+E
 EsFi9/bkpv87OMNK+UAu5LdUz3HFUcLRLE50M+5jBjwFqTVizuSKy5dSES7HacvrZsBX
 ybnKpqWHQJ7ZV2GU0RIDtYIWpP52BmAyrtAqGfzzOPeHBr1Jc9ICOcjDSMcdLsy3p1hD
 0THA==
X-Gm-Message-State: APjAAAXCojvSkOd1peAPQDrxTxBZBe92/q7D1L0+s1iwpqJfGsZ2BXng
 F+PRRazhXGpkOMzoeTpjvq5GHA==
X-Google-Smtp-Source: APXvYqwS1oPGuh1MYBmNdnbpvSjSqeL7XZd0Nrcv421hxIx7FeNdlx5ElrSZzfLyl59b3tGv2uG/Mw==
X-Received: by 2002:a7b:c4d5:: with SMTP id g21mr6485221wmk.149.1565949718440; 
 Fri, 16 Aug 2019 03:01:58 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id x6sm5463863wrt.63.2019.08.16.03.01.54
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Aug 2019 03:01:57 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
Cc: rth@twiddle.net, pbonzini@redhat.com, mst@redhat.com,
 imammedo@redhat.com, marcel.apfelbaum@gmail.com,
 xiaoguangrong.eric@gmail.com, alistair@alistair23.me,
 peter.maydell@linaro.org, b.galvani@gmail.com, clg@kaod.org,
 andrew@aj.id.au, joel@jms.id.au, i.mitsyanko@gmail.com, robh@kernel.org,
 peter.chubb@nicta.com.au, sundeep.lkml@gmail.com, jan.kiszka@web.de,
 balrogg@gmail.com, eric.auger@redhat.com, kraxel@redhat.com,
 michael@walle.cc, kwolf@redhat.com, mreitz@redhat.com, jsnow@redhat.com,
 keith.busch@intel.com, marcandre.lureau@redhat.com,
 Andrew.Baumann@microsoft.com, edgar.iglesias@gmail.com,
 antonynpavlov@gmail.com, chouteau@adacore.com, frederic.konrad@adacore.com,
 huth@tuxfamily.org, mark.cave-ayland@ilande.co.uk, hpoussin@reactos.org,
 arikalo@wavecomp.com, balaton@eik.bme.hu, gxt@mprc.pku.edu.cn,
 david@gibson.dropbear.id.au, deller@gmx.de, ehabkost@redhat.com,
 sstabellini@kernel.org, anthony.perard@citrix.com, paul.durrant@citrix.com,
 aurelien@aurel32.net, amarkovic@wavecomp.com, magnus.damm@gmail.com,
 berto@igalia.com, minyard@acm.org, pburton@wavecomp.com, jslaby@suse.cz,
 jcd@tribudubois.net, andrew.smirnov@gmail.com, green@moxielogic.com,
 jasowang@redhat.com, dmitry.fleytman@gmail.com, sw@weilnetz.de,
 jiri@resnulli.us, crwulff@gmail.com, marex@denx.de, lersek@redhat.com,
 proljc@gmail.com, shorne@gmail.com, yuval.shaia@oracle.com,
 palmer@sifive.com, sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 walling@linux.ibm.com, cohuck@redhat.com, david@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, fam@euphon.net, hare@suse.com,
 atar4qemu@gmail.com, stefanb@linux.ibm.com, alex.williamson@redhat.com,
 jcmvbkbc@gmail.com, laurent@vivier.eu, claudio.fontana@suse.com,
 stefanha@redhat.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org, xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <1565940869312.41180@bt.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <64d9f983-31e3-6921-4e0f-cd630581ec61@redhat.com>
Date: Fri, 16 Aug 2019 12:01:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1565940869312.41180@bt.com>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v7 24/42] hw/isa: Declare
 device little or big endian
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
X-List-Received-Date: Fri, 16 Aug 2019 10:02:02 -0000

On 8/16/19 9:34 AM, tony.nguyen@bt.com wrote:
> For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
> targets from the set of target/hw/*/device.o.
> 
> If the set of targets are all little or all big endian, re-declare
> the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN
> respectively.
> 
> This *naive* deduction may result in genuinely native endian devices
> being incorrectly declared as little or big endian, but should not
> introduce regressions for current targets.
> 
> These devices should be re-declared as DEVICE_NATIVE_ENDIAN if 1) it
> has a new target with an opposite endian or 2) someone informed knows
> better =)
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  hw/isa/vt82c686.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 12c460590..adf65d3 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -108,7 +108,7 @@ static uint64_t superio_ioport_readb(void *opaque,
> hwaddr addr, unsigned size)
>  static const MemoryRegionOps superio_ops = {
>      .read = superio_ioport_readb,
>      .write = superio_ioport_writeb,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,

Being ioport, one is probably OK.

>      .impl = {
>          .min_access_size = 1,
>          .max_access_size = 1,
> -- 
> 1.8.3.1
> 
> ​
> 

