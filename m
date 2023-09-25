Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2013BCE7A8B
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 01:33:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkaT3-0006BF-Pr; Sun, 24 Sep 2023 21:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkaT1-0006Ad-HV; Sun, 24 Sep 2023 21:32:55 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkaSz-0004Il-O2; Sun, 24 Sep 2023 21:32:55 -0400
Received: by mail-ua1-x929.google.com with SMTP id
 a1e0cc1a2514c-7a84609acc6so1827961241.3; 
 Sun, 24 Sep 2023 18:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695605572; x=1696210372; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4gsLb5PcS9D8UDeS4T/ZXkgMY0ai8YOIQN/lhiMzQ7Y=;
 b=IQmBAA0x5mjKkwpN8U+13mlRGA3Kn3bo2F45Q2PHv6yQxV+CYAK0bAFSRtYzdilKoi
 vsc0AVAIXn9VtbvTCHIxurgv+68CR3hBJ6WACyxEtGSrIIVfSRKcRbjFSgRR8KLNYCfS
 RaH24Q5p7zwHrIWbnoPpMbkKX49F+HLulOWpxI2ZOqh2v8GYpB9k7egIalSkTskqgyQR
 Uw6+cTgkPbKIvCBmSl4R2hQNfYBIn9UTayAkcnLXsSmuZOYfnBZzkNj2wEoxiY74X9ix
 bXHQYhsQitNdKaeNa1i7ImeBT8pFSXX38fyiL+Hj2nN8hUxZ1UWiG+rFhKYTZjyfUDB3
 AnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695605572; x=1696210372;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4gsLb5PcS9D8UDeS4T/ZXkgMY0ai8YOIQN/lhiMzQ7Y=;
 b=SPwLv4Glu1Nko8BUADSkowIX3UhO8Ify/WDS6aWHc+bjBEby76QalT6eAqpfMvg25O
 VEg79Qio+PkLPPPvfEX7iTevpw34fGmytUGXHFp1l2pAjx1qqAPVF+bbfaBzfxEZ15YX
 fknR12qOXPsEkt42evminSb+YdbdrulD85/VAzu3+n46+herUhkrSMyzSbf1sHOkT0BC
 ut20PybMb9jn5SWeD815cWaKN/vFuEwj/AbNWbwND/BQwFpiv0xVOb9MX9VJNS+6bW3F
 RjY2caLkVkxqMpKasSWrOREwLG1ThsfLICoH+aELQz7Uh6CDqmRvrQElqm+kFqBoUQr9
 +ztw==
X-Gm-Message-State: AOJu0Yy/Pi98JuDcgAf7vLf6EQsIMui9Z/mIcX5cjpM5sVa2G+6Kactm
 BwbAuD2atJmtOFOoo6yD3NEcruv1KwZ9wTL5nrY=
X-Google-Smtp-Source: AGHT+IEa4vco0hjVXg+mPTX+ALhA9XTWMHCjzTuvbaSeTPTGCK4RYkSfv7Y6qCANb3beZJ6efDr0T5X5EA6bgt4C0WQ=
X-Received: by 2002:a1f:cc01:0:b0:490:100:abc with SMTP id
 c1-20020a1fcc01000000b0049001000abcmr2289006vkg.5.1695605572159; 
 Sun, 24 Sep 2023 18:32:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230920112020.651006-1-dbarboza@ventanamicro.com>
 <20230920112020.651006-14-dbarboza@ventanamicro.com>
In-Reply-To: <20230920112020.651006-14-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Sep 2023 11:32:25 +1000
Message-ID: <CAKmqyKMRgLamKXEDh_egqL2+-K8hLVJuO2P-1DGScq99-UJ=pg@mail.gmail.com>
Subject: Re: [PATCH v3 13/19] target/riscv/kvm: do not use
 riscv_cpu_add_misa_properties()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x929.google.com
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

On Wed, Sep 20, 2023 at 9:24=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> riscv_cpu_add_misa_properties() is being used to fill the missing KVM
> MISA properties but it is a TCG helper that was adapted to do so. We'll
> move it to tcg-cpu.c in the next patches, meaning that KVM needs to fill
> the remaining MISA properties on its own.
>
> Do not use riscv_cpu_add_misa_properties(). Let's create a new array
> with all available MISA bits we support that can be read by KVM. The
> array is zero terminate to allow us to iterate through it without
> knowing its size.
>
> Then, inside kvm_riscv_add_cpu_user_properties(), we'll create all KVM
> MISA properties as usual and then use this array to add any missing MISA
> properties with the riscv_cpu_add_kvm_unavail_prop() helper.
>
> Note that we're creating misa_bits[], and not using the existing
> 'riscv_single_letter_exts[]', because the latter is tuned for riscv,isa
> related functions and it doesn't have all MISA bits we support. Commit
> 0e2c377023 ("target/riscv: misa to ISA string conversion fix") has the
> full context.
>
> While we're at it, move both satp and the multi-letter extension
> properties to kvm_riscv_add_cpu_user_properties() as well.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         |  2 ++
>  target/riscv/cpu.h         |  3 ++-
>  target/riscv/kvm/kvm-cpu.c | 22 ++++++++++++++--------
>  3 files changed, 18 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 51567c2f12..665c21af6a 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -38,6 +38,8 @@
>
>  /* RISC-V CPU definitions */
>  static const char riscv_single_letter_exts[] =3D "IEMAFDQCPVH";
> +const uint32_t misa_bits[] =3D {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
> +                              RVC, RVS, RVU, RVH, RVJ, RVG, 0};
>
>  struct isa_ext_data {
>      const char *name;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index cb13464ba6..7235eafc1a 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -43,7 +43,7 @@
>  #define RV(x) ((target_ulong)1 << (x - 'A'))
>
>  /*
> - * Consider updating misa_ext_info_arr[] and misa_ext_cfgs[]
> + * Update misa_bits[], misa_ext_info_arr[] and misa_ext_cfgs[]
>   * when adding new MISA bits here.
>   */
>  #define RVI RV('I')
> @@ -60,6 +60,7 @@
>  #define RVJ RV('J')
>  #define RVG RV('G')
>
> +extern const uint32_t misa_bits[];
>  const char *riscv_get_misa_ext_name(uint32_t bit);
>  const char *riscv_get_misa_ext_description(uint32_t bit);
>
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 606fdab223..c6615cb807 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -396,6 +396,8 @@ static void kvm_riscv_add_cpu_user_properties(Object =
*cpu_obj)
>  {
>      int i;
>
> +    riscv_add_satp_mode_properties(cpu_obj);
> +
>      for (i =3D 0; i < ARRAY_SIZE(kvm_misa_ext_cfgs); i++) {
>          KVMCPUConfig *misa_cfg =3D &kvm_misa_ext_cfgs[i];
>          int bit =3D misa_cfg->offset;
> @@ -411,6 +413,11 @@ static void kvm_riscv_add_cpu_user_properties(Object=
 *cpu_obj)
>                                          misa_cfg->description);
>      }
>
> +    for (i =3D 0; misa_bits[i] !=3D 0; i++) {
> +        const char *ext_name =3D riscv_get_misa_ext_name(misa_bits[i]);
> +        riscv_cpu_add_kvm_unavail_prop(cpu_obj, ext_name);
> +    }
> +
>      for (i =3D 0; i < ARRAY_SIZE(kvm_multi_ext_cfgs); i++) {
>          KVMCPUConfig *multi_cfg =3D &kvm_multi_ext_cfgs[i];
>
> @@ -427,6 +434,10 @@ static void kvm_riscv_add_cpu_user_properties(Object=
 *cpu_obj)
>      object_property_add(cpu_obj, "cboz_blocksize", "uint16",
>                          NULL, kvm_cpu_set_cbomz_blksize,
>                          NULL, &kvm_cboz_blocksize);
> +
> +    riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_extensions);
> +    riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_vendor_exts)=
;
> +    riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_experimental=
_exts);
>  }
>
>  static int kvm_riscv_get_regs_core(CPUState *cs)
> @@ -801,7 +812,7 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu=
, KVMScratchCPU *kvmcpu)
>      }
>  }
>
> -static void riscv_init_user_properties(Object *cpu_obj)
> +static void riscv_init_kvm_registers(Object *cpu_obj)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(cpu_obj);
>      KVMScratchCPU kvmcpu;
> @@ -810,7 +821,6 @@ static void riscv_init_user_properties(Object *cpu_ob=
j)
>          return;
>      }
>
> -    kvm_riscv_add_cpu_user_properties(cpu_obj);
>      kvm_riscv_init_machine_ids(cpu, &kvmcpu);
>      kvm_riscv_init_misa_ext_mask(cpu, &kvmcpu);
>      kvm_riscv_init_multiext_cfg(cpu, &kvmcpu);
> @@ -1324,13 +1334,9 @@ static void kvm_cpu_instance_init(CPUState *cs)
>      Object *obj =3D OBJECT(RISCV_CPU(cs));
>      DeviceState *dev =3D DEVICE(obj);
>
> -    riscv_init_user_properties(obj);
> -    riscv_add_satp_mode_properties(obj);
> -    riscv_cpu_add_misa_properties(obj);
> +    riscv_init_kvm_registers(obj);
>
> -    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_extensions);
> -    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_vendor_exts);
> -    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_experimental_ext=
s);
> +    kvm_riscv_add_cpu_user_properties(obj);
>
>      for (Property *prop =3D riscv_cpu_options; prop && prop->name; prop+=
+) {
>          /* Check if we have a specific KVM handler for the option */
> --
> 2.41.0
>
>

