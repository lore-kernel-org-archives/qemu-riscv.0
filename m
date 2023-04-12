Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmPZd-0007VL-3g
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 21:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pmPZb-0007V7-Mp; Tue, 11 Apr 2023 21:46:59 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pmPZZ-0007EK-Q2; Tue, 11 Apr 2023 21:46:59 -0400
Received: by mail-ej1-x630.google.com with SMTP id sh8so24953469ejc.10;
 Tue, 11 Apr 2023 18:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681264015; x=1683856015;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OGJJqubXK4JMfDejrqpPgz7GplbuDVZ9lE1DA0NFDSM=;
 b=Z5eMEuEfQ0vDqDkFGqUjYQ2Zt8yBJjl+RmhtbX83kREMhoHKeqEIHZk8nHE9i6gMs+
 ipgiTmg6JKW6nspQv78sHDYXPevNDQlL41RBzIDQayG2MBXiHV3f2XRspgzQ4KuBtzd+
 zWaUxR3khKX9N/3nrcb6wJv4OpmkoW4WPtXAH8fZVPT7n31MYi7zrL1iixyJ90urC314
 Tv96stCOqUudTU1bayR3kCDewV+iPeOXAG/jBgopO8vQBX2XCaOTkLEipWaAkuqW2mLY
 muH3tKBhyg3lrz8wNsFAAKirXaR6kCgx2ClAxo5+c6DZ6jPA21cU270fY2yoA8v0WVBN
 NmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681264015; x=1683856015;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OGJJqubXK4JMfDejrqpPgz7GplbuDVZ9lE1DA0NFDSM=;
 b=qLTRY3oivDHzpFBfJr//yjeSM2rPkMFm/9/enxRcAenoW2JMOXNYz1kdkar5rONXew
 ySflb/PIZCqs46ftrRgqcSTqusQELOtSQzJps7JXbkh4DAm0wxH2m/nZJWBqI/V33bLd
 /5CEmj13Gup3Z3kXyDEKPu3j+iq6XMFKIja48vPhUDai198/P0NaT07Mq5cI2hueJeQJ
 heaP1KrQu4kCdZVkfu9go4IqdqaM/R9q+zM5ZF80BBnruTUd/aQF65/EJZHITXz47DpB
 amrZg2pR4fEBZlflaRIL456hCZSUV0Y/oDyVMTbzWJXDiAIovry5d0N87Jn3k7ozbCUH
 EFtg==
X-Gm-Message-State: AAQBX9ey7dp7rRuoMksyX7pKsLhEj4yy7kTQKByAxaGxVV0hnrN4ra1d
 tjLlPN7x1QwxEbDSIVR2ymk5pxQum6mNqo3E8tg=
X-Google-Smtp-Source: AKy350b7U5uhmldaKNVh8XTLjvbcn6swsFkuDcAUiCkxguTsnNiwqd1d2cfiQsN4m5IvnSk8/PQOH47Sm6nUZGzEs6U=
X-Received: by 2002:a17:907:a583:b0:8b2:d30:e728 with SMTP id
 vs3-20020a170907a58300b008b20d30e728mr272041ejc.1.1681264015049; Tue, 11 Apr
 2023 18:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230411090211.3039186-1-bmeng@tinylab.org>
In-Reply-To: <20230411090211.3039186-1-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 12 Apr 2023 11:46:27 +1000
Message-ID: <CAKmqyKMH6pbRuvyfg0B0meG9tOXrpL+BaJPYuEudEej4JAftHg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Restore the predicate() NULL check behavior
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Fei Wu <fei2.wu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x630.google.com
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
X-List-Received-Date: Wed, 12 Apr 2023 01:47:00 -0000

On Tue, Apr 11, 2023 at 7:03=E2=80=AFPM Bin Meng <bmeng@tinylab.org> wrote:
>
> When reading a non-existent CSR QEMU should raise illegal instruction
> exception, but currently it just exits due to the g_assert() check.
>
> This actually reverts commit 0ee342256af9205e7388efdf193a6d8f1ba1a617,
> Some comments are also added to indicate that predicate() must be
> provided for an implemented CSR.

Thanks!

Do you mind sending a v2 rebased on
https://github.com/alistair23/qemu/tree/riscv-to-apply.next

Alistair

>
> Reported-by: Fei Wu <fei2.wu@intel.com>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
>
>  target/riscv/csr.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d522efc0b6..736ab64275 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3797,6 +3797,11 @@ static inline RISCVException riscv_csrrw_check(CPU=
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
> @@ -3814,7 +3819,6 @@ static inline RISCVException riscv_csrrw_check(CPUR=
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
> @@ -3991,7 +3995,10 @@ RISCVException riscv_csrrw_debug(CPURISCVState *en=
v, int csrno,
>      return ret;
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

