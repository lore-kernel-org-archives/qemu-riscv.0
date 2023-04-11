Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm5f6-0000u8-NV
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 00:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm5en-0000oo-Uu; Tue, 11 Apr 2023 00:31:05 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm5em-0003mO-GG; Tue, 11 Apr 2023 00:31:01 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id y13so6474196vss.0;
 Mon, 10 Apr 2023 21:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681187459; x=1683779459;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y7ixhnU2SxW3xA/TsGsbMfQKcZ1if6TpXs2+GtALwmg=;
 b=W41A+UtGJFz8JdFLpJgaCSK64iUl+9WXHUM4xWRoxs7qKEK9TMchCKLtbcNCJbtOTZ
 apHOdzEeHsb0W6OjOkrtYk4cp95+LMCLOq5/vZjNTAwIqQEeqf7O8TFuZ/OuC7EpNxqJ
 MwubNOmpfeiws1+uWH8ak6lQxuB6WUYyJb5VeVZQDfCo59sme9RAPzs6vHb0kC5icdFr
 OnNEHQMNlzIXJA0+hC4BYl+6Qb2FkTeQqgJZtW73yYx66qc7SfbkzO8ram6X0bfi4b/7
 oBX1vHnmhc1rLibox0U6+1LGXQ4DBljtYWKkmintlOzn5dyciz5+4w6pBMEpgKz3pvha
 JFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681187459; x=1683779459;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y7ixhnU2SxW3xA/TsGsbMfQKcZ1if6TpXs2+GtALwmg=;
 b=4zUVUOH3MzDFBPugxsciR1R5Wb+bKTnZ31s8HhpQw2MYfdX6pfBp1r9R10g6WNUcZg
 WFZ5c2UdU8bapk5CqUEkx7YqzfWOJ6y/qCk5qQ7Kchjsf7WgzmyyOevcqg0UqWX91NUu
 ACBFfEu9RSuf6+iUF4ovsFLWrwYmYUsMn+J3m20je4pBFUXhoTFb6sMPShABpvYn+Inr
 RMlkkNFgWUEmRo/emTTKZ4K19vV8HmaPBKaF8Ku2Mq7csig4FJQNJJGs3iW7EBXjbLWL
 CC2AUNqaBksmRk5wC6xKas+YQhMp1w09j0UhGvNxGtzZs3AcMNDjC95S1Eve4+w6P0lk
 sylA==
X-Gm-Message-State: AAQBX9fxLt5/SmZ3kw3ycwwy0wPkpyKDX7o/M2XEITqd42zNUBh5E4bP
 iLBsPJrbIv34WZffGwMCrixz3sJCyNbfCiP4/Us=
X-Google-Smtp-Source: AKy350ZxenACUB7d7gxkLHNJr0x6o0lg+dwP5gIBtMVyW//rWJgwsYV2+TEn3tvrmLq7KXbFwbiCtGtzZBL6TgSebu4=
X-Received: by 2002:a67:c81c:0:b0:42c:33ab:97fd with SMTP id
 u28-20020a67c81c000000b0042c33ab97fdmr6340905vsk.3.1681187459056; Mon, 10 Apr
 2023 21:30:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-22-richard.henderson@linaro.org>
In-Reply-To: <20230325105429.1142530-22-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 14:30:33 +1000
Message-ID: <CAKmqyKPBjdki8yv2US_kRu6iA3vuymbSuFYBxcL74dcoN0HZqQ@mail.gmail.com>
Subject: Re: [PATCH v6 21/25] target/riscv: Suppress pte update with is_debug
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2d.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 04:31:17 -0000

On Sat, Mar 25, 2023 at 10:56=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The debugger should not modify PTE_A or PTE_D.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index ce12dcec1d..b26840e46c 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1015,7 +1015,7 @@ restart:
>                  (access_type =3D=3D MMU_DATA_STORE ? PTE_D : 0);
>
>      /* Page table updates need to be atomic with MTTCG enabled */
> -    if (updated_pte !=3D pte) {
> +    if (updated_pte !=3D pte && !is_debug) {
>          if (!hade) {
>              return TRANSLATE_FAIL;
>          }
> --
> 2.34.1
>
>

