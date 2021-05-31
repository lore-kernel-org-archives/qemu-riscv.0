Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lniZA-0004tL-7D
	for mharc-qemu-riscv@gnu.org; Mon, 31 May 2021 10:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1lne2V-0005qy-QJ
 for qemu-riscv@nongnu.org; Mon, 31 May 2021 05:16:51 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:43919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1lne2T-0001gF-Pc
 for qemu-riscv@nongnu.org; Mon, 31 May 2021 05:16:51 -0400
Received: by mail-ej1-x636.google.com with SMTP id ci15so12300232ejc.10
 for <qemu-riscv@nongnu.org>; Mon, 31 May 2021 02:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fqp+rl7p76/v3G7irrjYFgTJG53h1kK8OxUUQfYs550=;
 b=oTQYKWdCRblnhH4vgB5yoO7cjjeraJxzj2+SXw0E7oiMG4NcwaVI6xoopWS+E3I52L
 vX/iEbadAs6famyeTU6Rl9DW++PZmahbfD3RNzgynmSsSIOGR46IORQpp2Prun5k2jkm
 67Eje6jY0N+Lnnb37tBtkMZnGrYR0QqYkRHucUUXjmLVfKPSj5Y3xqwUgFVuMJVpkkIZ
 Jc5CbBWOowsZv3FjkhxwYkcAS+j+CEiGuitPPo6nc2t/SF5yfVyJXu6a1sInXrOt0URX
 94+GXxtUrsdF4O+9a/dCWi5SEts/e85nwpBHsuiJS5gnvTkI17sm2t6oYP2a7kn7YX68
 RgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fqp+rl7p76/v3G7irrjYFgTJG53h1kK8OxUUQfYs550=;
 b=K/WvVkuTcHPcYavH5syoLiub+9Y707+MR83kpQEaIuJR1wf543Fgqb32zb3CXMT+Zu
 m8XBp3vvyYzNZYlg8rsaYICTZ/k/PLiO48lzryqIUnNrife6fjLMUiKRRAQU6OMshPL0
 olM6i5U9upWEKwFp96jam5B69DaNHsn8brBSAVYsGBjJ3EWfoGHhchAyAvyx9uA9WYVp
 jYoQKhmKUdwizVnTuM32Armf8f+STiQuaxhvfn2yqVF4MMNuRf2McY6zldBRrNqSXyvI
 FQQRYGdnODQIYf+xO2xpqyXbt6UP8dkBAFFuY8AFrSEHq1ypDSEUy+QNOqTEe7JwSwh2
 GBGA==
X-Gm-Message-State: AOAM533Z/KoHc9n9H0py3XdgvFxmoPYqpdfWOE8GvNdc79y5O05Gw7Sv
 fkS+XDEMOVrXpLzf7VhB7ktTGQ0+RpmJNbjD/P9Blg==
X-Google-Smtp-Source: ABdhPJxQEK9oY1n79JEfA8pHR+Pl3oYOXH1fwtbK57m9tzvPSSF9sfngsvph1Ksa0moS0+VleJVsqdCHHhVzFcVwggE=
X-Received: by 2002:a17:906:f6d7:: with SMTP id
 jo23mr2846321ejb.302.1622452607375; 
 Mon, 31 May 2021 02:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <0CAA9018-0C42-4140-82C1-EAC80D46D359@getmailspring.com>
 <CAEUhbmWnj3GOD5-EA54XHRQyfiSdOsH+KKGH-+uG0LEH+kAuUg@mail.gmail.com>
In-Reply-To: <CAEUhbmWnj3GOD5-EA54XHRQyfiSdOsH+KKGH-+uG0LEH+kAuUg@mail.gmail.com>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Mon, 31 May 2021 14:46:11 +0530
Message-ID: <CA+Oz1=Z4J8KCHk_TZTUB9aEODaRv0F3bF6jtCHwdKQ02VgjcTQ@mail.gmail.com>
Subject: Re: HSS Issue with GCC 10, Qemu Setup for microchip-icicle-kit
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000053fae905c39caf1c"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=rpathak@ventanamicro.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 31 May 2021 10:06:47 -0400
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
X-List-Received-Date: Mon, 31 May 2021 09:16:52 -0000

--00000000000053fae905c39caf1c
Content-Type: text/plain; charset="UTF-8"

I followed the same link. I will elaborate what is happening at my end -

*First* -
Used the same versions as per the doc. Built HSS 2020.12 and used
core-image-minimal-dev-icicle-kit-es-sd-20201009141623.rootfs.wic.
Upon executing the qemu launch command as per the doc, it's just waits for
the connection on another serial console -

info: QEMU waiting for connection on: disconnected:unix
:serial1.sock,server=on

Even if I open sudo minicom -D unix\#serial1.sock, which remains offline
always.

*Second* -
If I remove the "-chardev
socket,id=serial1,path=serial1.sock,server=on,wait=on -serial chardev:serial1"
from the
qemu launch command then HSS boots but stops after sbi_init on all the
cores and put the cores in Idle -

[5.443011] boot_download_chunks_onExit():
boot_service(u54_1)::u54_1:sbi_init 80200000
[5.444960] boot_wait_onEntry(): boot_service(u54_1)::Checking for IPI ACKs:
- -
[5.447962] boot_wait_handler(): boot_service(u54_1)::Checking for IPI ACKs:
ACK/IDLE ACK
[5.449343] RunStateMachine(): boot_service(u54_1)::Wait ->
boot_service(u54_1)::Idle

*Third -*
If I take the latest release of HSS 2021.04 and build with gcc10, it does
not boot at all even if I remove the serial1 like in the second case.


Thanks
Rahul

On Mon, May 31, 2021 at 8:19 AM Bin Meng <bmeng.cn@gmail.com> wrote:

> Hi Rahul,
>
> On Mon, May 31, 2021 at 1:08 AM Rahul Pathak <rpathak@ventanamicro.com>
> wrote:
> >
> > Hi Bin,
> >
> > I was reading a github issue which you raised for the issue with HSS
> because of GCC 10.1. Its pretty old and not sure what has changed so I
> thought to ask you over email for help.
>
> The HSS issue of GCC 10.1 was already fixed in the HSS mainline.
>
> > I myself is trying to make a setup to boot the  microchip-icicle-kit
> Qemu machine with HSS and Yocto linux image. Currently it does not work.
>
> Could you please elaborate which part does not work? Is that Linux,
> HSS, or U-Boot?
>
> >
> > Do you know what is the right setup to make  microchip-icicle-kit
> machine with HSS.bin and Yocto linux work on Qemu?. Probably there will be
> a working combination of HSS, Linux releases plus the toolchain version
> which makes this setup work.
> >
>
> I have not tried Yocto Linux yet with Microchip Icicle Kit on QEMU. I
> only tested the Linux images released by Microchip.
> Could you please follow the instructions @
>
> https://qemu.readthedocs.io/en/latest/system/riscv/microchip-icicle-kit.html
> to see which step might be wrong on your side?
>
> Regards,
> Bin
>

--00000000000053fae905c39caf1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:verdana,sans-serif"><div>
</div><div>I followed the same link. I will elaborate what is happening at =
my end -</div><div><br></div><div>
</div><div><strong>First</strong> -</div><div>Used the same versions as per=
 the doc.  Built HSS <font style=3D"font-family:monospace">2020.12 </font>a=
nd used <font style=3D"font-family:monospace">core-image-minimal-</font><sp=
an style=3D"background-image:linear-gradient(to left,red 40%,rgba(255,255,2=
55,0) 0%);background-position:50% 100%;background-size:5px 1.3px;background=
-repeat:repeat-x"><font style=3D"font-family:monospace">dev</font></span><f=
ont style=3D"font-family:monospace">-icicle-kit-es-</font><span style=3D"ba=
ckground-image:linear-gradient(to left,red 40%,rgba(255,255,255,0) 0%);back=
ground-position:50% 100%;background-size:5px 1.3px;background-repeat:repeat=
-x"><font style=3D"font-family:monospace">sd</font></span><font style=3D"fo=
nt-family:monospace">-20201009141623.</font><span style=3D"background-image=
:linear-gradient(to left,red 40%,rgba(255,255,255,0) 0%);background-positio=
n:50% 100%;background-size:5px 1.3px;background-repeat:repeat-x"><font styl=
e=3D"font-family:monospace">rootfs</font></span><font style=3D"font-family:=
monospace">.</font><span style=3D"background-image:linear-gradient(to left,=
red 40%,rgba(255,255,255,0) 0%);background-position:50% 100%;background-siz=
e:5px 1.3px;background-repeat:repeat-x"><font style=3D"font-family:monospac=
e">wic</font></span><font style=3D"font-family:monospace">.</font></div><di=
v>
</div><div>
</div><div>Upon executing the <span style=3D"background-image:linear-gradie=
nt(to left,red 40%,rgba(255,255,255,0) 0%);background-position:50% 100%;bac=
kground-size:5px 1.3px;background-repeat:repeat-x">qemu</span> launch comma=
nd as per the doc, it&#39;s just waits for the connection on another serial=
 console -</div><div><br></div><div><font style=3D"font-family:monospace">i=
nfo: QEMU waiting for connection on: disconnected:</font><span style=3D"bac=
kground-image:linear-gradient(to left,red 40%,rgba(255,255,255,0) 0%);backg=
round-position:50% 100%;background-size:5px 1.3px;background-repeat:repeat-=
x"><font style=3D"font-family:monospace">unix</font></span><font style=3D"f=
ont-family:monospace">:serial1.sock,server=3Don</font></div><div>
</div><div><br></div><div>Even if I open <span style=3D"background-image:li=
near-gradient(to left,red 40%,rgba(255,255,255,0) 0%);background-position:5=
0% 100%;background-size:5px 1.3px;background-repeat:repeat-x"><font style=
=3D"font-family:monospace">sudo</font></span><font style=3D"font-family:mon=
ospace"> </font><span style=3D"background-image:linear-gradient(to left,red=
 40%,rgba(255,255,255,0) 0%);background-position:50% 100%;background-size:5=
px 1.3px;background-repeat:repeat-x"><font style=3D"font-family:monospace">=
minicom</font></span><font style=3D"font-family:monospace"> -D </font><span=
 style=3D"background-image:linear-gradient(to left,red 40%,rgba(255,255,255=
,0) 0%);background-position:50% 100%;background-size:5px 1.3px;background-r=
epeat:repeat-x"><font style=3D"font-family:monospace">unix\</font></span><f=
ont style=3D"font-family:monospace">#serial1.sock</font>, which remains off=
line always.</div><div>
</div><div><strong><br></strong></div><div><strong>Second</strong> -</div><=
div>If I remove the  <font style=3D"font-family:monospace">&quot;-</font><s=
pan style=3D"background-image:linear-gradient(to left,red 40%,rgba(255,255,=
255,0) 0%);background-position:50% 100%;background-size:5px 1.3px;backgroun=
d-repeat:repeat-x"><font style=3D"font-family:monospace">chardev</font></sp=
an><font style=3D"font-family:monospace"> socket,id=3Dserial1,path=3Dserial=
1.sock,server=3Don,wait=3Don -serial </font><span style=3D"background-image=
:linear-gradient(to left,red 40%,rgba(255,255,255,0) 0%);background-positio=
n:50% 100%;background-size:5px 1.3px;background-repeat:repeat-x"><font styl=
e=3D"font-family:monospace">chardev</font></span><font style=3D"font-family=
:monospace">:serial1&quot; </font>from the</div><div>qemu launch command th=
en HSS boots but stops after sbi_init on all the cores and put the cores in=
 Idle -</div><div><br></div><div>
</div><div><font style=3D"font-family:monospace">[5.443011] boot_download_c=
hunks_onExit(): boot_service(u54_1)::u54_1:sbi_init 80200000               =
                                                                         </=
font></div><div><font style=3D"font-family:monospace">[5.444960] boot_wait_=
onEntry(): boot_service(u54_1)::Checking for IPI ACKs: - -                 =
                                                                           =
   </font></div><div><font style=3D"font-family:monospace">[5.447962] boot_=
wait_handler(): boot_service(u54_1)::Checking for IPI ACKs: ACK/IDLE ACK   =
                                                                         </=
font></div><div><font style=3D"font-family:monospace">[5.449343] RunStateMa=
chine(): boot_service(u54_1)::Wait -&gt; boot_service(u54_1)::Idle   </font=
></div><div>
</div><div>
</div><div><br></div><div><strong>Third -</strong></div><div>If I take the =
latest release of HSS 2021.04 and build with gcc10, it does not boot at all=
 even if I remove the serial1 like in the second case.</div><div><br></div>=
<div><br></div><div>Thanks</div><div>Rahul</div></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 31, 2021=
 at 8:19 AM Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Hi Rahul,<br>
<br>
On Mon, May 31, 2021 at 1:08 AM Rahul Pathak &lt;<a href=3D"mailto:rpathak@=
ventanamicro.com" target=3D"_blank">rpathak@ventanamicro.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt; Hi Bin,<br>
&gt;<br>
&gt; I was reading a github issue which you raised for the issue with HSS b=
ecause of GCC 10.1. Its pretty old and not sure what has changed so I thoug=
ht to ask you over email for help.<br>
<br>
The HSS issue of GCC 10.1 was already fixed in the HSS mainline.<br>
<br>
&gt; I myself is trying to make a setup to boot the=C2=A0 microchip-icicle-=
kit Qemu machine with HSS and Yocto linux image. Currently it does not work=
.<br>
<br>
Could you please elaborate which part does not work? Is that Linux,<br>
HSS, or U-Boot?<br>
<br>
&gt;<br>
&gt; Do you know what is the right setup to make=C2=A0 microchip-icicle-kit=
 machine with HSS.bin and Yocto linux work on Qemu?. Probably there will be=
 a working combination of HSS, Linux releases plus the toolchain version wh=
ich makes this setup work.<br>
&gt;<br>
<br>
I have not tried Yocto Linux yet with Microchip Icicle Kit on QEMU. I<br>
only tested the Linux images released by Microchip.<br>
Could you please follow the instructions @<br>
<a href=3D"https://qemu.readthedocs.io/en/latest/system/riscv/microchip-ici=
cle-kit.html" rel=3D"noreferrer" target=3D"_blank">https://qemu.readthedocs=
.io/en/latest/system/riscv/microchip-icicle-kit.html</a><br>
to see which step might be wrong on your side?<br>
<br>
Regards,<br>
Bin<br>
</blockquote></div></div>

--00000000000053fae905c39caf1c--

