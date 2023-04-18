Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1polHG-00075L-A4
	for mharc-qemu-riscv@gnu.org; Tue, 18 Apr 2023 09:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mikhail.ramalho@gmail.com>)
 id 1pojF4-000478-LH; Tue, 18 Apr 2023 07:11:23 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mikhail.ramalho@gmail.com>)
 id 1pojF2-0004YM-B8; Tue, 18 Apr 2023 07:11:22 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-187b07ad783so320063fac.0; 
 Tue, 18 Apr 2023 04:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681816278; x=1684408278;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EI4HNT4oTlJCMseJJOHiI9dx+lFLSkH2kcgC5JTbY14=;
 b=pKPGptM20UrN8dl6UFZNB7DTUSJtuG36OF/fxFmwWZFyijQIY58xZxAXQFSHuhonvr
 4v3yXlobnHzO6RsrWzo0DEWQ1mEUP2apFKd90Ko4z/mUCwZZeurgoFbTRlkrlFLi1INX
 5SYh1WGsBIOvsIrNuLO5IiiZQwdpy8vMyuFmvhvLuTpM6J7EO70XchHcWYdlMdbvce6h
 p6JXt5/hdPRavcaO+VOGyNce6no1nrLKfe7Eeh81iDj2M4edoDt2fDaMRr7R1UVfv3GI
 CGBoC8jZ73Sr7s9mf9dYIAxR3en0RWjEWC6xL2zyW1kQf3Nt574xu1BOPKYdvAQcbNBy
 vmyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681816278; x=1684408278;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EI4HNT4oTlJCMseJJOHiI9dx+lFLSkH2kcgC5JTbY14=;
 b=d9QahGbPGinZwPA3tWZSxQ9iS7H9FvWs5HjJgdMkCHeWQFuKNfvqAKwd3SW8PY5wO5
 q9X8jKBr6tOhazG10SRkpTbQX2gMAq21Z0nHjhXuGqXKRvRc5RWSArMZ2Dc/gEHie7dB
 el+YeX9VRT7Merw+q/WeS91TIm5S5pAk9Vhve8z1VRDwSJDyLzt5lTbPYFt+cJrFHyQ6
 Dmow8Auv2Z4MCO3+vNngtUyRUwQGCW0xMLMjA5ynP1qeFXRHhcBf8nuIgs2jP6lXlJTm
 x48O6kRtE0YR4sKPJQjjWPCEam2VA21bfNM5TUwlsSi87kstf9MvuWrS1SE40qGHRvKl
 VoaQ==
X-Gm-Message-State: AAQBX9e9D7QI2pDXirV6eazEn/f3SsvJDe3zZVtGnclexXCH1vNN0bIJ
 ULikNpJcq+6oCBjon55H7lFIm98AR3aMIKfoRR8=
X-Google-Smtp-Source: AKy350ZkXWkGY3r+I7or+uV6VRGkbgbnnK58r5lObsTUUUeWdPglVCL+uvm5zBDOY+IOdoh0L64vEsc194lNbqnOvsk=
X-Received: by 2002:a05:6871:8aa:b0:184:858a:55cb with SMTP id
 r42-20020a05687108aa00b00184858a55cbmr861637oaq.0.1681816278200; Tue, 18 Apr
 2023 04:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAORA-9bu70APxEC4w+Ona9dzTN9Wy9kmPzEQAgxOQ6u6eK71ug@mail.gmail.com>
 <3aab7cc1-c068-da71-13bc-58f7dd164bfb@redhat.com>
In-Reply-To: <3aab7cc1-c068-da71-13bc-58f7dd164bfb@redhat.com>
From: "Mikhail R. Gadelha" <mikhail.ramalho@gmail.com>
Date: Tue, 18 Apr 2023 08:10:42 -0300
Message-ID: <CAORA-9aRVgiA-OZ0NC0PrkTiQL76we12pRzcX_y=NVYPVCt2Dw@mail.gmail.com>
Subject: Re: How to increase memory in a RISCV32 image? Stuck with 988MB
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-discuss@nongnu.org, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000d6fa1d05f99a5de0"
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=mikhail.ramalho@gmail.com; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 18 Apr 2023 09:21:45 -0400
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
X-List-Received-Date: Tue, 18 Apr 2023 11:11:25 -0000

--000000000000d6fa1d05f99a5de0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yeah, I mentioned in the email it doesn't even start with mem=3D4G...

With lower values, e.g., mem=3D3G, the image starts but I'm limited to 988M=
B
of RAM.


Em ter., 18 de abr. de 2023 =C3=A0s 04:42, Thomas Huth <thuth@redhat.com>
escreveu:

> On 17/04/2023 19.21, Mikhail R. Gadelha wrote:
> > Hi qemu folks,
> >
> > I'm using yocto to generate a riscv32 image but qemu seems to be
> ignoring
> > the -m argument from the command line and forcing the image to run with
> > 988MB of RAM.
> >
> > Is there any way I can increase it to 4G?
> >
> > I'm using the following cmdline to start qemu:
> >
> > qemu-system-riscv32 -nographic -machine virt -m 4G -smp 8 -bios
> >
> /home/mgadelha/tools/poky/build/tmp/deploy/images/qemuriscv32/fw_jump.elf
> > -kernel
> /home/mgadelha/tools/poky/build/tmp/deploy/images/qemuriscv32/Image
> > -append "root=3D/dev/vda rw mem=3D4G" -drive
>
> That "mem=3D4G" part of the -append option looks suspicious ... have you
> already tried to boot without that, or to decrease it to a number that
> fits
> into 32-bit, e.g. "mem=3D3G" ?
>
>   HTH,
>    Thomas
>
> >
> id=3Ddisk0,file=3D/home/mgadelha/tools/poky/build/tmp/deploy/images/qemur=
iscv32/core-image-full-cmdline-qemuriscv32-20230415202008.rootfs.ext4,if=3D=
none,format=3Draw
> -device virtio-net-device,netdev=3Dusernet -netdev
> user,id=3Dusernet,hostfwd=3Dtcp::22222-:22 -device
> virtio-blk-device,drive=3Ddisk0 -object
> rng-random,filename=3D/dev/urandom,id=3Drng0 -device virtio-rng-pci,rng=
=3Drng0
> -device virtio-tablet-pci -device virtio-keyboard-pci
> >
> > Well, it actually doesn't start if I use -m 4G, but any value lower tha=
n
> > that is fine.
> >
> > Here's also the boot log: https://pastebin.com/b7ZEP659
> > <https://pastebin.com/b7ZEP659>
> >
> > I see that the kernel prints:
> >
> > [    0.000000] Memory limited to 1024MB
> >
> > so maybe it's a kernel limitation rather than qemu?
> >
> > --
> >
> > Mikhail Ramalho.
>
>

--=20

Mikhail Ramalho.

--000000000000d6fa1d05f99a5de0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yeah, I mentioned in the email it doesn&#39;t even start w=
ith mem=3D4G...=C2=A0<div><br></div><div>With lower values, e.g., mem=3D3G,=
 the image starts but I&#39;m limited to 988MB of RAM.</div><div><br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
Em ter., 18 de abr. de 2023 =C3=A0s 04:42, Thomas Huth &lt;<a href=3D"mailt=
o:thuth@redhat.com">thuth@redhat.com</a>&gt; escreveu:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On 17/04/2023 19.21, Mikhail R. Gade=
lha wrote:<br>
&gt; Hi qemu folks,<br>
&gt; <br>
&gt; I&#39;m using yocto to generate a riscv32 image but qemu seems to be i=
gnoring <br>
&gt; the -m argument from the command line and forcing the image to run wit=
h <br>
&gt; 988MB of RAM.<br>
&gt; <br>
&gt; Is there any way I can increase it to 4G?<br>
&gt; <br>
&gt; I&#39;m using the following cmdline to start qemu:<br>
&gt; <br>
&gt; qemu-system-riscv32 -nographic -machine virt -m 4G -smp 8 -bios <br>
&gt; /home/mgadelha/tools/poky/build/tmp/deploy/images/qemuriscv32/fw_jump.=
elf <br>
&gt; -kernel /home/mgadelha/tools/poky/build/tmp/deploy/images/qemuriscv32/=
Image <br>
&gt; -append &quot;root=3D/dev/vda rw mem=3D4G&quot; -drive <br>
<br>
That &quot;mem=3D4G&quot; part of the -append option looks suspicious ... h=
ave you <br>
already tried to boot without that, or to decrease it to a number that fits=
 <br>
into 32-bit, e.g. &quot;mem=3D3G&quot; ?<br>
<br>
=C2=A0 HTH,<br>
=C2=A0 =C2=A0Thomas<br>
<br>
&gt; id=3Ddisk0,file=3D/home/mgadelha/tools/poky/build/tmp/deploy/images/qe=
muriscv32/core-image-full-cmdline-qemuriscv32-20230415202008.rootfs.ext4,if=
=3Dnone,format=3Draw -device virtio-net-device,netdev=3Dusernet -netdev use=
r,id=3Dusernet,hostfwd=3Dtcp::22222-:22 -device virtio-blk-device,drive=3Dd=
isk0 -object rng-random,filename=3D/dev/urandom,id=3Drng0 -device virtio-rn=
g-pci,rng=3Drng0 -device virtio-tablet-pci -device virtio-keyboard-pci<br>
&gt; <br>
&gt; Well, it actually doesn&#39;t start if I use -m 4G, but any value lowe=
r than <br>
&gt; that is fine.<br>
&gt; <br>
&gt; Here&#39;s also the boot log: <a href=3D"https://pastebin.com/b7ZEP659=
" rel=3D"noreferrer" target=3D"_blank">https://pastebin.com/b7ZEP659</a> <b=
r>
&gt; &lt;<a href=3D"https://pastebin.com/b7ZEP659" rel=3D"noreferrer" targe=
t=3D"_blank">https://pastebin.com/b7ZEP659</a>&gt;<br>
&gt; <br>
&gt; I see that the kernel prints:<br>
&gt; <br>
&gt; [ =C2=A0 =C2=A00.000000] Memory limited to 1024MB<br>
&gt; <br>
&gt; so maybe it&#39;s a kernel limitation rather than qemu?<br>
&gt; <br>
&gt; -- <br>
&gt; <br>
&gt; Mikhail Ramalho.<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div><br></div><div>Mikhail Ramalho.</div></div></div>

--000000000000d6fa1d05f99a5de0--

