Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyYzu-0002Mh-Ev
	for mharc-qemu-riscv@gnu.org; Fri, 16 Aug 2019 05:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34186)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1hyYzs-0002HP-6E
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 05:58:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hyYzq-0006TK-V8
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 05:58:12 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33117)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hyYzq-0006SI-O1
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 05:58:10 -0400
Received: by mail-wr1-f66.google.com with SMTP id u16so999171wrr.0
 for <qemu-riscv@nongnu.org>; Fri, 16 Aug 2019 02:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Foo7mqc4L4owvltcL+chmVAdJxdrnYoZDMnBcLnmc5c=;
 b=nebf2DgmHUwg57QL86rXbuBlP+dYskb56dN4bei/qDupt7HSTCOoGrYWmzSKnrrO1g
 XvuwKH9ZYyV/L4Lp/a65wU0LlKH1YtkqUWRWLGavLgmKftBnfQIB3qjA0Guzx66qGPPX
 fQnVenC5krDRVSxxcnM0SobmZYU6bpvl0fgdy2gJGZhvrrha81U272EBkyUq8p8ptERj
 IluRRNrzrRU7hPZU2ezfcZfwVizQE3NVjgu5+oKV6CukcLNrGst3JYua9i0FY1t/7WbM
 CGMs3pDhGRa6vY4Tel6fsPSBcO+OXAy0YXGd1fGnEw2A2YIDJfYyNnjaiTj0jXsVzI9o
 0GsQ==
X-Gm-Message-State: APjAAAWBTru4bvKSMz5yTVClWJOm29uMEIbNXXfAoMfeBvJ1WokTad6S
 3qpO9yg0sHnK3KEdq5w9zfl+BQ==
X-Google-Smtp-Source: APXvYqxEtH9z2rQcNW2PoiyLykUukmpcl5g1WXvMOKgN8N7tudUZZZ63JDl5GzOk7+ZQwUPBP9c8/A==
X-Received: by 2002:adf:82d4:: with SMTP id 78mr9141289wrc.85.1565949489545;
 Fri, 16 Aug 2019 02:58:09 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id z1sm5419150wrp.51.2019.08.16.02.58.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Aug 2019 02:58:08 -0700 (PDT)
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <a7d6eede-b152-4c06-8945-9607c663b99c@redhat.com>
Date: Fri, 16 Aug 2019 11:58:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v7 00/42] Invert Endian bit in
 SPARCv9 MMU TTE
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
X-List-Received-Date: Fri, 16 Aug 2019 09:58:13 -0000

Hi Tony,

On 8/16/19 8:28 AM, tony.nguyen@bt.com wrote:
> This patchset implements the IE (Invert Endian) bit in SPARCv9 MMU TTE.
> 
> v7:
[...]
> - Re-declared many native endian devices as little or big endian. This is why
>   v7 has +16 patches.

Why are you doing that? What is the rational?

Anyhow if this not required by your series, you should split it out of
it, and send it on your principal changes are merged.
I'm worried because this these new patches involve many subsystems (thus
maintainers) and reviewing them will now take a fair amount of time.

> For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
> targets from the set of target/hw/*/device.o.
>
> If the set of targets are all little or all big endian, re-declare
> the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN
> respectively.

If only little endian targets use a device, that doesn't mean the device
is designed in little endian...

Then if a big endian target plan to use this device, it will require
more work and you might have introduced regressions...

I'm not sure this is a safe move.

> This *naive* deduction may result in genuinely native endian devices
> being incorrectly declared as little or big endian, but should not
> introduce regressions for current targets.

Regards,

Phil.

