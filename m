Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm3AE-00037J-Ex
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm3AD-000370-CA; Mon, 10 Apr 2023 21:51:17 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm3AB-0004KJ-TG; Mon, 10 Apr 2023 21:51:17 -0400
Received: by mail-ua1-x930.google.com with SMTP id x30so2743758uaf.7;
 Mon, 10 Apr 2023 18:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681177874; x=1683769874;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UmwQRgTmmYOs0xGk9pR4oKqMEHXb4JzbFkzpkWaOQRw=;
 b=WRtDUqxZbyGoFe5zbNuhPqx/VbYKSZqSpbISM1+TjP5ux+N2vUGvQZhvclwKBraXe1
 jkzdREDkDvP752uOoZCIYJRRwkuzMeO4JVq8X35FABGEjOR+Gcbmy/vxHcodlDnYLX9U
 j3tXvRepEWlTHI9zHyWA+fhtWNRG5NsDa3F2ASch0EfBybXtX3p16/rT7eQjF5jcUVzl
 hMesOY3MH8Nqu1QY99AaxyU/oJ2pYGkulgvI0GnMziTxitCUeK33bQfDyq3cVx+1J7iI
 r18+9YoUI+E3XbMZpLgA11sWHcc4h/9EBt5l69yLH8ffT1rVvFlbpJKXKqDkP9HsTTLs
 5HIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681177874; x=1683769874;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UmwQRgTmmYOs0xGk9pR4oKqMEHXb4JzbFkzpkWaOQRw=;
 b=D/5CmQDztEl8B30UlPaHN7V6RFNvrZxcgAtK4/6wYrXuJvrsEmnJ9XQQoHY9Z9vYwd
 Fd+QhpK7AoxsazOqZ0KEWseN2ais9pURdO00bvAzX4NIfBAoFCz3d4W1BW6Mzet3k3EM
 RCt8wqlMFdE5qwajFKB1j+CUCg7qxGDUbt9PoofLuzYUWLkti3BTVeQP+U4Ul1KwtlO7
 wz/iV1tsoZ7rK5s7wkV0jyFNiPWSebgh01QWJDlS3vtphB/3PIl0DJi1hgJjylkl2ZVx
 c0aAs4Og+4T0NnNxlMB6lyKrX0NzoQ9IR4HB/zcCn1Q2FABx0NgrJ7Fjx1G7ABydpUI+
 SP0Q==
X-Gm-Message-State: AAQBX9cdeoUI2xHts/j0ZcecSLwRuonHASpkcktovcWgDV4N1bR3KEpQ
 H1AothKODs0oVf2cAoBIYRmnlkPhLoD1cCty/Ic=
X-Google-Smtp-Source: AKy350bhCzjH0fuKWFhn5oZHaqOFnE7Fl0Id61fpqDhitRVbWL5CBs17EINGpasmvP/Iw6npnURe2nCCjN5L748D/kA=
X-Received: by 2002:ab0:1015:0:b0:68a:5c52:7f2b with SMTP id
 f21-20020ab01015000000b0068a5c527f2bmr8080324uab.1.1681177874097; Mon, 10 Apr
 2023 18:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230407014743.18779-1-liweiwei@iscas.ac.cn>
 <20230407014743.18779-4-liweiwei@iscas.ac.cn>
In-Reply-To: <20230407014743.18779-4-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 11:50:48 +1000
Message-ID: <CAKmqyKNyZkQRSpx1J5T=h3eS+V_TefoXFQ6awj4GH+i7ucAR3g@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] target/riscv: Legalize MPP value in write_mstatus
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
X-List-Received-Date: Tue, 11 Apr 2023 01:51:17 -0000

On Fri, Apr 7, 2023 at 11:49=E2=80=AFAM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> mstatus.MPP field is a WARL field since priv version 1.11, so we
> remain it unchanged if an invalid value is written into it. And
> after this, RVH shouldn't be passed to riscv_cpu_set_mode().
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c |  8 ++------
>  target/riscv/csr.c        | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 2310c7905f..433ea529b0 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -647,12 +647,8 @@ void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *en=
v, uint32_t priv,
>
>  void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
>  {
> -    if (newpriv > PRV_M) {
> -        g_assert_not_reached();
> -    }
> -    if (newpriv =3D=3D PRV_H) {
> -        newpriv =3D PRV_U;
> -    }
> +    g_assert(newpriv <=3D PRV_M && newpriv !=3D PRV_RESERVED);
> +
>      if (icount_enabled() && newpriv !=3D env->priv) {
>          riscv_itrigger_update_priv(env);
>      }
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index e0b871f6dc..f4d2dcfdc8 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1230,6 +1230,32 @@ static bool validate_vm(CPURISCVState *env, target=
_ulong vm)
>             satp_mode_max_from_map(riscv_cpu_cfg(env)->satp_mode.map);
>  }
>
> +static target_ulong legalize_mpp(CPURISCVState *env, target_ulong old_mp=
p,
> +                                 target_ulong val)
> +{
> +    bool valid =3D false;
> +    target_ulong new_mpp =3D get_field(val, MSTATUS_MPP);
> +
> +    switch (new_mpp) {
> +    case PRV_M:
> +        valid =3D true;
> +        break;
> +    case PRV_S:
> +        valid =3D riscv_has_ext(env, RVS);
> +        break;
> +    case PRV_U:
> +        valid =3D riscv_has_ext(env, RVU);
> +        break;
> +    }
> +
> +    /* Remain field unchanged if new_mpp value is invalid */
> +    if (!valid) {
> +        val =3D set_field(val, MSTATUS_MPP, old_mpp);
> +    }
> +
> +    return val;
> +}
> +
>  static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>                                      target_ulong val)
>  {
> @@ -1237,6 +1263,12 @@ static RISCVException write_mstatus(CPURISCVState =
*env, int csrno,
>      uint64_t mask =3D 0;
>      RISCVMXL xl =3D riscv_cpu_mxl(env);
>
> +    /*
> +     * MPP field have been made WARL since priv version 1.11. However,
> +     * legalization for it will not break any software running on 1.10.
> +     */
> +    val =3D legalize_mpp(env, get_field(mstatus, MSTATUS_MPP), val);
> +
>      /* flush tlb on mstatus fields that affect VM */
>      if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
>              MSTATUS_MPRV | MSTATUS_SUM)) {
> --
> 2.25.1
>
>

