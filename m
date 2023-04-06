Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkDix-0003j7-A3
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 20:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDiv-0003if-Fz; Wed, 05 Apr 2023 20:43:33 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkDiu-0001uX-01; Wed, 05 Apr 2023 20:43:33 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id d2so33069093vso.9;
 Wed, 05 Apr 2023 17:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680741810;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rcj4Wv5TgRGpyNK8GHqR7GnOxdAWPpnwfHBx4nl/esk=;
 b=HeXVoRAj7wHnLn8V7FxPP2QjXblG6q96tP0j1hFwX/Rp40tqclU1nxUnZhtw7t5N4g
 Yxa1AIljdBzYzLtmpUf3JPSSTEgwTe7oZkUKQ4kt98hUzH+xHvctklI+yFbU2QeyNbjA
 qxpatbbohKUHLQc/gcsIgchjLL1icc7f3ZaKKiL5xFiR/lPXMMuX0pc5YkZwXC2vfIkl
 JCTY9ogA8T+I3/uDVTg74yv2/eQjbSqo59DMU9NSQsTb7gPbt646pIiykBjqzpo9S2S+
 cTGu6GWyuZ3GVsFyQ7kCXbARJ8WxmJyxdxoR11vYxnRhh9TJ5SmSCDd3GDnlbHIWH3uj
 MP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680741810;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rcj4Wv5TgRGpyNK8GHqR7GnOxdAWPpnwfHBx4nl/esk=;
 b=uZahLudyJ89SHFt2lsDH2wCMVAHyuWK63Bvq6vFuAWYooRtZADlOy12SSe9lFBDmYx
 yILzEEGyEwZl9oT+o8ozBRrHapczO+4Yox7cw+4FTBm7di2ETkmCUN97N+CGfGN7MLCK
 1oP8do1W1qVrL7I/hRwVWpisx80qALuldkGGnD/m5N8vumKrVbnBnMrntTFLsjwq0CSa
 AoSoGXh3lQz0IohdgwFExrqMk8d+bQoWIA8tRIBvSSm2RiflLbyBCR1mu308eMTULY90
 5rYXWBy7ZMxllAADnY+slib2Ti39D5w3HyM/2Ymx0lvsZCgSxLQZy4LfwD+a7ZE/94eB
 koIw==
X-Gm-Message-State: AAQBX9c+EVxUaA/WK4ibkMHuCKHj7cTDi7wQuXYA7cXlZuNlVa5yfuDM
 zPn8sx/77Xt+GF9cLqdTdezIVVoJjfHXmoLRt+9aQBN8iYA=
X-Google-Smtp-Source: AKy350aKMRf39jcRU9GuDTvI8SJY2FRx+puLok1o0FAVWfRkuvJU8Fl6y6iGkazNEscPwfyqsERVs8bvSvDEl7OvlCM=
X-Received: by 2002:a67:c181:0:b0:42a:eb6:6c51 with SMTP id
 h1-20020a67c181000000b0042a0eb66c51mr6259507vsj.3.1680741810608; Wed, 05 Apr
 2023 17:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230330135818.68417-1-liweiwei@iscas.ac.cn>
 <20230330135818.68417-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20230330135818.68417-2-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 10:43:04 +1000
Message-ID: <CAKmqyKMzPwFpScWg2H+JMZpvH6oJAP0A5vgaKAEiXR57db0r4w@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: Fix the mstatus.MPP value after
 executing MRET
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2f.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 00:43:33 -0000

On Thu, Mar 30, 2023 at 11:59=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> w=
rote:
>
> The MPP will be set to the least-privileged supported mode (U if
> U-mode is implemented, else M).

I don't think this is right, the spec in section 8.6.4 says this:

"MRET then in mstatus/mstatush sets MPV=3D0, MPP=3D0,
MIE=3DMPIE, and MPIE=3D1"

So it should just always be 0 (PRV_U is 0)

Alistair

>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/op_helper.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 84ee018f7d..991f06d98d 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -339,7 +339,8 @@ target_ulong helper_mret(CPURISCVState *env)
>      mstatus =3D set_field(mstatus, MSTATUS_MIE,
>                          get_field(mstatus, MSTATUS_MPIE));
>      mstatus =3D set_field(mstatus, MSTATUS_MPIE, 1);
> -    mstatus =3D set_field(mstatus, MSTATUS_MPP, PRV_U);
> +    mstatus =3D set_field(mstatus, MSTATUS_MPP,
> +                        riscv_has_ext(env, RVU) ? PRV_U : PRV_M);
>      mstatus =3D set_field(mstatus, MSTATUS_MPV, 0);
>      if ((env->priv_ver >=3D PRIV_VERSION_1_12_0) && (prev_priv !=3D PRV_=
M)) {
>          mstatus =3D set_field(mstatus, MSTATUS_MPRV, 0);
> --
> 2.25.1
>
>

