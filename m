Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHsZg-0004Lx-EF
	for mharc-qemu-riscv@gnu.org; Tue, 08 Oct 2019 12:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44361)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jimw@sifive.com>) id 1iHsZd-0004Gd-1b
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 12:42:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jimw@sifive.com>) id 1iHsZb-0000qC-R6
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 12:42:56 -0400
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43]:37389)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jimw@sifive.com>) id 1iHsZb-0000pn-LA
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 12:42:55 -0400
Received: by mail-vs1-xe43.google.com with SMTP id p13so11736346vsr.4
 for <qemu-riscv@nongnu.org>; Tue, 08 Oct 2019 09:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M5iBE1AnQdiWOZ3mozyE6Xp81Ek6hA8lnryANZaJYw4=;
 b=lOdkhUGMzU/jA3HOmKtZPP3fsEHcs2ZSBJ2WXMCKfx3/SNBQJOcUIs6p2pZT7hkuPh
 7kLZNNE/qW8ea2cuiBm0qDb7UBvhNvk+vD9FPkCW/6Cy5hXyDeMIabenBaZRiK7VZEFn
 ZYuKBL/kEh2365RyicGprptNG8eMQHjvyyyY1lXvligxfyX+v/uXRUdQXEz0LZTpO5Rx
 Dne/JdnoE/aGDR6qfwwQajd6vQYMSFGZ8ddgJe3qFqwlNrNk7o9c6lclqXD+3DOgdGKE
 eHM/7mbPAPIAdOiv5/u+DnkoGb2RyovVm/XC+YegGkJR1Wc/Q+fOqOk2XN5XEPjHTOqK
 +ZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M5iBE1AnQdiWOZ3mozyE6Xp81Ek6hA8lnryANZaJYw4=;
 b=VYOlGZ3jIToSN/OW9DgvQ1uh79NZH0w9AvcUjBkXM1o90HOi/zRXFUNVaTODogQ18B
 Ly5eZHbtte52Cc2MLm5s+NC3YGEJtfvQc9Y84Bw44/gs7SliOevA1QuVnWFMpxwwXXS1
 1SevkljZrzL1yxzxIvY01hWD9iiS1h8Y8jI9t2y2RxaM/JisxJGfMY6CzQnHqpCrdc3x
 jCtE5JeCKAzb6vrAxh04gbx9AdepHcGjR7zxmzcqeh6DDMiAArpdwEmpUNwpd/jSq5sg
 FAlGXVoWk7sbp1Hxr+vOPYaycg/tidzIUjSMxRvmRvp6baw9qwh2lNuVpywK+2qh19L+
 9nWA==
X-Gm-Message-State: APjAAAX0Lh454ZPLTTk4E3pxVxhUjZJpaIHD0fepvUCYzSMIQKGkZSZC
 5hKn8f7cFmoolOePtqcgp52oMxkcmRl65ogF6cwA8Q==
X-Google-Smtp-Source: APXvYqzb8besrhpICltG3Mr2IHSlYM1Wx5gC5EAu9z2RoiOMAIGR1UScJA03OHyoQDiqfVrbhQoqwnc/avgp9kXW8Kw=
X-Received: by 2002:a05:6102:103:: with SMTP id
 z3mr18894644vsq.72.1570552974852; 
 Tue, 08 Oct 2019 09:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191004151614.81516-1-jonathan@fintelia.io>
 <5393a150-71b6-a729-7530-a50df05353bd@sifive.com>
 <CAEUhbmXXwZTu2rJ7Oen4mVSBjp+-7Jd7WBpmds1xm9m-tR+Q-A@mail.gmail.com>
In-Reply-To: <CAEUhbmXXwZTu2rJ7Oen4mVSBjp+-7Jd7WBpmds1xm9m-tR+Q-A@mail.gmail.com>
From: Jim Wilson <jimw@sifive.com>
Date: Tue, 8 Oct 2019 09:42:44 -0700
Message-ID: <CAFyWVaZUhmqQWvEvPpbYV2dKdf-GB1Dp1mFR5C3JYd221q12GA@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Expose "priv" register for GDB
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Jonathan Behrens <jonathan@fintelia.io>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::e43
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
X-List-Received-Date: Tue, 08 Oct 2019 16:42:58 -0000

On Tue, Oct 8, 2019 at 2:00 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> My gdb does not list "priv" register after applying this patch.

I didn't try the patch, I didn't have time for that.  I would expect
priv to be in the "info registers" output if you are adding it to the
cpu register set.  Shrug.  Anyways, defining priv as a virtual
register is the right way to do this, as it isn't a cpu register, and
gdb already has support for virtual registers like priv.

Jim

