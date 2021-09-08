Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mNqWr-0006dG-76
	for mharc-qemu-riscv@gnu.org; Wed, 08 Sep 2021 01:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNqWp-0006bW-M5; Wed, 08 Sep 2021 01:53:47 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:46069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNqWo-0003Ce-9y; Wed, 08 Sep 2021 01:53:47 -0400
Received: by mail-yb1-xb33.google.com with SMTP id c206so1873337ybb.12;
 Tue, 07 Sep 2021 22:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yY3cIVJ4t+f/TjVBHCAvYuk1iDgnrl7gRmC6RRqq62o=;
 b=L7g9EpaJXdaOqtSbg7caIWaHZuFUbx3tFhuSeQmx0/cw00BeEutT7CZjnuaJTKpBZ9
 AH2IhDec0KHUScU82s0tSMHNnXaUxlRVEuDjAKkTwBdUGKPwrIg9OiGkGpgJQgWEUes0
 ernIsmg5oIRuK5PTJ3LbdV4XiH39PmbEfD1GVB/ngXvsFClkHsOXq165JeXWDZAdcS7J
 pyRfPL3uEm07sLi6QXT2cWBXEVtZMIBFGI8A75gQgGv3pUzqLXjhcicnZFv7A09xYuWP
 pHumP6ZNqu3E2C+8KtDpyYExySa2FdOXI/OZYE9o4loELv4xT8J1tfRBkGgbwgJTu5r8
 zZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yY3cIVJ4t+f/TjVBHCAvYuk1iDgnrl7gRmC6RRqq62o=;
 b=T9OazkWTOJW3oPlIcZwYtUIxhnFq0ONdTnY3exT/TTlRtRSWN0YGl5uP0ziUyPG6fn
 NCmT7PMVgliwCx0wQm0lQtVb9US3543C3K/Ju7PzZsW4m8s0zkrVCY2MYhW0i9e8t+wi
 +gSauArFIWMNyoXBOrCLtlrfNImbnyXJz9oOt9nCiG8cU4+ZQrYa52loqgSBEo9UjuHn
 7eZkrvyikgQPwXPbN1YkMVg3ozBM9iIfWi+khIUwujfv2n+wf7VcV0DWq752eSmoIhhs
 clzOfnKYiNbgLYbMpQEDQTCoRm15RInUp39wq6wMRQQDFhA3nPfsg1/xkm0tQAvLrTuH
 vn3A==
X-Gm-Message-State: AOAM532bliGpxXIpDlt869/UpSvBDNInRaEcI8YbdBOhOAMh4Vt5nTu6
 zqFI5VAErDF+OD6/t9As//sDhlfjnRrnxvcQQYw=
X-Google-Smtp-Source: ABdhPJyLPmGapK7Hi32kBLRdE9v5NwI65AsDdb8yGQgvpRXdHYVhR4SXgcys+2onG61dseIBzP7H2FMBWmJUqj5EFbg=
X-Received: by 2002:a05:6902:120a:: with SMTP id
 s10mr2703172ybu.293.1631080424887; 
 Tue, 07 Sep 2021 22:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631076834.git.alistair.francis@wdc.com>
 <6809670a315a07e7e6b435cf7942f82bdd8b99d6.1631076834.git.alistair.francis@wdc.com>
In-Reply-To: <6809670a315a07e7e6b435cf7942f82bdd8b99d6.1631076834.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 8 Sep 2021 13:53:34 +0800
Message-ID: <CAEUhbmXThA117GO+nUM9nNAW54ZxwKhn4-t7Eco7mMWS6kxthA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] target/riscv: Implement the stval/mtval illegal
 instruction
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair23@gmail.com>
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
X-List-Received-Date: Wed, 08 Sep 2021 05:53:48 -0000

On Wed, Sep 8, 2021 at 12:54 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> The stval and mtval registers can optionally contain the faulting
> instruction on an illegal instruction exception. This patch adds support
> for setting the stval and mtval registers based on the CPU feature.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h        |  5 ++++-
>  target/riscv/cpu_helper.c | 10 ++++++++++
>  target/riscv/translate.c  | 31 +++++++++++++++++--------------
>  3 files changed, 31 insertions(+), 15 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

