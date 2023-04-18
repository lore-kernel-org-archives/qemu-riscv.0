Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pobFx-0002uj-27
	for mharc-qemu-riscv@gnu.org; Mon, 17 Apr 2023 22:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pobFw-0002uW-Aw; Mon, 17 Apr 2023 22:39:44 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pobFt-0000m7-NC; Mon, 17 Apr 2023 22:39:43 -0400
Received: by mail-ua1-x92d.google.com with SMTP id v18so7664445uak.8;
 Mon, 17 Apr 2023 19:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681785580; x=1684377580;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gwK6xbQjLQgV7IpoDBiFDQ+TGl+CyzJgVnO6FZe8mKQ=;
 b=axokx8Ut7+qcBjC8mwjdfZg63OByO2qpBFFDngKXcrVS57RzeSzOI7q97VSe7Pc2ov
 D5PUOEPIhoO9FckxJ8qYbv54mdGHESiPfrQn9ZMYgqnW/ibv35Vv9yupBikMybLsSurc
 a2ebWxgEoI0C01qSfpLFm8AFq1apHpa2mvDEDQ/Kb+nLfuPvC2XBCDA0P2b6re9ss4bL
 OgqTDB4PL6B/Uql5CM6BX1xk6wM657AooqOmIM4lDkFRDmoBhPdmQKbo5AdutH87tw0a
 6aS2ttYPGzka+2EceNlp6RAe4ZRwKhj6m4xck6HdbtN043ioAU2pJCFHaQuPqRF2Ciwh
 Oxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681785580; x=1684377580;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gwK6xbQjLQgV7IpoDBiFDQ+TGl+CyzJgVnO6FZe8mKQ=;
 b=i9OaUSvmwMewh2WVK+ucC9fRcFhZ8v+tw7GUNMqhxPlAlP61J2rByTTf8JhfXfh5JM
 JBbf6T4zaDgHN9Hqh3nbsCZV0vGrnDHY6/t8alnQUmNQ3GHUavvg5cApxucx33jpR8j4
 UD8EUk+fcO5wTdWELHj7Fst0vS8KOtlufROgGhfABdI6jScMTf+jHxcoxGmhhJUMXI+Z
 f+HcWjZlOLSNmQg+geGY1lTtO7YhbCmyWU6QyTEZOxogRKrCqJLfQUOP8aPirTVw3/Xh
 zN3NIOct48+TjWQ0AEi7eAla0pmK6M1llKKUUzSaLJSAvJPi/yy5IcGL2GaOk45YuucC
 1R0Q==
X-Gm-Message-State: AAQBX9dATDCnWLIekw0NwR2vi/w/fYcv/sPO6K3+afsOAA5mg1h4i9QF
 DeyEBfAWzJ04ygJcLFtcSx1BHUOwSQdFPLaUApQ=
X-Google-Smtp-Source: AKy350afLNRTlOjlbCW3nYZemsrYlk/E0q5m68xhLdwIhu8KWVyEDt4vRZ4fP5XcBx/Stl0tmvETshFU+Tc4HqTnjIA=
X-Received: by 2002:a1f:eac2:0:b0:440:8c1f:4328 with SMTP id
 i185-20020a1feac2000000b004408c1f4328mr3248719vkh.7.1681785580153; Mon, 17
 Apr 2023 19:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230413090122.65228-1-liweiwei@iscas.ac.cn>
 <20230413090122.65228-5-liweiwei@iscas.ac.cn>
In-Reply-To: <20230413090122.65228-5-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Apr 2023 12:39:14 +1000
Message-ID: <CAKmqyKM7qjtWOoNmL4hFQ6=LnOeo9RZ2NKNH_=tVKJfKB5AVEQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] target/riscv: Flush TLB only when pmpcfg/pmpaddr
 really changes
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92d.google.com
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
X-List-Received-Date: Tue, 18 Apr 2023 02:39:44 -0000

On Thu, Apr 13, 2023 at 7:04=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> TLB needn't be flushed when pmpcfg/pmpaddr don't changes.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/pmp.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 6d4813806b..aced23c4d5 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -26,7 +26,7 @@
>  #include "trace.h"
>  #include "exec/exec-all.h"
>
> -static void pmp_write_cfg(CPURISCVState *env, uint32_t addr_index,
> +static bool pmp_write_cfg(CPURISCVState *env, uint32_t addr_index,
>                            uint8_t val);
>  static uint8_t pmp_read_cfg(CPURISCVState *env, uint32_t addr_index);
>  static void pmp_update_rule(CPURISCVState *env, uint32_t pmp_index);
> @@ -83,7 +83,7 @@ static inline uint8_t pmp_read_cfg(CPURISCVState *env, =
uint32_t pmp_index)
>   * Accessor to set the cfg reg for a specific PMP/HART
>   * Bounds checks and relevant lock bit.
>   */
> -static void pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_=
t val)
> +static bool pmp_write_cfg(CPURISCVState *env, uint32_t pmp_index, uint8_=
t val)
>  {
>      if (pmp_index < MAX_RISCV_PMPS) {
>          bool locked =3D true;
> @@ -119,14 +119,17 @@ static void pmp_write_cfg(CPURISCVState *env, uint3=
2_t pmp_index, uint8_t val)
>
>          if (locked) {
>              qemu_log_mask(LOG_GUEST_ERROR, "ignoring pmpcfg write - lock=
ed\n");
> -        } else {
> +        } else if (env->pmp_state.pmp[pmp_index].cfg_reg !=3D val) {
>              env->pmp_state.pmp[pmp_index].cfg_reg =3D val;
>              pmp_update_rule(env, pmp_index);
> +            return true;
>          }
>      } else {
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "ignoring pmpcfg write - out of bounds\n");
>      }
> +
> +    return false;
>  }
>
>  static void pmp_decode_napot(target_ulong a, target_ulong *sa,
> @@ -477,16 +480,19 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t =
reg_index,
>      int i;
>      uint8_t cfg_val;
>      int pmpcfg_nums =3D 2 << riscv_cpu_mxl(env);
> +    bool modified =3D false;
>
>      trace_pmpcfg_csr_write(env->mhartid, reg_index, val);
>
>      for (i =3D 0; i < pmpcfg_nums; i++) {
>          cfg_val =3D (val >> 8 * i)  & 0xff;
> -        pmp_write_cfg(env, (reg_index * 4) + i, cfg_val);
> +        modified |=3D pmp_write_cfg(env, (reg_index * 4) + i, cfg_val);
>      }
>
>      /* If PMP permission of any addr has been changed, flush TLB pages. =
*/
> -    tlb_flush(env_cpu(env));
> +    if (modified) {
> +        tlb_flush(env_cpu(env));
> +    }
>  }
>
>
> @@ -535,9 +541,11 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t =
addr_index,
>          }
>
>          if (!pmp_is_locked(env, addr_index)) {
> -            env->pmp_state.pmp[addr_index].addr_reg =3D val;
> -            pmp_update_rule(env, addr_index);
> -            tlb_flush(env_cpu(env));
> +            if (env->pmp_state.pmp[addr_index].addr_reg !=3D val) {
> +                env->pmp_state.pmp[addr_index].addr_reg =3D val;
> +                pmp_update_rule(env, addr_index);
> +                tlb_flush(env_cpu(env));
> +            }
>          } else {
>              qemu_log_mask(LOG_GUEST_ERROR,
>                            "ignoring pmpaddr write - locked\n");
> --
> 2.25.1
>
>

