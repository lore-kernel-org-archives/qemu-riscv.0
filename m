Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDgby-00039n-Op
	for mharc-qemu-riscv@gnu.org; Thu, 26 Sep 2019 23:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44953)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1iDgbw-000379-5H
 for qemu-riscv@nongnu.org; Thu, 26 Sep 2019 23:08:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1iDgbv-0000Jn-7g
 for qemu-riscv@nongnu.org; Thu, 26 Sep 2019 23:08:00 -0400
Received: from mail-yw1-xc44.google.com ([2607:f8b0:4864:20::c44]:34882)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1iDgbr-0008UA-J2; Thu, 26 Sep 2019 23:07:55 -0400
Received: by mail-yw1-xc44.google.com with SMTP id r134so439536ywg.2;
 Thu, 26 Sep 2019 20:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dyDqNicl+hOrodnzrnGxHEcsAgwiT78LI8JKTVT6VEU=;
 b=Ic3LoULbN7hWLB2Artj3ZBlwxCTTA4qZmtroAouusp0GxkVgJHd4FVFMtq+bmZ8Q0x
 X46la27R2WhzndK/cl6/WOVqe5hLQEM1AlhALm6iRR20d4W42QuCE2DpyqaVk2+pCBXl
 XnAy7Qz3aZs7Y1zu1yVl3nHZ0WEqL3Te6wWepa2VzgrmiCiEfXOnGCRA6xgLRR03Wszn
 OSjD7o38YH9FTG/wtSRv9Zov2G9m2cM85YFx9r6T/lkcWZyULxZ6b8fklSapOYvWCuWg
 /iO/Q5udE1lkHgcOobz0V2hDtnUiHsYox3ICdXy/XZ8NDz5m0NNclm12gPdGR393gzFw
 3Ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dyDqNicl+hOrodnzrnGxHEcsAgwiT78LI8JKTVT6VEU=;
 b=Lp+Q+Qh3VLc+GHvQbDL0oP1IoMO091HDrLLjDFb1EbfllkAxczRD6qeutxZvFqeDTZ
 yfPkUkoTxPcN3+xR5a612FBfXSe3bgYenW1B9oGEMMict+xHi+PdIvsGdwG48iS9Lv0c
 D920Yj1LOqN+3654d9QNPsla2d14+dYVYYnakbEKl7VJ/BHWC2VdUaEE0VA8ynPoTbaY
 o3VVbikQSEVILITNSbstfn/cwIoL4lvEZ2GDW1Pp2eNJBhevM7gXthTFhDe3/2kUJ1ib
 aQvTwaRZfcY3JjzTAH3YA49Z9f5QZbq13isZJ8vdx01+0hYxMZgwGJMRRMKNINp0kQ5T
 dwng==
X-Gm-Message-State: APjAAAWirOeZOFKUmcL8pESwa1plPCstYXd0X9FAuxoYUZJAABZzQuoZ
 KNNpwyNNNKb2ivgOIPrDgsM1fE+eqVs+U9DgY5k=
X-Google-Smtp-Source: APXvYqxnHCjVclPRUNW/F3DVt/3N1/6+tPwVep8I7YWaIT2R3cjbmCfrxBEWK8enW/7XA1bTFagvJMwodyObseKMETM=
X-Received: by 2002:a81:310f:: with SMTP id x15mr1191666ywx.257.1569553673596; 
 Thu, 26 Sep 2019 20:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <ab8f108eceb973aaee565bb1fe347fcf8c788f5b.1569545120.git.alistair.francis@wdc.com>
In-Reply-To: <ab8f108eceb973aaee565bb1fe347fcf8c788f5b.1569545120.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 27 Sep 2019 11:07:42 +0800
Message-ID: <CAEUhbmXpP1SoYpDoz6kq9x8B8p8jGAYTwfarGAHpv1mqG0OK9A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] target/riscv: Print CPU and privledge in disas
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c44
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
X-List-Received-Date: Fri, 27 Sep 2019 03:08:01 -0000

On Fri, Sep 27, 2019 at 8:55 AM Alistair Francis
<alistair.francis@wdc.com> wrote:

typo "privledge" in the commit title

>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/translate.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index adeddb85f6..537af0003e 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -810,7 +810,14 @@ static void riscv_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>
>  static void riscv_tr_disas_log(const DisasContextBase *dcbase, CPUState *cpu)
>  {
> +#ifndef CONFIG_USER_ONLY
> +    RISCVCPU *rvcpu = RISCV_CPU(cpu);
> +    CPURISCVState *env = &rvcpu->env;
> +#endif
>      qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
> +#ifndef CONFIG_USER_ONLY
> +    qemu_log("CPU: %d; priv: "TARGET_FMT_ld"\n", cpu->cpu_index, env->priv);

Since this patch wants to be helpful for debugging, would it make more
sense to print out the priv mode string instead of the number, eg:
priv: M.

But I am fine with just printing out the number.

> +#endif
>      log_target_disas(cpu, dcbase->pc_first, dcbase->tb->size);
>  }

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

