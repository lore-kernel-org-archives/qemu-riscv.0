Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hmys0-00083M-Nm
	for mharc-qemu-riscv@gnu.org; Mon, 15 Jul 2019 07:10:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45952)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chihmin.chao@sifive.com>) id 1hmyrw-00082i-9z
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2019 07:10:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1hmyru-0007ld-9f
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2019 07:10:08 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34763)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1hmyrt-0007kI-Q1
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2019 07:10:06 -0400
Received: by mail-wr1-x434.google.com with SMTP id 31so16659216wrm.1
 for <qemu-riscv@nongnu.org>; Mon, 15 Jul 2019 04:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1CufUaU31s52ZAtkFPjqx0Vx314VzSAm9wMoCf3YXCQ=;
 b=exghL4HVEg+QwLra6S8fvaTu9Ylk2+s7XzfXnEGqS/Mf/Mn88pVh5tXSXRUFDSh8q0
 te9LeEJ/ceR1wvG0ghiVEeRUpum1uvVK5CzZW+NsGzBeCUsQxiqC+bOuTijd832DxZH+
 R61tZPeOvB0+DT9vZL3slBjVRkUbeLQX+bOOqEJbw8fAEB4mV8l1E+6+j2XVf8vd9Exp
 B6yDQUwaDyAQVnhEOeoGd55hoYmaIefN7Msj3rZgN7PmiV+QLXkzCnDRsKu5S/rSZuAA
 SBUD6pu6QW/rHofHu96pdTbLTOW/jGbIhz74F2fZDtP1lS6gmYbz6NpNBXaQyLPzcEZs
 nwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1CufUaU31s52ZAtkFPjqx0Vx314VzSAm9wMoCf3YXCQ=;
 b=K+ke5CKJr0b++UKZFmNRC4gqKhQS1xPLS9gspYp1EsprzGepdbiHw7Y9f11XDo9e9Z
 01NHGOab4ccnm7oGDCFlTAdI3ihZV/uX6lwjeR6YiEFXwKM1q0RnfrCf0NtgEXfgxZY1
 aB0p1US8UBVA1e/R+5m5wShg7IHqH/YrAE+HQISYsrEvE3vRr1lX+tjsu+tnKR9WKa80
 RuTCIS61W7kpVLrdZaB/PRHttlMU9znUONVfjCgMrGnHiMJTLH++uoGSGFzvf6Wq7LGx
 wVPPpY/g9hLkt3C2FTxIa4b+4HHep3RW6Z5HPOnpRi+WtbxvSQ9afsmq5iZ1Gp93xLB1
 MATw==
X-Gm-Message-State: APjAAAV/MGgnUeLdrtXBgauWl8z5DYgsvL/Ij0Du+zeC8L81CsqiUR4I
 bIl250TzimUmoa5sJxQLS3/5TW/11E+Ui6CdTpjLyQ==
X-Google-Smtp-Source: APXvYqzMHfnj1bkeYuPHAdevOfotjEck8kUY1SWgMNaUnG22Lpa6fqkV6Y/BRsI28cdOMrIrnCtodI6kgTniBXXMnJo=
X-Received: by 2002:adf:ecd0:: with SMTP id s16mr28401083wro.324.1563189003411; 
 Mon, 15 Jul 2019 04:10:03 -0700 (PDT)
MIME-Version: 1.0
References: <1563181721-5055-1-git-send-email-chihmin.chao@sifive.com>
 <93b35a5e-c40a-535b-2a91-2c210b4a5928@redhat.com>
In-Reply-To: <93b35a5e-c40a-535b-2a91-2c210b4a5928@redhat.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Mon, 15 Jul 2019 19:09:52 +0800
Message-ID: <CAEiOBXXxS-93rTAQuvY_Tkxi1pYc1YfJenpBC_8gG2ou9uUZMg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000440f20058db64dcb"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::434
Subject: Re: [Qemu-riscv] [PATCH v2] tests/boot_linux_console: add a test
 for riscv64 + virt
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
X-List-Received-Date: Mon, 15 Jul 2019 11:10:11 -0000

--000000000000440f20058db64dcb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2019 at 5:15 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
wrote:

> On 7/15/19 11:08 AM, Chih-Min Chao wrote:
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
> >     linux-image-4.19.0-5-riscv64 4.19.37-4
> >   third-party
> >
> https://github.com/groeck/linux-build-test/rootfs/riscv64/rootfs.cpio.gz
> >     (the repo is also used in mips target acceptance)
> >
> > Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
> > ---
> >  .travis.yml                            |  2 +-
> >  tests/acceptance/boot_linux_console.py | 66
> ++++++++++++++++++++++++++++++++++
> >  2 files changed, 67 insertions(+), 1 deletion(-)
> >
> > diff --git a/.travis.yml b/.travis.yml
> > index 5d3d6ee..21fcead 100644
> > --- a/.travis.yml
> > +++ b/.travis.yml
> > @@ -232,7 +232,7 @@ matrix:
> >
> >      # Acceptance (Functional) tests
> >      - env:
> > -        - CONFIG=3D"--python=3D/usr/bin/python3
> --target-list=3Dx86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-soft=
mmu,arm-softmmu,s390x-softmmu,alpha-softmmu"
> > +        - CONFIG=3D"--python=3D/usr/bin/python3
> --target-list=3Dx86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-soft=
mmu,arm-softmmu,s390x-softmmu,alpha-softmmu,riscv64-softmmu"
> >          - TEST_CMD=3D"make check-acceptance"
> >        after_failure:
> >          - cat tests/results/latest/job.log
> > diff --git a/tests/acceptance/boot_linux_console.py
> b/tests/acceptance/boot_linux_console.py
> > index 3215950..0f638bc 100644
> > --- a/tests/acceptance/boot_linux_console.py
> > +++ b/tests/acceptance/boot_linux_console.py
> > @@ -354,3 +354,69 @@ class BootLinuxConsole(Test):
> >          self.vm.launch()
> >          console_pattern =3D 'Kernel command line: %s' %
> kernel_command_line
> >          self.wait_for_console_pattern(console_pattern)
> > +
> > +    def test_riscv64_virt(self):
> > +        """
> > +        :avocado: tags=3Darch:riscv64
> > +        :avocado: tags=3Dmachine:virt
> > +        """
> > +        deb_url =3D ('https://snapshot.debian.org/archive/debian/'
> > +                         '20190424T171759Z/pool/main/b/binutils/'
> > +                         'binutils-riscv64-linux-gnu_2.32-8_amd64.deb'=
)
> > +        deb_hash =3D ('7fe376fd4452696c03acd508d6d613ca553ea15e')
> > +        deb_path =3D self.fetch_asset(deb_url, asset_hash=3Ddeb_hash)
> > +        objcopy_path =3D '/usr/bin/riscv64-linux-gnu-objcopy'
> > +        objcopy_path =3D self.extract_from_deb(deb_path, objcopy_path)
> > +        libbfd_path =3D '/usr/lib/x86_64-linux-gnu/libbfd-2.32-riscv64=
.so
> '
> > +        libbfd_path =3D self.extract_from_deb(deb_path, libbfd_path)
> > +        process.run('ls -al %s' % (objcopy_path))
> > +
> > +        deb_url =3D ('https://snapshot.debian.org/archive/debian/'
> > +                   '20190708T032337Z/pool/main/o/opensbi/'
> > +                   'opensbi_0.4-1_all.deb')
> > +        deb_hash =3D ('2319dcd702958291d323acf5649fd98a11d90112')
> > +        deb_path =3D self.fetch_asset(deb_url, asset_hash=3Ddeb_hash)
> > +        opensbi_path =3D ('/usr/lib/riscv64-linux-gnu/opensbi/'
> > +                        'qemu/virt/fw_jump.elf')
> > +        opensbi_path =3D self.extract_from_deb(deb_path, opensbi_path)
> > +
> > +        deb_url =3D ('https://snapshot.debian.org/archive/debian-ports=
/'
> > +                   '20190620T095935Z/pool-riscv64/main/l/linux/'
> > +                   'linux-image-4.19.0-5-riscv64_4.19.37-4_riscv64.deb=
')
> > +        deb_hash =3D ('bf5b5680c41d92134d22caef4fbd277c5217e1f0')
> > +        deb_path =3D self.fetch_asset(deb_url, asset_hash=3Ddeb_hash)
> > +        kernel_path =3D '/boot/vmlinux-4.19.0-5-riscv64'
> > +        kernel_path =3D self.extract_from_deb(deb_path, kernel_path)
> > +        kimage_path =3D self.workdir + "/Image"
> > +        env =3D os.environ
> > +        env['LD_LIBRARY_PATH'] =3D ('%s:' %
> (os.path.dirname(libbfd_path)) +
> > +                                 env.get('LD_LIBRARY_PATH', ''))
> > +        process.run(('%s -O binary -O binary -R'
> > +                     '.note -R .note.gnu.build-id -R .comment -S %s
> %s') %
> > +                     (objcopy_path, kernel_path, kimage_path))
>
> Please explain why you need to do that...
>
> Also note these tests are run on other host architecture than x86, at
> least ppc64/s390x (so this won't work there).
>
> it is because riscv64 vmlinux doesn't have physical loading address
information and
depends on certain stage bootloader to move kernel raw data to specific
physical address (0x8020_0000)

The vmlinux program headers are
  Type             Offset       VirtAddr                  PhysAddr
  FileSiz  MemSiz   Flg Align
  LOAD           0x001000 0xffffffe000000000 0x0000000000000000 0x0303a6
0x0303a6 R E 0x1000
  LOAD           0x032000 0xffffffe000031000 0x0000000000031000 0x828f0c
0x828f0c RWE 0x1000
  NOTE           0x85aec0 0xffffffe000859ec0 0x0000000000859ec0 0x00004c
0x00004c R   0x4

For legacy bootloader, bbl, It can handle payload in ELF format.  However,
for the newer OpenSBI, it can only handle raw data and
debian doesn't provide linux image in raw data format.



> > +
> > +        initrd_url =3D ('https://github.com/groeck/linux-build-test/ra=
w/'
> > +                      '8584a59ed9e5eb5ee7ca91f6d74bbb06619205b8/rootfs=
/'
> > +                      'riscv64/rootfs.cpio.gz')
> > +        initrd_hash =3D 'f4867d263754961b6f626cdcdc0cb334c47e3b49'
> > +        initrd_path =3D self.fetch_asset(initrd_url,
> asset_hash=3Dinitrd_hash)
> > +
> > +        self.vm.set_machine('virt')
> > +        self.vm.set_console()
> > +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE
> > +                               + 'console=3DttyS0 noreboot')
> > +        self.vm.add_args('-bios', opensbi_path,
> > +                         '-kernel', kimage_path,
> > +                         '-initrd', initrd_path,
> > +                         '-append', kernel_command_line,
> > +                         '-no-reboot')
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
> >
>

--000000000000440f20058db64dcb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 15, 2019 at 5:15 PM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On 7/15/19 11:08 AM, Chih-Min Chao wrote:<br>
&gt; Similar to the mips + malta test, it boots a Linux kernel on a virt<br=
>
&gt; board and verify the serial is working.=C2=A0 Also, it relies on the s=
erial<br>
&gt; device set by the machine itself.<br>
&gt; <br>
&gt; If riscv64 is a target being built, &quot;make check-acceptance&quot; =
will<br>
&gt; automatically include this test by the use of the &quot;arch:riscv64&q=
uot; tags.<br>
&gt; <br>
&gt; Alternatively, this test can be run using:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0$ avocado run -t arch:riscv64 tests/acceptance<br>
&gt; <br>
&gt; packages<br>
&gt;=C2=A0 =C2=A0debian official<br>
&gt;=C2=A0 =C2=A0 =C2=A0binutils-riscv64-linux-gnu_2.32-8<br>
&gt;=C2=A0 =C2=A0 =C2=A0opensbi_0.4-1_all<br>
&gt;=C2=A0 =C2=A0 =C2=A0linux-image-4.19.0-5-riscv64 4.19.37-4<br>
&gt;=C2=A0 =C2=A0third-party<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/groeck/linux-build-te=
st/rootfs/riscv64/rootfs.cpio.gz" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/groeck/linux-build-test/rootfs/riscv64/rootfs.cpio.gz</a><br=
>
&gt;=C2=A0 =C2=A0 =C2=A0(the repo is also used in mips target acceptance)<b=
r>
&gt; <br>
&gt; Signed-off-by: Chih-Min Chao &lt;<a href=3D"mailto:chihmin.chao@sifive=
.com" target=3D"_blank">chihmin.chao@sifive.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .travis.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 tests/acceptance/boot_linux_console.py | 66 ++++++++++++++++++++=
++++++++++++++<br>
&gt;=C2=A0 2 files changed, 67 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/.travis.yml b/.travis.yml<br>
&gt; index 5d3d6ee..21fcead 100644<br>
&gt; --- a/.travis.yml<br>
&gt; +++ b/.travis.yml<br>
&gt; @@ -232,7 +232,7 @@ matrix:<br>
&gt;=C2=A0 <br>
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
&gt; index 3215950..0f638bc 100644<br>
&gt; --- a/tests/acceptance/boot_linux_console.py<br>
&gt; +++ b/tests/acceptance/boot_linux_console.py<br>
&gt; @@ -354,3 +354,69 @@ class BootLinuxConsole(Test):<br>
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
&#39;20190620T095935Z/pool-riscv64/main/l/linux/&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;linux-image-4.19.0-5-riscv64_4.19.37-4_riscv64.deb&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_hash =3D (&#39;bf5b5680c41d92134d22ca=
ef4fbd277c5217e1f0&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_path =3D self.fetch_asset(deb_url, as=
set_hash=3Ddeb_hash)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_path =3D &#39;/boot/vmlinux-4.19.0=
-5-riscv64&#39;<br>
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
<br>
Please explain why you need to do that...<br>
<br>
Also note these tests are run on other host architecture than x86, at<br>
least ppc64/s390x (so this won&#39;t work there).<br>
<br></blockquote><div>it is because riscv64 vmlinux doesn&#39;t have physic=
al loading address information and=C2=A0</div><div>depends on certain stage=
 bootloader to move kernel raw data to specific physical address (0x8020_00=
00)</div><div><br></div><div>The vmlinux program headers are=C2=A0<br>=C2=
=A0 Type=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Offset=C2=A0 =C2=A0=
 =C2=A0 =C2=A0VirtAddr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 PhysAddr =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FileSiz =C2=A0MemSiz=
 =C2=A0 Flg Align<br>=C2=A0 LOAD =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00100=
0 0xffffffe000000000 0x0000000000000000 0x0303a6 0x0303a6 R E 0x1000<br>=C2=
=A0 LOAD =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x032000 0xffffffe000031000 0x0=
000000000031000 0x828f0c 0x828f0c RWE 0x1000<br>=C2=A0 NOTE =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0x85aec0 0xffffffe000859ec0 0x0000000000859ec0 0x00004=
c 0x00004c R =C2=A0 0x4<br></div><div><br></div><div>For legacy bootloader,=
 bbl, It can handle payload in ELF format.=C2=A0 However, for the newer Ope=
nSBI, it can only handle raw data and</div><div>debian doesn&#39;t provide =
linux image in raw data format.</div><div><br></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-bios&#39;, opensbi=
_path,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&#39;-kernel&#39;, kimage_path,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&#39;-initrd&#39;, initrd_path,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&#39;-append&#39;, kernel_command_line,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&#39;-no-reboot&#39;)<br>
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
&gt; <br>
</blockquote></div></div>

--000000000000440f20058db64dcb--

