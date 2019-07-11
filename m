Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hlOHv-0006hm-0W
	for mharc-qemu-riscv@gnu.org; Wed, 10 Jul 2019 21:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45669)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chihmin.chao@sifive.com>) id 1hlOHr-0006cc-Jy
 for qemu-riscv@nongnu.org; Wed, 10 Jul 2019 21:54:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1hlOHp-0004WP-SK
 for qemu-riscv@nongnu.org; Wed, 10 Jul 2019 21:54:19 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:38906)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1hlOHp-0004Uo-LZ
 for qemu-riscv@nongnu.org; Wed, 10 Jul 2019 21:54:17 -0400
Received: by mail-wr1-x444.google.com with SMTP id g17so4405605wrr.5
 for <qemu-riscv@nongnu.org>; Wed, 10 Jul 2019 18:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/PMUVmrY2ARplVL3XfABugpLB3GvXOo7X/tk3K246JQ=;
 b=JriJHo/JZz4qvz6USRy5j5mGgTF5uQGUQmMt1kaVN6vLrBThlo3BYji9NU1mDyqGhM
 qJT7ZFQ8kpFK4jqPpTA7RnPSgoSTQsv+8O6Hp96NTqDz2j9GC6cecIDeJ6Olvy+Yj9eM
 1ImdEUA3AGUEFa3MqEOUORJQvffLV7LTH2czzYTX8z6b/Nbuytre+1MImPvVHf4urZmm
 WUmDJYx8DFco1DclCrnJL3WZLIV0MPS/LwSu8MfDlD6VBAgku5noB/j4YYHjiASGxREs
 HdOc+0D0ai8dg+4v9E7y4WUzG1sk47gaUoZXy/J4/y4AhGzlxA+DYS7FIfXNlxHH3Bo7
 TRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/PMUVmrY2ARplVL3XfABugpLB3GvXOo7X/tk3K246JQ=;
 b=GkD+nst7cgqUT2XFk3qB2xK/nZDxEV+fKCRQ6R3RClCX2ZcLuzODQZ2L9N0B/p3VaF
 1Hr8Dj3d/6GB9d5H3jZn5J5UGJgVXDIAWII9t21lmRLR0LebYjX+G3P9Pd4KriyXkv5I
 C8rxEA4M2X/puzL+QsSYhLYfTv6HQA/R7xtUXlQSFyGmoz0fZEHGcbcfZHQDqDrUBq6B
 cUp9rsxwShQTLGQqcHRisIvKaOpbIzMGpMWo7GSlUDwWceSxfrBqZoh0gGc0bRKSIoZT
 8NKmJQlIM1LxNcVuiXhOOLzwqL60AnRdUiz46NJWN9H3Y56jhhILPcwysRI6caZJfSa4
 HTXg==
X-Gm-Message-State: APjAAAXvcPTRDBJtA/jYszVQy043IfSP/QSpN7xoml8IRaFq5ZGilkg1
 I678JvLYtXkz+uRMQn3aLRtZJUFKhu1nng5RScO3ug==
X-Google-Smtp-Source: APXvYqy8Y8FhBsSPkVtTabs9pMRgRl+7o5RnarZdzIqAYODHWGdgFb0raXt3nOcPmIp2zoJlM/X3+P6nRGhjl4t/Ohk=
X-Received: by 2002:adf:de90:: with SMTP id w16mr655540wrl.217.1562810055423; 
 Wed, 10 Jul 2019 18:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <1562781026-27570-1-git-send-email-chihmin.chao@sifive.com>
 <CAKmqyKMHxX6dhopB8fxH31HGAQ3y-EvL+09jNvp3xMS-dxirQA@mail.gmail.com>
In-Reply-To: <CAKmqyKMHxX6dhopB8fxH31HGAQ3y-EvL+09jNvp3xMS-dxirQA@mail.gmail.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Thu, 11 Jul 2019 09:54:04 +0800
Message-ID: <CAEiOBXUZ51h165GMEJEyDhToD2op7Z6S86B+Wnt9taZ3Q2iGfA@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Cleber Rosa <crosa@redhat.com>, Caio Carrara <ccarrara@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000348ab5058d5e12cd"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
X-List-Received-Date: Thu, 11 Jul 2019 01:54:21 -0000

--000000000000348ab5058d5e12cd
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 11, 2019 at 2:53 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Wed, Jul 10, 2019 at 10:51 AM Chih-Min Chao <chihmin.chao@sifive.com>
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
> > Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
>
> Awesome! Thanks for the test case. This will help a lot with RISC-V
> regressions in QEMU.
>
> > ---
> >  tests/acceptance/boot_linux_console.py | 40
> ++++++++++++++++++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> >
> > diff --git a/tests/acceptance/boot_linux_console.py
> b/tests/acceptance/boot_linux_console.py
> > index 3215950..bbc6b06 100644
> > --- a/tests/acceptance/boot_linux_console.py
> > +++ b/tests/acceptance/boot_linux_console.py
> > @@ -354,3 +354,43 @@ class BootLinuxConsole(Test):
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
> > +
> > +        kernel_url = ('https://github.com/chihminchao/test-binary/raw/'
>
> These images need to be built with a standard build flow. Having them
> built from SiFive's custom scripts will make debugging problems in the
> future impossible. I'm also a little worried here about GPL
> violations, I'm not sure if it's enough to just point to a script SHA
> to meet GPL source disclosure. I know companies have huge headaches
> meeting GPL requirements so this seems too easy.
>

   I am not very familiar with this kind of binary and source license
conflict.
   Is it ok if I write a simple script with BSD license to build  kernel
and image from sifive's linux/buildroot repo and commit the script to my
test-binary repo ?

>
> > +
> '0b7787305d9e40815c05a805266cc74ff356239e/qemu/riscv64/'
> > +                      'bbl_w_kernel.gz')
>
> Don't use BBL, most people use OpenSBI now which is what we should be
> testing with.
>
   I will try to move to OpenSBI in next version. My environment is based
freedom-u-sdk and It still relays  on BBL. So ..:P

>
> > +        kernel_hash = 'c7f6cc7967975ad42dc61ee0535db01c9cbd0968'
> > +        kernel_path_gz = self.fetch_asset(kernel_url,
> asset_hash=kernel_hash)
> > +        kernel_path = self.workdir + "bbl_w_kernel"
> > +
> > +        with gzip.open(kernel_path_gz, 'rb') as f_in:
> > +            with open(kernel_path, 'wb') as f_out:
> > +                shutil.copyfileobj(f_in, f_out)
> > +
> > +        initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
> > +                      '8584a59ed9e5eb5ee7ca91f6d74bbb06619205b8/rootfs/'
> > +                      'riscv64/rootfs.cpio.gz')
>
> Same comment about build tools.
>
>
> Alistair
>
>     Got it

> > +        initrd_hash = 'f4867d263754961b6f626cdcdc0cb334c47e3b49'
> > +        initrd_path = self.fetch_asset(initrd_url,
> asset_hash=initrd_hash)
> > +
> > +        self.vm.set_machine('virt')
> > +        self.vm.set_console()
> > +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE
> > +                               + 'console=ttyS0 noreboot')
> > +        self.vm.add_args('-kernel', kernel_path,
> > +                         '-initrd', initrd_path,
> > +                         '-append', kernel_command_line)
> > +        self.vm.launch()
> > +        self.wait_for_console_pattern('Boot successful.')
> > +
> > +        self.exec_command_and_wait_for_pattern('cat /proc/cpuinfo',
> > +                                               'isa')
> > +        self.exec_command_and_wait_for_pattern('uname -a',
> > +                                               'sifive')
> > +        self.exec_command_and_wait_for_pattern('reboot',
> > +                                               'reboot: Restarting
> system')
> > --
> > 2.7.4
> >
> >
>

--000000000000348ab5058d5e12cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 11, 2019 at 2:53 AM Alistair =
Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Wed, Jul 10, 2019 at 10:51 AM Chih-Min Chao &lt;<a href=3D"mailto:chihmin.c=
hao@sifive.com" target=3D"_blank">chihmin.chao@sifive.com</a>&gt; wrote:<br=
>
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
&gt; Signed-off-by: Chih-Min Chao &lt;<a href=3D"mailto:chihmin.chao@sifive=
.com" target=3D"_blank">chihmin.chao@sifive.com</a>&gt;<br>
<br>
Awesome! Thanks for the test case. This will help a lot with RISC-V<br>
regressions in QEMU.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 tests/acceptance/boot_linux_console.py | 40 ++++++++++++++++++++=
++++++++++++++<br>
&gt;=C2=A0 1 file changed, 40 insertions(+)<br>
&gt;<br>
&gt; diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance=
/boot_linux_console.py<br>
&gt; index 3215950..bbc6b06 100644<br>
&gt; --- a/tests/acceptance/boot_linux_console.py<br>
&gt; +++ b/tests/acceptance/boot_linux_console.py<br>
&gt; @@ -354,3 +354,43 @@ class BootLinuxConsole(Test):<br>
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
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_url =3D (&#39;<a href=3D"https://g=
ithub.com/chihminchao/test-binary/raw/" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/chihminchao/test-binary/raw/</a>&#39;<br>
<br>
These images need to be built with a standard build flow. Having them<br>
built from SiFive&#39;s custom scripts will make debugging problems in the<=
br>
future impossible. I&#39;m also a little worried here about GPL<br>
violations, I&#39;m not sure if it&#39;s enough to just point to a script S=
HA<br>
to meet GPL source disclosure. I know companies have huge headaches<br>
meeting GPL requirements so this seems too easy.<br></blockquote><div><br><=
/div><div>=C2=A0 =C2=A0I am not very familiar with this kind of binary and =
source license conflict.=C2=A0</div><div>=C2=A0 =C2=A0Is it ok if I write a=
 simple script with BSD license to build=C2=A0 kernel and image from sifive=
&#39;s linux/buildroot repo and commit the script to my test-binary repo ?<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &#39;0b7787305d9e40815c05a805266cc74ff356239e/qemu/riscv64/&#39;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &#39;bbl_w_kernel.gz&#39;)<br>
<br>
Don&#39;t use BBL, most people use OpenSBI now which is what we should be<b=
r>
testing with.<br></blockquote><div>=C2=A0 =C2=A0I will try to move to OpenS=
BI in next version. My environment is based freedom-u-sdk and It still rela=
ys=C2=A0 on BBL. So ..:P=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_hash =3D &#39;c7f6cc7967975ad42dc6=
1ee0535db01c9cbd0968&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_path_gz =3D self.fetch_asset(kerne=
l_url, asset_hash=3Dkernel_hash)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_path =3D self.workdir + &quot;bbl_=
w_kernel&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with gzip.open(kernel_path_gz, &#39;rb&#3=
9;) as f_in:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(kernel_path, &#39=
;wb&#39;) as f_out:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copyfi=
leobj(f_in, f_out)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_url =3D (&#39;<a href=3D"https://g=
ithub.com/groeck/linux-build-test/raw/" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/groeck/linux-build-test/raw/</a>&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &#39;8584a59ed9e5eb5ee7ca91f6d74bbb06619205b8/rootfs/&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &#39;riscv64/rootfs.cpio.gz&#39;)<br>
<br>
Same comment about build tools.<br>
<br>
<br>
Alistair<br>
<br></blockquote><div>=C2=A0 =C2=A0 Got it=C2=A0=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-kernel&#39;, kerne=
l_path,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&#39;-initrd&#39;, initrd_path,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&#39;-append&#39;, kernel_command_line)<br>
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
=A0 =C2=A0 =C2=A0 =C2=A0&#39;sifive&#39;)<br>
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

--000000000000348ab5058d5e12cd--

