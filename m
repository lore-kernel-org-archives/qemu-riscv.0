Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC3DCD98E6
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 02:55:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqPNI-0007nO-0D; Tue, 10 Oct 2023 22:55:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqPNE-0007ka-5c; Tue, 10 Oct 2023 22:55:00 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqPNC-0007XD-Bh; Tue, 10 Oct 2023 22:54:59 -0400
Received: by mail-ua1-x930.google.com with SMTP id
 a1e0cc1a2514c-7b605706bb0so487017241.3; 
 Tue, 10 Oct 2023 19:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696992897; x=1697597697; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jwgc+HrKZGGX7uVqofgWGcGI558KntSVbc1zj11Oo5g=;
 b=DLGj/vwADfNn9ma3qV8YM+ouPLT6VPY8MAQK01MijqZ0I1AYHWnLRhoZ+imx4S6WC4
 5wVOr3B7xut6wfw9KqTKgnEue3iblIYjZBzGtm5/AxG5olZhrofth8Yn23VZlkiyhlRk
 zjIPlGL3VWEHQrlNfpoxAMz8pAegVDp9uo8K4j8C1pz/bwBrzR3XFiCyzm7VJ0nXeSgc
 4b3tgdha5FOf5xFJTZ77qYo2SACWDlWCwqbne8y2cZjK8RNr3C/jb/LG57C8xG23+tgg
 FH6G1cH/Ow5EKnKggx4+hv91Dmct4A6fqewliejGkoCudHiVRAy6zCr4AWhrL5JPlUHB
 OY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696992897; x=1697597697;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jwgc+HrKZGGX7uVqofgWGcGI558KntSVbc1zj11Oo5g=;
 b=YABr7wz6cya7MTl9Un8WV/0QmAr7H9HXBWIZExg4AP1ZFNkR+KwjsXmVCtjBgKWwEj
 vUJ/9wUcXaQtLA0xZEN6R6WtyQVlTKX72dgfDSdrGsX42BJo2Ra461vV9Oqu1aA76so+
 L9bUfwiZNdCFLCmRFZSjgVU/JgMUGOOpuTa5/2cnPoaVsXwIQP2Ze8pBHwDEJUcZUfhR
 XOsHwXK4uXztg9iRF18tX6ZLwZE/FVnHyx74OUPXYcMIpkkvZhj8HxmDThH2p1QCTUJe
 k8CUd26pM53f2Bp1AWSucqp2nNXO3jrHOIdf6rw4b9sk+9rrNWsOyXEOlDsBKTTRtAjM
 DHaA==
X-Gm-Message-State: AOJu0YxFX/YQzdVm+U5i1fb//8RTPezqJrfzEsHb5bzBJ4ypw//hyaIV
 kH26T/aVCtYiC8BCFQs4FObfG9Ja2S6X0TXWd1A=
X-Google-Smtp-Source: AGHT+IE1zWA+oIGL7BnrH4VZBGE4I+GGmXtIqoAZkPE8G4+UvJFQJm6RQxo6gt9VCdJezwoMexYmoR8kvPPBkvdbj04=
X-Received: by 2002:a1f:e246:0:b0:48f:8533:3cda with SMTP id
 z67-20020a1fe246000000b0048f85333cdamr15062520vkg.11.1696992896879; Tue, 10
 Oct 2023 19:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
 <20231006132134.1135297-4-dbarboza@ventanamicro.com>
In-Reply-To: <20231006132134.1135297-4-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 12:54:30 +1000
Message-ID: <CAKmqyKNCuPgPZQFaQnQk6R8Jx49kp_Z-gRt3NrZN5x05NAJMEg@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] target/riscv: add rva22u64 profile definition
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x930.google.com
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

On Fri, Oct 6, 2023 at 11:23=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The rva22U64 profile, described in:
>
> https://github.com/riscv/riscv-profiles/blob/main/profiles.adoc#rva22-pro=
files
>
> Contains a set of CPU extensions aimed for 64-bit userspace
> applications. Enabling this set to be enabled via a single user flag
> makes it convenient to enable a predictable set of features for the CPU,
> giving users more predicability when running/testing their workloads.
>
> QEMU implements all possible extensions of this profile. The exception
> is Zicbop (Cache-Block Prefetch Operations) that is not available since
> QEMU RISC-V does not implement a cache model. For this same reason all
> the so called 'synthetic extensions' described in the profile that are
> cache related are ignored (Za64rs, Zic64b, Ziccif, Ziccrse, Ziccamoa,
> Zicclsm).
>
> An abstraction called RISCVCPUProfile is created to store the profile.
> 'ext_offsets' contains mandatory extensions that QEMU supports. Same
> thing with the 'misa_ext' mask. Optional extensions must be enabled
> manually in the command line if desired.
>
> The design here is to use the common target/riscv/cpu.c file to store
> the profile declaration and export it to the accelerator files. Each
> accelerator is then responsible to expose it (or not) to users and how
> to enable the extensions.
>
> Next patches will implement the profile for TCG and KVM.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 20 ++++++++++++++++++++
>  target/riscv/cpu.h | 12 ++++++++++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b3befccf89..a439ff57a4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1376,6 +1376,26 @@ Property riscv_cpu_options[] =3D {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> +/* Optional extensions left out: RVV, zfh, zkn, zks */
> +static RISCVCPUProfile RVA22U64 =3D {
> +    .name =3D "rva22u64",
> +    .misa_ext =3D RVM | RVA | RVF | RVD | RVC,
> +    .ext_offsets =3D {
> +        CPU_CFG_OFFSET(ext_icsr), CPU_CFG_OFFSET(ext_zihintpause),
> +        CPU_CFG_OFFSET(ext_zba), CPU_CFG_OFFSET(ext_zbb),
> +        CPU_CFG_OFFSET(ext_zbs), CPU_CFG_OFFSET(ext_zfhmin),
> +        CPU_CFG_OFFSET(ext_zkt), CPU_CFG_OFFSET(ext_icntr),
> +        CPU_CFG_OFFSET(ext_ihpm), CPU_CFG_OFFSET(ext_icbom),
> +        CPU_CFG_OFFSET(ext_icboz),
> +
> +        RISCV_PROFILE_EXT_LIST_END
> +    }
> +};
> +
> +RISCVCPUProfile *riscv_profiles[] =3D {
> +    &RVA22U64, NULL,
> +};
> +
>  static Property riscv_cpu_properties[] =3D {
>      DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 3f11e69223..216bbbe7cd 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -66,6 +66,18 @@ const char *riscv_get_misa_ext_description(uint32_t bi=
t);
>
>  #define CPU_CFG_OFFSET(_prop) offsetof(struct RISCVCPUConfig, _prop)
>
> +typedef struct riscv_cpu_profile {
> +    const char *name;
> +    uint32_t misa_ext;
> +    bool enabled;
> +    bool user_set;
> +    const int32_t ext_offsets[];
> +} RISCVCPUProfile;
> +
> +#define RISCV_PROFILE_EXT_LIST_END -1
> +
> +extern RISCVCPUProfile *riscv_profiles[];
> +
>  /* Privileged specification version */
>  enum {
>      PRIV_VERSION_1_10_0 =3D 0,
> --
> 2.41.0
>
>

