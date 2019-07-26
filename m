Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hr3mD-0001gG-AN
	for mharc-qemu-riscv@gnu.org; Fri, 26 Jul 2019 13:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34569)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chihmin.chao@sifive.com>) id 1hr3m9-0001fn-R3
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 13:13:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1hr3m7-0006u7-Qx
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 13:13:01 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:45368)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1hr3m7-0006qS-HJ
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2019 13:12:59 -0400
Received: by mail-io1-xd34.google.com with SMTP id g20so106250140ioc.12
 for <qemu-riscv@nongnu.org>; Fri, 26 Jul 2019 10:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bqM3mkPEES4v1h+Nq3Fu1VTCum+0IA+veBCNr8iZyuo=;
 b=at5xVy5DSEvlipZwFGefUvLfe9I3mtUzD3ZTqAE8RtND9wDKceRMutl8gtkXYbSEEq
 8kir75w/jC0kXMGpaeiazepiAcW5/KTWo96Zk0vLBkcZ/LlVLpa5hs33+sJTUw2ZbFzN
 Kl1wSQiUU5PixB2+I+lGloXl59ONbfDuPx0PIvedb0lcDliRicKlRvwAM0y8NKnwEfnd
 840QZtFkvHv2NNJZs9wPROU9McQ+fPMQG6Raw2/FS6u50XeHhRF+wLgnopci9uMiwNwH
 zWX9zpP9jtLBe5xpJFvlt9MrzNwsx2pKgJRYFz8T2jXjAZya20lqCw+S0HvYfZa5wp2A
 rZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bqM3mkPEES4v1h+Nq3Fu1VTCum+0IA+veBCNr8iZyuo=;
 b=QQckYvgudSeAic5COyI+aWrgOtyr8cB1+eDM3Ga2YLMoGnPsKqNxYDhapNZ81i0Knt
 tB2EyxNKqN495Z6qWp45oxGhjCsPqhAIXyN5EBXw6Au2ZM+ZcWfvPDMuUCyoEEMJBD4d
 AdnQPyEG8FPHm1syuYM4n+8OolgeVBqf4/MkiEIPJL1JSWR+J9ay7nJy8x3DOGDzBqac
 BFdoU8Gx+vZwon+hEAbVqgK1JvL83suODrxrlOFeQ4fl192zwWjgRgxCsV+EHU0KVfZP
 imQq/jnPi9zJxnhpZmHVvslm9t+2Kgoa0C56YFbV66fTKdITeMr2pw7Gq/rprujQJM7Y
 JhUw==
X-Gm-Message-State: APjAAAXPoEdWULI1F+X7RZLPr3VVTR5W5IizpME+5/UNpyPiC0/sP2OR
 xsgMY/pi7EUgSVXu9hfxXXDKWaA1LCYnfwoFSgdpgg==
X-Google-Smtp-Source: APXvYqwLu5EZ2L6hevycate7iRLMMT7DSU0DYcIQVwarBZ6KAG/RVG1K62QVCQzRZx1udJQJANtL9A66/hi94uYJTso=
X-Received: by 2002:a02:a703:: with SMTP id k3mr30197480jam.12.1564161177889; 
 Fri, 26 Jul 2019 10:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <1563950742-22592-1-git-send-email-chihmin.chao@sifive.com>
 <CAKmqyKM2-60bn1v+bNsX6H+jZ-gTrsUwqah9yPtAn9VhZ2d1jw@mail.gmail.com>
In-Reply-To: <CAKmqyKM2-60bn1v+bNsX6H+jZ-gTrsUwqah9yPtAn9VhZ2d1jw@mail.gmail.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Sat, 27 Jul 2019 01:12:47 +0800
Message-ID: <CAEiOBXXqF4qkOsQX=wdt92ice5UUZGsubVEc-5qryLdFSesUjg@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000006149eb058e98a73c"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d34
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v3] tests/boot_linux_console:
 add a test for riscv64 + virt
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
X-List-Received-Date: Fri, 26 Jul 2019 17:13:04 -0000

--0000000000006149eb058e98a73c
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 25, 2019 at 8:12 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Tue, Jul 23, 2019 at 11:46 PM Chih-Min Chao <chihmin.chao@sifive.com>
> wrote:
> >
> > Similar to the mips + malta test, it boots a Linux kernel on a virt
> > board and verify the serial is working.  Also, it relies on the serial
> > device set by the machine itself.
> >
> > If riscv64 is a target being built, "make check-acceptance" will
> > automatically include this test by the use of the "arch:riscv64" tags.
> >
> > Alternatively, this test can be run using:
> >
> >   $ avocado run -t arch:riscv64 tests/acceptance
> >
> > packages
> >   debian official
> >     binutils-riscv64-linux-gnu_2.32-8
> >     opensbi_0.4-1_all
> >     linux-image-5.0.0-trunk-riscv64 5.0.2-1~exp1
> >   third-party
> >
> https://github.com/groeck/linux-build-test/rootfs/riscv64/rootfs.cpio.gz
> >     (the repo is also used in mips target acceptance)
> >
> > Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
> > ---
> >  .travis.yml                            |  2 +-
> >  tests/acceptance/boot_linux_console.py | 67
> ++++++++++++++++++++++++++++++++++
> >  2 files changed, 68 insertions(+), 1 deletion(-)
> >
> > diff --git a/.travis.yml b/.travis.yml
> > index caf0a1f..7ba9952 100644
> > --- a/.travis.yml
> > +++ b/.travis.yml
> > @@ -232,7 +232,7 @@ matrix:
> >
> >      # Acceptance (Functional) tests
> >      - env:
> > -        - CONFIG="--python=/usr/bin/python3
> --target-list=x86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-softmmu,arm-softmmu,s390x-softmmu,alpha-softmmu"
> > +        - CONFIG="--python=/usr/bin/python3
> --target-list=x86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-softmmu,arm-softmmu,s390x-softmmu,alpha-softmmu,riscv64-softmmu"
> >          - TEST_CMD="make check-acceptance"
> >        after_failure:
> >          - cat tests/results/latest/job.log
> > diff --git a/tests/acceptance/boot_linux_console.py
> b/tests/acceptance/boot_linux_console.py
> > index 3215950..b0569b9 100644
> > --- a/tests/acceptance/boot_linux_console.py
> > +++ b/tests/acceptance/boot_linux_console.py
> > @@ -354,3 +354,70 @@ class BootLinuxConsole(Test):
> >          self.vm.launch()
> >          console_pattern = 'Kernel command line: %s' %
> kernel_command_line
> >          self.wait_for_console_pattern(console_pattern)
> > +
> > +    def test_riscv64_virt(self):
> > +        """
> > +        :avocado: tags=arch:riscv64
> > +        :avocado: tags=machine:virt
> > +        """
> > +        deb_url = ('https://snapshot.debian.org/archive/debian/'
> > +                         '20190424T171759Z/pool/main/b/binutils/'
> > +                         'binutils-riscv64-linux-gnu_2.32-8_amd64.deb')
> > +        deb_hash = ('7fe376fd4452696c03acd508d6d613ca553ea15e')
> > +        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
> > +        objcopy_path = '/usr/bin/riscv64-linux-gnu-objcopy'
> > +        objcopy_path = self.extract_from_deb(deb_path, objcopy_path)
> > +        libbfd_path = '/usr/lib/x86_64-linux-gnu/libbfd-2.32-riscv64.so
> '
> > +        libbfd_path = self.extract_from_deb(deb_path, libbfd_path)
> > +        process.run('ls -al %s' % (objcopy_path))
>
> Why do we need objcopy? Won't this not work on non x86 architectures?
>
> > +
> > +        deb_url = ('https://snapshot.debian.org/archive/debian/'
> > +                   '20190708T032337Z/pool/main/o/opensbi/'
> > +                   'opensbi_0.4-1_all.deb')
> > +        deb_hash = ('2319dcd702958291d323acf5649fd98a11d90112')
> > +        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
> > +        opensbi_path = ('/usr/lib/riscv64-linux-gnu/opensbi/'
> > +                        'qemu/virt/fw_jump.elf')
> > +        opensbi_path = self.extract_from_deb(deb_path, opensbi_path)
> > +
> > +        deb_url = ('https://snapshot.debian.org/archive/debian-ports/'
> > +                   '20190319T205124Z/pool-riscv64/main/l/linux/'
> > +
>  'linux-image-5.0.0-trunk-riscv64_5.0.2-1~exp1_riscv64.deb')
> > +        deb_hash = ('90155ed4b36673cbf7746a37cf3159c8f0b2857a')
> > +        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
> > +        kernel_path = '/boot/vmlinux-5.0.0-trunk-riscv64'
>
> I thought we were swapping to using an Image file?
>
> Alistair
>
>
  For objcopy,
         Philippe had the same question in PATCH v2 thread.  Debian
linux-kernel package only has vmlinux and riscv vmlinux  ELF header doesn't
contain the correct physical loading address 0x8020_0000.
          What I think is to extract the Image from vmlinux by objcopy.
This is what kernel do when generating  arch/riscv/boot/Image.

  For swapping to using an image file,
         I think what you talk about is we have included opensbi.bin into
qemu master ?
         The reason is the test use -initrd and -append to pass rootfs and
kernel command line option and the two options requires using of -kernel
option.
         But -kernel option can't load the opensbi.bin to expected address.

chihmin


> > +        kernel_path = self.extract_from_deb(deb_path, kernel_path)
> > +        kimage_path = self.workdir + "/Image"
> > +        env = os.environ
> > +        env['LD_LIBRARY_PATH'] = ('%s:' %
> (os.path.dirname(libbfd_path)) +
> > +                                 env.get('LD_LIBRARY_PATH', ''))
> > +        process.run(('%s -O binary -O binary -R'
> > +                     '.note -R .note.gnu.build-id -R .comment -S %s
> %s') %
> > +                     (objcopy_path, kernel_path, kimage_path))
> > +
> > +        initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
> > +                      '8584a59ed9e5eb5ee7ca91f6d74bbb06619205b8/rootfs/'
> > +                      'riscv64/rootfs.cpio.gz')
> > +        initrd_hash = 'f4867d263754961b6f626cdcdc0cb334c47e3b49'
> > +        initrd_path = self.fetch_asset(initrd_url,
> asset_hash=initrd_hash)
> > +
> > +        self.vm.set_machine('virt')
> > +        self.vm.set_console()
> > +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE
> > +                               + 'console=ttyS0 noreboot')
> > +        self.vm.add_args('-bios', "none",
> > +                '-kernel', opensbi_path,
> > +                '-device', 'loader,file=%s,addr=0x80200000' %
> (kimage_path),
> > +                '-initrd', initrd_path,
> > +                '-append', kernel_command_line,
> > +                '-no-reboot')
> > +
> > +        self.vm.launch()
> > +        self.wait_for_console_pattern('Boot successful.')
> > +
> > +        self.exec_command_and_wait_for_pattern('cat /proc/cpuinfo',
> > +                                               'isa')
> > +        self.exec_command_and_wait_for_pattern('uname -a',
> > +                                               'SMP Debian')
> > +        self.exec_command_and_wait_for_pattern('reboot',
> > +                                               'reboot: Restarting
> system')
> > --
> > 2.7.4
> >
> >
>

--0000000000006149eb058e98a73c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 25, 2019 at 8:12 AM Alist=
air Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Tue, Jul 23, 2019 at 11:46 PM Chih-Min Chao &lt;<a href=3D"mailto:chihm=
in.chao@sifive.com" target=3D"_blank">chihmin.chao@sifive.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt; Similar to the mips + malta test, it boots a Linux kernel on a virt<br=
>
&gt; board and verify the serial is working.=C2=A0 Also, it relies on the s=
erial<br>
&gt; device set by the machine itself.<br>
&gt;<br>
&gt; If riscv64 is a target being built, &quot;make check-acceptance&quot; =
will<br>
&gt; automatically include this test by the use of the &quot;arch:riscv64&q=
uot; tags.<br>
&gt;<br>
&gt; Alternatively, this test can be run using:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0$ avocado run -t arch:riscv64 tests/acceptance<br>
&gt;<br>
&gt; packages<br>
&gt;=C2=A0 =C2=A0debian official<br>
&gt;=C2=A0 =C2=A0 =C2=A0binutils-riscv64-linux-gnu_2.32-8<br>
&gt;=C2=A0 =C2=A0 =C2=A0opensbi_0.4-1_all<br>
&gt;=C2=A0 =C2=A0 =C2=A0linux-image-5.0.0-trunk-riscv64 5.0.2-1~exp1<br>
&gt;=C2=A0 =C2=A0third-party<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/groeck/linux-build-te=
st/rootfs/riscv64/rootfs.cpio.gz" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/groeck/linux-build-test/rootfs/riscv64/rootfs.cpio.gz</a><br=
>
&gt;=C2=A0 =C2=A0 =C2=A0(the repo is also used in mips target acceptance)<b=
r>
&gt;<br>
&gt; Signed-off-by: Chih-Min Chao &lt;<a href=3D"mailto:chihmin.chao@sifive=
.com" target=3D"_blank">chihmin.chao@sifive.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .travis.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 tests/acceptance/boot_linux_console.py | 67 ++++++++++++++++++++=
++++++++++++++<br>
&gt;=C2=A0 2 files changed, 68 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/.travis.yml b/.travis.yml<br>
&gt; index caf0a1f..7ba9952 100644<br>
&gt; --- a/.travis.yml<br>
&gt; +++ b/.travis.yml<br>
&gt; @@ -232,7 +232,7 @@ matrix:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Acceptance (Functional) tests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - env:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 - CONFIG=3D&quot;--python=3D/usr/bin/pyth=
on3 --target-list=3Dx86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-so=
ftmmu,arm-softmmu,s390x-softmmu,alpha-softmmu&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 - CONFIG=3D&quot;--python=3D/usr/bin/pyth=
on3 --target-list=3Dx86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-so=
ftmmu,arm-softmmu,s390x-softmmu,alpha-softmmu,riscv64-softmmu&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - TEST_CMD=3D&quot;make check-accept=
ance&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 after_failure:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - cat tests/results/latest/job.log<b=
r>
&gt; diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance=
/boot_linux_console.py<br>
&gt; index 3215950..b0569b9 100644<br>
&gt; --- a/tests/acceptance/boot_linux_console.py<br>
&gt; +++ b/tests/acceptance/boot_linux_console.py<br>
&gt; @@ -354,3 +354,70 @@ class BootLinuxConsole(Test):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.launch()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 console_pattern =3D &#39;Kernel comm=
and line: %s&#39; % kernel_command_line<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.wait_for_console_pattern(consol=
e_pattern)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def test_riscv64_virt(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Darch:riscv64<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Dmachine:virt<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_url =3D (&#39;<a href=3D"https://snap=
shot.debian.org/archive/debian/" rel=3D"noreferrer" target=3D"_blank">https=
://snapshot.debian.org/archive/debian/</a>&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&#39;20190424T171759Z/pool/main/b/binutils/&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&#39;binutils-riscv64-linux-gnu_2.32-8_amd64.deb&#39;)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_hash =3D (&#39;7fe376fd4452696c03acd5=
08d6d613ca553ea15e&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_path =3D self.fetch_asset(deb_url, as=
set_hash=3Ddeb_hash)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 objcopy_path =3D &#39;/usr/bin/riscv64-li=
nux-gnu-objcopy&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 objcopy_path =3D self.extract_from_deb(de=
b_path, objcopy_path)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 libbfd_path =3D &#39;/usr/lib/x86_64-linu=
x-gnu/<a href=3D"http://libbfd-2.32-riscv64.so" rel=3D"noreferrer" target=
=3D"_blank">libbfd-2.32-riscv64.so</a>&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 libbfd_path =3D self.extract_from_deb(deb=
_path, libbfd_path)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 process.run(&#39;ls -al %s&#39; % (objcop=
y_path))<br>
<br>
Why do we need objcopy? Won&#39;t this not work on non x86 architectures?<b=
r>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_url =3D (&#39;<a href=3D"https://snap=
shot.debian.org/archive/debian/" rel=3D"noreferrer" target=3D"_blank">https=
://snapshot.debian.org/archive/debian/</a>&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;20190708T032337Z/pool/main/o/opensbi/&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;opensbi_0.4-1_all.deb&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_hash =3D (&#39;2319dcd702958291d323ac=
f5649fd98a11d90112&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_path =3D self.fetch_asset(deb_url, as=
set_hash=3Ddeb_hash)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 opensbi_path =3D (&#39;/usr/lib/riscv64-l=
inux-gnu/opensbi/&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &#39;qemu/virt/fw_jump.elf&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 opensbi_path =3D self.extract_from_deb(de=
b_path, opensbi_path)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_url =3D (&#39;<a href=3D"https://snap=
shot.debian.org/archive/debian-ports/" rel=3D"noreferrer" target=3D"_blank"=
>https://snapshot.debian.org/archive/debian-ports/</a>&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;20190319T205124Z/pool-riscv64/main/l/linux/&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;linux-image-5.0.0-trunk-riscv64_5.0.2-1~exp1_riscv64.deb&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_hash =3D (&#39;90155ed4b36673cbf7746a=
37cf3159c8f0b2857a&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_path =3D self.fetch_asset(deb_url, as=
set_hash=3Ddeb_hash)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_path =3D &#39;/boot/vmlinux-5.0.0-=
trunk-riscv64&#39;<br>
<br>
I thought we were swapping to using an Image file?<br>
<br>
Alistair<br>
<br></blockquote><div><br></div><div>=C2=A0 <font color=3D"#000000">For obj=
copy,</font></div><div><font color=3D"#000000">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<span style=3D"font-family:Roboto,RobotoDraft,Helvetica,Arial,sans-se=
rif;font-size:12px;letter-spacing:0.3px;white-space:nowrap">Philippe had th=
e same question in PATCH v2 thread.=C2=A0 Debian linux-kernel package only =
has vmlinux and riscv vmlinux=C2=A0 ELF header doesn&#39;t contain the corr=
ect physical loading address 0x8020_0000.</span></font></div><div><span sty=
le=3D"font-family:Roboto,RobotoDraft,Helvetica,Arial,sans-serif;font-size:1=
2px;letter-spacing:0.3px;white-space:nowrap"><font color=3D"#000000">=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 What I think is to extract the Image from vmli=
nux by objcopy.=C2=A0 This is what kernel do when generating=C2=A0 arch/ris=
cv/boot/Image.</font></span></div><div><span style=3D"font-family:Roboto,Ro=
botoDraft,Helvetica,Arial,sans-serif;font-size:12px;letter-spacing:0.3px;wh=
ite-space:nowrap"><font color=3D"#000000"><br></font></span></div><div><spa=
n style=3D"font-family:Roboto,RobotoDraft,Helvetica,Arial,sans-serif;font-s=
ize:12px;letter-spacing:0.3px;white-space:nowrap"><font color=3D"#000000">=
=C2=A0 For swapping to using an image file,</font></span></div><div><span s=
tyle=3D"font-family:Roboto,RobotoDraft,Helvetica,Arial,sans-serif;font-size=
:12px;letter-spacing:0.3px;white-space:nowrap"><font color=3D"#000000">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I think what you talk about is we have inclu=
ded opensbi.bin into qemu master ?=C2=A0</font></span></div><div><span styl=
e=3D"font-family:Roboto,RobotoDraft,Helvetica,Arial,sans-serif;font-size:12=
px;letter-spacing:0.3px;white-space:nowrap"><font color=3D"#000000">=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0The reason is the test use -initrd and -append t=
o pass rootfs and kernel command line option and the two options requires u=
sing of -kernel option.</font></span></div><div><span style=3D"font-family:=
Roboto,RobotoDraft,Helvetica,Arial,sans-serif;font-size:12px;letter-spacing=
:0.3px;white-space:nowrap"><font color=3D"#000000">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0But -kernel option can&#39;t load the opensbi.bin to expected add=
ress.</font></span></div><div><span style=3D"font-family:Roboto,RobotoDraft=
,Helvetica,Arial,sans-serif;font-size:12px;letter-spacing:0.3px;white-space=
:nowrap"><font color=3D"#000000"><br></font></span></div><div><span style=
=3D"font-family:Roboto,RobotoDraft,Helvetica,Arial,sans-serif;font-size:12p=
x;letter-spacing:0.3px;white-space:nowrap"><font color=3D"#000000">chihmin<=
/font></span></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_path =3D self.extract_from_deb(deb=
_path, kernel_path)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kimage_path =3D self.workdir + &quot;/Ima=
ge&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env =3D os.environ<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env[&#39;LD_LIBRARY_PATH&#39;] =3D (&#39;=
%s:&#39; % (os.path.dirname(libbfd_path)) +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env.get(&#39;LD_LIBRARY_PA=
TH&#39;, &#39;&#39;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 process.run((&#39;%s -O binary -O binary =
-R&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&#39;.note -R .note.gnu.build-id -R .comment -S %s %s&#39;) %<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0(objcopy_path, kernel_path, kimage_path))<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_url =3D (&#39;<a href=3D"https://g=
ithub.com/groeck/linux-build-test/raw/" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/groeck/linux-build-test/raw/</a>&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &#39;8584a59ed9e5eb5ee7ca91f6d74bbb06619205b8/rootfs/&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &#39;riscv64/rootfs.cpio.gz&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_hash =3D &#39;f4867d263754961b6f62=
6cdcdc0cb334c47e3b49&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_path =3D self.fetch_asset(initrd_u=
rl, asset_hash=3Dinitrd_hash)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.set_machine(&#39;virt&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.set_console()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_command_line =3D (self.KERNEL_COMM=
ON_COMMAND_LINE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ &#39;console=3DttyS0 noreboot&#=
39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-bios&#39;, &quot;n=
one&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-kernel&=
#39;, opensbi_path,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-device&=
#39;, &#39;loader,file=3D%s,addr=3D0x80200000&#39; % (kimage_path),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-initrd&=
#39;, initrd_path,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-append&=
#39;, kernel_command_line,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-no-rebo=
ot&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.launch()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.wait_for_console_pattern(&#39;Boot s=
uccessful.&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.exec_command_and_wait_for_pattern(&#=
39;cat /proc/cpuinfo&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&#39;isa&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.exec_command_and_wait_for_pattern(&#=
39;uname -a&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&#39;SMP Debian&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.exec_command_and_wait_for_pattern(&#=
39;reboot&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&#39;reboot: Restarting system&#39;)<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--0000000000006149eb058e98a73c--

