Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm6gd-0000VN-Bd
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 01:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm6gb-0000Ut-H1; Tue, 11 Apr 2023 01:36:57 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm6gZ-0008Po-SV; Tue, 11 Apr 2023 01:36:57 -0400
Received: by mail-vs1-xe34.google.com with SMTP id g13so6100836vsk.12;
 Mon, 10 Apr 2023 22:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681191414; x=1683783414;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K+o6HFW7YIcoey1ju41Np2Ywz2uKMZkP6T0NrmrEWzk=;
 b=RjnX2JM/yoppV8rGY9n/F+g/cp0VCHTgG/DIwLRJLafd8rG2tgEiGckRJEr0qlPvS7
 5Tw2SUEyrZxV/n14FZ5tm+sJTpg35TaSRbZ0l3hgIGAq/wKi69CQSDjD7B7lgIAvF6IX
 emVqpzGks9a7q401UJVouh51qIYDw7luY/w6VO76mVcODFuc46NC1Mgs2rzKbkP3Wxd1
 YoNsFcChHMNWcURVAkp4wy9r8p2NNGdwY/eG2FpNkCO1y9r6sMYsMYPQc/pTsYGD6yLb
 2gADg1M5+6LUqV3IyVh7Oo40VPQWa3ln4qaHfOLs4McjwwBnoc3XmTTBx5tyK/uV3N8B
 drgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681191414; x=1683783414;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K+o6HFW7YIcoey1ju41Np2Ywz2uKMZkP6T0NrmrEWzk=;
 b=ctLqHhlnQacd63dzJPHuu1nEOaSWjTl9mfVqdAS6dLDH7otR4krip4Zk0+aAIJ9nE0
 rmnuNEYmxB/T3Tm5IU0RYbpNbErMth65qwejJ1hS8IyGDVWLRAGKyMKJZzkLHbJty7/h
 kjvCNLfE9fS18ZjH23nCaVurrw2COmwIeAfUY6dz8pzB0fd1UC99QHb89LPsFKwmnLpM
 dZbRE54WkrjuOXO+1XXGv7yQbELxiGI5+jGWbj2voI4UJ190mPh3brKD0hHZxxV9mikr
 mXT1CDmr9qwq+7+j9vG660IIB9zRqTX823Jgla5qQhO5KQeofpdnNtaGcupXnlVMht2c
 c4/Q==
X-Gm-Message-State: AAQBX9czlFLUvV4Z5WWI3+PMKiH4da/1baUrBgaHEt4n4aCuLIgydvSt
 tmA3sYB58OXrHhOe+PFhmcrvskpS0O+k31Mge8w=
X-Google-Smtp-Source: AKy350YOTo8tf19RBJ2IrjKHb/eiRPuhy5LL9J7AOlMzaFGmshI1RYrSbavgM9sLb6Dn00zOl6iC/805nG3EYUZ9ojE=
X-Received: by 2002:a05:6102:470c:b0:425:87ab:c386 with SMTP id
 ei12-20020a056102470c00b0042587abc386mr7345480vsb.3.1681191414162; Mon, 10
 Apr 2023 22:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <20230325105429.1142530-26-richard.henderson@linaro.org>
In-Reply-To: <20230325105429.1142530-26-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 15:36:28 +1000
Message-ID: <CAKmqyKO0Ab3EfbXGuV3FKJ0eqcVW8guMoZ8WirFF5tZ_VjPoqQ@mail.gmail.com>
Subject: Re: [PATCH v6 25/25] target/riscv: Reorg sum check in
 get_physical_address
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 05:36:58 -0000

On Sat, Mar 25, 2023 at 10:56=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Implement this by adjusting prot, which reduces the set of
> checks required.  This prevents exec to be set for U pages
> in MMUIdx_S_SUM.  While it had been technically incorrect,
> it did not manifest as a bug, because we will never attempt
> to execute from MMUIdx_S_SUM.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 725ca45106..7336d1273b 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -800,7 +800,7 @@ static int get_physical_address(CPURISCVState *env, h=
waddr *physical,
>      *ret_prot =3D 0;
>
>      hwaddr base;
> -    int levels, ptidxbits, ptesize, vm, sum, widened;
> +    int levels, ptidxbits, ptesize, vm, widened;
>
>      if (first_stage =3D=3D true) {
>          if (use_background) {
> @@ -831,7 +831,7 @@ static int get_physical_address(CPURISCVState *env, h=
waddr *physical,
>          }
>          widened =3D 2;
>      }
> -    sum =3D mmuidx_sum(mmu_idx);
> +
>      switch (vm) {
>      case VM_1_10_SV32:
>        levels =3D 2; ptidxbits =3D 10; ptesize =3D 4; break;
> @@ -999,15 +999,15 @@ restart:
>          prot |=3D PAGE_EXEC;
>      }
>
> -    if ((pte & PTE_U) &&
> -        ((mode !=3D PRV_U) && (!sum || access_type =3D=3D MMU_INST_FETCH=
))) {
> -        /*
> -         * User PTE flags when not U mode and mstatus.SUM is not set,
> -         * or the access type is an instruction fetch.
> -         */
> -        return TRANSLATE_FAIL;
> -    }
> -    if (!(pte & PTE_U) && (mode !=3D PRV_S)) {
> +    if (pte & PTE_U) {
> +        if (mode !=3D PRV_U) {
> +            if (!mmuidx_sum(mmu_idx)) {
> +                return TRANSLATE_FAIL;
> +            }
> +            /* SUM allows only read+write, not execute. */
> +            prot &=3D PAGE_READ | PAGE_WRITE;
> +        }
> +    } else if (mode !=3D PRV_S) {
>          /* Supervisor PTE flags when not S mode */
>          return TRANSLATE_FAIL;
>      }
> --
> 2.34.1
>
>

