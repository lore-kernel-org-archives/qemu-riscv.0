Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMXLl-0001Mk-Bl
	for mharc-qemu-riscv@gnu.org; Sat, 04 Sep 2021 11:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mMXLi-0001LS-KZ; Sat, 04 Sep 2021 11:12:54 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:41527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mMXLg-0004vI-0G; Sat, 04 Sep 2021 11:12:54 -0400
Received: by mail-yb1-xb33.google.com with SMTP id z18so4212417ybg.8;
 Sat, 04 Sep 2021 08:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WD6f89m2SlIb3H5FexENlHNJlHRx1RjUO7pjVAOw0hg=;
 b=YXFSFYt0pJbJnrQyJm3h8tMYE2CP3fMeYqqS98h6aGEcuVLztQPlsgWjJkzIKPkRVD
 BTAw/CBhMrNjJx/DLIGIMin9IAm/uj6k/kJ43emjnISrAVt37kFgSebWwfYZIg+QebLc
 uTraWwORFGVj8fyWgH9PRWsqwMaZKUTsvJjIqSnh1RhDWSdzplBcoKNHSfrlR/ND6fZm
 hggCG1Fs/IbVT/kUW1rgzQMVZ0wZim4JI/r/9aYuVB533drsjsmuNcLzFXJiwY+hQOqk
 i0SQiWDGZcXXhwmuXC+N8FuGopR/xA3ClXGngfFE30UT7UFRmY8KiBJoMSA/eZjBKWiu
 gKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WD6f89m2SlIb3H5FexENlHNJlHRx1RjUO7pjVAOw0hg=;
 b=I/5Fbu2VbXkuR9XiYI0RVAE38Ap/RZQ/njW+yJDguG3l+GIrET6Cuw1mWVDhVxnL4I
 +x2Vxlagc2PBFLfKLBtD3k6co7s4uXf3PaZ4KzI89Sqxcy5MVIetDOn8Kyv6uwsRC8j4
 Ks1l7Nj8C3YEaNRZwIozUBA9ost5vSmOwVpeK1p7S5pJ/JOmvVetofIVR4W2rU/q7aYz
 tdUePkmhRrRjC43U2CoDvhz/w+UH9dYoNApftV/kgiPXXZSF+soI9quvES0Xl8J5v3KR
 Lt4Pz2OK53tY5LoZ3PCDUYXErzt3SAB773oK9MpwC8g5982UUurTNTUBeEpvHgMB4om0
 eiQw==
X-Gm-Message-State: AOAM530wpboIVSWdDRuzLGaK/LCjEexf+uMxHks4gsXpHo0QJeKoHnVn
 +8V9vIq54iBmoaJ4rPibQnV5xquHjsLvlwX0vTU=
X-Google-Smtp-Source: ABdhPJzFEYAFSZfY/5N2X1q+F81JcMHJkHkkuIDPEIx4ZN0pA5IUQeECv5Xgw109iVryjQW4HQumRdLl4Z94YcSksig=
X-Received: by 2002:a25:76c7:: with SMTP id r190mr5892462ybc.467.1630768368993; 
 Sat, 04 Sep 2021 08:12:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210902112520.475901-1-anup.patel@wdc.com>
 <20210902112520.475901-6-anup.patel@wdc.com>
In-Reply-To: <20210902112520.475901-6-anup.patel@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 4 Sep 2021 23:12:37 +0800
Message-ID: <CAEUhbmUiq4hPgEP9xiEsb0kbDwYJyBqet+gnn+ydrJekxwnNyg@mail.gmail.com>
Subject: Re: [PATCH v2 05/22] target/riscv: Allow setting CPU feature from
 machine/device emulation
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sat, 04 Sep 2021 15:12:55 -0000

On Thu, Sep 2, 2021 at 7:42 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> The machine or device emulation should be able to force set certain
> CPU features because:
> 1) We can have certain CPU features which are in-general optional
>    but implemented by RISC-V CPUs on machine.

on the machine

> 2) We can have devices which require certain CPU feature. For example,

a certain

>    AIA IMSIC devices expects AIA CSRs implemented by RISC-V CPUs.

expect

>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  target/riscv/cpu.c | 11 +++--------
>  target/riscv/cpu.h |  5 +++++
>  2 files changed, 8 insertions(+), 8 deletions(-)
>

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

