Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mN7Cd-0002Nf-QB
	for mharc-qemu-riscv@gnu.org; Mon, 06 Sep 2021 01:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mN7Cb-0002Mf-PI; Mon, 06 Sep 2021 01:29:53 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:34625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mN7CZ-0006wl-FH; Mon, 06 Sep 2021 01:29:52 -0400
Received: by mail-io1-xd2e.google.com with SMTP id y18so7251820ioc.1;
 Sun, 05 Sep 2021 22:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SFGtSu5Kb1jP766/zwxI4TPZNufOd9h5gJOteHMK0Kw=;
 b=Zob8+fb0OZCMyJbzAXyvDfrZMUEoS4tVeyurGHsAcNDP5BpzJL0KZYGR66qf6yM6dr
 OmKar2q8jsH2wkQSggGPKd03IstkKfO42Ly3GdK6h25Cr3IiaG/S3btI2BWTj2Wm9Njt
 5uzYWqvqqgd5Q3NgSG4ppOsjd3RxyCrOlF6KImJin6R7abJIJvBllVvBlbOZNyWW2dew
 eGK498K57dHMiud2zO1Rh37pZZmlBJxJqUwuPvU4Sid9hVhkyBvnP3xQIbHTAhfi0nyw
 WKIoYNCj93TrgEVZqY6AzyXO8SJp6GikSxhaSD1QRmiXKUFNjsmVzF6eDCLFZ7lBe67/
 kT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SFGtSu5Kb1jP766/zwxI4TPZNufOd9h5gJOteHMK0Kw=;
 b=AAAZYk7tgt3dt21bR1lpJcgVzxoxOgPVwEEr3LkdIO6ui06h02hA9dU1jLNHwwP/nJ
 G5NNgNs4J7AMmqIZpYHmnhy3FYxqj90jvNJ9aR8v6RiKlF9c9vxuH9lcjLaAhNgJJMZe
 fGq24fVUYyfQrr3nHH2AmYOdAwZv1RcyfovNhQLblTSVE8EBebPgPGMouoOuLZxlXBxF
 kJkSmC/KWg7PDFR4iCxJOeBzrpTIF0c4zqw0wYX2FEh/YU+YFtxWZWPLxnmkkF3quwaW
 t5iIMzu2KUQZHBKORIPNiT6+NUplDv5GIGQEsn3yTnrfPmbfQ2dXmwlse7nduQkm7Riq
 5Vnw==
X-Gm-Message-State: AOAM530CHJKrUwurctEBsfga5nZl717h1FqWeSh/bifogB3xpCCHN6qM
 qsf7YkdFcudaV8CkVJGDHXGFsbluprrg7LVXGzM=
X-Google-Smtp-Source: ABdhPJzC1ObVLmH2Vn01yl1aiuRevwhEuwSeFJcv2CaxJClXBUUsdlp6vX/kmsJiXlxccMSjHPQhzk0TftM5yWvT7KU=
X-Received: by 2002:a6b:ce17:: with SMTP id p23mr8415665iob.90.1630906189418; 
 Sun, 05 Sep 2021 22:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210901124539.222868-1-zhiwei_liu@c-sky.com>
In-Reply-To: <20210901124539.222868-1-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Sep 2021 15:29:23 +1000
Message-ID: <CAKmqyKOyosTvRKvzMieqiqa46YNyJNFPRcRZprqBtmu1OFZRNg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix satp write
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
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
X-List-Received-Date: Mon, 06 Sep 2021 05:29:54 -0000

On Wed, Sep 1, 2021 at 10:51 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> These variables should be target_ulong. If truncated to int,
> the bool conditions they indicate will be wrong.
>
> As satp is very important for Linux, this bug almost fails every boot.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/csr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 50a2c3a3b4..ba9818f6a5 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -986,7 +986,7 @@ static RISCVException read_satp(CPURISCVState *env, int csrno,
>  static RISCVException write_satp(CPURISCVState *env, int csrno,
>                                   target_ulong val)
>  {
> -    int vm, mask, asid;
> +    target_ulong vm, mask, asid;
>
>      if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
>          return RISCV_EXCP_NONE;
> --
> 2.25.1
>
>

