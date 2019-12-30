Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ilsMo-0007Xc-Qq
	for mharc-qemu-riscv@gnu.org; Mon, 30 Dec 2019 05:33:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58907)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1ilsMm-0007Wy-No
 for qemu-riscv@nongnu.org; Mon, 30 Dec 2019 05:33:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1ilsMk-0002CZ-NP
 for qemu-riscv@nongnu.org; Mon, 30 Dec 2019 05:33:39 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38250
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1ilsMk-0002Bs-KJ
 for qemu-riscv@nongnu.org; Mon, 30 Dec 2019 05:33:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577702018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=osz1+gLyr114GefbdMEHHWsIMT6EPaU/DWBMxBOMOeQ=;
 b=RE2TvwwdhpBUua6EMr2t/AOYMF1f9rTYGZdEyyDDY3mBTk4uhkGqqOHLwiaRyLBC/juJLY
 3osUysJ9ujtRE3Lwr052ewS/2Pu6Z1JaClKGz2kz6x52qzeiDFX0SQi4oMZjwW4MGm38mq
 q5t0rvS4Ts8myTmf1riVDWDkQDrvA5I=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-S82LuQAJO7OfUbGC5C6zDQ-1; Mon, 30 Dec 2019 05:33:34 -0500
Received: by mail-ed1-f72.google.com with SMTP id g11so17967157edu.10
 for <qemu-riscv@nongnu.org>; Mon, 30 Dec 2019 02:33:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=osz1+gLyr114GefbdMEHHWsIMT6EPaU/DWBMxBOMOeQ=;
 b=QRn5jwMGnuakUyuzqmjXUolPEoD1hYs8Wf5hAoAnOC+RYhSsBg4gx+e/Zf1K7qGxoK
 zJizRydihdzA/e23BDdbU7RIvy9cYUpRClbNvtqh+RV+vL4ZDv5vT3qxZb3SGT5ZnheQ
 guhdBS0Uhp3CtxQeHQLYgPTqopJUuR3A3C8fTgAcQN5UUySlBp/4wjMXp8QY0tPVr7Ds
 Tc6+MkXRdm8UpUgTT9FwvJ6jSBs3H8Ep8Eafw+e2eL5NjHEP7omogCjGezX2aUi82kpw
 0xjA1DbTGHFglUuLoMGPbqmgGytGzk4cmewtVdvhgaHo44WIoBsXN4Gt8Mh11dFCeQHG
 R0dw==
X-Gm-Message-State: APjAAAXH+iqlzHsO9K64b3bcQkk+o/XQSMWWRiveuCx5nuP7la4ClYih
 r0yFlRN4NmJyl22xU2bR98JRXIjytzarhGw1DyrJJzJhZvqSHE5fxtVkDKyjjAG9INC4coCX1tE
 a/RyhkF6AkdQpOUCz09AnB/NMizsop54=
X-Received: by 2002:a17:906:7fd0:: with SMTP id
 r16mr67457076ejs.319.1577702013614; 
 Mon, 30 Dec 2019 02:33:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqw1w2ArI0LpE0GqHdw+xKfIcqSZqxPDmQ0Rqbq3Ub7H8CXU01ZbI2JJ/85FUZ9NjgX/OwTJ+TiYi3EVqCnrUxc=
X-Received: by 2002:a17:906:7fd0:: with SMTP id
 r16mr67457016ejs.319.1577702013308; 
 Mon, 30 Dec 2019 02:33:33 -0800 (PST)
MIME-Version: 1.0
References: <20191230090900.446-1-philmd@redhat.com>
 <20191230090900.446-2-philmd@redhat.com>
 <273bf2e5-1223-3d01-f930-394195c037e4@weilnetz.de>
 <64c2434d-3b2b-1a3e-5358-e4b5acfbe8e8@redhat.com>
In-Reply-To: <64c2434d-3b2b-1a3e-5358-e4b5acfbe8e8@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 30 Dec 2019 10:33:21 +0000
Message-ID: <CABgObfYahQbbteCAsMfKAYjPLDUpGJExO9mWyRw15mm=VWHsbQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] tcg: Search includes from the project root source
 directory
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel <qemu-devel@nongnu.org>, 
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, qemu-ppc@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>, 
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, 
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>, 
 Claudio Fontana <claudio.fontana@huawei.com>, qemu-s390x@nongnu.org, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Marek Vasut <marex@denx.de>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, Chris Wulff <crwulff@gmail.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>, 
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Michael Walle <michael@walle.cc>, 
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org
X-MC-Unique: S82LuQAJO7OfUbGC5C6zDQ-1
X-Mimecast-Spam-Score: 0
Content-Type: multipart/alternative; boundary="00000000000010b1de059ae96084"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Mon, 30 Dec 2019 10:33:42 -0000

--00000000000010b1de059ae96084
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il lun 30 dic 2019, 09:59 Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> h=
a
scritto:

> > I'd prefer not changing those files.
>
> OK, I'll wait to see what Richard/Markus prefer.
>

I think it's best if you keep the include directives as-is for files only
needed from tcg/, and move the other headers (those that are needed from
other directories only) to include/tcg.

Thanks and happy new year!

Paolo

>
> > Regards and best wished for 2020
>
> Thanks ;)
>
>

--00000000000010b1de059ae96084
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il lun 30 dic 2019, 09:59 Philippe Mathieu-Daud=C3=A9 =
&lt;<a href=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; ha scrit=
to:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">&gt; I&#39;d prefer not changin=
g those files.<br>
<br>
OK, I&#39;ll wait to see what Richard/Markus prefer.<br></blockquote></div>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">I think it&#39;s best i=
f you keep the include directives as-is for files only needed from tcg/, an=
d move the other headers (those that are needed from other directories only=
) to include/tcg.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks=
 and happy new year!</div><div dir=3D"auto"><br></div><div dir=3D"auto">Pao=
lo</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
<br>
&gt; Regards and best wished for 2020<br>
<br>
Thanks ;)<br>
<br>
</blockquote></div></div></div>

--00000000000010b1de059ae96084--


