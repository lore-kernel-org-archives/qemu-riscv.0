Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lmOMD-00024P-19
	for mharc-qemu-riscv@gnu.org; Thu, 27 May 2021 18:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lmOM8-00022m-Pr; Thu, 27 May 2021 18:19:58 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:38896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lmOM5-0004jW-7h; Thu, 27 May 2021 18:19:56 -0400
Received: by mail-il1-x131.google.com with SMTP id j30so1671479ila.5;
 Thu, 27 May 2021 15:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Agr6QIoRBqgH0qMfaKe+a5zsmMVYFVc/tShT2b5LMo8=;
 b=iBmJdKum6B9LXjqO75PlU3XfRDEhlmeJgriPVKwZoLuU9LSWNtO5veXCJvnupAOYKe
 UBdD0+1wHfmLoB8OsqCuMvApkh1emvwDQEkKTQNZvLKij1F2ZpjKbqi5p9zuViqvOEcc
 TD5NElkNC0gOxxJ5eq80t1swQtu8SGq1Fzh+fYCBuMoRFTNlSxuntqNa6KiuGO6jBuUC
 swjXNfSW2YMtvj5xfhgHzxFLGH+nHo4euTokND5R+70eqD1MhhQe358jMgb+RWNLSHt+
 Pxeq6/KlHPgpfUsD7ffS8UjFTyaWxZjP+s3sdRlYSfIxViZgywDBQW/QAZrbEYAqRCsN
 /TTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Agr6QIoRBqgH0qMfaKe+a5zsmMVYFVc/tShT2b5LMo8=;
 b=aHcxOgasoMp5BsqpkKVirdoDYORJYjyOEz1BIEebxtYslZnqOUTDwQ7mRxp6Wqf5Qw
 /1YaNvaMxjP9/mBvmnD3hbkmE4fsNUAK4kTvSm+2sLYLWC9KWOkf7R7KipmXmvmVslLl
 s3LdTq8RMYOJ/89QNbZfB83oG6HUrLNWNgXA42OE5NubBBlefqhMkIXkIrfxlSR8Vg/I
 Ppu/6/cJi+Nhko3AQoUbWW0gnSNzMp/8iEjsYXZQt8eYeP3/3i3IcH83Q22zAtKW5zoJ
 77UnxKeicb+MLViUdG5XGVtbScISbsOwvR8LFMyMOlHT5lkAiXRjuQsU6fJqQM/hy5fZ
 D2pA==
X-Gm-Message-State: AOAM532bIyxrf4t0j5Yf9lRgkDEhkcRX3v116zFD/Maw6sKkheXzCWEi
 p7y5uMehpDiT9e2DgMDRbjlvlrVUAQkVCwy7af4=
X-Google-Smtp-Source: ABdhPJwkcBijVs7k/63HRc7WtZzC6wFMqxf5hx9kSpOMG8TfasgWEWqIoS+iOToYrBmzRObRXz26H/B90h9WhdA2/Fw=
X-Received: by 2002:a92:6b05:: with SMTP id g5mr4726729ilc.40.1622153991566;
 Thu, 27 May 2021 15:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210527090051.1837256-1-zhiwei_liu@c-sky.com>
In-Reply-To: <20210527090051.1837256-1-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 May 2021 08:19:24 +1000
Message-ID: <CAKmqyKMtRCP7gouO0qBUsKPXCgroKsSXkTr8FTgDydXdrUc8tw@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/riscv: Fix vsip vsie CSR ops in M and HS mode
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
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
X-List-Received-Date: Thu, 27 May 2021 22:19:58 -0000

On Thu, May 27, 2021 at 7:01 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> When V=1, instructions that normally read or modify a supervisor CSR
> shall instead access the corresponding VS CSR. And the VS CSRs can be
> accessed as themselves from M-mode or HS-mode.
>
> In M and HS mode, VSIP or VSIE should be written normally instead of
> shift by 1.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/csr.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fe5628fea6..0cce474d3d 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -837,16 +837,16 @@ static RISCVException read_sie(CPURISCVState *env, int csrno,
>  static RISCVException write_vsie(CPURISCVState *env, int csrno,
>                                   target_ulong val)
>  {
> -    /* Shift the S bits to their VS bit location in mie */
>      target_ulong newval = (env->mie & ~VS_MODE_INTERRUPTS) |
> -                          ((val << 1) & env->hideleg & VS_MODE_INTERRUPTS);
> +                          (val & env->hideleg & VS_MODE_INTERRUPTS);

Ok, so when a Hypervisor writes to vsie it should actually set SSIE
instead of VSSIE. That looks right.

The problem here now is that you are still using the VS mask, so this
won't set anything.

>      return write_mie(env, CSR_MIE, newval);
>  }
>
>  static int write_sie(CPURISCVState *env, int csrno, target_ulong val)
>  {
>      if (riscv_cpu_virt_enabled(env)) {
> -        write_vsie(env, CSR_VSIE, val);
> +        /* Shift the S bits to their VS bit location in mie */
> +        write_vsie(env, CSR_VSIE, val << 1);

A write to SIE when virtulised actually sets VSIE, sounds good.

>      } else {
>          target_ulong newval = (env->mie & ~S_MODE_INTERRUPTS) |
>                                (val & S_MODE_INTERRUPTS);
> @@ -950,12 +950,9 @@ static RISCVException rmw_vsip(CPURISCVState *env, int csrno,
>                                 target_ulong *ret_value,
>                                 target_ulong new_value, target_ulong write_mask)
>  {
> -    /* Shift the S bits to their VS bit location in mip */
> -    int ret = rmw_mip(env, 0, ret_value, new_value << 1,
> -                      (write_mask << 1) & vsip_writable_mask & env->hideleg);
> +    int ret = rmw_mip(env, 0, ret_value, new_value,
> +                      write_mask & vsip_writable_mask & env->hideleg);

The mask seems wrong here as well.

Alistair

>      *ret_value &= VS_MODE_INTERRUPTS;
> -    /* Shift the VS bits to their S bit location in vsip */
> -    *ret_value >>= 1;
>      return ret;
>  }
>
> @@ -966,7 +963,11 @@ static RISCVException rmw_sip(CPURISCVState *env, int csrno,
>      int ret;
>
>      if (riscv_cpu_virt_enabled(env)) {
> -        ret = rmw_vsip(env, CSR_VSIP, ret_value, new_value, write_mask);
> +        /* Shift the S bits to their VS bit location in mip */
> +        ret = rmw_vsip(env, CSR_VSIP, ret_value, new_value << 1,
> +                       write_mask << 1);
> +        /* Shift the VS bits to their S bit location in vsip */
> +        *ret_value >>= 1;
>      } else {
>          ret = rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
>                        write_mask & env->mideleg & sip_writable_mask);
> --
> 2.25.1
>
>

