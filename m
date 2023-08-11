Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF78EB64DD
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 15:04:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUTgK-00058l-Rh; Fri, 11 Aug 2023 11:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUTgJ-00058Y-7y; Fri, 11 Aug 2023 11:04:03 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUTgG-0004xM-Lj; Fri, 11 Aug 2023 11:04:02 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6bd0a0a6766so1957893a34.2; 
 Fri, 11 Aug 2023 08:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691766239; x=1692371039;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x1Rnk6NlfdXvG2l2l7z/PJew7MckkfVL5NOelbYdkCQ=;
 b=gnKB6xDiOr6taBx8cbwUEs0uZG/ByZpgeuE3XPDQV0fqtq5F2SlU8feXlWKSUhF8kj
 fdmxkJQlwadd0HLPF/D/bWl7qGuxZaW0cslgE7Mt410Wh5kQy9XDp01aUuONhx05tKHT
 sjEgFdtthm0ksD5iT7F4Q1W2yXgqIeRCWa3bXGoWBVOzoPTAmrlVBJchHeAq5drmhIHl
 6oLU0JvoSxjiNcuE5p8TMDnyZ7McDvFzH9d685MWr461qs2TlfvgaXo2FzYFhWvuNQLD
 ZpEQBpzZeOW/yuxvUzR65mNGI3/sp41wgi9V0aSklGQjwfTzc+oPj6jGCTz1ADQKycUQ
 yxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691766239; x=1692371039;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x1Rnk6NlfdXvG2l2l7z/PJew7MckkfVL5NOelbYdkCQ=;
 b=XTxGJ+xbgVNsUpHvl/RtHmiTkX0jz2N3lbD5g+QQSlGfPIW3CyB3uBx5h10KYMHr/a
 Z54LA0bu17+soPooBlsmVwc9f/PNKCYzXmHYfFHNN9jJz6c28gsZBQzvACZmUT7vPbJ9
 uv26U7JuWkJNFwHeorkQ3xvU9YzRLZYA5kxUIrqUCVcUaNOoMNSfO2oXy4Su8KlowEXz
 LaGs9qbJNSzezSKvjvJOc3arvsc2yuJD4EuuFUgVv1U9xHCOEqPT4d3TXauJTHNbMDsU
 udnUxNcI4CBqrHJfdx6oJYITJBUiAKTfzLv6WF35vOoXZ+MuI7gIymGq32d0oc70kBR3
 sa2w==
X-Gm-Message-State: AOJu0YwgLNURQt6KzrDgXYhzeqRcLmVbp8s3bvT6+D3WYKns+0BZebe+
 MdJGhgUOJNCK0g+P89/HR/l0xxi6AMfzy32KQRA=
X-Google-Smtp-Source: AGHT+IGX/4l/HY7MESmNIEd7mR48MnehY10QODYcM+tNMpbDmxTIU0beUuXd7qYj9zOsCD4Kr/4zHqvIyPWVJk+HUlI=
X-Received: by 2002:a05:6358:9924:b0:134:e458:688d with SMTP id
 w36-20020a056358992400b00134e458688dmr2483091rwa.15.1691766238699; Fri, 11
 Aug 2023 08:03:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230728131520.110394-1-dbarboza@ventanamicro.com>
 <20230728131520.110394-6-dbarboza@ventanamicro.com>
In-Reply-To: <20230728131520.110394-6-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Aug 2023 11:03:32 -0400
Message-ID: <CAKmqyKNnOW2tiY+G9YHPEZMCsZAoa4f656CUeJukipTHCAo5=Q@mail.gmail.com>
Subject: Re: [PATCH 5/8] target/riscv/cpu.c: introduce RISCVCPUMultiExtConfig
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=alistair23@gmail.com; helo=mail-ot1-x329.google.com
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

On Fri, Jul 28, 2023 at 10:06=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> If we want to make better decisions when auto-enabling extensions during
> realize() we need a way to tell if an user set an extension manually.
> The RISC-V KVM driver has its own solution via a KVMCPUConfig struct
> that has an 'user_set' flag that is set during the Property set()
> callback. The set() callback also does init() time validations based on
> the current KVM driver capabilities.
>
> For TCG we would want a 'user_set' mechanic too, but we would look
> ad-hoc via cpu_cfg_ext_auto_update() if a certain extension was user set
> or not. If we copy what was made in the KVM side we would look for
> 'user_set' for one into 60+ extension structs spreaded in 3 arrays
> (riscv_cpu_extensions, riscv_cpu_experimental_exts,
> riscv_cpu_vendor_exts).
>
> We'll still need an extension struct but we won't be using the
> 'user_set' flag:
>
> - 'RISCVCPUMultiExtConfig' will be our specialized structure, similar to =
what
> we're already doing with the MISA extensions in 'RISCVCPUMisaExtConfig'.
> DEFINE_PROP_BOOL() for all 3 extensions arrays were replaced by
> MULTI_EXT_CFG_BOOL(), a macro that will init our specialized struct;
>
> - the 'multi_ext_user_opts' hash will be used to store the offset of each
> extension that the user set via the set() callback, cpu_set_multi_ext_cfg=
().
> For now we're just initializing and populating it - next patch will use
> it to determine if a certain extension was user set;
>
> - cpu_add_multi_ext_prop() is a new helper that will replace the
> qdev_property_add_static() calls that our macros are doing to populate
> user properties. The macro was renamed to ADD_CPU_MULTIEXT_PROPS_ARRAY()
> for clarity. Note that the non-extension properties in
> riscv_cpu_options[] still need to be declared via qdev().
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 231 ++++++++++++++++++++++++++++-----------------
>  1 file changed, 145 insertions(+), 86 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 88b263e830..b588f6969f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -153,6 +153,9 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
>      ISA_EXT_DATA_ENTRY(xventanacondops, PRIV_VERSION_1_12_0, ext_XVentan=
aCondOps),
>  };
>
> +/* Hash that stores user set extensions */
> +static GHashTable *multi_ext_user_opts;
> +
>  static bool isa_ext_is_enabled(RISCVCPU *cpu, uint32_t ext_offset)
>  {
>      bool *ext_enabled =3D (void *)&cpu->cfg + ext_offset;
> @@ -1668,6 +1671,8 @@ static void riscv_cpu_init(Object *obj)
>      qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq,
>                        IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
>  #endif /* CONFIG_USER_ONLY */
> +
> +    multi_ext_user_opts =3D g_hash_table_new(NULL, g_direct_equal);
>  }
>
>  typedef struct RISCVCPUMisaExtConfig {
> @@ -1819,94 +1824,104 @@ static void riscv_cpu_add_misa_properties(Object=
 *cpu_obj)
>      }
>  }
>
> -static Property riscv_cpu_extensions[] =3D {
> +typedef struct RISCVCPUMultiExtConfig {
> +    const char *name;
> +    uint32_t offset;
> +    bool enabled;
> +} RISCVCPUMultiExtConfig;
> +
> +#define MULTI_EXT_CFG_BOOL(_name, _prop, _defval) \
> +    {.name =3D _name, .offset =3D CPU_CFG_OFFSET(_prop), \
> +     .enabled =3D _defval}
> +
> +static RISCVCPUMultiExtConfig riscv_cpu_extensions[] =3D {
>      /* Defaults for standard extensions */
> -    DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
> -    DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> -    DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> -    DEFINE_PROP_BOOL("Zihintpause", RISCVCPU, cfg.ext_zihintpause, true)=
,
> -    DEFINE_PROP_BOOL("Zawrs", RISCVCPU, cfg.ext_zawrs, true),
> -    DEFINE_PROP_BOOL("Zfa", RISCVCPU, cfg.ext_zfa, true),
> -    DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> -    DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
> -    DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
> -    DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
> -    DEFINE_PROP_BOOL("Zve64d", RISCVCPU, cfg.ext_zve64d, false),
> -    DEFINE_PROP_BOOL("sstc", RISCVCPU, cfg.ext_sstc, true),
> -
> -    DEFINE_PROP_BOOL("smstateen", RISCVCPU, cfg.ext_smstateen, false),
> -    DEFINE_PROP_BOOL("svadu", RISCVCPU, cfg.ext_svadu, true),
> -    DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
> -    DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
> -    DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
> -
> -    DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
> -    DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
> -    DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
> -    DEFINE_PROP_BOOL("zbkb", RISCVCPU, cfg.ext_zbkb, false),
> -    DEFINE_PROP_BOOL("zbkc", RISCVCPU, cfg.ext_zbkc, false),
> -    DEFINE_PROP_BOOL("zbkx", RISCVCPU, cfg.ext_zbkx, false),
> -    DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
> -    DEFINE_PROP_BOOL("zk", RISCVCPU, cfg.ext_zk, false),
> -    DEFINE_PROP_BOOL("zkn", RISCVCPU, cfg.ext_zkn, false),
> -    DEFINE_PROP_BOOL("zknd", RISCVCPU, cfg.ext_zknd, false),
> -    DEFINE_PROP_BOOL("zkne", RISCVCPU, cfg.ext_zkne, false),
> -    DEFINE_PROP_BOOL("zknh", RISCVCPU, cfg.ext_zknh, false),
> -    DEFINE_PROP_BOOL("zkr", RISCVCPU, cfg.ext_zkr, false),
> -    DEFINE_PROP_BOOL("zks", RISCVCPU, cfg.ext_zks, false),
> -    DEFINE_PROP_BOOL("zksed", RISCVCPU, cfg.ext_zksed, false),
> -    DEFINE_PROP_BOOL("zksh", RISCVCPU, cfg.ext_zksh, false),
> -    DEFINE_PROP_BOOL("zkt", RISCVCPU, cfg.ext_zkt, false),
> -
> -    DEFINE_PROP_BOOL("zdinx", RISCVCPU, cfg.ext_zdinx, false),
> -    DEFINE_PROP_BOOL("zfinx", RISCVCPU, cfg.ext_zfinx, false),
> -    DEFINE_PROP_BOOL("zhinx", RISCVCPU, cfg.ext_zhinx, false),
> -    DEFINE_PROP_BOOL("zhinxmin", RISCVCPU, cfg.ext_zhinxmin, false),
> -
> -    DEFINE_PROP_BOOL("zicbom", RISCVCPU, cfg.ext_icbom, true),
> -    DEFINE_PROP_BOOL("zicboz", RISCVCPU, cfg.ext_icboz, true),
> -
> -    DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
> -
> -    DEFINE_PROP_BOOL("zca", RISCVCPU, cfg.ext_zca, false),
> -    DEFINE_PROP_BOOL("zcb", RISCVCPU, cfg.ext_zcb, false),
> -    DEFINE_PROP_BOOL("zcd", RISCVCPU, cfg.ext_zcd, false),
> -    DEFINE_PROP_BOOL("zce", RISCVCPU, cfg.ext_zce, false),
> -    DEFINE_PROP_BOOL("zcf", RISCVCPU, cfg.ext_zcf, false),
> -    DEFINE_PROP_BOOL("zcmp", RISCVCPU, cfg.ext_zcmp, false),
> -    DEFINE_PROP_BOOL("zcmt", RISCVCPU, cfg.ext_zcmt, false),
> +    MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
> +    MULTI_EXT_CFG_BOOL("Zifencei", ext_ifencei, true),
> +    MULTI_EXT_CFG_BOOL("Zicsr", ext_icsr, true),
> +    MULTI_EXT_CFG_BOOL("Zihintpause", ext_zihintpause, true),
> +    MULTI_EXT_CFG_BOOL("Zawrs", ext_zawrs, true),
> +    MULTI_EXT_CFG_BOOL("Zfa", ext_zfa, true),
> +    MULTI_EXT_CFG_BOOL("Zfh", ext_zfh, false),
> +    MULTI_EXT_CFG_BOOL("Zfhmin", ext_zfhmin, false),
> +    MULTI_EXT_CFG_BOOL("Zve32f", ext_zve32f, false),
> +    MULTI_EXT_CFG_BOOL("Zve64f", ext_zve64f, false),
> +    MULTI_EXT_CFG_BOOL("Zve64d", ext_zve64d, false),
> +    MULTI_EXT_CFG_BOOL("sstc", ext_sstc, true),
> +
> +    MULTI_EXT_CFG_BOOL("smstateen", ext_smstateen, false),
> +    MULTI_EXT_CFG_BOOL("svadu", ext_svadu, true),
> +    MULTI_EXT_CFG_BOOL("svinval", ext_svinval, false),
> +    MULTI_EXT_CFG_BOOL("svnapot", ext_svnapot, false),
> +    MULTI_EXT_CFG_BOOL("svpbmt", ext_svpbmt, false),
> +
> +    MULTI_EXT_CFG_BOOL("zba", ext_zba, true),
> +    MULTI_EXT_CFG_BOOL("zbb", ext_zbb, true),
> +    MULTI_EXT_CFG_BOOL("zbc", ext_zbc, true),
> +    MULTI_EXT_CFG_BOOL("zbkb", ext_zbkb, false),
> +    MULTI_EXT_CFG_BOOL("zbkc", ext_zbkc, false),
> +    MULTI_EXT_CFG_BOOL("zbkx", ext_zbkx, false),
> +    MULTI_EXT_CFG_BOOL("zbs", ext_zbs, true),
> +    MULTI_EXT_CFG_BOOL("zk", ext_zk, false),
> +    MULTI_EXT_CFG_BOOL("zkn", ext_zkn, false),
> +    MULTI_EXT_CFG_BOOL("zknd", ext_zknd, false),
> +    MULTI_EXT_CFG_BOOL("zkne", ext_zkne, false),
> +    MULTI_EXT_CFG_BOOL("zknh", ext_zknh, false),
> +    MULTI_EXT_CFG_BOOL("zkr", ext_zkr, false),
> +    MULTI_EXT_CFG_BOOL("zks", ext_zks, false),
> +    MULTI_EXT_CFG_BOOL("zksed", ext_zksed, false),
> +    MULTI_EXT_CFG_BOOL("zksh", ext_zksh, false),
> +    MULTI_EXT_CFG_BOOL("zkt", ext_zkt, false),
> +
> +    MULTI_EXT_CFG_BOOL("zdinx", ext_zdinx, false),
> +    MULTI_EXT_CFG_BOOL("zfinx", ext_zfinx, false),
> +    MULTI_EXT_CFG_BOOL("zhinx", ext_zhinx, false),
> +    MULTI_EXT_CFG_BOOL("zhinxmin", ext_zhinxmin, false),
> +
> +    MULTI_EXT_CFG_BOOL("zicbom", ext_icbom, true),
> +    MULTI_EXT_CFG_BOOL("zicboz", ext_icboz, true),
> +
> +    MULTI_EXT_CFG_BOOL("zmmul", ext_zmmul, false),
> +
> +    MULTI_EXT_CFG_BOOL("zca", ext_zca, false),
> +    MULTI_EXT_CFG_BOOL("zcb", ext_zcb, false),
> +    MULTI_EXT_CFG_BOOL("zcd", ext_zcd, false),
> +    MULTI_EXT_CFG_BOOL("zce", ext_zce, false),
> +    MULTI_EXT_CFG_BOOL("zcf", ext_zcf, false),
> +    MULTI_EXT_CFG_BOOL("zcmp", ext_zcmp, false),
> +    MULTI_EXT_CFG_BOOL("zcmt", ext_zcmt, false),
>  };
>
> -static Property riscv_cpu_vendor_exts[] =3D {
> -    DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
> -    DEFINE_PROP_BOOL("xtheadbb", RISCVCPU, cfg.ext_xtheadbb, false),
> -    DEFINE_PROP_BOOL("xtheadbs", RISCVCPU, cfg.ext_xtheadbs, false),
> -    DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
> -    DEFINE_PROP_BOOL("xtheadcondmov", RISCVCPU, cfg.ext_xtheadcondmov, f=
alse),
> -    DEFINE_PROP_BOOL("xtheadfmemidx", RISCVCPU, cfg.ext_xtheadfmemidx, f=
alse),
> -    DEFINE_PROP_BOOL("xtheadfmv", RISCVCPU, cfg.ext_xtheadfmv, false),
> -    DEFINE_PROP_BOOL("xtheadmac", RISCVCPU, cfg.ext_xtheadmac, false),
> -    DEFINE_PROP_BOOL("xtheadmemidx", RISCVCPU, cfg.ext_xtheadmemidx, fal=
se),
> -    DEFINE_PROP_BOOL("xtheadmempair", RISCVCPU, cfg.ext_xtheadmempair, f=
alse),
> -    DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
> -    DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOp=
s, false),
> +static RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] =3D {
> +    MULTI_EXT_CFG_BOOL("xtheadba", ext_xtheadba, false),
> +    MULTI_EXT_CFG_BOOL("xtheadbb", ext_xtheadbb, false),
> +    MULTI_EXT_CFG_BOOL("xtheadbs", ext_xtheadbs, false),
> +    MULTI_EXT_CFG_BOOL("xtheadcmo", ext_xtheadcmo, false),
> +    MULTI_EXT_CFG_BOOL("xtheadcondmov", ext_xtheadcondmov, false),
> +    MULTI_EXT_CFG_BOOL("xtheadfmemidx", ext_xtheadfmemidx, false),
> +    MULTI_EXT_CFG_BOOL("xtheadfmv", ext_xtheadfmv, false),
> +    MULTI_EXT_CFG_BOOL("xtheadmac", ext_xtheadmac, false),
> +    MULTI_EXT_CFG_BOOL("xtheadmemidx", ext_xtheadmemidx, false),
> +    MULTI_EXT_CFG_BOOL("xtheadmempair", ext_xtheadmempair, false),
> +    MULTI_EXT_CFG_BOOL("xtheadsync", ext_xtheadsync, false),
> +    MULTI_EXT_CFG_BOOL("xventanacondops", ext_XVentanaCondOps, false),
>  };
>
>  /* These are experimental so mark with 'x-' */
> -static Property riscv_cpu_experimental_exts[] =3D {
> -    DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
> +static RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] =3D {
> +    MULTI_EXT_CFG_BOOL("x-zicond", ext_zicond, false),
>
>      /* ePMP 0.9.3 */
> -    DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
> -    DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
> -    DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
> +    MULTI_EXT_CFG_BOOL("x-epmp", epmp, false),
> +    MULTI_EXT_CFG_BOOL("x-smaia", ext_smaia, false),
> +    MULTI_EXT_CFG_BOOL("x-ssaia", ext_ssaia, false),
>
> -    DEFINE_PROP_BOOL("x-zvfh", RISCVCPU, cfg.ext_zvfh, false),
> -    DEFINE_PROP_BOOL("x-zvfhmin", RISCVCPU, cfg.ext_zvfhmin, false),
> +    MULTI_EXT_CFG_BOOL("x-zvfh", ext_zvfh, false),
> +    MULTI_EXT_CFG_BOOL("x-zvfhmin", ext_zvfhmin, false),
>
> -    DEFINE_PROP_BOOL("x-zfbfmin", RISCVCPU, cfg.ext_zfbfmin, false),
> -    DEFINE_PROP_BOOL("x-zvfbfmin", RISCVCPU, cfg.ext_zvfbfmin, false),
> -    DEFINE_PROP_BOOL("x-zvfbfwma", RISCVCPU, cfg.ext_zvfbfwma, false),
> +    MULTI_EXT_CFG_BOOL("x-zfbfmin", ext_zfbfmin, false),
> +    MULTI_EXT_CFG_BOOL("x-zvfbfmin", ext_zvfbfmin, false),
> +    MULTI_EXT_CFG_BOOL("x-zvfbfwma", ext_zvfbfwma, false),
>  };
>
>  static Property riscv_cpu_options[] =3D {
> @@ -1925,6 +1940,49 @@ static Property riscv_cpu_options[] =3D {
>      DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 6=
4),
>  };
>
> +static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *n=
ame,
> +                                  void *opaque, Error **errp)
> +{
> +    const RISCVCPUMultiExtConfig *multi_ext_cfg =3D opaque;
> +    bool value;
> +
> +    if (!visit_type_bool(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    isa_ext_update_enabled(RISCV_CPU(obj), multi_ext_cfg->offset, value)=
;
> +
> +    g_hash_table_insert(multi_ext_user_opts,
> +                        GUINT_TO_POINTER(multi_ext_cfg->offset),
> +                        (gpointer)value);
> +}
> +
> +static void cpu_get_multi_ext_cfg(Object *obj, Visitor *v, const char *n=
ame,
> +                                  void *opaque, Error **errp)
> +{
> +    const RISCVCPUMultiExtConfig *multi_ext_cfg =3D opaque;
> +    bool value =3D isa_ext_is_enabled(RISCV_CPU(obj), multi_ext_cfg->off=
set);
> +
> +    visit_type_bool(v, name, &value, errp);
> +}
> +
> +static void cpu_add_multi_ext_prop(Object *cpu_obj,
> +                                   RISCVCPUMultiExtConfig *multi_cfg)
> +{
> +    object_property_add(cpu_obj, multi_cfg->name, "bool",
> +                        cpu_get_multi_ext_cfg,
> +                        cpu_set_multi_ext_cfg,
> +                        NULL, (void *)multi_cfg);
> +
> +    /*
> +     * Set def val directly instead of using
> +     * object_property_set_bool() to save the set()
> +     * callback hash for user inputs.
> +     */
> +    isa_ext_update_enabled(RISCV_CPU(cpu_obj), multi_cfg->offset,
> +                           multi_cfg->enabled);
> +}
> +
>  #ifndef CONFIG_USER_ONLY
>  static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
>                                      const char *name,
> @@ -1944,10 +2002,10 @@ static void cpu_set_cfg_unavailable(Object *obj, =
Visitor *v,
>  }
>  #endif
>
> -#define ADD_CPU_QDEV_PROPERTIES_ARRAY(_dev, _array) \
> +#define ADD_CPU_MULTIEXT_PROPS_ARRAY(_obj, _array) \
>      do { \
>          for (int i =3D 0; i < ARRAY_SIZE(_array); i++) { \
> -            qdev_property_add_static(_dev, &_array[i]); \
> +            cpu_add_multi_ext_prop(_obj, &_array[i]); \
>          } \
>      } while (0)
>
> @@ -2005,8 +2063,6 @@ static void riscv_cpu_add_kvm_properties(Object *ob=
j)
>   */
>  static void riscv_cpu_add_user_properties(Object *obj)
>  {
> -    DeviceState *dev =3D DEVICE(obj);
> -
>  #ifndef CONFIG_USER_ONLY
>      riscv_add_satp_mode_properties(obj);
>
> @@ -2018,10 +2074,13 @@ static void riscv_cpu_add_user_properties(Object =
*obj)
>
>      riscv_cpu_add_misa_properties(obj);
>
> -    ADD_CPU_QDEV_PROPERTIES_ARRAY(dev, riscv_cpu_extensions);
> -    ADD_CPU_QDEV_PROPERTIES_ARRAY(dev, riscv_cpu_options);
> -    ADD_CPU_QDEV_PROPERTIES_ARRAY(dev, riscv_cpu_vendor_exts);
> -    ADD_CPU_QDEV_PROPERTIES_ARRAY(dev, riscv_cpu_experimental_exts);
> +    ADD_CPU_MULTIEXT_PROPS_ARRAY(obj, riscv_cpu_extensions);
> +    ADD_CPU_MULTIEXT_PROPS_ARRAY(obj, riscv_cpu_vendor_exts);
> +    ADD_CPU_MULTIEXT_PROPS_ARRAY(obj, riscv_cpu_experimental_exts);
> +
> +    for (int i =3D 0; i < ARRAY_SIZE(riscv_cpu_options); i++) {
> +        qdev_property_add_static(DEVICE(obj), &riscv_cpu_options[i]);
> +    }
>  }
>
>  /*
> --
> 2.41.0
>
>

