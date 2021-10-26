Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfGHb-0006HX-IV
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mfGHW-0006EM-SG; Tue, 26 Oct 2021 02:49:58 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:44575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mfGHQ-0003WI-E7; Tue, 26 Oct 2021 02:49:57 -0400
Received: by mail-il1-x134.google.com with SMTP id h2so15820534ili.11;
 Mon, 25 Oct 2021 23:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G0yfAlfyL3g00v4QKc3SYcp6ZyZfRoMaximLEfIe0ys=;
 b=UXyWLwFDKDPfteJP/FEk+NKDZJN8pbgnlXJKqvT6ioD9rwjl5IUukyADgdDOfBkh6i
 3QhmQW3TOvPp6QE7iYM7XgLlf7Kwj8F2OVPJ2wByKR/dZ8+q5d6OzY71j5gIrfKtehle
 AfS2IRgVNplVkfWeN8kJHaxalYIUmhQzpYGXZ20Zn4UGNjv3i+PqCkHnXIMZtstdN61H
 M8UVPBJ6YpkVKao+lhzoASnw6E6DGCbUTZSSzuM0HWQ0hWCR0Gw4njgbT9AIj8mnwkbn
 4sUbaztHqps9FoRzH8uLoA7auZEMT7bYrzSXCOZ38GT1CuI3BDUUYz6X299pCHfG+HDi
 KyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G0yfAlfyL3g00v4QKc3SYcp6ZyZfRoMaximLEfIe0ys=;
 b=zhMSdZ3As8MjI/PwVR9cdfrC2k/RgcHPSKkVSNgWq8GIH4ac+tAqiYrm9gawinxO80
 4v3X5fVeEvWnqqhXQXB0pi6agEK0DcZEZFJgOI8m/Nuw+XtYjM30+CIl13HQlc26vrFf
 RzSikeCV9CjjQg5RN8n3NWLIqLMt+mSWm/WjTBE6PhM0kfR2uyrI7dv/t7gcUSQGorUz
 i44Gc9wUJaWNzBUnpqi7MoAisKZ2KJGlcJx7pHqZNDJYj5etHXRlu7ip/g8my5JQlIRQ
 NFxNE6bXAsvqeirpcqIowCxKKQ4xBru49+2uZtiOywOSay4NuJueLHsGrPv2M/eVVow+
 mOuQ==
X-Gm-Message-State: AOAM532yFu2vdtRRe4tQOD2fsJvPh0GifO3y7SqwpKdWehCsXn7uz3mo
 sBgIrcgGWzFE8cDO9WBdKf5eQI5wjA1GQB7/7YY=
X-Google-Smtp-Source: ABdhPJzStRGtKzROb4x2KLBnD/fJUAfBgyZ1tEye9TSuIXmIa2lJE3KwFNFo47uyPb6j9kBodsuOSWxft+hOa6nPQeg=
X-Received: by 2002:a05:6e02:1be4:: with SMTP id
 y4mr3488961ilv.74.1635230990939; 
 Mon, 25 Oct 2021 23:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <20211015074627.3957162-86-frank.chang@sifive.com>
In-Reply-To: <20211015074627.3957162-86-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 26 Oct 2021 16:49:24 +1000
Message-ID: <CAKmqyKOq9x7S89nYcxvBYtvSSWKfaZPwRmf61gT-=s1nE+EBVw@mail.gmail.com>
Subject: Re: [PATCH v8 78/78] target/riscv: rvv-1.0: update opivv_vadc_check()
 comment
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x134.google.com
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
X-List-Received-Date: Tue, 26 Oct 2021 06:50:00 -0000

On Fri, Oct 15, 2021 at 6:48 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Vector Integer Add-with-Carry / Subtract-with-Borrow Instructions is
> moved to Section 11.4 in RVV v1.0 spec. Update the comment, no
> functional changes.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index b78c13f0be7..de2e2e506fe 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1613,7 +1613,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>
>  /*
>   * For vadc and vsbc, an illegal instruction exception is raised if the
> - * destination vector register is v0 and LMUL > 1. (Section 12.4)
> + * destination vector register is v0 and LMUL > 1. (Section 11.4)
>   */
>  static bool opivv_vadc_check(DisasContext *s, arg_rmrr *a)
>  {
> --
> 2.25.1
>
>

