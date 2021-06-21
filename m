Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lvSZz-0005xd-51
	for mharc-qemu-riscv@gnu.org; Mon, 21 Jun 2021 18:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lvSZx-0005xP-MH; Mon, 21 Jun 2021 18:39:41 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:35763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lvSZw-0006hs-3M; Mon, 21 Jun 2021 18:39:41 -0400
Received: by mail-il1-x12c.google.com with SMTP id a11so9988613ilf.2;
 Mon, 21 Jun 2021 15:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BCpVOd+aZQP2Np1xIhNdcbPkBUCJGXERSD47ey1TAKs=;
 b=p+gFbD2/9jBeq+yQkZWD+GOPH66CcbMJsUlIzUEbf5xiQCbp5k5L5GsaXyMdXj1c8s
 UsE1jtDXEOZSxZDD2Q7vlRKiSTR2ftLvSOi9uovsqDYU9q3IAURjZFb3o7nHf78rXlQg
 SsEWr8/9mPB06+4/aJLMUfxFR9CCcPCETi3ANwbMKsFZ38GhuumjfIr1cOOW3JiG3BYS
 KG8z8wCgIVLrQqVvd0Emwi6AJsaUNaYZ+oRjsUp3zQHrteJ+SZPCJNSPh9Q392Un6WSd
 wx9fxez6iHexvseZRjlbnqpyxOJ8KB6BnFkwcLsltAjrj74K+of1DOZRy5P72S2lMhc/
 dWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BCpVOd+aZQP2Np1xIhNdcbPkBUCJGXERSD47ey1TAKs=;
 b=b1wUjVueKMMG8Pw9/GK8Osfiydybn7EWC++oH1pb44ILpc/bTejVkL8kxdEJxcVLUf
 aFPH/Mh24I1X98IzJk9qzujIIdW3+X1yVorSo7I5D4Yv+9RIVrSn3WYDHc1yUq1lwrAB
 upUPfL/bYT90d1ukmCjnapS7BxFs90PJel2eXNVQma8TkGi50MTbWk4RducHxnambWP1
 V8gXqsUiXVTXvAhG2hFKBgGnM7ow9S41u6UThU5C4lE2hPfJmI04i+WnbtrhpVVNUlS2
 2pgD7F7hD0MsGDYEmQKoEqtAzhPgv96kN5SQzmgXZEldX5mF0rmkLjNMY5xXNore9eCe
 vAiQ==
X-Gm-Message-State: AOAM53167rV1iXSpqryfe7662FEQf6JtpS54plBKVqtazgQOuF9KjSSH
 OcOwcRdtloGoe59d/WPt0E55VAVQi4e5msV4Rc4=
X-Google-Smtp-Source: ABdhPJy2gI0N1k8BdREB8/5ETgwiNZ/eN0w/WLVLl7cB2c8YQaEY9vXrtYfvIAnJczste4WLYDYt8PpLNTCZVZ+35ew=
X-Received: by 2002:a05:6e02:dc7:: with SMTP id l7mr406770ilj.40.1624315178653; 
 Mon, 21 Jun 2021 15:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1624001156.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1624001156.git.alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 22 Jun 2021 08:39:12 +1000
Message-ID: <CAKmqyKMjdfAjvWVd+V2RPFMToGmitO2CSzKTk1t+=y9pM7bZUA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] OpenTitan: Add support for the RISC-V timer
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
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
X-List-Received-Date: Mon, 21 Jun 2021 22:39:42 -0000

On Fri, Jun 18, 2021 at 5:27 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> V3:
>  - Fix the value of the "infinite timer"
>
> Alistair Francis (3):
>   hw/char/ibex_uart: Make the register layout private
>   hw/timer: Initial commit of Ibex Timer
>   hw/riscv: OpenTitan: Connect the mtime and mtimecmp timer

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  include/hw/char/ibex_uart.h   |  37 -----
>  include/hw/riscv/opentitan.h  |   5 +-
>  include/hw/timer/ibex_timer.h |  52 ++++++
>  hw/char/ibex_uart.c           |  37 +++++
>  hw/riscv/opentitan.c          |  14 +-
>  hw/timer/ibex_timer.c         | 305 ++++++++++++++++++++++++++++++++++
>  MAINTAINERS                   |   6 +-
>  hw/timer/meson.build          |   1 +
>  8 files changed, 412 insertions(+), 45 deletions(-)
>  create mode 100644 include/hw/timer/ibex_timer.h
>  create mode 100644 hw/timer/ibex_timer.c
>
> --
> 2.31.1
>

