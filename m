Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjuvf-0001ZJ-0N
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 00:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjuvb-0001Xz-SZ; Wed, 05 Apr 2023 00:39:24 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjuvZ-0007yt-Bw; Wed, 05 Apr 2023 00:39:23 -0400
Received: by mail-vs1-xe35.google.com with SMTP id c1so30402250vsk.2;
 Tue, 04 Apr 2023 21:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680669560;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dNJA2MovsmRGrhKkNNk4VSAJ1KGjz7kzrFn3co+MBNQ=;
 b=Z4OB+xDRCPtO8LeYNXfp1VkAM7Nb4ayFiXr8rbMwyDI1x/0JoC6ADbLOOyf0XoU5/F
 deN+GFuIif7cHmu0djl5+ESLTcIUE2bpmZY/dhLvewu+oe6oIyi00hmXt482LQElBhvP
 96/bhcNxIyPOSuAWnW1qxULXmfcEVPQrYC+/D9GeobwRX3MMnZLqIxyRaqXleplMzUVM
 RcmAUyrhHSfTTFHNOg1WC4RAc2ZLw0i/yondSFOdJbmpNfIafGgz/yTmF6bIbg3QZuws
 VKptDbvgebQroGwVpL8l/KCPwD6s4IyGNkPCHD5wzIuU1kPLYjZOkAdBx8gM43x7zpHp
 U3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680669560;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dNJA2MovsmRGrhKkNNk4VSAJ1KGjz7kzrFn3co+MBNQ=;
 b=cHMMSxzBWS/S5PgQ93r9G4zEEx0LytOtNmOap+ljqNeR6lEx/rP46P0kI0tlIC1h/Q
 4SIhQ8m+zbuadCM+1q4HToJiSyor+jem6J2x8rlLEzQmWdhCZdHV58Ma5IYdxLQBCoBK
 juKCJdQDwCGgPV2UEV02vagqmGETBFDqy/CihcKBmt8OxwC/GhZV9ctahlxcsKqNys1I
 iUP4INVwdCbZn/IjsbDzM67XuOFhaDz7X6vjXLFFzabxHnP3Ju9MyW4lUFBoUTuEB7Ii
 2IU2doQl1gdgTsWFTfsNjjFnkff61i1GGLAAEuR/EVueZcOhbSrrHD7sfY88Gm9gLp+J
 m36w==
X-Gm-Message-State: AAQBX9cO5jNm+RqE/xKt9hAO8TyfXw+H1Y82Ew2BDJD4xhFr0A26O5BI
 yUfcd+dffzZ7vJGnuoIgeWeIms9Llu6EYZnMdFg=
X-Google-Smtp-Source: AKy350bEhLJTMfB2Y70NJagaR987GkjPkvvpsbeWg2Ce41+K7yVesvY4s4UVO4iP6NEcuk9W1iwIZigSAPM9bEz/tt8=
X-Received: by 2002:a67:c181:0:b0:42a:eb6:6c51 with SMTP id
 h1-20020a67c181000000b0042a0eb66c51mr3871725vsj.3.1680669560021; Tue, 04 Apr
 2023 21:39:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230404020653.18911-1-liweiwei@iscas.ac.cn>
 <20230404020653.18911-3-liweiwei@iscas.ac.cn>
In-Reply-To: <20230404020653.18911-3-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 14:38:53 +1000
Message-ID: <CAKmqyKMWarG0-xP4sTEp9RshRyFPLLXqdHZ4aFOhuuhVS_AXPA@mail.gmail.com>
Subject: Re: [PATCH v6 2/6] target/riscv: Update cur_pmmask/base when xl
 changes
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe35.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 04:39:24 -0000

On Tue, Apr 4, 2023 at 12:08=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> write_mstatus() can only change current xl when in debug mode.
> And we need update cur_pmmask/base in this case.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d522efc0b6..43b9ad4500 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1277,8 +1277,15 @@ static RISCVException write_mstatus(CPURISCVState =
*env, int csrno,
>          mstatus =3D set_field(mstatus, MSTATUS64_SXL, xl);
>      }
>      env->mstatus =3D mstatus;
> -    env->xl =3D cpu_recompute_xl(env);
>
> +    /*
> +     * Except in debug mode, UXL/SXL can only be modified by higher
> +     * privilege mode. So xl will not be changed in normal mode.
> +     */
> +    if (env->debugger) {
> +        env->xl =3D cpu_recompute_xl(env);
> +        riscv_cpu_update_mask(env);
> +    }
>      return RISCV_EXCP_NONE;
>  }
>
> --
> 2.25.1
>
>

