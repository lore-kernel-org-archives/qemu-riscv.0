Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06751CD8CA8
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 03:48:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZKmJ-0001Ua-4O; Mon, 15 Jun 2026 23:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZKmH-0001U5-Je
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 23:47:53 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZKmF-0001c4-QH
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 23:47:53 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-69155ca09d8so4411553a12.3
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 20:47:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781581670; cv=none;
 d=google.com; s=arc-20240605;
 b=gzi/dQ10IqKZk462WjtXg9RxlXTD7OU+MsmsZSHnHXRyfcd42UJq3Hp0XknsXmc4S5
 qF4FIHPf9U4a4xDm2PP/zWGj7dApojxsIWcXTG+OFCXes9rQWsrFy+Eoes400ixh/o7K
 +57lm1ftZe4peSxDaBWqwVZwOm9hOD39fa+dfwObeg86usBvvARx7D0sxh7SFuWNl+de
 fVmkr5N4t+mZpTO3sJPp+5M5FeFWA35Lhw+LA/STXj92SWMX1SRFBChl8NS+Ehxu6LTU
 A4xaqXudRUBZv0Dxa7c32BjXQWVT24HnQi4ZgcZd0aT0lx/VOnxTUAqHerZ8P/ypmkMq
 wcFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=yOh4CeSqtj/dXF33YNZ875SwYCJfUmho3ewVKm2kM+M=;
 fh=i37x9DjMWwtKaOkqcO9ElkErcZm4q6LqiJgAHNfIw00=;
 b=XRJhKUnsN5cFKPBKmkzQNXMgUeLZeMinKoVTzVABgeETjQ1aKf37+685PoxNMzlreu
 wJxZ/MwkSwnwfBFCSJFiOkhSQyuG44KXdhW9VCJhWJLCaT9OnRLyWGmbu8DF691fV7du
 zYuPaDewCPUyx4a7X80Woeap4DULUNnmlJgVadEqL4gahAhHpiB3yzw5BCX3PB0wUy1+
 S8hsS9qkT734If25tCBF/6ODKdNpYtrO0IciubHz9Bn3irp9FsnimqzPbV4iyroifCTq
 f00uGaWITN/63nEXzdxrdzDQO4fnxRbh2FVqhYUMvPAUPulBuWTFK7p9MAdQjZnYGAbH
 LvfQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781581670; x=1782186470; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yOh4CeSqtj/dXF33YNZ875SwYCJfUmho3ewVKm2kM+M=;
 b=XRIz3iVRWF5IN+QpfZeCW+HqqEkWWKCvLta+xjN1hnLH9PH7ddug1NkM0rL2VXyi3Z
 v1YW0Q3J1NtlC0KRme2VXzjRDOYY+GSKbJ6TlcH8Y/fVoYT3q6wAlV88UfpAAD6gh7UZ
 VFBQTMrPy/HeGPg/ILyp7qkOXAmrd1x5Du7DAA72Mdy4nq76sZhcw/CHcgSIXabfURzv
 eYmwPXa3jmb4Do9B/mFuNegA+iZHtj5dW2vhh0hEgiURVaOYZ9kIV/2MNsnVqEaWBJug
 sa2EumKUGlj5hyi39jATULWdFkFGpFSWTUzNmeoHzZMjes80A+FKFuZiKUpXPNZ3/RLO
 RnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781581670; x=1782186470;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yOh4CeSqtj/dXF33YNZ875SwYCJfUmho3ewVKm2kM+M=;
 b=cDPXatod8YmWWygTiLqH1FYxVfzqPxM9D1IBYlDqdv9DuQVhCH7Mgbw2pQRljfTnkU
 yOLpTibsThfGiPB+IkPqawRBlCUiUZtLkkunV5/24wBEp2wril+XhMwLRFS2Ap2okpfG
 MAjWCtx0Lw34W9DCb71zVdRjshqsAYY0qQ1P+IwbfgI4sHb70GFfnihLOf1bbCW3LuzM
 Rwy4vpxwNXV9mtdDiQH8xsZuo3DNcuI3C2CDnQi66DjaDgW0Ozw2EI3uIoubYbNjRd3V
 SS+ezg9SCrDciqkVmFhLC0aUK0H6fzSeimYK3HsNQcJI+tloMqcTmNsI6dCRBnNszJLl
 ephw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9a3Qo/vsz9jrgN+VQFMl/yjQVWNPqZQkAkNNG9mRc5iFR5GnBppBnRnMbNrwAqJBKGQdxWeDwh+IgG@nongnu.org
X-Gm-Message-State: AOJu0YzezEiTOGImqCKmEUdNEz3t2+mpnYjjc6WyEC4zeAow/8wRLZLd
 WcRXgRqQpB+6SADJLsj69PRYeyAfLE5GxpP0D6cFAPojPQXOtEu/nEkLC1DmMBQ/Zh7mA//61yV
 icqwjF7yb/xbDWzdA0xZPbatqgA8zJzk=
X-Gm-Gg: Acq92OHhJ5SByV9+hB0/rbgLy6djAvRmqRFPLE26RLmwcQkv74opU1huxmEYwlKzcPW
 DvTBKZx+B+dUJbniRyMiBDisOA9cAvO+W6hndeu4oOVRl+9d3YRG8IrwbsQqUNYDjASZQl/29gO
 rKaQRtY1nToaqqENVHp/qWZMoHE2sSCPQKPyUXGqm5ouilrbeUc5fnQyrCGNiRK/4DfCM8agFyL
 Pva18wJf6uMj9kwE/ON6JfRYHyzG93oS97jedN1b3mUFbcS6TUmnLDLk6cYye6prXIJMp95th80
 7kYU4Hab4NwJ3pBUtt2peiMKAR28VI9R0p2MzQ==
X-Received: by 2002:a05:6402:4282:b0:693:a399:6e10 with SMTP id
 4fb4d7f45d1cf-695086ecea0mr863236a12.10.1781581670145; Mon, 15 Jun 2026
 20:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260611123412.2135600-1-daniel.barboza@oss.qualcomm.com>
 <20260611123412.2135600-4-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260611123412.2135600-4-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Jun 2026 13:47:22 +1000
X-Gm-Features: AVVi8CdQqIOS6RxXLh17Fk7_sjrw3XkYb6uJGVxknYUl4QHmgrqnwIOatmbNFdM
Message-ID: <CAKmqyKOewcpiev62v6wpwjmZ9HVUX2eEGRRyeivQp=iGR4wz6w@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] target/riscv: add 'num-triggers' debug property
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 philmd@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x529.google.com
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

On Thu, Jun 11, 2026 at 10:35=E2=80=AFPM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> All CPUs have the same amount of triggers: 2 triggers per hart, set via
> RV_MAX_TRIGGERS.  This is not enough anymore: we'll have at least one
> future CPU that will demand more triggers per hart when implementing the
> RISC-V Server Ref Platform, requiring at least 11 triggers per hart.
>
> Parametrize the trigger amount using a new 'num_triggers' property.  The
> default amount is kept at 2 for backwards compatibility.  The new
> maximum is bumped to a generous 1024 triggers per hart, which hopefully
> will be enough for the foreseeable future.
>
> The property can be set in two ways:
>
> - a '.num_triggers' CPU definition flag, allowing CPUs to set a custom
>   amount inside the CPU def in DEFINE_RISCV_CPU();
> - a new 'num-triggers' user property.  The user property has a higher
>   priority than an existing '.num_triggers' CPU def setting.
>
> Assuming a hypothetical case where a CPU 'X' is defined with
> '.num_triggers =3D 8':
>
> - -cpu X,num-triggers=3D30 =3D> num_triggers set to 30
> - -cpu X (...)           =3D> num_triggers set to 8
>
> For a CPU that doesn't set '.num_triggers':
>
> - -cpu rv64,num-triggers=3D30 =3D> num_triggers set to 30
> - -cpu rv64 (...)           =3D> num_triggers set to 2
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c   | 11 +++++++++++
>  target/riscv/cpu.h   | 19 ++++++++++++++++++-
>  target/riscv/debug.c | 16 ++++++++--------
>  3 files changed, 37 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b20271a220..6d8f9ad3a6 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1167,6 +1167,11 @@ static void riscv_cpu_init(Object *obj)
>                        IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
>      qdev_init_gpio_in_named(DEVICE(cpu), riscv_cpu_set_nmi,
>                              "riscv.cpu.rnmi", RNMI_MAX);
> +
> +    if (mcc->def->num_triggers) {
> +        env->num_triggers =3D mcc->def->num_triggers;
> +    }
> +
>  #endif /* CONFIG_USER_ONLY */
>
>      general_user_opts =3D g_hash_table_new(g_str_hash, g_str_equal);
> @@ -2619,6 +2624,8 @@ static const Property riscv_cpu_properties[] =3D {
>                         DEFAULT_RNMI_IRQVEC),
>      DEFINE_PROP_UINT64("rnmi-exception-vector", RISCVCPU, env.rnmi_excpv=
ec,
>                         DEFAULT_RNMI_EXCPVEC),
> +    DEFINE_PROP_UINT32("num-triggers", RISCVCPU, env.num_triggers,
> +                       RV_DEFAULT_NUM_TRIGGERS),
>  #endif
>
>      DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string,=
 false),
> @@ -2764,6 +2771,10 @@ static void riscv_cpu_class_base_init(ObjectClass =
*c, const void *data)
>                  !valid_vm_1_10_32[mcc->def->cfg.max_satp_mode]) {
>                  mcc->def->cfg.max_satp_mode =3D VM_1_10_SV32;
>              }
> +
> +            if (def->num_triggers) {
> +                mcc->def->num_triggers =3D def->num_triggers;
> +            }
>  #endif
>          }
>          if (def->priv_spec !=3D RISCV_PROFILE_ATTR_UNUSED) {
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index ea92e2c68c..38f02a9dc7 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -189,7 +189,22 @@ extern RISCVCPUImpliedExtsRule *riscv_multi_ext_impl=
ied_rules[];
>  #define RV_VLEN_MAX 1024
>  #define RV_MAX_MHPMEVENTS 32
>  #define RV_MAX_MHPMCOUNTERS 32
> -#define RV_MAX_TRIGGERS 2
> +
> +/*
> + * The Debug 1.0 spec allows a humongous amount of triggers.  Section
> + * "Enumeration" says: "The above algorithm reads back tselect so that
> + * implementations which have 2^n triggers only need to implement n
> + * bits of tselect.".  tselect can have up to XLEN bits, so the max
> + * theoretical RV_MAX_TRIGGERS value is 2^XLEN.
> + *
> + * Allowing 2^XLEN triggers per hart is silly so we'll set a max to a
> + * modest 1024 triggers, which is way more than what we see current
> + * hardware use (most chips uses 2-4 triggers per hart, RISC-V Server
> + * Ref requires at least 11).  With a 1024 max per hart we'll be set
> + * for a long time ... hopefully.
> + */
> +#define RV_MAX_TRIGGERS 1024
> +#define RV_DEFAULT_NUM_TRIGGERS 2
>
>  FIELD(VTYPE, VLMUL, 0, 3)
>  FIELD(VTYPE, VSEW, 3, 3)
> @@ -576,6 +591,8 @@ typedef struct RISCVCPUDef {
>      RISCVCPUConfig cfg;
>      bool bare;
>      const RISCVCSR *custom_csrs;
> +    /* This is just a setter for env->num_triggers.  */
> +    uint32_t num_triggers;
>  } RISCVCPUDef;
>
>  /**
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 9a4910c431..ba5bc6ae13 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -26,6 +26,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
>  #include "qapi/error.h"
> +#include "qemu/error-report.h"
>  #include "cpu.h"
>  #include "target/riscv/debug.h"
>  #include "trace.h"
> @@ -1049,14 +1050,13 @@ void riscv_trigger_realize(CPURISCVState *env)
>  {
>      int i;
>
> -    /*
> -     * Alloc env->tdata1/2/3, cpu_breakpoint, cpu_watchpoint and
> -     * itrigger_timer dynamically.  This is overkill now
> -     * given that they could be static arrays with RV_MAX_TRIGGERS
> -     * but we'll parametrize the trigger number later, i.e. the
> -     * array length won't be static.
> -     */
> -    env->num_triggers =3D RV_MAX_TRIGGERS;
> +    if (env->num_triggers > RV_MAX_TRIGGERS) {
> +        error_report(
> +                "Invalid configuration: 'num-triggers' must be less than=
 %u",
> +                RV_MAX_TRIGGERS);
> +        exit(1);
> +    }
> +
>      env->tdata1 =3D g_new0(uint64_t, env->num_triggers);
>      env->tdata2 =3D g_new0(uint64_t, env->num_triggers);
>      env->tdata3 =3D g_new0(uint64_t, env->num_triggers);
> --
> 2.43.0
>
>

