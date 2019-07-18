Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1ho9vx-00080N-9h
	for mharc-qemu-riscv@gnu.org; Thu, 18 Jul 2019 13:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49705)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chihmin.chao@sifive.com>) id 1ho9vt-0007ty-4q
 for qemu-riscv@nongnu.org; Thu, 18 Jul 2019 13:11:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1ho9vp-00075u-R6
 for qemu-riscv@nongnu.org; Thu, 18 Jul 2019 13:11:05 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44338)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1ho9vp-00074Q-Cq
 for qemu-riscv@nongnu.org; Thu, 18 Jul 2019 13:11:01 -0400
Received: by mail-wr1-x431.google.com with SMTP id p17so29484829wrf.11
 for <qemu-riscv@nongnu.org>; Thu, 18 Jul 2019 10:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yve9q6kG1WafFci2C5jbq9bEgYy7depfKs+qbBM2eQk=;
 b=m/yWC2vyUCRYITZHdTNskUKqLGJ08V3ojj5BMXmuBm9vNCQF7QikLckrrK+FipP3iU
 wSwdff1OwXb1FCmwES6l2zIk1cJ6TPhKrch7jm83C4KIX/24GnlQdKSh/frjDyXcloPf
 decSToARfjJAsU77fw8wR2nSz+HxTAPhOIIXiOVvhHz8I0LX79ORHZNmHK163UpF/tI5
 xQtdKmcGLPr78mh5r2ctrQd30geefRJo43wHc5cJG9RPRf2xp3kVh8waLWdlhZEoc+kS
 fn+Xv5WKJ4xJOlMSK9UE8DT5yBu3vmQe/6TfVokMJoUSxo5MfQqMbXeYwCnaER+A83lT
 mk3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yve9q6kG1WafFci2C5jbq9bEgYy7depfKs+qbBM2eQk=;
 b=WP3AVUU+tNw5EUuBeshV6LqQHX6SRoi/bsqBhj66mANjF2oSNWlJYQ7fenRv4ddks3
 zdQRa8JA3W7fMbeVO5KoYS1mjfSQcpoHADeutbvJlbzjSdW1anSZ4e4mwg6GDrP3gK7D
 fl15p2OMsmBtxqKnKvk7hH8AHuOu1gBbBbjx6VNl7x6duwcbbMRKTIpiqAqA9212aPD5
 2LE8cF9tS1Q94+HangvfR7zv/vJBgygQl6tygoxutNfiOHqtv9aLlWyLDwKDi7oqsgxJ
 TQPZI+Nr2HuS7grp43KHKP54gBm6npQc3FE7rZ3Q8ZXmYmjInW6yVDl0GyIvgoqpWz6z
 OYRg==
X-Gm-Message-State: APjAAAXdOYmjchLuMeNKQv3pTsKLsEZ5zcQhspQGd6ro4V8woihfqgV5
 D0Oh25g0q0bi0SVc18hlNiEsSpZjaocpW1tGZpX14A==
X-Google-Smtp-Source: APXvYqyHfSg8IhYCzgKL3EQbx5hBWhysqeOsCWpfYdTCkz6ia4Bx8fNFzGVOlm9VKltmoWwQVZiuybVEgCxPSsjIMMQ=
X-Received: by 2002:adf:de90:: with SMTP id w16mr15282005wrl.217.1563469859904; 
 Thu, 18 Jul 2019 10:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <1563181721-5055-1-git-send-email-chihmin.chao@sifive.com>
 <93b35a5e-c40a-535b-2a91-2c210b4a5928@redhat.com>
 <CAEiOBXXxS-93rTAQuvY_Tkxi1pYc1YfJenpBC_8gG2ou9uUZMg@mail.gmail.com>
 <7eb239bc-32aa-b5fc-ab2e-a741b005aad7@redhat.com>
 <CAKmqyKOZSz4f1-kLDhn=+imCvKHcZJVgqgqWbQ6qxD3K1n17GA@mail.gmail.com>
 <CAEiOBXUBPFx5__wOLvLD0qQ7dzV2XVpHfiOoBZpXpu-SZsMiUg@mail.gmail.com>
 <CAKmqyKNOiRYqZgiWT+LUKkOv+Bew3djOqc9vHpmSqZ-1Gfjd8Q@mail.gmail.com>
 <d2c7e6c6-4d4a-d47e-e496-4f4cfe466fe1@redhat.com>
 <CAKmqyKPiDHrPVuz2P1n9_j170k2bSm=7uDKrQg-fAUhL1FQm9g@mail.gmail.com>
 <CAEiOBXUXdyntjnt-bi9-wiO2mmpgVC8WpD9KnxWoDdP__71XXQ@mail.gmail.com>
 <CAKmqyKOHfx+h8=x2OnvyDD5LnqO09Uk56doqnkBY0VDcEbxQpA@mail.gmail.com>
 <CAEiOBXXMRXEEdp27c0C6RpxLQFW7BYdTDsoR5pRyxf=m74A5Kg@mail.gmail.com>
 <CAKmqyKPP8Y9SP8xHgA2N1n5wLmmaoXuK1GBBA7_G90rZJP5x8A@mail.gmail.com>
In-Reply-To: <CAKmqyKPP8Y9SP8xHgA2N1n5wLmmaoXuK1GBBA7_G90rZJP5x8A@mail.gmail.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Fri, 19 Jul 2019 01:10:48 +0800
Message-ID: <CAEiOBXXsEkXEDsv8pUQM8_mNfAm=6xOeODca+gLrKUYKv+Zqag@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Fam Zheng <fam@euphon.net>, Alistair Francis <alistair@alistair23.me>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000009df348058df7b16c"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::431
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
X-List-Received-Date: Thu, 18 Jul 2019 17:11:08 -0000

--0000000000009df348058df7b16c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2019 at 11:34 PM Alistair Francis <alistair23@gmail.com>
wrote:

> On Thu, Jul 18, 2019 at 8:00 AM Chih-Min Chao <chihmin.chao@sifive.com>
> wrote:
> >
> >
> >
> > On Thu, Jul 18, 2019 at 6:47 AM Alistair Francis <alistair23@gmail.com>
> wrote:
> >>
> >> On Tue, Jul 16, 2019 at 10:21 PM Chih-Min Chao <chihmin.chao@sifive.co=
m>
> wrote:
> >> >
> >> >
> >> >
> >> > On Wed, Jul 17, 2019 at 6:59 AM Alistair Francis <
> alistair23@gmail.com> wrote:
> >> >>
> >> >> On Tue, Jul 16, 2019 at 2:50 PM Philippe Mathieu-Daud=C3=A9
> >> >> <philmd@redhat.com> wrote:
> >> >> >
> >> >> > On 7/16/19 10:43 PM, Alistair Francis wrote:
> >> >> > > On Tue, Jul 16, 2019 at 6:56 AM Chih-Min Chao <
> chihmin.chao@sifive.com> wrote:
> >> >> > >>
> >> >> > >>
> >> >> > >> On Tue, Jul 16, 2019 at 12:34 AM Alistair Francis <
> alistair23@gmail.com> wrote:
> >> >> > >>>
> >> >> > >>> On Mon, Jul 15, 2019 at 6:02 AM Philippe Mathieu-Daud=C3=A9
> >> >> > >>> <philmd@redhat.com> wrote:
> >> >> > >>>>
> >> >> > >>>> On 7/15/19 1:09 PM, Chih-Min Chao wrote:
> >> >> > >>>>> On Mon, Jul 15, 2019 at 5:15 PM Philippe Mathieu-Daud=C3=A9
> >> >> > >>>>> <philmd@redhat.com <mailto:philmd@redhat.com>> wrote:
> >> >> > >>>>>
> >> >> > >>>>>     On 7/15/19 11:08 AM, Chih-Min Chao wrote:
> >> >> > >>>>>     > Similar to the mips + malta test, it boots a Linux
> kernel on a virt
> >> >> > >>>>>     > board and verify the serial is working.  Also, it
> relies on the serial
> >> >> > >>>>>     > device set by the machine itself.
> >> >> > >>>>>     >
> >> >> > >>>>>     > If riscv64 is a target being built, "make
> check-acceptance" will
> >> >> > >>>>>     > automatically include this test by the use of the
> "arch:riscv64" tags.
> >> >> > >>>>>     >
> >> >> > >>>>>     > Alternatively, this test can be run using:
> >> >> > >>>>>     >
> >> >> > >>>>>     >   $ avocado run -t arch:riscv64 tests/acceptance
> >> >> > >>>>>     >
> >> >> > >>>>>     > packages
> >> >> > >>>>>     >   debian official
> >> >> > >>>>>     >     binutils-riscv64-linux-gnu_2.32-8
> >> >> > >>>>>     >     opensbi_0.4-1_all
> >> >> > >>>>>     >     linux-image-4.19.0-5-riscv64 4.19.37-4
> >> >> > >>>>>     >   third-party
> >> >> > >>>>>     >
> >> >> > >>>>>
> https://github.com/groeck/linux-build-test/rootfs/riscv64/rootfs.cpio.gz
> >> >> > >>>>>     >     (the repo is also used in mips target acceptance)
> >> >> > >>>>>     >
> >> >> > >>>>>     > Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com
> >> >> > >>>>>     <mailto:chihmin.chao@sifive.com>>
> >> >> > >>>>>     > ---
> >> >> > >>>>>     >  .travis.yml                            |  2 +-
> >> >> > >>>>>     >  tests/acceptance/boot_linux_console.py | 66
> >> >> > >>>>>     ++++++++++++++++++++++++++++++++++
> >> >> > >>>>>     >  2 files changed, 67 insertions(+), 1 deletion(-)
> >> >> > >>>>>     >
> >> >> > >>>>>     > diff --git a/.travis.yml b/.travis.yml
> >> >> > >>>>>     > index 5d3d6ee..21fcead 100644
> >> >> > >>>>>     > --- a/.travis.yml
> >> >> > >>>>>     > +++ b/.travis.yml
> >> >> > >>>>>     > @@ -232,7 +232,7 @@ matrix:
> >> >> > >>>>>     >
> >> >> > >>>>>     >      # Acceptance (Functional) tests
> >> >> > >>>>>     >      - env:
> >> >> > >>>>>     > -        - CONFIG=3D"--python=3D/usr/bin/python3
> >> >> > >>>>>
>  --target-list=3Dx86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-sof=
tmmu,arm-softmmu,s390x-softmmu,alpha-softmmu"
> >> >> > >>>>>     > +        - CONFIG=3D"--python=3D/usr/bin/python3
> >> >> > >>>>>
>  --target-list=3Dx86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-sof=
tmmu,arm-softmmu,s390x-softmmu,alpha-softmmu,riscv64-softmmu"
> >> >> > >>>>>     >          - TEST_CMD=3D"make check-acceptance"
> >> >> > >>>>>     >        after_failure:
> >> >> > >>>>>     >          - cat tests/results/latest/job.log
> >> >> > >>>>>     > diff --git a/tests/acceptance/boot_linux_console.py
> >> >> > >>>>>     b/tests/acceptance/boot_linux_console.py
> >> >> > >>>>>     > index 3215950..0f638bc 100644
> >> >> > >>>>>     > --- a/tests/acceptance/boot_linux_console.py
> >> >> > >>>>>     > +++ b/tests/acceptance/boot_linux_console.py
> >> >> > >>>>>     > @@ -354,3 +354,69 @@ class BootLinuxConsole(Test):
> >> >> > >>>>>     >          self.vm.launch()
> >> >> > >>>>>     >          console_pattern =3D 'Kernel command line: %s=
' %
> >> >> > >>>>>     kernel_command_line
> >> >> > >>>>>     >          self.wait_for_console_pattern(console_patter=
n)
> >> >> > >>>>>     > +
> >> >> > >>>>>     > +    def test_riscv64_virt(self):
> >> >> > >>>>>     > +        """
> >> >> > >>>>>     > +        :avocado: tags=3Darch:riscv64
> >> >> > >>>>>     > +        :avocado: tags=3Dmachine:virt
> >> >> > >>>>>     > +        """
> >> >> > >>>>>     > +        deb_url =3D ('
> https://snapshot.debian.org/archive/debian/'
> >> >> > >>>>>     > +
>  '20190424T171759Z/pool/main/b/binutils/'
> >> >> > >>>>>     > +
> >> >> > >>>>>      'binutils-riscv64-linux-gnu_2.32-8_amd64.deb')
> >> >> > >>>>>     > +        deb_hash =3D
> ('7fe376fd4452696c03acd508d6d613ca553ea15e')
> >> >> > >>>>>     > +        deb_path =3D self.fetch_asset(deb_url,
> asset_hash=3Ddeb_hash)
> >> >> > >>>>>     > +        objcopy_path =3D
> '/usr/bin/riscv64-linux-gnu-objcopy'
> >> >> > >>>>>     > +        objcopy_path =3D
> self.extract_from_deb(deb_path, objcopy_path)
> >> >> > >>>>>     > +        libbfd_path =3D
> >> >> > >>>>>     '/usr/lib/x86_64-linux-gnu/libbfd-2.32-riscv64.so
> >> >> > >>>>>     <http://libbfd-2.32-riscv64.so>'
> >> >> > >>>>>     > +        libbfd_path =3D self.extract_from_deb(deb_pa=
th,
> libbfd_path)
> >> >> > >>>>>     > +        process.run('ls -al %s' % (objcopy_path))
> >> >> > >>>>>     > +
> >> >> > >>>>>     > +        deb_url =3D ('
> https://snapshot.debian.org/archive/debian/'
> >> >> > >>>>>     > +
>  '20190708T032337Z/pool/main/o/opensbi/'
> >> >> > >>>>>     > +                   'opensbi_0.4-1_all.deb')
> >> >> > >>>>>     > +        deb_hash =3D
> ('2319dcd702958291d323acf5649fd98a11d90112')
> >> >> > >>>>>     > +        deb_path =3D self.fetch_asset(deb_url,
> asset_hash=3Ddeb_hash)
> >> >> > >>>>>     > +        opensbi_path =3D
> ('/usr/lib/riscv64-linux-gnu/opensbi/'
> >> >> > >>>>>     > +                        'qemu/virt/fw_jump.elf')
> >> >> > >>>>>     > +        opensbi_path =3D
> self.extract_from_deb(deb_path, opensbi_path)
> >> >> > >>>>>     > +
> >> >> > >>>>>     > +        deb_url =3D
> >> >> > >>>>>     ('https://snapshot.debian.org/archive/debian-ports/'
> >> >> > >>>>>     > +
>  '20190620T095935Z/pool-riscv64/main/l/linux/'
> >> >> > >>>>>     > +
> >> >> > >>>>>      'linux-image-4.19.0-5-riscv64_4.19.37-4_riscv64.deb')
> >> >> > >>>>>     > +        deb_hash =3D
> ('bf5b5680c41d92134d22caef4fbd277c5217e1f0')
> >> >> > >>>>>     > +        deb_path =3D self.fetch_asset(deb_url,
> asset_hash=3Ddeb_hash)
> >> >> > >>>>>     > +        kernel_path =3D '/boot/vmlinux-4.19.0-5-risc=
v64'
> >> >> > >>>>>     > +        kernel_path =3D self.extract_from_deb(deb_pa=
th,
> kernel_path)
> >> >> > >>>>>     > +        kimage_path =3D self.workdir + "/Image"
> >> >> > >>>>>     > +        env =3D os.environ
> >> >> > >>>>>     > +        env['LD_LIBRARY_PATH'] =3D ('%s:' %
> >> >> > >>>>>     (os.path.dirname(libbfd_path)) +
> >> >> > >>>>>     > +
>  env.get('LD_LIBRARY_PATH', ''))
> >> >> > >>>>>     > +        process.run(('%s -O binary -O binary -R'
> >> >> > >>>>>     > +                     '.note -R .note.gnu.build-id -R
> .comment -S
> >> >> > >>>>>     %s %s') %
> >> >> > >>>>>     > +                     (objcopy_path, kernel_path,
> kimage_path))
> >> >> > >>>>>
> >> >> > >>>>>     Please explain why you need to do that...
> >> >> > >>>>>
> >> >> > >>>>>     Also note these tests are run on other host architectur=
e
> than x86, at
> >> >> > >>>>>     least ppc64/s390x (so this won't work there).
> >> >> > >>>>>
> >> >> > >>>>> it is because riscv64 vmlinux doesn't have physical loading
> address
> >> >> > >>>>> information and
> >> >> > >>>>> depends on certain stage bootloader to move kernel raw data
> to specific
> >> >> > >>>>> physical address (0x8020_0000)
> >> >> > >>>>>
> >> >> > >>>>> The vmlinux program headers are
> >> >> > >>>>>   Type             Offset       VirtAddr
> PhysAddr
> >> >> > >>>>>     FileSiz  MemSiz   Flg Align
> >> >> > >>>>>   LOAD           0x001000 0xffffffe000000000
> 0x0000000000000000 0x0303a6
> >> >> > >>>>> 0x0303a6 R E 0x1000
> >> >> > >>>>>   LOAD           0x032000 0xffffffe000031000
> 0x0000000000031000 0x828f0c
> >> >> > >>>>> 0x828f0c RWE 0x1000
> >> >> > >>>>>   NOTE           0x85aec0 0xffffffe000859ec0
> 0x0000000000859ec0 0x00004c
> >> >> > >>>>> 0x00004c R   0x4
> >> >> > >>>>>
> >> >> > >>>>> For legacy bootloader, bbl, It can handle payload in ELF
> format.
> >> >> > >>>>> However, for the newer OpenSBI, it can only handle raw data
> and
> >> >> > >>>>> debian doesn't provide linux image in raw data format.
> >> >> > >>>
> >> >> > >>> This doesn't sound right. You should just be able to say
> -kernel
> >> >> > >>> <anything> and it should work. It has worked for me with
> vmlinux and
> >> >> > >>> Image files when using master (not the 4.0 release but
> master/4.1).
> >> >> > >>> Although all of my testing was with the 5.1 kernel, so maybe
> there is
> >> >> > >>> a difference there?
> >> >> > >>>
> >> >> > >>> What isn't working for you? Can you include the errors and
> output of -d in_asm?
> >> >> > >>>
> >> >> > >>>
> >> >> > >>> Alistair
> >> >> > >>
> >> >> > >>
> >> >> > >> Hi Alistair,
> >> >> > >>    I have come across error before starting target simulation.
> What I means is to execute
> >> >> > >>             qemu-system-riscv64 -M virt -m 256M -nographic
> -bios ./opensbi/build/platform/qemu/virt/firmware/fw_jump.elf -kernel
> vmlinux
> >> >> > >>    then get the error message
> >> >> > >>             rom: requested regions overlap (rom mrom.reset.
> free=3D0x000000000001eb7c, addr=3D0x0000000000001000)
> >> >> > >>             qemu-system-riscv64: rom check and register reset
> failed
> >> >> > >
> >> >> > > Hmmm.... I don't remember seeing this problem in my testing, bu=
t
> it
> >> >> > > does seem to make sense.
> >> >> > >
> >> >> > > We have two options here:
> >> >> > > 1. Use the Image file from Linux 5.0+ (my preferred option as
> 4.19 is
> >> >> > > getting old)
> >> >
> >> >  I choose 4.19 version rather than 5.0+  because 4.19 is stable
> branch maintained by Greg.
> >> >  But it is ok to use 5.0 trunk, the latest version provided by debia=
n.
> >> >
> >> >>
> >> >> > > 2. Use the device loader (documented here:
> >> >> > >
> https://github.com/riscv/opensbi/blob/master/docs/platform/qemu_virt.md)
> >> >
> >> >
> >> > The document describes two user cases
> >> >   1. fw_payload.elf
> >> >       a. include the Image (raw data file, not elf)  into data secti=
on
> >> >       b. -kernel load the each part to the correct address
> >> >
> >> >      the program header of  fw_payload.elf are
> >> >      Type           Offset   VirtAddr           PhysAddr
>  FileSiz  MemSiz   Flg Align
> >> >     LOAD           0x0000b0 0x0000000080000000 0x0000000080000000
> 0x00a008 0x00b0b8 RWE 0x10               <-  fw_payload  main program
> >> >     LOAD           0x00a0b8 0x0000000080200000 0x0000000080200000
> 0x8dbe20 0x8dbe20 R E 0x1                    <-  arch/riscv/boot/Image   =
or
> u-boot.bin
> >> >
> >> >   2. fw_jump.elf
> >> >       a. use  "-kernel <raw image> or -device  loader,file=3D<raw
> Image>,addr=3D0x80200000" to load correct address
> >> >       b. fw_jump.elf just jump to the entry address 0x80200000
> >> >
> >> >
> >> >  The issues are
> >> >    a. debian linux-image package only provides vmlinux.
> >>
> >> This can be fixed by upgrading the kernel version. Fedora should have
> >> a 5.2 kernel that you can use instead of Debian.
> >>
> >> >        so I use objcopy in acceptance test
> >> >    b. riscv64 vmlinux doesn't have correct PhysAddr and -kernel can'=
t
> move data to expected address
> >> >        explicit load the Image to specific
> >> >            -kernel raw_image   (if file is not elf or uImage,
> riscv_kerner_loader treat it is as raw image and place it at 0x8020_0000)
> >> >            -device loader,file=3D<raw_image>,0x80200000  (do the sam=
e
> thing)
> >>
> >> Does the device loader not work?
> >>
> >> Alistair
> >
> >
> >   The device loader works for "Image" case (raw data)
> >   If the data is raw image,  for riscv_load_kernel implementation,
>  "-kernel <raw_image>" and  -device loader,file=3D<raw_image>,0x80200000 =
 are
> the same.
> >   They finally call "load_image_targphys_as"
> >   The only difference is that target address is hardcoded or feed from
> command line option.
> >
> >   I don't prefe one than the other.  Both of them are Ok to me.  I coul=
d
> refine that if one of them is more preferable.
>
> I'm a little confused with what you mean, so if you have something
> that will work just send a new version and we can discuss it there.
>
> PS: I'm still in favour of just using a newer kernel and a Image file.
>
> Alistair
>
>  ok, I will use the latest kernel available in Debian package and refine
the command in next version.

chihmin.chao


> >
> >
> >  chihmin.chao
> >>
> >>
> >> >
> >> >   ELF should work only if it has correct loading information.
> >> >
> >> >   chihmin.chao
> >> >>
> >> >> >
> >> >> > Nice doc, this example is exactly what I had in mind:
> >> >> >
> >> >> >   qemu-system-riscv64 -M virt -m 256M -nographic \
> >> >> >         -kernel build/platform/qemu/virt/firmware/fw_jump.elf \
> >> >> >         -device
> >> >> >
> loader,file=3D<linux_build_directory>/arch/riscv/boot/Image,addr=3D0x8020=
0000 \
> >> >> >         -drive file=3D<path_to_linux_rootfs>,format=3Draw,id=3Dhd=
0 \
> >> >> >         -device virtio-blk-device,drive=3Dhd0 \
> >> >> >         -append "root=3D/dev/vda rw console=3DttyS0"
> >> >> >
> >> >> > If the Image is an ELF, I assume we don't need to specify the
> address,
> >> >> > because the device loader knows how to parse this format. Again,
> >> >> > Alistair is the expert ;)
> >> >>
> >> >> Yep, an elf should just work.
> >> >>
> >> >  describe the issue above
> >> >
> >> >>
> >> >> >
> >> >> > If for some reason it only works with Linux 5.0+, let's use these=
!
> >> >>
> >> >> Only 5.0+ builds an elf.
> >> >>
> >> >> Alistair
> >> >>
> >> >> >
> >> >> > Regards,
> >> >> >
> >> >> > Phil.
>

--0000000000009df348058df7b16c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 18, 2019 at 11:34 PM Alis=
tair Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On Thu, Jul 18, 2019 at 8:00 AM Chih-Min Chao &lt;<a href=3D"mailto:chihm=
in.chao@sifive.com" target=3D"_blank">chihmin.chao@sifive.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Thu, Jul 18, 2019 at 6:47 AM Alistair Francis &lt;<a href=3D"mailto=
:alistair23@gmail.com" target=3D"_blank">alistair23@gmail.com</a>&gt; wrote=
:<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Jul 16, 2019 at 10:21 PM Chih-Min Chao &lt;<a href=3D"mail=
to:chihmin.chao@sifive.com" target=3D"_blank">chihmin.chao@sifive.com</a>&g=
t; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Wed, Jul 17, 2019 at 6:59 AM Alistair Francis &lt;<a href=
=3D"mailto:alistair23@gmail.com" target=3D"_blank">alistair23@gmail.com</a>=
&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Tue, Jul 16, 2019 at 2:50 PM Philippe Mathieu-Daud=C3=
=A9<br>
&gt;&gt; &gt;&gt; &lt;<a href=3D"mailto:philmd@redhat.com" target=3D"_blank=
">philmd@redhat.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; On 7/16/19 10:43 PM, Alistair Francis wrote:<br>
&gt;&gt; &gt;&gt; &gt; &gt; On Tue, Jul 16, 2019 at 6:56 AM Chih-Min Chao &=
lt;<a href=3D"mailto:chihmin.chao@sifive.com" target=3D"_blank">chihmin.cha=
o@sifive.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; On Tue, Jul 16, 2019 at 12:34 AM Alistair F=
rancis &lt;<a href=3D"mailto:alistair23@gmail.com" target=3D"_blank">alista=
ir23@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; On Mon, Jul 15, 2019 at 6:02 AM Philipp=
e Mathieu-Daud=C3=A9<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; &lt;<a href=3D"mailto:philmd@redhat.com=
" target=3D"_blank">philmd@redhat.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt; On 7/15/19 1:09 PM, Chih-Min Chao w=
rote:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; On Mon, Jul 15, 2019 at 5:15 PM=
 Philippe Mathieu-Daud=C3=A9<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:philmd@re=
dhat.com" target=3D"_blank">philmd@redhat.com</a> &lt;mailto:<a href=3D"mai=
lto:philmd@redhat.com" target=3D"_blank">philmd@redhat.com</a>&gt;&gt; wrot=
e:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0On 7/15/19 1=
1:08 AM, Chih-Min Chao wrote:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Similar=
 to the mips + malta test, it boots a Linux kernel on a virt<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; board a=
nd verify the serial is working.=C2=A0 Also, it relies on the serial<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; device =
set by the machine itself.<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; If risc=
v64 is a target being built, &quot;make check-acceptance&quot; will<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; automat=
ically include this test by the use of the &quot;arch:riscv64&quot; tags.<b=
r>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Alterna=
tively, this test can be run using:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0$ avocado run -t arch:riscv64 tests/acceptance<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; package=
s<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0debian official<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0binutils-riscv64-linux-gnu_2.32-8<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0opensbi_0.4-1_all<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0linux-image-4.19.0-5-riscv64 4.19.37-4<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0third-party<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 <a href=3D"=
https://github.com/groeck/linux-build-test/rootfs/riscv64/rootfs.cpio.gz" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/groeck/linux-build-t=
est/rootfs/riscv64/rootfs.cpio.gz</a><br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0(the repo is also used in mips target acceptance)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-=
off-by: Chih-Min Chao &lt;<a href=3D"mailto:chihmin.chao@sifive.com" target=
=3D"_blank">chihmin.chao@sifive.com</a><br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<=
a href=3D"mailto:chihmin.chao@sifive.com" target=3D"_blank">chihmin.chao@si=
five.com</a>&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 .=
travis.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 t=
ests/acceptance/boot_linux_console.py | 66<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0++++++++++++=
++++++++++++++++++++++<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 2=
 files changed, 67 insertions(+), 1 deletion(-)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --=
git a/.travis.yml b/.travis.yml<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; index 5=
d3d6ee..21fcead 100644<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- a/.=
travis.yml<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/.=
travis.yml<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -232=
,7 +232,7 @@ matrix:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 # Acceptance (Functional) tests<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 - env:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 - CONFIG=3D&quot;--python=3D/usr/bin/python3<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0--target-lis=
t=3Dx86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-softmmu,arm-softmm=
u,s390x-softmmu,alpha-softmmu&quot;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 - CONFIG=3D&quot;--python=3D/usr/bin/python3<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0--target-lis=
t=3Dx86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-softmmu,arm-softmm=
u,s390x-softmmu,alpha-softmmu,riscv64-softmmu&quot;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - TEST_CMD=3D&quot;make check-acceptance&quot;<=
br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 after_failure:<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - cat tests/results/latest/job.log<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --=
git a/tests/acceptance/boot_linux_console.py<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0b/tests/acce=
ptance/boot_linux_console.py<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; index 3=
215950..0f638bc 100644<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- a/t=
ests/acceptance/boot_linux_console.py<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/t=
ests/acceptance/boot_linux_console.py<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -354=
,3 +354,69 @@ class BootLinuxConsole(Test):<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.launch()<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 console_pattern =3D &#39;Kernel command line: %=
s&#39; %<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0kernel_comma=
nd_line<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.wait_for_console_pattern(console_pattern)<=
br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 def test_riscv64_virt(self):<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Darch:riscv64<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Dmachine:virt<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 deb_url =3D (&#39;<a href=3D"https://snapshot.debian.=
org/archive/debian/" rel=3D"noreferrer" target=3D"_blank">https://snapshot.=
debian.org/archive/debian/</a>&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;20190424T171759Z/pool/main/b/binutils/&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &#39;binuti=
ls-riscv64-linux-gnu_2.32-8_amd64.deb&#39;)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 deb_hash =3D (&#39;7fe376fd4452696c03acd508d6d613ca55=
3ea15e&#39;)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 deb_path =3D self.fetch_asset(deb_url, asset_hash=3Dd=
eb_hash)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 objcopy_path =3D &#39;/usr/bin/riscv64-linux-gnu-objc=
opy&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 objcopy_path =3D self.extract_from_deb(deb_path, objc=
opy_path)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 libbfd_path =3D<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&#39;/usr/li=
b/x86_64-linux-gnu/<a href=3D"http://libbfd-2.32-riscv64.so" rel=3D"norefer=
rer" target=3D"_blank">libbfd-2.32-riscv64.so</a><br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=
=3D"http://libbfd-2.32-riscv64.so" rel=3D"noreferrer" target=3D"_blank">htt=
p://libbfd-2.32-riscv64.so</a>&gt;&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 libbfd_path =3D self.extract_from_deb(deb_path, libbf=
d_path)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 process.run(&#39;ls -al %s&#39; % (objcopy_path))<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 deb_url =3D (&#39;<a href=3D"https://snapshot.debian.=
org/archive/debian/" rel=3D"noreferrer" target=3D"_blank">https://snapshot.=
debian.org/archive/debian/</a>&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;2019070=
8T032337Z/pool/main/o/opensbi/&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;opensbi=
_0.4-1_all.deb&#39;)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 deb_hash =3D (&#39;2319dcd702958291d323acf5649fd98a11=
d90112&#39;)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 deb_path =3D self.fetch_asset(deb_url, asset_hash=3Dd=
eb_hash)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 opensbi_path =3D (&#39;/usr/lib/riscv64-linux-gnu/ope=
nsbi/&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &#39;qemu/virt/fw_jump.elf&#39;)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 opensbi_path =3D self.extract_from_deb(deb_path, open=
sbi_path)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 deb_url =3D<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0(&#39;<a hre=
f=3D"https://snapshot.debian.org/archive/debian-ports/" rel=3D"noreferrer" =
target=3D"_blank">https://snapshot.debian.org/archive/debian-ports/</a>&#39=
;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;2019062=
0T095935Z/pool-riscv64/main/l/linux/&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &#39;linux-=
image-4.19.0-5-riscv64_4.19.37-4_riscv64.deb&#39;)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 deb_hash =3D (&#39;bf5b5680c41d92134d22caef4fbd277c52=
17e1f0&#39;)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 deb_path =3D self.fetch_asset(deb_url, asset_hash=3Dd=
eb_hash)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 kernel_path =3D &#39;/boot/vmlinux-4.19.0-5-riscv64&#=
39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 kernel_path =3D self.extract_from_deb(deb_path, kerne=
l_path)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 kimage_path =3D self.workdir + &quot;/Image&quot;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 env =3D os.environ<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 env[&#39;LD_LIBRARY_PATH&#39;] =3D (&#39;%s:&#39; %<b=
r>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0(os.path.dir=
name(libbfd_path)) +<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env.get(&#39;LD_LIBRARY_PATH&#39;, &#=
39;&#39;))<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 process.run((&#39;%s -O binary -O binary -R&#39;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;=
.note -R .note.gnu.build-id -R .comment -S<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0%s %s&#39;) =
%<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(objc=
opy_path, kernel_path, kimage_path))<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0Please expla=
in why you need to do that...<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0Also note th=
ese tests are run on other host architecture than x86, at<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0least ppc64/=
s390x (so this won&#39;t work there).<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; it is because riscv64 vmlinux d=
oesn&#39;t have physical loading address<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; information and<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; depends on certain stage bootlo=
ader to move kernel raw data to specific<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; physical address (0x8020_0000)<=
br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; The vmlinux program headers are=
<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0Type=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Offset=C2=A0 =C2=A0 =C2=A0 =C2=A0VirtAddr=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PhysAddr<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0FileSiz=C2=
=A0 MemSiz=C2=A0 =C2=A0Flg Align<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0LOAD=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00x001000 0xffffffe000000000 0x0000000000000000 0=
x0303a6<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; 0x0303a6 R E 0x1000<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0LOAD=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00x032000 0xffffffe000031000 0x0000000000031000 0=
x828f0c<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; 0x828f0c RWE 0x1000<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0NOTE=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A00x85aec0 0xffffffe000859ec0 0x0000000000859ec0 0=
x00004c<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; 0x00004c R=C2=A0 =C2=A00x4<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; For legacy bootloader, bbl, It =
can handle payload in ELF format.<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; However, for the newer OpenSBI,=
 it can only handle raw data and<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;&gt; debian doesn&#39;t provide linu=
x image in raw data format.<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; This doesn&#39;t sound right. You shoul=
d just be able to say -kernel<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; &lt;anything&gt; and it should work. It=
 has worked for me with vmlinux and<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; Image files when using master (not the =
4.0 release but master/4.1).<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; Although all of my testing was with the=
 5.1 kernel, so maybe there is<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; a difference there?<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; What isn&#39;t working for you? Can you=
 include the errors and output of -d in_asm?<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; Alistair<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt; Hi Alistair,<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 I have come across error befor=
e starting target simulation.=C2=A0 What I means is to execute<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0qemu-system-riscv64 -M virt -m 256M -nographic -bios ./opensbi/build/=
platform/qemu/virt/firmware/fw_jump.elf -kernel vmlinux<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 then get the error message<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0rom: requested regions overlap (rom mrom.reset. free=3D0x000000000001=
eb7c, addr=3D0x0000000000001000)<br>
&gt;&gt; &gt;&gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0qemu-system-riscv64: rom check and register reset failed<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; Hmmm.... I don&#39;t remember seeing this probl=
em in my testing, but it<br>
&gt;&gt; &gt;&gt; &gt; &gt; does seem to make sense.<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; We have two options here:<br>
&gt;&gt; &gt;&gt; &gt; &gt; 1. Use the Image file from Linux 5.0+ (my prefe=
rred option as 4.19 is<br>
&gt;&gt; &gt;&gt; &gt; &gt; getting old)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 I choose 4.19 version rather than 5.0+=C2=A0 because 4.=
19 is stable branch maintained by Greg.<br>
&gt;&gt; &gt;=C2=A0 But it is ok to use 5.0 trunk, the latest version provi=
ded by debian.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; 2. Use the device loader (documented here:<br>
&gt;&gt; &gt;&gt; &gt; &gt; <a href=3D"https://github.com/riscv/opensbi/blo=
b/master/docs/platform/qemu_virt.md" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/riscv/opensbi/blob/master/docs/platform/qemu_virt.md</a>)=
<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The document describes two user cases<br>
&gt;&gt; &gt;=C2=A0 =C2=A01. fw_payload.elf<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0a. include the Image (raw data file=
, not elf)=C2=A0 into data section<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0b. -kernel load the each part to th=
e correct address<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 the program header of=C2=A0 fw_payload.el=
f are<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 Type=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Offset=C2=A0 =C2=A0VirtAddr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0P=
hysAddr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FileSiz=C2=A0 MemSiz=C2=A0 =
=C2=A0Flg Align<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0LOAD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00x0000b0 0x0000000080000000 0x0000000080000000 0x00a008 0x00b0b8 RWE 0x1=
0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;-=C2=A0 fw_payl=
oad=C2=A0 main program<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0LOAD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00x00a0b8 0x0000000080200000 0x0000000080200000 0x8dbe20 0x8dbe20 R E 0x1=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;-=
=C2=A0 arch/riscv/boot/Image=C2=A0 =C2=A0or u-boot.bin<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A02. fw_jump.elf<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0a. use=C2=A0 &quot;-kernel &lt;raw =
image&gt; or -device=C2=A0 loader,file=3D&lt;raw Image&gt;,addr=3D0x8020000=
0&quot; to load correct address<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0b. fw_jump.elf just jump to the ent=
ry address 0x80200000<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 The issues are<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 a. debian linux-image package only provides vmli=
nux.<br>
&gt;&gt;<br>
&gt;&gt; This can be fixed by upgrading the kernel version. Fedora should h=
ave<br>
&gt;&gt; a 5.2 kernel that you can use instead of Debian.<br>
&gt;&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 so I use objcopy in acceptance tes=
t<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 b. riscv64 vmlinux doesn&#39;t have correct Phys=
Addr and -kernel can&#39;t move data to expected address<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 explicit load the Image to specifi=
c<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -kernel raw_image=C2=
=A0 =C2=A0(if file is not elf or uImage,=C2=A0 riscv_kerner_loader treat it=
 is as raw image and place it at 0x8020_0000)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -device loader,file=
=3D&lt;raw_image&gt;,0x80200000=C2=A0 (do the same thing)<br>
&gt;&gt;<br>
&gt;&gt; Does the device loader not work?<br>
&gt;&gt;<br>
&gt;&gt; Alistair<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0The device loader works for &quot;Image&quot; case (raw da=
ta)<br>
&gt;=C2=A0 =C2=A0If the data is raw image,=C2=A0 for riscv_load_kernel impl=
ementation,=C2=A0 =C2=A0&quot;-kernel &lt;raw_image&gt;&quot; and=C2=A0 -de=
vice loader,file=3D&lt;raw_image&gt;,0x80200000=C2=A0 are the same.<br>
&gt;=C2=A0 =C2=A0They finally call &quot;load_image_targphys_as&quot;<br>
&gt;=C2=A0 =C2=A0The only difference is that target address is hardcoded or=
 feed from command line option.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0I don&#39;t prefe one than the other.=C2=A0 Both of them a=
re Ok to me.=C2=A0 I could refine that if one of them is more preferable.<b=
r>
<br>
I&#39;m a little confused with what you mean, so if you have something<br>
that will work just send a new version and we can discuss it there.<br>
<br>
PS: I&#39;m still in favour of just using a newer kernel and a Image file.<=
br>
<br>
Alistair<br>
<br></blockquote><div>=C2=A0ok, I will use the latest kernel available in D=
ebian package and refine the command in next version.</div><div>=C2=A0</div=
><div>chihmin.chao</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
&gt;<br>
&gt;<br>
&gt;=C2=A0 chihmin.chao<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0ELF should work only if it has correct loading in=
formation.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0chihmin.chao<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Nice doc, this example is exactly what I had in mind=
:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0qemu-system-riscv64 -M virt -m 256M -nog=
raphic \<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-kernel build/platf=
orm/qemu/virt/firmware/fw_jump.elf \<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-device<br>
&gt;&gt; &gt;&gt; &gt; loader,file=3D&lt;linux_build_directory&gt;/arch/ris=
cv/boot/Image,addr=3D0x80200000 \<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-drive file=3D&lt;p=
ath_to_linux_rootfs&gt;,format=3Draw,id=3Dhd0 \<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-device virtio-blk-=
device,drive=3Dhd0 \<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-append &quot;root=
=3D/dev/vda rw console=3DttyS0&quot;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; If the Image is an ELF, I assume we don&#39;t need t=
o specify the address,<br>
&gt;&gt; &gt;&gt; &gt; because the device loader knows how to parse this fo=
rmat. Again,<br>
&gt;&gt; &gt;&gt; &gt; Alistair is the expert ;)<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Yep, an elf should just work.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;=C2=A0 describe the issue above<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; If for some reason it only works with Linux 5.0+, le=
t&#39;s use these!<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Only 5.0+ builds an elf.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Alistair<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Regards,<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Phil.<br>
</blockquote></div></div>

--0000000000009df348058df7b16c--

