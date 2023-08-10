Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2679C001B0
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 17:07:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qU98R-0001aw-FD; Thu, 10 Aug 2023 13:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU98P-0001a6-NH; Thu, 10 Aug 2023 13:07:41 -0400
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU98M-0006P8-BY; Thu, 10 Aug 2023 13:07:41 -0400
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-48713d11531so733375e0c.1; 
 Thu, 10 Aug 2023 10:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691687257; x=1692292057;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bXNlGR7lWmbb3UExCZW38tnFqs9sBXHoQ8GbAEMXKbA=;
 b=TlqP0MM7fa0QZ4WAwnxUJdGtqW3tu+EC3phcWH9vpphfctWVZeLHdWnBeaSu6TXccn
 0Zqj0/3RCC5a0lvOlSfKpEbu8rUAut7Gs8YXm147XeViz5zU7K9GyI+Mqsl8nQkYh8zm
 xv/S78wM4U/tbT81oouOmoTo6ntMCJeDWH0loTFfRkmO6DSIb5C11l81uLI6JTY3yb33
 Mj2uo7NS6C0UsksDEnDRVXT15DxDE78UIjv9OdtVgwZJ7iSEqJkqv/5K58MRKeA9db/I
 eX7fF9RCOwkrf1V5o7iWK23j13AcDYwygqli6F8BBYkPkBXe5/4IdngemhBnL7Dn3f27
 ffFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691687257; x=1692292057;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bXNlGR7lWmbb3UExCZW38tnFqs9sBXHoQ8GbAEMXKbA=;
 b=UeUpmTxww867jM4tzR/oMoESqNb3e3XA8VCYHYbVCMMRs7ifv30yT+qzJz8dyMXYYi
 G0tdvwSKiF1//Zxn0NlyRGIbxBB6OdEB+jK3hMsg0FmFL5W8l4Zmg+dk60cT+iNRa/9n
 h3byOAw2tkultu4Y2YdhxYhbHEEtuS7C/gxdsDA6LtoWnrvauWVC54Co7fu7EeiXZLKn
 smKnWv1prfMQTs6+EmZIukd0k8Hi335cuf1SPaG8msXiy4W18XAurZ4iRfInLvfxc9tE
 oPgL3zZyCLj44K8FqlD/eI3+zWh6erXpvzCCx+a+dybF+xd48ATof2bapZMPcCE3EhqF
 zgwg==
X-Gm-Message-State: AOJu0YzmjcJadABgYj865FJrorqTF72jYDUVB3lqz71AfQsqsAeUpTEa
 IRtVIEldgYa4+r/1qxOrFDfMU8kvcvWvZmllOVI=
X-Google-Smtp-Source: AGHT+IGdh0cxVPJcpigi4tioVFvJW20neOwgXu13dBbKfd4Ujlvy6To/iwmK53yqj3XTicAG72QoqhJONLw1wM2WCFc=
X-Received: by 2002:a1f:c114:0:b0:486:4cb9:944f with SMTP id
 r20-20020a1fc114000000b004864cb9944fmr1877183vkf.1.1691687256920; Thu, 10 Aug
 2023 10:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230802124906.24197-1-rbradford@rivosinc.com>
In-Reply-To: <20230802124906.24197-1-rbradford@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Aug 2023 13:07:11 -0400
Message-ID: <CAKmqyKMDb2RAoafBXD5HjL5WEQK1vFrwYdHA3cufCPzFDtoQVw@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2b.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Aug 2, 2023 at 8:50=E2=80=AFAM Rob Bradford <rbradford@rivosinc.com=
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

Thanks!

Applied to riscv-to-apply.next

Alistair

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

