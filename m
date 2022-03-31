Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZn8K-00045I-UK
	for mharc-qemu-riscv@gnu.org; Thu, 31 Mar 2022 01:14:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nZn8K-000456-1g; Thu, 31 Mar 2022 01:14:08 -0400
Received: from [2607:f8b0:4864:20::135] (port=45942
 helo=mail-il1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nZn8I-0002XP-Ci; Thu, 31 Mar 2022 01:14:07 -0400
Received: by mail-il1-x135.google.com with SMTP id h18so11446413ila.12;
 Wed, 30 Mar 2022 22:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/e7BHUn7ZHGxvo80hqqfbGEa/QzB5qbcKyyziRHWvOk=;
 b=SKNwHY4u581WKoinmdmsZ1MwhelyXUh4Gto8OamBKUfAdb20teGxg8HcJYRUU+rgKy
 i23CGX8Oewn6TDC/r99K9j9Bp+6KIqt7gGCc8s1m9jKZHfYT3KmPuOJQm6DlRykByCSH
 a6QPplDyOCNJJQDz3ffscpbJkNrUo8Ih4hvJLRV62okuSjcjuo/Mg09xPiH54HhuvFE/
 sy8j1O5W+Fzy9oUb3cs3nrSlUK/CTJNFsUmKpuXxkQC8ac6Aw/SqkCdQyKwSu+zDW7NK
 ioOvJx5p6hzB8v5pqxtX4/TFA25rVG6wW06iwFTovHDjQrBbJkwMaxN+zsvSA/XiJU3W
 OQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/e7BHUn7ZHGxvo80hqqfbGEa/QzB5qbcKyyziRHWvOk=;
 b=2aZPnm2zTaVNOdkjf8H0dgAjfEqapSwaN5NXrHdvzDeVUJh3k4hpiu5jkM6IqtAc6T
 le6xBo8jGBaMke2AH1FyIOmEJKXRisgBfcNMCBEv9pQ+l3FXxtItFVbWte3YGAIr9fft
 yGNMgvCVYpgBRtVqujaxOoKNltMqUd2f2+VkzRTKbx/YEFNhRIdD+K1PZ0PxSFZn21cC
 b3bjFsZZu/eEUFdaktPILGGAGNQDiygMhyzUgOmceUjw9oea92VyffPzrPwbfy/u0F0k
 iNdkDmPsvjckjDnoC+5ynSlclzBK6ewyIAQdyV+CoxvSU+APgNvB0gdes9+GW6UkWvP6
 O6fg==
X-Gm-Message-State: AOAM533qFIgU9zA7N6MYmO/UVWuXmVTKKrpwCcrORC2AXp9xGxCYCIRo
 AJ6odyjzeSLvOgtSXwoxlU9is2rlyqqQK2VE3Lc=
X-Google-Smtp-Source: ABdhPJxkPmOpqA0C22ahyk8Lv82MBr/+gzTT+dJagWxWcoL9yN/P4aK4Np5nynqq/IfzhJJVGyDzRz/NHnLR2Ad5CrY=
X-Received: by 2002:a05:6e02:1c2a:b0:2c9:defa:d061 with SMTP id
 m10-20020a056e021c2a00b002c9defad061mr4506973ilh.260.1648703645018; Wed, 30
 Mar 2022 22:14:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmqyKNzQELfs4SQhRJ_XDcFNvFyp5PLA-2qWfBciKN3nCDJHw@mail.gmail.com>
 <mhng-252c93bc-7d59-4169-9dc4-3792ef995e4e@palmer-ri-x1c9>
In-Reply-To: <mhng-252c93bc-7d59-4169-9dc4-3792ef995e4e@palmer-ri-x1c9>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 31 Mar 2022 15:13:39 +1000
Message-ID: <CAKmqyKMsG6d7jaS2gxXxh+qONWkWGbHFwLK9tYb2q7eeQe77uw@mail.gmail.com>
Subject: Re: Re: [PATCH] target/riscv: Exit current TB after an sfence.vma
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Idan Horowitz <idan.horowitz@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, phantom@zju.edu.cn, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::135
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x135.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 31 Mar 2022 05:14:08 -0000

On Thu, Mar 31, 2022 at 2:36 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 30 Mar 2022 20:23:21 PDT (-0700), alistair23@gmail.com wrote:
> > On Thu, Mar 31, 2022 at 3:11 AM Idan Horowitz <idan.horowitz@gmail.com> wrote:
> >>
> >> On Wed, 30 Mar 2022 at 19:11, Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >> >
> >> >
> >> > Presumably you mean "revert" here?  That might be the right way to go,
> >> > just to avoid breaking users (even if we fix the kernel bug, it'll take
> >> > a while to get everyone to update).  That said, this smells like the
> >> > sort of thing that's going to crop up at arbitrary times in dynamic
> >> > systems so while a revert looks like it'd work around the boot issue we
> >> > might be making more headaches for folks down the road.
> >> >
> >>
> >> The opposite in fact, I did not suggest to revert it, but rather undo
> >> the revert (as Alistair already removed it from the apply-next tree),
> >> since my original patch fixes buggy behaviour that is blocking the
> >> testing of some embedded software on QEMU.
>
> Ah, sorry -- the QEMU tree I was looking at still had the patch in
> there, must have just been an old one.
>
> > So, this is a little tricky.
> >
> > We want to apply the fix, but that will break current users.
> >
> > Once the fix is merged into Linux we can apply it here. That should
> > hopefully be right at the start of the 7.1 QEMU development window,
> > which should give time for the fix to propagate into stable kernels
> > and not break too many people by the time QEMU is released.
>
> If you think this is a Linux bug then that makes sense, but I think this
> is a QEMU bug -- I sent a patch, not sure if it went through as it didn't
> make it to lore.

Ah whoops. I saw the patch but didn't read it, then I assumed it was a
Linux bug from your diff earlier.

>
> I also think the bug will manifest without the TB exit patch, maybe in
> single-step mode and definately if we happen to exit the TB at that
> point for other reasons.  Assuming my reasoning is correct in that
> patch, we may also be hitting this as arbitrary corruption anywhere.
> I'd started to write up a "QEMU errata" Linux patch for this, but then
> convinced myself that just adding the sfence.vma was insufficient.

Yeah, looking at it now I agree, I'll send a PR for 7.0.

Alistair

