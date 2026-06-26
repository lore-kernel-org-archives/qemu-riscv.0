Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810F6CDE00B
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 00:58:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcuu0-0000SD-2j; Thu, 25 Jun 2026 20:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcuty-0000RX-8w
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 20:58:38 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcutw-0000VR-Gi
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 20:58:38 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-c07fcdd75d3so50409666b.1
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 17:58:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782435515; cv=none;
 d=google.com; s=arc-20260327;
 b=SCXHgfoTaIj7FS9QUiGzGrVKnRhH/vEoP/izwXEmlpy7+Uww9cPrq5U588O3sYWlHN
 WQcgDFZFiyfOZ49ug40mrXcM7EXTPmlpMU5vLAIWrB0C3vESlJkBs/enJsSZJrky48WO
 /t10rxwppS2rPBgsRz2c03+mWWIlmrSUuyBk2Ao+9Vb0TliBugjwQTkBCKS9nIq1aTfQ
 Pkkn+blBK8bJmCr60rUnFIytyZzawzsS8RBisypM2eOwgdKTA6HtEtO9ACIXyOnKHLFk
 0dokvHTOEPErRc7ZjvhtMh+DIBc667i/niuiawWY2tdkT5JwVu+InS6pyKJ8GQB8I7Ye
 Ci+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=9MTn+C6QqkjNC+Sk+aG1MFaeUO3oIT2iKO9G6dP6Pyc=;
 fh=d440OlesDyylFJnCZQazkgPmSmpf2WLIgngyaxn7y7k=;
 b=cOajOG74y/eRCf/YvYPnoI/h/N+4d1lUB0hvUVPhQ2ZuTuEcmgASTjRBZZa/smbqVq
 fT4uYHNVlYlbfNCRkMrPxf2hqMyYeuU1R6eZ5TtOUJDFQu3zN6TJHkCzURXiVTKNGsHJ
 Qhsy3wGb1XYoaIwlSfl25Wx1cjh7XW+nH7x1Uwlii6gATvz6f/2jpMkixE6JWSP5BQYf
 PDM2d/xaJZ7PRHT4+c1KwB6N1Z0iTt207o3gcKYxzXZmXMhoZQ/QDg7+zRqKxUmjbYfr
 XPZznnpoS5IdiVFKwHnbSV/1rhX1ImofyF9oz78CfPcF3EL2KCa6l87eMEFpQiIoC/7I
 8D/w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782435515; x=1783040315; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9MTn+C6QqkjNC+Sk+aG1MFaeUO3oIT2iKO9G6dP6Pyc=;
 b=grnc/XUJlJFA7HhGatPSjURg2BpnADhOCEuwsGgU+q7qKQy5kxKqi4roPmbTKz2K8O
 OMZvXa70uDYRpfE1Y2VAxDytw32/RtsST9NTUYJMLiTi70rQ+/nmAFDVYjMEb/rER2qB
 8YV7PQwd+moOZx3YNjSb5hDbDUAlPJbW+Z1/BJS+jyvdXb0rfkUZ6U2+C8OblP18gkgD
 a/NdeTFoxB4dAnRDx4qN0dTG4lIc7yOX/y2OByurMiMgtpROJNHVv5EbCti5Yl6CMLSu
 OM+nxmX3yFcxlFW/0DCTOccg7oNsmpd1aa9apj3fgPkJeN+hq7avgEDtmvtBLoGciXo2
 bEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782435515; x=1783040315;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9MTn+C6QqkjNC+Sk+aG1MFaeUO3oIT2iKO9G6dP6Pyc=;
 b=OAgkehstkZGA6gDwn1FWXS4ou4okkZOb7IWz49hFCuTri1VnQnCvD94NovdY8pSgb3
 ei7WeE+C3ytw6tpHzGIBc1NMnHWHyGABmrbJXLGxcOac1HSp7dOXcjAkZS8L0rQhm2/O
 yhAlC6FF6nEYJnq2/enqXsnAgNtYMRRTUdK+yuBp/LuU2jyK1sl2fijebHbnu3g60SJy
 Znms5hms7sxDg4aq5va6/RIZ+G+efhdmi5PIqTn129vKussPuiC0vZT8AVsk+W/HPr8q
 yqtooRajvZ3IKqEwCYu4Wx4sFtD8DFScofyRxKA3I6ib6IKWbMwgAHkcyFjAXw5Z8DOF
 /c+Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RoISRv1+7S9tQ/x2DqxJMbOiCDibVPf9uWk/oR3J9hUBhGkXe2cjS6NifkSgEuVjpIvziz1cSgJdroG@nongnu.org
X-Gm-Message-State: AOJu0YyTWO7J+q7weEwc534DP5E2KW5gn7iaaexOYtybfQuADili7+zT
 0WQi94zC0PgY34ng+LYmD7cZ56hQ3p44mFkmi7ulFZBYcztbodO12ds5D7ReZsQfoRoWN6r5k9y
 bKZxeXdiCfZ+zAllugdJm5zGa6Kewh9U=
X-Gm-Gg: AfdE7cnRFR7RBxwiwBus5prAvCP1FEW8yf5oFP8BEdwRKk56pYVyU8S2YeAHT34UcIC
 HqIHKuL3G2jo77WQml8Fb1kUtf3OUrbK6msITRlYgIgeBazh82DFTMQjkgwMFTu5nGUXjnC9FJG
 lkq228FxIrrx1oJaFJ86XVqjNDk2wBEZSGMmtYq77LdTqYWtuFK4lhVyKguZtLTEj24UeIkB4GU
 UjowzEiesQN4C7EuJbZNuyVIa9zweKXHP4puCMYZMkLKCoJUu5YEmvKC4ucoyE+9L/+SaL730w1
 eseL+x19NoViaxbDL2evAJ8ePyY=
X-Received: by 2002:a17:907:6e89:b0:bec:da5b:5a6 with SMTP id
 a640c23a62f3a-c1205e029c2mr310615066b.21.1782435514713; Thu, 25 Jun 2026
 17:58:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
 <20260624000632.2149359-9-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260624000632.2149359-9-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 Jun 2026 10:58:07 +1000
X-Gm-Features: AVVi8CeSmjkQBS-Kiw7pysrkSe49UyWhAM4Gnqi_qZa9DPcaLSz0_dTQmLiH780
Message-ID: <CAKmqyKMkp4mzgqStLOD-06OKPj5XHvm1=HbgZeZWCktjubczOQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/24] target/riscv: remove csr.h from kvm-cpu.c
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com, 
 fritchleybohrer@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Wed, Jun 24, 2026 at 10:08=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> Move riscv_new_csr_seed from csr.c to cpu.c since this function is
> shared with KVM.  With that we can remove the csr.h from kvm-cpu.c.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         | 30 ++++++++++++++++++++++++++++++
>  target/riscv/cpu.h         |  3 ++-
>  target/riscv/csr.h         |  3 ---
>  target/riscv/kvm/kvm-cpu.c |  1 -
>  target/riscv/tcg/csr.c     | 29 -----------------------------
>  5 files changed, 32 insertions(+), 34 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index fe47ae64c9..5d44f993e4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -21,6 +21,7 @@
>  #include "qemu/qemu-print.h"
>  #include "qemu/ctype.h"
>  #include "qemu/log.h"
> +#include "qemu/guest-random.h"
>  #include "cpu.h"
>  #include "cpu_vendorid.h"
>  #include "target/riscv/csr.h"
> @@ -536,6 +537,35 @@ static void riscv_register_custom_csrs(RISCVCPU *cpu=
, const RISCVCSR *csr_list)
>  }
>  #endif
>
> +/* Used by csr.c and the KVM driver */
> +target_ulong riscv_new_csr_seed(target_ulong new_value,
> +                                target_ulong write_mask)
> +{
> +    uint16_t random_v;
> +    Error *random_e =3D NULL;
> +    int random_r;
> +    target_ulong rval;
> +
> +    random_r =3D qemu_guest_getrandom(&random_v, 2, &random_e);
> +    if (unlikely(random_r < 0)) {
> +        /*
> +         * Failed, for unknown reasons in the crypto subsystem.
> +         * The best we can do is log the reason and return a
> +         * failure indication to the guest.  There is no reason
> +         * we know to expect the failure to be transitory, so
> +         * indicate DEAD to avoid having the guest spin on WAIT.
> +         */
> +        qemu_log_mask(LOG_UNIMP, "%s: Crypto failure: %s",
> +                      __func__, error_get_pretty(random_e));
> +        error_free(random_e);
> +        rval =3D SEED_OPST_DEAD;
> +    } else {
> +        rval =3D random_v | SEED_OPST_ES16;
> +    }
> +
> +    return rval;
> +}
> +
>  static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
>  {
>      ObjectClass *oc;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 70b8729bd7..c0e9098728 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -972,7 +972,8 @@ bool riscv_cpu_accelerator_compatible(RISCVCPU *cpu);
>  extern const bool valid_vm_1_10_32[], valid_vm_1_10_64[];
>
>  void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
> -
> +target_ulong riscv_new_csr_seed(target_ulong new_value,
> +                                target_ulong write_mask);
>  const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit);
>
>  const char *priv_spec_to_str(int priv_version);
> diff --git a/target/riscv/csr.h b/target/riscv/csr.h
> index c791260f83..73d874ee98 100644
> --- a/target/riscv/csr.h
> +++ b/target/riscv/csr.h
> @@ -12,9 +12,6 @@
>  #include "exec/target_long.h"
>  #include "cpu_bits.h"
>
> -target_ulong riscv_new_csr_seed(target_ulong new_value,
> -                                target_ulong write_mask);
> -
>  RISCVException riscv_csrr(CPURISCVState *env, int csrno,
>                            target_ulong *ret_value);
>
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 39d48a9db4..dcdaf7f2b3 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -31,7 +31,6 @@
>  #include "system/kvm.h"
>  #include "system/kvm_int.h"
>  #include "cpu.h"
> -#include "target/riscv/csr.h"
>  #include "trace.h"
>  #include "accel/accel-cpu-target.h"
>  #include "hw/pci/pci.h"
> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> index b460860409..d447204721 100644
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -29,7 +29,6 @@
>  #include "exec/icount.h"
>  #include "accel/tcg/cpu-loop.h"
>  #include "accel/tcg/getpc.h"
> -#include "qemu/guest-random.h"
>  #include "qapi/error.h"
>  #include "tcg/insn-start-words.h"
>  #include "internals.h"
> @@ -5577,34 +5576,6 @@ static RISCVException write_mnstatus(CPURISCVState=
 *env, int csrno,
>  #endif
>
>  /* Crypto Extension */
> -target_ulong riscv_new_csr_seed(target_ulong new_value,
> -                                target_ulong write_mask)
> -{
> -    uint16_t random_v;
> -    Error *random_e =3D NULL;
> -    int random_r;
> -    target_ulong rval;
> -
> -    random_r =3D qemu_guest_getrandom(&random_v, 2, &random_e);
> -    if (unlikely(random_r < 0)) {
> -        /*
> -         * Failed, for unknown reasons in the crypto subsystem.
> -         * The best we can do is log the reason and return a
> -         * failure indication to the guest.  There is no reason
> -         * we know to expect the failure to be transitory, so
> -         * indicate DEAD to avoid having the guest spin on WAIT.
> -         */
> -        qemu_log_mask(LOG_UNIMP, "%s: Crypto failure: %s",
> -                      __func__, error_get_pretty(random_e));
> -        error_free(random_e);
> -        rval =3D SEED_OPST_DEAD;
> -    } else {
> -        rval =3D random_v | SEED_OPST_ES16;
> -    }
> -
> -    return rval;
> -}
> -
>  static RISCVException rmw_seed(CPURISCVState *env, int csrno,
>                                 target_ulong *ret_value,
>                                 target_ulong new_value,
> --
> 2.43.0
>
>

