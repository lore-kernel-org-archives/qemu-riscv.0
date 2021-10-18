Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcLtQ-0003p0-6f
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 02:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcLtM-0003mT-Ho; Mon, 18 Oct 2021 02:13:02 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:46982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcLtD-0000ew-OT; Mon, 18 Oct 2021 02:12:59 -0400
Received: by mail-il1-x132.google.com with SMTP id w10so13682325ilc.13;
 Sun, 17 Oct 2021 23:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tMii9gvKxQUCCmjsucqyKkKKMviA8Cy8hZrH3nSk1D4=;
 b=RF6bV2fZ/dc7ndSe+qV/avCkgHUQSs5vjLv++CeGZg+OJ4DqNWQtw3mpC0Q/btlaOs
 3syoiyee9NMG3oOkMJla9kkkX4cA5+zHNTsmYU69jhs3S+TNnIA8v5TXgxcOj+JlZT3g
 qZOW4LuVOP9QGdk1tHxO3DooPdrofqd0jWZIFUJ1fs2lwOGTJ95FGYjScS55yMU47z0Q
 Arar1V0aLyDFiSvLyIqCZ63qIP3A1V+GdcYtIhsFquLJ9KnY9Nb/p1yDWWA2xVmCi+Gl
 r7Ds+zH7cdkZaWxt9SkeJCx1azrg7AWTvuZs9m7sVFUmxsN5zE/jsiqzW397jFeq1hUY
 wy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tMii9gvKxQUCCmjsucqyKkKKMviA8Cy8hZrH3nSk1D4=;
 b=w1tX9mDWed91HcM5gD1iqdirjNrFueUudBCdNYZGExFmyzCCzJFaDQ9Gdqc8x6uybu
 tbyAU/uSacF0crQjAe8dtED2G/ZWTEozE7ItQkJ7SL89Sc+NAcHM6ZDT8WvJMu3BCw87
 GfsaSObVQf0zU5UqWVfaXFstvcIgbwr4KcLCiICNX3Qu9ayhEH/H3WmVQ8GTuGhpi2bA
 qPk0SqcW2dMwcISbU11HHM1MZvyt1GdZHaCuYZHU7cH7JRqlxW0ZVz9RNmyPNsA19XB7
 zEURxdzL4AhyqmakFUsp2D8rHUDzybhFtlGWb3HA2+4lV58rDxuM0SIkBPLiZ8fB7PYw
 YDDg==
X-Gm-Message-State: AOAM533W19Y+GccSTwoemsFmzBovotMxTeEQSU4kfCtEq9cZHTgM8ide
 cFyEx44M6/bBmFA0fE7eKCXJ2VPUJtKMn/bgfro3akG4kCQrpEoJ
X-Google-Smtp-Source: ABdhPJyDYth7AMLJsPzvCe/61wkVZ5v7ykjOm8gNUFE2xLvLbCIkXQ8lDNJ6BmdW3tvRqb3Gh/7WM/QUJ6dg8DvaXXc=
X-Received: by 2002:a92:1a43:: with SMTP id z3mr12900865ill.46.1634537570335; 
 Sun, 17 Oct 2021 23:12:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <CAKmqyKMf3QUi9HGK4rx6fJBh6_YvpPYDpf-u5pgrx6VE58ORWw@mail.gmail.com>
 <CAE_xrPgpgNT2nAsiOsV+z+VT4tRRGK6qs0mqRA13agU=TnJkHg@mail.gmail.com>
In-Reply-To: <CAE_xrPgpgNT2nAsiOsV+z+VT4tRRGK6qs0mqRA13agU=TnJkHg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Oct 2021 16:12:24 +1000
Message-ID: <CAKmqyKNbqA_svmQHTpMaK8yHk6bpm1f+Bs9t2ktO4TvN4e6rUw@mail.gmail.com>
Subject: Re: [PATCH v8 00/78] support vector extension v1.0
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
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
X-List-Received-Date: Mon, 18 Oct 2021 06:13:02 -0000

On Mon, Oct 18, 2021 at 4:09 PM Frank Chang <frank.chang@sifive.com> wrote:
>
> On Mon, Oct 18, 2021 at 2:00 PM Alistair Francis <alistair23@gmail.com> wrote:
>>
>> On Fri, Oct 15, 2021 at 5:48 PM <frank.chang@sifive.com> wrote:
>> >
>> > From: Frank Chang <frank.chang@sifive.com>
>> >
>> > This patchset implements the vector extension v1.0 for RISC-V on QEMU.
>> >
>> > RVV v1.0 spec is now fronzen for public review:
>> > https://github.com/riscv/riscv-v-spec/releases/tag/v1.0
>> >
>> > The port is available here:
>> > https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v8
>> >
>> > RVV v1.0 can be enabled with -cpu option: v=true and specify vext_spec
>> > option to v1.0 (i.e. vext_spec=v1.0)
>>
>> It doesn't seem like this series made it to the general QEMU list. You
>> might want to check to see what happened there.
>>
>
> Hi Alistair, what does "general QEMU list" mean here?

To the qemu-devel mailing list.

A good way to check is to have a look at something like patchew
(https://patchew.org/QEMU/) and see if the patches are there.

Alistair

