Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mM6db-0006Zq-9j
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 06:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mM6dZ-0006X9-07; Fri, 03 Sep 2021 06:41:33 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:45021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mM6dX-0004Q3-9r; Fri, 03 Sep 2021 06:41:32 -0400
Received: by mail-yb1-xb35.google.com with SMTP id q70so9268581ybg.11;
 Fri, 03 Sep 2021 03:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B1urHAZ5vonC2Qc1bnHdGg8hW0JKfIDo6psZgA/4ygQ=;
 b=RElB7xFSNWyM3R7pPlreTLF7Jnkf2jaZ2baNC5xm0dJUoR37W5RbXaxwBKXI2njNgB
 dM3I7NKYWpeZ6npH01grCICco5pfCvgtHOTlKmxC/HLME1Mc8MXfXCziGhdL9ZTYGMu8
 PQFAOc9xcE0b681Zpe/F4M/1lhsKb3fUh6mKF1MS7BNTBJ1mcxLNtl9lL3xnkDvcTCx9
 EjnoetUNLmTeVvz45SWdGCzWR0+RgY04hpT5Qm/ncuGE9B5cDaX/SsGnb1nPYCxN+hny
 uf+4RbVPq3DpFXjwF3ffsAtE5xQQTyP1LDwd2PR7Vfi4vrObNFCLWEuK+X2uPkET2kQr
 TY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B1urHAZ5vonC2Qc1bnHdGg8hW0JKfIDo6psZgA/4ygQ=;
 b=G8JNA/3ncc7YcoLuM+crMBVeILanFJZiGSFLdzDj3JRFuUE8ZnXpLWL3LrPsxEPRyO
 HtK2dgOU/8r5mPtHW/TxR1sfg09AD8bKdxnv7ZCnbRzrK9Ny+tW6yMIXI3oqgJyr1q6p
 h4FrPGnr7+q6y1dJ/bh8gxfDDJYxePWffG0g60ZiE5jGsVvSuvZSF++qpTeoikd0CB6Z
 rawNH2y4hcoifg/O16S/048HZYhZPIswKe7TcozhFECKvZkgzwE3cQQRtYk8Gaz3Dtm3
 V3jazjYYNeIN8E2kH5b1fUkdyMfw7r2+Wd7+j1itASEJ7vNd5kH6wQ1htl0v5W7BKfXq
 XfBg==
X-Gm-Message-State: AOAM533u12jUTQtodUX+cgsZIcDUKpynpd9DVwp3v6radj8UBJGXGe+4
 RraqF6cI8C86Ciq50gstlTw23mZXh0CD/SHl6UI=
X-Google-Smtp-Source: ABdhPJwBvIIFZ7Jf6B3yXPz0TVuUTFl1XJcmEK/Fr9Yv4Plguv1VaRSVKRKa9/WjMtra2M6WoWVJEzJFnHZZ+dcl6Co=
X-Received: by 2002:a25:76c7:: with SMTP id r190mr3902447ybc.467.1630665689418; 
 Fri, 03 Sep 2021 03:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <bc35567c2e79645579ee66f34f86cf5120710a76.1630651786.git.alistair.francis@wdc.com>
In-Reply-To: <bc35567c2e79645579ee66f34f86cf5120710a76.1630651786.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 3 Sep 2021 18:41:18 +0800
Message-ID: <CAEUhbmUs6jxRY=2-WZQXWy2ntgz=GKjA9D=ytMwRDZq1W+okmg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] hw/riscv: virt: Don't use a macro for the PLIC
 configuration
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
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
X-List-Received-Date: Fri, 03 Sep 2021 10:41:33 -0000

On Fri, Sep 3, 2021 at 2:50 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Using a macro for the PLIC configuration doesn't make the code any
> easier to read. Instead it makes it harder to figure out what is going
> on, so let's remove it.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 5624adda58..d562ec6722 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -550,7 +550,7 @@ static char *plic_hart_config_string(int hart_count)
>      int i;
>
>      for (i = 0; i < hart_count; i++) {
> -        vals[i] = VIRT_PLIC_HART_CONFIG;

This macro in virt.h should also be removed

> +        vals[i] = "MS";
>      }
>      vals[i] = NULL;
>
> --

Other than that,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

