Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8Ber-00007H-4q
	for mharc-qemu-riscv@gnu.org; Sun, 03 Jul 2022 22:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o8Beq-000075-6B; Sun, 03 Jul 2022 22:17:52 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o8Beo-0002A2-H8; Sun, 03 Jul 2022 22:17:51 -0400
Received: by mail-pl1-x636.google.com with SMTP id m2so7360492plx.3;
 Sun, 03 Jul 2022 19:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gwQxmhighNB+mpbnQU3udezpO4z3T3t6vtjTGx48Mx8=;
 b=hDb9xP/83U4O3oeBA3I4t5+Ap/CwMg4dimPZuH6MIwxYUFVxryGWkiFsMN8Mu1mvgC
 /pWqtdpy/co69CvVhwrzldtg6q97xI+Fi1Q3oEx22KznKAYwKrrLPBh/Q7pW8OIXfpBw
 nkZp3av685w1/kkadZawNC95f/oa2cct2PbiMj0aQ8MDUV6ZDpYWlx+sXJHswkVhEm+W
 gXC6YfuWcPXOmwrDp+JQubiKv/fvz4x4T4c8AJFy73dr/7JhTqV+fV0QqLE+rho6ce/q
 +bEePsXdKBUo1p2jPiEXqqnsVv8kOyVJIsa4Awmwt712hrIxHX3TcbJ5bOXDH5W8izos
 3RMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gwQxmhighNB+mpbnQU3udezpO4z3T3t6vtjTGx48Mx8=;
 b=hKkeIbUUqEHj6NKtPibBA1DSqJ6E+YExkKkLKB/IIcv1ZRwtaBgwDZ6IqYBWVpVUg4
 BS51kbLW6v+ntUYePD/qWJRSqBIekVpo3dte61XKQXaqfjUuA/kOyaH2YWQFkVPr1e1I
 eN8eC98bb7VacboS+V0hLggJVvNU7ZHvXjlSya8NyuHAGB8uLZ2x8sbnexr1X/93aYDs
 o+Be3/WEkvrwHMdSzM4kgkIQrqx0/3iTtuFofORmxAuqE5WSQSjRyvRG3WfprGIFfzoC
 oMfV6EOuz5SLruIuQUJPFtqAgRhrlhU371qnLBOy9gE592MHPmNo6U6s9ICy31ATK4qZ
 +wfw==
X-Gm-Message-State: AJIora/C+/hCjqv5Lm1QpHIHdg0vZLnKdyOY01b93IwNWTN3nk9AGSCw
 kfyFybVteI+oSTVGBJ9v30/6F9FMih+qhwzS9sw=
X-Google-Smtp-Source: AGRyM1t6gPm0W9p2nhx19ogh13CpdOXVt5+whnUM8K4X+vSIkhbR5hINiIED5acfgC9ferhG8J+iGtNInAHhSoZNsOA=
X-Received: by 2002:a17:90a:590e:b0:1ed:59f0:bc2f with SMTP id
 k14-20020a17090a590e00b001ed59f0bc2fmr31841278pji.120.1656901067886; Sun, 03
 Jul 2022 19:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220630061150.905174-1-apatel@ventanamicro.com>
 <20220630061150.905174-2-apatel@ventanamicro.com>
In-Reply-To: <20220630061150.905174-2-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 4 Jul 2022 12:17:21 +1000
Message-ID: <CAKmqyKNNg+dMLtzSFrEmtWu_rxZUX_mDb21BVt=pnr+6MMBHyA@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] target/riscv: Update [m|h]tinst CSR in
 riscv_cpu_do_interrupt()
To: Anup Patel <apatel@ventanamicro.com>, dramforever@live.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x636.google.com
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
X-List-Received-Date: Mon, 04 Jul 2022 02:17:52 -0000

On Thu, Jun 30, 2022 at 4:13 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We should write transformed instruction encoding of the trapped
> instruction in [m|h]tinst CSR at time of taking trap as defined
> by the RISC-V privileged specification v1.12.
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

@dramforever do you want to give an Ack or Reviewed-by?

Alistair

