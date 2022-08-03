Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oJ4Y2-0006EF-E7
	for mharc-qemu-riscv@gnu.org; Tue, 02 Aug 2022 22:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oJ4Xy-0006Ds-GP; Tue, 02 Aug 2022 22:55:48 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:41894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oJ4Xw-0004tz-OU; Tue, 02 Aug 2022 22:55:46 -0400
Received: by mail-pf1-x42e.google.com with SMTP id q19so5942250pfg.8;
 Tue, 02 Aug 2022 19:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=JF4xIeWcNSM3kYsad+z+R5VUZHs9z/tYkiJSk8SDMwQ=;
 b=ooV04z6H2bBKLun3NYw5GW7KdQ7+mfL11DhUjXZHOvYq6LV35Z1kK0KWK4WkahwGeU
 mEosXgY+UAB/5NOWIMktZA3CrwiaBPJFAQqtkGm0A9cWeq1D96AjqF3OWbfQ/H4dxAYe
 nen08LNL+x/5wYpUYmG71N69n5SI0lTQFalmbMGFNJl1dg8RC+Z4dfvgfPhxAYZA+Gid
 jnTTo/aki0m0wsLIe7VaHcENij8M+Diy06INxBsKpMPjJXz4rw78kR8lY4x+hwD1Gn8/
 LsobtQOKOtO03Yt4GPSpcVwk0zJq6z+Yqw7sASXcHkQggCgwch8bLqvpAC2vqYgmmRUI
 LqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=JF4xIeWcNSM3kYsad+z+R5VUZHs9z/tYkiJSk8SDMwQ=;
 b=7adT8lXvc8xIuZ2+krTS5/pKOT62CE2o3p5PHgqzD/PDkTK5wKuLmRyfgGGWgZB8/T
 YPZZ5rSB9F4He9I5pn7Rs8zH6LRr2KN654FT3lVkC7H75ThIlqiMVY8kRrYkk7TzQUXJ
 kB6ntydHOoFM3Igb+FIaks5B3jInerBqR0VWk0YJCT7+IzdXhdXD56rVc/EEHFOlLSXn
 FyEyrFLZS5cohKCilDJAFVsFfvNg8M+sZIT4f1q6o7CSBDLa98eAenK1Peli/QpzEv3A
 FkZMyLqlAuWYNT78i3JW1jmpmTi5n24iY2la/SlooYIfV1GmVt5mFqUIr2jK6E7sFsGg
 NGgQ==
X-Gm-Message-State: AJIora8XkzBGOfMkCMOH6EeGs17wIO/JrETd+ix9ircsDU1xQM5l3CR9
 olEczPJzHQpxp184p59t4kljfJJmvq97qeguZrU=
X-Google-Smtp-Source: AGRyM1v7lH700ZiugLTUfALE8RQJmvbaxcpjgd2Z9fffnTCkKl926TiK+e88m0dRoVhnLudOwmSCJ4lQdF0GHRnaMIk=
X-Received: by 2002:a05:6a00:88e:b0:52c:65a3:fdb4 with SMTP id
 q14-20020a056a00088e00b0052c65a3fdb4mr23239861pfj.83.1659495342274; Tue, 02
 Aug 2022 19:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220725034728.2620750-1-daolu@rivosinc.com>
 <CAKmqyKNOtYLubJ0hMaMHY9YO3w21d-S5z3ABKV5KS2UvjA+dRw@mail.gmail.com>
 <CAOnJCUKANDcUMr0bpivzBmM=DtFn7Hf5LuOYRg+5wxjDcP4_nA@mail.gmail.com>
In-Reply-To: <CAOnJCUKANDcUMr0bpivzBmM=DtFn7Hf5LuOYRg+5wxjDcP4_nA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Aug 2022 12:55:15 +1000
Message-ID: <CAKmqyKNi0kkd0NuwwCWskkvM6M+LoC15yXCcGnEyfSgD=jw1-w@mail.gmail.com>
Subject: Re: [PATCH v5 0/1] target/riscv: Add Zihintpause support
To: Atish Patra <atishp@atishpatra.org>
Cc: Dao Lu <daolu@rivosinc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Aug 2022 02:55:49 -0000

On Wed, Aug 3, 2022 at 9:42 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Sun, Jul 24, 2022 at 9:39 PM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Mon, Jul 25, 2022 at 1:48 PM Dao Lu <daolu@rivosinc.com> wrote:
> > >
> > > This patch adds RISC-V Zihintpause support. The extension is set to be enabled
> > > by default and opcode has been added to insn32.decode.
> > >
> > > Added trans_pause to exit the TB and return to main loop.
> > >
> > > The change can also be found in:
> > > https://github.com/dlu42/qemu/tree/zihintpause_support_v1
> > >
> > > Tested along with pause support added to cpu_relax function for linux, the
> > > changes I made to linux to test can be found here:
> > > https://github.com/dlu42/linux/tree/pause_support_v1
> > >
> > > --------
> > > Changelog:
> > >
> > > v1 -> v2
> > > 1. Pause now also exit the TB and return to main loop
> > > 2. Move the REQUIRE_ZIHINTPAUSE macro inside the trans_pause function
> > >
> > > v2 -> v3
> > > No changes, v2 was lost from the list
> > >
> > > v3 -> v4
> > > No longer break the reservation in trans_pause
> > >
> > > v4 -> v5
> > > Rabase on top of https://github.com/alistair23/qemu/tree/riscv-to-apply.next
> > >
> > > Dao Lu (1):
> > >   Add Zihintpause support
> >
> > Thanks!
> >
> > Applied to riscv-to-apply.next
> >
>
> Did you overwrite your tree by mistake ? I pulled riscv-to-apply.next
> a few days back where this patch along with Anup's priv version
> fixes are there. But I can't find it anymore. I am looking at this.

Hey Atish,

I created a last minute pull request to get some fixes into 7.1. When
I did that I overwrote the current riscv-to-apply.next with a version
that only has a few bug fixes.

I have pushed the riscv-to-apply.next for 7.2 to my public repo again.

Alistair

>
> https://github.com/alistair23/qemu/commits/riscv-to-apply.next
>
> I wanted to rebase my sstc series on top of the riscv-to-apply.next.
> Let me know if I am missing something.
>
> > Alistair
> >
> > >
> > >  target/riscv/cpu.c                      |  2 ++
> > >  target/riscv/cpu.h                      |  1 +
> > >  target/riscv/insn32.decode              |  7 ++++++-
> > >  target/riscv/insn_trans/trans_rvi.c.inc | 16 ++++++++++++++++
> > >  4 files changed, 25 insertions(+), 1 deletion(-)
> > >
> > > --
> > > 2.25.1
> > >
> > >
> >
>
>
> --
> Regards,
> Atish

