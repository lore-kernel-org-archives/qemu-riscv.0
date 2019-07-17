Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hncNe-0002XT-BF
	for mharc-qemu-riscv@gnu.org; Wed, 17 Jul 2019 01:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44376)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chihmin.chao@sifive.com>) id 1hncNZ-0002Un-GG
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2019 01:21:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1hncNW-0008JA-N9
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2019 01:21:25 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38129)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1hncNW-0008Hw-93
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2019 01:21:22 -0400
Received: by mail-wr1-x434.google.com with SMTP id g17so23252753wrr.5
 for <qemu-riscv@nongnu.org>; Tue, 16 Jul 2019 22:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PCImjgRifn1SwvlGL4zX8B1ThX4Nq2Y5ZjmlRwejJc4=;
 b=ZcSMLAkGw9vXo9BtPe4q5fsJziHFRvnelcEGMKvebb9mX2lmiNYbBaZ/+UGb3MqCI8
 lQFFUbeiHWKtkj/v3L2QCyUgSp+oY25pIKCcS8/elqO3BYndCffMKw7WwO4CLzXyvxXn
 7slqbdxfCfDnHcd8qs+drujtJOzoLqr61XQdcglI1iV8iI97M6Y182tJltBJkaSQSKNC
 lvtou4KE01rixxyrYJz1JfvXdNQWmDjEKs7cFAxSzWnpGmX6SFRqMjlUqnpvMA/E+pOh
 IG+4OfOqBJFpr7hcO2/hSAxPy0YWS8EZ5LJNr4PnoznPaU39dMyFJ/xLMLttEnhzCccR
 H+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PCImjgRifn1SwvlGL4zX8B1ThX4Nq2Y5ZjmlRwejJc4=;
 b=Fm/kKUD3mcLrrfm5VOECjdd1iTUqod02eG/Wo1sU8n2nOznKtfbFXTlVA0MLKiVrOx
 pDrptp2OUQx3lEikMexLjaJh8PPwXJ2PqiOCR8pRPwA+PjUyZt4rW8/tLdJLQuF+cfH5
 2NjGdyL+3Qd1OrxymSpavZxgokg86hJVF9F8d4Ek1doeCiU0+ReggvOB9C7sqp92FDox
 mvzF8zKEhsNQmwx7rqghirFrmg1bLiYjSLqohZtOMGvhDfmALem5a+dhLEFziKSRSR2Z
 RA3GfhzFTm08KfgDom61c/S8HL1WvWQj6ehYhHZGolqM1F6l34ZsTGWKbqxRNGCmMuEy
 wRIg==
X-Gm-Message-State: APjAAAVjgLX6kBnQIiJNO9iy9FlCYDwaKs98b47olyU7MXYO3vg2ZyXf
 TCOgcCzUII98vi9FBYRA7YSLDr5p/zRuNjGj1zrvhw==
X-Google-Smtp-Source: APXvYqw8irZ3ilOI07OTOdfPjxrOuMagT6v8TvaXAK4Kvqd9yPhhc4fwAa/1hBP3RIlnrHu7Bqk9AcDSzqr0CmSDXiQ=
X-Received: by 2002:adf:ecd0:: with SMTP id s16mr39619637wro.324.1563340880285; 
 Tue, 16 Jul 2019 22:21:20 -0700 (PDT)
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
In-Reply-To: <CAKmqyKPiDHrPVuz2P1n9_j170k2bSm=7uDKrQg-fAUhL1FQm9g@mail.gmail.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Wed, 17 Jul 2019 13:21:07 +0800
Message-ID: <CAEiOBXUXdyntjnt-bi9-wiO2mmpgVC8WpD9KnxWoDdP__71XXQ@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Fam Zheng <fam@euphon.net>, Alistair Francis <alistair@alistair23.me>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d52508058dd9a913"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::434
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
X-List-Received-Date: Wed, 17 Jul 2019 05:21:28 -0000

--000000000000d52508058dd9a913
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2019 at 6:59 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Tue, Jul 16, 2019 at 2:50 PM Philippe Mathieu-Daud=C3=A9
> <philmd@redhat.com> wrote:
> >
> > On 7/16/19 10:43 PM, Alistair Francis wrote:
> > > On Tue, Jul 16, 2019 at 6:56 AM Chih-Min Chao <chihmin.chao@sifive.co=
m>
> wrote:
> > >>
> > >>
> > >> On Tue, Jul 16, 2019 at 12:34 AM Alistair Francis <
> alistair23@gmail.com> wrote:
> > >>>
> > >>> On Mon, Jul 15, 2019 at 6:02 AM Philippe Mathieu-Daud=C3=A9
> > >>> <philmd@redhat.com> wrote:
> > >>>>
> > >>>> On 7/15/19 1:09 PM, Chih-Min Chao wrote:
> > >>>>> On Mon, Jul 15, 2019 at 5:15 PM Philippe Mathieu-Daud=C3=A9
> > >>>>> <philmd@redhat.com <mailto:philmd@redhat.com>> wrote:
> > >>>>>
> > >>>>>     On 7/15/19 11:08 AM, Chih-Min Chao wrote:
> > >>>>>     > Similar to the mips + malta test, it boots a Linux kernel o=
n
> a virt
> > >>>>>     > board and verify the serial is working.  Also, it relies on
> the serial
> > >>>>>     > device set by the machine itself.
> > >>>>>     >
> > >>>>>     > If riscv64 is a target being built, "make check-acceptance"
> will
> > >>>>>     > automatically include this test by the use of the
> "arch:riscv64" tags.
> > >>>>>     >
> > >>>>>     > Alternatively, this test can be run using:
> > >>>>>     >
> > >>>>>     >   $ avocado run -t arch:riscv64 tests/acceptance
> > >>>>>     >
> > >>>>>     > packages
> > >>>>>     >   debian official
> > >>>>>     >     binutils-riscv64-linux-gnu_2.32-8
> > >>>>>     >     opensbi_0.4-1_all
> > >>>>>     >     linux-image-4.19.0-5-riscv64 4.19.37-4
> > >>>>>     >   third-party
> > >>>>>     >
> > >>>>>
> https://github.com/groeck/linux-build-test/rootfs/riscv64/rootfs.cpio.gz
> > >>>>>     >     (the repo is also used in mips target acceptance)
> > >>>>>     >
> > >>>>>     > Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com
> > >>>>>     <mailto:chihmin.chao@sifive.com>>
> > >>>>>     > ---
> > >>>>>     >  .travis.yml                            |  2 +-
> > >>>>>     >  tests/acceptance/boot_linux_console.py | 66
> > >>>>>     ++++++++++++++++++++++++++++++++++
> > >>>>>     >  2 files changed, 67 insertions(+), 1 deletion(-)
> > >>>>>     >
> > >>>>>     > diff --git a/.travis.yml b/.travis.yml
> > >>>>>     > index 5d3d6ee..21fcead 100644
> > >>>>>     > --- a/.travis.yml
> > >>>>>     > +++ b/.travis.yml
> > >>>>>     > @@ -232,7 +232,7 @@ matrix:
> > >>>>>     >
> > >>>>>     >      # Acceptance (Functional) tests
> > >>>>>     >      - env:
> > >>>>>     > -        - CONFIG=3D"--python=3D/usr/bin/python3
> > >>>>>
>  --target-list=3Dx86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-sof=
tmmu,arm-softmmu,s390x-softmmu,alpha-softmmu"
> > >>>>>     > +        - CONFIG=3D"--python=3D/usr/bin/python3
> > >>>>>
>  --target-list=3Dx86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-sof=
tmmu,arm-softmmu,s390x-softmmu,alpha-softmmu,riscv64-softmmu"
> > >>>>>     >          - TEST_CMD=3D"make check-acceptance"
> > >>>>>     >        after_failure:
> > >>>>>     >          - cat tests/results/latest/job.log
> > >>>>>     > diff --git a/tests/acceptance/boot_linux_console.py
> > >>>>>     b/tests/acceptance/boot_linux_console.py
> > >>>>>     > index 3215950..0f638bc 100644
> > >>>>>     > --- a/tests/acceptance/boot_linux_console.py
> > >>>>>     > +++ b/tests/acceptance/boot_linux_console.py
> > >>>>>     > @@ -354,3 +354,69 @@ class BootLinuxConsole(Test):
> > >>>>>     >          self.vm.launch()
> > >>>>>     >          console_pattern =3D 'Kernel command line: %s' %
> > >>>>>     kernel_command_line
> > >>>>>     >          self.wait_for_console_pattern(console_pattern)
> > >>>>>     > +
> > >>>>>     > +    def test_riscv64_virt(self):
> > >>>>>     > +        """
> > >>>>>     > +        :avocado: tags=3Darch:riscv64
> > >>>>>     > +        :avocado: tags=3Dmachine:virt
> > >>>>>     > +        """
> > >>>>>     > +        deb_url =3D ('
> https://snapshot.debian.org/archive/debian/'
> > >>>>>     > +
>  '20190424T171759Z/pool/main/b/binutils/'
> > >>>>>     > +
> > >>>>>      'binutils-riscv64-linux-gnu_2.32-8_amd64.deb')
> > >>>>>     > +        deb_hash =3D
> ('7fe376fd4452696c03acd508d6d613ca553ea15e')
> > >>>>>     > +        deb_path =3D self.fetch_asset(deb_url,
> asset_hash=3Ddeb_hash)
> > >>>>>     > +        objcopy_path =3D '/usr/bin/riscv64-linux-gnu-objco=
py'
> > >>>>>     > +        objcopy_path =3D self.extract_from_deb(deb_path,
> objcopy_path)
> > >>>>>     > +        libbfd_path =3D
> > >>>>>     '/usr/lib/x86_64-linux-gnu/libbfd-2.32-riscv64.so
> > >>>>>     <http://libbfd-2.32-riscv64.so>'
> > >>>>>     > +        libbfd_path =3D self.extract_from_deb(deb_path,
> libbfd_path)
> > >>>>>     > +        process.run('ls -al %s' % (objcopy_path))
> > >>>>>     > +
> > >>>>>     > +        deb_url =3D ('
> https://snapshot.debian.org/archive/debian/'
> > >>>>>     > +                   '20190708T032337Z/pool/main/o/opensbi/'
> > >>>>>     > +                   'opensbi_0.4-1_all.deb')
> > >>>>>     > +        deb_hash =3D
> ('2319dcd702958291d323acf5649fd98a11d90112')
> > >>>>>     > +        deb_path =3D self.fetch_asset(deb_url,
> asset_hash=3Ddeb_hash)
> > >>>>>     > +        opensbi_path =3D
> ('/usr/lib/riscv64-linux-gnu/opensbi/'
> > >>>>>     > +                        'qemu/virt/fw_jump.elf')
> > >>>>>     > +        opensbi_path =3D self.extract_from_deb(deb_path,
> opensbi_path)
> > >>>>>     > +
> > >>>>>     > +        deb_url =3D
> > >>>>>     ('https://snapshot.debian.org/archive/debian-ports/'
> > >>>>>     > +
>  '20190620T095935Z/pool-riscv64/main/l/linux/'
> > >>>>>     > +
> > >>>>>      'linux-image-4.19.0-5-riscv64_4.19.37-4_riscv64.deb')
> > >>>>>     > +        deb_hash =3D
> ('bf5b5680c41d92134d22caef4fbd277c5217e1f0')
> > >>>>>     > +        deb_path =3D self.fetch_asset(deb_url,
> asset_hash=3Ddeb_hash)
> > >>>>>     > +        kernel_path =3D '/boot/vmlinux-4.19.0-5-riscv64'
> > >>>>>     > +        kernel_path =3D self.extract_from_deb(deb_path,
> kernel_path)
> > >>>>>     > +        kimage_path =3D self.workdir + "/Image"
> > >>>>>     > +        env =3D os.environ
> > >>>>>     > +        env['LD_LIBRARY_PATH'] =3D ('%s:' %
> > >>>>>     (os.path.dirname(libbfd_path)) +
> > >>>>>     > +                                 env.get('LD_LIBRARY_PATH'=
,
> ''))
> > >>>>>     > +        process.run(('%s -O binary -O binary -R'
> > >>>>>     > +                     '.note -R .note.gnu.build-id -R
> .comment -S
> > >>>>>     %s %s') %
> > >>>>>     > +                     (objcopy_path, kernel_path,
> kimage_path))
> > >>>>>
> > >>>>>     Please explain why you need to do that...
> > >>>>>
> > >>>>>     Also note these tests are run on other host architecture than
> x86, at
> > >>>>>     least ppc64/s390x (so this won't work there).
> > >>>>>
> > >>>>> it is because riscv64 vmlinux doesn't have physical loading addre=
ss
> > >>>>> information and
> > >>>>> depends on certain stage bootloader to move kernel raw data to
> specific
> > >>>>> physical address (0x8020_0000)
> > >>>>>
> > >>>>> The vmlinux program headers are
> > >>>>>   Type             Offset       VirtAddr                  PhysAdd=
r
> > >>>>>     FileSiz  MemSiz   Flg Align
> > >>>>>   LOAD           0x001000 0xffffffe000000000 0x0000000000000000
> 0x0303a6
> > >>>>> 0x0303a6 R E 0x1000
> > >>>>>   LOAD           0x032000 0xffffffe000031000 0x0000000000031000
> 0x828f0c
> > >>>>> 0x828f0c RWE 0x1000
> > >>>>>   NOTE           0x85aec0 0xffffffe000859ec0 0x0000000000859ec0
> 0x00004c
> > >>>>> 0x00004c R   0x4
> > >>>>>
> > >>>>> For legacy bootloader, bbl, It can handle payload in ELF format.
> > >>>>> However, for the newer OpenSBI, it can only handle raw data and
> > >>>>> debian doesn't provide linux image in raw data format.
> > >>>
> > >>> This doesn't sound right. You should just be able to say -kernel
> > >>> <anything> and it should work. It has worked for me with vmlinux an=
d
> > >>> Image files when using master (not the 4.0 release but master/4.1).
> > >>> Although all of my testing was with the 5.1 kernel, so maybe there =
is
> > >>> a difference there?
> > >>>
> > >>> What isn't working for you? Can you include the errors and output o=
f
> -d in_asm?
> > >>>
> > >>>
> > >>> Alistair
> > >>
> > >>
> > >> Hi Alistair,
> > >>    I have come across error before starting target simulation.  What
> I means is to execute
> > >>             qemu-system-riscv64 -M virt -m 256M -nographic -bios
> ./opensbi/build/platform/qemu/virt/firmware/fw_jump.elf -kernel vmlinux
> > >>    then get the error message
> > >>             rom: requested regions overlap (rom mrom.reset.
> free=3D0x000000000001eb7c, addr=3D0x0000000000001000)
> > >>             qemu-system-riscv64: rom check and register reset failed
> > >
> > > Hmmm.... I don't remember seeing this problem in my testing, but it
> > > does seem to make sense.
> > >
> > > We have two options here:
> > > 1. Use the Image file from Linux 5.0+ (my preferred option as 4.19 is
> > > getting old)
>
 I choose 4.19 version rather than 5.0+  because 4.19 is stable branch
maintained by Greg.
 But it is ok to use 5.0 trunk, the latest version provided by debian.


> > > 2. Use the device loader (documented here:
> > >
> https://github.com/riscv/opensbi/blob/master/docs/platform/qemu_virt.md)
>

The document describes two user cases
  1. fw_payload.elf
      a. include the Image (raw data file, not elf)  into data section
      b. -kernel load the each part to the correct address

     the program header of  fw_payload.elf are
     Type           Offset   VirtAddr           PhysAddr           FileSiz
 MemSiz   Flg Align
    LOAD           0x0000b0 0x0000000080000000 0x0000000080000000 0x00a008
0x00b0b8 RWE 0x10               <-  fw_payload  main program
    LOAD           0x00a0b8 0x0000000080200000 0x0000000080200000 0x8dbe20
0x8dbe20 R E 0x1                    <-  arch/riscv/boot/Image   or
u-boot.bin

  2. fw_jump.elf
      a. use  "-kernel <raw image> or -device  loader,file=3D<raw
Image>,addr=3D0x80200000" to load correct address
      b. fw_jump.elf just jump to the entry address 0x80200000


 The issues are
   a. debian linux-image package only provides vmlinux.
       so I use objcopy in acceptance test
   b. riscv64 vmlinux doesn't have correct PhysAddr and -kernel can't move
data to expected address
       explicit load the Image to specific
           -kernel raw_image   (if file is not elf or uImage,
riscv_kerner_loader treat it is as raw image and place it at 0x8020_0000)
           -device loader,file=3D<raw_image>,0x80200000  (do the same thing=
)

  ELF should work only if it has correct loading information.

  chihmin.chao

> >
> > Nice doc, this example is exactly what I had in mind:
> >
> >   qemu-system-riscv64 -M virt -m 256M -nographic \
> >         -kernel build/platform/qemu/virt/firmware/fw_jump.elf \
> >         -device
> >
> loader,file=3D<linux_build_directory>/arch/riscv/boot/Image,addr=3D0x8020=
0000 \
> >         -drive file=3D<path_to_linux_rootfs>,format=3Draw,id=3Dhd0 \
> >         -device virtio-blk-device,drive=3Dhd0 \
> >         -append "root=3D/dev/vda rw console=3DttyS0"
> >
> > If the Image is an ELF, I assume we don't need to specify the address,
> > because the device loader knows how to parse this format. Again,
> > Alistair is the expert ;)
>
> Yep, an elf should just work.
>
>  describe the issue above


> >
> > If for some reason it only works with Linux 5.0+, let's use these!
>
> Only 5.0+ builds an elf.
>
> Alistair
>
> >
> > Regards,
> >
> > Phil.
>

--000000000000d52508058dd9a913
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 17, 2019 at 6:59 AM Alist=
air Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Tue, Jul 16, 2019 at 2:50 PM Philippe Mathieu-Daud=C3=A9<br>
&lt;<a href=3D"mailto:philmd@redhat.com" target=3D"_blank">philmd@redhat.co=
m</a>&gt; wrote:<br>
&gt;<br>
&gt; On 7/16/19 10:43 PM, Alistair Francis wrote:<br>
&gt; &gt; On Tue, Jul 16, 2019 at 6:56 AM Chih-Min Chao &lt;<a href=3D"mail=
to:chihmin.chao@sifive.com" target=3D"_blank">chihmin.chao@sifive.com</a>&g=
t; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Tue, Jul 16, 2019 at 12:34 AM Alistair Francis &lt;<a href=
=3D"mailto:alistair23@gmail.com" target=3D"_blank">alistair23@gmail.com</a>=
&gt; wrote:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; On Mon, Jul 15, 2019 at 6:02 AM Philippe Mathieu-Daud=C3=
=A9<br>
&gt; &gt;&gt;&gt; &lt;<a href=3D"mailto:philmd@redhat.com" target=3D"_blank=
">philmd@redhat.com</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; On 7/15/19 1:09 PM, Chih-Min Chao wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt; On Mon, Jul 15, 2019 at 5:15 PM Philippe Mathieu-=
Daud=C3=A9<br>
&gt; &gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:philmd@redhat.com" target=
=3D"_blank">philmd@redhat.com</a> &lt;mailto:<a href=3D"mailto:philmd@redha=
t.com" target=3D"_blank">philmd@redhat.com</a>&gt;&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0On 7/15/19 11:08 AM, Chih-Min =
Chao wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Similar to the mips + mal=
ta test, it boots a Linux kernel on a virt<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; board and verify the seri=
al is working.=C2=A0 Also, it relies on the serial<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; device set by the machine=
 itself.<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; If riscv64 is a target be=
ing built, &quot;make check-acceptance&quot; will<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; automatically include thi=
s test by the use of the &quot;arch:riscv64&quot; tags.<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Alternatively, this test =
can be run using:<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0$ avocado run=
 -t arch:riscv64 tests/acceptance<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; packages<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0debian offici=
al<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0binuti=
ls-riscv64-linux-gnu_2.32-8<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0opensb=
i_0.4-1_all<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0linux-=
image-4.19.0-5-riscv64 4.19.37-4<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0third-party<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 <a href=3D"https://github.com=
/groeck/linux-build-test/rootfs/riscv64/rootfs.cpio.gz" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/groeck/linux-build-test/rootfs/riscv64=
/rootfs.cpio.gz</a><br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0(the r=
epo is also used in mips target acceptance)<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Chih-Min C=
hao &lt;<a href=3D"mailto:chihmin.chao@sifive.com" target=3D"_blank">chihmi=
n.chao@sifive.com</a><br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:c=
hihmin.chao@sifive.com" target=3D"_blank">chihmin.chao@sifive.com</a>&gt;&g=
t;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 .travis.yml=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 tests/acceptance/bo=
ot_linux_console.py | 66<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0++++++++++++++++++++++++++++++=
++++<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 2 files changed, 67=
 insertions(+), 1 deletion(-)<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/.travis.yml =
b/.travis.yml<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; index 5d3d6ee..21fcead 10=
0644<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- a/.travis.yml<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/.travis.yml<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -232,7 +232,7 @@ matri=
x:<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 # Acc=
eptance (Functional) tests<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 - env=
:<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 - CONFIG=3D&quot;--python=3D/usr/bin/python3<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0--target-list=3Dx86_64-softmmu=
,mips-softmmu,mips64el-softmmu,aarch64-softmmu,arm-softmmu,s390x-softmmu,al=
pha-softmmu&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 - CONFIG=3D&quot;--python=3D/usr/bin/python3<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0--target-list=3Dx86_64-softmmu=
,mips-softmmu,mips64el-softmmu,aarch64-softmmu,arm-softmmu,s390x-softmmu,al=
pha-softmmu,riscv64-softmmu&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 - TEST_CMD=3D&quot;make check-acceptance&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 after_failure:<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 - cat tests/results/latest/job.log<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/tests/accept=
ance/boot_linux_console.py<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0b/tests/acceptance/boot_linux_=
console.py<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; index 3215950..0f638bc 10=
0644<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- a/tests/acceptance/bo=
ot_linux_console.py<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/tests/acceptance/bo=
ot_linux_console.py<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -354,3 +354,69 @@ clas=
s BootLinuxConsole(Test):<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 self.vm.launch()<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 console_pattern =3D &#39;Kernel command line: %s&#39; %<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0kernel_command_line<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 self.wait_for_console_pattern(console_pattern)<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 def test_r=
iscv64_virt(self):<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;&quot;&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 :avocado: tags=3Darch:riscv64<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 :avocado: tags=3Dmachine:virt<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;&quot;&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 deb_url =3D (&#39;<a href=3D"https://snapshot.debian.org/archive/debian=
/" rel=3D"noreferrer" target=3D"_blank">https://snapshot.debian.org/archive=
/debian/</a>&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;2019=
0424T171759Z/pool/main/b/binutils/&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &#39;binutils-riscv64-linux-g=
nu_2.32-8_amd64.deb&#39;)<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 deb_hash =3D (&#39;7fe376fd4452696c03acd508d6d613ca553ea15e&#39;)<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 deb_path =3D self.fetch_asset(deb_url, asset_hash=3Ddeb_hash)<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 objcopy_path =3D &#39;/usr/bin/riscv64-linux-gnu-objcopy&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 objcopy_path =3D self.extract_from_deb(deb_path, objcopy_path)<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 libbfd_path =3D<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&#39;/usr/lib/x86_64-linux-gnu=
/<a href=3D"http://libbfd-2.32-riscv64.so" rel=3D"noreferrer" target=3D"_bl=
ank">libbfd-2.32-riscv64.so</a><br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://libbfd-2=
.32-riscv64.so" rel=3D"noreferrer" target=3D"_blank">http://libbfd-2.32-ris=
cv64.so</a>&gt;&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 libbfd_path =3D self.extract_from_deb(deb_path, libbfd_path)<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 process.run(&#39;ls -al %s&#39; % (objcopy_path))<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 deb_url =3D (&#39;<a href=3D"https://snapshot.debian.org/archive/debian=
/" rel=3D"noreferrer" target=3D"_blank">https://snapshot.debian.org/archive=
/debian/</a>&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;20190708T032337Z/pool/mai=
n/o/opensbi/&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;opensbi_0.4-1_all.deb&#39=
;)<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 deb_hash =3D (&#39;2319dcd702958291d323acf5649fd98a11d90112&#39;)<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 deb_path =3D self.fetch_asset(deb_url, asset_hash=3Ddeb_hash)<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 opensbi_path =3D (&#39;/usr/lib/riscv64-linux-gnu/opensbi/&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;qemu/virt/=
fw_jump.elf&#39;)<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 opensbi_path =3D self.extract_from_deb(deb_path, opensbi_path)<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 deb_url =3D<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0(&#39;<a href=3D"https://snaps=
hot.debian.org/archive/debian-ports/" rel=3D"noreferrer" target=3D"_blank">=
https://snapshot.debian.org/archive/debian-ports/</a>&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;20190620T095935Z/pool-ris=
cv64/main/l/linux/&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &#39;linux-image-4.19.0-5-ris=
cv64_4.19.37-4_riscv64.deb&#39;)<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 deb_hash =3D (&#39;bf5b5680c41d92134d22caef4fbd277c5217e1f0&#39;)<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 deb_path =3D self.fetch_asset(deb_url, asset_hash=3Ddeb_hash)<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel_path =3D &#39;/boot/vmlinux-4.19.0-5-riscv64&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel_path =3D self.extract_from_deb(deb_path, kernel_path)<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kimage_path =3D self.workdir + &quot;/Image&quot;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 env =3D os.environ<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 env[&#39;LD_LIBRARY_PATH&#39;] =3D (&#39;%s:&#39; %<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0(os.path.dirname(libbfd_path))=
 +<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0env.get(&#39;LD_LIBRARY_PATH&#39;, &#39;&#39;))<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 process.run((&#39;%s -O binary -O binary -R&#39;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;.note -R .note.gnu=
.build-id -R .comment -S<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0%s %s&#39;) %<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(objcopy_path, kernel_p=
ath, kimage_path))<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0Please explain why you need to=
 do that...<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0Also note these tests are run =
on other host architecture than x86, at<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0least ppc64/s390x (so this won=
&#39;t work there).<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; it is because riscv64 vmlinux doesn&#39;t have ph=
ysical loading address<br>
&gt; &gt;&gt;&gt;&gt;&gt; information and<br>
&gt; &gt;&gt;&gt;&gt;&gt; depends on certain stage bootloader to move kerne=
l raw data to specific<br>
&gt; &gt;&gt;&gt;&gt;&gt; physical address (0x8020_0000)<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; The vmlinux program headers are<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0Type=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0Offset=C2=A0 =C2=A0 =C2=A0 =C2=A0VirtAddr=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PhysAddr<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0FileSiz=C2=A0 MemSiz=C2=A0 =C2=
=A0Flg Align<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0LOAD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x001000 0xffffffe000000000 0x0000000000000000 0x0303a6<br>
&gt; &gt;&gt;&gt;&gt;&gt; 0x0303a6 R E 0x1000<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0LOAD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x032000 0xffffffe000031000 0x0000000000031000 0x828f0c<br>
&gt; &gt;&gt;&gt;&gt;&gt; 0x828f0c RWE 0x1000<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0NOTE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x85aec0 0xffffffe000859ec0 0x0000000000859ec0 0x00004c<br>
&gt; &gt;&gt;&gt;&gt;&gt; 0x00004c R=C2=A0 =C2=A00x4<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; For legacy bootloader, bbl, It can handle payload=
 in ELF format.<br>
&gt; &gt;&gt;&gt;&gt;&gt; However, for the newer OpenSBI, it can only handl=
e raw data and<br>
&gt; &gt;&gt;&gt;&gt;&gt; debian doesn&#39;t provide linux image in raw dat=
a format.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; This doesn&#39;t sound right. You should just be able to =
say -kernel<br>
&gt; &gt;&gt;&gt; &lt;anything&gt; and it should work. It has worked for me=
 with vmlinux and<br>
&gt; &gt;&gt;&gt; Image files when using master (not the 4.0 release but ma=
ster/4.1).<br>
&gt; &gt;&gt;&gt; Although all of my testing was with the 5.1 kernel, so ma=
ybe there is<br>
&gt; &gt;&gt;&gt; a difference there?<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; What isn&#39;t working for you? Can you include the error=
s and output of -d in_asm?<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Alistair<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Hi Alistair,<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 I have come across error before starting target =
simulation.=C2=A0 What I means is to execute<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu-system-ri=
scv64 -M virt -m 256M -nographic -bios ./opensbi/build/platform/qemu/virt/f=
irmware/fw_jump.elf -kernel vmlinux<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 then get the error message<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rom: requested=
 regions overlap (rom mrom.reset. free=3D0x000000000001eb7c, addr=3D0x00000=
00000001000)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu-system-ri=
scv64: rom check and register reset failed<br>
&gt; &gt;<br>
&gt; &gt; Hmmm.... I don&#39;t remember seeing this problem in my testing, =
but it<br>
&gt; &gt; does seem to make sense.<br>
&gt; &gt;<br>
&gt; &gt; We have two options here:<br>
&gt; &gt; 1. Use the Image file from Linux 5.0+ (my preferred option as 4.1=
9 is<br>
&gt; &gt; getting old)<br></blockquote><div>=C2=A0I choose 4.19 version rat=
her than 5.0+=C2=A0 because 4.19 is stable branch maintained by Greg.</div>=
<div>=C2=A0But it is ok to use 5.0 trunk, the latest version provided by de=
bian.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
&gt; &gt; 2. Use the device loader (documented here:<br>
&gt; &gt; <a href=3D"https://github.com/riscv/opensbi/blob/master/docs/plat=
form/qemu_virt.md" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
riscv/opensbi/blob/master/docs/platform/qemu_virt.md</a>)<br></blockquote><=
div><br></div><div>The document describes two user cases<br></div><div>=C2=
=A0 1. fw_payload.elf</div><div>=C2=A0 =C2=A0 =C2=A0 a. include the Image (=
raw data file, not elf)=C2=A0 into data section</div><div>=C2=A0 =C2=A0 =C2=
=A0 b. -kernel load the each part to the correct address=C2=A0</div><div><b=
r></div><div>=C2=A0 =C2=A0 =C2=A0the program header of=C2=A0 fw_payload.elf=
 are</div><div>=C2=A0 =C2=A0 =C2=A0Type =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
Offset =C2=A0 VirtAddr =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PhysAddr =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 FileSiz =C2=A0MemSiz =C2=A0 Flg Align</div>=C2=
=A0 =C2=A0 LOAD =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0000b0 0x0000000080000=
000 0x0000000080000000 0x00a008 0x00b0b8 RWE 0x10=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;-=C2=A0 fw_payload=C2=A0 main program<br=
>=C2=A0 =C2=A0 LOAD =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00a0b8 0x000000008=
0200000 0x0000000080200000 0x8dbe20 0x8dbe20 R E 0x1=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;-=C2=A0 arch/riscv/boo=
t/Image=C2=A0 =C2=A0or u-boot.bin=C2=A0<br><br>=C2=A0 2. fw_jump.elf</div><=
div class=3D"gmail_quote">=C2=A0 =C2=A0 =C2=A0 a. use=C2=A0 &quot;-kernel &=
lt;raw image&gt; or -device=C2=A0 loader,file=3D&lt;raw Image&gt;,addr=3D0x=
80200000&quot; to load correct address</div><div class=3D"gmail_quote">=C2=
=A0 =C2=A0 =C2=A0 b. fw_jump.elf just jump to the entry address 0x80200000<=
/div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote"><br></=
div><div class=3D"gmail_quote">=C2=A0The issues are<br></div><div class=3D"=
gmail_quote">=C2=A0 =C2=A0a. debian linux-image package only provides vmlin=
ux.=C2=A0</div><div class=3D"gmail_quote">=C2=A0 =C2=A0 =C2=A0 =C2=A0so I u=
se objcopy in acceptance test</div><div class=3D"gmail_quote">=C2=A0 =C2=A0=
b. riscv64 vmlinux doesn&#39;t have correct PhysAddr and -kernel can&#39;t =
move data to expected address</div><div class=3D"gmail_quote">=C2=A0 =C2=A0=
 =C2=A0 =C2=A0explicit load the Image to specific</div><div class=3D"gmail_=
quote">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-kernel raw_image=C2=A0 =C2=
=A0(if file is not elf or uImage,=C2=A0 riscv_kerner_loader treat it is as =
raw image and place it at 0x8020_0000)</div><div class=3D"gmail_quote">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-device loader,file=3D&lt;raw_image&g=
t;,0x80200000=C2=A0 (do the same thing)</div><div class=3D"gmail_quote"><br=
></div><div class=3D"gmail_quote">=C2=A0 ELF should work only if it has cor=
rect loading information.</div><div class=3D"gmail_quote">=C2=A0 =C2=A0 =C2=
=A0</div><div class=3D"gmail_quote">=C2=A0 chihmin.chao</div><div class=3D"=
gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; Nice doc, this example is exactly what I had in mind:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0qemu-system-riscv64 -M virt -m 256M -nographic \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-kernel build/platform/qemu/virt/firm=
ware/fw_jump.elf \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-device<br>
&gt; loader,file=3D&lt;linux_build_directory&gt;/arch/riscv/boot/Image,addr=
=3D0x80200000 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-drive file=3D&lt;path_to_linux_rootf=
s&gt;,format=3Draw,id=3Dhd0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-device virtio-blk-device,drive=3Dhd0=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-append &quot;root=3D/dev/vda rw cons=
ole=3DttyS0&quot;<br>
&gt;<br>
&gt; If the Image is an ELF, I assume we don&#39;t need to specify the addr=
ess,<br>
&gt; because the device loader knows how to parse this format. Again,<br>
&gt; Alistair is the expert ;)<br>
<br>
Yep, an elf should just work.<br>
<br></blockquote><div>=C2=A0describe the issue above</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; If for some reason it only works with Linux 5.0+, let&#39;s use these!=
<br>
<br>
Only 5.0+ builds an elf.<br>
<br>
Alistair<br>
<br>
&gt;<br>
&gt; Regards,<br>
&gt;<br>
&gt; Phil.<br>
</blockquote></div></div>

--000000000000d52508058dd9a913--

