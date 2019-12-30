Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ilz8i-0001Ab-AD
	for mharc-qemu-riscv@gnu.org; Mon, 30 Dec 2019 12:47:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58358)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1ilz8f-00018t-8b
 for qemu-riscv@nongnu.org; Mon, 30 Dec 2019 12:47:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1ilz8d-00089m-L6
 for qemu-riscv@nongnu.org; Mon, 30 Dec 2019 12:47:33 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:46155
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1ilz8d-00089O-Hj
 for qemu-riscv@nongnu.org; Mon, 30 Dec 2019 12:47:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577728051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MJStdeV/YujZAu6ZNEHr5cAMDE1K9kOphOPj3BCNNbs=;
 b=N6jtTCshfIkN8WZGyWWWpAfq5KsEjGZTQxjZYkaLpumlou6ZQOCTpfgCVQNLvd45qd+r/5
 ZUOf9k8KpVGy1tJ7o4uMItT05fdv3ImIFUEmFxlfaKb+ltRI/I3mkRkcQJEK9as91LRqJm
 qoMxU5Q/h9tIPkmI3yGrYB4v7ZGpy50=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-Njz7SOyFNmqLIQORmji1tw-1; Mon, 30 Dec 2019 12:47:29 -0500
Received: by mail-ed1-f71.google.com with SMTP id y26so15454661eds.5
 for <qemu-riscv@nongnu.org>; Mon, 30 Dec 2019 09:47:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MJStdeV/YujZAu6ZNEHr5cAMDE1K9kOphOPj3BCNNbs=;
 b=Hbp2B3FKJa5kzN4nc6WQdk039B1l64UaLS4rlQlOzejq3LdIHeA7IaT48692qk2I1c
 G//az22N9ptSK2GQjiJLkX32ZwxxrAYzrJ2gLwt4KCJ9QMXjqB7xfIWaUDamfrgD35nk
 REmYvAzSSbb9D9qG7k0snrE0Vw1fhS2DsdjJBd99YqcYpmDnHdMtOncifZyI2/x57OQf
 lRzpdLoZsfjAMYgOY9Ttt+aBS8rr+CHxaiffmbHb/FY1qCTIfmzbOx0ZucQk8S29OD1F
 8um2xzXDj5D8EjJ3ma+mMC+OwPpqe6FKQMdiw/SAM3H9yfG+6bHzxahIZQEFXQWqdnR6
 Dz6w==
X-Gm-Message-State: APjAAAWDNul+KTbzHi4NU+4FHoa1/LrIiz+hGz5kC6G0wMZoW83vRTdr
 bVE4MItOE2yVw5L60lkxwmmb0GpPyU8e/Fsnxi6p4mh5xeuoDsWSw60EebIj0nQEajgFFrxf997
 GUQPAGCZ8+hfKiFgjUM4IxWGgBRkKmrQ=
X-Received: by 2002:aa7:d9c6:: with SMTP id v6mr72198555eds.107.1577728046206; 
 Mon, 30 Dec 2019 09:47:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqyqZ1wCnv2+UU94l9WCkgm0AhWdAWlM9y7C1eMgbU9R91PpZZoZ+bMWivxkmpNuVXjfIt0cXlAv+6Iz1hz2+r8=
X-Received: by 2002:aa7:d9c6:: with SMTP id v6mr72198492eds.107.1577728045890; 
 Mon, 30 Dec 2019 09:47:25 -0800 (PST)
MIME-Version: 1.0
References: <20191230090900.446-1-philmd@redhat.com>
 <20191230090900.446-2-philmd@redhat.com>
 <273bf2e5-1223-3d01-f930-394195c037e4@weilnetz.de>
 <64c2434d-3b2b-1a3e-5358-e4b5acfbe8e8@redhat.com>
 <CABgObfYahQbbteCAsMfKAYjPLDUpGJExO9mWyRw15mm=VWHsbQ@mail.gmail.com>
 <cd2746d2-8f88-2012-def9-dfce47d8e764@redhat.com>
 <CAP+75-WjOfJeFooQnrhC8y73dCWrfJbHhtYUG3LzZRxpbhTwCA@mail.gmail.com>
In-Reply-To: <CAP+75-WjOfJeFooQnrhC8y73dCWrfJbHhtYUG3LzZRxpbhTwCA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 30 Dec 2019 18:46:37 +0100
Message-ID: <CABgObfaVHsdmRxN4eE=QhUmMGtMM5gZ1uuQ+LUfsB4EWvBTsJw@mail.gmail.com>
Subject: Re: [PATCH 1/2] tcg: Search includes from the project root source
 directory
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel <qemu-devel@nongnu.org>, 
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, "open list:sPAPR" <qemu-ppc@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>, 
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, 
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>, 
 Claudio Fontana <claudio.fontana@huawei.com>, 
 "open list:S390 Virtio-ccw" <qemu-s390x@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Marek Vasut <marex@denx.de>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Chris Wulff <crwulff@gmail.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>,
 qemu-arm <qemu-arm@nongnu.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>, 
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Michael Walle <michael@walle.cc>, 
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 David Gibson <david@gibson.dropbear.id.au>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
X-MC-Unique: Njz7SOyFNmqLIQORmji1tw-1
X-Mimecast-Spam-Score: 0
Content-Type: multipart/alternative; boundary="000000000000ba6063059aef6f6f"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
X-List-Received-Date: Mon, 30 Dec 2019 17:47:35 -0000

--000000000000ba6063059aef6f6f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, of course (I thought it would be clear from the message, but perhaps
it was a bit implicit).

Paolo

Il lun 30 dic 2019, 16:48 Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> h=
a
scritto:

> On Mon, Dec 30, 2019 at 3:02 PM Philippe Mathieu-Daud=C3=A9
> <philmd@redhat.com> wrote:
> > On 12/30/19 11:33 AM, Paolo Bonzini wrote:
> > > Il lun 30 dic 2019, 09:59 Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com
> > > <mailto:philmd@redhat.com>> ha scritto:
> > >
> > >      > I'd prefer not changing those files.
> > >
> > >     OK, I'll wait to see what Richard/Markus prefer.
> > >
> > >
> > > I think it's best if you keep the include directives as-is for files
> > > only needed from tcg/, and move the other headers (those that are
> needed
> > > from other directories only) to include/tcg.
>
> Assuming we don't want to add include/tcg/ in the path search list, we
> still need to update the tcg/*.c include directives to use "tcg/":
>
> tcg/tcg-op-gvec.c:21:10: fatal error: tcg.h: No such file or directory
>    21 | #include "tcg.h"
>       |          ^~~~~~~
> compilation terminated.
> make[1]: *** [rules.mak:69: tcg/tcg-op-gvec.o] Error 1
> make[1]: *** Waiting for unfinished jobs....
>   CC      mips64el-softmmu/accel/tcg/translate-all.o
> tcg/optimize.c:27:10: fatal error: tcg-op.h: No such file or directory
>    27 | #include "tcg-op.h"
>       |          ^~~~~~~~~~
> compilation terminated.
> make[1]: *** [rules.mak:69: tcg/optimize.o] Error 1
> tcg/tcg-op-vec.c:22:10: fatal error: tcg.h: No such file or directory
>    22 | #include "tcg.h"
>       |          ^~~~~~~
> compilation terminated.
> make[1]: *** [rules.mak:69: tcg/tcg-op-vec.o] Error 1
> tcg/tcg-common.c:35:10: fatal error: tcg-opc.h: No such file or directory
>    35 | #include "tcg-opc.h"
>       |          ^~~~~~~~~~~
> compilation terminated.
> make[1]: *** [rules.mak:69: tcg/tcg-common.o] Error 1
> tcg/tcg-op.c:28:10: fatal error: tcg.h: No such file or directory
>    28 | #include "tcg.h"
>       |          ^~~~~~~
> compilation terminated.
> make[1]: *** [rules.mak:69: tcg/tcg-op.o] Error 1
> tcg/tcg.c:51:10: fatal error: tcg-op.h: No such file or directory
>    51 | #include "tcg-op.h"
>       |          ^~~~~~~~~~
> compilation terminated.
>
> > I thought moving headers to include/tcg would diverge too much from
> > libtcg, but this project already did it, so why not:
> > https://github.com/S2E/libtcg/tree/master/include/tcg
>
>

--000000000000ba6063059aef6f6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes, of course (I thought it would be clear from the mess=
age, but perhaps it was a bit implicit).<div dir=3D"auto"><br></div><div di=
r=3D"auto">Paolo</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">Il lun 30 dic 2019, 16:48 Philippe Mathieu-Daud=C3=A9=
 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; ha scri=
tto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">On Mon, Dec 30, 2019 at 3:02 P=
M Philippe Mathieu-Daud=C3=A9<br>
&lt;<a href=3D"mailto:philmd@redhat.com" target=3D"_blank" rel=3D"noreferre=
r">philmd@redhat.com</a>&gt; wrote:<br>
&gt; On 12/30/19 11:33 AM, Paolo Bonzini wrote:<br>
&gt; &gt; Il lun 30 dic 2019, 09:59 Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:philmd@redhat.com" target=3D"_blank" rel=3D"noreferrer">philmd@r=
edhat.com</a><br>
&gt; &gt; &lt;mailto:<a href=3D"mailto:philmd@redhat.com" target=3D"_blank"=
 rel=3D"noreferrer">philmd@redhat.com</a>&gt;&gt; ha scritto:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; I&#39;d prefer not changing those files.=
<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0OK, I&#39;ll wait to see what Richard/Markus p=
refer.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; I think it&#39;s best if you keep the include directives as-is fo=
r files<br>
&gt; &gt; only needed from tcg/, and move the other headers (those that are=
 needed<br>
&gt; &gt; from other directories only) to include/tcg.<br>
<br>
Assuming we don&#39;t want to add include/tcg/ in the path search list, we<=
br>
still need to update the tcg/*.c include directives to use &quot;tcg/&quot;=
:<br>
<br>
tcg/tcg-op-gvec.c:21:10: fatal error: tcg.h: No such file or directory<br>
=C2=A0 =C2=A021 | #include &quot;tcg.h&quot;<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~<br>
compilation terminated.<br>
make[1]: *** [rules.mak:69: tcg/tcg-op-gvec.o] Error 1<br>
make[1]: *** Waiting for unfinished jobs....<br>
=C2=A0 CC=C2=A0 =C2=A0 =C2=A0 mips64el-softmmu/accel/tcg/translate-all.o<br=
>
tcg/optimize.c:27:10: fatal error: tcg-op.h: No such file or directory<br>
=C2=A0 =C2=A027 | #include &quot;tcg-op.h&quot;<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~<br>
compilation terminated.<br>
make[1]: *** [rules.mak:69: tcg/optimize.o] Error 1<br>
tcg/tcg-op-vec.c:22:10: fatal error: tcg.h: No such file or directory<br>
=C2=A0 =C2=A022 | #include &quot;tcg.h&quot;<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~<br>
compilation terminated.<br>
make[1]: *** [rules.mak:69: tcg/tcg-op-vec.o] Error 1<br>
tcg/tcg-common.c:35:10: fatal error: tcg-opc.h: No such file or directory<b=
r>
=C2=A0 =C2=A035 | #include &quot;tcg-opc.h&quot;<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~<br>
compilation terminated.<br>
make[1]: *** [rules.mak:69: tcg/tcg-common.o] Error 1<br>
tcg/tcg-op.c:28:10: fatal error: tcg.h: No such file or directory<br>
=C2=A0 =C2=A028 | #include &quot;tcg.h&quot;<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~<br>
compilation terminated.<br>
make[1]: *** [rules.mak:69: tcg/tcg-op.o] Error 1<br>
tcg/tcg.c:51:10: fatal error: tcg-op.h: No such file or directory<br>
=C2=A0 =C2=A051 | #include &quot;tcg-op.h&quot;<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~<br>
compilation terminated.<br>
<br>
&gt; I thought moving headers to include/tcg would diverge too much from<br=
>
&gt; libtcg, but this project already did it, so why not:<br>
&gt; <a href=3D"https://github.com/S2E/libtcg/tree/master/include/tcg" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/S2E/libtcg/=
tree/master/include/tcg</a><br>
<br>
</blockquote></div>

--000000000000ba6063059aef6f6f--


