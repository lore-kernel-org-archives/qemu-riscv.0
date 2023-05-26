Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA7AC7EE29
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 01:11:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2Lyb-0000jI-R5; Thu, 25 May 2023 21:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2LyW-0000ge-8U; Thu, 25 May 2023 21:10:36 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2LyT-0002FU-LL; Thu, 25 May 2023 21:10:35 -0400
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-783e5c64d29so262495241.1; 
 Thu, 25 May 2023 18:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685063432; x=1687655432;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=umRYhW7bvIWuWqlKLrvunYyCF9mG5TW90kKyc7vM1d4=;
 b=XnjqkD/l0gwQwHGR5b/aSsBypj3gySAu3wzT8QdQdHEI6G8NbmDtL5TEPO0eaIMXiB
 wITavClLZTTu+ozN56iSEgVMuODTd2rN6ctX9bwDRQv5+BzGQD1bbWws8iS/XkVf8AX/
 7LKYp9x5OBnMkiMgi8fNxAdvET0a3y3adw86lfAZTTRdSalo8tOf2zlrzlzievO8aEcY
 J1LgSfjYWX8+Hdkr58e/eXBnqUrbP9KgBfeCkAN6FM1hDUlNtHohFIA6zmvquC9LkeEA
 j57kS6AKZzE/XJd9tYmFkdqZzfTj7VTa1M2+w8faROaOnnfhHUQJQPMW8Uwt7qbOZ29f
 7iWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685063432; x=1687655432;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=umRYhW7bvIWuWqlKLrvunYyCF9mG5TW90kKyc7vM1d4=;
 b=NHaT2iaAQnmdCkUGXQ3nrIOWHrDiiet+bYh2CBTgu/aeK0givZVkBq24c+pKbnwYEs
 eJSRXD62K4bCvD8yUDE+qcZ5vlSTjSP06AkB+TT8soNCnvv0uzZPX+O8Ybae+mK+6GYW
 6q5OArqz2MCOBC+end+4Tpq3brKWZPvWOmEoEdjNiGvOhVtQNZJyVVkzCB2vk2fVyLDw
 Wbe1ZwIRjDNtr/lYN8oXbml7v7Dvn5GNaIwDEWGTuMSMzy6OfkA/TMSK742TfDwpUp6s
 xeEmvtKPJz8sw34ZCPN+q9mvnTc/WfOQ2xzoSoNpBEKx0/EzIn2RK0ZQitikt5qgQuuB
 ZT1w==
X-Gm-Message-State: AC+VfDz++8ACxXS+nBfpDGvf36RUhOZAMMR9vm00ppu4yV4Sn5ZE/grY
 X5kjao7Qs2+NWVvtOlg06ZGH5D1fUKW20wKrGS8=
X-Google-Smtp-Source: ACHHUZ5uVy80h5Q3WYwvEj7QU/RT7xCb7JZ8aYju7XnYAGwebLKnJ/unxNi/Bjti757Q3aSlFWiIip6tSKcyVF4hW2Y=
X-Received: by 2002:a05:6102:3391:b0:439:3e26:990e with SMTP id
 i17-20020a056102339100b004393e26990emr1794560vsh.6.1685063431762; Thu, 25 May
 2023 18:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230518175058.2772506-1-mchitale@ventanamicro.com>
 <20230518175058.2772506-2-mchitale@ventanamicro.com>
In-Reply-To: <20230518175058.2772506-2-mchitale@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 May 2023 11:10:05 +1000
Message-ID: <CAKmqyKOGuVo5iDPZ-PyJ0z7EVTo5yhFnqR=E4+qOT0Dsiz58ig@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] target/riscv: smstateen check for fcsr
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x933.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, May 19, 2023 at 3:51=E2=80=AFAM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> Implement the s/h/mstateen.fcsr bit as defined in the smstateen spec
> and check for it when accessing the fcsr register and its fields.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 4451bd1263..3f6b824bd2 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -82,6 +82,10 @@ static RISCVException fs(CPURISCVState *env, int csrno=
)
>          !riscv_cpu_cfg(env)->ext_zfinx) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
> +
> +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> +        return smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR);
> +    }
>  #endif
>      return RISCV_EXCP_NONE;
>  }
> @@ -2100,6 +2104,9 @@ static RISCVException write_mstateen0(CPURISCVState=
 *env, int csrno,
>                                        target_ulong new_val)
>  {
>      uint64_t wr_mask =3D SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |=3D SMSTATEEN0_FCSR;
> +    }
>
>      return write_mstateen(env, csrno, wr_mask, new_val);
>  }
> @@ -2173,6 +2180,10 @@ static RISCVException write_hstateen0(CPURISCVStat=
e *env, int csrno,
>  {
>      uint64_t wr_mask =3D SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |=3D SMSTATEEN0_FCSR;
> +    }
> +
>      return write_hstateen(env, csrno, wr_mask, new_val);
>  }
>
> @@ -2259,6 +2270,10 @@ static RISCVException write_sstateen0(CPURISCVStat=
e *env, int csrno,
>  {
>      uint64_t wr_mask =3D SMSTATEEN_STATEEN | SMSTATEEN0_HSENVCFG;
>
> +    if (!riscv_has_ext(env, RVF)) {
> +        wr_mask |=3D SMSTATEEN0_FCSR;
> +    }
> +
>      return write_sstateen(env, csrno, wr_mask, new_val);
>  }
>
> --
> 2.34.1
>

