Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6825DEB64DD
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 03:18:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qK9Jc-0000SO-80; Thu, 13 Jul 2023 23:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qK9JZ-0000S1-HH; Thu, 13 Jul 2023 23:17:54 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qK9JW-0006Hs-7W; Thu, 13 Jul 2023 23:17:51 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-56598263d1dso1002641eaf.0; 
 Thu, 13 Jul 2023 20:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689304668; x=1691896668;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yHiyVeyjOJZwlWpIEXgTboZekKC7/yCAyBaCXjwZ15E=;
 b=GrHn0V6zVVf4NV/4FutNUAoy9M0ViV9vsT//KG+EOGi7VkIpdbdN8uNMfVg5oOHenY
 w9azGcJeCkI4HeFdObtC3rKMgxCvsrlenK2qAS1yitScM3685OW1ryJHFDweEuKlOPnn
 2iF7jlhdw+KrybHb4hHCpZR7Lr2FWHwn2Se+4tw01SMsbiIGTi4yRI/JrcHEkpzv6W+m
 bj6qymY9Lzojsl6Qx49chHQGyilf3wI42ZuU+rk/Ov0Sa8Hz5LO0pZD8btknIlfRlcry
 CXgczV+MGWNYr8DvUULI7gWAfPmPgTRsTcOoZJ06//VrjTufzmaZtRvLz+LmhaMhVNVn
 vxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689304668; x=1691896668;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yHiyVeyjOJZwlWpIEXgTboZekKC7/yCAyBaCXjwZ15E=;
 b=HF+J2e+u5S36sP4bod3gXHNCOKZFEyXUcx9JbaXBfrQgaBSlZhwCnSViq1AGDpdScL
 LJoJJ/r9pXUEkm7eliS/ZBc8FKuqt2XMYWTKq6oIovmh1QpcLPF8qjVWovb0JwX6s8R8
 Wa+RNH8A+IaEjYZV4mbQ+uTWU3q9jtJeBDTEXBhhckoN4CdK3xUmKWtlOzE/BAVOArSM
 AzQ9eao8uEeF/jVs61gU8ZF49cm0P878xCaDzVMq11r3Y7sNVi8JM1WO+Da5k4cSGKyW
 AHkgRibdhGyIfbE1vvFfe2fpUji2HaiD7pmNdQSFwnV0p2uyEl1tFP6IUtAtq0ciqVxd
 vNPA==
X-Gm-Message-State: ABy/qLb4nX7LMxoeSZP0wtA2/zXh7SlFZfVThInJkXmXivQSRfxL8djH
 LziSppYGPGSuN4xvRvoQ8y/1faXayaT25LFx+hE=
X-Google-Smtp-Source: APBJJlE3MZjNLn/37dDCxLSQve1aIx+929R1vC+Ld+W1pps/ArvhCTE4rgt8WRfH8geWJcDQC1JTxMtDYG08NIQChi4=
X-Received: by 2002:a05:6358:c07:b0:134:f0c7:90ae with SMTP id
 f7-20020a0563580c0700b00134f0c790aemr4355443rwj.5.1689304668442; Thu, 13 Jul
 2023 20:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230711121453.59138-1-philmd@linaro.org>
 <20230711121453.59138-7-philmd@linaro.org>
In-Reply-To: <20230711121453.59138-7-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 14 Jul 2023 13:17:22 +1000
Message-ID: <CAKmqyKOBMzOvxMhzxUB62XpmuE3ckmy1=DDd1WfmGTKe-n75jg@mail.gmail.com>
Subject: Re: [PATCH v3 06/16] target/riscv: Restrict riscv_cpu_do_interrupt()
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=alistair23@gmail.com; helo=mail-oo1-xc31.google.com
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

On Tue, Jul 11, 2023 at 10:20=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> riscv_cpu_do_interrupt() is not reachable on user emulation.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h        | 5 +++--
>  target/riscv/cpu_helper.c | 7 ++-----
>  2 files changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index dba78db644..0602b948d4 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -416,7 +416,6 @@ extern const char * const riscv_int_regnamesh[];
>  extern const char * const riscv_fpr_regnames[];
>
>  const char *riscv_cpu_get_trap_name(target_ulong cause, bool async);
> -void riscv_cpu_do_interrupt(CPUState *cpu);
>  int riscv_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
>                                 int cpuid, DumpState *s);
>  int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
> @@ -449,6 +448,7 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu,=
 Error **errp);
>  #define cpu_mmu_index riscv_cpu_mmu_index
>
>  #ifndef CONFIG_USER_ONLY
> +void riscv_cpu_do_interrupt(CPUState *cpu);
>  void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
>                                       vaddr addr, unsigned size,
>                                       MMUAccessType access_type,
> @@ -472,7 +472,8 @@ void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env=
, uint32_t priv,
>                                     void *rmw_fn_arg);
>
>  RISCVException smstateen_acc_ok(CPURISCVState *env, int index, uint64_t =
bit);
> -#endif
> +#endif /* !CONFIG_USER_ONLY */
> +
>  void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
>
>  void riscv_translate_init(void);
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 0adde26321..597c47bc56 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1579,7 +1579,6 @@ static target_ulong riscv_transformed_insn(CPURISCV=
State *env,
>
>      return xinsn;
>  }
> -#endif /* !CONFIG_USER_ONLY */
>
>  /*
>   * Handle Traps
> @@ -1589,8 +1588,6 @@ static target_ulong riscv_transformed_insn(CPURISCV=
State *env,
>   */
>  void riscv_cpu_do_interrupt(CPUState *cs)
>  {
> -#if !defined(CONFIG_USER_ONLY)
> -
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>      CPURISCVState *env =3D &cpu->env;
>      bool write_gva =3D false;
> @@ -1783,6 +1780,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>
>      env->two_stage_lookup =3D false;
>      env->two_stage_indirect_lookup =3D false;
> -#endif
> -    cs->exception_index =3D RISCV_EXCP_NONE; /* mark handled to qemu */
>  }
> +
> +#endif /* !CONFIG_USER_ONLY */
> --
> 2.38.1
>
>

