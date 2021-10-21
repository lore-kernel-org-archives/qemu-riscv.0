Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdSTs-0001r6-KQ
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 03:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mdSTn-0001oH-7Z; Thu, 21 Oct 2021 03:27:12 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:34347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mdSTl-0004os-Bq; Thu, 21 Oct 2021 03:27:10 -0400
Received: by mail-qk1-x730.google.com with SMTP id g20so6281137qka.1;
 Thu, 21 Oct 2021 00:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e9B8eY7GkIiiJOTBPfD3xAGhFibSqbucW7x7sz73HUg=;
 b=ZA43CPtolcfGydCtujOcYcehx6vsSV7QKG4iPQ7Z7S6PEoyRRoNKVa5fHW0uioWmyo
 IjthpWNH9E7yy5kXLmQ93GyQ9h4KexoZDxCFolKJFfK1aWCXTubMNxwK/pkZmrJUziEc
 6FnmTWnm8z8Qi9t66vxZfdalWci0gdHYrmmJuETkr0t7NYU9+OXG+YuYTDWG64456N0Y
 gIVIyEvQt5RefabxJLQ7QMZTX+0ZJm241BJH+jjUlgzejXHOq8rAd8zh/TQUjrJJ+3Sf
 8CKv38xWITNjGNNIT7DzGQXcZDUxZ6mid2mUWDc9vPhzuiTyuwoTZkJpi0AuiPfaQCN0
 A9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e9B8eY7GkIiiJOTBPfD3xAGhFibSqbucW7x7sz73HUg=;
 b=HQtFsx5n64hf5PTSdVvV376oEINnrlbRTAaVJEN9w1Js7xFiCopcgj5gHCbnj5+JTJ
 IHCIoGz+fyaxsU0d7IL9ayuyl/xGNuCCi5kmGkOhDCXUaN4x1OShq0fAGqtG6RfmHyqw
 BvFt8pv/eu3ViwHxuZg+bK7lgfbKPaFyb0rD0kW0MKV2ssYgC3nABwvvM98x9/wM3fne
 I+I0DlGk4wswxJ0NSRb8hMNjCQ+RmCj9CVApcbkCvx7TME3U29FqnwaUnmUKM1MtiiTz
 rWkVWICqvfwsVFjCsUCrxE/YAlqDoSbTKuc68+HVmzlQktyOM/yv7a+LStMzCLeNMn6L
 6J1g==
X-Gm-Message-State: AOAM533Bpe9LF+yPk9nkNbqZLamu5zE2My6fa3/zwm+aCoIGmwLurFza
 EoJOu7P3ZYuR4TZVzs9E4AmzQzIE/ACSgSmPoww=
X-Google-Smtp-Source: ABdhPJwQvkEGRfD3Dy5PPoFEaWbOibSx1c9Sa/2ajFt+AtTDdnrIYgLRw5CvRBiJdea8JOYCKSNUi0yzP2eawtzEr68=
X-Received: by 2002:a25:df84:: with SMTP id w126mr3957065ybg.109.1634801227266; 
 Thu, 21 Oct 2021 00:27:07 -0700 (PDT)
MIME-Version: 1.0
References: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
In-Reply-To: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 21 Oct 2021 15:26:56 +0800
Message-ID: <CAEUhbmWpnr3uE6qFjMOodOrXVyZiZ5aBhwCoof0CxPkQTC9=kA@mail.gmail.com>
Subject: Re: [PATCH v1 1/9] hw/riscv: opentitan: Update to the latest build
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x730.google.com
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
X-List-Received-Date: Thu, 21 Oct 2021 07:27:14 -0000

On Mon, Oct 18, 2021 at 10:38 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Update the OpenTitan machine model to match the latest OpenTitan FPGA
> design.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/riscv/opentitan.h |  6 +++---
>  hw/riscv/opentitan.c         | 22 +++++++++++++++++-----
>  2 files changed, 20 insertions(+), 8 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

