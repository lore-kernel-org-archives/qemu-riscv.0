Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hlOOl-00007k-42
	for mharc-qemu-riscv@gnu.org; Wed, 10 Jul 2019 22:01:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47215)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chihmin.chao@sifive.com>) id 1hlOOh-00007V-KD
 for qemu-riscv@nongnu.org; Wed, 10 Jul 2019 22:01:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1hlOOf-0003mq-RK
 for qemu-riscv@nongnu.org; Wed, 10 Jul 2019 22:01:23 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:33754)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1hlOOf-0003kN-Gr
 for qemu-riscv@nongnu.org; Wed, 10 Jul 2019 22:01:21 -0400
Received: by mail-wr1-x443.google.com with SMTP id n9so4452510wru.0
 for <qemu-riscv@nongnu.org>; Wed, 10 Jul 2019 19:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5TTaTki2tup5KxExleASJIms4bOIFX2L1BqPPpmqnOM=;
 b=QCtCZqAqabZpjWs/zVTXNEMHKHevkSYvPYfvLwJpjMSOBwOe11KXwXueRo9xvB0PFo
 LlhrCOyVJ0E0vl/c2u74TZVXZ9AxWqdR07bAjBp2WdF65fn9d/B6YsOmB6QiGLu1mIgi
 vzTZyjj+Xi1wJwJUDHD2WV9X7bOxTqEyuWwDYyeWkIv+znzHrQeUhs5TjnyYQKFQDGso
 Tnwz8PIbDaZm0WIpW9X8ZxrZnhQxFX37y0gh4hWgnNIskYoL6KjoZBw8XTxsx6JoxBD7
 EUwlcf+IW7EHbEgjD9iKk9Dvj2emKUy3wRijqI40SUsHuwlwK5O5d2yU07NznlKzr83X
 uu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5TTaTki2tup5KxExleASJIms4bOIFX2L1BqPPpmqnOM=;
 b=rywW8/hMH8OxyaieGCtKlNqCHBCeA6UON1MpteZZz4sAvLoBrDJkvkzVOZ4muJihPS
 uS4c5N1H5d2eQK/oNrJWdt8LFwDNl/9a+LO3KdXxNgqa/M3GJm4WTqJPbqtnCBrn94+o
 0i0kmkh0NSXXHfi21h3Qi/WdVcrMips2F96hi55eXt1oxOYkhYur+6s1zsBY+1Bow6Po
 hGAE3pgSBIvseZv9pAQ2ftH4QUiNX3ztkKMebD1BXTFjynpxp8+IDX2UPZIDbu2/D5BC
 U2HOxXnvOKBl74jrUrtulasxD85ZIDo1/nwx4l6nFjBj+PF/GfzPPEKMxsOI+hoJkpMR
 5G9A==
X-Gm-Message-State: APjAAAWwM8zUKfgvcWw51n/saP1MkVYvoJsMerku8/+j6rR2Kc2LJvph
 6FQCqd80v7GO0VeIs0ION7VqmmN8CDGPaFk4kg6R9g==
X-Google-Smtp-Source: APXvYqxksc1c8xxY9m/ytOGIddZ9Dj1MGLCCOg027F783JJ699/Vs9P7Qgle5a5ROfkhKoQe7O8rV+M1HpnX+uBVekY=
X-Received: by 2002:a5d:5303:: with SMTP id e3mr704876wrv.239.1562810479679;
 Wed, 10 Jul 2019 19:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <1562781026-27570-1-git-send-email-chihmin.chao@sifive.com>
 <20190710202316.GA27117@localhost.localdomain>
In-Reply-To: <20190710202316.GA27117@localhost.localdomain>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Thu, 11 Jul 2019 10:01:08 +0800
Message-ID: <CAEiOBXUmPiaNwrrcMWCmu2BDt7iLM_vyDmSLWaEYX04rB-RUVw@mail.gmail.com>
To: Cleber Rosa <crosa@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000007e34a3058d5e2bda"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
X-List-Received-Date: Thu, 11 Jul 2019 02:01:25 -0000

--0000000000007e34a3058d5e2bda
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 11, 2019 at 4:23 AM Cleber Rosa <crosa@redhat.com> wrote:

> On Wed, Jul 10, 2019 at 10:50:23AM -0700, Chih-Min Chao wrote:
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
> > +
> '0b7787305d9e40815c05a805266cc74ff356239e/qemu/riscv64/'
> > +                      'bbl_w_kernel.gz')
> > +        kernel_hash = 'c7f6cc7967975ad42dc61ee0535db01c9cbd0968'
> > +        kernel_path_gz = self.fetch_asset(kernel_url,
> asset_hash=kernel_hash)
> > +        kernel_path = self.workdir + "bbl_w_kernel"
> > +
> > +        with gzip.open(kernel_path_gz, 'rb') as f_in:
> > +            with open(kernel_path, 'wb') as f_out:
> > +                shutil.copyfileobj(f_in, f_out)
>
> There are currently two patterns for extracting a gzipped file
> in this test.  So, this is not a must, but maybe you'd prefer:
>

  The suggestion is good and avocado is an awesome testing framework.

---
> diff --git a/tests/acceptance/boot_linux_console.py
> b/tests/acceptance/boot_linux_console.py
> index bbc6b0683f..9f819e20e1 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -365,12 +365,8 @@ class BootLinuxConsole(Test):
>
>  '0b7787305d9e40815c05a805266cc74ff356239e/qemu/riscv64/'
>                        'bbl_w_kernel.gz')
>          kernel_hash = 'c7f6cc7967975ad42dc61ee0535db01c9cbd0968'
> -        kernel_path_gz = self.fetch_asset(kernel_url,
> asset_hash=kernel_hash)
> -        kernel_path = self.workdir + "bbl_w_kernel"
> -
> -        with gzip.open(kernel_path_gz, 'rb') as f_in:
> -            with open(kernel_path, 'wb') as f_out:
> -                shutil.copyfileobj(f_in, f_out)
> +        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
> +        uncompressed_kernel = archive.uncompress(kernel_path,
> self.workdir)
>
>          initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
>                        '8584a59ed9e5eb5ee7ca91f6d74bbb06619205b8/rootfs/'
> @@ -382,7 +378,7 @@ class BootLinuxConsole(Test):
>          self.vm.set_console()
>          kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE
>                                 + 'console=ttyS0 noreboot')
> -        self.vm.add_args('-kernel', kernel_path,
> +        self.vm.add_args('-kernel', uncompressed_kernel,
>                           '-initrd', initrd_path,
>                           '-append', kernel_command_line)
>          self.vm.launch()
> ---
>
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
> It'd be nice to also add riscv64 to the target list in .travis.yaml
> "acceptance tests" job.
>
> Regards and many thanks for this contribution!
> - Cleber.
>

--0000000000007e34a3058d5e2bda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 11, 2019 at 4:23 AM Clebe=
r Rosa &lt;<a href=3D"mailto:crosa@redhat.com" target=3D"_blank">crosa@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Wed, Jul 10, 2019 at 10:50:23AM -0700, Chih-Min Chao wrote:<br>
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
&gt; Signed-off-by: Chih-Min Chao &lt;<a href=3D"mailto:chihmin.chao@sifive=
.com" target=3D"_blank">chihmin.chao@sifive.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 tests/acceptance/boot_linux_console.py | 40 ++++++++++++++++++++=
++++++++++++++<br>
&gt;=C2=A0 1 file changed, 40 insertions(+)<br>
&gt; <br>
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
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &#39;0b7787305d9e40815c05a805266cc74ff356239e/qemu/riscv64/&#39;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &#39;bbl_w_kernel.gz&#39;)<br>
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
<br>
There are currently two patterns for extracting a gzipped file<br>
in this test.=C2=A0 So, this is not a must, but maybe you&#39;d prefer:<br>=
</blockquote><div><br></div><div>=C2=A0 The suggestion is good and avocado =
is an awesome testing framework.</div><div><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
---<br>
diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot=
_linux_console.py<br>
index bbc6b0683f..9f819e20e1 100644<br>
--- a/tests/acceptance/boot_linux_console.py<br>
+++ b/tests/acceptance/boot_linux_console.py<br>
@@ -365,12 +365,8 @@ class BootLinuxConsole(Test):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;0b7787305d9e40815c05a805266cc74ff356239e/qemu/riscv64/&#39;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;bbl_w_kernel.gz&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel_hash =3D &#39;c7f6cc7967975ad42dc6=
1ee0535db01c9cbd0968&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_path_gz =3D self.fetch_asset(kernel_url=
, asset_hash=3Dkernel_hash)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_path =3D self.workdir + &quot;bbl_w_ker=
nel&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 with gzip.open(kernel_path_gz, &#39;rb&#39;) a=
s f_in:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(kernel_path, &#39;wb&#=
39;) as f_out:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copyfileobj=
(f_in, f_out)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_path =3D self.fetch_asset(kernel_url, a=
sset_hash=3Dkernel_hash)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uncompressed_kernel =3D archive.uncompress(ker=
nel_path, self.workdir)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0initrd_url =3D (&#39;<a href=3D"https://g=
ithub.com/groeck/linux-build-test/raw/" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/groeck/linux-build-test/raw/</a>&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;8584a59ed9e5eb5ee7ca91f6d74bbb06619205b8/rootfs/&#39;<br>
@@ -382,7 +378,7 @@ class BootLinuxConsole(Test):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.vm.set_console()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel_command_line =3D (self.KERNEL_COMM=
ON_COMMAND_LINE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + &#39;console=3DttyS0 noreboot&#39;=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-kernel&#39;, kernel_pat=
h,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-kernel&#39;, uncompress=
ed_kernel,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;-initrd&#39;, initrd_path,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;-append&#39;, kernel_command_line)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.vm.launch()<br>
---<br>
<br>
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
&gt; -- <br>
&gt; 2.7.4<br>
&gt; <br>
&gt; <br>
<br>
It&#39;d be nice to also add riscv64 to the target list in .travis.yaml<br>
&quot;acceptance tests&quot; job.<br>
<br>
Regards and many thanks for this contribution!<br>
- Cleber.<br>
</blockquote></div></div>

--0000000000007e34a3058d5e2bda--

