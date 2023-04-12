Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmP5s-0002KV-O9
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 21:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pmP5p-0002Jw-6l; Tue, 11 Apr 2023 21:16:14 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pmP5l-0000Rc-6y; Tue, 11 Apr 2023 21:16:12 -0400
Received: by mail-ua1-x936.google.com with SMTP id l23so332139uai.8;
 Tue, 11 Apr 2023 18:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681262158; x=1683854158;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VsTBhHg9YNTAtosOibM9Y0g6R8ZKQtr+H+wjyDmYaTw=;
 b=NVizfXW6q8ksnxkSC1gT6rk/i/PrwQinIuaZRdmniYlrQBexLWDqucDtPwWSYKbqEL
 EDQnuCKIz3pDPdgNSuWf7n8XKWyghJC/JN6OWgecM3Napw+CMvyj9qFrMgomdqlfV3wL
 g1gK3LupSJqEL+qniXQ2n0eYBfbSAfBWqCNl1yncrr66HtExE18BZbUO0cJw5TxP1REg
 ukEXbzcE4pesw7GL09Pqdf6Y5UEI7rmt3NI0XSfpKls064m8pzpakrw0GfdfQxJov2Ii
 HDGTMxiqxbUCX/V19QPQ9aq1j7El0LtSykt3BfW3koQtdRieuVqBAuTp9NS4SCHWVrqf
 TA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681262158; x=1683854158;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VsTBhHg9YNTAtosOibM9Y0g6R8ZKQtr+H+wjyDmYaTw=;
 b=Ln2oXMp/2dVNKuVC76kQ7UAuCzfGO87JtrNk0VVOdbMoIsvwC8gMPeseUuHy+k4Bft
 62I502ap3EY4l5huFUrnGHghRpntONjCvnbmu2ueLL9XuDmtV0Cr5lf1Ozd7gbFfChXb
 Icc9pP3SzbRiSJYOc2i7zJYRG1pVfaNtcjMduV2EfeqNL5Y8UcYrLtznxi+SRdu4v50Z
 x92s0048bN1jw6fPT5/trR5pRxxcX08EkdjE1ll18bKbiLC9FLvmek1tbDWgtXZ9EJ2s
 o+e2OuWcu9O9/oNbuyidoKfOrKw8OjiCGTky7wM+IHErNzb5lB7c2EAbszmDw6t3xGUW
 tOtw==
X-Gm-Message-State: AAQBX9fxjj2C6Ny4+YlzTOhv+s1HUGTlR0a6hUwjnVxaWngIFjoxd5TL
 qk0ClXTPSUPBFTq652xbn8ReJswCXWVTYMykqR1zGaGibmgWJQ==
X-Google-Smtp-Source: AKy350ZasLEV/9Ta4I/NG+W9ReFFxbmWFwjqHgUn/8MFa26GJhXQfljvCzyAubW6L21SH1WYppE3EzfHOYdMY5Ig848=
X-Received: by 2002:ab0:600d:0:b0:771:d550:cfa0 with SMTP id
 j13-20020ab0600d000000b00771d550cfa0mr816715ual.0.1681262158066; Tue, 11 Apr
 2023 18:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230411090211.3039186-1-bmeng@tinylab.org>
In-Reply-To: <20230411090211.3039186-1-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 12 Apr 2023 11:15:31 +1000
Message-ID: <CAKmqyKNytXW3nq4y4sDNubwTtAVafkdgxE1vanNCzjiP_bhYVQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Restore the predicate() NULL check behavior
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Fei Wu <fei2.wu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x936.google.com
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
X-List-Received-Date: Wed, 12 Apr 2023 01:16:14 -0000

On Tue, Apr 11, 2023 at 7:03=E2=80=AFPM Bin Meng <bmeng@tinylab.org> wrote:
>
> When reading a non-existent CSR QEMU should raise illegal instruction
> exception, but currently it just exits due to the g_assert() check.
>
> This actually reverts commit 0ee342256af9205e7388efdf193a6d8f1ba1a617,
> Some comments are also added to indicate that predicate() must be
> provided for an implemented CSR.
>
> Reported-by: Fei Wu <fei2.wu@intel.com>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

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

