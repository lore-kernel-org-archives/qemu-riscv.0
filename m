Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkEOd-0002mW-9g
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 21:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkEOc-0002mH-0Y; Wed, 05 Apr 2023 21:26:38 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pkEOa-0002Yq-BO; Wed, 05 Apr 2023 21:26:37 -0400
Received: by mail-ua1-x92d.google.com with SMTP id n17so26875537uaj.10;
 Wed, 05 Apr 2023 18:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680744395;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DbFTfBGkSCakNwJ7ZTjI1HCr8fidkw4lSt6+SbXEJXg=;
 b=hik/s9UY3UjLon3YbXtHGIipor+R4foLKINjUtAv1J1Nq0pEqMXdn4hXnbG6H8CTUk
 mTKHVOP2VHXFdFb3xglgfMR1vKa2mH6rhRnUwS17hL0PrGmCql87vP/ugFgr2yP177zZ
 a18a3R+63noGiAiKsad2ylTwTz+UtDDeBXWTdfVrhI1ICIIS0fyaQa2IDxN90YIZrdyT
 4EicqeZ7KHq13zr+onJPADbRVJiaEFQYW90eHeVL0eQYS1cfmrEX/JZ9dKVAdzvIl4De
 85xk84zAxRBcbDNPcqsBYltHBtnYXHkfZ7nDq6ScMRZksJPmRpc7/8zX+ymydTSyEzSt
 skww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680744395;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DbFTfBGkSCakNwJ7ZTjI1HCr8fidkw4lSt6+SbXEJXg=;
 b=vYs8nZlukBtW9qHjkxfvsHCa1sSyFub2EGAO04U7M3UEQxP4+ty00gyZawhEn7l60w
 Q06lxu3pANfn3LbWu3trMERZiAG0/o+Yo27pK+QXoCDTcSw/+9SD5kQgqj1Q+SppD71Z
 XAZ6ypLtWUUtTlRuzdHxaXn/MWGKp8NOF7CjoyJsoyBD5bVmGLH5NiS8BuK8Ih/l1cWG
 upXwSimne4P1ODOY1MJpahfXm2ze+71dnjpQ6iZPFhd+HekBzDBgK9wJbdwS0rBGDeWZ
 wIrhP+GQzrJ087FYWgsWMRLodPHGuqLIxtJIYeB/8MFNb1sm90zR3vgBZaC93UTzV/ac
 v3Cw==
X-Gm-Message-State: AAQBX9eH/Ts3VUcZH1kRe6wBkpHOk+VOfa+L4QvUdBi8pfRvVZHN+43D
 eRY+LQ8FMvuE1y/x7Voxvh8DD92eftB0XZdJq8s=
X-Google-Smtp-Source: AKy350bj3mYbdBb1ovLmMSW+EEdSV8WpcJNGBFPWoATkp60FoAXGndGUbs0cpjwK14TA3x2wNYq/L3eUSuqjRvAb2c0=
X-Received: by 2002:a1f:1206:0:b0:43b:ff63:e79a with SMTP id
 6-20020a1f1206000000b0043bff63e79amr6065080vks.0.1680744394819; Wed, 05 Apr
 2023 18:26:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230330135818.68417-1-liweiwei@iscas.ac.cn>
 <20230330135818.68417-3-liweiwei@iscas.ac.cn>
In-Reply-To: <20230330135818.68417-3-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Apr 2023 11:26:08 +1000
Message-ID: <CAKmqyKNyfZoff5woowdVvf9WH_AnTPsD3ES7rkgubLKM0E=9Rg@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: Legalize MPP value in write_mstatus
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92d.google.com
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
X-List-Received-Date: Thu, 06 Apr 2023 01:26:38 -0000

On Thu, Mar 30, 2023 at 11:59=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> w=
rote:
>
> mstatus.MPP field is a WARL field, so we remain it unchanged if an

Only since version 1.11 of the priv spec and we do still support priv 1.10.

I think it's ok to make this change for all priv versions, as it won't
break any software running 1.10, but it's worth adding a comment or at
least a mention in the commit message.

Alistair

> invalid value is written into it. And after this, RVH shouldn't be
> passed to riscv_cpu_set_mode().
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/cpu_helper.c |  5 +----
>  target/riscv/csr.c        | 14 ++++++++++++++
>  2 files changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f88c503cf4..46baf3ab7c 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -659,12 +659,9 @@ void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *en=
v, uint32_t priv,
>
>  void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
>  {
> -    if (newpriv > PRV_M) {
> +    if (newpriv > PRV_M || newpriv =3D=3D PRV_H) {
>          g_assert_not_reached();
>      }
> -    if (newpriv =3D=3D PRV_H) {
> -        newpriv =3D PRV_U;
> -    }
>      if (icount_enabled() && newpriv !=3D env->priv) {
>          riscv_itrigger_update_priv(env);
>      }
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d522efc0b6..a99026c3e8 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1238,6 +1238,18 @@ static bool validate_vm(CPURISCVState *env, target=
_ulong vm)
>      return (vm & 0xf) <=3D satp_mode_max_from_map(cpu->cfg.satp_mode.map=
);
>  }
>
> +static target_ulong legalize_mpp(CPURISCVState *env, target_ulong old_mp=
p,
> +                                 target_ulong val)
> +{
> +    target_ulong new_mpp =3D get_field(val, MSTATUS_MPP);
> +    bool mpp_invalid =3D (new_mpp =3D=3D PRV_S && !riscv_has_ext(env, RV=
S)) ||
> +                       (new_mpp =3D=3D PRV_U && !riscv_has_ext(env, RVU)=
) ||
> +                       (new_mpp =3D=3D PRV_H);
> +
> +    /* Remain field unchanged if new_mpp value is invalid */
> +    return mpp_invalid ? set_field(val, MSTATUS_MPP, old_mpp) : val;
> +}
> +
>  static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>                                      target_ulong val)
>  {
> @@ -1245,6 +1257,8 @@ static RISCVException write_mstatus(CPURISCVState *=
env, int csrno,
>      uint64_t mask =3D 0;
>      RISCVMXL xl =3D riscv_cpu_mxl(env);
>
> +    val =3D legalize_mpp(env, get_field(mstatus, MSTATUS_MPP), val);
> +
>      /* flush tlb on mstatus fields that affect VM */
>      if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
>              MSTATUS_MPRV | MSTATUS_SUM)) {
> --
> 2.25.1
>
>

