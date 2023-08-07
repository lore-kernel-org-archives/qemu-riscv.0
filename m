Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7371C00528
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 16:35:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qT3Bw-0004iV-85; Mon, 07 Aug 2023 12:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1qT3Bu-0004i9-Eo
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 12:34:46 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1qT3Bs-00020y-N0
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 12:34:46 -0400
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b9aa1d3029so75127021fa.2
 for <qemu-riscv@nongnu.org>; Mon, 07 Aug 2023 09:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google; t=1691426082; x=1692030882;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XHxvjnBSRxLQr68jdsdbnmVlyaK76zQk0tdd09tcceM=;
 b=kvnx8gXVTxu+tgPq+HmnQZcFh/kZCUoPqwvhrdZu+fgxx9zXUKS6ZKQT+InQ+I44qQ
 q389rVe7ulvQC7qSBBMNUOvEb6wTzTAJGxA7zG3LciDFcLtgUriqb/XpYCwjy0U6zwX7
 NoxSbRt+eJcwA1Yvd81iEiIDHMv8KTU42aYqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691426082; x=1692030882;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XHxvjnBSRxLQr68jdsdbnmVlyaK76zQk0tdd09tcceM=;
 b=BvNovIRlaZUehHcGEwB0fIsV6PtYWtRoZpX5OIW2K3lfR47rChYLvJYMaCHDiyoM+k
 xfnGZRXgCcE4oJ0ZtwYKh0+D2HobDYmURgzbmKlhTDAlAnwvTaeKpsjSPKy8Lfbk4ZsV
 Cc3vTsYMq8LYhQmz0MAdy3aWHy8O15qsJHyExZCYKm6Hj7bfxDnAR+eC937sb9DniQFF
 4yyo82yNMgPDBUHRWxJZdChRd/q2Pn5tSRZknz6ZMlLgpqgFr+/NloEjNzOwUoe2KRSm
 yLRZ9EasavbK/dzT22z/qWOb37q9ht3QjCikZw2kIvgfiQTViFKPj54HwpS5kJ502aGV
 Q2gg==
X-Gm-Message-State: AOJu0YxMbcZJgsSEEKqYo8yhJyN3yFnt7CQ1TNSOXq3ilm+W/RBDfvjF
 zXbhxVNjpdxspU3cX1aQYo+SSINP0Yw6FnBM7dzT
X-Google-Smtp-Source: AGHT+IG47KrvJKbopwyIeA/dLPn5F6IYNA/uFCicSCJmT/DGOHGR+z7CTBq67Zz3PLrbdR23khOYn7ZEYz8Lr3ey+Lc=
X-Received: by 2002:a2e:9bc3:0:b0:2b9:ba02:436c with SMTP id
 w3-20020a2e9bc3000000b002b9ba02436cmr6282035ljj.28.1691426082025; Mon, 07 Aug
 2023 09:34:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230802124906.24197-1-rbradford@rivosinc.com>
In-Reply-To: <20230802124906.24197-1-rbradford@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 7 Aug 2023 09:34:31 -0700
Message-ID: <CAOnJCUKeOQgajDX06SYsZmiFiHLhrEQ73CAfGXoRe5szeBtO2A@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Implement WARL behaviour for
 mcountinhibit/mcounteren
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=atishp@atishpatra.org; helo=mail-lj1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Aug 2, 2023 at 5:50=E2=80=AFAM Rob Bradford <rbradford@rivosinc.com=
> wrote:
>
> These are WARL fields - zero out the bits for unavailable counters and
> special case the TM bit in mcountinhibit which is hardwired to zero.
> This patch achieves this by modifying the value written so that any use
> of the field will see the correctly masked bits.
>
> Tested by modifying OpenSBI to write max value to these CSRs and upon
> subsequent read the appropriate number of bits for number of PMUs is
> enabled and the TM bit is zero in mcountinhibit.
>
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> ---
>  target/riscv/csr.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index ea7585329e..495ff6a9c2 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1834,8 +1834,11 @@ static RISCVException write_mcountinhibit(CPURISCV=
State *env, int csrno,
>  {
>      int cidx;
>      PMUCTRState *counter;
> +    RISCVCPU *cpu =3D env_archcpu(env);
>
> -    env->mcountinhibit =3D val;
> +    /* WARL register - disable unavailable counters; TM bit is always 0 =
*/
> +    env->mcountinhibit =3D
> +        val & (cpu->pmu_avail_ctrs | COUNTEREN_CY | COUNTEREN_IR);
>
>      /* Check if any other counter is also monitoring cycles/instructions=
 */
>      for (cidx =3D 0; cidx < RV_MAX_MHPMCOUNTERS; cidx++) {
> @@ -1858,7 +1861,11 @@ static RISCVException read_mcounteren(CPURISCVStat=
e *env, int csrno,
>  static RISCVException write_mcounteren(CPURISCVState *env, int csrno,
>                                         target_ulong val)
>  {
> -    env->mcounteren =3D val;
> +    RISCVCPU *cpu =3D env_archcpu(env);
> +
> +    /* WARL register - disable unavailable counters */
> +    env->mcounteren =3D val & (cpu->pmu_avail_ctrs | COUNTEREN_CY | COUN=
TEREN_TM |
> +                             COUNTEREN_IR);
>      return RISCV_EXCP_NONE;
>  }
>
> --
> 2.41.0
>
>

LGTM.
Reviewed-by: Atish Patra <atishp@rivosinc.com>
--=20
Regards,
Atish

