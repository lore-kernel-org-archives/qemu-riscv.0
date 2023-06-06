Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E681DC77B73
	for <qemu-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 15:33:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6Ygn-0007c4-LU; Tue, 06 Jun 2023 11:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q6Ygl-0007WE-KB
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 11:33:39 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1q6Ygj-0005g5-Af
 for qemu-riscv@nongnu.org; Tue, 06 Jun 2023 11:33:39 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-30e5289105cso454606f8f.1
 for <qemu-riscv@nongnu.org>; Tue, 06 Jun 2023 08:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686065615; x=1688657615;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WQ+qmvaoI943mqswOR5WzeVj91VYk5PhZGEgXLoUUQ4=;
 b=igYXM+S2oY/xVXZLEypB0qKHZdb+R+NFJWqlOTvLRqy/XBd9+Ku9XZeruYcB/Xs2B0
 slY+njS1pTIEO2/9YmsX8TrA0skXostH87hpJSZ7FDq4jAcDR4ybgtxVGpeOgjAh7li7
 4H2kb+m6RZz7RI2il0xAD18GxvtyEosRRKtzhMKfhmiakk1DAC40yC2CTk17b/0dAuZS
 /6zG7U3I4+bsiDpprDE+yxuFJDXqA6t/jsW3+aa2T07EkpSVXV5stSkra090TUlGLCDc
 7zsccIx0RaKw7JxWG5IrJitHPbayjnb4WCAhYtcmFzxrS/if9/ZrRkV9yFMWShnvcNhX
 wNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686065615; x=1688657615;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WQ+qmvaoI943mqswOR5WzeVj91VYk5PhZGEgXLoUUQ4=;
 b=VJaAvcIMQUKgrXygL48PLMLRoKW1sQ8lEnv3YMqY12N1cgbaJJizTOPSOf5ofYg8tX
 it6t54Iz+4FoQ3NIRAc9xLFHuyx0CX9XLefTVJcGxaaQ3CoBJVrAOAtpKJd4bivLFFWj
 napNYmJeWIGHOfDEMBCNt4G65b2/1byAQ9auPKJ6y2gcvvj7rXQ8ZFP0TPgCmidNOe8V
 nv542Tg/Z6xCx1ESoy7esOy0qSgzMp9ibFTWKMXfcoqji2uc67upv+jh61leWUk+VdnW
 nHozWylnhOvaGMW0HWmVAUYxxq6o7SqpXeSATS3B23vnRI4U1KNiWaVSpau6ASnWgztr
 8H+Q==
X-Gm-Message-State: AC+VfDzFCWK/4Gj8CbHh4/s9C6BzW+HLtkHD09Vg2P9NCJQoZUY2VIr+
 xj3F2jCPjrS3gtmD211qyzwYCg==
X-Google-Smtp-Source: ACHHUZ5PazkUqhdWM7jum/KrMWMVYIw/WLWpBjL3urCFLBSRt2X1jyPGhkYblb235/hIht0djqHF/Q==
X-Received: by 2002:a5d:458c:0:b0:309:5029:95a9 with SMTP id
 p12-20020a5d458c000000b00309502995a9mr2185168wrq.32.1686065614783; 
 Tue, 06 Jun 2023 08:33:34 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a5d4bcc000000b0030e5482bd8esm482888wrt.90.2023.06.06.08.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 08:33:34 -0700 (PDT)
Date: Tue, 6 Jun 2023 17:33:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH 05/16] target/riscv/cpu.c: restrict 'marchid' value
Message-ID: <20230606-6d728089dc9429f72ee9bc83@orel>
References: <20230530194623.272652-1-dbarboza@ventanamicro.com>
 <20230530194623.272652-6-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530194623.272652-6-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, May 30, 2023 at 04:46:12PM -0300, Daniel Henrique Barboza wrote:
> 'marchid' shouldn't be set to a different value as previously set for
> named CPUs.
> 
> For all other CPUs it shouldn't be freely set either - the spec requires
> that 'marchid' can't have the MSB (most significant bit) set and every
> other bit set to zero, i.e. 0x80000000 is an invalid 'marchid' value for
> 32 bit CPUs.
> 
> As with 'mimpid', setting a default value based on the current QEMU
> version is not a good idea because it implies that the CPU
> implementation changes from one QEMU version to the other. Named CPUs
> should set 'marchid' to a meaningful value instead, and generic CPUs can
> set to any valid value.
> 
> For the 'veyron-v1' CPU this is the error thrown if 'marchid' is set to
> a different val:
> 
> $ ./build/qemu-system-riscv64 -M virt -nographic -cpu veyron-v1,marchid=0x80000000
> qemu-system-riscv64: can't apply global veyron-v1-riscv-cpu.marchid=0x80000000:
>     Unable to change veyron-v1-riscv-cpu marchid (0x8000000000010000)
> 
> And, for generics CPUs, this is the error when trying to set to an
> invalid val:
> 
> $ ./build/qemu-system-riscv64 -M virt -nographic -cpu rv64,marchid=0x8000000000000000
> qemu-system-riscv64: can't apply global rv64-riscv-cpu.marchid=0x8000000000000000:
>     Unable to set marchid with MSB (64) bit set and the remaining bits zero
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 53 ++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 46 insertions(+), 7 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ed3b33343c..d6e23bfd83 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -38,11 +38,6 @@
>  #include "tcg/tcg.h"
>  
>  /* RISC-V CPU definitions */
> -
> -#define RISCV_CPU_MARCHID   ((QEMU_VERSION_MAJOR << 16) | \
> -                             (QEMU_VERSION_MINOR << 8)  | \
> -                             (QEMU_VERSION_MICRO))
> -
>  static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
>  
>  struct isa_ext_data {
> @@ -1722,8 +1717,6 @@ static void riscv_cpu_add_user_properties(Object *obj)
>  static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
>  
> -    DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
> -
>  #ifndef CONFIG_USER_ONLY
>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
>  #endif
> @@ -1854,6 +1847,48 @@ static void cpu_set_mimpid(Object *obj, Visitor *v, const char *name,
>      cpu->cfg.mimpid = value;
>  }
>  
> +static void cpu_set_marchid(Object *obj, Visitor *v, const char *name,
> +                            void *opaque, Error **errp)
> +{
> +    bool dynamic_cpu = riscv_cpu_is_dynamic(obj);
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +    uint64_t prev_val = cpu->cfg.marchid;
> +    uint64_t value, invalid_val;
> +    uint32_t mxlen = 0;
> +
> +    if (!visit_type_uint64(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (!dynamic_cpu && prev_val != value) {
> +        error_setg(errp, "Unable to change %s marchid (0x%lx)",
> +                   object_get_typename(obj), prev_val);
> +        return;
> +    }
> +
> +    switch (riscv_cpu_mxl(&cpu->env)) {
> +    case MXL_RV32:
> +        mxlen = 32;
> +        break;
> +    case MXL_RV64:
> +    case MXL_RV128:
> +        mxlen = 64;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    invalid_val = 1LL << (mxlen - 1);
> +
> +    if (value == invalid_val) {
> +        error_setg(errp, "Unable to set marchid with MSB (%u) bit set "
> +                         "and the remaining bits zero", mxlen);
> +        return;
> +    }
> +
> +    cpu->cfg.marchid = value;
> +}
> +
>  static void riscv_cpu_class_init(ObjectClass *c, void *data)
>  {
>      RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
> @@ -1893,6 +1928,10 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>                                cpu_set_mimpid,
>                                NULL, NULL);
>  
> +    object_class_property_add(c, "marchid", "uint64", NULL,
> +                              cpu_set_marchid,
> +                              NULL, NULL);
> +

get?

>      device_class_set_props(dc, riscv_cpu_properties);
>  }
>  
> -- 
> 2.40.1
> 
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

