Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55124EE6457
	for <qemu-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 12:05:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qh7ZC-0003oi-Vd; Fri, 15 Sep 2023 08:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qh7Z9-0003mt-OD
 for qemu-riscv@nongnu.org; Fri, 15 Sep 2023 08:04:56 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qh7Z6-0007G1-3z
 for qemu-riscv@nongnu.org; Fri, 15 Sep 2023 08:04:55 -0400
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50079d148aeso3495989e87.3
 for <qemu-riscv@nongnu.org>; Fri, 15 Sep 2023 05:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1694779488; x=1695384288; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GcDYASak6gXDw2kC65DG4IkFh8JrmDWCAM3fgkhXYYE=;
 b=YsJLvWpOHvIJ4YNxIZzuflqAU10abWvijEXVCD7uDh5jgIdddBAByL54xJYcXx5VmD
 wgr+tjKnnumrGHBW0xMVT9gdN1g0MhC8Im2x2KN1b5bvzw4qAqd8KUnkS04jv7Gf5Xy9
 dhTTCtDOMdoq2R2WyMDg/ZYmknyjm3h/mm94bXqEGrTJYgLuwO90gK8fYVrazTwrWKQO
 zhF6Y5YLFWCXHSXwKFiiw1TeUnHs20+rDyktXMfNfW3XrRd1vVif92+Ev+gi0mgqCKaL
 8encgF7KATkr+CsKA/xpgPGnTEoKn7P2tuB+XSftt2QASML4U6mj7iTKE0dFzDDuf97B
 ya9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694779488; x=1695384288;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GcDYASak6gXDw2kC65DG4IkFh8JrmDWCAM3fgkhXYYE=;
 b=iChV9MGIurltdQKd+MO7rqxNPxi32SJGDMQYRd2EdUhhJGLcKo8GEvR1GyGxIO+4mi
 U99RdpfaOg9Gv4TFhVXMDzXLpV43d47LxNAUOxwZny3k6qBiDW56DcRwAlymx7mGhDjk
 7ljIq75TM4LVPp1qeBwBpQM+43l7aYKEMGdQtNICCU51EQZBJzuDWUD2E0lAbl233FA5
 WP+rCYzGbIqoqzf18lxMdhIG8y56csy4vUhKdmSqq3jWYOudyNoElqF0U4ik/EPArMxs
 l3n3jOLpDOx/MItoHkN5Q3JV3AMn1/uAwmWtfZsLif5m2ncdlS0E04Ltw6+sFVnzAqEB
 5BCQ==
X-Gm-Message-State: AOJu0YwIHLAQWvqA3Tuj76TArL3ziL1JMUHLxdGQW+aAcq6k9+pUltXP
 ZEiTvXpRo+JLYc1nokIbjkHeuw==
X-Google-Smtp-Source: AGHT+IG5xhC633rMEk66/xRlMOmn7jFnhrqjKLI9du3Di+BJFuAhkIa57rOrinSClsl6AuLMRUC0tg==
X-Received: by 2002:ac2:41c9:0:b0:4fe:279b:7603 with SMTP id
 d9-20020ac241c9000000b004fe279b7603mr1369846lfi.14.1694779488296; 
 Fri, 15 Sep 2023 05:04:48 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 o18-20020aa7c512000000b0052540e85390sm2214647edq.43.2023.09.15.05.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 05:04:47 -0700 (PDT)
Date: Fri, 15 Sep 2023 14:04:47 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org
Subject: Re: [PATCH v10 03/20] target/riscv/cpu.c: split kvm prop handling to
 its own helper
Message-ID: <20230915-b62e36309ae1e7622763f04b@orel>
References: <20230912132423.268494-1-dbarboza@ventanamicro.com>
 <20230912132423.268494-4-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912132423.268494-4-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=ajones@ventanamicro.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, Sep 12, 2023 at 10:24:06AM -0300, Daniel Henrique Barboza wrote:
> Future patches will split the existing Property arrays even further, and
> the existing code in riscv_cpu_add_user_properties() will start to scale
> bad with it because it's dealing with KVM constraints mixed in with TCG
> constraints. We're going to pay a high price to share a couple of common
> lines of code between the two.
> 
> Create a new kvm_riscv_cpu_add_kvm_properties() helper that will be
> forked from riscv_cpu_add_user_properties() if we're running KVM. The
> helper includes all properties that a KVM CPU will add. The rest of
> riscv_cpu_add_user_properties() body will then be relieved from having
> to deal with KVM constraints.
> 
> The helper was declared in kvm_stubs.h, while being implemented in
> cpu.c, to allow '--enable-debug' builds to work. The compiler won't
> remove the kvm_riscv_cpu_add_kvm_properties() reference when
> 'kvm_enabled()' is false if we end up with an unused function. Even
> though being a KVM only helper we can't implement it in kvm.c due to its
> many dependencies inside cpu.c, so make it public in kvm_riscv.h and
> keep its implementation in cpu.c for now. We'll move it to kvm.c in the
> near future.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c       | 65 +++++++++++++++++++++++++---------------
>  target/riscv/kvm_riscv.h |  3 ++
>  2 files changed, 44 insertions(+), 24 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index db640e7460..7b7c5649e7 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1924,7 +1924,7 @@ static Property riscv_cpu_options[] = {
>      DEFINE_PROP_UINT16("cboz_blocksize", RISCVCPU, cfg.cboz_blocksize, 64),
>  };
>  
> -#ifndef CONFIG_USER_ONLY
> +#ifdef CONFIG_KVM
>  static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
>                                      const char *name,
>                                      void *opaque, Error **errp)
> @@ -1941,6 +1941,44 @@ static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
>                     propname);
>      }
>  }
> +
> +static void riscv_cpu_add_kvm_unavail_prop(Object *obj, const char *prop_name)
> +{
> +    /* Check if KVM created the property already */
> +    if (object_property_find(obj, prop_name)) {
> +        return;
> +    }
> +
> +    /*
> +     * Set the default to disabled for every extension
> +     * unknown to KVM and error out if the user attempts
> +     * to enable any of them.
> +     */
> +    object_property_add(obj, prop_name, "bool",
> +                        NULL, cpu_set_cfg_unavailable,
> +                        NULL, (void *)prop_name);
> +}
> +
> +void kvm_riscv_cpu_add_kvm_properties(Object *obj)
> +{
> +    Property *prop;
> +    DeviceState *dev = DEVICE(obj);
> +
> +    kvm_riscv_init_user_properties(obj);
> +    riscv_cpu_add_misa_properties(obj);
> +
> +    for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
> +        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
> +    }
> +
> +    for (int i = 0; i < ARRAY_SIZE(riscv_cpu_options); i++) {
> +        /* Check if KVM created the property already */
> +        if (object_property_find(obj, riscv_cpu_options[i].name)) {
> +            continue;
> +        }
> +        qdev_property_add_static(dev, &riscv_cpu_options[i]);
> +    }
> +}
>  #endif

IIUC, we're leaving kvm_riscv_cpu_add_kvm_properties() in cpu.c due to its
dependencies, such as riscv_cpu_add_misa_properties(), but I don't
understand why it needs to be public, since it's still only called from
this file. Also, to handle the clang debug build I'd guess we still need
a !CONFIG_KVM stub, so, in this file, I suggest we do something like,

#ifdef CONFIG_KVM
static void kvm_riscv_cpu_add_kvm_properties(obj)
{ ... }
#else
static void kvm_riscv_cpu_add_kvm_properties(obj) {}
#endif

But, all that said, I know this is all getting reworked in another
in-flight series, so I'm not real worried about exactly how it comes
together at the moment. Assuming we pass all compile tests like the
clang debug test, then

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

