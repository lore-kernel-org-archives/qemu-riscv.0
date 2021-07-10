Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m2EAB-0006dk-9n
	for mharc-qemu-riscv@gnu.org; Sat, 10 Jul 2021 10:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m2EA9-0006dU-NT; Sat, 10 Jul 2021 10:41:01 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:38625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m2EA8-0003Oh-CC; Sat, 10 Jul 2021 10:41:01 -0400
Received: by mail-yb1-xb29.google.com with SMTP id r132so19676298yba.5;
 Sat, 10 Jul 2021 07:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d5yR93fbZ8qO9YmWwUFCzwKqdNjzkVXi/Bn28rjzd5o=;
 b=c2w0d/79E+3n6dAy8niV5SWGJ0y8iUpriKYAYrBnKMacW+jeJwtgRXKHIqdUR54I4s
 gS3V2ZHp1tsLuOcnS+7it1yeyRDb2ua3bima5kz7rOS8OEiHDIB8ohXlHT0wBmJeJHJe
 lba83RXQhbiP6DVvDypmrmmrgfzidoA6F2oLpmnK3h/hHNGN9uOl6titrQMRPYGMZsSA
 QoKDGoEqoMKpphVFfu2PzDpK4fjET+/m+QD8AyMid58IqW1rJPwe40Lfa4gL4hhtEGz5
 yz737VCZ1VPDxlaX8T4tdqJPRTJpDGrF87tCFUHghBKERJzVAd9ebN3MRW+Vq0SLdmDG
 8axg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d5yR93fbZ8qO9YmWwUFCzwKqdNjzkVXi/Bn28rjzd5o=;
 b=lZkVfwrKd49u3RqM0MKlOmaHXnIjFqU4cU5XrMtPkZH/9VXuVHg7k4CEUcyA554Tu1
 aRFrERZhoyz2Bo1mQ01UM9S7R+I+sVDu/hPd1irAvq1k3mrHmi3kLeLUZDiiUfOGWZJT
 MQLPgj4xYx57CVFaxlOaAP2dUU3dVQfgoI9afYxG+4bJ8Cl5/0NDe0lHhkVlGIY5ko2b
 TT/29S+WCQO23mABI7qUiyjMyA4222tNJlz/OuXecTHCafHJjuuAk1vLN0H42tdsBx6v
 GcwbJCGaLeYCRumIdF7Jlhwdds23dVWSgup6GzJcfZHVG0RoPj0v9gnFpdfxVpeVqgqL
 0lsg==
X-Gm-Message-State: AOAM5310Rnxdx+gx+r3SmnLj5P5MIgtBK7IWkz6SMJ1taxvHe8zzeCqT
 CL7iSDUDoqXtBHsMlIqdt7cu3+JcANRL2+X9tf8=
X-Google-Smtp-Source: ABdhPJztzKaWykRM3rgFKUuvIwhcmdgMY5Gp0N9rxghHJXDhFS2IY2yceUy47AxQZmHYp7984+598wdoTeKkUSwr+6k=
X-Received: by 2002:a25:dbce:: with SMTP id
 g197mr50366847ybf.152.1625928057640; 
 Sat, 10 Jul 2021 07:40:57 -0700 (PDT)
MIME-Version: 1.0
References: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
In-Reply-To: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 10 Jul 2021 22:40:46 +0800
Message-ID: <CAEUhbmWBmVP0XtJycrk0e=pcxwBucNpV8nfUYkQZz_i9hWek3Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] target/riscv: Expose interrupt pending bits as
 GPIO lines
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
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
X-List-Received-Date: Sat, 10 Jul 2021 14:41:02 -0000

On Fri, Jul 9, 2021 at 11:30 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Expose the 12 interrupt pending bits in MIP as GPIO lines.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

