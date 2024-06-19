Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90109C27C53
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 16:16:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sJxyq-0000GW-Tj; Wed, 19 Jun 2024 12:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1sJxyo-0000Fd-RD
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2024 12:16:15 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1sJxyl-0006MS-7H
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2024 12:16:14 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-57d1594f3a6so99890a12.2
 for <qemu-riscv@nongnu.org>; Wed, 19 Jun 2024 09:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1718813767; x=1719418567; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=T6OXB3eAjjv+DYsb67JRDpJgU2Ol39FmZD5zbfMxSig=;
 b=i6kg1YJSZHfKxzJwm/gLhvXUsKPV4qCVK1Ss5IknZGrY4Yr4r4KTP+wo/So0RHUB+L
 9hGfTNBnUeUtC1H8gLz2WJSFkRRDe1DqNn3LbpKK+udJlOsOehdnZaR7lha3zJAsyQwe
 Nd/vJToUw23XdOmI4R+bAUpkAEz4/6bzhKlEzln7HDku0vNECL+p9H9jQBVxdFVI6SeF
 mz4tzN+2awAWfDuXpQKWZjWcAZw/USYtyineB1s7YcSlZC4xZm182T3wl6TpV6EuStk7
 C5X0jx+uvJIEA1NRePEE9DfEh5TN8rUSq+TOQVNdtR3pwv4uCnahFtHwT2835EESUKAu
 RIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718813767; x=1719418567;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T6OXB3eAjjv+DYsb67JRDpJgU2Ol39FmZD5zbfMxSig=;
 b=snJvPrvQ1qTcWxczAng75aJM/+Ke3+Hg60GIKooh1v3SKmS0d4XyXdVL3iHA5f5VzJ
 mv0GFnwDxkVe9/nyKLblBxMv5L27tKi1y8kjEosm0bvoa0aRObC6kasqpHJ39ddI9hyY
 3yLxp2oJmqTPys9IwtU/saycNgxNz1RJ81OAqD7rzmt/P5YkK7oKQNL/sV+CLtJwUs6C
 +qAwhXxslxl8pZuBTITgw25x8PJQgF8HOIYDpI68YH1AuFz6BgZXwLsmsXUwasOQwJXd
 i05CTmFKp8wHCSRLOxUddIC/R5cRnSVkN8XD+1vqjo5XwA4fOMXAd+FGtJ4xThMx/dUG
 bSQw==
X-Gm-Message-State: AOJu0YwQCcsiT3jAUmWqbhVWBzKC2tXbOH/K7HeZSY1VMdghiqTwHHG0
 XzqlvEdyhBaSH51efstUgO6O6Ecs5DPd7t+moguztt1KXpenc3KjYOpq6+7M5YcHaCrnIb6t+2J
 WZSU0r5MnrK7P4lLzSM+OSTNP3iQX2r2mfQ+bAw==
X-Google-Smtp-Source: AGHT+IG2uU85rH1YNENLR3PG1VJsYe/qA+w1RUvCSjQwu45Tw1d9RpNlrOmi3T6tl6TN3HuejrU2kJkPhNUWtkLLW90=
X-Received: by 2002:a50:8d18:0:b0:57c:bc7f:fb51 with SMTP id
 4fb4d7f45d1cf-57d07ec91fcmr1817749a12.2.1718813766647; Wed, 19 Jun 2024
 09:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <CANnUGEkHqnecxFa63ESQoQRN8RwKWm0AAmQ=4zKe3VkDDYCLXw@mail.gmail.com>
 <E5CDC0A3-8CC9-9641-9F01-2C4F88EA2767@hxcore.ol>
 <CANnUGE=uWzN-g5+vx46bbLdHmKrQ1K9nq9MZ=npE06kovdm5Sw@mail.gmail.com>
In-Reply-To: <CANnUGE=uWzN-g5+vx46bbLdHmKrQ1K9nq9MZ=npE06kovdm5Sw@mail.gmail.com>
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Wed, 19 Jun 2024 21:45:55 +0530
Message-ID: <CAPd4WeyNkaWByzBWgyf_wwiz00Ys6AOEtMmv1941GR-XHme9_g@mail.gmail.com>
Subject: Re: Is there a way to check values of registers before and after
 running a program on qemu-system-risc64v?
To: Shobhit <shobhit32t@gmail.com>
Cc: qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000ff1df2061b40839e"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=hchauhan@ventanamicro.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_KAM_HTML_FONT_INVALID=0.01,
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

--000000000000ff1df2061b40839e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 9:20=E2=80=AFPM Shobhit <shobhit32t@gmail.com> wrot=
e:

> Thank you for responding, Himanshu.
>
> Actually I wanted to check the value of registers, in order to verify if =
I
> am able to correctly load the program to the qemu.
>
> I used the command you recommended.
> Using the "-S -s" command opens the qemu window with a black screen, with
> the word "PAUSED" written in the title bar. After that when I run riscv-g=
db
> and do target remote, I get the following lines
>
> >> Remote debugging using :1234
> >> 0x0000000000001000 in ?? ()
>
> And if I try to do run, I get the following error
>
> >> The "remote" target does not support "run".  Try "help target" or
> "continue".
>
> Typing "continue", leads to the terminal printing "Continuing.", followed
> by no blinking cursor (what looks like an infinite loop or pause).
>

Fist add the following at the end of the program:
1: j 1b

So it looks like:
.option norvc

.section .text.init
.global _start

_start:
    addi x5, x0, 6
    addi x5, x0, 4

1:  j 1b

Second,
At "Continuing",
Press CTRL+c and you will fall to GDB prompt again. Like so,

 (gdb) target remote :1234
Remote debugging using :1234
0x0000000000001000 in ?? ()
(gdb) continue
Continuing.
^C
Thread 4 received signal SIGINT, Interrupt.
[Switching to Thread 1.4]
_start () at test.S:10
10      1:      j 1b

(gdb) info registers
ra             0x0      0x0
sp             0x0      0x0
gp             0x0      0x0
tp             0x0      0x0
t0             0x4      4
t1             0x0      0
t2             0x0      0
fp             0x0      0x0
s1             0x0      0
a0             0x3      3
a1             0x87e00000       2279604224
a2             0x1028   4136
a3             0x0      0
a4             0x0      0
a5             0x0      0
a6             0x0      0
a7             0x0      0
s2             0x0      0
s3             0x0      0
s4             0x0      0
s5             0x0      0
s6             0x0      0
s7             0x0      0
s8             0x0      0
s9             0x0      0
s10            0x0      0
s11            0x0      0
t3             0x0      0
t4             0x0      0
t5             0x0      0
t6             0x0      0
pc             0x80000008       0x80000008 <_start+8>


> Regards
> Shobhit
>
> On Wed, 19 Jun 2024 at 10:11, hchauhan@ventanamicro.com <
> hchauhan@ventanamicro.com> wrote:
>
>> Hi Shobhit,
>>
>> Add "-S -s=E2=80=9D to qemu command line.
>>
>> riscv64-unknown-linux-gnu-gdb new.elf
>>
>> Then, on GDB command line
>>
>> "target remote :1234"
>>
>> Run: =E2=80=9Cinfo registers=E2=80=9D
>>
>> Regards
>> Himanshu
>>
>> From: qemu-riscv-bounces+hchauhan=3Dventanamicro.com@nongnu.org
>> <qemu-riscv-bounces+hchauhan=3Dventanamicro.com@nongnu.org> on behalf of
>> Shobhit <shobhit32t@gmail.com>
>> Date: Tuesday, 18 June 2024 at 10:20=E2=80=AFPM
>> To: qemu-riscv@nongnu.org <qemu-riscv@nongnu.org>
>> Subject: Is there a way to check values of registers before and after
>> running a program on qemu-system-risc64v?
>>
>> I am trying to run a very basic RISC V assembly program on
>> qemu-system-riscv64, is there a way to check/monitor the value of some
>> particular registers before and after loading the program? I have tried
>> passing -monitor stdio flag to qemu-system-risc64v, but it doesn't give =
me
>> the values of registers.
>>
>> This is the program I am running on bare metal risc64v emulator
>>
>> .option norvc
>>
>> .section .text.init
>> .global _start
>>
>> _start:
>>     addi x5, x0, 6
>>
>>     addi x5, x0, 4
>>
>> And I am using ld script to load the program at the location 0x80000000
>> in memory.
>>
>> This is the command I am using to start the emulator: qemu-system-riscv6=
4
>> -machine virt -monitor stdio -cpu rv64 -smp 4 -m 128M -bios default new.=
elf
>>
>> Here new.elf is the executable elf file created after compiling the abov=
e
>> assembly program.
>>
>

--000000000000ff1df2061b40839e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 19, 2024 at 9:20=E2=80=AF=
PM Shobhit &lt;<a href=3D"mailto:shobhit32t@gmail.com">shobhit32t@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
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
r (what looks like an infinite loop or pause).</div></div></div></blockquot=
e><div><br></div><div>Fist add the following at the end of the program:</di=
v><div>1: j 1b</div><div>=C2=A0</div><div>So it looks like:</div><div>.opti=
on norvc<br><br>.section .text.init<br>.global _start<br><br>_start:<br>=C2=
=A0 =C2=A0 addi x5, x0, 6<br>=C2=A0 =C2=A0 addi x5, x0, 4<br><br>1:=C2=A0 j=
 1b<br></div><div><br></div><div>Second,</div><div>At &quot;Continuing&quot=
;,</div><div>Press CTRL+c and you will fall to GDB prompt again. Like so,</=
div><div><br></div><div>=C2=A0(gdb) target remote :1234</div>Remote debuggi=
ng using :1234<br>0x0000000000001000 in ?? ()<br>(gdb) continue<br>Continui=
ng.<br>^C<br>Thread 4 received signal SIGINT, Interrupt.<br>[Switching to T=
hread 1.4]<br>_start () at test.S:10<br>10 =C2=A0 =C2=A0 =C2=A01: =C2=A0 =
=C2=A0 =C2=A0j 1b</div><div class=3D"gmail_quote"><br></div><div class=3D"g=
mail_quote">(gdb) info registers<br>ra =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x0 =C2=A0 =C2=A0 =C2=A00x0<br>sp =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0x0 =C2=A0 =C2=A0 =C2=A00x0<br>gp =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0x0 =C2=A0 =C2=A0 =C2=A00x0<br>tp =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0x0 =C2=A0 =C2=A0 =C2=A00x0<br>t0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 0x4 =C2=A0 =C2=A0 =C2=A04<br>t1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0x0 =C2=A0 =C2=A0 =C2=A00<br>t2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0x0 =C2=A0 =C2=A0 =C2=A00<br>fp =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0x0 =C2=A0 =C2=A0 =C2=A00x0<br>s1 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 0x0 =C2=A0 =C2=A0 =C2=A00<br>a0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0x3 =C2=A0 =C2=A0 =C2=A03<br>a1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0x87e00000 =C2=A0 =C2=A0 =C2=A0 2279604224<br>a2 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x1028 =C2=A0 4136<br>a3 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x0 =C2=A0 =C2=A0 =C2=A00<br>a4 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x0 =C2=A0 =C2=A0 =C2=A00<br>a5 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x0 =C2=A0 =C2=A0 =C2=A00<br>a6 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x0 =C2=A0 =C2=A0 =C2=A00<br>a7 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x0 =C2=A0 =C2=A0 =C2=A00<br>s2 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x0 =C2=A0 =C2=A0 =C2=A00<br>s3 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x0 =C2=A0 =C2=A0 =C2=A00<br>s4 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x0 =C2=A0 =C2=A0 =C2=A00<br>s5 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x0 =C2=A0 =C2=A0 =C2=A00<br>s6 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x0 =C2=A0 =C2=A0 =C2=A00<br>s7 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x0 =C2=A0 =C2=A0 =C2=A00<br>s8 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x0 =C2=A0 =C2=A0 =C2=A00<br>s9 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x0 =C2=A0 =C2=A0 =C2=A00<br>s10 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x0 =C2=A0 =C2=A0 =C2=A00<br>s11 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00x0 =C2=A0 =C2=A0 =C2=A00<br>t3 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x0 =C2=A0 =C2=A0 =C2=A00<br>t4 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x0 =C2=A0 =C2=A0 =C2=A00<br>t5 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x0 =C2=A0 =C2=A0 =C2=A00<br>t6 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x0 =C2=A0 =C2=A0 =C2=A00<br>pc =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x80000008 =C2=A0 =C2=A0 =C2=A0 0x80000008 &lt;_st=
art+8&gt;</div><div class=3D"gmail_quote"><br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div><br></div><div>=
Regards</div><div>Shobhit<br></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Wed, 19 Jun 2024 at 10:11, <a href=3D=
"mailto:hchauhan@ventanamicro.com" target=3D"_blank">hchauhan@ventanamicro.=
com</a> &lt;<a href=3D"mailto:hchauhan@ventanamicro.com" target=3D"_blank">=
hchauhan@ventanamicro.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div><div dir=3D"ltr"><div dir=3D"ltr" style=3D"fo=
nt-family:Aptos,Arial,Helvetica,sans-serif;font-size:12pt">Hi Shobhit,</div=
><div dir=3D"ltr" style=3D"font-family:Aptos,Arial,Helvetica,sans-serif;fon=
t-size:12pt"><br></div><div dir=3D"ltr" style=3D"font-family:Aptos,Arial,He=
lvetica,sans-serif;font-size:12pt">Add &quot;-S -s=E2=80=9D to qemu command=
 line.</div><div dir=3D"ltr" style=3D"font-family:Aptos,Arial,Helvetica,san=
s-serif;font-size:12pt"><br></div><div dir=3D"ltr" style=3D"font-family:Apt=
os,Arial,Helvetica,sans-serif;font-size:12pt">riscv64-unknown-linux-gnu-gdb=
 new.elf<br></div><div dir=3D"ltr" style=3D"font-family:Aptos,Arial,Helveti=
ca,sans-serif;font-size:12pt"><br></div><div dir=3D"ltr" style=3D"font-fami=
ly:Aptos,Arial,Helvetica,sans-serif;font-size:12pt">Then, on GDB command li=
ne</div><div dir=3D"ltr" style=3D"font-family:Aptos,Arial,Helvetica,sans-se=
rif;font-size:12pt"><br></div><div dir=3D"ltr" style=3D"font-family:Aptos,A=
rial,Helvetica,sans-serif;font-size:12pt">&quot;target remote :1234&quot;</=
div><div dir=3D"ltr" style=3D"font-family:Aptos,Arial,Helvetica,sans-serif;=
font-size:12pt"><br></div><div dir=3D"ltr" style=3D"font-family:Aptos,Arial=
,Helvetica,sans-serif;font-size:12pt">Run: =E2=80=9Cinfo registers=E2=80=9D=
</div><div dir=3D"ltr" style=3D"font-family:Aptos,Arial,Helvetica,sans-seri=
f;font-size:12pt"><br></div><div dir=3D"ltr" style=3D"font-family:Aptos,Ari=
al,Helvetica,sans-serif;font-size:12pt">Regards</div><div dir=3D"ltr" style=
=3D"font-family:Aptos,Arial,Helvetica,sans-serif;font-size:12pt">Himanshu</=
div><div dir=3D"ltr" style=3D"font-family:Aptos,Arial,Helvetica,sans-serif;=
font-size:12pt"><br></div><div id=3D"m_5859297554867400851m_280314527373613=
1556ms-outlook-mobile-signature" dir=3D"ltr"></div><div id=3D"m_58592975548=
67400851m_2803145273736131556mail-editor-reference-message-container"><div =
style=3D"font-family:Aptos;font-size:12pt;text-align:left;border-width:1pt =
medium medium;border-style:solid none none;border-color:rgb(181,196,223) cu=
rrentcolor currentcolor;padding:3pt 0in 0in;color:black"><span style=3D"fon=
t-weight:bold">From: </span> qemu-riscv-bounces+hchauhan=3D<a href=3D"mailt=
o:ventanamicro.com@nongnu.org" target=3D"_blank">ventanamicro.com@nongnu.or=
g</a> &lt;qemu-riscv-bounces+hchauhan=3D<a href=3D"mailto:ventanamicro.com@=
nongnu.org" target=3D"_blank">ventanamicro.com@nongnu.org</a>&gt; on behalf=
 of Shobhit &lt;<a href=3D"mailto:shobhit32t@gmail.com" target=3D"_blank">s=
hobhit32t@gmail.com</a>&gt;<br><span style=3D"font-weight:bold">Date: </spa=
n> Tuesday, 18 June 2024 at 10:20=E2=80=AFPM<br><span style=3D"font-weight:=
bold">To: </span> <a href=3D"mailto:qemu-riscv@nongnu.org" target=3D"_blank=
">qemu-riscv@nongnu.org</a> &lt;<a href=3D"mailto:qemu-riscv@nongnu.org" ta=
rget=3D"_blank">qemu-riscv@nongnu.org</a>&gt;<br><span style=3D"font-weight=
:bold">Subject: </span> Is there a way to check values of registers before =
and after running a program on qemu-system-risc64v?<br><br></div><div id=3D=
"m_5859297554867400851m_2803145273736131556mail-editor-reference-message-co=
ntainer"><span><div dir=3D"ltr"><p>I am trying to run a very basic RISC V a=
ssembly program on=20
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
</blockquote></div></div>

--000000000000ff1df2061b40839e--

