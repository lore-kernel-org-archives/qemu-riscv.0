Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C687EB64DC
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 09:17:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEnlz-0001Nt-0H; Thu, 29 Jun 2023 05:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qEnlx-0001Nb-Qd
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 05:17:05 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qEnlv-0003PR-Oq
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 05:17:05 -0400
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b69a48368fso6426001fa.0
 for <qemu-riscv@nongnu.org>; Thu, 29 Jun 2023 02:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688030222; x=1690622222;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hWj2ttQ8jb3fXTntAE7ptEjkjqiuagHEdNt/Cpx+LFk=;
 b=jhwPA3tIISfITFKtrQBiYn7MUP0N5wKWieHAgCuL/NoRvfGxW+WnMImvWPD23Ms7vY
 i105OztOXObB1iPOWpQRGsUhb+oDedYq/ck8Vo8xr8JnKFiqea5HTkEYBsupVyHJweqq
 x8MlZE2CkQDwX0+fmtlvYsrZUgsBUk2bxqUZlTRtKaGaTbW9p6IFgn93p8ellYMiPw7K
 dRGmmn+b/QnZsAPbZA9bNVDODLyLOazX8cSl+RoVe3yoI59kOKmj5ZzjLHCTHCgsO+/2
 kuiEgRwyEkSrysFCpCspFMuJdS+X2xZSx+2L5GzXoAczOXz/WvIrzJqlLzyjWFPAdUGr
 4JTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688030222; x=1690622222;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hWj2ttQ8jb3fXTntAE7ptEjkjqiuagHEdNt/Cpx+LFk=;
 b=RI3hrDUvsZqrtcsP4vaO31D3mcg5ugEpRGS7vfkPEbKNd25/ghnHQNAV0GgX8ZP4Ru
 8zO9JXApYLN16JAYwCa4QJPMhFw2VlguYx1OPqDwN2f67FSS8d9HwCiErMwudW2V+mZU
 L4yvw3dVYtTm88RM3+PWtv9JDevGmO8AKmPmydbjO+F+5FenUfD//ITtmEcpSvaxu5uY
 +CRj6osnSrG2ey0HU/EQKgQOoSFDp4vHpQWyzWoQPz5LBE1Nq1CV3F1IRCOp9HdzvfCr
 NXzuASWsRDS8FNzAd9OhDq5aBGOxf+FdmH8rCInEX7meNZPsRBTxGzAtXcDpnR+JLdFb
 DYIg==
X-Gm-Message-State: ABy/qLZWSHndlbmul1fLpIBhqAinXzNPw4F2cK6GLpJWCapRv4rYOx+g
 /SXlSfc2NikEUqRjKhUVN0PCGw==
X-Google-Smtp-Source: APBJJlGF0tK7cm98vpEhHiUx3CYzmnFdwHVR018NkFR3iXDXqGXV+eCUiWlgwOTkDuNe77ZZ/QBgdg==
X-Received: by 2002:a2e:9cc5:0:b0:2b6:ca54:8d13 with SMTP id
 g5-20020a2e9cc5000000b002b6ca548d13mr655024ljj.29.1688030221928; 
 Thu, 29 Jun 2023 02:17:01 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 12-20020a05600c028c00b003fbaade072dsm5543403wmk.23.2023.06.29.02.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 02:17:01 -0700 (PDT)
Date: Thu, 29 Jun 2023 11:17:00 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org
Subject: Re: [PATCH v6 17/20] target/riscv/cpu.c: create KVM mock properties
Message-ID: <20230629-a8a185516a5db22afdebcc6d@orel>
References: <20230628213033.170315-1-dbarboza@ventanamicro.com>
 <20230628213033.170315-18-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230628213033.170315-18-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=ajones@ventanamicro.com; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, Jun 28, 2023 at 06:30:30PM -0300, Daniel Henrique Barboza wrote:
> KVM-specific properties are being created inside target/riscv/kvm.c. But
> at this moment we're gathering all the remaining properties from TCG and
> adding them as is when running KVM. This creates a situation where
> non-KVM properties are setting flags to 'true' due to its default
> settings (e.g.  Zawrs). Users can also freely enable them via command
> line.
> 
> This doesn't impact runtime per se because KVM doesn't care about these
> flags, but code such as riscv_isa_string_ext() take those flags into
> account. The result is that, for a KVM guest, setting non-KVM properties
> will make them appear in the riscv,isa DT.
> 
> We want to keep the same API for both TCG and KVM and at the same time,
> when running KVM, forbid non-KVM extensions to be enabled internally. We
> accomplish both by changing riscv_cpu_add_user_properties() to add a
> mock boolean property for every non-KVM extension in
> riscv_cpu_extensions[]. Then, when running KVM, users are still free to
> set extensions at will, but we'll error out if a non-KVM extension is
> enabled. Setting such extension to 'false' will be ignored.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 79c8ffe6b7..6d7a0bc4ae 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1731,6 +1731,26 @@ static Property riscv_cpu_extensions[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> +
> +#ifndef CONFIG_USER_ONLY
> +static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
> +                                    const char *name,
> +                                    void *opaque, Error **errp)
> +{
> +    const char *propname = opaque;
> +    bool value;
> +
> +    if (!visit_type_bool(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (value) {
> +        error_setg(errp, "extension %s is not available with KVM",
> +                   propname);
> +    }
> +}
> +#endif
> +
>  /*
>   * Add CPU properties with user-facing flags.
>   *
> @@ -1759,6 +1779,22 @@ static void riscv_cpu_add_user_properties(Object *obj)
>              if (object_property_find(obj, prop->name)) {
>                  continue;
>              }
> +
> +            /*
> +             * Set the default to disabled for every extension
> +             * unknown to KVM and error out if the user attempts
> +             * to enable any of them.
> +             *
> +             * We're giving a pass for non-bool properties since they're
> +             * not related to the availability of extensions and can be
> +             * safely ignored as is.
> +             */
> +            if (prop->info == &qdev_prop_bool) {
> +                object_property_add(obj, prop->name, "bool",
> +                                    NULL, cpu_set_cfg_unavailable,
> +                                    NULL, (void *)prop->name);
> +                continue;
> +            }
>          }
>  #endif
>          qdev_property_add_static(dev, prop);
> -- 
> 2.41.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

