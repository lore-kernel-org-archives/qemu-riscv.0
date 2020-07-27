Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k0Cqq-0005hb-GF
	for mharc-qemu-riscv@gnu.org; Mon, 27 Jul 2020 19:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k0Cqo-0005gv-FD; Mon, 27 Jul 2020 19:48:10 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:38959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k0Cqm-0000ac-OM; Mon, 27 Jul 2020 19:48:10 -0400
Received: by mail-io1-xd44.google.com with SMTP id z6so18931421iow.6;
 Mon, 27 Jul 2020 16:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xRSnipLXxx5JJUoCpXfRUL0NwQn7XhzydcMr06MSod4=;
 b=uwPfxmnvjDdk7DDeT/r1knho+g6sqLzuD05zM7DLJ+DPtQHVNt81f+fw9g8zzu03za
 UdPIN2XVb19FsvgUOrhC3HUgqxn0cND0dkYMzVEm9EOAYOS4dGxJ1l210/BtEb2Zd1aI
 QLn7F6VgZnVVe3nWUQFG/aPJ4Hq1uBh9pObDmtRwUsy2WDsJCQ0IFhpbpc5PcVkjSJLd
 o60gMvVltW7MHA82deteQMheDbfdLf0Tfq4du9HKyonbvfkLVUQhAGtb6Oe4oHVG8MYs
 kqV36VNc1CysRhceCBYT3GBJPb6FOl5QyqsNkLN4Pd4S9ChT1XWFCPgmyEQtHTMfqCDY
 IaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xRSnipLXxx5JJUoCpXfRUL0NwQn7XhzydcMr06MSod4=;
 b=sHUonEDag086Jcr8WDA96shkVSKu8tnOuU3sqVloNURy4ToM2ZRI2asUZSerd08YZg
 KhtRN4Tg8wX9E1h0OR5UmciHHfc6hTE8wwKWB+BkosJz3q6fIa9wZWUjkRjMtzZm58Rm
 vSMlHIXDvyEfQGb6QYZFNLRjRuBFirvjAr9By4BXSNNYGsH1zyhp5cwqLEvHDdeUCtTL
 dNoFiaBNi3FpKqiahqgU+t5rtQWPIMVmycYRYiEF6bpfAJY+C6l2Apl1tu8iK2UCpmxF
 YkjHglC7F95wV81gHHJN++b+RUfLJJHJhJyA3olX/rwMDaV4FkFAvpQvJkyNgKDgjrE4
 tLbA==
X-Gm-Message-State: AOAM532VOcz+E7DGgBgS9xroQXGeuqLQRhv0K47T9yKPN057uyObsQLM
 nK+88GYqCg664rbRtgWfD9KULATdMkdrIpBC8Sg=
X-Google-Smtp-Source: ABdhPJxiTi73hz4aMSoUlZxIZlzl0pJ3AlIBqOsuFD0/2gLMQCmOwFSIODZWkjf6hDYCojVyc26D0ZjA0DptawX0beg=
X-Received: by 2002:a6b:640f:: with SMTP id t15mr25991311iog.175.1595893687195; 
 Mon, 27 Jul 2020 16:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200724002807.441147-1-richard.henderson@linaro.org>
In-Reply-To: <20200724002807.441147-1-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 27 Jul 2020 16:37:51 -0700
Message-ID: <CAKmqyKMwv7cWf+b9AL4ufsB3oJt56SUkDKa45JqhoDuuSh+7hA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] target/riscv: NaN-boxing for multiple precison
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 27 Jul 2020 23:48:10 -0000

On Thu, Jul 23, 2020 at 5:28 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is my take on Liu Zhiwei's patch set:
> https://patchew.org/QEMU/20200626205917.4545-1-zhiwei_liu@c-sky.com
>
> This differs from Zhiwei's v1 in:
>
>  * If a helper is involved, the helper does the boxing and unboxing.
>
>  * Which leaves only LDW and FSGN*.S as the only instructions that
>    are expanded inline which need to handle nanboxing.
>
>  * All mention of RVD is dropped vs boxing.  This means that an
>    RVF-only cpu will still generate and check nanboxes into the
>    64-bit cpu_fpu slots.  There should be no way an RVF-only cpu
>    can generate an unboxed cpu_fpu value.
>
>    This choice is made to speed up the common case: RVF+RVD, so
>    that we do not have to check whether RVD is enabled.
>
>  * The translate.c primitives take TCGv values rather than fpu
>    regno, which will make it possible to use them with RVV,
>    since v0.9 does proper nanboxing.
>
>  * I have adjusted the current naming to be float32 specific ("*_s"),
>    to avoid confusion with the float16 data type supported by RVV.

Thanks Richard. As Zhiwei has reviewed all of these I have applied
them to the riscv-to-apply.next tree for 5.2.

Alistair

>
>
> r~
>
>
> LIU Zhiwei (2):
>   target/riscv: Clean up fmv.w.x
>   target/riscv: check before allocating TCG temps
>
> Richard Henderson (5):
>   target/riscv: Generate nanboxed results from fp helpers
>   target/riscv: Generalize gen_nanbox_fpr to gen_nanbox_s
>   target/riscv: Generate nanboxed results from trans_rvf.inc.c
>   target/riscv: Check nanboxed inputs to fp helpers
>   target/riscv: Check nanboxed inputs in trans_rvf.inc.c
>
>  target/riscv/internals.h                |  16 ++++
>  target/riscv/fpu_helper.c               | 102 ++++++++++++++++--------
>  target/riscv/insn_trans/trans_rvd.inc.c |   8 +-
>  target/riscv/insn_trans/trans_rvf.inc.c |  99 ++++++++++++++---------
>  target/riscv/translate.c                |  29 +++++++
>  5 files changed, 178 insertions(+), 76 deletions(-)
>
> --
> 2.25.1
>

