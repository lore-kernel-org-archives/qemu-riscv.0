Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hnNwU-0004Bv-5B
	for mharc-qemu-riscv@gnu.org; Tue, 16 Jul 2019 09:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59977)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chihmin.chao@sifive.com>) id 1hnNwQ-0004At-Ux
 for qemu-riscv@nongnu.org; Tue, 16 Jul 2019 09:56:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1hnNwO-0002tI-Id
 for qemu-riscv@nongnu.org; Tue, 16 Jul 2019 09:56:26 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:40253)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1hnNwO-0002sh-5c
 for qemu-riscv@nongnu.org; Tue, 16 Jul 2019 09:56:24 -0400
Received: by mail-wr1-x442.google.com with SMTP id r1so21054190wrl.7
 for <qemu-riscv@nongnu.org>; Tue, 16 Jul 2019 06:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zq1EFfzBW3vc2RfEhdgU7ESjt5rbzN4LUFJgr40aBA0=;
 b=ljG1eCTum16wMKbwciwPkVFLZi3D5FrFDTotX/16fUcAdcgN+Lm8UMwFSnR5IoIZpL
 Wnv/xRv5icNPIOb20LvO6gdT1T5qtZTpVQgMTTzyyp2qSFACeEw3LhsDk7+lrxc8j85A
 4GcFgLQ2nFfF6MWg49shCJf0RSute2nl4LEGlUA3ajMfOxZmOuYm18/AX4XQaAtle6Iu
 MM3UY9IPY98AC32LE1ulpUr326MArKwDdgb/7tscKyg73TKWidmEeVcDok5jZYkrnDxV
 yvv2KolxqoQ2mOWnPqdkOYZpdhtBpXcmHFvL7On4kJfe/SSAZHBoeZTL/ru8YoysPFPT
 nIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zq1EFfzBW3vc2RfEhdgU7ESjt5rbzN4LUFJgr40aBA0=;
 b=ezFV/ZQCM9jd5Z8Dix1az7ymb4qZ+8eG+aJZq5AW+71GQjBF4c0ivd4C44Gz0cxq3G
 2jDca8yr3456dPCE/4iLmNPbvdLuTvpsanqpjBofx/wxh/MzD9vfMaaCeerSHEqxe+kj
 Wv8l0WGxFVPZmftrdIb7fIl4VqEzm2FKzbI0m5ii5EOePr//wsJuf9XDmsx/ojm1/x/u
 2L2Gd7YA3rgOFcDxLhy5S6cqPA4zOHTBUpkb2rube2WogIG7EFmEIxfTIFn1va1wWNye
 +YuITEkw6O0CaZl8pWq/BggCSHEHnaVvU78AAwz3X8JBLl7CgSkau+keL0AUtqidI/i1
 yqoQ==
X-Gm-Message-State: APjAAAUFdK1I9pc0MO+8N7noKay77RgfcvQjRRnB/klpcGGm9JCQ0hCQ
 bQO6l47QrLEL4E5usH3yYze55xhVpnOnaEiwfPjydw==
X-Google-Smtp-Source: APXvYqwjuhyAcFZmqoT+L6SORWDz5UwM2f5DEtspvgUOiLDfXMq822byyngFjtgVHCIskbkXVvT0Dtl4e9NM946aZmE=
X-Received: by 2002:a5d:56d0:: with SMTP id m16mr34991946wrw.276.1563285381923; 
 Tue, 16 Jul 2019 06:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <1563181721-5055-1-git-send-email-chihmin.chao@sifive.com>
 <93b35a5e-c40a-535b-2a91-2c210b4a5928@redhat.com>
 <CAEiOBXXxS-93rTAQuvY_Tkxi1pYc1YfJenpBC_8gG2ou9uUZMg@mail.gmail.com>
 <7eb239bc-32aa-b5fc-ab2e-a741b005aad7@redhat.com>
 <CAKmqyKOZSz4f1-kLDhn=+imCvKHcZJVgqgqWbQ6qxD3K1n17GA@mail.gmail.com>
In-Reply-To: <CAKmqyKOZSz4f1-kLDhn=+imCvKHcZJVgqgqWbQ6qxD3K1n17GA@mail.gmail.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Tue, 16 Jul 2019 21:56:10 +0800
Message-ID: <CAEiOBXUBPFx5__wOLvLD0qQ7dzV2XVpHfiOoBZpXpu-SZsMiUg@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Fam Zheng <fam@euphon.net>, Alistair Francis <alistair@alistair23.me>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000df5b03058dccbddd"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2] tests/boot_linux_console:
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
X-List-Received-Date: Tue, 16 Jul 2019 13:56:29 -0000

--000000000000df5b03058dccbddd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2019 at 12:34 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Mon, Jul 15, 2019 at 6:02 AM Philippe Mathieu-Daud=C3=A9
> <philmd@redhat.com> wrote:
> >
> > On 7/15/19 1:09 PM, Chih-Min Chao wrote:
> > > On Mon, Jul 15, 2019 at 5:15 PM Philippe Mathieu-Daud=C3=A9
> > > <philmd@redhat.com <mailto:philmd@redhat.com>> wrote:
> > >
> > >     On 7/15/19 11:08 AM, Chih-Min Chao wrote:
> > >     > Similar to the mips + malta test, it boots a Linux kernel on a
> virt
> > >     > board and verify the serial is working.  Also, it relies on the
> serial
> > >     > device set by the machine itself.
> > >     >
> > >     > If riscv64 is a target being built, "make check-acceptance" wil=
l
> > >     > automatically include this test by the use of the "arch:riscv64=
"
> tags.
> > >     >
> > >     > Alternatively, this test can be run using:
> > >     >
> > >     >   $ avocado run -t arch:riscv64 tests/acceptance
> > >     >
> > >     > packages
> > >     >   debian official
> > >     >     binutils-riscv64-linux-gnu_2.32-8
> > >     >     opensbi_0.4-1_all
> > >     >     linux-image-4.19.0-5-riscv64 4.19.37-4
> > >     >   third-party
> > >     >
> > >
> https://github.com/groeck/linux-build-test/rootfs/riscv64/rootfs.cpio.gz
> > >     >     (the repo is also used in mips target acceptance)
> > >     >
> > >     > Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com
> > >     <mailto:chihmin.chao@sifive.com>>
> > >     > ---
> > >     >  .travis.yml                            |  2 +-
> > >     >  tests/acceptance/boot_linux_console.py | 66
> > >     ++++++++++++++++++++++++++++++++++
> > >     >  2 files changed, 67 insertions(+), 1 deletion(-)
> > >     >
> > >     > diff --git a/.travis.yml b/.travis.yml
> > >     > index 5d3d6ee..21fcead 100644
> > >     > --- a/.travis.yml
> > >     > +++ b/.travis.yml
> > >     > @@ -232,7 +232,7 @@ matrix:
> > >     >
> > >     >      # Acceptance (Functional) tests
> > >     >      - env:
> > >     > -        - CONFIG=3D"--python=3D/usr/bin/python3
> > >
>  --target-list=3Dx86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-sof=
tmmu,arm-softmmu,s390x-softmmu,alpha-softmmu"
> > >     > +        - CONFIG=3D"--python=3D/usr/bin/python3
> > >
>  --target-list=3Dx86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-sof=
tmmu,arm-softmmu,s390x-softmmu,alpha-softmmu,riscv64-softmmu"
> > >     >          - TEST_CMD=3D"make check-acceptance"
> > >     >        after_failure:
> > >     >          - cat tests/results/latest/job.log
> > >     > diff --git a/tests/acceptance/boot_linux_console.py
> > >     b/tests/acceptance/boot_linux_console.py
> > >     > index 3215950..0f638bc 100644
> > >     > --- a/tests/acceptance/boot_linux_console.py
> > >     > +++ b/tests/acceptance/boot_linux_console.py
> > >     > @@ -354,3 +354,69 @@ class BootLinuxConsole(Test):
> > >     >          self.vm.launch()
> > >     >          console_pattern =3D 'Kernel command line: %s' %
> > >     kernel_command_line
> > >     >          self.wait_for_console_pattern(console_pattern)
> > >     > +
> > >     > +    def test_riscv64_virt(self):
> > >     > +        """
> > >     > +        :avocado: tags=3Darch:riscv64
> > >     > +        :avocado: tags=3Dmachine:virt
> > >     > +        """
> > >     > +        deb_url =3D ('https://snapshot.debian.org/archive/debi=
an/
> '
> > >     > +
>  '20190424T171759Z/pool/main/b/binutils/'
> > >     > +
> > >      'binutils-riscv64-linux-gnu_2.32-8_amd64.deb')
> > >     > +        deb_hash =3D ('7fe376fd4452696c03acd508d6d613ca553ea15=
e')
> > >     > +        deb_path =3D self.fetch_asset(deb_url,
> asset_hash=3Ddeb_hash)
> > >     > +        objcopy_path =3D '/usr/bin/riscv64-linux-gnu-objcopy'
> > >     > +        objcopy_path =3D self.extract_from_deb(deb_path,
> objcopy_path)
> > >     > +        libbfd_path =3D
> > >     '/usr/lib/x86_64-linux-gnu/libbfd-2.32-riscv64.so
> > >     <http://libbfd-2.32-riscv64.so>'
> > >     > +        libbfd_path =3D self.extract_from_deb(deb_path,
> libbfd_path)
> > >     > +        process.run('ls -al %s' % (objcopy_path))
> > >     > +
> > >     > +        deb_url =3D ('https://snapshot.debian.org/archive/debi=
an/
> '
> > >     > +                   '20190708T032337Z/pool/main/o/opensbi/'
> > >     > +                   'opensbi_0.4-1_all.deb')
> > >     > +        deb_hash =3D ('2319dcd702958291d323acf5649fd98a11d9011=
2')
> > >     > +        deb_path =3D self.fetch_asset(deb_url,
> asset_hash=3Ddeb_hash)
> > >     > +        opensbi_path =3D ('/usr/lib/riscv64-linux-gnu/opensbi/=
'
> > >     > +                        'qemu/virt/fw_jump.elf')
> > >     > +        opensbi_path =3D self.extract_from_deb(deb_path,
> opensbi_path)
> > >     > +
> > >     > +        deb_url =3D
> > >     ('https://snapshot.debian.org/archive/debian-ports/'
> > >     > +                   '20190620T095935Z/pool-riscv64/main/l/linux=
/'
> > >     > +
> > >      'linux-image-4.19.0-5-riscv64_4.19.37-4_riscv64.deb')
> > >     > +        deb_hash =3D ('bf5b5680c41d92134d22caef4fbd277c5217e1f=
0')
> > >     > +        deb_path =3D self.fetch_asset(deb_url,
> asset_hash=3Ddeb_hash)
> > >     > +        kernel_path =3D '/boot/vmlinux-4.19.0-5-riscv64'
> > >     > +        kernel_path =3D self.extract_from_deb(deb_path,
> kernel_path)
> > >     > +        kimage_path =3D self.workdir + "/Image"
> > >     > +        env =3D os.environ
> > >     > +        env['LD_LIBRARY_PATH'] =3D ('%s:' %
> > >     (os.path.dirname(libbfd_path)) +
> > >     > +                                 env.get('LD_LIBRARY_PATH', ''=
))
> > >     > +        process.run(('%s -O binary -O binary -R'
> > >     > +                     '.note -R .note.gnu.build-id -R .comment =
-S
> > >     %s %s') %
> > >     > +                     (objcopy_path, kernel_path, kimage_path))
> > >
> > >     Please explain why you need to do that...
> > >
> > >     Also note these tests are run on other host architecture than x86=
,
> at
> > >     least ppc64/s390x (so this won't work there).
> > >
> > > it is because riscv64 vmlinux doesn't have physical loading address
> > > information and
> > > depends on certain stage bootloader to move kernel raw data to specif=
ic
> > > physical address (0x8020_0000)
> > >
> > > The vmlinux program headers are
> > >   Type             Offset       VirtAddr                  PhysAddr
> > >     FileSiz  MemSiz   Flg Align
> > >   LOAD           0x001000 0xffffffe000000000 0x0000000000000000
> 0x0303a6
> > > 0x0303a6 R E 0x1000
> > >   LOAD           0x032000 0xffffffe000031000 0x0000000000031000
> 0x828f0c
> > > 0x828f0c RWE 0x1000
> > >   NOTE           0x85aec0 0xffffffe000859ec0 0x0000000000859ec0
> 0x00004c
> > > 0x00004c R   0x4
> > >
> > > For legacy bootloader, bbl, It can handle payload in ELF format.
> > > However, for the newer OpenSBI, it can only handle raw data and
> > > debian doesn't provide linux image in raw data format.
>
> This doesn't sound right. You should just be able to say -kernel
> <anything> and it should work. It has worked for me with vmlinux and
> Image files when using master (not the 4.0 release but master/4.1).
> Although all of my testing was with the 5.1 kernel, so maybe there is
> a difference there?
>
> What isn't working for you? Can you include the errors and output of -d
> in_asm?
>
>
> Alistair
>

Hi Alistair,
   I have come across error before starting target simulation.  What I
means is to execute
            qemu-system-riscv64 -M virt -m 256M -nographic -bios
./opensbi/build/platform/qemu/virt/firmware/fw_jump.elf -kernel vmlinux
   then get the error message
            rom: requested regions overlap (rom mrom.reset.
free=3D0x000000000001eb7c, addr=3D0x0000000000001000)
            qemu-system-riscv64: rom check and register reset failed


  chihmin.chao


> >
> > I think you should be able to use -device loader,file=3D... here, then =
no
> > need to use objcopy.
> >
> > Cc'ing Alistair who is an expert on this.
> >
> > >     > +
> > >     > +        initrd_url =3D
> > >     ('https://github.com/groeck/linux-build-test/raw/'
> > >     > +
> > >     '8584a59ed9e5eb5ee7ca91f6d74bbb06619205b8/rootfs/'
> > >     > +                      'riscv64/rootfs.cpio.gz')
> > >     > +        initrd_hash =3D 'f4867d263754961b6f626cdcdc0cb334c47e3=
b49'
> > >     > +        initrd_path =3D self.fetch_asset(initrd_url,
> > >     asset_hash=3Dinitrd_hash)
> > >     > +
> > >     > +        self.vm.set_machine('virt')
> > >     > +        self.vm.set_console()
> > >     > +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LI=
NE
> > >     > +                               + 'console=3DttyS0 noreboot')
> > >     > +        self.vm.add_args('-bios', opensbi_path,
> > >     > +                         '-kernel', kimage_path,
> > >     > +                         '-initrd', initrd_path,
> > >     > +                         '-append', kernel_command_line,
> > >     > +                         '-no-reboot')
> > >     > +
> > >     > +        self.vm.launch()
> > >     > +        self.wait_for_console_pattern('Boot successful.')
> > >     > +
> > >     > +        self.exec_command_and_wait_for_pattern('cat
> /proc/cpuinfo',
> > >     > +                                               'isa')
> > >     > +        self.exec_command_and_wait_for_pattern('uname -a',
> > >     > +                                               'SMP Debian')
> > >     > +        self.exec_command_and_wait_for_pattern('reboot',
> > >     > +                                               'reboot:
> > >     Restarting system')
> > >     >
> > >
> >
>

--000000000000df5b03058dccbddd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 16, 2019 at 12:34 AM Alistair=
 Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 Mon, Jul 15, 2019 at 6:02 AM Philippe Mathieu-Daud=C3=A9<br>
&lt;<a href=3D"mailto:philmd@redhat.com" target=3D"_blank">philmd@redhat.co=
m</a>&gt; wrote:<br>
&gt;<br>
&gt; On 7/15/19 1:09 PM, Chih-Min Chao wrote:<br>
&gt; &gt; On Mon, Jul 15, 2019 at 5:15 PM Philippe Mathieu-Daud=C3=A9<br>
&gt; &gt; &lt;<a href=3D"mailto:philmd@redhat.com" target=3D"_blank">philmd=
@redhat.com</a> &lt;mailto:<a href=3D"mailto:philmd@redhat.com" target=3D"_=
blank">philmd@redhat.com</a>&gt;&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0On 7/15/19 11:08 AM, Chih-Min Chao wrote:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; Similar to the mips + malta test, it boot=
s a Linux kernel on a virt<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; board and verify the serial is working.=
=C2=A0 Also, it relies on the serial<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; device set by the machine itself.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; If riscv64 is a target being built, &quot=
;make check-acceptance&quot; will<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; automatically include this test by the us=
e of the &quot;arch:riscv64&quot; tags.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; Alternatively, this test can be run using=
:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0$ avocado run -t arch:riscv64=
 tests/acceptance<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; packages<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0debian official<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0binutils-riscv64-linux=
-gnu_2.32-8<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0opensbi_0.4-1_all<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0linux-image-4.19.0-5-r=
iscv64 4.19.37-4<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0third-party<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 <a href=3D"https://github.com/groeck/linux-bu=
ild-test/rootfs/riscv64/rootfs.cpio.gz" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/groeck/linux-build-test/rootfs/riscv64/rootfs.cpio.gz<=
/a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0(the repo is also used=
 in mips target acceptance)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Chih-Min Chao &lt;<a href=
=3D"mailto:chihmin.chao@sifive.com" target=3D"_blank">chihmin.chao@sifive.c=
om</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:chihmin.chao@sifi=
ve.com" target=3D"_blank">chihmin.chao@sifive.com</a>&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 .travis.yml=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 tests/acceptance/boot_linux_console=
.py | 66<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0++++++++++++++++++++++++++++++++++<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 2 files changed, 67 insertions(+), =
1 deletion(-)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/.travis.yml b/.travis.yml<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; index 5d3d6ee..21fcead 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; --- a/.travis.yml<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/.travis.yml<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -232,7 +232,7 @@ matrix:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 # Acceptance (Functio=
nal) tests<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 - env:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 - CONFIG=3D&=
quot;--python=3D/usr/bin/python3<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0--target-list=3Dx86_64-softmmu,mips-softmmu,mi=
ps64el-softmmu,aarch64-softmmu,arm-softmmu,s390x-softmmu,alpha-softmmu&quot=
;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 - CONFIG=3D&=
quot;--python=3D/usr/bin/python3<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0--target-list=3Dx86_64-softmmu,mips-softmmu,mi=
ps64el-softmmu,aarch64-softmmu,arm-softmmu,s390x-softmmu,alpha-softmmu,risc=
v64-softmmu&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - TEST_=
CMD=3D&quot;make check-acceptance&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 after_failure:=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - cat t=
ests/results/latest/job.log<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/tests/acceptance/boot_linux_=
console.py<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0b/tests/acceptance/boot_linux_console.py<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; index 3215950..0f638bc 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; --- a/tests/acceptance/boot_linux_console=
.py<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/tests/acceptance/boot_linux_console=
.py<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -354,3 +354,69 @@ class BootLinuxConso=
le(Test):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm=
.launch()<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 console=
_pattern =3D &#39;Kernel command line: %s&#39; %<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0kernel_command_line<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.wa=
it_for_console_pattern(console_pattern)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 def test_riscv64_virt(self=
):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;=
&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: ta=
gs=3Darch:riscv64<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: ta=
gs=3Dmachine:virt<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;=
&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_url =3D =
(&#39;<a href=3D"https://snapshot.debian.org/archive/debian/" rel=3D"norefe=
rrer" target=3D"_blank">https://snapshot.debian.org/archive/debian/</a>&#39=
;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;20190424T171759Z/p=
ool/main/b/binutils/&#39;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &#39;binutils-riscv64-linux-gnu_2.32-8_amd64.=
deb&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_hash =3D=
 (&#39;7fe376fd4452696c03acd508d6d613ca553ea15e&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_path =3D=
 self.fetch_asset(deb_url, asset_hash=3Ddeb_hash)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 objcopy_path=
 =3D &#39;/usr/bin/riscv64-linux-gnu-objcopy&#39;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 objcopy_path=
 =3D self.extract_from_deb(deb_path, objcopy_path)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 libbfd_path =
=3D<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&#39;/usr/lib/x86_64-linux-gnu/<a href=3D"http=
://libbfd-2.32-riscv64.so" rel=3D"noreferrer" target=3D"_blank">libbfd-2.32=
-riscv64.so</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://libbfd-2.32-riscv64.so" =
rel=3D"noreferrer" target=3D"_blank">http://libbfd-2.32-riscv64.so</a>&gt;&=
#39;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 libbfd_path =
=3D self.extract_from_deb(deb_path, libbfd_path)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 process.run(=
&#39;ls -al %s&#39; % (objcopy_path))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_url =3D =
(&#39;<a href=3D"https://snapshot.debian.org/archive/debian/" rel=3D"norefe=
rrer" target=3D"_blank">https://snapshot.debian.org/archive/debian/</a>&#39=
;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;20190708T032337Z/pool/main/o/opensbi/&#=
39;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;opensbi_0.4-1_all.deb&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_hash =3D=
 (&#39;2319dcd702958291d323acf5649fd98a11d90112&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_path =3D=
 self.fetch_asset(deb_url, asset_hash=3Ddeb_hash)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 opensbi_path=
 =3D (&#39;/usr/lib/riscv64-linux-gnu/opensbi/&#39;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;qemu/virt/fw_jump.elf&#3=
9;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 opensbi_path=
 =3D self.extract_from_deb(deb_path, opensbi_path)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_url =3D<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0(&#39;<a href=3D"https://snapshot.debian.org/a=
rchive/debian-ports/" rel=3D"noreferrer" target=3D"_blank">https://snapshot=
.debian.org/archive/debian-ports/</a>&#39;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;20190620T095935Z/pool-riscv64/main/l/li=
nux/&#39;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &#39;linux-image-4.19.0-5-riscv64_4.19.37-4_r=
iscv64.deb&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_hash =3D=
 (&#39;bf5b5680c41d92134d22caef4fbd277c5217e1f0&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_path =3D=
 self.fetch_asset(deb_url, asset_hash=3Ddeb_hash)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_path =
=3D &#39;/boot/vmlinux-4.19.0-5-riscv64&#39;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_path =
=3D self.extract_from_deb(deb_path, kernel_path)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kimage_path =
=3D self.workdir + &quot;/Image&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env =3D os.e=
nviron<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env[&#39;LD_=
LIBRARY_PATH&#39;] =3D (&#39;%s:&#39; %<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0(os.path.dirname(libbfd_path)) +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0env.get(&#39;LD_LIBRARY_PATH&#39;, &#39;&#39;))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 process.run(=
(&#39;%s -O binary -O binary -R&#39;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;.note -R .note.gnu.build-id -R .=
comment -S<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0%s %s&#39;) %<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(objcopy_path, kernel_path, kimage_pa=
th))<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Please explain why you need to do that...<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Also note these tests are run on other host ar=
chitecture than x86, at<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0least ppc64/s390x (so this won&#39;t work ther=
e).<br>
&gt; &gt;<br>
&gt; &gt; it is because riscv64 vmlinux doesn&#39;t have physical loading a=
ddress<br>
&gt; &gt; information and<br>
&gt; &gt; depends on certain stage bootloader to move kernel raw data to sp=
ecific<br>
&gt; &gt; physical address (0x8020_0000)<br>
&gt; &gt;<br>
&gt; &gt; The vmlinux program headers are<br>
&gt; &gt;=C2=A0 =C2=A0Type=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O=
ffset=C2=A0 =C2=A0 =C2=A0 =C2=A0VirtAddr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PhysAddr<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0FileSiz=C2=A0 MemSiz=C2=A0 =C2=A0Flg Align<br>
&gt; &gt;=C2=A0 =C2=A0LOAD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x001000=
 0xffffffe000000000 0x0000000000000000 0x0303a6<br>
&gt; &gt; 0x0303a6 R E 0x1000<br>
&gt; &gt;=C2=A0 =C2=A0LOAD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x032000=
 0xffffffe000031000 0x0000000000031000 0x828f0c<br>
&gt; &gt; 0x828f0c RWE 0x1000<br>
&gt; &gt;=C2=A0 =C2=A0NOTE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x85aec0=
 0xffffffe000859ec0 0x0000000000859ec0 0x00004c<br>
&gt; &gt; 0x00004c R=C2=A0 =C2=A00x4<br>
&gt; &gt;<br>
&gt; &gt; For legacy bootloader, bbl, It can handle payload in ELF format.<=
br>
&gt; &gt; However, for the newer OpenSBI, it can only handle raw data and<b=
r>
&gt; &gt; debian doesn&#39;t provide linux image in raw data format.<br>
<br>
This doesn&#39;t sound right. You should just be able to say -kernel<br>
&lt;anything&gt; and it should work. It has worked for me with vmlinux and<=
br>
Image files when using master (not the 4.0 release but master/4.1).<br>
Although all of my testing was with the 5.1 kernel, so maybe there is<br>
a difference there?<br>
<br>
What isn&#39;t working for you? Can you include the errors and output of -d=
 in_asm?<br>
<br>
<br>
Alistair<br></blockquote><div><br></div><div>Hi Alistair,</div><div>=C2=A0 =
=C2=A0I have come across error before starting target simulation.=C2=A0 Wha=
t I means is to execute=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 qemu-system-riscv64 -M virt -m 256M -nographic -bios ./opensbi/build=
/platform/qemu/virt/firmware/fw_jump.elf -kernel vmlinux</div><div>=C2=A0 =
=C2=A0then get the error message</div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 rom: requested regions overlap (rom mrom.reset. free=3D0x00000000000=
1eb7c, addr=3D0x0000000000001000)<br><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 qemu-system-riscv64: rom check and register reset failed=C2=A0</=
div><div><br></div><div><br></div><div>=C2=A0 chihmin.chao</div><div>=C2=A0=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; I think you should be able to use -device loader,file=3D... here, then=
 no<br>
&gt; need to use objcopy.<br>
&gt;<br>
&gt; Cc&#39;ing Alistair who is an expert on this.<br>
&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_url =
=3D<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0(&#39;<a href=3D"https://github.com/groeck/lin=
ux-build-test/raw/" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/groeck/linux-build-test/raw/</a>&#39;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&#39;8584a59ed9e5eb5ee7ca91f6d74bbb06619205b8/=
rootfs/&#39;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;riscv64/rootfs.cpio.gz&#39;)<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_hash =
=3D &#39;f4867d263754961b6f626cdcdc0cb334c47e3b49&#39;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_path =
=3D self.fetch_asset(initrd_url,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0asset_hash=3Dinitrd_hash)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.set_=
machine(&#39;virt&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.set_=
console()<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_comma=
nd_line =3D (self.KERNEL_COMMON_COMMAND_LINE<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ =
&#39;console=3DttyS0 noreboot&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_=
args(&#39;-bios&#39;, opensbi_path,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-kernel&#39;, kima=
ge_path,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-initrd&#39;, init=
rd_path,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-append&#39;, kern=
el_command_line,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-no-reboot&#39;)<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.laun=
ch()<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.wait_fo=
r_console_pattern(&#39;Boot successful.&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.exec_co=
mmand_and_wait_for_pattern(&#39;cat /proc/cpuinfo&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;isa&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.exec_co=
mmand_and_wait_for_pattern(&#39;uname -a&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;SMP Debian&#39;=
)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.exec_co=
mmand_and_wait_for_pattern(&#39;reboot&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;reboot:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Restarting system&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;<br>
&gt;<br>
</blockquote></div></div>

--000000000000df5b03058dccbddd--

