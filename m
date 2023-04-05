Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjuur-0001NW-Ox
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 00:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjuuq-0001NG-JZ; Wed, 05 Apr 2023 00:38:36 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjuuo-0007vf-OI; Wed, 05 Apr 2023 00:38:35 -0400
Received: by mail-ua1-x930.google.com with SMTP id e12so24785918uaa.3;
 Tue, 04 Apr 2023 21:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680669513;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BGdjJR274ZtZucAZfTN8kEHEJZA1OdJr26lDoFGUyb4=;
 b=a7tPctaEYlHFaP1VfttqyEH7Gs8Z3oACrMM/1rNDzzk/KrcezIB3mfmJ+92OpsHdyj
 J3+XlSXfOwIe+f3JzyE5XxPFlq9XcVJ1f7hPvH7RyhjEj6XGttkekY+8WNVpwqLq3Umy
 nbIuzldsxPtTlTugfLIyZvr9p/yNPcxLlD5pHYI1145kL5vj3UsFRaRPSULiuwMNGhBU
 uzlv1CivbU9+Chob8lz9nTmjKJzie9brECF9bKE44Hl6x9EnuArjjMOrdqZmbXOwj3Ds
 CWsnAh6ALo1WsRiic8j7WCuQrWVhZ7PYg4jvHT99tEmD4bQo1WNpkc9NLlU+T0xHTmRj
 qWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680669513;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BGdjJR274ZtZucAZfTN8kEHEJZA1OdJr26lDoFGUyb4=;
 b=UssiIj4sCd9uIs9PnWmfAxz9m3EpOxjqQlCNn1XCzLXb4hCFYDUEwhYyAKxkohKkNA
 snybknkpk2Kpzka4NIHA8lYHnsAXrMjK5dv8Kw6tuEdBpmxa3gJDvgyE8i8V4UHaCRuZ
 r6BQazE/bWCMeatlvP9okw4yiGd4cvSbJtKiwIC6cRwc/8DCABsqLScOnS7OOyyxoCEu
 6neRQpRZnYqjyLkN8FJxInhlKNv4T1jDhYH4SHEasMm+Pk8HIyuA38MOS0fp8uQUUhnV
 rXSQ6WCT9/XlPINDZI8yembwwQXNIxaU7Gjhx7ycpdgmzZfDvJ8+aezR4685qaTbIrIn
 5wdA==
X-Gm-Message-State: AAQBX9f73uO9w5stOay5rJiMEzk/xBRsR2ji1Lbu9VwsU9GKO3MBgsRb
 KR1tRy+oF6iRlzRaKfFdpFO2IpT+15oWB79+zxo=
X-Google-Smtp-Source: AKy350a57O2OkOQg1meO7O532px5SeJxjKlr1HYeX8NE1EKYsuZx0ZlvuIlyrrOzewlwgFv05Il32JmfYUDuJ7Kq1AM=
X-Received: by 2002:a1f:214e:0:b0:43c:6ef1:84d3 with SMTP id
 h75-20020a1f214e000000b0043c6ef184d3mr3826518vkh.0.1680669513376; Tue, 04 Apr
 2023 21:38:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230404020653.18911-1-liweiwei@iscas.ac.cn>
 <20230404020653.18911-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20230404020653.18911-2-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 14:38:07 +1000
Message-ID: <CAKmqyKPj0iV6tBErQ-xau-+HsqE00_y5Qx2wUcHOg2NEdTY8zQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/6] target/riscv: Fix pointer mask transformation for
 vector address
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x930.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 04:38:36 -0000

On Tue, Apr 4, 2023 at 12:09=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> actual_address =3D (requested_address & ~mpmmask) | mpmbase.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/vector_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 2423affe37..a58d82af8c 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -172,7 +172,7 @@ static inline uint32_t vext_get_total_elems(CPURISCVS=
tate *env, uint32_t desc,
>
>  static inline target_ulong adjust_addr(CPURISCVState *env, target_ulong =
addr)
>  {
> -    return (addr & env->cur_pmmask) | env->cur_pmbase;
> +    return (addr & ~env->cur_pmmask) | env->cur_pmbase;
>  }
>
>  /*
> --
> 2.25.1
>
>

