Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ilvcd-0002kx-Eb
	for mharc-qemu-riscv@gnu.org; Mon, 30 Dec 2019 09:02:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60280)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ilvca-0002it-ME
 for qemu-riscv@nongnu.org; Mon, 30 Dec 2019 09:02:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ilvcZ-0008Tj-Hk
 for qemu-riscv@nongnu.org; Mon, 30 Dec 2019 09:02:12 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25762
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ilvcZ-0008TL-Ee
 for qemu-riscv@nongnu.org; Mon, 30 Dec 2019 09:02:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577714530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4fFnOsfrdzXZNd/V8o3HYvj6SVkAdaSl9sgyoNeK6yc=;
 b=bjfoxgqedXj/rTu85y396wKZ+HW3fkFc/p3ns5JOgAlZZrknIokkRHc1l1qUulr89Dp7lz
 EFgFM6gVPOUt6KV0B/qPciXF0fcMIq+87l+lDg5epzGr1jS2/tv49KHet5zq3nBFrUR5Ib
 MgCgV0uo6B09l4RPUamFhU7myEQk+xc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-WuDRcaAQMwyqvjQskVNKHA-1; Mon, 30 Dec 2019 09:02:07 -0500
Received: by mail-wr1-f69.google.com with SMTP id y7so17791855wrm.3
 for <qemu-riscv@nongnu.org>; Mon, 30 Dec 2019 06:02:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/J+Rnxkgh1lDLNt07hjUKRxIL0vPpkp6G8hyPyXwQiE=;
 b=UV4KahBS07oc6ctXD32DDFeNMao40QUWtStgHCQUNNNWEWxRJsgSbEvkxpBcYEJLoa
 1RhVdnX+qA5Idn8TD0njFTCoS2YhoIdPCqv/nFDnPw2H6I8LyIOan8SIAzGbFvWKoku+
 wBs4FogiXourWb7tu7oMM91DCg9pGhPxvxaQ+54nTgsc/Tm72amfzQ0UeK/p2MVSjDsS
 IjxY+0aIIFvaS8EUYX3z7ExEmmirYc3HHjDKxUSJJKhPPYUc8E8R26DHKeW7BsxkKxLQ
 ExpCWn2MkQkAh0t5nPli9Uzij5MCwJAzBXuCGn3sTuWvznLDTDfMFes9fnhTZRNMWg4O
 HDAA==
X-Gm-Message-State: APjAAAWj6Nxaox7h3tJc/oCUjuKixVcOxVAApGQRPprVQSGOOaRlNZho
 OKEV2+qxorrueztHNfgwsOhOJqnYy+6FfBNIKPgY9pU+MlUZa7CCZytC3eF1lvU+xsOMYbmQlsZ
 MHO2JzodQNXZirK4=
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr35197807wmg.110.1577714526131; 
 Mon, 30 Dec 2019 06:02:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqxPO5H/bXv6lj5lAuUtRoNV7gc8w0vMUBMR2MKDR333Asy4R45shkFvfdokwIkLvjqeAuoJVQ==
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr35197742wmg.110.1577714525829; 
 Mon, 30 Dec 2019 06:02:05 -0800 (PST)
Received: from [192.168.1.25] (abayonne-654-1-186-92.w92-134.abo.wanadoo.fr.
 [92.134.161.92])
 by smtp.gmail.com with ESMTPSA id f1sm46608781wrp.93.2019.12.30.06.02.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Dec 2019 06:02:04 -0800 (PST)
Subject: Re: [PATCH 1/2] tcg: Search includes from the project root source
 directory
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Claudio Fontana <claudio.fontana@huawei.com>, qemu-s390x@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Marek Vasut <marex@denx.de>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Chris Wulff <crwulff@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Michael Walle <michael@walle.cc>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org
References: <20191230090900.446-1-philmd@redhat.com>
 <20191230090900.446-2-philmd@redhat.com>
 <273bf2e5-1223-3d01-f930-394195c037e4@weilnetz.de>
 <64c2434d-3b2b-1a3e-5358-e4b5acfbe8e8@redhat.com>
 <CABgObfYahQbbteCAsMfKAYjPLDUpGJExO9mWyRw15mm=VWHsbQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cd2746d2-8f88-2012-def9-dfce47d8e764@redhat.com>
Date: Mon, 30 Dec 2019 15:02:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CABgObfYahQbbteCAsMfKAYjPLDUpGJExO9mWyRw15mm=VWHsbQ@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: WuDRcaAQMwyqvjQskVNKHA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Mon, 30 Dec 2019 14:02:13 -0000

On 12/30/19 11:33 AM, Paolo Bonzini wrote:
>=20
>=20
> Il lun 30 dic 2019, 09:59 Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
=20
> <mailto:philmd@redhat.com>> ha scritto:
>=20
>      > I'd prefer not changing those files.
>=20
>     OK, I'll wait to see what Richard/Markus prefer.
>=20
>=20
> I think it's best if you keep the include directives as-is for files=20
> only needed from tcg/, and move the other headers (those that are needed=
=20
> from other directories only) to include/tcg.

I thought moving headers to include/tcg would diverge too much from=20
libtcg, but this project already did it, so why not:
https://github.com/S2E/libtcg/tree/master/include/tcg


