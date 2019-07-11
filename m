Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hlaJH-0006Ef-PC
	for mharc-qemu-riscv@gnu.org; Thu, 11 Jul 2019 10:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39139)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hlaJF-0006Bu-6T
 for qemu-riscv@nongnu.org; Thu, 11 Jul 2019 10:44:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hlaJB-0004rH-0M
 for qemu-riscv@nongnu.org; Thu, 11 Jul 2019 10:44:32 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:44151)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hlaIz-0004VM-7B; Thu, 11 Jul 2019 10:44:17 -0400
Received: by mail-lj1-x242.google.com with SMTP id k18so6047218ljc.11;
 Thu, 11 Jul 2019 07:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vJdAIDv5lZoN0pC8IEvxD0WKhE2o9SWm8zCJ5Z2I3cs=;
 b=gZYC0cL2fR9hLbCo2u1KOM991sYZvSygakkChf+Iz5W70y2508CvUjBFqAWSga1VZf
 RXFdn6EsbdRqvUsmv+5INWPZ87NHgm8Ubn1ks7HzyqRvqG2oFwkX/IVPCVc7s7G3naIu
 9RtdbJ9netQnAPuis7Rox9PaAc93UTQALGcys6YJKRL2yA6P5ghDIPfWcjeLCZuq8ljZ
 RzKhERca8aQKjNW1PPuo4tBQxLTcnpzB1MMykjP6c6Yn/YMDmRc0qrk2crjEfC4XFkrP
 CsrbSD+eUnN0x3sgn5yb7GgJ7e0mmXny1/um7v/3CfMKzBGtAN67IzFcO0r8rFdFACLG
 SmZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vJdAIDv5lZoN0pC8IEvxD0WKhE2o9SWm8zCJ5Z2I3cs=;
 b=uAfnf0Fpx2RRth41vPYhvcPmfSabanCNO4+aGdKuo/Kq9V9I9A7WmRhSIWHUPRYTti
 4yuUM6rKCOB53up0Vm48GX/caAoU7CRoXapjmzMfM+UHuG4m6yMoVeMx0MsitWmkraav
 rdx3Vqtfo8ZZGEkXdP1lUo+/rYi0yy/DO6DIwW4uMJ0WVEwX+tbxBSAdf0IiCOqaAg9/
 zbIUJgvjwLPpwmpdhfnmdLSra9wOCEAB7LcDLAEZRfJIdipvX9OF/rjZv2kbvCJbwNcK
 dAYOgJKq8AbUkdBb3CmKseAGLWba7bwfMMuukzaJXUaETDFqG04uXQfIWNVbmZHRJxfy
 R0aQ==
X-Gm-Message-State: APjAAAWXAcBEeMTppr/NpVG6bH/pK0ts9gI6Lr+jsknn+At+k2d97BEn
 Zdu/v8VIwc1pn9P9mCnSQTv/IrqDm4EY0sZDdgo=
X-Google-Smtp-Source: APXvYqwraJrCHptNgiF3E/xUwl+1YyewmgaQI2XiYc9hDuQdMzlcJO5CkspX++xjaNaGZ6bU7f7zvlhujbUhUXC1Id8=
X-Received: by 2002:a2e:3604:: with SMTP id d4mr2751603lja.85.1562856254240;
 Thu, 11 Jul 2019 07:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <1562781026-27570-1-git-send-email-chihmin.chao@sifive.com>
 <57c27698-c9ee-72f9-7074-0c0eee2ab275@redhat.com>
In-Reply-To: <57c27698-c9ee-72f9-7074-0c0eee2ab275@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 11 Jul 2019 07:43:47 -0700
Message-ID: <CAKmqyKNbPs9d3_BCkB2=E21TgWdTeTd5K=cZxQhAoCs3TZJkqA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Chih-Min Chao <chihmin.chao@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Cleber Rosa <crosa@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>, Caio Carrara <ccarrara@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] tests/boot_linux_console: add
 a test for riscv64 + virt
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
X-List-Received-Date: Thu, 11 Jul 2019 14:44:35 -0000

On Thu, Jul 11, 2019 at 6:56 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Hi Chih-Min,
>
> On 7/10/19 7:50 PM, Chih-Min Chao wrote:
> > Similar to the mips + malta test, it boots a Linux kernel on a virt
> > board and verify the serial is working.  Also, it relies on the serial
> > device set by the machine itself.
>
> Good idea!
>
> >
> > If riscv64 is a target being built, "make check-acceptance" will
> > automatically include this test by the use of the "arch:riscv64" tags.
> >
> > Alternatively, this test can be run using:
> >
> >   $ avocado run -t arch:riscv64 tests/acceptance
> >
> > Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
> > ---
> >  tests/acceptance/boot_linux_console.py | 40 ++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 40 insertions(+)
> >
> > diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/=
boot_linux_console.py
> > index 3215950..bbc6b06 100644
> > --- a/tests/acceptance/boot_linux_console.py
> > +++ b/tests/acceptance/boot_linux_console.py
> > @@ -354,3 +354,43 @@ class BootLinuxConsole(Test):
> >          self.vm.launch()
> >          console_pattern =3D 'Kernel command line: %s' % kernel_command=
_line
> >          self.wait_for_console_pattern(console_pattern)
> > +
> > +    def test_riscv64_virt(self):
> > +        """
> > +        :avocado: tags=3Darch:riscv64
> > +        :avocado: tags=3Dmachine:virt
> > +        """
> > +
> > +        kernel_url =3D ('https://github.com/chihminchao/test-binary/ra=
w/'
> > +                      '0b7787305d9e40815c05a805266cc74ff356239e/qemu/r=
iscv64/'
> > +                      'bbl_w_kernel.gz')
>
> I recommend you to extract fw_jump.elf from [1] and
> vmlinux-4.19.0-5-riscv64 from [2] with the extract_from_deb() helper.
>
> [1] https://packages.debian.org/sid/all/opensbi
> [2] https://packages.debian.org/sid/linux-image-4.19.0-5-riscv64

This will works as well if you don't want to bother building the
images yourself. Ideally we could use a newer kernel then 4.19 but for
an acceptance test it probably doesn't matter much.

This way Debain has done all the licence work for you as well :)

Alistair

>
> > +        kernel_hash =3D 'c7f6cc7967975ad42dc61ee0535db01c9cbd0968'
> > +        kernel_path_gz =3D self.fetch_asset(kernel_url, asset_hash=3Dk=
ernel_hash)
> > +        kernel_path =3D self.workdir + "bbl_w_kernel"
> > +
> > +        with gzip.open(kernel_path_gz, 'rb') as f_in:
> > +            with open(kernel_path, 'wb') as f_out:
> > +                shutil.copyfileobj(f_in, f_out)
> > +
> > +        initrd_url =3D ('https://github.com/groeck/linux-build-test/ra=
w/'
> > +                      '8584a59ed9e5eb5ee7ca91f6d74bbb06619205b8/rootfs=
/'
> > +                      'riscv64/rootfs.cpio.gz')
> > +        initrd_hash =3D 'f4867d263754961b6f626cdcdc0cb334c47e3b49'
> > +        initrd_path =3D self.fetch_asset(initrd_url, asset_hash=3Dinit=
rd_hash)
> > +
> > +        self.vm.set_machine('virt')
> > +        self.vm.set_console()
> > +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE
> > +                               + 'console=3DttyS0 noreboot')
> > +        self.vm.add_args('-kernel', kernel_path,
> > +                         '-initrd', initrd_path,
> > +                         '-append', kernel_command_line)
>
> You might want to use '-no-reboot' here too.
>
> > +        self.vm.launch()
> > +        self.wait_for_console_pattern('Boot successful.')
> > +
> > +        self.exec_command_and_wait_for_pattern('cat /proc/cpuinfo',
> > +                                               'isa')
> > +        self.exec_command_and_wait_for_pattern('uname -a',
> > +                                               'sifive')
> > +        self.exec_command_and_wait_for_pattern('reboot',
> > +                                               'reboot: Restarting sys=
tem')
>
> Regards,
>
> Phil.
>

