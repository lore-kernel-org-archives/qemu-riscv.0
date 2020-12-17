Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpn2t-0001jj-JI
	for mharc-qemu-riscv@gnu.org; Thu, 17 Dec 2020 01:45:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kpn2s-0001iY-FP; Thu, 17 Dec 2020 01:45:50 -0500
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:33404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kpn2q-0007Tl-Eh; Thu, 17 Dec 2020 01:45:50 -0500
Received: by mail-yb1-xb34.google.com with SMTP id o144so24395267ybc.0;
 Wed, 16 Dec 2020 22:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KxrxdKZiWvzFXPa+X89FL19J3HUHf+G9ZrcIqBbyNUs=;
 b=cQ68UWtaSmOBM4EZ8yKzCg1ZtCV+8/iLYan9pWsuL/D+u7YDFIkne2nZ8cYhE2IBsm
 KpTyrFZLKzzJzSD+yN8c2TiooVyMnvUjQ3+xBBVSEq5XUrnolTSj9r8V2M2K8baF2Ygx
 2kX8u5BjmfRdaVv/XQ5mLGg6msH1rxGRvnuPRnZrYqKzcpy21aZZIDLN6sgdsAVcvzl+
 9QlrDIhiWMkwjyvAz/Ww5TDB/olr/LeFGhRM6HDGS7TxXxgo5EgznayRN7vIQnYHmEst
 QXlduXrWauQVnm7ZODf04ZHtrUDBkjHStc3drXwuJxDP6MlAf2SSm8X1VSUqEVAkog5L
 eEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KxrxdKZiWvzFXPa+X89FL19J3HUHf+G9ZrcIqBbyNUs=;
 b=uF5u8Qqh7VCrt5yirxnOLQ+FiXkVSui+VWaFxbYl3rhnu5w/t3rV2srV602AsQGaIb
 lXiuK2jDpGUhO8pUlAs/owB90rDXK6i1AARPpzy605Ablv5v3NcdUoKpbwtm9QJK9CeK
 uNFZUoKy1K0DY+f9+q4UXZHBPDttvq7vo0BOlBoDu812ixYUgkGbzox+qSFK5ehR1WTQ
 FSnDy5FERxzsPiVU5iDj4X7++naCcIi2e/LSbC3CHPvCKhzxY0p5g+5vbuTJGtvmbCN0
 FmbdYeE8iN2O6RBvkN7FKHnZ3H4BCXIa96+uxEuZLPgk1u7y/9rTnb71qJ5j6qduZeiF
 o/qg==
X-Gm-Message-State: AOAM531TUelWySxO9O8+GKtUyJMJICAtZ5C74bg7EhEqkQfZ+FvFsDHy
 PtUfFEhpYGYMjqBjldnMYt6GOvx89QykdQqnPQq9qqljjxs=
X-Google-Smtp-Source: ABdhPJz4amP2r9PLpjIiC46nbuPnRWwphXxyUmvp1/lAUHOW2Uk2ZYhiTzrsd7zpRB2OsAeDHJOfFim2U61db3tqUYo=
X-Received: by 2002:a05:6902:210:: with SMTP id
 j16mr56949287ybs.122.1608187547325; 
 Wed, 16 Dec 2020 22:45:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1608142916.git.alistair.francis@wdc.com>
 <a426ead44db5065a0790066d43e91245683509d7.1608142916.git.alistair.francis@wdc.com>
In-Reply-To: <a426ead44db5065a0790066d43e91245683509d7.1608142916.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 17 Dec 2020 14:45:35 +0800
Message-ID: <CAEUhbmW0Gwq-vAiyEjf50U5JjABFaBTe_MbG=ajCA-UGGWB2Ww@mail.gmail.com>
Subject: Re: [PATCH v4 12/16] target/riscv: cpu: Remove compile time XLEN
 checks
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
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
X-List-Received-Date: Thu, 17 Dec 2020 06:45:50 -0000

On Thu, Dec 17, 2020 at 2:22 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>  target/riscv/cpu.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>

Tested-by: Bin Meng <bin.meng@windriver.com>

