Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyBjm-0007Uk-Ew
	for mharc-qemu-riscv@gnu.org; Thu, 15 Aug 2019 05:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42913)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1hyBjj-0007Tp-5q
 for qemu-riscv@nongnu.org; Thu, 15 Aug 2019 05:08:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hyBjh-0004tD-Ua
 for qemu-riscv@nongnu.org; Thu, 15 Aug 2019 05:07:59 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:42460)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hyBjh-0004sg-OP
 for qemu-riscv@nongnu.org; Thu, 15 Aug 2019 05:07:57 -0400
Received: by mail-oi1-x244.google.com with SMTP id o6so1085018oic.9
 for <qemu-riscv@nongnu.org>; Thu, 15 Aug 2019 02:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CksL2Rd8GnSo3oAgBusZJpqmaVBK/FhSThWunfJd6U8=;
 b=wBfVWNCIF/AWEHegT+JPYKK6a4HIaZP3I1jhQew9szqgD9HlDKsGSUlCWihykMCYAt
 vSh8lsruvcBoQJ6oLgXbQ1LjPUtHqTJKaBL1P9YvMc1z7NGiMqqSI54AIS6vMuBQfd7y
 KXerwzfBwOEacOkY+JdMNbSV83KiHF2AiHLovwVJdOMg9oHu9ytzrIQ3k38GhehkJ6ot
 e1Fjq7BewKJSioMey66/nDjcZSxAkp7np4RH/xNzD8gQMcRz184Vt3S7QEX1sdK8Xf/8
 7A+1V5HEk2vOXUi4IsW9mW+R10tPk2PLMjzKWRsEW5gtIg4DqOTHIF72VD7IdfbRsdhF
 7p/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CksL2Rd8GnSo3oAgBusZJpqmaVBK/FhSThWunfJd6U8=;
 b=bzYw5r8Adf4CwCwuKtjz8kwZwiljuGLpvMVN9td77fXt+0DJUv+i8uuD4BpY/igRKf
 b4QnDwlF5Wn58wGxzu7wZHQBdf1wD9ShUiOW24xI1mu31s4ZdH6NyBMbZ4OuokjAT8wH
 RiWknm+EW3ND6jmY/MAuU6nSVNlOLJ5HIhyKvX4/npySF1rb3RNTWd3ky37dJ3Z9+K7M
 DdMmHGT6sQ24pYPmCgbseFOkBgscAed9gBp3ROdqCXTTuwyef9iRBU1mZOgwLehyFvX8
 mAc5CZXT7nN8MDgbwnaxMXQHDgaSyKXni2hs7/Yv7fkVGL6Q4HuPYhT0C//1J2BvlEy5
 zaVw==
X-Gm-Message-State: APjAAAWmFjrv2jJnlwMrd6BMkXvCi5NyTTjqlj63wTrK3D0Lgb0fvXBd
 YyfZ3fQ0pXKxROtsCWYrm6cyvRKk3FwBDtR+6I6LlQ==
X-Google-Smtp-Source: APXvYqwjmNZ3wh2syUcMDloczheJykmHZIm94YuTV3VF6bJW5JR447sxx9AIPERtJjAK/51s9ST+ubiN4TeUiHJz1sc=
X-Received: by 2002:aca:4a57:: with SMTP id x84mr918050oia.170.1565860076715; 
 Thu, 15 Aug 2019 02:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <97a6ae9f-2845-4a3c-2a31-367787622268@c-sky.com>
 <CAKmqyKMqCKS_-rxZ2WYEn+m2gDom27rd2f2FCe0LmVs9brPcAQ@mail.gmail.com>
 <c502163b-ed8a-89d1-6437-9b0f49e88a84@c-sky.com>
 <CAKmqyKM5zneojhPe57h1+h3pav5kQxFaMnhNiwWRUa=nbzS3Ag@mail.gmail.com>
 <CAL1e-=hVLQWThYSm78bTCbQPfAABjx_rG9nEa9gV6PvSN8ge2w@mail.gmail.com>
In-Reply-To: <CAL1e-=hVLQWThYSm78bTCbQPfAABjx_rG9nEa9gV6PvSN8ge2w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Aug 2019 10:07:45 +0100
Message-ID: <CAFEAcA9bDU4AWetkR4w4WLUzMW_MMy0CsVa5SibWqf85RyaX5g@mail.gmail.com>
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, bastian@mail.uni-paderborn.de, 
 Palmer Dabbelt <palmer@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 LIU ZhiWei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-riscv] [Qemu-devel] RISC-V: Vector && DSP Extension
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
X-List-Received-Date: Thu, 15 Aug 2019 09:08:00 -0000

On Thu, 15 Aug 2019 at 09:53, Aleksandar Markovic
<aleksandar.m.mail@gmail.com> wrote:
>
> > We can accept draft
> > extensions in QEMU as long as they are disabled by default.

> Hi, Alistair, Palmer,
>
> Is this an official stance of QEMU community, or perhaps Alistair's
> personal judgement, or maybe a rule within risv subcomunity?

Alistair asked on a previous thread; my view was:
https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg03364.html
and nobody else spoke up disagreeing (summary: should at least be
disabled-by-default and only enabled by setting an explicit
property whose name should start with the 'x-' prefix).

In general QEMU does sometimes introduce experimental extensions
(we've had them in the block layer, for example) and so the 'x-'
property to enable them is a reasonably established convention.
I think it's a reasonable compromise to allow this sort of work
to start and not have to live out-of-tree for a long time, without
confusing users or getting into a situation where some QEMU
versions behave differently or to obsolete drafts of a spec
without it being clear from the command line that experimental
extensions are being enabled.

There is also an element of "submaintainer judgement" to be applied
here -- upstream is probably not the place for a draft extension
to be implemented if it is:
 * still fast moving or subject to major changes of design direction
 * major changes to the codebase (especially if it requires
   changes to core code) that might later need to be redone
   entirely differently
 * still experimental

thanks
-- PMM

