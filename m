Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E625C27C53
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 15:51:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sJxaM-000328-JW; Wed, 19 Jun 2024 11:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shobhit32t@gmail.com>)
 id 1sJxaL-0002zn-5d
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2024 11:50:57 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shobhit32t@gmail.com>)
 id 1sJxaJ-0001yB-2q
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2024 11:50:56 -0400
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-795ca45c54cso362467585a.0
 for <qemu-riscv@nongnu.org>; Wed, 19 Jun 2024 08:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718812254; x=1719417054; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CXGylIt191ZPjT0pcbv0WtYaap4stpvpraqzUj/hXlU=;
 b=ExyuXslAErR6ylXHn1/oyn4m0lvLSFlKF8ecaWRS8HmVOufWm9rM1DKmVLIoyh6BxI
 wTzoxnetL++lynKceJ6ochsC37u0uJzjeEpffmas3QmHMMgHPWY8TNM1mdH2ClvgPS70
 3aQD8nohDdai49ODtA5zuJVnUBx/6cfyb9ZHLKHctiDzbz5Eze7zLCYgt1m674fpclk8
 vKdYAnVUSQK5WGFivEB5Jf+Y255PzSD8ZT3eCWNTIUTa4ofpvDZLFzaWEu5Q7ySy2H22
 aSj5AO8mM/eoZLT2SFyHs/67UBVXrDa6dvAOBeGEPZcfq9hoe+F5R3jG71LBBWD5s684
 WK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718812254; x=1719417054;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CXGylIt191ZPjT0pcbv0WtYaap4stpvpraqzUj/hXlU=;
 b=X86x06ld05/MjjdYy1UhFOYmG7XYtwjJmpzQL2C3LCQp5d3YbKIHps4HCmqSuSlKFu
 yLYKHE5vD53GrgSEKSL0mlHU2MLBw8bUTtCy3GBdcaPTjl7KWOcOnlThEjJuzPE6ygoH
 5e20WWuk31qDxGtS+RuTik9l70wKRoUaHEgXRYaNhiKu+XETb67UrFAFpqgpYAMgmtaA
 0VddON+6PuxTXNmFmo6aWpLBRFR4OQJNc4YSSwEsNtptSJEs/PqgYcPokk1FY1LJgpin
 4AVijkvV8vQIyvaSgmmbRvo20KPEL1wI628ptyXyA7qiTl4MHk1iopS/hYhNseAxlhKK
 5/aw==
X-Gm-Message-State: AOJu0YwmM+O4EiqPwWMSNQ38xlBA7pngfiXOs4hA8RgWkZea4DZ3sNaq
 dvpRP38VL9Din/rcVvWywLylGF1TE8TEhLOVQdbpb6QQIywAf5PzThKfI9Ge7m5NLFO4mXGEDPx
 axIZDXMXmlqiDOScTo5Ou2QGoeM0=
X-Google-Smtp-Source: AGHT+IH3SuRpOYVuQ6+yW3X0NCDhKNl6piQtLiHurq0mYPckRNsDPSv0Pw3l6t3i0Ahz2NBwqICKXEBlNjV36kz0imM=
X-Received: by 2002:ad4:4f31:0:b0:6b0:7c8d:805d with SMTP id
 6a1803df08f44-6b501e0bf5bmr24875856d6.6.1718812253979; Wed, 19 Jun 2024
 08:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <CANnUGEkHqnecxFa63ESQoQRN8RwKWm0AAmQ=4zKe3VkDDYCLXw@mail.gmail.com>
 <E5CDC0A3-8CC9-9641-9F01-2C4F88EA2767@hxcore.ol>
In-Reply-To: <E5CDC0A3-8CC9-9641-9F01-2C4F88EA2767@hxcore.ol>
From: Shobhit <shobhit32t@gmail.com>
Date: Wed, 19 Jun 2024 21:20:42 +0530
Message-ID: <CANnUGE=uWzN-g5+vx46bbLdHmKrQ1K9nq9MZ=npE06kovdm5Sw@mail.gmail.com>
Subject: Re: Is there a way to check values of registers before and after
 running a program on qemu-system-risc64v?
To: "hchauhan@ventanamicro.com" <hchauhan@ventanamicro.com>
Cc: qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000d58ee8061b402954"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=shobhit32t@gmail.com; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_KAM_HTML_FONT_INVALID=0.01,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--000000000000d58ee8061b402954
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for responding, Himanshu.

Actually I wanted to check the value of registers, in order to verify if I
am able to correctly load the program to the qemu.

I used the command you recommended.
Using the "-S -s" command opens the qemu window with a black screen, with
the word "PAUSED" written in the title bar. After that when I run riscv-gdb
and do target remote, I get the following lines

>> Remote debugging using :1234
>> 0x0000000000001000 in ?? ()

And if I try to do run, I get the following error

>> The "remote" target does not support "run".  Try "help target" or
"continue".

Typing "continue", leads to the terminal printing "Continuing.", followed
by no blinking cursor (what looks like an infinite loop or pause).

Regards
Shobhit

On Wed, 19 Jun 2024 at 10:11, hchauhan@ventanamicro.com <
hchauhan@ventanamicro.com> wrote:

> Hi Shobhit,
>
> Add "-S -s=E2=80=9D to qemu command line.
>
> riscv64-unknown-linux-gnu-gdb new.elf
>
> Then, on GDB command line
>
> "target remote :1234"
>
> Run: =E2=80=9Cinfo registers=E2=80=9D
>
> Regards
> Himanshu
>
> From: qemu-riscv-bounces+hchauhan=3Dventanamicro.com@nongnu.org
> <qemu-riscv-bounces+hchauhan=3Dventanamicro.com@nongnu.org> on behalf of
> Shobhit <shobhit32t@gmail.com>
> Date: Tuesday, 18 June 2024 at 10:20=E2=80=AFPM
> To: qemu-riscv@nongnu.org <qemu-riscv@nongnu.org>
> Subject: Is there a way to check values of registers before and after
> running a program on qemu-system-risc64v?
>
> I am trying to run a very basic RISC V assembly program on
> qemu-system-riscv64, is there a way to check/monitor the value of some
> particular registers before and after loading the program? I have tried
> passing -monitor stdio flag to qemu-system-risc64v, but it doesn't give m=
e
> the values of registers.
>
> This is the program I am running on bare metal risc64v emulator
>
> .option norvc
>
> .section .text.init
> .global _start
>
> _start:
>     addi x5, x0, 6
>
>     addi x5, x0, 4
>
> And I am using ld script to load the program at the location 0x80000000 i=
n
> memory.
>
> This is the command I am using to start the emulator: qemu-system-riscv64
> -machine virt -monitor stdio -cpu rv64 -smp 4 -m 128M -bios default new.e=
lf
>
> Here new.elf is the executable elf file created after compiling the above
> assembly program.
>

--000000000000d58ee8061b402954
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Thank you for responding, Himanshu.=
=C2=A0</div><div><br></div><div>Actually I wanted to check the value of reg=
isters, in order to verify if I am able to correctly load the program to th=
e qemu.</div><div><br></div><div>I used the command you recommended.=C2=A0<=
/div><div>Using the &quot;-S -s&quot; command opens the qemu window with a =
black screen, with the word &quot;PAUSED&quot; written in the title bar. Af=
ter that when I run riscv-gdb and do target remote, I get the following lin=
es <br></div><div><br></div><div style=3D"background-color:transparent">&gt=
;&gt; Remote debugging using :1234<br>&gt;&gt; 0x0000000000001000 in ?? ()<=
/div><div><br></div><div>And if I try to do run, I get the following error<=
/div><div><br></div><div>&gt;&gt; The &quot;remote&quot; target does not su=
pport &quot;run&quot;.=C2=A0 Try &quot;help target&quot; or &quot;continue&=
quot;.<br></div><div><br></div><div>Typing &quot;continue&quot;, leads to t=
he terminal printing &quot;Continuing.&quot;, followed by no blinking curso=
r (what looks like an infinite loop or pause).</div><div><br></div><div>Reg=
ards</div><div>Shobhit<br></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Wed, 19 Jun 2024 at 10:11, <a href=3D"ma=
ilto:hchauhan@ventanamicro.com">hchauhan@ventanamicro.com</a> &lt;<a href=
=3D"mailto:hchauhan@ventanamicro.com">hchauhan@ventanamicro.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div di=
r=3D"ltr"><div dir=3D"ltr" style=3D"font-family:Aptos,Arial,Helvetica,sans-=
serif;font-size:12pt">Hi Shobhit,</div><div dir=3D"ltr" style=3D"font-famil=
y:Aptos,Arial,Helvetica,sans-serif;font-size:12pt"><br></div><div dir=3D"lt=
r" style=3D"font-family:Aptos,Arial,Helvetica,sans-serif;font-size:12pt">Ad=
d &quot;-S -s=E2=80=9D to qemu command line.</div><div dir=3D"ltr" style=3D=
"font-family:Aptos,Arial,Helvetica,sans-serif;font-size:12pt"><br></div><di=
v dir=3D"ltr" style=3D"font-family:Aptos,Arial,Helvetica,sans-serif;font-si=
ze:12pt">riscv64-unknown-linux-gnu-gdb new.elf<br></div><div dir=3D"ltr" st=
yle=3D"font-family:Aptos,Arial,Helvetica,sans-serif;font-size:12pt"><br></d=
iv><div dir=3D"ltr" style=3D"font-family:Aptos,Arial,Helvetica,sans-serif;f=
ont-size:12pt">Then, on GDB command line</div><div dir=3D"ltr" style=3D"fon=
t-family:Aptos,Arial,Helvetica,sans-serif;font-size:12pt"><br></div><div di=
r=3D"ltr" style=3D"font-family:Aptos,Arial,Helvetica,sans-serif;font-size:1=
2pt">&quot;target remote :1234&quot;</div><div dir=3D"ltr" style=3D"font-fa=
mily:Aptos,Arial,Helvetica,sans-serif;font-size:12pt"><br></div><div dir=3D=
"ltr" style=3D"font-family:Aptos,Arial,Helvetica,sans-serif;font-size:12pt"=
>Run: =E2=80=9Cinfo registers=E2=80=9D</div><div dir=3D"ltr" style=3D"font-=
family:Aptos,Arial,Helvetica,sans-serif;font-size:12pt"><br></div><div dir=
=3D"ltr" style=3D"font-family:Aptos,Arial,Helvetica,sans-serif;font-size:12=
pt">Regards</div><div dir=3D"ltr" style=3D"font-family:Aptos,Arial,Helvetic=
a,sans-serif;font-size:12pt">Himanshu</div><div dir=3D"ltr" style=3D"font-f=
amily:Aptos,Arial,Helvetica,sans-serif;font-size:12pt"><br></div><div id=3D=
"m_2803145273736131556ms-outlook-mobile-signature" dir=3D"ltr"></div><div i=
d=3D"m_2803145273736131556mail-editor-reference-message-container"><div sty=
le=3D"font-family:Aptos;font-size:12pt;text-align:left;border-width:1pt med=
ium medium;border-style:solid none none;border-color:rgb(181,196,223) curre=
ntcolor currentcolor;padding:3pt 0in 0in;color:black"><span style=3D"font-w=
eight:bold">From: </span> qemu-riscv-bounces+hchauhan=3D<a href=3D"mailto:v=
entanamicro.com@nongnu.org" target=3D"_blank">ventanamicro.com@nongnu.org</=
a> &lt;qemu-riscv-bounces+hchauhan=3D<a href=3D"mailto:ventanamicro.com@non=
gnu.org" target=3D"_blank">ventanamicro.com@nongnu.org</a>&gt; on behalf of=
 Shobhit &lt;<a href=3D"mailto:shobhit32t@gmail.com" target=3D"_blank">shob=
hit32t@gmail.com</a>&gt;<br><span style=3D"font-weight:bold">Date: </span> =
Tuesday, 18 June 2024 at 10:20=E2=80=AFPM<br><span style=3D"font-weight:bol=
d">To: </span> <a href=3D"mailto:qemu-riscv@nongnu.org" target=3D"_blank">q=
emu-riscv@nongnu.org</a> &lt;<a href=3D"mailto:qemu-riscv@nongnu.org" targe=
t=3D"_blank">qemu-riscv@nongnu.org</a>&gt;<br><span style=3D"font-weight:bo=
ld">Subject: </span> Is there a way to check values of registers before and=
 after running a program on qemu-system-risc64v?<br><br></div><div id=3D"m_=
2803145273736131556mail-editor-reference-message-container"><span><div dir=
=3D"ltr"><p>I am trying to run a very basic RISC V assembly program on=20
qemu-system-riscv64, is there a way to check/monitor the value of some=20
particular registers before and after loading the program? I have tried=20
passing -monitor stdio flag to qemu-system-risc64v, but it doesn&#39;t give=
=20
me the values of registers.</p>
<p>This is the program I am running on bare metal risc64v emulator</p>
<p>.option norvc<br>
  <br>
.section .text.init<br>
.global _start<br>
  <br>
_start:<br>
=C2=A0=C2=A0=C2=A0 addi x5, x0, 6</p>
<p>=C2=A0=C2=A0=C2=A0 addi x5, x0, 4</p><div><br></div>

<p>And I am using ld script to load the program at the location 0x80000000 =
in memory.</p>
<p>This is the command I am using to start the emulator:=20
qemu-system-riscv64 -machine virt -monitor stdio -cpu rv64 -smp 4 -m=20
128M -bios default new.elf</p>
<p>Here new.elf is the executable elf file created after compiling the abov=
e assembly program.</p>
</div>
</span></div></div></div></div>
</blockquote></div></div>

--000000000000d58ee8061b402954--

