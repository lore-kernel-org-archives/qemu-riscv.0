Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6E6C61D9D
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 03:09:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6052-00006i-PR; Wed, 22 Nov 2023 22:08:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r6050-00006C-Vj; Wed, 22 Nov 2023 22:08:39 -0500
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r604z-0002tU-F2; Wed, 22 Nov 2023 22:08:38 -0500
Received: by mail-vs1-xe35.google.com with SMTP id
 ada2fe7eead31-46263d50b29so134795137.0; 
 Wed, 22 Nov 2023 19:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700708916; x=1701313716; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hugzGhZz19NxhErZAXI1X7IIc4RpaZn969EhWsiQz50=;
 b=SCdOeHjp6Oe1y3RK4DdrBezXqqK1LckGgNdQpc+0MhrCSk6KTCVmTOI3ZcgnGdqsFr
 No8Nh8UaouXI+J9WARz+BETVQQJNAAy5oDOIzQXaOTxWPNhuO8rF+dP84F74SZ0ExKTt
 YvQtfY5jOuAWdFaNscovhQAs+W1zJzWfEeqaAw75ayjINPMdZaB6wL6DvmjSyNvOidQf
 xf91x0Ho7a505rznBU2tN//+/kOT7PCVlbfcyIxXUWIyrLA+Yv3iVmBZ/7JQxHOdM14W
 3VvGv3LuO3RriMBY5BuZ6KB2oWNfkXFB7h2afzqrIZxfeuTmPdpYWPsdxQo1o+RTLPZX
 5BuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700708916; x=1701313716;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hugzGhZz19NxhErZAXI1X7IIc4RpaZn969EhWsiQz50=;
 b=w6lbgXTxfEw1ciE6sjN0XC1c7PRnrffoyjedCp4bIKR3WAqCDPgdRUApTLLa4Ha3Na
 25KM/FoXFVEJmOXo39OoLxDLpwzSvZc5U4Sskj2NibpSVFGA8QIVWjrYviYCuXATVeG4
 96dra+K05ZgUMhbYiv+3fHfYq0YX7JNHga1FCxdNVqe5QigCMs262TjwfPSkzD0sgg+G
 NA0JjOsm9eA/oYGM1aYk5hLq6BrhO4esXWJBoHRuzjdfY7rrIQNWXyt4bgvWzzSLh6a7
 D5YUk51dMDoW3MdVI4zSVPX+w8hChL6pWUJ1dKlB7ZoWWBZLeYxY6DlcE6Mwrr/7adBC
 BZyA==
X-Gm-Message-State: AOJu0YxxJVZm9B/BiJ12APlDE8i0DG3sf+sDZwxU3jWg43OidGHz3SnT
 Vb9dDbnn14cunsHNywPOiPBlQ7vFDNBTPAoNoYQ=
X-Google-Smtp-Source: AGHT+IEWncbmwG3DvzNzqrvuZsSVUjn9M3ReUkY9Wf+jVMlE22o2VFzBJtgt65rTU3pZmUm5IWZaq1oHeOtvyLDO9zk=
X-Received: by 2002:a05:6102:c51:b0:462:8d3d:2dd with SMTP id
 y17-20020a0561020c5100b004628d3d02ddmr5246294vss.31.1700708915927; Wed, 22
 Nov 2023 19:08:35 -0800 (PST)
MIME-Version: 1.0
References: <20231030054834.39145-1-akihiko.odaki@daynix.com>
 <20231030054834.39145-3-akihiko.odaki@daynix.com>
In-Reply-To: <20231030054834.39145-3-akihiko.odaki@daynix.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 23 Nov 2023 13:08:09 +1000
Message-ID: <CAKmqyKNe=+MejYt99BmEe6BL4H5RBkwTSDnwnNDEc_y09P0HfA@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] target/riscv: Remove misa_mxl validation
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov <a.anenkov@yadro.com>,
 qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Fabiano Rosas <farosas@suse.de>, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Mon, Oct 30, 2023 at 3:50=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> It is initialized with a simple assignment and there is little room for
> error. In fact, the validation is even more complex.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Acked-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/tcg/tcg-cpu.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index a28918ab30..7f45e42000 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -148,7 +148,7 @@ static void riscv_cpu_validate_misa_priv(CPURISCVStat=
e *env, Error **errp)
>      }
>  }
>
> -static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
> +static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu)
>  {
>      RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(cpu);
>      CPUClass *cc =3D CPU_CLASS(mcc);
> @@ -168,11 +168,6 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cp=
u, Error **errp)
>      default:
>          g_assert_not_reached();
>      }
> -
> -    if (env->misa_mxl_max !=3D env->misa_mxl) {
> -        error_setg(errp, "misa_mxl_max must be equal to misa_mxl");
> -        return;
> -    }
>  }
>
>  static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
> @@ -573,11 +568,7 @@ static bool tcg_cpu_realize(CPUState *cs, Error **er=
rp)
>          return false;
>      }
>
> -    riscv_cpu_validate_misa_mxl(cpu, &local_err);
> -    if (local_err !=3D NULL) {
> -        error_propagate(errp, local_err);
> -        return false;
> -    }
> +    riscv_cpu_validate_misa_mxl(cpu);
>
>      riscv_cpu_validate_priv_spec(cpu, &local_err);
>      if (local_err !=3D NULL) {
> --
> 2.42.0
>
>

