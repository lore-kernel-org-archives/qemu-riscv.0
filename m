Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k0Rnr-000849-EN
	for mharc-qemu-riscv@gnu.org; Tue, 28 Jul 2020 11:46:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1k0Rnp-000828-9H; Tue, 28 Jul 2020 11:46:05 -0400
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:35270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1k0Rnn-0005nt-Iq; Tue, 28 Jul 2020 11:46:05 -0400
Received: by mail-yb1-xb44.google.com with SMTP id y134so5597576yby.2;
 Tue, 28 Jul 2020 08:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VcvBZplM+xv+QunH7uuo3FyQW3VsWFIvCq5MOzlK9hk=;
 b=Bn1EzIibxzv9DRHdbkQosz4Gos/G/BUQgmzpBb/T37oYUnMNta0Vr+d81JpFeHsEmX
 UPvZ9qqjEK7d1987ROnbXsnmuzRbPoDJZ1+e/3szFnp5DL9K/6B+53IBCSeIIUXNJq7/
 Dpui8liojZbivcgUTlU4cpMBALPCX7RXLxwY6J4TiGk6q2Y8Arn0eWvu9dlDMnQpPzrB
 TZgs99EUTL5TPK1FFNbV5E2fD0+tqrGwdctuXuqCTRsS8RxHXjnkL5gHwTqW58cZlUW7
 RoX/gpPP1VQDsqUsD/+yF7Rn8H5UYwM+xmuxFVx6iDPOycApKHR/zOovC7u6qq1/8hpv
 ZO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VcvBZplM+xv+QunH7uuo3FyQW3VsWFIvCq5MOzlK9hk=;
 b=qmsGN8XvmAuRQNbAu4S4Qa68c1ViHOkef0qJTrnQwRsw0CyN4EDdEEeT5Abctcnrb/
 x7pfpCk8ljpbu8OczY2/rLlCQybG2aUYR5fuD1bWD/u2prGOMBAhAXGZt+VAMFwoyMF7
 FIzHPFcmedP99e750uMiTrraMhH0iJYyMVljbDRWPj4aFb7EveQD8863+RYxd+dwZPZS
 qf12zWz4I/7ElLgOJzrTN1/iA64eOvgn6ZU9iWqbY49ps0Wg8lLSJ3gYMDuZOxGq5Iu0
 uxV0+bi1EmXE0Dcg9rVn2chfEl0ZWobf+nSU7o65+utt4JOkaDwFmkahTgatUxx2+gIW
 N3Dg==
X-Gm-Message-State: AOAM531vShZbD/78X22Quj6lcm8lXd0DkcTPJ3yomMqam+Aqvbr0ESf8
 C7UH8fyX4nK7gZFhCEG7Appx/6d5wESnr89G9Us=
X-Google-Smtp-Source: ABdhPJxhZEX83IX21s1QTwaO96b3jTs5lCHmgPU3benLpV39PfxNDGpl2jXk8iGWV00tOiUdXbBlb33+1f0jDRUdjpw=
X-Received: by 2002:a25:d006:: with SMTP id h6mr42005716ybg.122.1595951161722; 
 Tue, 28 Jul 2020 08:46:01 -0700 (PDT)
MIME-Version: 1.0
References: <1594357499-29068-1-git-send-email-bmeng.cn@gmail.com>
 <1594357499-29068-5-git-send-email-bmeng.cn@gmail.com>
 <CAKmqyKM1m2j15ncbcW0rp5fk6FmbJ20uWOYUC40+v9PG=Hu7yQ@mail.gmail.com>
 <CAEUhbmWxCMZG+kdyqeSBrJPRf0Jvb7a4AcADuFXpRwQ7fb8zDA@mail.gmail.com>
 <CAEUhbmVJ94QF3UyEZUwcn-2yS4M3tKR-KOb4xPwSCwf9uRs-ww@mail.gmail.com>
 <CAKmqyKNJA0_5Qsfe6FZXSgNydxSHRXQQtqk8nB6-kR-yNpFHCQ@mail.gmail.com>
In-Reply-To: <CAKmqyKNJA0_5Qsfe6FZXSgNydxSHRXQQtqk8nB6-kR-yNpFHCQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 28 Jul 2020 23:45:50 +0800
Message-ID: <CAEUhbmXzufivy-7Qm-Nr6j6U9ynGOUgzV7XjXYDL_Ewcm1oj_g@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] hw/riscv: Use pre-built bios image of generic
 platform for virt & sifive_u
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Anup Patel <anup@brainfault.org>, Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b44;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 28 Jul 2020 15:46:05 -0000

Hi Alistair,

On Tue, Jul 28, 2020 at 11:39 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Jul 15, 2020 at 9:55 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Alistair,
> >
> > On Mon, Jul 13, 2020 at 9:53 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > On Sun, Jul 12, 2020 at 1:34 AM Alistair Francis <alistair23@gmail.com> wrote:
> > > >
> > > > On Thu, Jul 9, 2020 at 10:07 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > >
> > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > >
> > > > > Update virt and sifive_u machines to use the opensbi fw_dynamic bios
> > > > > image built for the generic FDT platform.
> > > > >
> > > > > Remove the out-of-date no longer used bios images.
> > > > >
> > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > > Reviewed-by: Anup Patel <anup@brainfault.org>
> > > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > >
> > > > This patch seems to break 32-bit Linux boots on the sifive_u and virt machines.
> > > >
> > >
> > > It looks only Linux boot on sifive_u is broken. On our side, we have
> > > been using VxWorks to test 32-bit OpenSBI on sifive_u so this issue
> > > gets unnoticed. I will take a look.
> >
> > I've figured out the issue of 32-bit Linux booting failure on
> > sifive_u. A patch has been sent to Linux upstream:
> > http://lists.infradead.org/pipermail/linux-riscv/2020-July/001213.html
>
> Thanks for that. What change in QEMU causes this failure though?
>

There is nothing wrong in QEMU.

> There are lots of people not running the latest Linux from master that
> this will cause breakages for.

It's just that the 32-bit Linux defconfig has never been validated by
people with 'sifive_u' machine. I bet people only validated the 32-bit
kernel with the 'virt' machine.

Regards,
Bin

