Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AE3EB64D7
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 09:58:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qCdYh-0000gc-Aa; Fri, 23 Jun 2023 05:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qCdYf-0000g2-I9
 for qemu-riscv@nongnu.org; Fri, 23 Jun 2023 05:58:25 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qCdYd-0004Zb-R8
 for qemu-riscv@nongnu.org; Fri, 23 Jun 2023 05:58:25 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-986d8332f50so49288066b.0
 for <qemu-riscv@nongnu.org>; Fri, 23 Jun 2023 02:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687514302; x=1690106302;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=a5GWKYi79j3ikfG+l6dspI8GDixHDcu33wQUFtAOAd8=;
 b=gs+i7qlzuAZXkq+T7FUObxdxPVKvHTl0N7THUu9benWveD1LlclwP1iyqbXb5fGx52
 1wLl07KQOznaYXLVdzYQ9Uo2bLeVwFtqF242qDQqyfu5+tuqSVbr271ug8ibEz4hBvJ7
 bE8g5YTOHG+5oepL6gW4q3cPmTplLd1G+doXrzJGOPw63vKDn8gCHuWl5blgP0Fl0s6a
 6ObcCrg95ZvcSP1WfUF4O6MRVG1vsxx1gylZRVGOkSyLOJzjTb9k56LwE9Oa3ojDKri2
 lqYh85OJZek8aq4lUafJAAkXnS933gw936CefceyxhNKJTGM7mX0FHU3lv/xfvKCFwyG
 R8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687514302; x=1690106302;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a5GWKYi79j3ikfG+l6dspI8GDixHDcu33wQUFtAOAd8=;
 b=Pr3xUSogEopkTdhglJAMbToc8+A8fON+rh+cVESr0hKvPH9yve28YWtdIH5b4i1UKe
 e7coQ7iJ1xWDdoMed8aZKDrqK4O3n2rPaTU/YRfvGtVFZPHo5TswvEpDiO1bey0XLnCP
 sXU2CCApeZc4fOz0dRiDOptkki4R0AdlMVHPxAjCDuOwzO2iXtevh11GRPra8U0I+Tj/
 W4ZAckeCmW3FAkQ37AGcSplJtNzaB6BlSkv5myM0KA34LopcJ56kn/TJveehCSGc4P2n
 7eP0RoUhWixkOt/KNwhdm3UfeSAZKJMLBcuAeP9CYTB8VJOFR+SdDRPRJpCz6KTT3g8u
 FnZg==
X-Gm-Message-State: AC+VfDwxDjtf6WzpKl3e4cu9Gxt+HG8So8BvCt4bqDbD2EtzJ2Oficrd
 JrqIYjimc7sJRCToBrsN+C1Gtw==
X-Google-Smtp-Source: ACHHUZ4dFX6aul+Kwui7dGbFRzkIhikjmczQf8Mq6ojjRAmn5gPk6jQqBwg9HMeMfNrGoUDP+pwWMA==
X-Received: by 2002:a17:907:9283:b0:986:d833:3cf9 with SMTP id
 bw3-20020a170907928300b00986d8333cf9mr15932907ejc.39.1687514301979; 
 Fri, 23 Jun 2023 02:58:21 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 q25-20020a170906145900b0098503ba0db4sm5921496ejc.149.2023.06.23.02.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 02:58:21 -0700 (PDT)
Date: Fri, 23 Jun 2023 11:58:20 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v3 16/19] target/riscv/cpu.c: create KVM mock properties
Message-ID: <20230623-421ca497f9f83486881b9d9c@orel>
References: <20230622135700.105383-1-dbarboza@ventanamicro.com>
 <20230622135700.105383-17-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622135700.105383-17-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62f.google.com
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

On Thu, Jun 22, 2023 at 10:56:57AM -0300, Daniel Henrique Barboza wrote:
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
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 36 +++++++++++++++++++++++++++++++++---
>  1 file changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b65db165cc..f5209f0789 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1720,6 +1720,18 @@ static Property riscv_cpu_extensions[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> +
> +static void cpu_set_cfg_noop(Object *obj, Visitor *v,
> +                             const char *name,
> +                             void *opaque, Error **errp)
> +{
> +    bool value;
> +
> +    if (!visit_type_bool(v, name, &value, errp)) {
> +        return;
> +    }
> +}
> +
>  /*
>   * Add CPU properties with user-facing flags.
>   *
> @@ -1738,9 +1750,27 @@ static void riscv_cpu_add_user_properties(Object *obj)
>      riscv_cpu_add_misa_properties(obj);
>  
>      for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
> -        /* Check if KVM didn't create the property already */
> -        if (object_property_find(obj, prop->name)) {
> -            continue;
> +        if (riscv_running_kvm()) {
> +            /* Check if KVM didn't create the property already */
> +            if (object_property_find(obj, prop->name)) {
> +                continue;
> +            }
> +
> +            /*
> +             * Set every multi-letter extension that KVM doesn't
> +             * know as a no-op. This will allow users to set values
> +             * to them while keeping their internal state to 'false'.
> +             *
> +             * We're giving a pass for non-bool properties since they're
> +             * not related to the availability of extensions and can be
> +             * safely ignored as is.
> +             */
> +            if (prop->info == &qdev_prop_bool) {
> +                object_property_add(obj, prop->name, "bool",
> +                                    NULL, cpu_set_cfg_noop,
> +                                    NULL, NULL);
> +                continue;
> +            }
>          }
>  
>          qdev_property_add_static(dev, prop);
> -- 
> 2.41.0
>

I think we should actually fail with an error when the user tries to
enable an extension KVM doesn't support. Otherwise a user may be
confused as to why their Zawrs=on didn't provide them a machine with
Zawrs. And, when KVM learns how to provide that support to guests
(Zawrs is actually on my TODO...), then migrating the same VM to
later KVM/QEMU will actually enable the feature, possibly confusing
the guest.

So, we should probably just not add any extension properties to KVM
guests which can't be enabled. Then, as we add support to KVM, we'll
add the properties too.

Thanks,
drew

