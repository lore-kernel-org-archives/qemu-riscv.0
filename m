Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lnqiX-0008Vx-LN
	for mharc-qemu-riscv@gnu.org; Mon, 31 May 2021 18:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lnqiW-0008Vk-CZ; Mon, 31 May 2021 18:49:04 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:36533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lnqiT-0001sT-JU; Mon, 31 May 2021 18:49:04 -0400
Received: by mail-il1-x12a.google.com with SMTP id g11so11221302ilq.3;
 Mon, 31 May 2021 15:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yDcl3j3k52rODP9W8LokiG/ORc/ZnmU9WKmQB/lOg3c=;
 b=lO/ZvK4OPsQ/QZsmA85N38A7PtpEoKCMrYnT0gnIDuZrsIQdnGzE73eVpLO5qzIa0b
 jhlFy1rajrkRzFHLkGFxmL0WeYZy+PuCQisxRoQBjKnc6mzLTn+kClItfV3TqiHksOwO
 X1Tb8qsCWPLb8Er71Mj8fHbPu8eKOICjoVfa8LuKhuLfdhbH3PELNIRVOMdsHTEbg027
 Mdi64I5n10MwMLZg3lrHTwFFV32KTUfdegf9ZXFCujOYQqNVfwrE5kF9cCUMJZkd47sJ
 UImVktWKNvnG0R0pJexEKB/CwnIk3w0CjmOBUbBkN+jwZsFWkxqs555yvDL3rFTz3rPq
 7HUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yDcl3j3k52rODP9W8LokiG/ORc/ZnmU9WKmQB/lOg3c=;
 b=i8c0BBQTJU06Lg5+R6caHMg6u9OYr3CGrjY5kg0oQfms360MoeL8vzggzVIWhO6dTb
 DxZ1vISCApH4I99zKfH/3Kw1cwF6QOiveVwjPNHXOSdyxJJ9CoDLWLKfp7OSw695Ek01
 XRtIquD1Yam9EIrpS1uYGKq5nUbrlD8Pft17uODoDvhQNZnfWZ8dS/6nQsW5C8AY+J+k
 Ec3WTjB4d5jUFqXl1yyXxZazevRi+V38rt4lcMkp6CSoL6MJ4FddkCfu+rWofGOPy+yZ
 laI9bAs7fUEiQnFo/86jSscJIuTl60u6Z410jjqnn6erEd5nqsnKhZRnp91QIP97DEfk
 XnSQ==
X-Gm-Message-State: AOAM530ZZDBXDHcAG6BuPzOYrbii7rp1dsfriEHUFk6qa7W8RihUxcOv
 rCXhWz0PFfOj7uY5wmvwfEf16X27ipuhZMxFr9c=
X-Google-Smtp-Source: ABdhPJyVW1Wb4BnM++9CjFZMVshh9glaDkA/fiiM3VsCkCE6TnMCDuUwsTTx/XbExvdLA4vcxFAKLal1y4vgjwwDZMg=
X-Received: by 2002:a92:6b05:: with SMTP id g5mr18846822ilc.40.1622501339220; 
 Mon, 31 May 2021 15:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <0CAA9018-0C42-4140-82C1-EAC80D46D359@getmailspring.com>
 <CAEUhbmWnj3GOD5-EA54XHRQyfiSdOsH+KKGH-+uG0LEH+kAuUg@mail.gmail.com>
 <CA+Oz1=Z4J8KCHk_TZTUB9aEODaRv0F3bF6jtCHwdKQ02VgjcTQ@mail.gmail.com>
In-Reply-To: <CA+Oz1=Z4J8KCHk_TZTUB9aEODaRv0F3bF6jtCHwdKQ02VgjcTQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 1 Jun 2021 08:48:33 +1000
Message-ID: <CAKmqyKNWMVe_THbKbpsehCs=YzoescuNE4g3Hp_7+58gvAT4aQ@mail.gmail.com>
Subject: Re: HSS Issue with GCC 10, Qemu Setup for microchip-icicle-kit
To: Rahul Pathak <rpathak@ventanamicro.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
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
X-List-Received-Date: Mon, 31 May 2021 22:49:04 -0000

On Tue, Jun 1, 2021 at 12:06 AM Rahul Pathak <rpathak@ventanamicro.com> wrote:
>
> I followed the same link. I will elaborate what is happening at my end -
>
> First -
> Used the same versions as per the doc. Built HSS 2020.12 and used core-image-minimal-dev-icicle-kit-es-sd-20201009141623.rootfs.wic.
> Upon executing the qemu launch command as per the doc, it's just waits for the connection on another serial console -
>
> info: QEMU waiting for connection on: disconnected:unix:serial1.sock,server=on

That seems like you are passing an argument to QEMU to expose a
socket. You don't need to do that and can instead use stdio.

For the runqemu command in OE you can do that with `runqemu nographic`

Alistair

>
> Even if I open sudo minicom -D unix\#serial1.sock, which remains offline always.
>
> Second -
> If I remove the "-chardev socket,id=serial1,path=serial1.sock,server=on,wait=on -serial chardev:serial1" from the
> qemu launch command then HSS boots but stops after sbi_init on all the cores and put the cores in Idle -
>
> [5.443011] boot_download_chunks_onExit(): boot_service(u54_1)::u54_1:sbi_init 80200000
> [5.444960] boot_wait_onEntry(): boot_service(u54_1)::Checking for IPI ACKs: - -
> [5.447962] boot_wait_handler(): boot_service(u54_1)::Checking for IPI ACKs: ACK/IDLE ACK
> [5.449343] RunStateMachine(): boot_service(u54_1)::Wait -> boot_service(u54_1)::Idle
>
> Third -
> If I take the latest release of HSS 2021.04 and build with gcc10, it does not boot at all even if I remove the serial1 like in the second case.
>
>
> Thanks
> Rahul
>
> On Mon, May 31, 2021 at 8:19 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> Hi Rahul,
>>
>> On Mon, May 31, 2021 at 1:08 AM Rahul Pathak <rpathak@ventanamicro.com> wrote:
>> >
>> > Hi Bin,
>> >
>> > I was reading a github issue which you raised for the issue with HSS because of GCC 10.1. Its pretty old and not sure what has changed so I thought to ask you over email for help.
>>
>> The HSS issue of GCC 10.1 was already fixed in the HSS mainline.
>>
>> > I myself is trying to make a setup to boot the  microchip-icicle-kit Qemu machine with HSS and Yocto linux image. Currently it does not work.
>>
>> Could you please elaborate which part does not work? Is that Linux,
>> HSS, or U-Boot?
>>
>> >
>> > Do you know what is the right setup to make  microchip-icicle-kit machine with HSS.bin and Yocto linux work on Qemu?. Probably there will be a working combination of HSS, Linux releases plus the toolchain version which makes this setup work.
>> >
>>
>> I have not tried Yocto Linux yet with Microchip Icicle Kit on QEMU. I
>> only tested the Linux images released by Microchip.
>> Could you please follow the instructions @
>> https://qemu.readthedocs.io/en/latest/system/riscv/microchip-icicle-kit.html
>> to see which step might be wrong on your side?
>>
>> Regards,
>> Bin

