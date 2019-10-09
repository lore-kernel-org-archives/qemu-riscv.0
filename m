Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iIEBO-0002aD-UB
	for mharc-qemu-riscv@gnu.org; Wed, 09 Oct 2019 11:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45754)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1iI1t6-0001lf-84
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 22:39:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1iI1Tq-0007ow-47
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 22:13:34 -0400
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:41360)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1iI1Tn-0007mC-Ch; Tue, 08 Oct 2019 22:13:31 -0400
Received: by mail-yb1-xb44.google.com with SMTP id 206so219037ybc.8;
 Tue, 08 Oct 2019 19:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5Yk7ePV9onB1hM/nMaz5Irva7XOHsONdnJ8bX+tDHUo=;
 b=fbJpvmoKfzmLha+4IUh8EjsoqK1ea0YSFKLlzJnWznaJG5RYc6V8O1QDHK+ecN44QW
 ARtgRuMYWzzMy3w85d8cJ2Y7PHuqoY7T0oLAxm5ZY1/AeRd6J0c2MCh6oDIWX2Q5/5i6
 LMTqEhu8F8Q+AefGlPoSYHHecs3wu5rDYtooXc5ucxe4KpZHOKXKXuyupKuomvw5yuBy
 Q7xY/oHQiGmQV34Ir1nBbVM9f+t+ruoS0e0vZJUzxgBVtbKmpXwn8f9KmlRJU2Pq1fQW
 CFejQ0sE2EzvoXGa7gkVqgDdFV13Qodj2k81mGYqC9/vwtd25iGoTfQb4l265y6YolQ1
 FATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Yk7ePV9onB1hM/nMaz5Irva7XOHsONdnJ8bX+tDHUo=;
 b=jxn49iBk3G8bSmfvQQ+j+UivUodKCC2tajtcK8J9ZHWqCQFgFDknPVdEWNcn/f5nJA
 9WaprLlvnoQG+Xy2yRM1taa/IYdGnDwrwZtiBPfOIkjajuP8ReUjLPfj27fbEPW3mTBW
 OgW9y2acqRGnwMpV9hR2A99S0UqLlQaXdODk5Qm2WbR1AMQkTBYKA6e+REtHMhYRLlT1
 zo96jQgRkt0lQZP4oapJmx7IRWxM8sFRElTgLn+sibBXqyuiSy7Kgfv2rpA6wO8y8Ckc
 W3m9oUl77YGV1xIWxF1Z2/n6qTN4wkOVyLB1zE80emhKrOkk97tLVvUQa0U/MkcSkjyt
 Cv3w==
X-Gm-Message-State: APjAAAWYX0Tp/dT5FLWvyyf42U4s58fymgkz2qUoEzQouZq4y5G895Gj
 0yJNdR6rMfMs8GRYmA7zRImBEPGDB43AxXrVMkI=
X-Google-Smtp-Source: APXvYqz/O7Ad+ta9sdjU2d/WfCJd6toygPp0zYOMExFeMZjd4xoBlQlmxLXibyurc5r5M0FgLtE7P5rKtccHb9A+jto=
X-Received: by 2002:a25:cd88:: with SMTP id d130mr474752ybf.65.1570587210487; 
 Tue, 08 Oct 2019 19:13:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1570577500.git.alistair.francis@wdc.com>
 <03cc7cf5c8400dffd6af60f06fe637f117747d9a.1570577500.git.alistair.francis@wdc.com>
In-Reply-To: <03cc7cf5c8400dffd6af60f06fe637f117747d9a.1570577500.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 9 Oct 2019 10:13:19 +0800
Message-ID: <CAEUhbmUu+Un91AvHq5G6RCoqccSd4Rg3NwxW9xfk_ykjWqrxzw@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] riscv/sifive_u: Add the start-in-flash property
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b44
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
X-List-Received-Date: Wed, 09 Oct 2019 02:39:41 -0000

On Wed, Oct 9, 2019 at 7:41 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Add a property that when set to true QEMU will jump from the ROM code to
> the start of flash memory instead of DRAM which is the default
> behaviour.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> v3:
>  - Use the start_addr variable instead of editing reset vector
>  - Fix function names
>
>  hw/riscv/sifive_u.c         | 30 +++++++++++++++++++++++++++++-
>  include/hw/riscv/sifive_u.h |  2 ++
>  2 files changed, 31 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

