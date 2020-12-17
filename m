Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpxIh-0008Qj-Qj
	for mharc-qemu-riscv@gnu.org; Thu, 17 Dec 2020 12:42:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kpxIg-0008Or-9c; Thu, 17 Dec 2020 12:42:50 -0500
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:37526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kpxId-0002G4-V0; Thu, 17 Dec 2020 12:42:50 -0500
Received: by mail-il1-x12c.google.com with SMTP id k8so26591765ilr.4;
 Thu, 17 Dec 2020 09:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DMMOu5qedPUEmi6rXnYHbXL2HHtxppP/f3uZrovbMNg=;
 b=o4TOO39cjTq8Jakup3I3xakkDNJMul2w2SLwgGeoawwyjMrA/qaCQjBfLOlp1uXtrB
 ukJIpJyCCBgHQfCJzRPhiDVRlSS61Sxe2ZeSTMCdd6+Rs9YxCrpOO47VYFOKOht10qHQ
 OjSpsb/+U5TI4csqn/ElWfqYRbkMRqfoUbv2/KGzIowFu8C+0Ro91Psr6Wm7yw2fw/0G
 F7LsFHylDot3/w8SJQ4ltwHbwe+HVPylv7vUQx0t8q0L5akxs1l3c9I2EhXZgab2hbhW
 KCvnXEIz2Fmc72LbWCmmurLp6B+hAxXQ1jgzFXRVktkH9yprD+cL1UqqUkr/pRhDkMf4
 UfKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DMMOu5qedPUEmi6rXnYHbXL2HHtxppP/f3uZrovbMNg=;
 b=tCtXyZ46Y8VJcZazFWdQuGSeKTrdY2YardWHOlM3fQOscJstWmHiYERa+GSFgV6hZy
 Kso/kgvUbeJ6TM/HIKURSpPljbOe1dSoHyUuY/nvbJsLLYRgqlFr/m95CrO8un0bc6Z7
 3r62teNZBzhLOneDwIzdKfUvik804QQqpVvg7AGrGBQYPgR4JduYaA7isFqnlVs6A1NH
 nPbBgm/zqYusjhte6VQQvSADrezCfSvInhOGZ0IcpJKi77TDU2hIe230tt3Ln5XoG1Bt
 oZxZbOO8SDyhTLgNIyJD/pmDvTYSgwOTKlN8XTRlt813ZmtpztiLkAWIIWQAB7452R6z
 a8Tg==
X-Gm-Message-State: AOAM533p/6atnBlgodW9KLvGQtuNiDD9QqH1YOVQsnfZuqRnzgZ/RbCs
 SWO0sZhnopo8/yPrsi834TsNoK5fQGAvkVrifac=
X-Google-Smtp-Source: ABdhPJwRcqKv2JeQ30H/A6bphrIQjKqrz/icaZti5ybA9NcMDDDfyPVJ8X25HvvYiiIdQcb7PgsTosmcMsPH9z1vaJs=
X-Received: by 2002:a92:cb44:: with SMTP id f4mr49424742ilq.131.1608226966334; 
 Thu, 17 Dec 2020 09:42:46 -0800 (PST)
MIME-Version: 1.0
References: <7d2b4053-dbca-faf8-04b2-8da0aab70f29@linaro.org>
 <mhng-18cffb57-6f85-430d-aa0e-bf19e4698c9a@palmerdabbelt-glaptop>
In-Reply-To: <mhng-18cffb57-6f85-430d-aa0e-bf19e4698c9a@palmerdabbelt-glaptop>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 17 Dec 2020 09:42:20 -0800
Message-ID: <CAKmqyKNakioM7F0s3C=W5vaUP8UdCoKGo5cXnTwcm3jGCbEsGw@mail.gmail.com>
Subject: Re: [PATCH v4 16/16] hw/riscv: Use the CPU to determine if 32-bit
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
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
X-List-Received-Date: Thu, 17 Dec 2020 17:42:50 -0000

On Thu, Dec 17, 2020 at 9:25 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Thu, 17 Dec 2020 05:58:11 PST (-0800), richard.henderson@linaro.org wrote:
> > On 12/17/20 12:44 AM, Bin Meng wrote:
> >> What happens if something like ARM big.LITTLE needs to be supported on RISC-V?
> >
> > I'd say it's the board's job to pass the boot heart.
> > (Though even big.LITTLE doesn't mix 64 and 32-bit cores.)
>
> I guess we can't stop people from building crazy things, but it does seem like
> building a system that mixes up base ISAs is unlikely.  IDK if 32-bit
> compatibility on 64-bit systems is ever going to be important enough to show up
> on RISC-V, as 32-bit might be defunct in portable systems by the point real
> RISC-V systems are availiable, but one could imagine systems where only a
> subset of cores have 32-bit compatibility.  My guess is that they'd all boot
> into 64-bit mode, though, so that sort of stuff won't be relevant until one
> tries to get to 32-bit code.
>
> Regardless of where that sort of thing goes, it seems reasonable to just ban
> people from spinning up mixed machine XLEN systems in QEMU for the time being.
> IIUC that's always been impossible (as it was a #define before), so it's not
> like we're regressing on any functionality with that constraint.

I agree. Currently we don't get anywhere close to allowing mixed XLEN systems.

Allowing 32-bit and 64-bit CPUs on a system is a useful goal, as for
example that is what the HiFive 1 has. As richard said though the main
interest at this point is the boot CPU, which the board can specify
different harts depending on what it is doing.

This is just the first step to making RISC-V more flexible with XLEN,
there will be more patches in the future to continue improving this.

I'm going to apply this series today.

Alistair

>
> Other hetergenous ISA/microarctucture stuff seems reasonable to support in
> QEMU, but also not a high priority.  It doesn't seem that hard to write the
> early boot stuff in a way such that it only depends on the base ISA -- that's
> essentially how we're handling stuff like F/D in Linux, you just either probe
> or handle the traps.  There's already some simple hetergenous stuff floating
> around (like the non-MMU cores in the SiFive designs) and that all seems to
> work fine so my guess is we have enough stuff there, but I'm sure there'll be
> more work do to as more complicated designs start to show up (doubly so as
> there's no specs for any of this).

