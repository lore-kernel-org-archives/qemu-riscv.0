Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F2AC07545
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 16:16:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvgYI-0004kr-Nf; Wed, 25 Oct 2023 12:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qvgYE-0004hR-5Y
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 12:16:10 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qvgYC-0007Qf-Lt
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 12:16:09 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-53e84912038so8927203a12.1
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 09:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698250567; x=1698855367; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=j2ib0fhVeCJUTiOrnrgWdlmaTu/2AusKSY1aBo054ng=;
 b=lv2PMp66P5/iRK8jQ2JyidTfgTjXYik/8m9RSS3IZJBJ9zT0dbZn0DnQU8emseXO87
 FMfgMs4jZYd2FL4LrD9J1Z/UqgsUCsu1zPBab2Sy1I3VWwlG3JPEUYViIHGdNUSSp/I0
 HbazEjF21OLpJLO+GjTcLgL+HKuyoRGh1zjyY8qO9LanhtIcDNHFaeglhuOoOm35SM8i
 jFqdjZsMBEYOkiUx/2kmv97+PNjsTY0h/KXfeTRx2k2ZjRCvhLVIk7Ay467OIcw+oYF1
 tOCLr7ngrb/bvc7kU0yUV+EFQ6aOc3XCbxv/gb1HrgFDFc94gdkUcHY5uAedsp622yHi
 2xuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698250567; x=1698855367;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j2ib0fhVeCJUTiOrnrgWdlmaTu/2AusKSY1aBo054ng=;
 b=FrvOAMPGtgDv8BeQU1tN5S4WjRcyRGr4MB2ZhXeb3b3oqYh99D5ccpqp4C2nwSeCbu
 hlCuTbTyT1BcxEZm+qFhzlHA3utGY4qRFcZj8WiR0Qoz/8cxtjXVCpka5yu7J8JwT5le
 aZOr7e68jXOZuPGCq5oGZwSULYH6tk9tMAEWToR/pLj75wvUFyvi32sbBa2axG5yf/uj
 3sqn9XhzLWyPLtrdEI4QHKrA9V6TDJ6NV+y7ayJ2T3xErWEJLb3KQwFqStfqzeWBtHGG
 uhF8lafgeHeWd4an1HzKPc59jXP3UmFpAni68ePWXh/0IerVXAWNnFN8a+NqkJRuoUEM
 RHfg==
X-Gm-Message-State: AOJu0Yx6YRtyzjdM2HT6daJL9D3tqC/6EnJ2UiVKEfCZJmd2a4/Z/lu8
 vpyZrnDsPlgqxit0al8zg/d0Pw==
X-Google-Smtp-Source: AGHT+IFueLOPKrlT5tZ9qiGhlD8jb5dUztrzVdngmnP2DBxEogppubrXqy3goCAFmK/QljcisLrnoA==
X-Received: by 2002:a05:6402:518a:b0:53d:b3c3:57fc with SMTP id
 q10-20020a056402518a00b0053db3c357fcmr12253806edd.3.1698250566777; 
 Wed, 25 Oct 2023 09:16:06 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 co2-20020a0564020c0200b0053ed70ebd7csm9777568edb.31.2023.10.25.09.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 09:16:06 -0700 (PDT)
Date: Wed, 25 Oct 2023 18:16:05 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v4 6/9] target/riscv/tcg: handle profile MISA bits
Message-ID: <20231025-fea5001cf2b2a92b81442b25@orel>
References: <20231025135001.531224-1-dbarboza@ventanamicro.com>
 <20231025135001.531224-7-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025135001.531224-7-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x529.google.com
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

On Wed, Oct 25, 2023 at 10:49:58AM -0300, Daniel Henrique Barboza wrote:
> The profile support is handling multi-letter extensions only. Let's add
> support for MISA bits as well.
> 
> We'll go through every known MISA bit. If the profile doesn't declare the bit
> as mandatory, ignore it. Otherwise, set or clear the bit in env->misa_ext and
> env->misa_ext_mask depending on whether the profile was set to 'true' or
> 'false'.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>  target/riscv/tcg/tcg-cpu.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index b2489a5317..57026cfcca 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -804,6 +804,19 @@ static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
>      profile->user_set = true;
>      profile->enabled = value;
>  
> +    for (i = 0; misa_bits[i] != 0; i++) {
> +        uint32_t bit = misa_bits[i];
> +
> +        if  (!(profile->misa_ext & bit)) {
> +            continue;
> +        }
> +
> +        g_hash_table_insert(misa_ext_user_opts,
> +                            GUINT_TO_POINTER(bit),
> +                            (gpointer)value);
> +        riscv_cpu_write_misa_bit(cpu, bit, profile->enabled);
> +    }
> +
>      for (i = 0; profile->ext_offsets[i] != RISCV_PROFILE_EXT_LIST_END; i++) {
>          ext_offset = profile->ext_offsets[i];
>  
> -- 
> 2.41.0
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

