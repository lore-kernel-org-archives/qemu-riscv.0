Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pobUT-0005G7-M6
	for mharc-qemu-riscv@gnu.org; Mon, 17 Apr 2023 22:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pobUS-0005EE-9R; Mon, 17 Apr 2023 22:54:44 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pobUQ-0003F3-NP; Mon, 17 Apr 2023 22:54:44 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id e19so10158649vsa.12;
 Mon, 17 Apr 2023 19:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681786480; x=1684378480;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pM32DtRpwGHZd9j0Tor3dV9u9f64HFd4aNFbs8ZZoH0=;
 b=Zdy0C8p/T2jEer7EtCwMLvAWKr5xIm3ujtoPnlNjJokJkzLgZ8BnZ086rfo22km8lf
 awxPgUk2oaweroRnyJ7ix5F5zGVrZoK997P8++N94iqsgwGvcLXu4gUIYGXeRcrlgmuK
 1U9smqCG/GZ5vlAJaqQBf5Myn4LsTYgleIbWIia4EkTws6bKWi2o2C7kxv8DoUxNofDc
 16+bbYDdz4nXwfdu5iXOhSTIunjuAYXnxjbayXmGG016g36tDG+OD0tWSe2bh58S2UR0
 UnIkHGmEm5i7CDEf9yHwSydEifFhccss3iFCom/VBb7ZkyEheZiLRk5PryR90zJZ9IBK
 nFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681786480; x=1684378480;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pM32DtRpwGHZd9j0Tor3dV9u9f64HFd4aNFbs8ZZoH0=;
 b=dZsZE2BDg7Td4WZFOrr6XlNSxUe83D4KJv0GwLfnajIsu1p+b3/ua+3Wxu6d2PbQTU
 GhBy6fBs4My2KjKGWPOGrBj07sB0ypdWhfc1ZPC74Wx89s2ZbpU+zFC1jPvWPpcwWTIq
 rIAhAafSvUuJOXgbxGPR2OJ4hYQfXhl5gmVdPCaBlLClNKSywc7ZucIRxrdF3nElDIyz
 hbjX0j9UMdozwtUhv0cjb9nXrhueA8PfZR/cvRn+sXDY+1G8pZ94772MEnBw9Hk/cftU
 cv1VwuyIgQbn7mm7r5QEFS9UmU4HS3lq2YExe2p6CRWee+M9LxNoNb8+EoQ1Q8kcTbDZ
 i3CQ==
X-Gm-Message-State: AAQBX9ffr1LsKulH05XO4fuagXHI/Jd+3JS/vKFNNKU8t7ZmLz/lPVJN
 pxKso5S40eHZf8UVi+cidpE+ubW0Z4QjKIEhRQI=
X-Google-Smtp-Source: AKy350b/ysArDPcC3dRGmn79Y+mmvXXyF8X10zSppdFbrJy+ngzboSTrojtUUrtfR1saJ1+JYhHNnyCr6ACzW3dq+Uc=
X-Received: by 2002:a05:6102:11ea:b0:42e:5ff9:5dfa with SMTP id
 e10-20020a05610211ea00b0042e5ff95dfamr2768036vsg.30.1681786480320; Mon, 17
 Apr 2023 19:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230413090122.65228-1-liweiwei@iscas.ac.cn>
 <20230413090122.65228-3-liweiwei@iscas.ac.cn>
In-Reply-To: <20230413090122.65228-3-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Apr 2023 12:54:14 +1000
Message-ID: <CAKmqyKOtsT31TiV4CZLHkGf3jMEYwQ3ZQ0-Qrg2yYQg3cxGsyQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] target/riscv: Move pmp_get_tlb_size apart from
 get_physical_address_pmp
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 18 Apr 2023 02:54:44 -0000

On Thu, Apr 13, 2023 at 7:04=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> pmp_get_tlb_size have no relationship with pmp-related permission check
> currently.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 075fc0538a..83c9699a6d 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -676,14 +676,11 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_=
ulong newpriv)
>   *
>   * @env: CPURISCVState
>   * @prot: The returned protection attributes
> - * @tlb_size: TLB page size containing addr. It could be modified after =
PMP
> - *            permission checking. NULL if not set TLB page for addr.
>   * @addr: The physical address to be checked permission
>   * @access_type: The type of MMU access
>   * @mode: Indicates current privilege level.
>   */
> -static int get_physical_address_pmp(CPURISCVState *env, int *prot,
> -                                    target_ulong *tlb_size, hwaddr addr,
> +static int get_physical_address_pmp(CPURISCVState *env, int *prot, hwadd=
r addr,
>                                      int size, MMUAccessType access_type,
>                                      int mode)
>  {
> @@ -703,9 +700,6 @@ static int get_physical_address_pmp(CPURISCVState *en=
v, int *prot,
>      }
>
>      *prot =3D pmp_priv_to_page_prot(pmp_priv);
> -    if (tlb_size !=3D NULL) {
> -        *tlb_size =3D pmp_get_tlb_size(env, addr);
> -    }
>
>      return TRANSLATE_SUCCESS;
>  }
> @@ -905,7 +899,7 @@ restart:
>          }
>
>          int pmp_prot;
> -        int pmp_ret =3D get_physical_address_pmp(env, &pmp_prot, NULL, p=
te_addr,
> +        int pmp_ret =3D get_physical_address_pmp(env, &pmp_prot, pte_add=
r,
>                                                 sizeof(target_ulong),
>                                                 MMU_DATA_LOAD, PRV_S);
>          if (pmp_ret !=3D TRANSLATE_SUCCESS) {
> @@ -1300,8 +1294,9 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address=
, int size,
>              prot &=3D prot2;
>
>              if (ret =3D=3D TRANSLATE_SUCCESS) {
> -                ret =3D get_physical_address_pmp(env, &prot_pmp, &tlb_si=
ze, pa,
> +                ret =3D get_physical_address_pmp(env, &prot_pmp, pa,
>                                                 size, access_type, mode);
> +                tlb_size =3D pmp_get_tlb_size(env, pa);
>
>                  qemu_log_mask(CPU_LOG_MMU,
>                                "%s PMP address=3D" HWADDR_FMT_plx " ret %=
d prot"
> @@ -1333,8 +1328,9 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address=
, int size,
>                        __func__, address, ret, pa, prot);
>
>          if (ret =3D=3D TRANSLATE_SUCCESS) {
> -            ret =3D get_physical_address_pmp(env, &prot_pmp, &tlb_size, =
pa,
> +            ret =3D get_physical_address_pmp(env, &prot_pmp, pa,
>                                             size, access_type, mode);
> +            tlb_size =3D pmp_get_tlb_size(env, pa);
>
>              qemu_log_mask(CPU_LOG_MMU,
>                            "%s PMP address=3D" HWADDR_FMT_plx " ret %d pr=
ot"
> --
> 2.25.1
>
>

