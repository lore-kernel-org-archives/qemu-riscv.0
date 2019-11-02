Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iQqnI-0001Xj-Gs
	for mharc-qemu-riscv@gnu.org; Sat, 02 Nov 2019 06:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43521)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iQqnC-0001Vs-Iu
 for qemu-riscv@nongnu.org; Sat, 02 Nov 2019 06:38:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iQqn9-0004Sp-CP
 for qemu-riscv@nongnu.org; Sat, 02 Nov 2019 06:38:00 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:38607)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iQqn8-00040r-5u
 for qemu-riscv@nongnu.org; Sat, 02 Nov 2019 06:37:59 -0400
Received: by mail-oi1-x243.google.com with SMTP id v186so10266318oie.5
 for <qemu-riscv@nongnu.org>; Sat, 02 Nov 2019 03:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ii8JBGQ8IDHtTPb42tsT7pHzynIFjetvEE2jTkQp5io=;
 b=WGuCKCMDj6PyJqAApuYVUIJWSow8zyZobJyupJzV969MhUl/eKNZO1RH+d4/NEwVeB
 EI5885uL2AwXKehJdZ+ckKnVEYnf/Rbqky74i6FlgL87Y2ijiDCZR+XxIMQN7TjsBXz3
 XPWYLqM3BXGMeo294BHX7CQ8OWebGAJfMolwnsap8b0iUoGx9OaTfy54Zt9v3EMBBqJ0
 ZNEujAZPwygN4+lkP1eeUPk/W26/m7DG7HN9B4P/hFaPlZYmZEVX25gz8vB9Y/nswjWY
 l5PaqaYaZjYnY46APzn35IXiS4q0TOwvy7YZMT90HT1Z1EVRZC/23BrR4GbL3a1R3Eft
 am8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ii8JBGQ8IDHtTPb42tsT7pHzynIFjetvEE2jTkQp5io=;
 b=hi257OPDu+4z+F/fEM/nOts2y0XYonK1K9zbe/GcwW4G80q4m3L2irzLvif+xZ5Olu
 3WflEPfNhNQVYQkcfqrmdpTpvneTD2HeeijbVhWacJKHq5AWs8yz7LNySwj2nkDk1pZ8
 mqSau+nIrQLFJeEu+U/zw1xI+a5UGxGDoi8xk2kN/RVoIZ5m2YCxXeda+2iV8WTDh1u8
 54LT4tm54JQR6f9LrrPsJkrgSnSDyhkXa6OX+RH/uj6SEQPMp703VYFu0VcdGWpmcmD5
 tqnj9l26Ud1C6vFsQn3OzB2Ts9mOc5x99Dbe7jgWclhGad+H/Iwl+ZfSwXyDEiGCMosh
 p4Kw==
X-Gm-Message-State: APjAAAWZkWwYQFTq5DF1WH7AXZMGxG8HuU/1T65lFo8yKqP44k6TN+9i
 YwygduWQaW9u+/CXcipH1L803dn7TovLwenB5oIrrw==
X-Google-Smtp-Source: APXvYqxJvHm9McNaYFIqZxFUy4JR7dNOyuTTatYkYhGknOUf5I1NNg38RbvNpsoQtRjXxpbdYr8nJ9U9yZfQnCMpGUs=
X-Received: by 2002:aca:4945:: with SMTP id w66mr3094705oia.98.1572691074432; 
 Sat, 02 Nov 2019 03:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191025042734.69244-1-anup.patel@wdc.com>
 <CAKmqyKMQz-OMFQRTdmpBpGMLiZ_ZM+UL5T5aAWZ5F1fC6vddOQ@mail.gmail.com>
In-Reply-To: <CAKmqyKMQz-OMFQRTdmpBpGMLiZ_ZM+UL5T5aAWZ5F1fC6vddOQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 2 Nov 2019 10:37:42 +0000
Message-ID: <CAFEAcA9bV=-t0+ro6rxu7Atodj6J78aT1aMnz9bjaqyfLDV3_w@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] RTC support for QEMU RISC-V virt machine
To: Alistair Francis <alistair23@gmail.com>
Cc: Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@sifive.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Atish Patra <Atish.Patra@wdc.com>, 
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
X-List-Received-Date: Sat, 02 Nov 2019 10:38:05 -0000

On Tue, 29 Oct 2019 at 13:25, Alistair Francis <alistair23@gmail.com> wrote:
>
> On Fri, Oct 25, 2019 at 6:28 AM Anup Patel <Anup.Patel@wdc.com> wrote:
> >
> > This series adds RTC device to QEMU RISC-V virt machine. We have
> > selected Goldfish RTC device model for this. It's a pretty simple
> > synthetic device with few MMIO registers and no dependency external
> > clock. The driver for Goldfish RTC is already available in Linux so
> > we just need to enable it in Kconfig for RISCV and also update Linux
> > defconfigs.
> >
> > We have tested this series with Linux-5.4-rc4 plus defconfig changes
> > available in 'goldfish_rtc_v2' branch of:
> > https://github.com/avpatel/linux.git
>
> @Peter Maydell this has been reviewed, do you mind taking this in you
> next PR? I don't see a maintainer for hw/rtc.

Generally devices used by a single architecture should
go via the tree of the maintainer who handles that
architecture -- in this case that's riscv. (The reason
is that it's only riscv folks who can test whether the
device works in the machine model, and only riscv
folks who can reasonably review whether the device
is the right way of implementing the functionality for
them.)

thanks
-- PMM

