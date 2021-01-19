Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1uUt-0005pp-8B
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jan 2021 12:08:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1uUn-0005f2-Ea; Tue, 19 Jan 2021 12:08:45 -0500
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:38213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1uUg-0004WY-Ix; Tue, 19 Jan 2021 12:08:45 -0500
Received: by mail-io1-xd2f.google.com with SMTP id e22so41010424iom.5;
 Tue, 19 Jan 2021 09:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=40QeAgMnbYy25MaiAE4YrLU7i340GYM2vYObI5hJdGg=;
 b=lDiNg7EH/IM+IqkPn/l2z6NQT4EjTK3fX/mNyIHqVhtjo0o3Gq8IdkVSy2nl1naucC
 vJGAgwXAx4zE/Mm1ONl6yJtUlya7wqiVC1vY6eeSLrq+egGTkrOiqNCv14poyJr5Json
 lYuqyPbcuUiSoCc8fvWpSKtIIxqK1pFbD93HwK6XgnSNnJmSUWUWlbkQdfxrWBJnu+Fv
 ouBnuuOWfAJlhhEYycOl+vHOXrL/hIEDWcZnF0PNUfTc3usF2W82LQKRGgSL0xjz7zQT
 iWuTzVgmptpGHUZ5oM4yMYke4B3BKltXEZulDmT2+stiIwDNktkW6h4s2x2jyL9LOU6a
 6D4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=40QeAgMnbYy25MaiAE4YrLU7i340GYM2vYObI5hJdGg=;
 b=sHTGGzl/qc76RPTtITDYAOOrRPqKmRh4LF5Q0gYu7/I8D0I/c/qCsaKK16RhMdenqA
 sAuh+GoIHZBsWHwN80SCkcQccFzvR2j4UL+Mw15HdREQ9PITJGQfqGSi/i5huTiWyzBS
 8SpFSnpqqahd+2il6Tl005D9IWXcw5tGl6cjigwA5GNnchZ+F/V9tZJA+VHfCjH1nqKH
 e93THXXlmdYYwN457z229vEOFWAdwFDOZSXRFw68pNDo0iMOvk7tPCJK9bt3T5hHYoMq
 2illPQ/BmMIsP7Bm7uup5ldFOlxCPAwa46OPsPbvkGcnxMAeIOttj4f6jqlruaRUYBlq
 TDBQ==
X-Gm-Message-State: AOAM533AguKDkm5ZUO458Xk/not7kw4B63yXTQY4uTXcDAKeiUOZISAI
 qsCNlo8db64SaFnVIZ77NbKTQ65mr+JxWYTWVAQ=
X-Google-Smtp-Source: ABdhPJwCywgmyKGcO+3RBKJ0SQRF85W3H/HmJN2jA0IdSZ4WChKMrUL9LgDtmqUuKBme64HgnG0YGTcgJVi6oNsLUT0=
X-Received: by 2002:a05:6e02:20e5:: with SMTP id
 q5mr4160612ilv.131.1611076116688; 
 Tue, 19 Jan 2021 09:08:36 -0800 (PST)
MIME-Version: 1.0
References: <1611024723-14293-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1611024723-14293-1-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jan 2021 09:08:10 -0800
Message-ID: <CAKmqyKMb_C+TSE7LLfyCm6j7rm32OH4UZQzRr456Pf6S0Ws79w@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Declare csr_ops[] with a known size
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
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
X-List-Received-Date: Tue, 19 Jan 2021 17:08:45 -0000

On Mon, Jan 18, 2021 at 6:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> csr_ops[] is currently declared with an unknown size in cpu.h.
> Since the array size is known, let's do a complete declaration.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>
>  target/riscv/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 02758ae..419a214 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -487,7 +487,7 @@ enum {
>  };
>
>  /* CSR function table */
> -extern riscv_csr_operations csr_ops[];
> +extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
>
>  void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops);
>  void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
> --
> 2.7.4
>
>

