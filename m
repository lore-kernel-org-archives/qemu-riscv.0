Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA12EB64D9
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 08:12:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qE3nI-0006rk-3O; Tue, 27 Jun 2023 04:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qE3nG-0006qn-CN
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 04:11:22 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qE3nE-00045T-Fi
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 04:11:22 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-51da8a744c4so670229a12.0
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 01:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687853478; x=1690445478;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QGhtgikDkTHQR3mKxUZoeEzAiGCdraUqtSCubdSLM1E=;
 b=O0YYsgmJSk/Nx0dwe80KBGq0nPxO8lHcTPcuye1BP03KDr88Jj42wWRWZHW5XEVsvD
 2n+lVLdOTTfZzICSGLwmZwxk/KHXZwCL/pYa8q/iiXvO8oDZMOkGvuyBNJu/toYnOzYj
 +NwWoDxjfYJ5AUGbcP66hXGL0UzIlfozb4HJz40/6iwIf4Qcutvases/jEPN1Xd8Bhe7
 8TVrtsdhPFoeVM9j1xt4A7HFBlHti/1jLSnCoAZPWjcQM6U5x1gh7VKsfaUdeYO2wr15
 A13cdzLffcj1v+piNBltn7Hg6dj6HQFWU2g2XQ1HJEytU8p9qXIoj9Dq0BliofZqQIFi
 2dvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687853478; x=1690445478;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QGhtgikDkTHQR3mKxUZoeEzAiGCdraUqtSCubdSLM1E=;
 b=kVCn6116cQ5rQQdu7LDnpf/o9k9C4mGU2ZElg4MPP/LjNURux9iEkq3sELBYNkyqFV
 p21h3ZX2POuu4He3n5kcGEazZ8fc9b3a6tq7XaD/GjyGgs/iElW0RRBUJeExeSH/KANh
 ETXqrLOiZB2JAi6nNi7cg59T7zF0C9zmxi18Wb6rO44StxbaPvju7r0jOy2H/LUsKHkC
 tMDHXKcWrf/gSZLQmPgfDBNlj48QRTjTi6JzIEysc8VdmOklC3xFHBI1Mbt2T9tMRQaa
 i/FT/NyUnsGbcFEMySymAMgFoC9rEX2zbxINPy/9TuyZy1qwI8x/OErcid5Qf7gvjJPl
 7vkA==
X-Gm-Message-State: AC+VfDxLlgsgXD883QWoVMrDZ4qkH2/jDWLw3SrjvtnXe9wFulNUO8lT
 7srg/nnUr98DIuBsJgVW3qgEdA==
X-Google-Smtp-Source: ACHHUZ7v4iOywnXWldcBg/7w2X9B6mmst8qWHoUujU5OlK/f2DIi1NMWju7P+7a7nfdEH4deVkGxWg==
X-Received: by 2002:a05:6402:1496:b0:51d:91ef:c836 with SMTP id
 e22-20020a056402149600b0051d91efc836mr4191133edv.32.1687853478407; 
 Tue, 27 Jun 2023 01:11:18 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 v14-20020aa7d80e000000b0051a59d81c4dsm3622319edq.3.2023.06.27.01.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 01:11:17 -0700 (PDT)
Date: Tue, 27 Jun 2023 10:11:16 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v4 16/19] target/riscv/cpu.c: create KVM mock properties
Message-ID: <20230627-204449ad8ad9fccf5411fec1@orel>
References: <20230626220209.22142-1-dbarboza@ventanamicro.com>
 <20230626220209.22142-17-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230626220209.22142-17-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x52c.google.com
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

On Mon, Jun 26, 2023 at 07:02:06PM -0300, Daniel Henrique Barboza wrote:
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
> mock/no-op boolean property for every non-KVM extension in
> riscv_cpu_extensions[]. Then, when running KVM, users are still free to
> set extensions at will, we'll treat non-KVM extensions as a no-op, and
> riscv_isa_string_ext() will not report bogus extensions in the DT.

We're no longer treating these as no-ops. We're now intercepting attempts
to set unsupported extensions and erroring out.

> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 40 +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 37 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b65db165cc..ad4b0e3490 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1720,6 +1720,22 @@ static Property riscv_cpu_extensions[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> +
> +static void cpu_set_cfg_noop(Object *obj, Visitor *v,

As stated above, I don't think 'noop' conveys the right message.

> +                             const char *name,
> +                             void *opaque, Error **errp)
> +{
> +    const char *propname = opaque;
> +    bool value;
> +
> +    if (!visit_type_bool(v, name, &value, errp)) {
> +        return;
> +    }
> +

We should only error out when value == true. Just like the other
KVM-unsupported extensions, we don't mind if the user explicitly
disables something we can't handle.

> +    error_setg(errp, "extension %s is not available with KVM",
> +               propname);
> +}
> +
>  /*
>   * Add CPU properties with user-facing flags.
>   *
> @@ -1738,9 +1754,27 @@ static void riscv_cpu_add_user_properties(Object *obj)
>      riscv_cpu_add_misa_properties(obj);
>  
>      for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
> -        /* Check if KVM didn't create the property already */
> -        if (object_property_find(obj, prop->name)) {
> -            continue;
> +        if (riscv_running_kvm()) {
> +            /* Check if KVM didn't create the property already */

The check is for the positive, so I think the comment would read better as

 "Check if KVM created the property already."

> +            if (object_property_find(obj, prop->name)) {
> +                continue;
> +            }
> +
> +            /*
> +             * Set every multi-letter extension that KVM doesn't
> +             * know as a no-op. This will allow users to set values

How about "Set the default to disabled for every extension unknown to
KVM and error out if the user attempts to enable any of them."


> +             * to them while keeping their internal state to 'false'.
> +             *
> +             * We're giving a pass for non-bool properties since they're
> +             * not related to the availability of extensions and can be
> +             * safely ignored as is.

I guess that's OK for now. Ideally, we wouldn't have any non-booleans as
that will complicate QMP cpu model expansion. Instead, we'd have booleans
for valid values. For example, for vlen, we'd have vlen128, vlen256,
vlen512, etc.. Figuring out how to do that best is for another series
though.

> +             */
> +            if (prop->info == &qdev_prop_bool) {
> +                object_property_add(obj, prop->name, "bool",
> +                                    NULL, cpu_set_cfg_noop,
> +                                    NULL, (void *)prop->name);
> +                continue;
> +            }
>          }
>  
>          qdev_property_add_static(dev, prop);
> -- 
> 2.41.0
>

Thanks,
drew

