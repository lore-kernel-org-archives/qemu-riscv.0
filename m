Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j15zX-0001Yu-0J
	for mharc-qemu-riscv@gnu.org; Mon, 10 Feb 2020 05:08:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49643)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j15zU-0001YR-Rb
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2020 05:08:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j15zT-0003cw-Qs
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2020 05:08:32 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59918
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j15zT-0003cE-NN
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2020 05:08:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581329310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GEwOIU5Knq6SawMhFxJo/HE+63XcAfDlm1ZnWDPhA4s=;
 b=YJ2l+PGDoP4J01O76EYaDi/7v3rCUUjX13TJMMNMttWaSytEU4kvGxT35D0cRcPvtgeMAz
 yy8wP3XDtFLfgQkjAiHsfZ/CaaxTmCxb2NNwBJszOOVWajgBF6EzSCJJsQ9dPm+7OcDrcb
 dHSSeEvqyxAAfLod9OV7ofFXuhHerkc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-U6AXMn7wO--CByGWEza_lw-1; Mon, 10 Feb 2020 05:08:28 -0500
Received: by mail-wr1-f72.google.com with SMTP id w6so4754933wrm.16
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2020 02:08:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5Ul9+bFbs4YFu9JtS6vW944J+gWMQesivcq7ADHTFdg=;
 b=GbEGNY4yIKiZykbbSECbGSXxqC0Lb6GtWLnHOQqiVuc6Bm6lNb8GJ8SskSuNMOQX5R
 J10bY8yjudIo8I1xVI5GIwyyi39F1K+ivIeAtG27PmA22QspTsj2JS4CuPmF+Q3H5Tlf
 Gnm9wZMF1PGROahjTMsf5aWnma9Kwky0G7+UPH8bEWgMAemOTLZCZ3iLJBnIzEQ2V8SA
 6fG/g6RUg0+99yOzLehXNjLIjgHNsxb0Mn+3T8e3HDDWLh+HBKgyLdRwjWrd04QvdXhf
 xRpwsAcSonoWNVHpkyExLTnDa5HQqMfMf/ePjksuP6/lZdRgeMXDRy2nmQr5dPtoVd5b
 wuOg==
X-Gm-Message-State: APjAAAU5RtUtFE1kA9IqUPDg+DdkC8I4zYOhqt50aKXyey04dtP2t0zO
 Udw9I4DChYQ+23iJEEO50ZQWkNh1hdEFi0Y67lUlCCG4uBwCJpokuTqYSZORhjAdvMINLUmbo+h
 Iqhub0Ub+GztYoHg=
X-Received: by 2002:a1c:7c05:: with SMTP id x5mr14580580wmc.15.1581329307708; 
 Mon, 10 Feb 2020 02:08:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqzemucSh+LJEgGRApO0q2hZLXGUqIUUyrnPIjVxUOYQ08fnpizbAEBzS/n1i6tuXyyYaVE/+Q==
X-Received: by 2002:a1c:7c05:: with SMTP id x5mr14580564wmc.15.1581329307495; 
 Mon, 10 Feb 2020 02:08:27 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id y139sm15275033wmd.24.2020.02.10.02.08.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2020 02:08:26 -0800 (PST)
Subject: Re: Tricore default machine
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Jia Liu <proljc@gmail.com>, qemu-trivial@nongnu.org,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Magnus Damm <magnus.damm@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20200207161948.15972-1-philmd@redhat.com>
 <20200207161948.15972-2-philmd@redhat.com>
 <9590e020-226d-bc85-e496-95b4f0116f69@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e4157357-7697-a2d5-8662-f5bd12d74619@redhat.com>
Date: Mon, 10 Feb 2020 11:08:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <9590e020-226d-bc85-e496-95b4f0116f69@redhat.com>
Content-Language: en-US
X-MC-Unique: U6AXMn7wO--CByGWEza_lw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Mon, 10 Feb 2020 10:08:33 -0000

On 2/10/20 10:35 AM, Thomas Huth wrote:
> On 07/02/2020 17.19, Philippe Mathieu-Daud=C3=A9 wrote:
>> The MachineClass is already zeroed on creation.
>>
>> Note: The code setting is_default=3D0 in hw/i386/pc_piix.c is
>>        different (related to compat options). When adding a
>>        new versioned machine, we want it to be the new default,
>>        so we have to mark the previous one as not default.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>> v3: new patch
>> ---
>>   hw/lm32/lm32_boards.c               | 1 -
>>   hw/lm32/milkymist.c                 | 1 -
>>   hw/m68k/q800.c                      | 1 -
>>   hw/microblaze/petalogix_ml605_mmu.c | 1 -
>>   hw/tricore/tricore_testboard.c      | 1 -
>>   5 files changed, 5 deletions(-)
> [...]
>> diff --git a/hw/tricore/tricore_testboard.c b/hw/tricore/tricore_testboa=
rd.c
>> index 20c9ccb3ce..8ec2b5bddd 100644
>> --- a/hw/tricore/tricore_testboard.c
>> +++ b/hw/tricore/tricore_testboard.c
>> @@ -105,7 +105,6 @@ static void ttb_machine_init(MachineClass *mc)
>>   {
>>       mc->desc =3D "a minimal TriCore board";
>>       mc->init =3D tricoreboard_init;
>> -    mc->is_default =3D 0;
>>       mc->default_cpu_type =3D TRICORE_CPU_TYPE_NAME("tc1796");
>>   }
>=20
> I wonder whether we should simply make that machine the default for
> qemu-system-tricore? There is only one machine here, and not having a
> default machine always causes some headaches in the tests...
> (see e.g. tests/qemu-iotests/check for example)

Or make it generic? If a architecture has a single machine, use it by=20
default?


