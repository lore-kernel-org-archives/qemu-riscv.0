Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lnqiu-0000ae-2C
	for mharc-qemu-riscv@gnu.org; Mon, 31 May 2021 18:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lnqis-0000Yx-7N; Mon, 31 May 2021 18:49:26 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:43779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lnqip-0002Ac-JP; Mon, 31 May 2021 18:49:26 -0400
Received: by mail-io1-xd2b.google.com with SMTP id k16so13260865ios.10;
 Mon, 31 May 2021 15:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RSVr2l1YT6dcDPX1yaaJ+C5ZQV/AC9Ea81v3IFf3qRg=;
 b=kVrfNGN/Ygs8PtpiVQ690z+PERnDicGSI5CNLzgm7i+j7S4V2Kr2ulyqYFBRvN/+Nc
 dFQwgCzegxwMmwYUhEdc2WmmxLOhusoen6/UYJQcLA0g4oj0elvbz+hRl8Eyur4ECNP7
 I6PVU/v2q3MiGDZ9VQUFNWc+UUNaeATUGKDe89TREFMcc/oyLj6hwfGvu2R6Wg6IdTgp
 KSO5ZBLShGJsagoNjclP82frMQRFio5ckC48q6EVTKTCWc7dOuLo2kk+pjSKL+g9EV4B
 vQEPPqlqDFSmp4oHfqhHVSABVwMT79wA5EYciCjZP4sn9lUfDn6lVsoCzmeVeYZ1oDLh
 WNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RSVr2l1YT6dcDPX1yaaJ+C5ZQV/AC9Ea81v3IFf3qRg=;
 b=Ih2mqa/Twc4OukeatjECOa+IQsdRLtJ15YiphmVmNP2YrUvFh1EySJnrKY43oAsYzL
 gdWGcWRz8SuPp72mwW+L7pma0+0g6whlKy5lIjIuMTWjel/Gzx2xYEB6xlBHv5lfDJ1N
 10fsKg3e9nK9RMcXtvea6Y4jfUIkEfjqnSpiemBH5/LaxdgCkTB9TZ9xIDLSVR6fXBkK
 Zj3QgNnRCi0DWIiP2Z1h3Js/UDDpz0whUd7rB/p309Nr3l/fMG2PAnv4TLmTFNbusN3R
 NZvv0xQscLn/YoA180lD3Jy6Pn9zWFXNaoE2VJBdJEys+nP2mWvP6ed+oAuZcqhjW2oR
 RfQQ==
X-Gm-Message-State: AOAM533KqkaxI1AhwLWI8hLx6Pc0B122mZNa3Elk8QDdh2xSd+V7cx74
 rjmrmtR/j9NBX0qYr1mDOtHFqftG9RaFlFqT1r8=
X-Google-Smtp-Source: ABdhPJx5jxWoQx9CKhPZ0hAI+fnnQK/DsdT7b7eCW8uYk0+gGoJt88ujLRBwTIqv/vyvnxKAKCX7IdZRw5PDOFQGzYc=
X-Received: by 2002:a05:6638:3048:: with SMTP id
 u8mr22199471jak.91.1622501362106; 
 Mon, 31 May 2021 15:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <0CAA9018-0C42-4140-82C1-EAC80D46D359@getmailspring.com>
 <CAEUhbmWnj3GOD5-EA54XHRQyfiSdOsH+KKGH-+uG0LEH+kAuUg@mail.gmail.com>
 <CA+Oz1=Z4J8KCHk_TZTUB9aEODaRv0F3bF6jtCHwdKQ02VgjcTQ@mail.gmail.com>
 <CAMSwOgoq5KNoU3aP6kGZxAVhj_phxJvmCWb=6dKB7SkbXjaJyQ@mail.gmail.com>
In-Reply-To: <CAMSwOgoq5KNoU3aP6kGZxAVhj_phxJvmCWb=6dKB7SkbXjaJyQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 1 Jun 2021 08:48:56 +1000
Message-ID: <CAKmqyKM2F8NWFE5KbemYbNzQ5cHFYpDDkPsjEVAb0hHHvbZNZw@mail.gmail.com>
Subject: Re: HSS Issue with GCC 10, Qemu Setup for microchip-icicle-kit
To: Rahul Pathak <rpathakmailbox@gmail.com>
Cc: Rahul Pathak <rpathak@ventanamicro.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bmeng.cn@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 31 May 2021 22:49:26 -0000

On Tue, Jun 1, 2021 at 12:43 AM Rahul Pathak <rpathakmailbox@gmail.com> wrote:
>
> On top of that, it seems I cannot connect with the target using gdb
>
> (gdb) target remote :1234
> Remote debugging using :1234
> bfd requires flen 8, but target has flen 0
>
> Though the ABI is lp64 and ISA is rv64imac when the hss was built.

Strange, how are you building GDB?

Alistair

>
> On Mon, May 31, 2021 at 7:37 PM Rahul Pathak <rpathak@ventanamicro.com> wrote:
>>
>> I followed the same link. I will elaborate what is happening at my end -
>>
>> First -
>> Used the same versions as per the doc. Built HSS 2020.12 and used core-image-minimal-dev-icicle-kit-es-sd-20201009141623.rootfs.wic.
>> Upon executing the qemu launch command as per the doc, it's just waits for the connection on another serial console -
>>
>> info: QEMU waiting for connection on: disconnected:unix:serial1.sock,server=on
>>
>> Even if I open sudo minicom -D unix\#serial1.sock, which remains offline always.
>>
>> Second -
>> If I remove the "-chardev socket,id=serial1,path=serial1.sock,server=on,wait=on -serial chardev:serial1" from the
>> qemu launch command then HSS boots but stops after sbi_init on all the cores and put the cores in Idle -
>>
>> [5.443011] boot_download_chunks_onExit(): boot_service(u54_1)::u54_1:sbi_init 80200000
>> [5.444960] boot_wait_onEntry(): boot_service(u54_1)::Checking for IPI ACKs: - -
>> [5.447962] boot_wait_handler(): boot_service(u54_1)::Checking for IPI ACKs: ACK/IDLE ACK
>> [5.449343] RunStateMachine(): boot_service(u54_1)::Wait -> boot_service(u54_1)::Idle
>>
>> Third -
>> If I take the latest release of HSS 2021.04 and build with gcc10, it does not boot at all even if I remove the serial1 like in the second case.
>>
>>
>> Thanks
>> Rahul
>>
>> On Mon, May 31, 2021 at 8:19 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>>>
>>> Hi Rahul,
>>>
>>> On Mon, May 31, 2021 at 1:08 AM Rahul Pathak <rpathak@ventanamicro.com> wrote:
>>> >
>>> > Hi Bin,
>>> >
>>> > I was reading a github issue which you raised for the issue with HSS because of GCC 10.1. Its pretty old and not sure what has changed so I thought to ask you over email for help.
>>>
>>> The HSS issue of GCC 10.1 was already fixed in the HSS mainline.
>>>
>>> > I myself is trying to make a setup to boot the  microchip-icicle-kit Qemu machine with HSS and Yocto linux image. Currently it does not work.
>>>
>>> Could you please elaborate which part does not work? Is that Linux,
>>> HSS, or U-Boot?
>>>
>>> >
>>> > Do you know what is the right setup to make  microchip-icicle-kit machine with HSS.bin and Yocto linux work on Qemu?. Probably there will be a working combination of HSS, Linux releases plus the toolchain version which makes this setup work.
>>> >
>>>
>>> I have not tried Yocto Linux yet with Microchip Icicle Kit on QEMU. I
>>> only tested the Linux images released by Microchip.
>>> Could you please follow the instructions @
>>> https://qemu.readthedocs.io/en/latest/system/riscv/microchip-icicle-kit.html
>>> to see which step might be wrong on your side?
>>>
>>> Regards,
>>> Bin

