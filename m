Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pbxFR-0002tV-Ti
	for mharc-qemu-riscv@gnu.org; Tue, 14 Mar 2023 01:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pbxFO-0002sF-Sd; Tue, 14 Mar 2023 01:30:55 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pbxFM-0008AI-S4; Tue, 14 Mar 2023 01:30:54 -0400
Received: by mail-ua1-x92a.google.com with SMTP id x33so3870082uaf.12;
 Mon, 13 Mar 2023 22:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678771851;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bgPDXiBhe+iGf7F//ZEj6cSD13GLukLrkw0/nnU7igs=;
 b=etVa4li2/LkUKlcrVH4fVjU4CUGLX2l890rSjTYA/Ej9motD8WkEI4MtPoKf6Ul2+F
 qeTQcGq0zRCF4foPAyGhSJyQ+nk2sT8XGgIPdvpZP+goIEoozx6cFWylj9IarJI43fTw
 B1c0DRQF0eBvijGUjylXupRK26ZV1H2qwy6lsGnvnOlizlT4FW4BWskOc52VVGMwdjHv
 TlC7pjiXt0n063VX7iIeeXTZxJe2NDYi/viK76zalMo+vb7WcwQc5ku3a+dLZErYjCeG
 nXOhI49oFomH/I848S9Noc5ZWxhurhibnM9qzdglKJlBji5HtiHKqShUEdYqXmdNyzDQ
 dOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678771851;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bgPDXiBhe+iGf7F//ZEj6cSD13GLukLrkw0/nnU7igs=;
 b=p5dBrT69T8Wfl961kg/0Fs1w7lRtsKJjZsSjKWoxvcWnhl9exQuoYi7Zd6FEbQrw/j
 xW6gjGrNr2SS4qOBFLMQJQGufbD4tNg9LTx7YjHHLIkfbu6nMVkpoHj9BrSwuFuLjB1C
 b55dozEUHKfCjT5CPufcQEZJoE9lSEi+cK/100f4TFyhvGDob2r+Oa/t73mg4b9SyRyr
 Z5o3I/GsN+EqnZcJmlEQd1+0jmuDSJBRo8W5aPmFBb78xa6kWmxiHalcSzmFJfM8KTRL
 ljIFZoDLs3M452cUQ0Z7Cq2I0FkkWCTjTGJMlhI8GenoK3OSL5yLl9IReLO3lJI/gaZ1
 z7Iw==
X-Gm-Message-State: AO0yUKUluV0tEtoaX3/Bdrc24dbwF706zxBBjO1PsTD6/miJjpt2/A47
 7yhlNSW70W1iG6IXAX+tzMMhkeq/Hv3+jAcKDPRg20JweZA=
X-Google-Smtp-Source: AK7set8sSvV2ktnAl6tdvP2mZypat3m2xMWGMr2ugM84GtR7HJiM+kLAOz/qG0iEYm3n5oCSilj4wg9ISlInn9reDIM=
X-Received: by 2002:ab0:4714:0:b0:68e:2ed3:92eb with SMTP id
 h20-20020ab04714000000b0068e2ed392ebmr18623482uac.1.1678771851377; Mon, 13
 Mar 2023 22:30:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230309071329.45932-1-liweiwei@iscas.ac.cn>
 <20230309071329.45932-5-liweiwei@iscas.ac.cn>
In-Reply-To: <20230309071329.45932-5-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 14 Mar 2023 15:30:25 +1000
Message-ID: <CAKmqyKM9H2_ekRtjOtipxEaOiqvo5PcuBz21yVnv0-pLCbcvTw@mail.gmail.com>
Subject: Re: [PATCH 4/4] target/riscv: Simplify arguments for riscv_csrrw_check
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92a.google.com
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
X-List-Received-Date: Tue, 14 Mar 2023 05:30:55 -0000

On Thu, Mar 9, 2023 at 5:14=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wro=
te:
>
> Remove RISCVCPU argument, and get cfg infomation from CPURISCVState
> directly.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 53143f4d9a..80fc15e4d6 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3755,15 +3755,14 @@ static RISCVException rmw_seed(CPURISCVState *env=
, int csrno,
>
>  static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>                                                 int csrno,
> -                                               bool write_mask,
> -                                               RISCVCPU *cpu)
> +                                               bool write_mask)
>  {
>      /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fail=
s */
>      bool read_only =3D get_field(csrno, 0xC00) =3D=3D 3;
>      int csr_min_priv =3D csr_ops[csrno].min_priv_ver;
>
>      /* ensure the CSR extension is enabled */
> -    if (!cpu->cfg.ext_icsr) {
> +    if (!riscv_cpu_cfg(env)->ext_icsr) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
> @@ -3859,9 +3858,7 @@ RISCVException riscv_csrrw(CPURISCVState *env, int =
csrno,
>                             target_ulong *ret_value,
>                             target_ulong new_value, target_ulong write_ma=
sk)
>  {
> -    RISCVCPU *cpu =3D env_archcpu(env);
> -
> -    RISCVException ret =3D riscv_csrrw_check(env, csrno, write_mask, cpu=
);
> +    RISCVException ret =3D riscv_csrrw_check(env, csrno, write_mask);
>      if (ret !=3D RISCV_EXCP_NONE) {
>          return ret;
>      }
> @@ -3914,9 +3911,8 @@ RISCVException riscv_csrrw_i128(CPURISCVState *env,=
 int csrno,
>                                  Int128 new_value, Int128 write_mask)
>  {
>      RISCVException ret;
> -    RISCVCPU *cpu =3D env_archcpu(env);
>
> -    ret =3D riscv_csrrw_check(env, csrno, int128_nz(write_mask), cpu);
> +    ret =3D riscv_csrrw_check(env, csrno, int128_nz(write_mask));
>      if (ret !=3D RISCV_EXCP_NONE) {
>          return ret;
>      }
> --
> 2.25.1
>
>

