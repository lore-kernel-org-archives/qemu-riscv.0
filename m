Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hnSVd-0006z0-PH
	for mharc-qemu-riscv@gnu.org; Tue, 16 Jul 2019 14:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37570)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hnSVb-0006qZ-Ca
 for qemu-riscv@nongnu.org; Tue, 16 Jul 2019 14:49:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hnSVa-0002JG-Cy
 for qemu-riscv@nongnu.org; Tue, 16 Jul 2019 14:49:03 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:43464)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hnSVY-0002CF-5a; Tue, 16 Jul 2019 14:49:00 -0400
Received: by mail-lj1-x243.google.com with SMTP id 16so20991833ljv.10;
 Tue, 16 Jul 2019 11:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L5ewNmFn3clEl2jzYQ78gGSrbLdHGHBMN7gMqIXwNr4=;
 b=r6mlUHEHiabYR/PDZ7HekTMFSwo/zADHy0cTw/2xuY3tVG92hppooxDUwrQwV0yJlL
 19R+3cuDeszR32Xmu9HIfZ6b4Y/Bmi0rQq4h+c6SYNJvEHViFUWWuAGTlXBu+PaG8mDo
 HxykQeoREVC2gbQ3gpbGtAn0S+sOUr8mr1JVXNA3nrbsWgioxpUZYbLv043hFM+MBBtH
 FkJj8zHoRIONyBAZKn9mGs5zHEVzCVXwb/2t3OA0Oww2XDHerYz61KYX9Rxd4EgX+wS3
 oud9VVZb9mCHv++Y6gE2WpVBIxZxpxu6e5kDvfTj2M2i9tk5D8KOHXVxQHCxQdXljbxC
 yl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L5ewNmFn3clEl2jzYQ78gGSrbLdHGHBMN7gMqIXwNr4=;
 b=YBXpQTJfoBG7DFAGuQMwXSZogMGRhiSQbplBQgOif8gWtwg5VIbciEGdOrKj0yuyqN
 ITAZDmgZO3B5VRgP7bNfWzh98WBprGj7dAoWF6NYHN163YWx4mjdaafUlEEAu72iInTg
 C4NwLslZi305kGFynAWEdQRt+QIQQJ8ABIKxS15qSabkGvlpnMd5QfrV/NDaTdX3yOT0
 +5yU2m8Un9QuPJu/pH6KnsqDwcC5E371FOHWXThLtj/b1JdBo1Tn/JdyeLJc4qdLKc6X
 GSpYEgrCpsHtPqVAwrVSRLj9gDl22CcPMRLCtwG/QCQWS28rJ8vutFi7myS0VFvzzWsG
 yxDg==
X-Gm-Message-State: APjAAAUC6dAqzjue93yrwyDScbhvfY10FVLkgxcz/4OFZI4NDjsA9V3J
 9ESZRmWoxtwyxjy4mHJPOxzk96JVpcIsynLB9H0=
X-Google-Smtp-Source: APXvYqwcNMIzEjmqeeQ3wB2TvmEdKfQrdmhEowSMFhlv48Yv4XUceyW0aMn64wPmyFa885MgFyKItHcIXGj65lAS5oQ=
X-Received: by 2002:a2e:9188:: with SMTP id f8mr18491413ljg.33.1563302936478; 
 Tue, 16 Jul 2019 11:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1562803960.git.alistair.francis@wdc.com>
 <20190716135628.GA18691@stefanha-x1.localdomain>
In-Reply-To: <20190716135628.GA18691@stefanha-x1.localdomain>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Jul 2019 11:45:38 -0700
Message-ID: <CAKmqyKOvH4FGEPxN1FSJGxxSrRWTegjnWaAgAcWLtPVeQKH8WA@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Jeff Cody <codyprime@gmail.com>, 
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@sifive.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 0/2] RISC-V: Add default
 OpenSBI ROM
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
X-List-Received-Date: Tue, 16 Jul 2019 18:49:04 -0000

On Tue, Jul 16, 2019 at 6:56 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Wed, Jul 10, 2019 at 05:14:02PM -0700, Alistair Francis wrote:
> > This series includes the OpenSBI firmware for QEMU RISC-V users.
>
> A mirror of the OpenSBI repo has been created here:
> https://git.qemu.org/?p=opensbi.git;a=summary

Thanks for that Stefan

>
> qemu.org hosts all software, including firmware, that goes into QEMU so
> that users can rebuild from source even if the original repository goes
> offline.
>
> Please use the URL https://git.qemu.org/git/opensbi.git if you resend
> the patch.  If this patch is merged unchanged I will send a follow-up
> commit to update the URL for you.

It doesn't look like Palmer has applied the patches yet so I'll send a v3.

Alistair

>
> Thanks,
> Stefan

