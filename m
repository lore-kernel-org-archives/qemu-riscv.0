Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D08E95A8F
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 01:14:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qpeqk-0004fO-9a; Sun, 08 Oct 2023 21:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qpeqj-0004f4-22; Sun, 08 Oct 2023 21:14:21 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qpeqe-0000WL-Lc; Sun, 08 Oct 2023 21:14:20 -0400
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-4908d8f7263so1756266e0c.2; 
 Sun, 08 Oct 2023 18:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696814055; x=1697418855; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QuZM7VzKUBXQYIgULYA3e75gyQOXV0G2kzrHUJG4X/A=;
 b=KwkTr5N/5V/luZAIdc2XV3TRycS+eprH26TLKWLylaXXNkLUqDG+VEYrXbSbhoArKK
 zVR7rXBAMcr2UsYv/3nSZuY5uq+jP2jf6pkuHywiOQ4Q41VnAkiitqPV6X1nL92TzRao
 6rp14e9AioRQhMMkWIJJATqXfosJhDXNmVYtjMYEebyHHl0fkA9bF8zLlU7f6ldIkCHa
 9hn2J3Abz+E3oyzn5eRCP1ryxRLUrDgHDy0vnFX4TTtEN+3OHtJDXtpW2anJFmk9Q6l1
 Di0DzAhjioK+BeZYyDse5FrkanIZoO2V9voVgvcL0pcD52jzpQ6TomnTes9imU0NFiWw
 LvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696814055; x=1697418855;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QuZM7VzKUBXQYIgULYA3e75gyQOXV0G2kzrHUJG4X/A=;
 b=tpIn4Tu1wor0tTQN/sco2H5BPs37Ajd+3HJwbCm/FFMFkYY1L55nabt5Pg3s7UidY3
 F4YM3Jxz3qDXj3MHkeT4Yi+0nBOAGwVCSBUutyyWjVYd4NdUT3iLjO68Ti0ZN4Xn4SX/
 HA9RHFWBr9Sd8oKp2FblzbZHAoHTRO2Tnp9WjfktR7vJplqdxL2/EawVALIKsQnVPoUS
 ieWjU/OIo6X5zzYCuHVUFK1RP9m/KvFAOppeZiyYZsxJKaa2fZEvchtBJAzVdXJhXkmJ
 CfFDQP6kaF2AiLNHPdemSipCj8xvaxBZl28oKgaVc77H1OZ4Rt0ng8hpUTuPbi3K+APo
 r3OQ==
X-Gm-Message-State: AOJu0YzDMmNEAsrcfz1h7DKEB4NWL80z42v17ngmr1cWDdJQ8EeHBZPt
 QARmSogkiavX/p0xQzM41YiWLxxEMrEH3qgLpKM=
X-Google-Smtp-Source: AGHT+IFI/PQcaLhAet4WL3Yc3rB7AsVwqlJwcdaSuqsNd/iaPhJJQeEcLQ7fVoODLHzsSLicuviQLJFx1jBZEc5mRNY=
X-Received: by 2002:a05:6122:221c:b0:49c:b45:6cba with SMTP id
 bb28-20020a056122221c00b0049c0b456cbamr13344882vkb.12.1696814055143; Sun, 08
 Oct 2023 18:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <20231003132148.797921-1-dbarboza@ventanamicro.com>
 <20231003132148.797921-3-dbarboza@ventanamicro.com>
In-Reply-To: <20231003132148.797921-3-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 9 Oct 2023 11:13:48 +1000
Message-ID: <CAKmqyKO9zhX5-7JogXL3UVOm5VSgC-iy45FcCrTc4ccqMartGw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/riscv/kvm: support KVM_GET_REG_LIST
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa32.google.com
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

On Wed, Oct 4, 2023 at 12:48=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> KVM for RISC-V started supporting KVM_GET_REG_LIST in Linux 6.6. It
> consists of a KVM ioctl() that retrieves a list of all available regs
> for get_one_reg/set_one_reg. Regs that aren't present in the list aren't
> supported in the host.
>
> This simplifies our lives when initing the KVM regs since we don't have
> to always attempt a KVM_GET_ONE_REG for all regs QEMU knows. We'll only
> attempt a get_one_reg() if we're sure the reg is supported, i.e. it was
> retrieved by KVM_GET_REG_LIST. Any error in get_one_reg() will then
> always considered fatal, instead of having to handle special error codes
> that might indicate a non-fatal failure.
>
> Start by moving the current kvm_riscv_init_multiext_cfg() logic into a
> new kvm_riscv_read_multiext_legacy() helper. We'll prioritize using
> KVM_GET_REG_LIST, so check if we have it available and, in case we
> don't, use the legacy() logic.
>
> Otherwise, retrieve the available reg list and use it to check if the
> host supports our known KVM regs, doing the usual get_one_reg() for
> the supported regs and setting cpu->cfg accordingly.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/kvm/kvm-cpu.c | 96 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 95 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index c3daf74fe9..090d617627 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -771,7 +771,8 @@ static void kvm_riscv_read_cbomz_blksize(RISCVCPU *cp=
u, KVMScratchCPU *kvmcpu,
>      }
>  }
>
> -static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kv=
mcpu)
> +static void kvm_riscv_read_multiext_legacy(RISCVCPU *cpu,
> +                                           KVMScratchCPU *kvmcpu)
>  {
>      CPURISCVState *env =3D &cpu->env;
>      uint64_t val;
> @@ -812,6 +813,99 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cp=
u, KVMScratchCPU *kvmcpu)
>      }
>  }
>
> +static int uint64_cmp(const void *a, const void *b)
> +{
> +    uint64_t val1 =3D *(const uint64_t *)a;
> +    uint64_t val2 =3D *(const uint64_t *)b;
> +
> +    if (val1 < val2) {
> +        return -1;
> +    }
> +
> +    if (val1 > val2) {
> +        return 1;
> +    }
> +
> +    return 0;
> +}
> +
> +static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kv=
mcpu)
> +{
> +    KVMCPUConfig *multi_ext_cfg;
> +    struct kvm_one_reg reg;
> +    struct kvm_reg_list rl_struct;
> +    struct kvm_reg_list *reglist;
> +    uint64_t val, reg_id, *reg_search;
> +    int i, ret;
> +
> +    rl_struct.n =3D 0;
> +    ret =3D ioctl(kvmcpu->cpufd, KVM_GET_REG_LIST, &rl_struct);
> +
> +    /*
> +     * If KVM_GET_REG_LIST isn't supported we'll get errno 22
> +     * (EINVAL). Use read_legacy() in this case.
> +     */
> +    if (errno =3D=3D EINVAL) {
> +        return kvm_riscv_read_multiext_legacy(cpu, kvmcpu);
> +    } else if (errno !=3D E2BIG) {
> +        /*
> +         * E2BIG is an expected error message for the API since we
> +         * don't know the number of registers. The right amount will
> +         * be written in rl_struct.n.
> +         *
> +         * Error out if we get any other errno.
> +         */
> +        error_report("Error when accessing get-reg-list, code: %s",
> +                     strerrorname_np(errno));
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    reglist =3D g_malloc(sizeof(struct kvm_reg_list) +
> +                       rl_struct.n * sizeof(uint64_t));
> +    reglist->n =3D rl_struct.n;
> +    ret =3D ioctl(kvmcpu->cpufd, KVM_GET_REG_LIST, reglist);
> +    if (ret) {
> +        error_report("Error when reading KVM_GET_REG_LIST, code %s ",
> +                     strerrorname_np(errno));
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    /* sort reglist to use bsearch() */
> +    qsort(&reglist->reg, reglist->n, sizeof(uint64_t), uint64_cmp);
> +
> +    for (i =3D 0; i < ARRAY_SIZE(kvm_multi_ext_cfgs); i++) {
> +        multi_ext_cfg =3D &kvm_multi_ext_cfgs[i];
> +        reg_id =3D kvm_riscv_reg_id(&cpu->env, KVM_REG_RISCV_ISA_EXT,
> +                                  multi_ext_cfg->kvm_reg_id);
> +        reg_search =3D bsearch(&reg_id, reglist->reg, reglist->n,
> +                             sizeof(uint64_t), uint64_cmp);
> +        if (!reg_search) {
> +            continue;
> +        }
> +
> +        reg.id =3D reg_id;
> +        reg.addr =3D (uint64_t)&val;
> +        ret =3D ioctl(kvmcpu->cpufd, KVM_GET_ONE_REG, &reg);
> +        if (ret !=3D 0) {
> +            error_report("Unable to read ISA_EXT KVM register %s, "
> +                         "error code: %s", multi_ext_cfg->name,
> +                         strerrorname_np(errno));
> +            exit(EXIT_FAILURE);
> +        }
> +
> +        multi_ext_cfg->supported =3D true;
> +        kvm_cpu_cfg_set(cpu, multi_ext_cfg, val);
> +    }
> +
> +    if (cpu->cfg.ext_icbom) {
> +        kvm_riscv_read_cbomz_blksize(cpu, kvmcpu, &kvm_cbom_blocksize);
> +    }
> +
> +    if (cpu->cfg.ext_icboz) {
> +        kvm_riscv_read_cbomz_blksize(cpu, kvmcpu, &kvm_cboz_blocksize);
> +    }
> +}
> +
>  static void riscv_init_kvm_registers(Object *cpu_obj)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(cpu_obj);
> --
> 2.41.0
>
>

