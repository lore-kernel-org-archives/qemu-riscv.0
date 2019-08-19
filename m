Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hzmMe-0000YA-Il
	for mharc-qemu-riscv@gnu.org; Mon, 19 Aug 2019 14:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56927)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1hzmMb-0000VZ-L2
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2019 14:26:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hzmMa-0004Zv-I0
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2019 14:26:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59374)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hzmMa-0004ZJ-AJ
 for qemu-riscv@nongnu.org; Mon, 19 Aug 2019 14:26:40 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 08AD7693F5
 for <qemu-riscv@nongnu.org>; Mon, 19 Aug 2019 18:26:39 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id o13so5621582wrx.20
 for <qemu-riscv@nongnu.org>; Mon, 19 Aug 2019 11:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Es2ujF4TQs/L1dGPbqNiort7s9yCy3mx7V8CuxWsAc=;
 b=m+1RQBSF+OrpDv7afEcDIDpIxSAWVSkfves80aQu6YP/qwT+Gxis6orm6s4pVlOOBX
 DrWdFxPA3Wg7/aK0b61/saNwSQUQAZiRkxnbNJEMbKjbJ2A2iAOmr8qdxedReMEAMfkf
 dYIPuwNPvfqsdew0LhBseoUEth1r1BFWePD99Rec0y257Ds8YydlM5bYXqturHh7IkhV
 TZqDM9lHBEGAnVZBRa/VPzTNwPHU6iPPcT04G3luEk+2c0+YQa6wJtRwYNld+/eS0LwA
 rFsxnSWC0OEFM2DZGJ+g2bxnJ00lMiJeRLZq8ltD0nPWOMIXbyQYdtb0EZmhOXGZZ8PD
 JndA==
X-Gm-Message-State: APjAAAW3xCbbYO8Kchj7tC1sbI0MLXGBe9l6L3HDA4lntcLd4kd24GI4
 td2EfYBQYe0JW88N9Cs+tpdVHePOvVZ3kGFD1dgSp9IgNlebVhgvjC0cVBLM4FzIe17bwXQb72y
 iUaIsCaJtmdLb/6s=
X-Received: by 2002:adf:dd88:: with SMTP id x8mr30951661wrl.331.1566239196748; 
 Mon, 19 Aug 2019 11:26:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw2EVL34Ciz7ioA+ani3uT0x7z6ZHUoOsQkIK2FHJfgumsldLIKL+Pq9V3Dl32Rw0+pybaCXQ==
X-Received: by 2002:adf:dd88:: with SMTP id x8mr30951570wrl.331.1566239196446; 
 Mon, 19 Aug 2019 11:26:36 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:399c:411e:1ccb:f240?
 ([2001:b07:6468:f312:399c:411e:1ccb:f240])
 by smtp.gmail.com with ESMTPSA id k124sm36671949wmk.47.2019.08.19.11.26.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2019 11:26:35 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 tony.nguyen@bt.com, qemu-devel@nongnu.org
Cc: rth@twiddle.net, mst@redhat.com, imammedo@redhat.com,
 marcel.apfelbaum@gmail.com, xiaoguangrong.eric@gmail.com,
 alistair@alistair23.me, peter.maydell@linaro.org, b.galvani@gmail.com,
 clg@kaod.org, andrew@aj.id.au, joel@jms.id.au, i.mitsyanko@gmail.com,
 robh@kernel.org, peter.chubb@nicta.com.au, sundeep.lkml@gmail.com,
 jan.kiszka@web.de, balrogg@gmail.com, eric.auger@redhat.com,
 kraxel@redhat.com, michael@walle.cc, kwolf@redhat.com, mreitz@redhat.com,
 jsnow@redhat.com, keith.busch@intel.com, marcandre.lureau@redhat.com,
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
 <1565940884636.2215@bt.com> <989277a4-7f07-aaaf-f963-ee769e0efd00@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <1ac89581-d52a-cdce-3c5a-786d4cb0d9c1@redhat.com>
Date: Mon, 19 Aug 2019 20:26:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <989277a4-7f07-aaaf-f963-ee769e0efd00@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v7 25/42] hw/misc: Declare
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
X-List-Received-Date: Mon, 19 Aug 2019 18:26:42 -0000

On 16/08/19 12:04, Philippe Mathieu-Daud=C3=A9 wrote:
>> diff --git a/hw/misc/a9scu.c b/hw/misc/a9scu.c
>> index 4307f00..3de8cd3 100644
>> --- a/hw/misc/a9scu.c
>> +++ b/hw/misc/a9scu.c
>> @@ -94,7 +94,7 @@ static void a9_scu_write(void *opaque, hwaddr offset=
,
>> =C2=A0static const MemoryRegionOps a9_scu_ops =3D {
>> =C2=A0 =C2=A0 =C2=A0.read =3D a9_scu_read,
>> =C2=A0 =C2=A0 =C2=A0.write =3D a9_scu_write,
>> - =C2=A0 =C2=A0.endianness =3D DEVICE_NATIVE_ENDIAN,
>> + =C2=A0 =C2=A0.endianness =3D DEVICE_LITTLE_ENDIAN,
> Uh, I doubt that.
>=20

... why? :)

Remember that BE32 and BE8 ARM OSes still are "natively" little-endian.

Paolo

