Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lnj8a-0001YY-1P
	for mharc-qemu-riscv@gnu.org; Mon, 31 May 2021 10:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rpathakmailbox@gmail.com>)
 id 1lnj8Y-0001Y7-5l; Mon, 31 May 2021 10:43:26 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:45774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rpathakmailbox@gmail.com>)
 id 1lnj8V-0000jo-Sk; Mon, 31 May 2021 10:43:25 -0400
Received: by mail-il1-x132.google.com with SMTP id b5so10172494ilc.12;
 Mon, 31 May 2021 07:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mIPENdvk42yJENgnL7j21GfLeic/gMxK8RaeqaaCYC4=;
 b=GD1j6F3k9MyRCv9DYbk876Aq2VIrFgwl2Zzpbo/wMsZBh3LnO0qAo8577QJFjNLh6k
 hnlrR8KCjSrCbdUwmlmrbAuW3MAqCzO+HNbbql/9e65IdEnFJshXH+OJ4Fuxgmhv/PwD
 OLyZ1v8ZtsRFHW24wecMFf8hqYO0MR6fR6JSrX8YbRxgN60P9B0vC6KMyZ8C0eWo7e35
 4cVN3gM940a4/QZwxxRm+DGuifLgdDVhShl/PL/0K4JIpuUVZDVStotAtrajijiP5cHC
 29Xei6d/QM6/HEP5c4nHecp2wrpUcRmZaYI9SeL0wAXtLSI6hojhNYGZRNRfL8UPnlll
 syZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mIPENdvk42yJENgnL7j21GfLeic/gMxK8RaeqaaCYC4=;
 b=Pe0g8XGrIarEYrCXeoIwfZHovlQDUiYFIVdemyO/o9SvHrJK6AujGg/qICpv8jnQq+
 4KkS1vlmCETLdVNOL1T0L7gCPc03r0sPp3ydw2KRty7zIb/YbRwCSkQlFFwmQ7n6YaSQ
 cfDzteymm3qEPl3h/MZRogi5zV/L8c8+kJgwpvQ4uu5JvMWMZB8WiV3jVzbNbvcFaFJe
 Bm3sHuGB3YAD5IgXufVrt4dkqbU5EomTIroBhzHCCFle13/j9g+PhgDyJbrGBnvlQ3JO
 K32XgxcGoKd6yJCnSvr0EMO6ZwSkbEWBSJvSIyM4cyfxFvHsaS4+2MpYNzwsR0hJ03WE
 sONQ==
X-Gm-Message-State: AOAM532cQPVj8n7B5+MJaR8Dhc51+IKIbSGgqJkOAFG0wwnWFNbeM9TV
 lwdvmbRR0V6uELxPNG8QlNG8615jvuEQ6YssmCA=
X-Google-Smtp-Source: ABdhPJyUabcWYpSV/Ued7mXdRTn63kZnXE4s7xdVUdTFmOuDK1Wkd8Ailrqzer3FD4Nr7prFrb3GKe/nAurrrOEP8ME=
X-Received: by 2002:a05:6e02:13d4:: with SMTP id
 v20mr17725063ilj.111.1622472200711; 
 Mon, 31 May 2021 07:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <0CAA9018-0C42-4140-82C1-EAC80D46D359@getmailspring.com>
 <CAEUhbmWnj3GOD5-EA54XHRQyfiSdOsH+KKGH-+uG0LEH+kAuUg@mail.gmail.com>
 <CA+Oz1=Z4J8KCHk_TZTUB9aEODaRv0F3bF6jtCHwdKQ02VgjcTQ@mail.gmail.com>
In-Reply-To: <CA+Oz1=Z4J8KCHk_TZTUB9aEODaRv0F3bF6jtCHwdKQ02VgjcTQ@mail.gmail.com>
From: Rahul Pathak <rpathakmailbox@gmail.com>
Date: Mon, 31 May 2021 20:13:09 +0530
Message-ID: <CAMSwOgoq5KNoU3aP6kGZxAVhj_phxJvmCWb=6dKB7SkbXjaJyQ@mail.gmail.com>
Subject: Re: HSS Issue with GCC 10, Qemu Setup for microchip-icicle-kit
To: Rahul Pathak <rpathak@ventanamicro.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000002e72d305c3a13f5b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=rpathakmailbox@gmail.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 31 May 2021 14:43:26 -0000

--0000000000002e72d305c3a13f5b
Content-Type: text/plain; charset="UTF-8"

On top of that, it seems I cannot connect with the target using gdb

(gdb) target remote :1234
Remote debugging using :1234
bfd requires flen 8, but target has flen 0

Though the ABI is lp64 and ISA is rv64imac when the hss was built.

On Mon, May 31, 2021 at 7:37 PM Rahul Pathak <rpathak@ventanamicro.com>
wrote:

> I followed the same link. I will elaborate what is happening at my end -
>
> *First* -
> Used the same versions as per the doc. Built HSS 2020.12 and used
> core-image-minimal-dev-icicle-kit-es-sd-20201009141623.rootfs.wic.
> Upon executing the qemu launch command as per the doc, it's just waits
> for the connection on another serial console -
>
> info: QEMU waiting for connection on: disconnected:unix
> :serial1.sock,server=on
>
> Even if I open sudo minicom -D unix\#serial1.sock, which remains offline
> always.
>
> *Second* -
> If I remove the "-chardev
> socket,id=serial1,path=serial1.sock,server=on,wait=on -serial chardev:serial1"
> from the
> qemu launch command then HSS boots but stops after sbi_init on all the
> cores and put the cores in Idle -
>
> [5.443011] boot_download_chunks_onExit():
> boot_service(u54_1)::u54_1:sbi_init 80200000
> [5.444960] boot_wait_onEntry(): boot_service(u54_1)::Checking for IPI
> ACKs: - -
> [5.447962] boot_wait_handler(): boot_service(u54_1)::Checking for IPI
> ACKs: ACK/IDLE ACK
> [5.449343] RunStateMachine(): boot_service(u54_1)::Wait ->
> boot_service(u54_1)::Idle
>
> *Third -*
> If I take the latest release of HSS 2021.04 and build with gcc10, it does
> not boot at all even if I remove the serial1 like in the second case.
>
>
> Thanks
> Rahul
>
> On Mon, May 31, 2021 at 8:19 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
>> Hi Rahul,
>>
>> On Mon, May 31, 2021 at 1:08 AM Rahul Pathak <rpathak@ventanamicro.com>
>> wrote:
>> >
>> > Hi Bin,
>> >
>> > I was reading a github issue which you raised for the issue with HSS
>> because of GCC 10.1. Its pretty old and not sure what has changed so I
>> thought to ask you over email for help.
>>
>> The HSS issue of GCC 10.1 was already fixed in the HSS mainline.
>>
>> > I myself is trying to make a setup to boot the  microchip-icicle-kit
>> Qemu machine with HSS and Yocto linux image. Currently it does not work.
>>
>> Could you please elaborate which part does not work? Is that Linux,
>> HSS, or U-Boot?
>>
>> >
>> > Do you know what is the right setup to make  microchip-icicle-kit
>> machine with HSS.bin and Yocto linux work on Qemu?. Probably there will be
>> a working combination of HSS, Linux releases plus the toolchain version
>> which makes this setup work.
>> >
>>
>> I have not tried Yocto Linux yet with Microchip Icicle Kit on QEMU. I
>> only tested the Linux images released by Microchip.
>> Could you please follow the instructions @
>>
>> https://qemu.readthedocs.io/en/latest/system/riscv/microchip-icicle-kit.html
>> to see which step might be wrong on your side?
>>
>> Regards,
>> Bin
>>
>

--0000000000002e72d305c3a13f5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On top of that, it seems I cannot connect with the target =
using gdb<div><br><div><font face=3D"monospace">(gdb) target remote :1234<b=
r>Remote debugging using :1234<br>bfd requires flen 8, but target has flen =
0</font><br></div><div><br></div><div>Though the ABI is <font face=3D"monos=
pace">lp64</font> and ISA is=C2=A0<span style=3D"color:rgb(17,17,17)"><font=
 face=3D"monospace" style=3D"">rv64imac</font></span>=C2=A0when the hss was=
 built.</div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Mon, May 31, 2021 at 7:37 PM Rahul Pathak &lt;<a href=
=3D"mailto:rpathak@ventanamicro.com">rpathak@ventanamicro.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verda=
na,sans-serif"><div>
</div><div>I followed the same link. I will elaborate what is happening at =
my end -</div><div><br></div><div>
</div><div><strong>First</strong> -</div><div>Used the same versions as per=
 the doc.  Built HSS <font style=3D"font-family:monospace">2020.12 </font>a=
nd used <font style=3D"font-family:monospace">core-image-minimal-</font><sp=
an style=3D"background-image:linear-gradient(to left,red 40%,rgba(255,255,2=
55,0) 0%);background-position:50% 100%;background-size:5px 1.3px;background=
-repeat:repeat-x"><font style=3D"font-family:monospace">dev</font></span><f=
ont style=3D"font-family:monospace">-icicle-kit-es-</font><span style=3D"ba=
ckground-image:linear-gradient(to left,red 40%,rgba(255,255,255,0) 0%);back=
ground-position:50% 100%;background-size:5px 1.3px;background-repeat:repeat=
-x"><font style=3D"font-family:monospace">sd</font></span><font style=3D"fo=
nt-family:monospace">-20201009141623.</font><span style=3D"background-image=
:linear-gradient(to left,red 40%,rgba(255,255,255,0) 0%);background-positio=
n:50% 100%;background-size:5px 1.3px;background-repeat:repeat-x"><font styl=
e=3D"font-family:monospace">rootfs</font></span><font style=3D"font-family:=
monospace">.</font><span style=3D"background-image:linear-gradient(to left,=
red 40%,rgba(255,255,255,0) 0%);background-position:50% 100%;background-siz=
e:5px 1.3px;background-repeat:repeat-x"><font style=3D"font-family:monospac=
e">wic</font></span><font style=3D"font-family:monospace">.</font></div><di=
v>
</div><div>
</div><div>Upon executing the <span style=3D"background-image:linear-gradie=
nt(to left,red 40%,rgba(255,255,255,0) 0%);background-position:50% 100%;bac=
kground-size:5px 1.3px;background-repeat:repeat-x">qemu</span> launch comma=
nd as per the doc, it&#39;s just waits for the connection on another serial=
 console -</div><div><br></div><div><font style=3D"font-family:monospace">i=
nfo: QEMU waiting for connection on: disconnected:</font><span style=3D"bac=
kground-image:linear-gradient(to left,red 40%,rgba(255,255,255,0) 0%);backg=
round-position:50% 100%;background-size:5px 1.3px;background-repeat:repeat-=
x"><font style=3D"font-family:monospace">unix</font></span><font style=3D"f=
ont-family:monospace">:serial1.sock,server=3Don</font></div><div>
</div><div><br></div><div>Even if I open <span style=3D"background-image:li=
near-gradient(to left,red 40%,rgba(255,255,255,0) 0%);background-position:5=
0% 100%;background-size:5px 1.3px;background-repeat:repeat-x"><font style=
=3D"font-family:monospace">sudo</font></span><font style=3D"font-family:mon=
ospace"> </font><span style=3D"background-image:linear-gradient(to left,red=
 40%,rgba(255,255,255,0) 0%);background-position:50% 100%;background-size:5=
px 1.3px;background-repeat:repeat-x"><font style=3D"font-family:monospace">=
minicom</font></span><font style=3D"font-family:monospace"> -D </font><span=
 style=3D"background-image:linear-gradient(to left,red 40%,rgba(255,255,255=
,0) 0%);background-position:50% 100%;background-size:5px 1.3px;background-r=
epeat:repeat-x"><font style=3D"font-family:monospace">unix\</font></span><f=
ont style=3D"font-family:monospace">#serial1.sock</font>, which remains off=
line always.</div><div>
</div><div><strong><br></strong></div><div><strong>Second</strong> -</div><=
div>If I remove the  <font style=3D"font-family:monospace">&quot;-</font><s=
pan style=3D"background-image:linear-gradient(to left,red 40%,rgba(255,255,=
255,0) 0%);background-position:50% 100%;background-size:5px 1.3px;backgroun=
d-repeat:repeat-x"><font style=3D"font-family:monospace">chardev</font></sp=
an><font style=3D"font-family:monospace"> socket,id=3Dserial1,path=3Dserial=
1.sock,server=3Don,wait=3Don -serial </font><span style=3D"background-image=
:linear-gradient(to left,red 40%,rgba(255,255,255,0) 0%);background-positio=
n:50% 100%;background-size:5px 1.3px;background-repeat:repeat-x"><font styl=
e=3D"font-family:monospace">chardev</font></span><font style=3D"font-family=
:monospace">:serial1&quot; </font>from the</div><div>qemu launch command th=
en HSS boots but stops after sbi_init on all the cores and put the cores in=
 Idle -</div><div><br></div><div>
</div><div><font style=3D"font-family:monospace">[5.443011] boot_download_c=
hunks_onExit(): boot_service(u54_1)::u54_1:sbi_init 80200000               =
                                                                         </=
font></div><div><font style=3D"font-family:monospace">[5.444960] boot_wait_=
onEntry(): boot_service(u54_1)::Checking for IPI ACKs: - -                 =
                                                                           =
   </font></div><div><font style=3D"font-family:monospace">[5.447962] boot_=
wait_handler(): boot_service(u54_1)::Checking for IPI ACKs: ACK/IDLE ACK   =
                                                                         </=
font></div><div><font style=3D"font-family:monospace">[5.449343] RunStateMa=
chine(): boot_service(u54_1)::Wait -&gt; boot_service(u54_1)::Idle   </font=
></div><div>
</div><div>
</div><div><br></div><div><strong>Third -</strong></div><div>If I take the =
latest release of HSS 2021.04 and build with gcc10, it does not boot at all=
 even if I remove the serial1 like in the second case.</div><div><br></div>=
<div><br></div><div>Thanks</div><div>Rahul</div></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 31, 2021=
 at 8:19 AM Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=3D"_b=
lank">bmeng.cn@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Hi Rahul,<br>
<br>
On Mon, May 31, 2021 at 1:08 AM Rahul Pathak &lt;<a href=3D"mailto:rpathak@=
ventanamicro.com" target=3D"_blank">rpathak@ventanamicro.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt; Hi Bin,<br>
&gt;<br>
&gt; I was reading a github issue which you raised for the issue with HSS b=
ecause of GCC 10.1. Its pretty old and not sure what has changed so I thoug=
ht to ask you over email for help.<br>
<br>
The HSS issue of GCC 10.1 was already fixed in the HSS mainline.<br>
<br>
&gt; I myself is trying to make a setup to boot the=C2=A0 microchip-icicle-=
kit Qemu machine with HSS and Yocto linux image. Currently it does not work=
.<br>
<br>
Could you please elaborate which part does not work? Is that Linux,<br>
HSS, or U-Boot?<br>
<br>
&gt;<br>
&gt; Do you know what is the right setup to make=C2=A0 microchip-icicle-kit=
 machine with HSS.bin and Yocto linux work on Qemu?. Probably there will be=
 a working combination of HSS, Linux releases plus the toolchain version wh=
ich makes this setup work.<br>
&gt;<br>
<br>
I have not tried Yocto Linux yet with Microchip Icicle Kit on QEMU. I<br>
only tested the Linux images released by Microchip.<br>
Could you please follow the instructions @<br>
<a href=3D"https://qemu.readthedocs.io/en/latest/system/riscv/microchip-ici=
cle-kit.html" rel=3D"noreferrer" target=3D"_blank">https://qemu.readthedocs=
.io/en/latest/system/riscv/microchip-icicle-kit.html</a><br>
to see which step might be wrong on your side?<br>
<br>
Regards,<br>
Bin<br>
</blockquote></div></div>
</blockquote></div>

--0000000000002e72d305c3a13f5b--

