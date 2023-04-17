Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poGxO-0006j9-Ga
	for mharc-qemu-riscv@gnu.org; Mon, 17 Apr 2023 00:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poGxM-0006ig-3N; Mon, 17 Apr 2023 00:59:12 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poGxJ-0005g4-6s; Mon, 17 Apr 2023 00:59:10 -0400
Received: by mail-ua1-x92b.google.com with SMTP id l13so1225988uan.10;
 Sun, 16 Apr 2023 21:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681707548; x=1684299548;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TZpX3Ffje0O3emKynsM2NJ64372mNmexwyG+vDLGowk=;
 b=ThBh89GHgUF0dRO2ak1ZuVk4mOHF1BE63SaKBhlpi+6sll+Jhz7jTmM/j9lyMebHho
 hkxCv+F+Q50ajjUO7aDIWp7kdIgCB7Eh6sQh5jeujNjyoBOemPEM5OgvtqTr2TETV3sE
 daR/0NuVebCVNWja0HFaYQcwdSP4i71/oZxdpmlEw3oPNNt1TJTlluEAyih89EfWRiCW
 NP22gJGWm3xdRMEGbmLQAfc/6AkHCYF3CS6e6ul5zelqv+MEsmOxiKdNBMl0MZ1mGjo3
 51rgYJTDRxu1mGMEwFY8iW5EZWY7KM7qGzuzgEvf9IqF53Bpdcd0de/2wz2jfDmkIAeC
 EQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681707548; x=1684299548;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TZpX3Ffje0O3emKynsM2NJ64372mNmexwyG+vDLGowk=;
 b=aPjI8S2+Ybakg+hXCkElwb7xPIaC/Jk+q8fyVh7jip1HEjwvKGVBh4LiUt6jQ+n2QD
 qFTLNGjHgH5qJOu2Ule6yCOxvNnXBW9tDLmJ/Bc8pbseLaZXJR4cVC4jlpX/tMz24tWG
 cT3XB6aFu6TzCSWA5TpHSbozjBGp1xZLuBeHCruRgdlNTE3CrtZlflQJ+VqtLE3w79b9
 JhUUQNq0kK2uc5ZbWFFvVE+7jb6hEP8om+Z3lJVZ9nfEW+iIUwOu2iifcj2ioaGUKY5f
 suWXrLOFZqtuNKSfPtdJAuL8cAyVvztmSGfku2/O99m8CfW1e+daZYcAD+BC5/4jtW0Q
 QlbA==
X-Gm-Message-State: AAQBX9d/1OQGNJMaEA0cW85tmTDHSEPhm9MN/sJMkTxwlzViz72PPysV
 AjnezsodrkK4EEGQmrDFbUcE8ZA+Q+DFwWjOn9M=
X-Google-Smtp-Source: AKy350alchqDBM3bsb9Ev/PCuQyCW4mLZExYmejZrTwSM9D4a/aKyLxDd6Ne3c5Nxzi+My/RL9T06ixT85tpqA+8T4U=
X-Received: by 2002:a1f:1652:0:b0:406:6b94:c4fe with SMTP id
 79-20020a1f1652000000b004066b94c4femr7284221vkw.0.1681707547687; Sun, 16 Apr
 2023 21:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230417043054.3125614-1-bmeng@tinylab.org>
In-Reply-To: <20230417043054.3125614-1-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 17 Apr 2023 14:58:41 +1000
Message-ID: <CAKmqyKOh1rJQG8xBjVMJgUdN_xT50C7uPJ9oxohrX+VSATvA1w@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Restore the predicate() NULL check
 behavior
To: Bin Meng <bmeng@tinylab.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Fei Wu <fei2.wu@intel.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 17 Apr 2023 04:59:12 -0000

On Mon, Apr 17, 2023 at 2:32=E2=80=AFPM Bin Meng <bmeng@tinylab.org> wrote:
>
> When reading a non-existent CSR QEMU should raise illegal instruction
> exception, but currently it just exits due to the g_assert() check.
>
> This actually reverts commit 0ee342256af9205e7388efdf193a6d8f1ba1a617.
> Some comments are also added to indicate that predicate() must be
> provided for an implemented CSR.
>
> Reported-by: Fei Wu <fei2.wu@intel.com>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> ---
>
> Changes in v2:
> - rebase on top of Alistair's riscv-to-apply.next tree
>
>  target/riscv/csr.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index f4d2dcfdc8..7000eb3350 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3817,6 +3817,11 @@ static inline RISCVException riscv_csrrw_check(CPU=
RISCVState *env,
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
> +    /* ensure CSR is implemented by checking predicate */
> +    if (!csr_ops[csrno].predicate) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
>      /* privileged spec version check */
>      if (env->priv_ver < csr_min_priv) {
>          return RISCV_EXCP_ILLEGAL_INST;
> @@ -3834,7 +3839,6 @@ static inline RISCVException riscv_csrrw_check(CPUR=
ISCVState *env,
>       * illegal instruction exception should be triggered instead of virt=
ual
>       * instruction exception. Hence this comes after the read / write ch=
eck.
>       */
> -    g_assert(csr_ops[csrno].predicate !=3D NULL);
>      RISCVException ret =3D csr_ops[csrno].predicate(env, csrno);
>      if (ret !=3D RISCV_EXCP_NONE) {
>          return ret;
> @@ -4023,7 +4027,10 @@ static RISCVException write_jvt(CPURISCVState *env=
, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> -/* Control and Status Register function table */
> +/*
> + * Control and Status Register function table
> + * riscv_csr_operations::predicate() must be provided for an implemented=
 CSR
> + */
>  riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>      /* User Floating-Point CSRs */
>      [CSR_FFLAGS]   =3D { "fflags",   fs,     read_fflags,  write_fflags =
},
> --
> 2.25.1
>
>

