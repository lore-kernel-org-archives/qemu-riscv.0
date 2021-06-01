Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lo9Gk-0000p6-LA
	for mharc-qemu-riscv@gnu.org; Tue, 01 Jun 2021 14:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1lo9Gj-0000oq-KZ
 for qemu-riscv@nongnu.org; Tue, 01 Jun 2021 14:37:37 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:34410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1lo9Gg-0006Zv-V0
 for qemu-riscv@nongnu.org; Tue, 01 Jun 2021 14:37:37 -0400
Received: by mail-ej1-x635.google.com with SMTP id g8so14823204ejx.1
 for <qemu-riscv@nongnu.org>; Tue, 01 Jun 2021 11:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t8lyh9LUX7vehsIV1GTvaa4aECYiZaAvk0/weS/g7IU=;
 b=WjQ8is1otZ5e7y4gucHbp9uiSntzcZEj6PfFPHX/b6GWN+2W9C1IH5ELj7IjliiGBY
 e/8a3QDD5j4n+iWSn5foKdeb8Y+rYhg3v/5ButM1+AFTbtfB8BfEsRoX3CZgO9Z27ykX
 3wgrDYT9BpAQfjy2tdd3/8EkejxW3elnUPqafE9ke21aylVTehpQ+Yp92tzMFMTYQ4wa
 Pp6wYeLom8nHlXAY6MhCYDICAqj3MFr1tHQSnYrWlQ7Rei+zUnmPw+aqFY9qC27fw/8J
 GDmbIClHyY9Gc1v3o966Xl5I8TuV3Ad29HTIyH7V0osGodHIZpAVx74daxI7sHBK6zvw
 PFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t8lyh9LUX7vehsIV1GTvaa4aECYiZaAvk0/weS/g7IU=;
 b=DZ9UWiTTCi6n3AT8nCE9Hg6MAu/LGubOuTgOUa0/D5I1bAq+PBKJ9GmkB3eYNA0jbP
 OBuFp1gCFDETRYz5BtSijr9qWKOUP970thtWL5rAsmgJ+wkQuj4ygX1bFy7KTmvUf2W+
 jfKRE9AcGXBu1u2m9/hlGiBCUz40M0R9j2g96bCtf5/Mne0XoCzknC028lNSrB3ICfmj
 4fVTlLXAkROQUGks2NwiBoOHriDSdCQxvdrv3kKOwO7Nqg+3Gz8N9cCvqGYzw86Ud/St
 vqglv959HFw7kMSC48xozzRYOxEe4jmVPo05xWpoEr9XJchJ5eN1L7Q+pjUuzSQTmA/v
 F4eA==
X-Gm-Message-State: AOAM531Mp3YVbCjl3ZPtJ9ExQZl6S/nphHCjnqwdV78bjB6u02/xrP9X
 9vt08uwPNc1DEAXGiHT6abQhjxCqHmnt9iTlxPpvvg==
X-Google-Smtp-Source: ABdhPJzL3CtpzTNjtdrKOAw9iq1OGsosf71eYBHicC+q/xuLOJl6Z4mb411B8aZFMZEZfXXirY4zdVpv8S9aQlvsozk=
X-Received: by 2002:a17:906:c1ca:: with SMTP id
 bw10mr31196958ejb.512.1622572653018; 
 Tue, 01 Jun 2021 11:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <0CAA9018-0C42-4140-82C1-EAC80D46D359@getmailspring.com>
 <CAEUhbmWnj3GOD5-EA54XHRQyfiSdOsH+KKGH-+uG0LEH+kAuUg@mail.gmail.com>
 <CA+Oz1=Z4J8KCHk_TZTUB9aEODaRv0F3bF6jtCHwdKQ02VgjcTQ@mail.gmail.com>
 <CAMSwOgoq5KNoU3aP6kGZxAVhj_phxJvmCWb=6dKB7SkbXjaJyQ@mail.gmail.com>
 <CAEUhbmWCvPVo5Jww0GPb6uX0xBfRKqZD6Jp-e54sU+v6R=m3gQ@mail.gmail.com>
 <CA+Oz1=b=wBCCVVHWic8UrJQY5aEB+9OYS2XVtn6FEA2R6wm5yw@mail.gmail.com>
 <CAEUhbmXXvhkZA0QgK1mvADq-FLKU56gt9PXyNW3i_n1SnKq8Lw@mail.gmail.com>
 <CA+Oz1=YMU-YT7XeeqXVSzXL7bQqtxrqFEZCV9a+X3Mu0z7rzPw@mail.gmail.com>
In-Reply-To: <CA+Oz1=YMU-YT7XeeqXVSzXL7bQqtxrqFEZCV9a+X3Mu0z7rzPw@mail.gmail.com>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Wed, 2 Jun 2021 00:06:56 +0530
Message-ID: <CA+Oz1=aOnAieXvXR40HHjnOUYqt0_v1FAhL5-4iy=87mHQiM3Q@mail.gmail.com>
Subject: Re: HSS Issue with GCC 10, Qemu Setup for microchip-icicle-kit
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Rahul Pathak <rpathakmailbox@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000009b1c0605c3b8a20b"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=rpathak@ventanamicro.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 01 Jun 2021 18:37:37 -0000

--0000000000009b1c0605c3b8a20b
Content-Type: text/plain; charset="UTF-8"

I swapped the serial_hd() index between the MMUART0 and MMUART1 , so my
default qemu console is the MMUART1.
I can see the U-Boot and Kernel logs now.

I still need both serial consoles for HSS and UBoot/Kernel and will need
your help to make the original qemu command line work with
unix\#serial1.sock.
I am unable to figure out what's wrong with unix\#serial1.sock

On Tue, Jun 1, 2021 at 7:48 PM Rahul Pathak <rpathak@ventanamicro.com>
wrote:

> Hi Bin,
>
> Thanks for the response.
>
> I think the issue currently is that if I keep the "wait=on" and launch
> minicom on  "unix\#serial1.sock" then nothing happens.
> Qemu keeps waiting for the connection on serial1 and no logs for uboot and
> Kernel appears on the serial1.
>
> Thanks
> Rahul
>
> On Tue, Jun 1, 2021 at 7:39 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
>> Hi Rahul,
>>
>> On Tue, Jun 1, 2021 at 11:12 AM Rahul Pathak <rpathak@ventanamicro.com>
>> wrote:
>> >
>> > Hi BIn,Alistair,
>> >
>> > I was passing the hss.elf file and it was strange that gdb after
>> connecting was not letting the target to continue from gdb.
>>
>> This is the expected behavior if you pass an image to gdb before
>> connecting to the target, as gdb will assume the debug contexts are
>> the same, but it's not the case for PolarFire which has 1+4 hybrid
>> configuration.
>>
>> > what worked was to not pass anything and then connect the to target
>> then load the symbol file as hss.elf.
>> > I followed the steps from the "Attaching the GDB" doc and was able to
>> debug.
>> >
>>
>> Yes, that's the correct way to debug PolarFire.
>>
>> >
>> > For the qemu command line from the doc, I made the "wait=off" then qemu
>> was not waiting for another serial connection
>> > and launched the hss.
>>
>> You need to connect to the other serial connection otherwise QEMU does
>> not start the emulation when "wait=on"
>>
>> >
>> >
>> > The problem remains is that I still do not have the u-boot and linux
>> booting. The unix\#serial1.sock remains offline always.
>> > These are the HSS logs -
>> >
>> > [0.115001] HSS_E51_Banner(): PolarFire(R) SoC Hart Software Services
>> (HSS) - version 0.99.15
>> > (c) Copyright 2017-2020 Microchip Corporation.
>> >
>> > [0.116234] HSS_E51_Banner(): incorporating OpenSBI - version 0.6
>> > (c) Copyright 2019-2020 Western Digital Corporation.
>> >
>> > [0.117071] HSS_PrintBuildId(): Build ID:
>> 811342a39f80176f9e2086bf963a83224b3d3a2e
>> > [0.117817] HSS_PrintToolVersions(): Built with the following tools:
>> >  - riscv64-unknown-linux-gnu-gcc (GCC) 10.2.0
>>
>> Yeah, this log indicates that GCC 10.x works with HSS :)
>>
>> >  - GNU ld (GNU Binutils) 2.36.1
>> >
>> > [0.118760] HSS_MemTestDDRFast(): DDR size is 1 GiB
>> > [0.130270] HSS_MMCInit(): Attempting to select SDCARD ... Passed
>> > Press a key to enter CLI, ESC to skip
>> > Timeout in 5 seconds
>> >
>> > .....
>> > [5.138747] HSS_TinyCLI_Parser(): CLI check timeout
>> > [5.139371] IPI_QueuesInit(): Initializing IPI Queues (9000 bytes @
>> 8000e40)...
>> > [5.140435] HSS_PMP_Init(): Initializing PMPs
>> > [5.141093] HSS_BootInit(): Initializing Boot Image..
>> > [5.141787] getBootImageFromMMC_(): Preparing to copy from MMC to DDR ...
>> > [5.142671] getBootImageFromMMC_(): Attempting to read image header
>> (1552 bytes) ...
>> > [5.144118] GPT_ValidateHeader(): Validated GPT Header ...
>> > [5.153768] GPT_ValidatePartitionEntries(): Validated GPT Partition
>> Entries ...
>> > [5.155210] copyBootImageToDDR_(): Copying 436008 bytes to 0xA0000000
>> > [5.407848] copyBootImageToDDR_(): Calculated CRC32 of image in DDR is
>> 795fbbea
>> > [5.412058] HSS_BootInit():  boot image passed CRC
>> > [5.412407] HSS_BootInit(): Boot image set name:
>> "PolarFire-SoC-HSS::U-Boot"
>> > [5.412951] HSS_BootInit(): Boot Image registered...
>> > [5.413376] HSS_Boot_RestartCore(): called for all harts
>> > [5.414295] RunStateMachine(): boot_service(u54_1)::Init ->
>> boot_service(u54_1)::SetupPMP
>> > [5.414812] RunStateMachine(): boot_service(u54_2)::Init ->
>> boot_service(u54_2)::SetupPMP
>> > [5.415207] RunStateMachine(): boot_service(u54_3)::Init ->
>> boot_service(u54_3)::SetupPMP
>> > [5.415631] RunStateMachine(): boot_service(u54_4)::Init ->
>> boot_service(u54_4)::SetupPMP
>> > [5.416107] RunStateMachine(): usbdmsc_service::init ->
>> usbdmsc_service::idle
>> > [5.417164] RunStateMachine(): boot_service(u54_1)::SetupPMP ->
>> boot_service(u54_1)::SetupPMPComplete
>> > [5.417887] RunStateMachine(): boot_service(u54_2)::SetupPMP ->
>> boot_service(u54_2)::SetupPMPComplete
>> > [5.418552] RunStateMachine(): boot_service(u54_3)::SetupPMP ->
>> boot_service(u54_3)::SetupPMPComplete
>> > [5.419890] RunStateMachine(): boot_service(u54_4)::SetupPMP ->
>> boot_service(u54_4)::SetupPMPComplete
>> > [23.955147] RunStateMachine(): boot_service(u54_1)::SetupPMPComplete ->
>> boot_service(u54_1)::ZeroInit
>> > [23.955754] RunStateMachine(): boot_service(u54_2)::SetupPMPComplete ->
>> boot_service(u54_2)::ZeroInit
>> > [23.956259] RunStateMachine(): boot_service(u54_3)::SetupPMPComplete ->
>> boot_service(u54_3)::ZeroInit
>> > [23.956757] RunStateMachine(): boot_service(u54_4)::SetupPMPComplete ->
>> boot_service(u54_4)::ZeroInit
>> > [23.957371] RunStateMachine(): boot_service(u54_1)::ZeroInit ->
>> boot_service(u54_1)::Download
>> > [23.957876] RunStateMachine(): boot_service(u54_2)::ZeroInit ->
>> boot_service(u54_2)::Download
>> > [23.958386] RunStateMachine(): boot_service(u54_3)::ZeroInit ->
>> boot_service(u54_3)::Download
>> > [23.958856] RunStateMachine(): boot_service(u54_4)::ZeroInit ->
>> boot_service(u54_4)::Download
>> > [23.960300] RunStateMachine(): boot_service(u54_2)::Download ->
>> boot_service(u54_2)::Idle
>> > [23.960723] RunStateMachine(): boot_service(u54_3)::Download ->
>> boot_service(u54_3)::Idle
>> > [23.961129] RunStateMachine(): boot_service(u54_4)::Download ->
>> boot_service(u54_4)::Idle
>> > [23.983168] RunStateMachine(): boot_service(u54_1)::Download ->
>> boot_service(u54_1)::Wait
>> > [23.983661] boot_download_chunks_onExit():
>> boot_service(u54_1)::u54_2:sbi_init 80200000
>> > [23.984374] boot_download_chunks_onExit():
>> boot_service(u54_1)::u54_3:sbi_init 80200000
>> > [23.985418] boot_download_chunks_onExit():
>> boot_service(u54_1)::u54_4:sbi_init 80200000
>> > [23.986783] boot_download_chunks_onExit():
>> boot_service(u54_1)::u54_1:sbi_init 80200000
>> > [23.989086] boot_wait_onEntry(): boot_service(u54_1)::Checking for IPI
>> ACKs: - -
>> > [23.992106] boot_wait_handler(): boot_service(u54_1)::Checking for IPI
>> ACKs: ACK/IDLE ACK
>> > [23.994062] RunStateMachine(): boot_service(u54_1)::Wait ->
>> boot_service(u54_1)::Idle
>> >
>>
>> Based on the above log, HSS successfully boots U-Boot already. The
>> U-Boot console is on the other serial console, which I guess you might
>> turn it off?
>>
>> >
>> > One thing I overlooked in the document is that we are preparing the
>> *.wic file after downloading
>> > but passing the *.img in the qemu command. How to convert the wic to
>> img. I couldn't see much about
>> > this on the internet ?
>>
>> The *.wic image is the raw image. Just use it as it is.
>>
>> > Since U-boot currently does not boot, it seems passing the wic file
>> directly is not right. Now sure here.
>> >
>> >  qemu-system-riscv64 -M microchip-icicle-kit -smp 5 \
>> >     -bios path/to/hss.bin -sd path/to/sdcard.img \
>> >     -nic user,model=cadence_gem \
>> >     -nic tap,ifname=tap,model=cadence_gem,script=no \
>> >     -display none -serial stdio \
>> >     -chardev socket,id=serial1,path=serial1.sock,server=on,wait=on \
>> >     -serial chardev:serial1
>> >
>> >
>> > Are there other ways in qemu icicle machine supported now to pass the
>> u-boot and kernel?
>> >
>>
>> Yes, it has. The capability to direct boot kernel (can be U-Boot or an
>> OS kernel) without HSS is currently in the Alistair's riscv-next tree
>> and should land on qemu/master soon.
>>
>> Regards,
>> Bin
>>
>

--0000000000009b1c0605c3b8a20b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif">I swapped the serial_hd() index between the MMUART0 and MMUART1=
=C2=A0, so my default qemu console is the MMUART1.</div><div class=3D"gmail=
_default" style=3D"font-family:verdana,sans-serif">I can see the U-Boot and=
 Kernel logs now.=C2=A0</div><div class=3D"gmail_default" style=3D"font-fam=
ily:verdana,sans-serif"><br></div><div class=3D"gmail_default" style=3D"fon=
t-family:verdana,sans-serif">I still need both serial consoles for HSS and =
UBoot/Kernel and will need your help to make the original qemu command line=
 work with unix\#serial1.sock.</div><div class=3D"gmail_default" style=3D"f=
ont-family:verdana,sans-serif">I am unable to figure out what&#39;s wrong w=
ith=C2=A0unix\#serial1.sock</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 1, 2021 at 7:48 PM Rahul Patha=
k &lt;<a href=3D"mailto:rpathak@ventanamicro.com" target=3D"_blank">rpathak=
@ventanamicro.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:verdana,sans-serif">Hi Bin,</div><div class=3D"gmail_default" styl=
e=3D"font-family:verdana,sans-serif"><br></div><div class=3D"gmail_default"=
 style=3D"font-family:verdana,sans-serif">Thanks for the response.=C2=A0</d=
iv><div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif"><b=
r></div><div class=3D"gmail_default" style=3D"font-family:verdana,sans-seri=
f">I think the issue currently=C2=A0is that if I keep the &quot;wait=3Don&q=
uot; and launch minicom on=C2=A0 &quot;unix\#serial1.sock&quot; then nothin=
g happens.</div><div class=3D"gmail_default" style=3D"font-family:verdana,s=
ans-serif">Qemu keeps waiting for the connection on serial1 and no logs for=
 uboot and Kernel appears on the serial1.</div><div class=3D"gmail_default"=
 style=3D"font-family:verdana,sans-serif"><br></div><div class=3D"gmail_def=
ault" style=3D"font-family:verdana,sans-serif">Thanks</div><div class=3D"gm=
ail_default" style=3D"font-family:verdana,sans-serif">Rahul</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Ju=
n 1, 2021 at 7:39 PM Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" tar=
get=3D"_blank">bmeng.cn@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Rahul,<br>
<br>
On Tue, Jun 1, 2021 at 11:12 AM Rahul Pathak &lt;<a href=3D"mailto:rpathak@=
ventanamicro.com" target=3D"_blank">rpathak@ventanamicro.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt; Hi BIn,Alistair,<br>
&gt;<br>
&gt; I was passing the hss.elf file and it was strange that gdb after conne=
cting was not letting the target to continue from gdb.<br>
<br>
This is the expected behavior if you pass an image to gdb before<br>
connecting to the target, as gdb will assume the debug contexts are<br>
the same, but it&#39;s not the case for PolarFire which has 1+4 hybrid<br>
configuration.<br>
<br>
&gt; what worked was to not pass anything and then connect the to target th=
en load the symbol file as hss.elf.<br>
&gt; I followed the steps from the &quot;Attaching the GDB&quot; doc and wa=
s able to debug.<br>
&gt;<br>
<br>
Yes, that&#39;s the correct way to debug PolarFire.<br>
<br>
&gt;<br>
&gt; For the qemu command line from the doc, I made the &quot;wait=3Doff&qu=
ot; then qemu was not waiting for another serial connection<br>
&gt; and launched the hss.<br>
<br>
You need to connect to the other serial connection otherwise QEMU does<br>
not start the emulation when &quot;wait=3Don&quot;<br>
<br>
&gt;<br>
&gt;<br>
&gt; The problem remains is that I still do not have the u-boot and linux b=
ooting. The unix\#serial1.sock remains offline always.<br>
&gt; These are the HSS logs -<br>
&gt;<br>
&gt; [0.115001] HSS_E51_Banner(): PolarFire(R) SoC Hart Software Services (=
HSS) - version 0.99.15<br>
&gt; (c) Copyright 2017-2020 Microchip Corporation.<br>
&gt;<br>
&gt; [0.116234] HSS_E51_Banner(): incorporating OpenSBI - version 0.6<br>
&gt; (c) Copyright 2019-2020 Western Digital Corporation.<br>
&gt;<br>
&gt; [0.117071] HSS_PrintBuildId(): Build ID: 811342a39f80176f9e2086bf963a8=
3224b3d3a2e<br>
&gt; [0.117817] HSS_PrintToolVersions(): Built with the following tools:<br=
>
&gt;=C2=A0 - riscv64-unknown-linux-gnu-gcc (GCC) 10.2.0<br>
<br>
Yeah, this log indicates that GCC 10.x works with HSS :)<br>
<br>
&gt;=C2=A0 - GNU ld (GNU Binutils) 2.36.1<br>
&gt;<br>
&gt; [0.118760] HSS_MemTestDDRFast(): DDR size is 1 GiB<br>
&gt; [0.130270] HSS_MMCInit(): Attempting to select SDCARD ... Passed<br>
&gt; Press a key to enter CLI, ESC to skip<br>
&gt; Timeout in 5 seconds<br>
&gt;<br>
&gt; .....<br>
&gt; [5.138747] HSS_TinyCLI_Parser(): CLI check timeout<br>
&gt; [5.139371] IPI_QueuesInit(): Initializing IPI Queues (9000 bytes @ 800=
0e40)...<br>
&gt; [5.140435] HSS_PMP_Init(): Initializing PMPs<br>
&gt; [5.141093] HSS_BootInit(): Initializing Boot Image..<br>
&gt; [5.141787] getBootImageFromMMC_(): Preparing to copy from MMC to DDR .=
..<br>
&gt; [5.142671] getBootImageFromMMC_(): Attempting to read image header (15=
52 bytes) ...<br>
&gt; [5.144118] GPT_ValidateHeader(): Validated GPT Header ...<br>
&gt; [5.153768] GPT_ValidatePartitionEntries(): Validated GPT Partition Ent=
ries ...<br>
&gt; [5.155210] copyBootImageToDDR_(): Copying 436008 bytes to 0xA0000000<b=
r>
&gt; [5.407848] copyBootImageToDDR_(): Calculated CRC32 of image in DDR is =
795fbbea<br>
&gt; [5.412058] HSS_BootInit():=C2=A0 boot image passed CRC<br>
&gt; [5.412407] HSS_BootInit(): Boot image set name: &quot;PolarFire-SoC-HS=
S::U-Boot&quot;<br>
&gt; [5.412951] HSS_BootInit(): Boot Image registered...<br>
&gt; [5.413376] HSS_Boot_RestartCore(): called for all harts<br>
&gt; [5.414295] RunStateMachine(): boot_service(u54_1)::Init -&gt; boot_ser=
vice(u54_1)::SetupPMP<br>
&gt; [5.414812] RunStateMachine(): boot_service(u54_2)::Init -&gt; boot_ser=
vice(u54_2)::SetupPMP<br>
&gt; [5.415207] RunStateMachine(): boot_service(u54_3)::Init -&gt; boot_ser=
vice(u54_3)::SetupPMP<br>
&gt; [5.415631] RunStateMachine(): boot_service(u54_4)::Init -&gt; boot_ser=
vice(u54_4)::SetupPMP<br>
&gt; [5.416107] RunStateMachine(): usbdmsc_service::init -&gt; usbdmsc_serv=
ice::idle<br>
&gt; [5.417164] RunStateMachine(): boot_service(u54_1)::SetupPMP -&gt; boot=
_service(u54_1)::SetupPMPComplete<br>
&gt; [5.417887] RunStateMachine(): boot_service(u54_2)::SetupPMP -&gt; boot=
_service(u54_2)::SetupPMPComplete<br>
&gt; [5.418552] RunStateMachine(): boot_service(u54_3)::SetupPMP -&gt; boot=
_service(u54_3)::SetupPMPComplete<br>
&gt; [5.419890] RunStateMachine(): boot_service(u54_4)::SetupPMP -&gt; boot=
_service(u54_4)::SetupPMPComplete<br>
&gt; [23.955147] RunStateMachine(): boot_service(u54_1)::SetupPMPComplete -=
&gt; boot_service(u54_1)::ZeroInit<br>
&gt; [23.955754] RunStateMachine(): boot_service(u54_2)::SetupPMPComplete -=
&gt; boot_service(u54_2)::ZeroInit<br>
&gt; [23.956259] RunStateMachine(): boot_service(u54_3)::SetupPMPComplete -=
&gt; boot_service(u54_3)::ZeroInit<br>
&gt; [23.956757] RunStateMachine(): boot_service(u54_4)::SetupPMPComplete -=
&gt; boot_service(u54_4)::ZeroInit<br>
&gt; [23.957371] RunStateMachine(): boot_service(u54_1)::ZeroInit -&gt; boo=
t_service(u54_1)::Download<br>
&gt; [23.957876] RunStateMachine(): boot_service(u54_2)::ZeroInit -&gt; boo=
t_service(u54_2)::Download<br>
&gt; [23.958386] RunStateMachine(): boot_service(u54_3)::ZeroInit -&gt; boo=
t_service(u54_3)::Download<br>
&gt; [23.958856] RunStateMachine(): boot_service(u54_4)::ZeroInit -&gt; boo=
t_service(u54_4)::Download<br>
&gt; [23.960300] RunStateMachine(): boot_service(u54_2)::Download -&gt; boo=
t_service(u54_2)::Idle<br>
&gt; [23.960723] RunStateMachine(): boot_service(u54_3)::Download -&gt; boo=
t_service(u54_3)::Idle<br>
&gt; [23.961129] RunStateMachine(): boot_service(u54_4)::Download -&gt; boo=
t_service(u54_4)::Idle<br>
&gt; [23.983168] RunStateMachine(): boot_service(u54_1)::Download -&gt; boo=
t_service(u54_1)::Wait<br>
&gt; [23.983661] boot_download_chunks_onExit(): boot_service(u54_1)::u54_2:=
sbi_init 80200000<br>
&gt; [23.984374] boot_download_chunks_onExit(): boot_service(u54_1)::u54_3:=
sbi_init 80200000<br>
&gt; [23.985418] boot_download_chunks_onExit(): boot_service(u54_1)::u54_4:=
sbi_init 80200000<br>
&gt; [23.986783] boot_download_chunks_onExit(): boot_service(u54_1)::u54_1:=
sbi_init 80200000<br>
&gt; [23.989086] boot_wait_onEntry(): boot_service(u54_1)::Checking for IPI=
 ACKs: - -<br>
&gt; [23.992106] boot_wait_handler(): boot_service(u54_1)::Checking for IPI=
 ACKs: ACK/IDLE ACK<br>
&gt; [23.994062] RunStateMachine(): boot_service(u54_1)::Wait -&gt; boot_se=
rvice(u54_1)::Idle<br>
&gt;<br>
<br>
Based on the above log, HSS successfully boots U-Boot already. The<br>
U-Boot console is on the other serial console, which I guess you might<br>
turn it off?<br>
<br>
&gt;<br>
&gt; One thing I overlooked in the document is that we are preparing the *.=
wic file after downloading<br>
&gt; but passing the *.img in the qemu command. How to convert the wic to i=
mg. I couldn&#39;t see much about<br>
&gt; this on the internet ?<br>
<br>
The *.wic image is the raw image. Just use it as it is.<br>
<br>
&gt; Since U-boot currently does not boot, it seems passing the wic file di=
rectly is not right. Now sure here.<br>
&gt;<br>
&gt;=C2=A0 qemu-system-riscv64 -M microchip-icicle-kit -smp 5 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-bios path/to/hss.bin -sd path/to/sdcard.img \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-nic user,model=3Dcadence_gem \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-nic tap,ifname=3Dtap,model=3Dcadence_gem,script=3D=
no \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-display none -serial stdio \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-chardev socket,id=3Dserial1,path=3Dserial1.sock,se=
rver=3Don,wait=3Don \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-serial chardev:serial1<br>
&gt;<br>
&gt;<br>
&gt; Are there other ways in qemu icicle machine supported now to pass the =
u-boot and kernel?<br>
&gt;<br>
<br>
Yes, it has. The capability to direct boot kernel (can be U-Boot or an<br>
OS kernel) without HSS is currently in the Alistair&#39;s riscv-next tree<b=
r>
and should land on qemu/master soon.<br>
<br>
Regards,<br>
Bin<br>
</blockquote></div>
</blockquote></div>

--0000000000009b1c0605c3b8a20b--

