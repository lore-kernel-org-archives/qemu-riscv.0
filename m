Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3C6CD98E9
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 02:56:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqPOd-0000CJ-T8; Tue, 10 Oct 2023 22:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqPOc-0000Bp-Iv; Tue, 10 Oct 2023 22:56:26 -0400
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqPOb-00088a-3m; Tue, 10 Oct 2023 22:56:26 -0400
Received: by mail-vk1-xa35.google.com with SMTP id
 71dfb90a1353d-49ad8b76003so2275324e0c.3; 
 Tue, 10 Oct 2023 19:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696992983; x=1697597783; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R1Be8fWuaGLy0U8rnzW+6o4/3WF9H5PuFBQOTvQrx30=;
 b=XZ/YliM4JOjHFvMXLWriQI7Gmaa5CVPJqhz4e72m+ZVHpdluXD1NGsVfmAtbZ092Fw
 nfXEURUjklByjnVfX9+mJ5nO4dEXimjKYl0WFr/qritZFL5cH0SdOG7wKS13AjXTU7bK
 IDOLs+wNOtTgBkEUzA/yrEkvNfTZ4KHputIu8cnsQhATEB2TazPK7doMlwNMG+HqW0Zs
 x6AcTdhAPDzrGCyBRU0SOnwbXQfgMnzyZK+h75Mt+8b+RzSfu+pZh9PzGOSXECUehtx1
 ptSHqps9RGb8wBmdMjRAn68VSuCr0sAyguG3nCjmVGS3/ZE3O3BNcmVxM3n7JotmfB4a
 RM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696992983; x=1697597783;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R1Be8fWuaGLy0U8rnzW+6o4/3WF9H5PuFBQOTvQrx30=;
 b=Sr30G/rb7hzxyQ+8EWMAMWJzLvZdNOWTcPzmrP54xV4Io9KTZQ0ayGqnYRNp/EfHs4
 bKJPxrM1i4U4RtnnM3FzQuacdThMXKEUyWvD3DUYqmQJz/cNNXOF1ulS3hDkvNZlyEVI
 UWSn85vWZy2X934OY+9B7iJvo5ob+2ZyVLP3b7qX3euaiz2zM0KQrJI3NAtZ93B+NruR
 WTRFx1I2bdfTm8WKb/R1OhqtRgtkkGkZ56Hj7hC4uFizx7qNp95ER5UZ9kwI8H9zOc5e
 PjY41YfvzIg5BK0OFwQQ9hK43wz6BzWamj/dZpjmchrVpqcv7OG70gMfsRSKEt+sf8Im
 NsRQ==
X-Gm-Message-State: AOJu0Yy9ZiRRashbEQFCaVI75omLLZLki6LuYMhd8KCFatbM5Ios95gH
 oZAH6DcEcXr4MUDgQNtu4U70YscneMcXeTOlm6Q=
X-Google-Smtp-Source: AGHT+IH/iuNTUh+xZ6x5v8H6ZRAIeL/M8zCMeYoBVXgyI1ABCtFeFHmPDcYSEhw9UosqKBaFTwCTOufN4nE5rLtqGpo=
X-Received: by 2002:a1f:4c05:0:b0:49d:413f:12af with SMTP id
 z5-20020a1f4c05000000b0049d413f12afmr15148404vka.9.1696992983627; Tue, 10 Oct
 2023 19:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
 <20231006132134.1135297-5-dbarboza@ventanamicro.com>
In-Reply-To: <20231006132134.1135297-5-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 12:55:56 +1000
Message-ID: <CAKmqyKM-QwDchVSwpnDYs-dR-hdD5k=ft3yCkqzpeZXwJMz_1A@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] target/riscv/kvm: add 'rva22u64' flag as
 unavailable
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa35.google.com
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

On Fri, Oct 6, 2023 at 11:24=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> KVM does not have the means to support enabling the rva22u64 profile.
> The main reasons are:
>
> - we're missing support for some mandatory rva22u64 extensions in the
>   KVM module;
>
> - we can't make promises about enabling a profile since it all depends
>   on host support in the end.
>
> We'll revisit this decision in the future if needed. For now mark the
> 'rva22u64' profile as unavailable when running a KVM CPU:
>
> $ qemu-system-riscv64 -machine virt,accel=3Dkvm -cpu rv64,rva22u64=3Dtrue
> qemu-system-riscv64: can't apply global rv64-riscv-cpu.rva22u64=3Dtrue:
>     'rva22u64' is not available with KVM
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/kvm/kvm-cpu.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index c6615cb807..5f563b83df 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -358,7 +358,7 @@ static void cpu_set_cfg_unavailable(Object *obj, Visi=
tor *v,
>      }
>
>      if (value) {
> -        error_setg(errp, "extension %s is not available with KVM",
> +        error_setg(errp, "'%s' is not available with KVM",
>                     propname);
>      }
>  }
> @@ -438,6 +438,11 @@ static void kvm_riscv_add_cpu_user_properties(Object=
 *cpu_obj)
>      riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_extensions);
>      riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_vendor_exts)=
;
>      riscv_cpu_add_kvm_unavail_prop_array(cpu_obj, riscv_cpu_experimental=
_exts);
> +
> +   /* We don't have the needed KVM support for profiles */
> +    for (i =3D 0; riscv_profiles[i] !=3D NULL; i++) {
> +        riscv_cpu_add_kvm_unavail_prop(cpu_obj, riscv_profiles[i]->name)=
;
> +    }
>  }
>
>  static int kvm_riscv_get_regs_core(CPUState *cs)
> --
> 2.41.0
>
>

