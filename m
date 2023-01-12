Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFuGc-0001J6-PK
	for mharc-qemu-riscv@gnu.org; Thu, 12 Jan 2023 04:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stagethalescristal@gmail.com>)
 id 1pFuGa-0001I3-3m
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 04:53:00 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stagethalescristal@gmail.com>)
 id 1pFuGY-0003Pl-3V
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 04:52:59 -0500
Received: by mail-wr1-x436.google.com with SMTP id z5so16451581wrt.6
 for <qemu-riscv@nongnu.org>; Thu, 12 Jan 2023 01:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FuNcuf2D/AzRh85hRnKbWp4J5xrtPp8u+DqxFsNl8bo=;
 b=WPSiraDCW0GBL2b5VwsROUjmdYI1x63os+OAq62sNkwgwbYI2pVNk5V8SfvAaV2t3+
 SqhjfVfsYT+zQFQwjlaCT8eX9pmvYZ9yP8bvuwkKBr28U8EN/g7hSPLTNoMbu/WigToz
 bqRu0H13FtkkGhTzI+KR3aoZWpvdXk82INgc0f2XjGAneWQQ+rj0F/Qg9l3ZSVgOBP6/
 5d9OPqeEY3S6ElrOPejCt5/imdsYLbUPewydOzV2ngXvmBHJBCRAITo3JQORpQQu2/2E
 KfZJqjFijaacT3LiyPMSUtekAHHaWDoVsWgqKzAU9lYznqZPyWsKCfYTzZbsTADAONxF
 49kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FuNcuf2D/AzRh85hRnKbWp4J5xrtPp8u+DqxFsNl8bo=;
 b=KzVLjcbYOkaISeQQaxw87zks4Y2mOZKaqmjZ1XjfU1V8HaYAolpqZ/HDX8Q0A3xAdp
 /llPSf/MgXfoXCaZY/N3TGtLUt+Y1+zJspnBD2Mzx3X8IaU3D+QDu5yKcNqGx/dmPBj6
 xsIGXT3+XpEMXtQtgT+TwwgzyeMkHv7Qg0YGKaRqNfKgh9t2KiSneEcS8BTmW6GN6JnH
 5R+zwHFWmggqvoJ5fJpnTV30u16VI0rLrf/h0t7I1jsV1fD58cdq913HYUYHwhuCYe04
 dvUHvkkesnTH5Du7kWTyCNCJ0yNM8vlKVsLciE+I5wLdg51pyIc/JvRCALn8h40GzBm7
 aaww==
X-Gm-Message-State: AFqh2kqqgq0/o/JroDtOq+ZlLoLFtBfo+2QB641KcQOkBynLQf3+jmj4
 ++8tP3yyCSaycSl7ynKI6jTvKCoJ3K/762cTr+k=
X-Google-Smtp-Source: AMrXdXtrx0cV26dGx/B8C9w+EUQBiWR5gBXPHj6WOnqH6NvitPcYrPKR3ESxL3hS1ZFQRpkDS+IIR61+NWYqiou2TtM=
X-Received: by 2002:a5d:6752:0:b0:2aa:bf1f:cc9 with SMTP id
 l18-20020a5d6752000000b002aabf1f0cc9mr1118495wrw.82.1673517171536; Thu, 12
 Jan 2023 01:52:51 -0800 (PST)
MIME-Version: 1.0
References: <CAJWvPnt95pOb6-QFxrHMH7NNrtxNHKRLjhVoz5A+BZ2Er-joKQ@mail.gmail.com>
 <Y77mjzm4u1V9JXKO@spud>
In-Reply-To: <Y77mjzm4u1V9JXKO@spud>
From: stage TC <stagethalescristal@gmail.com>
Date: Thu, 12 Jan 2023 10:52:39 +0100
Message-ID: <CAJWvPnst42_HH9VN_BvoFXcSjg_z2Nqm-NN-3A3dgQCMy_iDtA@mail.gmail.com>
Subject: Re: qemu icicle kit es
To: Conor Dooley <conor@kernel.org>
Cc: qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000088f75005f20e1418"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=stagethalescristal@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jan 2023 09:53:00 -0000

--00000000000088f75005f20e1418
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 11 janv. 2023 =C3=A0 17:40, Conor Dooley <conor@kernel.org> a =C3=
=A9crit :
>On Wed, Jan 11, 2023 at 03:21:26PM +0100, stage TC wrote:
>> Hello,
>> Sorry in advance if this is not the right way to do it but I'm a student
>> and not very used to this kind of stuff (first mailing list).

>Don't worry, you are doing fine :)

>> I'm trying to run qemu for the Microchip PolarFire SoC Icicle kit but I'=
m
>> facing a few issues and the wiki page about that seems obsolete.

>I must admit, it's a long time since I tried to use a v2020.x release of
>any MPFS software. Last time I did give the steps in the docs a go,
>with a suitably vintage version of QEMU, things worked as expected.
>However, using more recent versions of QEMU I ran into some problems
>with the sd/mmc emulation & never get into U-Boot.

I was using qemu 7.1 and then came back to qemu 5.2 to try using the same
version as the wiki, does the version of qemu have an impact ?
Should I use a more recent one ?

>> I follow almost exactly what the wiki does (except I use a terminal as a
>> tty instead of the socket bc it didn't work) but my HSS won't boot on
>> versions more recent than 2020.10 or 0.99.12.

>What does "my HSS won't boot" mean? E.g:
>- Does the MICROCHIP logo banner appear (if it existed back then!)?
>   If it didnt, the version string I think was.
>- Does the HSS console appear?
>- Does it fail to launch the next bootloader stage?

With the 0.99.12 and the v2021.02 image the MICROCHIP logo banner appears
with the HSS console and the next bootloader stage seems to launch
correctly (see the logs in the attachment).
With the 0.99.15 the MICROCHIP logo banner appears but the HSS console is
stuck at "Selecting SD Card ..."
With a more recent one nothing appends.

>> However I can't find any image compatible for versions older than 2020.1=
0
>> or 0.99.12 (mines hang at "starting kernel ...".

>By that do you mean you cannot find a pre-built yocto image? I am not
>sure that there are any that pre-date the one linked in the wiki that
>are still available, as those on GitHub only go back as far as v2021.02

Yes, that is what I was talking about. The link in the wiki is obsolete and
the v2021.2 (the only one left with an sdcard specific version) looks to
have been tested on HSS 0.99.15.

>> Is there any newer version of the tutorial ? Or does anyone have an idea
on
>> how to deal with this issue and use qemu for newer versions of the HSS ?

>I do my testing with something like:
>$(QEMU)/qemu-system-riscv64 \
>        -M microchip-icicle-kit \
>        -m 2G -smp 5 \
>        -kernel $(vmlinux_bin) \
>        -dtb $(devkit).dtb \
>        -initrd $(initramfs) \
>        -display none \
>        -serial null \
>        -serial stdio

>This loads a kernel directly rather than using the HSS - for recent
>versions of the HSS, implementations of some peripherals need to be
>added, for example, it checks things like the cache configuration
>during boot, which are not emulated in QEMU.

>For that reason, I've stuck with doing direct kernel boots. Linux
>v6.0.18 (and the associated devicetree) is the most recent combination
>that I have booted unmodified using the master branch of QEMU using
>this method.

Thanks, I will try to study and use this method, it may be useful.

>More recent (linux) kernels come with a device tree that will require
>changes in QEMU to support & I have unfortunately not had the time
>to work on that recently.
>Sorry that I am really of no help to you.

It helps me at least to know that this is not just something easy that I'm
not able to do for no reason. Thanks.

>Conor.

Islem

--00000000000088f75005f20e1418
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">Le mer. 11 janv. 2023 =C3=A0=C2=A017:40, Conor Dooley &lt;<a hre=
f=3D"mailto:conor@kernel.org">conor@kernel.org</a>&gt; a =C3=A9crit=C2=A0:<=
br></div><div dir=3D"ltr" class=3D"gmail_attr">&gt;On Wed, Jan 11, 2023 at =
03:21:26PM +0100, stage TC wrote:<br></div><div dir=3D"ltr" class=3D"gmail_=
attr">&gt;&gt; Hello,<br></div><div dir=3D"ltr" class=3D"gmail_attr">&gt;&g=
t; Sorry in advance if this is not the right way to do it but I&#39;m a stu=
dent<br></div><div dir=3D"ltr" class=3D"gmail_attr">&gt;&gt; and not very u=
sed to this kind of stuff (first mailing list).</div><div dir=3D"ltr" class=
=3D"gmail_attr"><br></div><div dir=3D"ltr" class=3D"gmail_attr">&gt;Don&#39=
;t worry, you are doing fine :)</div><div dir=3D"ltr" class=3D"gmail_attr">=
<br></div><div dir=3D"ltr" class=3D"gmail_attr">&gt;&gt; I&#39;m trying to =
run qemu for the Microchip PolarFire SoC Icicle kit but I&#39;m<br></div><d=
iv dir=3D"ltr" class=3D"gmail_attr">&gt;&gt; facing a few issues and the wi=
ki page about that seems obsolete.</div><div>=C2=A0<br></div><div>&gt;I mus=
t admit, it&#39;s a long time since I tried to use a v2020.x release of<br>=
</div><div>&gt;any MPFS software. Last time I did give the steps in the doc=
s a go,<br></div><div>&gt;with a suitably vintage version of QEMU, things w=
orked as expected.<br></div><div>&gt;However, using more recent versions of=
 QEMU I ran into some problems<br></div><div>&gt;with the sd/mmc emulation =
&amp; never get into U-Boot.=C2=A0 <br></div><div><br></div><div>I was usin=
g qemu 7.1 and then came back to qemu 5.2 to try using the same version as =
the wiki, does the version of qemu have an impact ? <br></div><div>Should I=
 use a more recent one ?<br></div><div><br></div><div>&gt;&gt; I follow alm=
ost exactly what the wiki does (except I use a terminal as a<br></div><div>=
&gt;&gt; tty instead of the socket bc it didn&#39;t work) but my HSS won&#3=
9;t boot on<br></div><div>&gt;&gt; versions more recent than 2020.10 or 0.9=
9.12.</div><div><br></div><div>&gt;What does &quot;my HSS won&#39;t boot&qu=
ot; mean? E.g:<br></div><div>&gt;- Does the MICROCHIP logo banner appear (i=
f it existed back then!)?<br></div><div>&gt;=C2=A0=C2=A0 If it didnt, the v=
ersion string I think was.<br></div><div>&gt;- Does the HSS console appear?=
<br></div><div>&gt;- Does it fail to launch the next bootloader stage?</div=
><div><br></div><div>With the 0.99.12 and the v2021.02 image the MICROCHIP =
logo banner appears with the HSS console and the next bootloader stage seem=
s to launch correctly (see the logs in the attachment).</div><div>With the =
0.99.15 the MICROCHIP logo banner appears but the HSS console is stuck at &=
quot;Selecting SD Card ...&quot;</div><div>With a more recent one nothing a=
ppends.<br></div><div><br></div><div>&gt;&gt; However I can&#39;t find any =
image compatible for versions older than 2020.10<br></div><div>&gt;&gt; or =
0.99.12 (mines hang at &quot;starting kernel ...&quot;.</div><div><br></div=
><div>&gt;By that do you mean you cannot find a pre-built yocto image? I am=
 not<br></div><div>&gt;sure that there are any that pre-date the one linked=
 in the wiki that<br></div><div>&gt;are still available, as those on GitHub=
 only go back as far as v2021.02</div><div><br></div><div>Yes, that is what=
 I was talking about. The link in the wiki is obsolete and the v2021.2 (the=
 only one left with an sdcard specific version) looks to have been tested o=
n HSS 0.99.15.<br></div><div><br></div><div>&gt;&gt; Is there any newer ver=
sion of the tutorial ? Or does anyone have an idea on<br></div><div>&gt;&gt=
; how to deal with this issue and use qemu for newer versions of the HSS ?<=
/div><div><br></div><div>&gt;I do my testing with something like:<br></div>=
<div>&gt;$(QEMU)/qemu-system-riscv64 \<br></div><div>&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 -M microchip-icicle-kit \<br></div><div>&gt;=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 -m 2G -smp 5 \<br></div><div>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 -kerne=
l $(vmlinux_bin) \<br></div><div>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 -dtb $(dev=
kit).dtb \<br></div><div>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 -initrd $(initramf=
s) \<br></div><div>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 -display none \<br></div=
><div>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 -serial null \<br></div><div>&gt;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 -serial stdio</div><div><br></div><div>&gt;This lo=
ads a kernel directly rather than using the HSS - for recent<br></div><div>=
&gt;versions of the HSS, implementations of some peripherals need to be<br>=
</div><div>&gt;added, for example, it checks things like the cache configur=
ation<br></div><div>&gt;during boot, which are not emulated in QEMU.</div><=
div><br></div><div>&gt;For that reason, I&#39;ve stuck with doing direct ke=
rnel boots. Linux<br></div><div>&gt;v6.0.18 (and the associated devicetree)=
 is the most recent combination<br></div><div>&gt;that I have booted unmodi=
fied using the master branch of QEMU using<br></div><div>&gt;this method.</=
div><div><br></div><div>Thanks, I will try to study and use this method, it=
 may be useful.<br></div><div><br></div><div>&gt;More recent (linux) kernel=
s come with a device tree that will require<br></div><div>&gt;changes in QE=
MU to support &amp; I have unfortunately not had the time<br></div><div>&gt=
;to work on that recently.</div><div>&gt;Sorry that I am really of no help =
to you.</div><div><br></div><div>It helps me at least to know that this is =
not just something easy that I&#39;m not able to do for no reason. Thanks. =
<br></div><div><br></div><div>&gt;Conor.</div><div><br></div><div>Islem<br>=
</div><div><br></div></div></div>

--00000000000088f75005f20e1418--

