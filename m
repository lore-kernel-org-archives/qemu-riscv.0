Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nPdva-0007fR-6u
	for mharc-qemu-riscv@gnu.org; Thu, 03 Mar 2022 00:23:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nPdvY-0007eD-6M; Thu, 03 Mar 2022 00:23:00 -0500
Received: from [2607:f8b0:4864:20::d36] (port=33672
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nPdvW-0003g9-JJ; Thu, 03 Mar 2022 00:22:59 -0500
Received: by mail-io1-xd36.google.com with SMTP id 195so4601461iou.0;
 Wed, 02 Mar 2022 21:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+riVFaf6LxZCR8BkKBir96/1L2nEGuKZsTz/gMm97EM=;
 b=qf1attyeuJbQW3sOap26B7Wc2W4LoTHiMI0sC3zuRB+8yBKNIz9xFH8H7vr46qiAhS
 ZgzJoQp29JUDF3ROTWaFTO2OdLCH9svZDqeZffCtNHnyMKXMQ+Ii3pcDdf4RDktK5nbj
 h9IwDQKvrfOy+qacRx0EFsFlKzQt8+9XkUfNdhHw9XwZqhSOzDHCUltPKtcUBOuyjj9I
 AVVc6d9vMBlMoDn+EaDcDc60tcku64dJxg5oeXQ8re1OmDgc9vYa0MysJnIME2jmw5Q+
 wRRpV9PicYmvEbM0gEQdRnlHBszuQsU1UdL2Uk7aLWj7e2atE3Fpvu4iL9w5YGwbLXi6
 tzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+riVFaf6LxZCR8BkKBir96/1L2nEGuKZsTz/gMm97EM=;
 b=EQ94TNefXw5ot6mG3l5jJ4zZ/sX95dCOQ2B8fu6wfWmQL78UhtbMe/nmQ6LEjTtpq+
 Q075DvbCdfRn+D8hn7ZUUR1Mpl6OYDn8wNRQNltzY+GL0u8OCjDLBYmOlHUda2Q7lMRJ
 SAj9cD8nYsxKiAW+QncCVB9ZylGkcxrmlmcxkTu2Gm7CtXvP5pVyLOghQMa5YJVUBAjB
 LPKbpV05KabyiAuBEy5uTLcdqx6tzAGMSC66WRt7dtH8WxhgysnVuLZgpqsXAyb501pn
 xH0MNJ7GXYsuxDXHhn5vbscrhUjyo5rssp/23sH0S0iLnSa4Q5wniF+PINX9yyv0YRYW
 KV5Q==
X-Gm-Message-State: AOAM5308dsK0fJuGuutm/5cx4W4dunXMjopNY4efnqhG0lPWlSQJc2dZ
 JAsaAG42MRRejT71dL9jPUBnT4plEvTLDXnSop4=
X-Google-Smtp-Source: ABdhPJyHpGE9G8VlmWUmfg3KFpksMO7XVYLlqoVDhAWPpxMYv2ZCjukc50iTqXZbpqRf6b4jGW7W59Jv655a5YdtBdg=
X-Received: by 2002:a05:6638:25b:b0:314:21b0:fb61 with SMTP id
 w27-20020a056638025b00b0031421b0fb61mr28080359jaq.66.1646284976936; Wed, 02
 Mar 2022 21:22:56 -0800 (PST)
MIME-Version: 1.0
References: <20220219002518.1936806-1-atishp@rivosinc.com>
 <20220219002518.1936806-2-atishp@rivosinc.com>
In-Reply-To: <20220219002518.1936806-2-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 3 Mar 2022 15:22:26 +1000
Message-ID: <CAKmqyKNEy=Kwg3DXmF0C8f+rYGkf0dw2HKLftgf2ejRFROg6nA@mail.gmail.com>
Subject: Re: [PATCH v5 01/12] target/riscv: Fix PMU CSR predicate function
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 03 Mar 2022 05:23:00 -0000

On Sat, Feb 19, 2022 at 10:34 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> From: Atish Patra <atish.patra@wdc.com>
>
> The predicate function calculates the counter index incorrectly for
> hpmcounterx. Fix the counter index to reflect correct CSR number.
>
> Fixes: e39a8320b088 ("target/riscv: Support the Virtual Instruction fault=
")
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  target/riscv/csr.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index b16881615997..3799ee850087 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -94,8 +94,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno=
)
>              }
>              break;
>          case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> -            if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER=
3)) &&
> -                get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3=
))) {
> +            ctr_index =3D csrno - CSR_CYCLE;
> +            if (!get_field(env->hcounteren, 1 << ctr_index) &&
> +                 get_field(env->mcounteren, 1 << ctr_index)) {

This fails to build:

../target/riscv/csr.c: In function =E2=80=98ctr=E2=80=99:
../target/riscv/csr.c:99:13: error: =E2=80=98ctr_index=E2=80=99 undeclared =
(first use
in this function); did you mean =E2=80=98tlb_index=E2=80=99?
  99 |             ctr_index =3D csrno - CSR_CYCLE;
     |             ^~~~~~~~~
     |             tlb_index

Alistair

>                  return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>              }
>              break;
> @@ -121,8 +122,9 @@ static RISCVException ctr(CPURISCVState *env, int csr=
no)
>                  }
>                  break;
>              case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> -                if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOU=
NTER3H)) &&
> -                    get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUN=
TER3H))) {
> +                ctr_index =3D csrno - CSR_CYCLEH;
> +                if (!get_field(env->hcounteren, 1 << ctr_index) &&
> +                     get_field(env->mcounteren, 1 << ctr_index)) {
>                      return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>                  }
>                  break;
> --
> 2.30.2
>
>

