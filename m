Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jlicx-0003wv-Ib
	for mharc-qemu-riscv@gnu.org; Wed, 17 Jun 2020 20:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jlicv-0003w9-Vv; Wed, 17 Jun 2020 20:41:58 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:39844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jlicu-0003G5-FG; Wed, 17 Jun 2020 20:41:57 -0400
Received: by mail-yb1-xb42.google.com with SMTP id j202so2212494ybg.6;
 Wed, 17 Jun 2020 17:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HA7uE3XwI6osjOygEhN7yWCooXTEl5Hl2veL+7bdXUM=;
 b=CJVvyhRHSgq0OCzkGo3ZNavC6EJStn+4tUyUKIj7jTvXiRNF4pwnDl5ROSeRilc+pP
 h6njPX3Wa4sW55YQ8Ono8FIqIwpNhbH4AG47PhPxzHWQBEXMglWawsKq4m1SE/P/Pu9r
 cqHBF+Ah3HRt+Fjoh0vsgSrbxgglpLYAHxY6LzLNayNnaVy2rh5pRXfy8bmaFziFz6f2
 RbP1t3s0Z1gDeKdUDCd0/DgjuGaxscwFwNXQZFHywxsvPXKLPCPPt5uZ/ZiQ4wQIbREE
 jnJHhD8LcEEvQKik4w07vFlySQhM8csLDHVDfWwGSsN7Ip/GB6bP4Tv4k2izxbuux46t
 j+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HA7uE3XwI6osjOygEhN7yWCooXTEl5Hl2veL+7bdXUM=;
 b=nsT/IM7XhgDhLG9TTlYA0dMyPvTHCRUYRqsTwAN+fIi+gJQWQEDTa5BREZ4VSvKWz+
 ADMZpc5WqqUExsGOzPqT4BIgFu8M8v9mSTRJyYUr0bHJkwj1RzsA4mIiLpTrEmHhw775
 ahdqrOiyc9byISWjB1QglPBM/EgrvID52FAiv/Y4qUYLMMreiuRxDU0Xb8yaAIUbLL+z
 dcIyE/ntRVqKh8nuim1pdVPaGvTkU+QuXyE5j2Q/AyJprAUbWmtWFwwIzhArVGh6fsrl
 3vTGrF9ZlsvQPPiWtCvdG5rJQS1J9khrhwtQ0YyPPia8PPaECtEjtVBLSm4j8BcfMclW
 UOLA==
X-Gm-Message-State: AOAM531XchbC3isMihKxImAb2iEMnH5tmok/oXbLo4jiXxdZM4jhvX79
 KUIOdN/EW87MzseHGh3rLB1YOI9D+L65OgtUkj8=
X-Google-Smtp-Source: ABdhPJyLGb47ttZjhgyep7kKZ/jjo/paFzpT+53zsypRassH5YaQcTjS8fGpVYUll5OZsuX6CZX8qjEOqT/Qw+4fk/Y=
X-Received: by 2002:a25:c507:: with SMTP id v7mr2452085ybe.306.1592440914821; 
 Wed, 17 Jun 2020 17:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <1592268641-7478-1-git-send-email-bmeng.cn@gmail.com>
 <1592268641-7478-3-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKNovTf3F+t9WFCWXvAgT_CRa5dbDuQExzbqxkM-z3ufqw@mail.gmail.com>
In-Reply-To: <CAKmqyKNovTf3F+t9WFCWXvAgT_CRa5dbDuQExzbqxkM-z3ufqw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 18 Jun 2020 08:41:43 +0800
Message-ID: <CAEUhbmVq8kVfZRQSF-LT_bDib9e1xBL-7zifmHpQgdvehcNzFA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] hw/riscv: sifive: Change SiFive E/U CPU reset
 vector to 0x1004
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b42;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 18 Jun 2020 00:41:58 -0000

Hi Alistair,

On Thu, Jun 18, 2020 at 12:40 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Mon, Jun 15, 2020 at 5:51 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Per the SiFive manual, all E/U series CPU cores' reset vector is
> > at 0x1004. Update our codes to match the hardware.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> This commit breaks my Oreboot test.
>
> Oreboot starts in flash and we run the command with the
> `sifive_u,start-in-flash=true` machine.

Could you please post an Oreboot binary for testing somewhere, or some
instructions so that I can test this?

>
> I have removed this and the later patches from the RISC-V branch. I
> want to send a PR today. After that I'll look into this.

Regards,
Bin

