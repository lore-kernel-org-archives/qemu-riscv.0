Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l9vqN-0001dO-N2
	for mharc-qemu-riscv@gnu.org; Wed, 10 Feb 2021 15:12:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l9vqM-0001dB-Uj; Wed, 10 Feb 2021 15:12:11 -0500
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:36328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l9vqL-0005lT-Ak; Wed, 10 Feb 2021 15:12:10 -0500
Received: by mail-io1-xd2a.google.com with SMTP id n14so3305363iog.3;
 Wed, 10 Feb 2021 12:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iXgAGDrw7h+X4167ezwt6feddLP5tbfxLED+0qa5Ay4=;
 b=AW2RhryR9IL3Wo71JpSzNP/lL29jGfBkHTlj9Hl+kkw209pHsC0Cf9bKaIwjxIEbiC
 xz4Y21ZIxxV/0xxWrFteAKJviXH0KbZn6DkxaPP7sDZpjcDCAohGZFH/LgeSXh76AKV5
 Bs3G36bwephryRiYO2GcGimQFxzn0F7QAe/e3drYL2VSSPlt5U5AAWgK/AbvHXpWLU4c
 CoQCWZduWdmBoAWZl6Ngm5NkBGDqEpkwOYslNfF3NYSRppA4Qq50LH/gX6Mhrk/ndpm4
 PQlZCKo+RK4YQGsXHhnfI30LkOIsF78l/qjNxx1joHGoh3CYuTEpGEE+CHe1mRQURcXW
 Ho8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iXgAGDrw7h+X4167ezwt6feddLP5tbfxLED+0qa5Ay4=;
 b=i5Kr/9eO+TjOk/jmtKo8svJAyUtsuzbsqcO3Wua04GN/jtHORsFHwpA2Sw4A9Gasxm
 C7TaNTCLJgx8EgRTDIAhvXnm7EhIZOebOd2W6Dk9X3jEEc/o++HBzeCRHDoxRAWIRLQa
 2KtrGChHiWmNr/Xlmf1ucaTWhm0u4REqb5f783QN5VdOJ5vQ0/3a84NqDz/mMbyiJmtn
 l+83YtWucKauYiEiYbMEMSJhA4F4WRLwWgntri/i2Brd8sOoXmzgl6Adp1MrclocpUkz
 rIAIvolYbxZBYdJgO2aaRtPau0IAJu4mp88x4LOA5iSXMkdE6jANSjSVbTllPsPPbPfK
 L5Dw==
X-Gm-Message-State: AOAM531iaY5T57HMIOcKizU1nxsXEoDSuTGjuZSivT1PBtShTshtrGaX
 Y2vWqIGk6saNz5qmpIiyJpIfyT9o1s9AXEwed4E=
X-Google-Smtp-Source: ABdhPJzc4M7fOrPgyqfF3le+/pleCvs/OmpYaQMYUN2Ya+DJ3elPIZP+EShNZPgwJ/uJjCKw3aGGRMC8TfSVQXTz5xs=
X-Received: by 2002:a05:6638:6b2:: with SMTP id
 d18mr5081917jad.26.1612987927440; 
 Wed, 10 Feb 2021 12:12:07 -0800 (PST)
MIME-Version: 1.0
References: <20200811002325.46056-1-weiying_hou@outlook.com>
 <SG2PR02MB26348FDC30678B3177B5CF3893450@SG2PR02MB2634.apcprd02.prod.outlook.com>
In-Reply-To: <SG2PR02MB26348FDC30678B3177B5CF3893450@SG2PR02MB2634.apcprd02.prod.outlook.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 10 Feb 2021 12:11:32 -0800
Message-ID: <CAKmqyKPyGwKsFB-ArHLZQAN0yeVaiH2uJT3d5MSnO8o0Tna8kw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] Add ePMP CSR accesses
To: Hou Weiying <weiying_hou@outlook.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Hongzheng-Li <Ethan.Lee.QNL@gmail.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Myriad-Dreamin <camiyoru@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
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
X-List-Received-Date: Wed, 10 Feb 2021 20:12:11 -0000

On Mon, Aug 10, 2020 at 5:24 PM Hou Weiying <weiying_hou@outlook.com> wrote:
>
> Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
> Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
> Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>
> ---
>  target/riscv/csr.c | 18 ++++++++++++++++++
>  target/riscv/pmp.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 58 insertions(+)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 6a96a01b1c..0bb33baec3 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -104,6 +104,11 @@ static int hmode(CPURISCVState *env, int csrno)
>      return -1;
>  }
>
> +static int epmp(CPURISCVState *env, int csrno)
> +{
> +    return -!(env->priv == PRV_M && riscv_feature(env, RISCV_FEATURE_EPMP));

RISCV_FEATURE_EPMP isn't defined yet, so this fails to compile.

Alistair

> +}
> +
>  static int pmp(CPURISCVState *env, int csrno)
>  {
>      return -!riscv_feature(env, RISCV_FEATURE_PMP);
> @@ -1142,6 +1147,18 @@ static int write_pmpaddr(CPURISCVState *env, int csrno, target_ulong val)
>      return 0;
>  }
>
> +static int read_mseccfg(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = mseccfg_csr_read(env);
> +    return 0;
> +}
> +
> +static int write_mseccfg(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    mseccfg_csr_write(env, val);
> +    return 0;
> +}
> +
>  #endif
>
>  /*
> @@ -1353,6 +1370,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MTINST] =              { hmode,   read_mtinst,      write_mtinst     },
>
>      /* Physical Memory Protection */
> +    [CSR_MSECCFG] =             { epmp,    read_mseccfg,     write_mseccfg    },
>      [CSR_PMPCFG0  ... CSR_PMPCFG3]   = { pmp,   read_pmpcfg,  write_pmpcfg   },
>      [CSR_PMPADDR0 ... CSR_PMPADDR15] = { pmp,   read_pmpaddr, write_pmpaddr  },
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index b1fa703aff..97aab0b99e 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -494,3 +494,43 @@ target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index)
>
>      return val;
>  }
> +
> +
> +/*
> + * Handle a write to a mseccfg CSR
> + */
> +void mseccfg_csr_write(CPURISCVState *env, target_ulong val)
> +{
> +    int i;
> +
> +    if (!MSECCFG_RLB_ISSET(env)) {
> +        for (i = 0; i < MAX_RISCV_PMPS; i++) {
> +            if (pmp_is_locked(env, i)) {
> +                /*
> +                 * Now that mseccfg.rlb is zero
> +                 * the value of mseccfg.rlb should be locked.
> +                 */
> +                val &= ~MSECCFG_RLB;
> +                break;
> +            }
> +        }
> +    }
> +
> +    /*
> +     * sticky bit
> +     */
> +    val |= (env->mseccfg & (MSECCFG_MMWP | MSECCFG_MML));
> +
> +    env->mseccfg = val;
> +    trace_mseccfg_csr_write(env->mhartid, val);
> +}
> +
> +
> +/*
> + * Handle a read from a mseccfg CSR
> + */
> +target_ulong mseccfg_csr_read(CPURISCVState *env)
> +{
> +    trace_mseccfg_csr_read(env->mhartid, env->mseccfg);
> +    return env->mseccfg;
> +}
> --
> 2.20.1
>
>

