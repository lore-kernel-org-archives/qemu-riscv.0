Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pG82a-0001Hq-Ql
	for mharc-qemu-riscv@gnu.org; Thu, 12 Jan 2023 19:35:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pG82Z-0001Hh-M9
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 19:35:27 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pG82X-00013z-Op
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 19:35:27 -0500
Received: by mail-ej1-x62a.google.com with SMTP id mp20so2144751ejc.7
 for <qemu-riscv@nongnu.org>; Thu, 12 Jan 2023 16:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zi9Qa6AMt3W1+CqMED0j4YVa5KH2LsR4xQ1CXfU4iUg=;
 b=UG+X8Afz74dIGO60ON5PS1+YGE9u7Zi1++4pOZAPSbom0aZKZ5kTEFLS4oewq+7GmF
 WaFrrNNF8DycV6U01S1NXo20Q/7i4pbX84E/Inls2vfWsNw/f/bjjsH6OR2L16+FvNtI
 TL3R/1kVCLCGd8o/fqYwmkwMY1Ek2VKnjmwITewb8FtcdIJvqUABWTSi5wocBvMk0ksT
 5+ZaMzQB7AqJhwXZ02KmjBjVxUX6KIm58OdfeYcJKawx+nEf1Yy981ZROYbX3m/+Ljn+
 tLeGg4P05MJecPmCzeVuZhKJbRO+IM3Phdtd3C/1d77C/0NF9xIi4CR8yZywMk87DUB7
 0rCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zi9Qa6AMt3W1+CqMED0j4YVa5KH2LsR4xQ1CXfU4iUg=;
 b=pB4MUIXhPfzeEsfJ4/aco5/PL89OUgog3srVIW15Pn1c/XNyIgjOkjaR60/NWvvXHK
 aSMZxC67N0GNj7iXc591gEEU6qQ/HvPcED/iYn2BTB0wGH5B8+FRlGiCgB0t62rQJQ1a
 NiIsPpqk03ycQjo8NPihxmX1jaMGlz0y74247QvpT+bmv29ZdNYmPiLcyiVF1dnI4CC9
 WgJvc92qlMR9yVQizcXguZT/lNr2MI25nwTanira6VxhcTYBqZjEiNXmu1mpt8E+BhXs
 jmybl5yLEuwA43v3RZ5bvvcSjnbyIAXREOTdpfv02DzUMrm55zNolO+oGD2o9Gd2lwYW
 KBwg==
X-Gm-Message-State: AFqh2korYddCMXs8eGyxm8qk2B02tlrl1lFOSYHz2m9piGTVdUTZpv0e
 svhO5xsucD+g+w6KpuwZ1ZBSYYpmUsXaqjqnSS8=
X-Google-Smtp-Source: AMrXdXtx4dm9ALqVqDLLcVVF1hiWp2urasXDRCG+ep5ibH2C766ZCPF1UGOzrKunus9B6b8blClAKaJt/0p9Ub6DgvA=
X-Received: by 2002:a17:907:7782:b0:7c0:e380:3d44 with SMTP id
 ky2-20020a170907778200b007c0e3803d44mr7093222ejc.498.1673570122467; Thu, 12
 Jan 2023 16:35:22 -0800 (PST)
MIME-Version: 1.0
References: <CAJWvPnt95pOb6-QFxrHMH7NNrtxNHKRLjhVoz5A+BZ2Er-joKQ@mail.gmail.com>
 <Y77mjzm4u1V9JXKO@spud>
 <CAJWvPnst42_HH9VN_BvoFXcSjg_z2Nqm-NN-3A3dgQCMy_iDtA@mail.gmail.com>
 <Y8BLZLw6gP4hUpyy@spud>
In-Reply-To: <Y8BLZLw6gP4hUpyy@spud>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 13 Jan 2023 08:35:11 +0800
Message-ID: <CAEUhbmUa0kCssKBxmkt5qvH5oQmjrbDk_LBb4S2acfGLmzUh5g@mail.gmail.com>
Subject: Re: qemu icicle kit es
To: Conor Dooley <conor@kernel.org>
Cc: stage TC <stagethalescristal@gmail.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 13 Jan 2023 00:35:27 -0000

On Fri, Jan 13, 2023 at 2:03 AM Conor Dooley <conor@kernel.org> wrote:
>
> +CC Bin Meng
>
> On Thu, Jan 12, 2023 at 10:52:39AM +0100, stage TC wrote:
> > Le mer. 11 janv. 2023 =C3=A0 17:40, Conor Dooley <conor@kernel.org> a =
=C3=A9crit :
> > >On Wed, Jan 11, 2023 at 03:21:26PM +0100, stage TC wrote:
> > >> Hello,
> > >> Sorry in advance if this is not the right way to do it but I'm a stu=
dent
> > >> and not very used to this kind of stuff (first mailing list).
> >
> > >Don't worry, you are doing fine :)
>
> One thing to note, this mail appears to be in html form. I am not sure
> what the QEMU mailing lists stance on html mail is, but on other lists
> it is frowned upon.
> Just an FYI if you end up using other mailing lists in the future.
>
> > >> I'm trying to run qemu for the Microchip PolarFire SoC Icicle kit bu=
t I'm
> > >> facing a few issues and the wiki page about that seems obsolete.
> >
> > >I must admit, it's a long time since I tried to use a v2020.x release =
of
> > >any MPFS software. Last time I did give the steps in the docs a go,
> > >with a suitably vintage version of QEMU, things worked as expected.
> > >However, using more recent versions of QEMU I ran into some problems
> > >with the sd/mmc emulation & never get into U-Boot.
> >
> > I was using qemu 7.1 and then came back to qemu 5.2 to try using the sa=
me
> > version as the wiki, does the version of qemu have an impact ?
>
> In theory, it shouldn't. I was just suggesting that you use the version
> in the Wiki as it had obviously been tested at some point in time.
>
> > Should I use a more recent one ?
>
> Ideally yes, but, like you, I wasn't able to get the example to boot on
> recent versions. We had some patches internally that supposedly got
> things working for later versions of QEMU but I never got them to work
> unfortunately.
>
> Bin Meng, you're listed as a supporter (in master anyway) but is that
> still accurate? I figure there's a good chance it isn't anymore?
> Have you tested the platform from HSS init at all lately?

Yes, I am still maintaining the QEMU PolarFire SoC. The WiKi page
listed the exact HSS version I tested and if it doesn't, it should be
a regression in QEMU. If yes, I would like to have a look at that.

Running more recent HSS is known to break, because QEMU does not
follow up quite closely with the HSS implementation as HSS has evolved
quite quickly in the past.

>
> > >> I follow almost exactly what the wiki does (except I use a terminal =
as a
> > >> tty instead of the socket bc it didn't work) but my HSS won't boot o=
n
> > >> versions more recent than 2020.10 or 0.99.12.
> >
> > >What does "my HSS won't boot" mean? E.g:
> > >- Does the MICROCHIP logo banner appear (if it existed back then!)?
> > >   If it didnt, the version string I think was.
> > >- Does the HSS console appear?
> > >- Does it fail to launch the next bootloader stage?
> >
> > With the 0.99.12 and the v2021.02 image the MICROCHIP logo banner appea=
rs
> > with the HSS console and the next bootloader stage seems to launch
> > correctly (see the logs in the attachment).
>
> There is no attachment :(
>
> > With the 0.99.15 the MICROCHIP logo banner appears but the HSS console =
is
> > stuck at "Selecting SD Card ..."
> > With a more recent one nothing appends.
>
> Right. I think this one is because a change was made to the FPGA
> bitstream around this time so that the eMMC and SD card are muxxed using
> a register in the FPGA fabric rather than a GPIO.
>
> Which version of QEMU is this? I can try and see if the emulation is
> missing (or broken). That sort of thing I do have time for (anything I
> do for QEMU is in my spare time).
>
> > >> However I can't find any image compatible for versions older than 20=
20.10
> > >> or 0.99.12 (mines hang at "starting kernel ...".
> >
> > >By that do you mean you cannot find a pre-built yocto image? I am not
> > >sure that there are any that pre-date the one linked in the wiki that
> > >are still available, as those on GitHub only go back as far as v2021.0=
2
> >
> > Yes, that is what I was talking about. The link in the wiki is obsolete=
 and
> > the v2021.2 (the only one left with an sdcard specific version) looks t=
o
> > have been tested on HSS 0.99.15.
>
> I'm not sure if there's much point trying an older version of the image
> than that that was mentioned in the wiki anyway.
>
> Because it's an FPGA, changes can (*and have been*) be made to the
> bitstream that made it incompatible with the emulation of the SoC in
> QEMU - memory layout, etc - so I'd likely not suggest using newer
> versions either!
>
> > >> Is there any newer version of the tutorial ? Or does anyone have an =
idea
> > on
> > >> how to deal with this issue and use qemu for newer versions of the H=
SS ?
> >
> > >I do my testing with something like:
> > >$(QEMU)/qemu-system-riscv64 \
> > >        -M microchip-icicle-kit \
> > >        -m 2G -smp 5 \
> > >        -kernel $(vmlinux_bin) \
> > >        -dtb $(devkit).dtb \
> > >        -initrd $(initramfs) \
> > >        -display none \
> > >        -serial null \
> > >        -serial stdio
> >
> > >This loads a kernel directly rather than using the HSS - for recent
> > >versions of the HSS, implementations of some peripherals need to be
> > >added, for example, it checks things like the cache configuration
> > >during boot, which are not emulated in QEMU.
> >
> > >For that reason, I've stuck with doing direct kernel boots. Linux
> > >v6.0.18 (and the associated devicetree) is the most recent combination
> > >that I have booted unmodified using the master branch of QEMU using
> > >this method.
> >
> > Thanks, I will try to study and use this method, it may be useful.
> >
> > >More recent (linux) kernels come with a device tree that will require
> > >changes in QEMU to support & I have unfortunately not had the time
> > >to work on that recently.
> > >Sorry that I am really of no help to you.
> >
> > It helps me at least to know that this is not just something easy that =
I'm
> > not able to do for no reason. Thanks.
>
> Yeah, I am sorry :/
>

Regards,
Bin

