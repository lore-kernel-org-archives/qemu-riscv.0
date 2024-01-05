Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5195C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 04:55:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLcEE-0001mf-7g; Thu, 04 Jan 2024 23:54:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLcED-0001li-81; Thu, 04 Jan 2024 23:54:41 -0500
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLcE8-00075H-Nc; Thu, 04 Jan 2024 23:54:41 -0500
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-7cc0f5bcb4fso433474241.1; 
 Thu, 04 Jan 2024 20:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704430475; x=1705035275; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fyu0UR1JgGjv26twmzDfsGP7XG8OKydlgTMFaVJ0Ejk=;
 b=Il23BUIDlYmSpqE+dL3KphFnJmuEZpqtGaxwfTmnIqWsBbLqZ6Ls2q5UrANq2qSxnQ
 rRhH+Yd5OHqwcAv0emd5pKKO2622SNwimTHCqQmRxE1G3vNEWWTeI73/281rAKj8g1z/
 j2mt4FtJAQPDp+iSfEedIMJz4OtRTwTtr5nZ7VmTA8lwBZ5tBVbUTsPNxEdeEsvDEsOL
 wfAE0qMI5lWUDyzt0GI4upaaOqkXtKtzUPlaE/X1nP/vqb7lPUQunxcCGYsILE/UACaY
 egvhOkw3Te4xhDwCtDu/wygwImSwf4VvWFA9Ix3VLrwzuzD+6XZRljjrqU5o9VENQ0ZA
 YPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704430475; x=1705035275;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fyu0UR1JgGjv26twmzDfsGP7XG8OKydlgTMFaVJ0Ejk=;
 b=tqxcXvZa64rYJ8f8Yyzsgb0qRLWu8e5DUNheTRSCnZzOQ7V8Lum3cClPnXOmPMoZPd
 UXS8SL1GDTfq7HRIgDENYMuyb1pA7czLthE9GwYRTl1aNcToouZwRrxAfNYwzVEfWqeu
 nIS/ZS4P257y6PICN3KMcX+8tSgdJI/LFbvxrjE3m5fMHjGKLpB6eJZTVaa+9ABwk9sg
 mgdipHANnVlTdDmG7qM7oLwemqWLqqHOrsnphROUQKWel4yvEpgLTO6DIbjaJ43DwJ0p
 bkdILQcgGEq/fMrn0nSQcVe7dNxgENyDIxW18+0XYk3EkcI2/wNYv0ocV98NMefNX+D2
 cdKg==
X-Gm-Message-State: AOJu0Ywrtb29YxizNYha/1ANOTWT19MgtkwrHEryTfOkdD+d39FzaNnK
 5c3IZman3hO/zpTIC1bLUpQn1WaAS4+X37BuY0U=
X-Google-Smtp-Source: AGHT+IGbLb9sWCwnIkAxh3NDoMM+H/rmzoCwPzR0/nhrznQmJHAjVI4YZtKstPdbxKw3KjkVTHkwZXBn+x1V1nRoVhk=
X-Received: by 2002:a67:e68f:0:b0:467:add7:6334 with SMTP id
 hv15-20020a67e68f000000b00467add76334mr1540786vsb.31.1704430475193; Thu, 04
 Jan 2024 20:54:35 -0800 (PST)
MIME-Version: 1.0
References: <20240103174013.147279-1-dbarboza@ventanamicro.com>
 <20240103174013.147279-11-dbarboza@ventanamicro.com>
In-Reply-To: <20240103174013.147279-11-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 14:54:08 +1000
Message-ID: <CAKmqyKORbW1sU6GKC2vaBCqDfG6Di9k0u07kU=XMQubZKoQ6AA@mail.gmail.com>
Subject: Re: [PATCH v3 10/16] target/riscv: create finalize_features() for KVM
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com, vladimir.isaev@syntacore.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92c.google.com
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

On Thu, Jan 4, 2024 at 3:46=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> To turn cbom_blocksize and cboz_blocksize into class properties we need
> KVM specific changes.
>
> KVM is creating its own version of these options with a customized
> setter() that prevents users from picking an invalid value during init()
> time. This comes at the cost of duplicating each option that KVM
> supports. This will keep happening for each new shared option KVM
> implements in the future.
>
> We can avoid that by using the same property TCG uses and adding
> specific KVM handling during finalize() time, like TCG already does with
> riscv_tcg_cpu_finalize_features(). To do that, the common CPU property
> offers a way of knowing if an option was user set or not, sparing us
> from doing unneeded syscalls.
>
> riscv_kvm_cpu_finalize_features() is then created using the same
> KVMScratch CPU we already use during init() time, since finalize() time
> is still too early to use the official KVM CPU for it. cbom_blocksize
> and cboz_blocksize are then handled during finalize() in the same way
> they're handled by their KVM specific setter.
>
> With this change we can proceed with the blocksize changes in the common
> code without breaking the KVM driver.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c           | 16 +++++++---
>  target/riscv/cpu.h           |  1 +
>  target/riscv/kvm/kvm-cpu.c   | 59 ++++++++++++++++++++++++++++++++++++
>  target/riscv/kvm/kvm_riscv.h |  1 +
>  4 files changed, 72 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index da432e4c1e..92b4881e9c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -63,6 +63,11 @@ static void cpu_option_add_user_setting(const char *op=
tname, uint32_t value)
>                          GUINT_TO_POINTER(value));
>  }
>
> +bool riscv_cpu_option_set(const char *optname)
> +{
> +    return g_hash_table_contains(general_user_opts, optname);
> +}
> +
>  #define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
>      {#_name, _min_ver, CPU_CFG_OFFSET(_prop)}
>
> @@ -1056,17 +1061,18 @@ void riscv_cpu_finalize_features(RISCVCPU *cpu, E=
rror **errp)
>  {
>      Error *local_err =3D NULL;
>
> -    /*
> -     * KVM accel does not have a specialized finalize()
> -     * callback because its extensions are validated
> -     * in the get()/set() callbacks of each property.
> -     */
>      if (tcg_enabled()) {
>          riscv_tcg_cpu_finalize_features(cpu, &local_err);
>          if (local_err !=3D NULL) {
>              error_propagate(errp, local_err);
>              return;
>          }
> +    } else if (kvm_enabled()) {
> +        riscv_kvm_cpu_finalize_features(cpu, &local_err);
> +        if (local_err !=3D NULL) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
>      }
>
>  #ifndef CONFIG_USER_ONLY
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index f1715d9d31..484c32e607 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -494,6 +494,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, =
int size,
>                          bool probe, uintptr_t retaddr);
>  char *riscv_isa_string(RISCVCPU *cpu);
>  void riscv_cpu_list(void);
> +bool riscv_cpu_option_set(const char *optname);
>
>  #define cpu_list riscv_cpu_list
>  #define cpu_mmu_index riscv_cpu_mmu_index
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 62a1e51f0a..70fb075846 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -1490,6 +1490,65 @@ static void kvm_cpu_instance_init(CPUState *cs)
>      }
>  }
>
> +void riscv_kvm_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
> +{
> +    CPURISCVState *env =3D &cpu->env;
> +    KVMScratchCPU kvmcpu;
> +    struct kvm_one_reg reg;
> +    uint64_t val;
> +    int ret;
> +
> +    /* short-circuit without spinning the scratch CPU */
> +    if (!cpu->cfg.ext_zicbom && !cpu->cfg.ext_zicboz) {
> +        return;
> +    }
> +
> +    if (!kvm_riscv_create_scratch_vcpu(&kvmcpu)) {
> +        error_setg(errp, "Unable to create scratch KVM cpu");
> +        return;
> +    }
> +
> +    if (cpu->cfg.ext_zicbom &&
> +        riscv_cpu_option_set(kvm_cbom_blocksize.name)) {
> +
> +        reg.id =3D kvm_riscv_reg_id_ulong(env, KVM_REG_RISCV_CONFIG,
> +                                        kvm_cbom_blocksize.kvm_reg_id);
> +        reg.addr =3D (uint64_t)&val;
> +        ret =3D ioctl(kvmcpu.cpufd, KVM_GET_ONE_REG, &reg);
> +        if (ret !=3D 0) {
> +            error_setg(errp, "Unable to read cbom_blocksize, error %d", =
errno);
> +            return;
> +        }
> +
> +        if (cpu->cfg.cbom_blocksize !=3D val) {
> +            error_setg(errp, "Unable to set cbom_blocksize to a differen=
t "
> +                       "value than the host (%lu)", val);
> +            return;
> +        }
> +    }
> +
> +    if (cpu->cfg.ext_zicboz &&
> +        riscv_cpu_option_set(kvm_cboz_blocksize.name)) {
> +
> +        reg.id =3D kvm_riscv_reg_id_ulong(env, KVM_REG_RISCV_CONFIG,
> +                                        kvm_cboz_blocksize.kvm_reg_id);
> +        reg.addr =3D (uint64_t)&val;
> +        ret =3D ioctl(kvmcpu.cpufd, KVM_GET_ONE_REG, &reg);
> +        if (ret !=3D 0) {
> +            error_setg(errp, "Unable to read cbom_blocksize, error %d", =
errno);

cboz_blocksize in the message

Alistair

> +            return;
> +        }
> +
> +        if (cpu->cfg.cboz_blocksize !=3D val) {
> +            error_setg(errp, "Unable to set cboz_blocksize to a differen=
t "
> +                       "value than the host (%lu)", val);
> +            return;
> +        }
> +    }
> +
> +    kvm_riscv_destroy_scratch_vcpu(&kvmcpu);
> +}
> +
>  static void kvm_cpu_accel_class_init(ObjectClass *oc, void *data)
>  {
>      AccelCPUClass *acc =3D ACCEL_CPU_CLASS(oc);
> diff --git a/target/riscv/kvm/kvm_riscv.h b/target/riscv/kvm/kvm_riscv.h
> index 8329cfab82..4bd98fddc7 100644
> --- a/target/riscv/kvm/kvm_riscv.h
> +++ b/target/riscv/kvm/kvm_riscv.h
> @@ -27,5 +27,6 @@ void kvm_riscv_aia_create(MachineState *machine, uint64=
_t group_shift,
>                            uint64_t guest_num);
>  void riscv_kvm_aplic_request(void *opaque, int irq, int level);
>  int kvm_riscv_sync_mpstate_to_kvm(RISCVCPU *cpu, int state);
> +void riscv_kvm_cpu_finalize_features(RISCVCPU *cpu, Error **errp);
>
>  #endif
> --
> 2.43.0
>
>

