Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkEiY-0008MM-Pr
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 21:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkEiX-0008M2-4R; Wed, 05 Apr 2023 21:47:13 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkEiV-00056T-6v; Wed, 05 Apr 2023 21:47:12 -0400
Received: by mail-ua1-x934.google.com with SMTP id q8so19247153uas.7;
 Wed, 05 Apr 2023 18:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680745629;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7+WnH+bcz0YDqp64oLC6Rqk4gmZzFxoABmlgB63HkmA=;
 b=nVC95IE5gCZdevBMVQifBCGpM7S68XruLY9G7088sfG0rm2+mQVRb6ciRTXEn3QMts
 fmf5sFI9I27Deq4bL4IO6baaFBJA3Rm5Lqcbrgvc7bYCoojBgiNiMfSGfKrlCZ1mBBHP
 MtAOupsHrAKrsDLh5bdwUWldFE/NlMFtu7xQQoKjR+1XdZnwwpm7ucGibzAJV/VV2krE
 IjOEZtyeBFzgicNAvuGlb6Yvpv1UJBlN58o/1t2KtyZpqAnCZN721sQt5zxOIjqbRRRL
 knMcDn76u0Edlk3NR5k+xoem9vxWu2FV0i+RTfCTdpeGP4/HgeYkuacfzdkuVYBT0RnY
 tTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680745629;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7+WnH+bcz0YDqp64oLC6Rqk4gmZzFxoABmlgB63HkmA=;
 b=vMTEbAD7pG+eJW1q6HQYaMbH7YpIQyItuTUFr4ZS97CPd4tPZmi+wAWWwty+ZZOkRF
 kFGw+u+pr0cE3L/5X//gZTA2kHaY33YrNJxk1dN33taYKSOXLH0/WInWAEgs2b0Orlb3
 gXmwpyJr3cab8yRIrTTALNq97m7DEaRnXEqpczRogJIkybOgfe27DasOqbYLxCNPBEmW
 Jnj8LY8avFqDpq2SyE4D1flOdoN+LuWUnoz2O4oXXmV0ZXhkBXw7X2JGUYoNlzZ+89ax
 y30BxN/Z+fduDer2Z94IBqwISG/1m/h5SYf1xN2dAa1FoRmZe2P6viVgqd0zsazOs/nK
 IFtw==
X-Gm-Message-State: AAQBX9cOzL2UxBqMImtgyJdMUFaUngxKNYbHAw8MWLADKdWneI1D6CB1
 mLjpxjFCFMANQBo8UvDwoktKO1TJTxzGD45HJZk=
X-Google-Smtp-Source: AKy350Yj5gyIV1T1nLFYGkf2CQebAo8GpuJehjpBy1EteRxn38CuzjgJlcVmCSEsM9edZp5NPKN/oB1qGGdD53XUFcw=
X-Received: by 2002:a1f:31d3:0:b0:43c:3dd6:5535 with SMTP id
 x202-20020a1f31d3000000b0043c3dd65535mr5788444vkx.0.1680745629552; Wed, 05
 Apr 2023 18:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230330135818.68417-1-liweiwei@iscas.ac.cn>
 <20230330135818.68417-2-liweiwei@iscas.ac.cn>
 <CAKmqyKMzPwFpScWg2H+JMZpvH6oJAP0A5vgaKAEiXR57db0r4w@mail.gmail.com>
 <2b52f993-158e-a7ee-9180-b84f85f432c6@iscas.ac.cn>
In-Reply-To: <2b52f993-158e-a7ee-9180-b84f85f432c6@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 11:46:43 +1000
Message-ID: <CAKmqyKOOHs-Wq2s6fNJLyEUAQ1B3=PoyU5EFZ7e_=BDL-vLwAg@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: Fix the mstatus.MPP value after
 executing MRET
To: liweiwei <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x934.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 01:47:13 -0000

On Thu, Apr 6, 2023 at 10:56=E2=80=AFAM liweiwei <liweiwei@iscas.ac.cn> wro=
te:
>
>
> On 2023/4/6 08:43, Alistair Francis wrote:
>
> On Thu, Mar 30, 2023 at 11:59=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn>=
 wrote:
>
> The MPP will be set to the least-privileged supported mode (U if
> U-mode is implemented, else M).
>
> I don't think this is right, the spec in section 8.6.4 says this:
>
> Sorry, I didn't find this section in latest release of both privilege and=
 un-privilege spec

I updated my spec, using commit
f6b8d5c7d2dcd935b48689a337c8f5bc2be4b5e5 it's now section 9.6.4 Trap
Return

>
> (draft-20230131-c0b298a: Clarify WFI trapping behavior (#972)).

Also, you replied with a HTML email which loses the conversation
history (just see above). Can you fixup your client to reply with
plain text please

Alistair

>
> "MRET then in mstatus/mstatush sets MPV=3D0, MPP=3D0,
> MIE=3DMPIE, and MPIE=3D1"
>
> In section 3.1.6.1, the privilege spec says this:
>
> "An MRET or SRET instruction is used to return from a trap in M-mode or S=
-mode respectively.
> When executing an xRET instruction, supposing xPP holds the value y, xIE =
is set to xPIE; the
> privilege mode is changed to y; xPIE is set to 1; and xPP is set to the l=
east-privileged supported
> mode (U if U-mode is implemented, else M). If y=CC=B8=3DM, xRET also sets=
 MPRV=3D0"
>
> And I think PRV_U is an illegal value for MPP if U-mode is not implemente=
d.
>
> Regards,
>
> Weiwei Li
>
> So it should just always be 0 (PRV_U is 0)
>
> Alistair
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

