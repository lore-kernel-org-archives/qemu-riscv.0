Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ioqhU-0005Sa-NF
	for mharc-qemu-riscv@gnu.org; Tue, 07 Jan 2020 10:23:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38805)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1ioqhQ-0005Kt-Cm
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2020 10:23:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1ioqhP-0007dk-4U
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2020 10:23:16 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33675
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1ioqhP-0007dI-1S
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2020 10:23:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578410594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vEZl/neS+NROZ3mdO1oRodcW72dgDNfEVAbmZRX2WOo=;
 b=Ii2kvMAY5e0uf7Ik7+2z2orRKnlQHFASSNY84i7Ng5vrVIStowlIbSQzKvNRaK992cIvIT
 IJC70oQXdde3okO/sRQ5seT8KsNi98ZvZOBS+zescXLKdli/XeMcyCwt+rUHO3cbeUdaFB
 6nS/lJJG1tN1s9ShG2PzMVDV/fTE01M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-ndqKTzjZOVWf2IvVjGUh_g-1; Tue, 07 Jan 2020 10:23:13 -0500
Received: by mail-wr1-f72.google.com with SMTP id v17so67245wrm.17
 for <qemu-riscv@nongnu.org>; Tue, 07 Jan 2020 07:23:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/wc1xxXSPNaCZ+dYdazVsN00S+wbJbcYuMJ74BKeA2g=;
 b=daOnXF7u6FSeL44qegcZK2h8wvqnK8WLR9OqygwDmh91sOc6Zaisqsyb7RKbAB9qjA
 6CJt9cUQrNEYxFYgMteff5BgkOmy6TFWZDTHK/nA+t0UYDsXBTZZLYvnpra/+fJYaO8z
 v2ha+9M93HIJp2XyJ1yVxzfJMihub8iDyvp857w9eBfg/BDGg96RFqtcdRqy8LsweVQ8
 YsJroyKuBt+BxpN2wt0tKfdtpvSQRJe/dlftmBr7Re7PP72nG2VkB9//orSYn8grdNZO
 vcRw5BRrDIoeiiv0sOM20ja3yxpcHbufl+OhXBvaIh6flYXhogvyCNb5OGHS+T28sMan
 +brg==
X-Gm-Message-State: APjAAAVjeAojmns+KDWY9kshat9o3OGoT1gyY+9ZeOW2pvl1qyBaar60
 a4xVhFhXf1htOXnSpfgkJcwkMIKCz94CP3l6B2YYQjzuWK5aR7rcjPC39HHbIuF76eOYdw+4E4z
 EHkxxz6R15lcVMYM=
X-Received: by 2002:adf:f308:: with SMTP id i8mr49579817wro.42.1578410591988; 
 Tue, 07 Jan 2020 07:23:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqyoAFGs2BOpjY0uBeuBN7Yc7/c6alEMV8/94B6n+mL/HLVDW5sduo9VmBSvBDk/vaL1rnBQXA==
X-Received: by 2002:adf:f308:: with SMTP id i8mr49579799wro.42.1578410591769; 
 Tue, 07 Jan 2020 07:23:11 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c6d:4079:b74c:e329?
 ([2001:b07:6468:f312:c6d:4079:b74c:e329])
 by smtp.gmail.com with ESMTPSA id d10sm182760wrw.64.2020.01.07.07.23.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2020 07:23:11 -0800 (PST)
Subject: Re: [PATCH v2 00/14] chardev: Use QEMUChrEvent enum in IOEventHandler
 typedef
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Alistair Francis <alistair@alistair23.me>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Peter Chubb <peter.chubb@nicta.com.au>, Alberto Garcia <berto@igalia.com>,
 Michael Walle <michael@walle.cc>, Thomas Huth <huth@tuxfamily.org>,
 Joel Stanley <joel@jms.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
 Corey Minyard <minyard@acm.org>, Paul Burton <pburton@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zhang Chen <chen.zhang@intel.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-block <qemu-block@nongnu.org>,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org
References: <20191218172009.8868-1-philmd@redhat.com>
 <CAMxuvayWibPU6_mEcYEqsWUhSRra33MvwPrbAYr254ZYaYKBgg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5b35d7f9-4590-2764-b48f-8d841c86fe3e@redhat.com>
Date: Tue, 7 Jan 2020 16:23:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAMxuvayWibPU6_mEcYEqsWUhSRra33MvwPrbAYr254ZYaYKBgg@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: ndqKTzjZOVWf2IvVjGUh_g-1
X-Mimecast-Spam-Score: 0
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
X-List-Received-Date: Tue, 07 Jan 2020 15:23:19 -0000

On 20/12/19 14:32, Marc-Andr=C3=A9 Lureau wrote:
> On Wed, Dec 18, 2019 at 9:20 PM Philippe Mathieu-Daud=C3=A9
> <philmd@redhat.com> wrote:
>>
>> Hi,
>>
>> After this chat on #qemu IRC:
>> 13:20 <stsquad> so what is the difference between a IOReadHandler and IO=
EventHandler?
>> 13:25 <f4bug> stsquad: one is in-band and the other out-of-band?
>> 13:26 <stsquad> f4bug: ahh yes it seems so - connect/disconnect etc...
>> 13:27 <f4bug> see QEMUChrEvent for IOEventHandler
>>
>> I thought it might be a good opportunity to make the IOEventHandler
>> typedef meaning more obvious, by using the QEMUChrEvent enum.
>>
>> To be able to build I had to explicit all enums ignored in the
>> switch(event) statement by these frontends.
>>
>> Then I used a coccinelle spatch to change the various IOEventHandler.
>> I don't think the last patch can be split, but suggestions are welcome!
>>
>> Regards,
>>
>> Phil.
>>
>> v2:
>> - do blindly ignore all events using a 'default' case.
>>
>> Philippe Mathieu-Daud=C3=A9 (14):
>>   hw/ipmi: Remove unnecessary declarations
>>   hw/ipmi: Explicit we ignore some QEMUChrEvent in IOEventHandler
>>   hw/char/terminal3270: Explicit ignored QEMUChrEvent in IOEventHandler
>>   hw/usb/dev-serial: Explicit we ignore few QEMUChrEvent in IOEventHandl=
er
>>   hw/usb/redirect: Explicit we ignore few QEMUChrEvent in IOEventHandler
>>   ccid-card-passthru: Explicit we ignore QEMUChrEvent in IOEventHandler
>>   vhost-user-crypto: Explicit we ignore some QEMUChrEvent in IOEventHand=
ler
>>   vhost-user-net: Explicit we ignore few QEMUChrEvent in IOEventHandler
>>   vhost-user-blk: Explicit we ignore few QEMUChrEvent in IOEventHandler
>>   virtio-console: Explicit we ignore some QEMUChrEvent in IOEventHandler
>>   monitor/qmp: Explicit we ignore few QEMUChrEvent in IOEventHandler
>>   monitor/hmp: Explicit we ignore a QEMUChrEvent in IOEventHandler
>>   chardev/char: Explicit we ignore some QEMUChrEvent in IOEventHandler
>>   chardev: Use QEMUChrEvent enum in IOEventHandler typedef
>=20
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> (I guess Paolo will take the series for next PR?)

Yes, I'm queuing it.  I'll check Richard's remark before sending out the
pull request.

Paolo


