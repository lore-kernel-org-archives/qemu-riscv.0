Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mzZGj-0003Pa-Sy
	for mharc-qemu-riscv@gnu.org; Tue, 21 Dec 2021 02:09:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mzZGh-0003NZ-0C; Tue, 21 Dec 2021 02:09:03 -0500
Received: from [2607:f8b0:4864:20::b30] (port=43876
 helo=mail-yb1-xb30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mzZGf-0002bR-KS; Tue, 21 Dec 2021 02:09:02 -0500
Received: by mail-yb1-xb30.google.com with SMTP id f9so36031862ybq.10;
 Mon, 20 Dec 2021 23:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=++IpgJwM/TD3IEvcymnm1RYQZaDFEIGKt4rPR8rbZc0=;
 b=VAXL0jFUQr5kcXSHHNcQbbNRsKI+O1pRW7HMKyWbA9ZppB6F3PzpgehfW1Mu1SA1HS
 OoUULFbHGAwpxzfyeq70HXGR6IoWTt0zNICALXNvlcWBCnjogRIY6COi4T7VkIZT33LJ
 o+jN5XTg1fledLfFab5Rny1jlw6wM5U6dEph1uj83m4P2H1ae/BzpV2C207cHAwrNwzn
 fYrHlpPIYoLBvFBmODasZwvHCJyPbirB4vf1A5Wi/eCxeoPFbPAkYjEjIc4xQ6ywoJp5
 EU4tw2gOOAREpKZiHtaLQYRQn+P2gxwzYNsNqwez2JhcyH+pGiN1HuF2qrbQ4aDwatDR
 vKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=++IpgJwM/TD3IEvcymnm1RYQZaDFEIGKt4rPR8rbZc0=;
 b=0x0/9vIV2b5Z7IY3UmTLlhcgeR2+ELUNpn1H/CNwBBjQHxmrBBYSZlNjsQfk71H7+/
 VZyUYdR7LX68W7MlHJLMmFUO3V3cpnUKzJaOPvIuapJYeIC0EN1m/Pb5VQEyKT0sU+gD
 N0aRMYq9f/ltf3PqZGGGnQOXmucmQktwZdlqMJ522iRxRYOUpnny0WGNcfX2Kg51j0x/
 NuHpLsijBFMcFP4jK2r8TcMp/P/eMF5hlui9yVLn1jFoX5ym9PuYN1Z8HK+X3QG73ILF
 f2/369Ee5LcHlSzNsY8gPARouFxkuLmpl73/ig/7+WXT3jFv3UQUnqN1XtZGbkcYQeWv
 AeCA==
X-Gm-Message-State: AOAM532PdDRMjBtsbA+gwqLTDPVP/8650piJSWftx8aJzYJTxoJWPqzw
 /9pINtQNAtJ8CYcKOY1CRk5vpzCvr6k14Odx/E8=
X-Google-Smtp-Source: ABdhPJwNNdfijLl+LhVf6UG6VMBBtW09zd+CceDhmXa9FPoHxHUF2DGz6GX+mnACs6+dBmvy5lZNks1ibeNm4BBjA08=
X-Received: by 2002:a25:324d:: with SMTP id y74mr2688440yby.526.1640070538961; 
 Mon, 20 Dec 2021 23:08:58 -0800 (PST)
MIME-Version: 1.0
References: <20211220064916.107241-1-alistair.francis@opensource.wdc.com>
 <20211220064916.107241-2-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211220064916.107241-2-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 21 Dec 2021 15:08:48 +0800
Message-ID: <CAEUhbmVodQQROoxDCYdTqoYWnx7P0T-DZfPgVfeN_qZq7UdWOg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] target/riscv: Set the opcode in DisasContext
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 21 Dec 2021 07:09:03 -0000

On Mon, Dec 20, 2021 at 2:49 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/translate.c | 2 ++
>  1 file changed, 2 insertions(+)
>

I remember I once reviewed the whole series. Not sure what changed in
the versions

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

