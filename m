Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nfCtD-0004Pb-Kh
	for mharc-qemu-riscv@gnu.org; Thu, 14 Apr 2022 23:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nfCtC-0004PN-23; Thu, 14 Apr 2022 23:44:54 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:42910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nfCt7-0008Rj-09; Thu, 14 Apr 2022 23:44:50 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id p65so12691377ybp.9;
 Thu, 14 Apr 2022 20:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E3tgkElmvOFOIXgnphwM88co/47lBsbfTpbFFki4jxE=;
 b=Zv+rZLRwODQPyMjP8NVKkbyrnzfP88UQbDUkr1ctqHEWXcQLF3IPOjQslnuOhpLDvo
 9umqf/1W6j1OOBjXZt/vYWJURQ3GJdc4/nxnG6XFQ+hKypm54gXPIc7BYHdqEpBtPtKg
 1tTwTJBRW3lqHYpwRlBttTYuNoWdubGnckqVUTUybl38Fmdr0CDxf/ErAfBhYu9jLbuQ
 tsrh/M1QL6cm7gxVD+JJFMxnbJCZJQIP6zC+k+XQZtdkw76yAdMj9Qw56ccmb7UXPCoW
 /1BNB3gi5BBIDk6cy13zGOVCIcYKozyo5k4iG5FolzxrZs1uJcWpoR+dMWr6R41+Aay0
 gLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E3tgkElmvOFOIXgnphwM88co/47lBsbfTpbFFki4jxE=;
 b=q3sv+K51bh2yZBWP6cK2rl0i6yzeQ6Blexq0TTNTzwCtxnWGg0zXgbEqtCNl/s7s6P
 plsDbFNM9QSNl7h8ddtuxSLj6ffrZgf9+TWDFiL2C6qioTJUCl8bTZ1koYNW2ZbRdwCZ
 5S5ankRaNv+w0zHQQcs7ktF5myhJOI2m7XX19zH2X7Tzu+Mub/y3ftiRBOjV7B8PSq0d
 viVMetBJ0r1o3z3Z9cyv/pZWWTbWj/xCMCoaoEJra2nrO5XkXtwsZkUZOXFyoPYQSux8
 MhU7nJWWb+bsrTlTsNnixfPrynvqukiHXETlZ6zpn58In59eyAV0d3HKrwiTBa8C0h+e
 szFg==
X-Gm-Message-State: AOAM5327H7LBCRWxcBtcz5qDJpMWWl6Af56WhXMAblJo95NBEZu2XhZ5
 MwkDal+pmmwSjVTFNN+FrOIX97JJcxmrZQmntGM=
X-Google-Smtp-Source: ABdhPJyGrLAFYWv+iemRAxXpUjRBprqSlnaRGz9p79HJK7XhUKSafISbjq5rJBiicTq+Qi0+cReia8xTcDJ4WMN1pE8=
X-Received: by 2002:a25:d08a:0:b0:641:daac:ff82 with SMTP id
 h132-20020a25d08a000000b00641daacff82mr4027971ybg.643.1649994287187; Thu, 14
 Apr 2022 20:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220414155510.1364147-1-niklas.cassel@wdc.com>
In-Reply-To: <20220414155510.1364147-1-niklas.cassel@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 15 Apr 2022 11:44:36 +0800
Message-ID: <CAEUhbmXfJdLKa7=MFw-Tqf5rnw+BAVqqZ2fmT+jfPxiVgBQPag@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: fix DT property mmu-type when CPU mmu
 option is disabled
To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 15 Apr 2022 03:44:54 -0000

On Thu, Apr 14, 2022 at 11:55 PM Niklas Cassel via
<qemu-devel@nongnu.org> wrote:
>
> The device tree property "mmu-type" is currently exported as either
> "riscv,sv32" or "riscv,sv48".
>
> However, the riscv cpu device tree binding [1] has a specific value
> "riscv,none" for a HART without a MMU.
>
> Set the device tree property "mmu-type" to "riscv,none" when the CPU mmu
> option is disabled using rv32,mmu=off or rv64,mmu=off.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/riscv/cpus.yaml?h=v5.17
>
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> ---
>  hw/riscv/virt.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

