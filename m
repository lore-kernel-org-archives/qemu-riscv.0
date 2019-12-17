Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ihG3h-0004Su-SG
	for mharc-qemu-riscv@gnu.org; Tue, 17 Dec 2019 11:50:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56240)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ihG3b-0004LW-Hn
 for qemu-riscv@nongnu.org; Tue, 17 Dec 2019 11:50:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ihG3Z-0005kh-Od
 for qemu-riscv@nongnu.org; Tue, 17 Dec 2019 11:50:47 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:38012
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ihG3Z-0005j3-JF
 for qemu-riscv@nongnu.org; Tue, 17 Dec 2019 11:50:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576601443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hxi4TFPUAhXySks0MDg1YAzEzstwrloAcjIJSqHZj1U=;
 b=XNcPD3erCJ2pmg2N3rgG5QJrwu0bulGZqdXzv8una6NNhXrnwJwOtXjaZVj/iNoZLzJ1gI
 jibt//3mUsKmVCclpB+sLIFooXU8PUUJA2YHY07jKH3e2Sm35u3WA0Ij87JcOZ6vEgXSLw
 ITR49mt3vhBvv3ABxVYdSoumV5QcqOk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-7MlJfc_-MDaEnbWlEeWnjQ-1; Tue, 17 Dec 2019 11:50:42 -0500
Received: by mail-wm1-f71.google.com with SMTP id 7so744168wmf.9
 for <qemu-riscv@nongnu.org>; Tue, 17 Dec 2019 08:50:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aQejgbF//N7qVjT/SefZZofdV97veJrrkximXLqTP+A=;
 b=GbSDVVprI8kFPPxnsRKaeq6Or64YZYqkiACgrLFNjOtszN3TEmJDSAY/Z4gpitIXI9
 sc1w+A6ENzMHACyvtzH6PCroXbnui1CBniD/MJUtwcfrN7pxqG/Dyo/xEtMnWzwdnFpI
 0oyUYH2lc8ofTzpjLqGdOqpth5pKQfEuB9Qu9P0yRcTBOrP8Ul1nEMjrv9aXvixkB7+t
 e0q0XsXvFDtn/3LmPW2t1aCEKdI5TNn5QOg6bQLZEFHUGE+c70ktsTj/vRbk5M1IZB7x
 pHtRvL/XxaCTSl/Q2W/dZdmpTOHTxGrbmqrBxetMvwrA74SoFtTxIdzA0WcNohmPyO0+
 CmpA==
X-Gm-Message-State: APjAAAU11oOe92WtANoIvyro0TxPrpJXUOm5cfqutYvZ4Nap3MlfpVYS
 qygfxYhnw0GaWk3CQp+ns8Ldp2D8O4E2Sk4SBB0KCMisfrUHjip4nw8VY3QqTlFDqwv7Wd8AeY/
 R+izYH2LP+uVCsU4=
X-Received: by 2002:adf:fc0c:: with SMTP id i12mr40284790wrr.74.1576601440898; 
 Tue, 17 Dec 2019 08:50:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqzMWX+DFZaPRiAJdgMUIPC3pOtgwgD77koA4kzYE32onbQoSruQixU1C2EpCg2MAQDxpzSFXg==
X-Received: by 2002:adf:fc0c:: with SMTP id i12mr40284727wrr.74.1576601440590; 
 Tue, 17 Dec 2019 08:50:40 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id s1sm3636122wmc.23.2019.12.17.08.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2019 08:50:39 -0800 (PST)
Subject: Re: [PATCH 00/14] chardev: Use QEMUChrEvent enum in IOEventHandler
 typedef
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, Zhang Chen <chen.zhang@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fabien Chouteau
 <chouteau@adacore.com>, Paul Burton <pburton@wavecomp.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 qemu-block@nongnu.org, Corey Minyard <minyard@acm.org>,
 Max Reitz <mreitz@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Walle <michael@walle.cc>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alberto Garcia <berto@igalia.com>, Peter Chubb <peter.chubb@nicta.com.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Antony Pavlov <antonynpavlov@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 qemu-s390x@nongnu.org, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Amit Shah <amit@kernel.org>,
 qemu-riscv@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Thomas Huth <huth@tuxfamily.org>
References: <20191217163808.20068-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <154a68ee-c683-d5c5-dad8-df483aa00c20@redhat.com>
Date: Tue, 17 Dec 2019 17:50:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191217163808.20068-1-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: 7MlJfc_-MDaEnbWlEeWnjQ-1
X-Mimecast-Spam-Score: 0
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
X-List-Received-Date: Tue, 17 Dec 2019 16:50:52 -0000

On 12/17/19 5:37 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi,
>=20
> After this chat on #qemu IRC:
> 13:20 <stsquad> so what is the difference between a IOReadHandler and IOE=
ventHandler?
> 13:25 <f4bug> stsquad: one is in-band and the other out-of-band?
> 13:26 <stsquad> f4bug: ahh yes it seems so - connect/disconnect etc...
> 13:27 <f4bug> see QEMUChrEvent for IOEventHandler
>=20
> I thought it might be a good opportunity to make the IOEventHandler
> typedef meaning more obvious, by using the QEMUChrEvent enum.
>=20
> To be able to build I had to explicit a 'default' case when frontends
> use a switch(event) case and do not handle all events.
>=20
> Then I used a coccinelle spatch to change the various IOEventHandler.
> I don't think the last patch can be split, but suggestions are welcome!
>=20
> Regards,
>=20
> Phil.
>=20
> PD: I use git-publish. To avoid spamming too much, I'm using per-patch
> Cc tag, after the '---' separator. This way each recipient should get
> the cover and the specific patches of interests, + the last one.
>=20
> Sent with: 'git publish --suppress-cc=3Dcccmd'

While 'git-publish --verbose' show it was adding recipient from the tags:
(mbox) Adding cc: ...
(mbox) Adding cc: ...

It still sent each patch to everybody from the cover:
Server:
MAIL FROM:
RCPT TO: ...
RCPT TO: ...

Maybe the list was cached in the tag and I should have use the=20
--override-cc flag too:

   --override-cc     Ignore any profile or saved CC emails

I apologize for the no-relevant patches I spammed you with :(

> Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>
> Cc: "Marc-Andr=C3=A9 Lureau" <marcandre.lureau@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Alex Benn=C3=A9e" <alex.bennee@linaro.org>
> Cc: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>
> Cc: Andrzej Zaborowski <balrogg@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Max Reitz <mreitz@redhat.com>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: Antony Pavlov <antonynpavlov@gmail.com>
> Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
> Cc: Fabien Chouteau <chouteau@adacore.com>
> Cc: KONRAD Frederic <frederic.konrad@adacore.com>
> Cc: Peter Chubb <peter.chubb@nicta.com.au>
> Cc: Alberto Garcia <berto@igalia.com>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Thomas Huth <huth@tuxfamily.org>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Laurent Vivier <lvivier@redhat.com>
> Cc: Amit Shah <amit@kernel.org>
> Cc: Corey Minyard <minyard@acm.org>
> Cc: Paul Burton <pburton@wavecomp.com>
> Cc: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Aleksandar Markovic <amarkovic@wavecomp.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
> Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Zhang Chen <chen.zhang@intel.com>
> Cc: Li Zhijian <lizhijian@cn.fujitsu.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-block@nongnu.org
> Cc: qemu-s390x@nongnu.org
> Cc: qemu-riscv@nongnu.org


