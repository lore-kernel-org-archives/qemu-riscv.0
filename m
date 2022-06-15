Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o1S6z-00040V-Ib
	for mharc-qemu-riscv@gnu.org; Wed, 15 Jun 2022 08:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o1S6v-0003xK-Ex; Wed, 15 Jun 2022 08:27:02 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:44668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o1S6t-0003Yw-ME; Wed, 15 Jun 2022 08:27:01 -0400
Received: by mail-qt1-x832.google.com with SMTP id t21so7988745qtw.11;
 Wed, 15 Jun 2022 05:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YxT8biFW0S18KNKax4nG7181CXXTYItoFTgvxyCFzxw=;
 b=GLcVnI0lfsuxz+wxz6Db1T934gJLS1qz3oMIAuPTdj98Qx0ciL4JppzYb/N2EgZMVe
 YjcD5LAT7Csy8LCun03uFaeBT5+q05ed+yatHJtV4aBnt2b5thRUUe+Qs2e6uRposSrg
 Iw354dc9VCgCfrWCkh1iKyzDROhnnJKKHdBh7C5lPQD0FCxdTAc49KPjHa0EqUO1wSlt
 FO+09X3YWu2/aeU5jSBSfAHmUuBqqhlsC33H2PHVQwf6W55cDjewIAL67RsLM6ZJkZAx
 1DWbBUhNRsHz6b2D4/kmYIo1x8ADO6oduF9cEOXSJ+2iWj/JOqImTfN/yEhn/CJV/iXK
 4F1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YxT8biFW0S18KNKax4nG7181CXXTYItoFTgvxyCFzxw=;
 b=cKm8DD4XGSVpj6okcsMTJCEAvUL+9SC+6QQDtbljbq8zZF9G0uFWV78N5IgBUnh+Hy
 h0CPooLbOX9aKf3FIXQgnGilxphOe5BesOTLKVjpGa6+Yo/zLfWQbNhMt6V+vwgyOuiu
 rI3BxfXygQSCJzSBu6VHuLPzIAybuIuZwbTXGHhOkaCx4YB/HgnqfJdDykVOIlvFRa7C
 MkmOTsGELpU2tLJJ0r6YtaRoDpmiNW4jyOWAlEBl9IiFQL4RDWegG6qP1iDdQ02FOUUE
 Au80VY1IgbretitPtfc48747O7qzpMZ3XqS/XLbYxq6HcGrEj2i4ShSbYvVo8vhuog34
 zNzw==
X-Gm-Message-State: AOAM532dcQG2TRSEjqIAkeQbhnXdNrjPELihU6w1dVB3291N7P6mdtmW
 b261Be59pXP008Mzxz3gIIRoNfmAkCtkGQ1DlF0=
X-Google-Smtp-Source: ABdhPJwrUHSK//aBwCn0eZ5X1CerI14jCmMmXTb+yvNfnGKr4FpS2bjI4KHPlNDLDNlo6s/ZYw9zi7Wi0ctZnJQl/pk=
X-Received: by 2002:a05:622a:156:b0:305:2b8e:8ae5 with SMTP id
 v22-20020a05622a015600b003052b8e8ae5mr8286997qtw.543.1655296016928; Wed, 15
 Jun 2022 05:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220610051328.7078-1-frank.chang@sifive.com>
 <20220610051328.7078-6-frank.chang@sifive.com>
In-Reply-To: <20220610051328.7078-6-frank.chang@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 15 Jun 2022 20:26:45 +0800
Message-ID: <CAEUhbmUKpkqmzuE5YK+wAk5owReBnSgcC6Qw4i9FX1EC8n+gnQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] target/riscv: debug: Introduce tinfo CSR
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x832.google.com
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
X-List-Received-Date: Wed, 15 Jun 2022 12:27:03 -0000

On Fri, Jun 10, 2022 at 1:21 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> tinfo.info:
>   One bit for each possible type enumerated in tdata1.
>   If the bit is set, then that type is supported by the currently
>   selected trigger.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/cpu_bits.h |  1 +
>  target/riscv/csr.c      |  8 ++++++++
>  target/riscv/debug.c    | 10 +++++++---
>  target/riscv/debug.h    |  2 ++
>  4 files changed, 18 insertions(+), 3 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

