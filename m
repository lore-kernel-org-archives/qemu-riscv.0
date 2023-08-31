Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF0EC83F32
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 12:49:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbh7Q-0000qe-GP; Thu, 31 Aug 2023 08:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbh7B-0000P4-Nl
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:49:40 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbh78-0002cW-Je
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:49:37 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-52bcd4db4cbso943904a12.1
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 05:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693486172; x=1694090972; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gV/i4Fa1YSLSBi2JYZiW04YTqO7hiOqiPdE6O6Jktfs=;
 b=jdfvKIbNcWqFFlIJtSmGQA5u1YbP+ucf69s/utDEK4Ofpd+5sWxMHVHs3PxD876Asy
 eG+veaybLhkoONpg6ahL/s6uCfxldGudTV6H/YlBgFcXa1RNZg6yf3tAAJuFVvRSUuYt
 G+X4+/GLFSX1a96QjCqrbrn5zN+BYc3OVA8/nVsU1tqDJ1vMEQnhzfZDvL5SoNa1Pd2a
 8AWpamwggLHTu2ICQlf7XDiT7p4fQ6BRlxUKjc26LgGz3RiB1lNsh3yvnvPlWgFBBl91
 63BCLflvs/ETThV59cl10HQN4ADkQGutU6XZNLk++DUh/E3Sw0fA1cw8Dp6hRxpmixtz
 px8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486172; x=1694090972;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gV/i4Fa1YSLSBi2JYZiW04YTqO7hiOqiPdE6O6Jktfs=;
 b=Cyx8JMyy1LqTjc5mgruXvt945rVl9OIALtp1a4wvJt7pvXYNKbX/zMKVttJrrhCKHw
 9vHzWNtOA6CY53Ax6hnj4ADR17+neufvDCl6oR7BkpTs/vHhNyYrT2olBqr6lue3U2ch
 Pz4XFhk4s2uMsOfKPJEPJ1RCdDyeRLM75MufAgIAkuJHo4DbjORgpRgFmLL0SM7ACebj
 pnf83pZ3yZRTNR+oKAwbUZUCxF/6RL4XvXk30H94Yo+bJ+rkTZd2eMQT64pFJV/jBn/d
 DU2AkJGlRtZAZYNZV9RzGiwAStMKRgJUVlBOEQNnyoCp340NY4NYSQ4gDyISbG1oFGjB
 TtkQ==
X-Gm-Message-State: AOJu0YwMNaNNdy3qMVMu0kEZ15HKu+rzrfoFfxoQq1pn3oz+ld3jyrNW
 gCGvvXPVW1O2sYgnrY6TAUbclA==
X-Google-Smtp-Source: AGHT+IHOcfvNLPQXjb0cZ/7jSigR109XAq84PoCEhajszC4kxdxvjsNz5mxKpjPSGpgWSJvFlwGY1g==
X-Received: by 2002:aa7:c3c3:0:b0:525:6e47:10f6 with SMTP id
 l3-20020aa7c3c3000000b005256e4710f6mr4239299edr.22.1693486172558; 
 Thu, 31 Aug 2023 05:49:32 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 j4-20020aa7c0c4000000b005232e637c24sm746252edp.84.2023.08.31.05.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 05:49:32 -0700 (PDT)
Date: Thu, 31 Aug 2023 14:49:31 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH RESEND v8 02/20] target/riscv/cpu.c: skip 'bool' check
 when filtering KVM props
Message-ID: <20230831-95004afe3f0224481179037f@orel>
References: <20230824221440.484675-1-dbarboza@ventanamicro.com>
 <20230824221440.484675-3-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824221440.484675-3-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, Aug 24, 2023 at 07:14:22PM -0300, Daniel Henrique Barboza wrote:
> After the introduction of riscv_cpu_options[] all properties in
> riscv_cpu_extensions[] are booleans. This check is now obsolete.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6a4f95991d..6aac3ba1d1 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1970,17 +1970,11 @@ static void riscv_cpu_add_user_properties(Object *obj)
>               * Set the default to disabled for every extension
>               * unknown to KVM and error out if the user attempts
>               * to enable any of them.
> -             *
> -             * We're giving a pass for non-bool properties since they're
> -             * not related to the availability of extensions and can be
> -             * safely ignored as is.
>               */
> -            if (prop->info == &qdev_prop_bool) {
> -                object_property_add(obj, prop->name, "bool",
> -                                    NULL, cpu_set_cfg_unavailable,
> -                                    NULL, (void *)prop->name);
> -                continue;
> -            }
> +            object_property_add(obj, prop->name, "bool",
> +                                NULL, cpu_set_cfg_unavailable,
> +                                NULL, (void *)prop->name);
> +            continue;
>          }
>  #endif
>          qdev_property_add_static(dev, prop);
> -- 
> 2.41.0
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

