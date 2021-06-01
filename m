Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lo55X-00045Q-7B
	for mharc-qemu-riscv@gnu.org; Tue, 01 Jun 2021 10:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lo55V-00040n-Gc; Tue, 01 Jun 2021 10:09:45 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:45612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lo55T-000231-7k; Tue, 01 Jun 2021 10:09:45 -0400
Received: by mail-yb1-xb30.google.com with SMTP id g38so21303054ybi.12;
 Tue, 01 Jun 2021 07:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0rZjMipqbewndnwGMjcRz6/Mqb210LlSdvf6Mqfnz1E=;
 b=NDpEfDoHmJbIliL60UAmx1XLNcqMegAyigvNgNIy+kFsaF0+Ja4w241c7C+hlG+5tP
 wVqDys0muQz7uXLsTFTNZPIqdNfBvQ8K77tPTgn3gFiXlpjc3LdTdwb4Hvmzw7zs7IkU
 rQtnwkGGKAWckISgg1gzhz3+NloMv+xpO9w1wTzZ04Ku2Z2w2yDuiBfHozmb5FsTMDNk
 ewuiYevEZnVmOa7/2vvGfaoBMmSff0OfgjrazuiXBFe+VNlrkP5GSb1ptBRJegCe4u5s
 8M7Yv0bXpeQ7kx6/EKoTROM6zT+BTVSCPvrY3yvwpnXDnSXMggNfHJkxBFYRzfc2nafs
 Chuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0rZjMipqbewndnwGMjcRz6/Mqb210LlSdvf6Mqfnz1E=;
 b=Zx7kOfoArwDHOn9yGM+TLjdCLThu36i0HX4dTkA2EIOg1UW4/z+jB8nkSt3L5OEU7B
 HHW1qUq9BYip2YrRfLbtrHztas1EejQ5hdj9vzHtmhjXkVwGM/3OZ7Vr3gC5p3aNQKpj
 7vJgjFqVI5B6DBdwJHNFHu9ZvBDeqPfGPBdjnHOt9ibdYj+lBCv94qUCvmCyVGqK+iso
 jHh/bZSlS66uiBXpJUdO2Zf4mAI5vjv317bjdXAvA5W0bTO1QsG6VbxPPO9bXqb843A7
 PNicEvAhjvseVWQAo3o+K93RPCvBwnylXZ5JmPtFT3DNMiKgJP25uaYardE4VXvFZa0i
 srcw==
X-Gm-Message-State: AOAM5310F1TqHrL9KDiFcdelg5BH+989nIcs8pzvukX6vlOlExt5xsbm
 BVUPI9+FAgYVgBqDmjylYrWCx5ciA5oR7VleKu8=
X-Google-Smtp-Source: ABdhPJz1Hn/wNYycyyT9tH1iNtpctxk5MbPYdD/k3M/e9o7+gGAtcpy/P/YO579y1K5GxN8vl70i7tJ16rdUICNXr0c=
X-Received: by 2002:a25:412:: with SMTP id 18mr40147717ybe.152.1622556581915; 
 Tue, 01 Jun 2021 07:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <0CAA9018-0C42-4140-82C1-EAC80D46D359@getmailspring.com>
 <CAEUhbmWnj3GOD5-EA54XHRQyfiSdOsH+KKGH-+uG0LEH+kAuUg@mail.gmail.com>
 <CA+Oz1=Z4J8KCHk_TZTUB9aEODaRv0F3bF6jtCHwdKQ02VgjcTQ@mail.gmail.com>
 <CAMSwOgoq5KNoU3aP6kGZxAVhj_phxJvmCWb=6dKB7SkbXjaJyQ@mail.gmail.com>
 <CAEUhbmWCvPVo5Jww0GPb6uX0xBfRKqZD6Jp-e54sU+v6R=m3gQ@mail.gmail.com>
 <CA+Oz1=b=wBCCVVHWic8UrJQY5aEB+9OYS2XVtn6FEA2R6wm5yw@mail.gmail.com>
In-Reply-To: <CA+Oz1=b=wBCCVVHWic8UrJQY5aEB+9OYS2XVtn6FEA2R6wm5yw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 1 Jun 2021 22:09:30 +0800
Message-ID: <CAEUhbmXXvhkZA0QgK1mvADq-FLKU56gt9PXyNW3i_n1SnKq8Lw@mail.gmail.com>
Subject: Re: HSS Issue with GCC 10, Qemu Setup for microchip-icicle-kit
To: Rahul Pathak <rpathak@ventanamicro.com>
Cc: Rahul Pathak <rpathakmailbox@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 01 Jun 2021 14:09:45 -0000

Hi Rahul,

On Tue, Jun 1, 2021 at 11:12 AM Rahul Pathak <rpathak@ventanamicro.com> wrote:
>
> Hi BIn,Alistair,
>
> I was passing the hss.elf file and it was strange that gdb after connecting was not letting the target to continue from gdb.

This is the expected behavior if you pass an image to gdb before
connecting to the target, as gdb will assume the debug contexts are
the same, but it's not the case for PolarFire which has 1+4 hybrid
configuration.

> what worked was to not pass anything and then connect the to target then load the symbol file as hss.elf.
> I followed the steps from the "Attaching the GDB" doc and was able to debug.
>

Yes, that's the correct way to debug PolarFire.

>
> For the qemu command line from the doc, I made the "wait=off" then qemu was not waiting for another serial connection
> and launched the hss.

You need to connect to the other serial connection otherwise QEMU does
not start the emulation when "wait=on"

>
>
> The problem remains is that I still do not have the u-boot and linux booting. The unix\#serial1.sock remains offline always.
> These are the HSS logs -
>
> [0.115001] HSS_E51_Banner(): PolarFire(R) SoC Hart Software Services (HSS) - version 0.99.15
> (c) Copyright 2017-2020 Microchip Corporation.
>
> [0.116234] HSS_E51_Banner(): incorporating OpenSBI - version 0.6
> (c) Copyright 2019-2020 Western Digital Corporation.
>
> [0.117071] HSS_PrintBuildId(): Build ID: 811342a39f80176f9e2086bf963a83224b3d3a2e
> [0.117817] HSS_PrintToolVersions(): Built with the following tools:
>  - riscv64-unknown-linux-gnu-gcc (GCC) 10.2.0

Yeah, this log indicates that GCC 10.x works with HSS :)

>  - GNU ld (GNU Binutils) 2.36.1
>
> [0.118760] HSS_MemTestDDRFast(): DDR size is 1 GiB
> [0.130270] HSS_MMCInit(): Attempting to select SDCARD ... Passed
> Press a key to enter CLI, ESC to skip
> Timeout in 5 seconds
>
> .....
> [5.138747] HSS_TinyCLI_Parser(): CLI check timeout
> [5.139371] IPI_QueuesInit(): Initializing IPI Queues (9000 bytes @ 8000e40)...
> [5.140435] HSS_PMP_Init(): Initializing PMPs
> [5.141093] HSS_BootInit(): Initializing Boot Image..
> [5.141787] getBootImageFromMMC_(): Preparing to copy from MMC to DDR ...
> [5.142671] getBootImageFromMMC_(): Attempting to read image header (1552 bytes) ...
> [5.144118] GPT_ValidateHeader(): Validated GPT Header ...
> [5.153768] GPT_ValidatePartitionEntries(): Validated GPT Partition Entries ...
> [5.155210] copyBootImageToDDR_(): Copying 436008 bytes to 0xA0000000
> [5.407848] copyBootImageToDDR_(): Calculated CRC32 of image in DDR is 795fbbea
> [5.412058] HSS_BootInit():  boot image passed CRC
> [5.412407] HSS_BootInit(): Boot image set name: "PolarFire-SoC-HSS::U-Boot"
> [5.412951] HSS_BootInit(): Boot Image registered...
> [5.413376] HSS_Boot_RestartCore(): called for all harts
> [5.414295] RunStateMachine(): boot_service(u54_1)::Init -> boot_service(u54_1)::SetupPMP
> [5.414812] RunStateMachine(): boot_service(u54_2)::Init -> boot_service(u54_2)::SetupPMP
> [5.415207] RunStateMachine(): boot_service(u54_3)::Init -> boot_service(u54_3)::SetupPMP
> [5.415631] RunStateMachine(): boot_service(u54_4)::Init -> boot_service(u54_4)::SetupPMP
> [5.416107] RunStateMachine(): usbdmsc_service::init -> usbdmsc_service::idle
> [5.417164] RunStateMachine(): boot_service(u54_1)::SetupPMP -> boot_service(u54_1)::SetupPMPComplete
> [5.417887] RunStateMachine(): boot_service(u54_2)::SetupPMP -> boot_service(u54_2)::SetupPMPComplete
> [5.418552] RunStateMachine(): boot_service(u54_3)::SetupPMP -> boot_service(u54_3)::SetupPMPComplete
> [5.419890] RunStateMachine(): boot_service(u54_4)::SetupPMP -> boot_service(u54_4)::SetupPMPComplete
> [23.955147] RunStateMachine(): boot_service(u54_1)::SetupPMPComplete -> boot_service(u54_1)::ZeroInit
> [23.955754] RunStateMachine(): boot_service(u54_2)::SetupPMPComplete -> boot_service(u54_2)::ZeroInit
> [23.956259] RunStateMachine(): boot_service(u54_3)::SetupPMPComplete -> boot_service(u54_3)::ZeroInit
> [23.956757] RunStateMachine(): boot_service(u54_4)::SetupPMPComplete -> boot_service(u54_4)::ZeroInit
> [23.957371] RunStateMachine(): boot_service(u54_1)::ZeroInit -> boot_service(u54_1)::Download
> [23.957876] RunStateMachine(): boot_service(u54_2)::ZeroInit -> boot_service(u54_2)::Download
> [23.958386] RunStateMachine(): boot_service(u54_3)::ZeroInit -> boot_service(u54_3)::Download
> [23.958856] RunStateMachine(): boot_service(u54_4)::ZeroInit -> boot_service(u54_4)::Download
> [23.960300] RunStateMachine(): boot_service(u54_2)::Download -> boot_service(u54_2)::Idle
> [23.960723] RunStateMachine(): boot_service(u54_3)::Download -> boot_service(u54_3)::Idle
> [23.961129] RunStateMachine(): boot_service(u54_4)::Download -> boot_service(u54_4)::Idle
> [23.983168] RunStateMachine(): boot_service(u54_1)::Download -> boot_service(u54_1)::Wait
> [23.983661] boot_download_chunks_onExit(): boot_service(u54_1)::u54_2:sbi_init 80200000
> [23.984374] boot_download_chunks_onExit(): boot_service(u54_1)::u54_3:sbi_init 80200000
> [23.985418] boot_download_chunks_onExit(): boot_service(u54_1)::u54_4:sbi_init 80200000
> [23.986783] boot_download_chunks_onExit(): boot_service(u54_1)::u54_1:sbi_init 80200000
> [23.989086] boot_wait_onEntry(): boot_service(u54_1)::Checking for IPI ACKs: - -
> [23.992106] boot_wait_handler(): boot_service(u54_1)::Checking for IPI ACKs: ACK/IDLE ACK
> [23.994062] RunStateMachine(): boot_service(u54_1)::Wait -> boot_service(u54_1)::Idle
>

Based on the above log, HSS successfully boots U-Boot already. The
U-Boot console is on the other serial console, which I guess you might
turn it off?

>
> One thing I overlooked in the document is that we are preparing the *.wic file after downloading
> but passing the *.img in the qemu command. How to convert the wic to img. I couldn't see much about
> this on the internet ?

The *.wic image is the raw image. Just use it as it is.

> Since U-boot currently does not boot, it seems passing the wic file directly is not right. Now sure here.
>
>  qemu-system-riscv64 -M microchip-icicle-kit -smp 5 \
>     -bios path/to/hss.bin -sd path/to/sdcard.img \
>     -nic user,model=cadence_gem \
>     -nic tap,ifname=tap,model=cadence_gem,script=no \
>     -display none -serial stdio \
>     -chardev socket,id=serial1,path=serial1.sock,server=on,wait=on \
>     -serial chardev:serial1
>
>
> Are there other ways in qemu icicle machine supported now to pass the u-boot and kernel?
>

Yes, it has. The capability to direct boot kernel (can be U-Boot or an
OS kernel) without HSS is currently in the Alistair's riscv-next tree
and should land on qemu/master soon.

Regards,
Bin

