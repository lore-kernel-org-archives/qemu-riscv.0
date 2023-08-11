Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59D6C001DE
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 15:04:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUTgm-0005Ck-0P; Fri, 11 Aug 2023 11:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUTgk-0005Bw-DQ; Fri, 11 Aug 2023 11:04:30 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUTgi-00054C-R6; Fri, 11 Aug 2023 11:04:30 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1c2bf6bb0c0so462428fac.1; 
 Fri, 11 Aug 2023 08:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691766267; x=1692371067;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M7ZYWuDNF5HchHmTGafTINgpoVw4rOZIAy0Jb/pTWHk=;
 b=UvR916DJ3qw88qXFdZovZoUh1Ae/0Gz5KyeoUF4U2V+UDpF/POxzmzJegQzojP+55C
 sHi9+ZE6gzY604wikCZgwArZBCSTxYklLQmZfQFN0YESkJA3JGo1+JfbXg6hfDV60E9g
 qypCeMbMa2VJ3+9615ZZp/1rykVQBjxXq4jY0kq6mzdhS+nFAKx2V97M08wJ3KOuIHvP
 4NRrtwlq+mthKkKEsqtdsZnSSbHDEjkbxe4xBBdBsNbOHZShcDH48v8/Sku3A+eAuwlC
 QMVwO+DQ+JHYvbybj/b9HF8GmB0vROdJSKz1mdAxJd0evGa/JABvo1JClSbqvi9DSHJG
 YITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691766267; x=1692371067;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M7ZYWuDNF5HchHmTGafTINgpoVw4rOZIAy0Jb/pTWHk=;
 b=jgt47rqmwzntAmZVq8rn9/BmQ+/cftZTyjh+/o9TqJcDt66fMJXdCqtYF0GXLSFuC+
 elyzPxpzXfrcqCBfcRsNB6gW4MwQLjDwXNkty9gra4k5IkiitdcFXG7lcxQzdTowxGAU
 2ZCpiPtxIrRmf1PrKZb3rkDVasSleoeMwA29XnEPx2ozHkCHvTSK4llQl7JgZflSBvv5
 qX7Es4Ev+zkrLvyiMFHxYC0EzsvGUi7iyHCJM6dGHcpMOKZXfcVrQqSxStnoFb1Fzg0M
 RfEAvl0/Nej+hq+O3jkB3HhpFxsNZm602MoKbDZdePJA6/htNK+SH2INQJCyqvdcYMb7
 Hu0w==
X-Gm-Message-State: AOJu0YwcavFOfiQDSAfXqNRdhnOwTkop6hzZi8DRVFlu1nbuGomFmjMa
 6RXTXBbes98gDFd7ucVlU4DFzfysfgVmdie6eKWI0oyKD5XdfA==
X-Google-Smtp-Source: AGHT+IFnC6473NcyIhZ/v4JmPtAC0czRcEmZzrzfMDpXbeW+3YV9mRLVFH2gWD48ANfDh1sMwVAS9e8+lg4GGaHTBbs=
X-Received: by 2002:a05:6870:514:b0:1bf:a1e:45b6 with SMTP id
 j20-20020a056870051400b001bf0a1e45b6mr2050699oao.47.1691766267332; Fri, 11
 Aug 2023 08:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230728131520.110394-1-dbarboza@ventanamicro.com>
 <20230728131520.110394-7-dbarboza@ventanamicro.com>
In-Reply-To: <20230728131520.110394-7-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Aug 2023 11:04:01 -0400
Message-ID: <CAKmqyKNuznxVHeDaEPmrSWh=92GBh_c57Q0pJheU2xaN6RF3_g@mail.gmail.com>
Subject: Re: [PATCH 6/8] target/riscv: use isa_ext_update_enabled() in
 init_max_cpu_extensions()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=alistair23@gmail.com; helo=mail-oa1-x2b.google.com
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

On Fri, Jul 28, 2023 at 9:51=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Before adding support to detect if an extension was user set we need to
> handle how we're enabling extensions in riscv_init_max_cpu_extensions().
> object_property_set_bool() calls the set() callback for the property,
> and we're going to use this callback to set the 'multi_ext_user_opts'
> hash.
>
> This means that, as is today, all extensions we're setting for the 'max'
> CPU will be seen as user set in the future. Let's change set_bool() to
> isa_ext_update_enabled() that will just enable/disable the flag on a
> certain offset.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b588f6969f..a40dc865a0 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2096,25 +2096,24 @@ static void riscv_init_max_cpu_extensions(Object =
*obj)
>      set_misa(env, env->misa_mxl, env->misa_ext | RVG | RVJ | RVV);
>
>      for (int i =3D 0; i < ARRAY_SIZE(riscv_cpu_extensions); i++) {
> -        object_property_set_bool(obj, riscv_cpu_extensions[i].name,
> -                                 true, NULL);
> +        isa_ext_update_enabled(cpu, riscv_cpu_extensions[i].offset, true=
);
>      }
>
>      /* set vector version */
>      env->vext_ver =3D VEXT_VERSION_1_00_0;
>
>      /* Zfinx is not compatible with F. Disable it */
> -    object_property_set_bool(obj, "zfinx", false, NULL);
> -    object_property_set_bool(obj, "zdinx", false, NULL);
> -    object_property_set_bool(obj, "zhinx", false, NULL);
> -    object_property_set_bool(obj, "zhinxmin", false, NULL);
> +    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zfinx), false);
> +    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zdinx), false);
> +    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zhinx), false);
> +    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zhinxmin), false);
>
> -    object_property_set_bool(obj, "zce", false, NULL);
> -    object_property_set_bool(obj, "zcmp", false, NULL);
> -    object_property_set_bool(obj, "zcmt", false, NULL);
> +    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zce), false);
> +    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zcmp), false);
> +    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zcmt), false);
>
>      if (env->misa_mxl !=3D MXL_RV32) {
> -        object_property_set_bool(obj, "zcf", false, NULL);
> +        isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zcf), false);
>      }
>  }
>
> --
> 2.41.0
>
>

