Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43020C4706F
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 06:30:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLHFM-00052n-QO; Thu, 04 Jan 2024 01:30:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLHFI-00051y-Df; Thu, 04 Jan 2024 01:30:24 -0500
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLHFE-0000ku-B0; Thu, 04 Jan 2024 01:30:23 -0500
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-4b739b29686so94724e0c.0; 
 Wed, 03 Jan 2024 22:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704349808; x=1704954608; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CCcbe52deA251kCVeszrw741JEC7QsrA6Q/kAJ+JN/U=;
 b=cbtAQVLK4kVXQasbFoCiiWemOR47CLeuxpbiOysdeodOuL0/dX+WDzbhd6cavVfSAN
 gRTD1zBNKX6w2BuhWrNjx5Nvk/0Z0JdjJCxyKyPsHO4XllZ7FDCQTi1JSe2yk4tUG8eS
 PcSXJseTN+mgSZaXGLCHqLt49x7tfEVVI4rNTABje7uS8j0Yw3MujN94fbAV58CaVGpa
 cLI6lKvpV5sTgIJvOz7t+uaNlpNelLH/cQYFx4nW5HE9Mpv5FdXSfOp5lFnWu5Q0mwYG
 JJu/dnthcjt78D5you3flUYoOx5Uzt6syKGewB5TZPHwWGP7W3k4Ani+Kyy5DETq6prQ
 Iofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704349808; x=1704954608;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CCcbe52deA251kCVeszrw741JEC7QsrA6Q/kAJ+JN/U=;
 b=s8NlyZPoEEUlkDGZhjwXs74AsTu9qgw00fWW+EwVwa3yU0kE6PHiGbbnePEKt2rOcd
 SYSUeI0kKevo7fgcsFS4JaGiadWsd/N5otHhJei2HrBKS+jQq1N5Q10g+4TfK/dGzhsp
 Om+IKcieq0zVeMD4fCbrxgby7QdTfEJuA8OxcjkxRcc18o4JVMfxbeDJNmGcp2mFHD5Z
 Lcd6nu08gQcXgDUkrB4Pm4vhipjNsmhwekb+A+9LO1RAPvG7rBIn/U2dZbo4nNm2IWXX
 ddjSs0WLYMtKVT6ARMfBYfwLBf3OwBVlLaG0bRPQLcxeItHzzFTQAA+1l4PUWx9+B+ms
 1+Lw==
X-Gm-Message-State: AOJu0YwcK09E9/NXSB3uRg4rQ0sqXC2zATeEoAmq90sGN9/6m++X4rjl
 A9LXq/A/FqEzhm47+akIWRYqUWI183NaxRQOJ9A=
X-Google-Smtp-Source: AGHT+IHRwxoUgIAkUCvScnbdUjTficFMANJBO2tMTKYp7S1g9cy+mCsADUVYIi3OTCUvHqNys57L5lKtXn/FO1j4IAw=
X-Received: by 2002:a05:6122:1d90:b0:4b6:d49f:c218 with SMTP id
 gg16-20020a0561221d9000b004b6d49fc218mr18896vkb.17.1704349808390; Wed, 03 Jan
 2024 22:30:08 -0800 (PST)
MIME-Version: 1.0
References: <20231218125334.37184-1-dbarboza@ventanamicro.com>
 <20231218125334.37184-18-dbarboza@ventanamicro.com>
In-Reply-To: <20231218125334.37184-18-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Jan 2024 16:29:42 +1000
Message-ID: <CAKmqyKM3R7QjcNJaMi9s48ZJz+RL2GarWDzkHmB-MiwiWh7k0g@mail.gmail.com>
Subject: Re: [PATCH v13 17/26] riscv-qmp-cmds.c: add profile flags in
 cpu-model-expansion
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa32.google.com
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

On Mon, Dec 18, 2023 at 10:56=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Expose all profile flags for all CPUs when executing
> query-cpu-model-expansion. This will allow callers to quickly determine
> if a certain profile is implemented by a given CPU. This includes vendor
> CPUs - the fact that they don't have profile user flags doesn't mean
> that they don't implement the profile.
>
> After this change it's possible to quickly determine if our stock CPUs
> implement the existing rva22u64 profile. Here's a few examples:
>
>  $ ./build/qemu-system-riscv64 -S -M virt -display none
> -qmp tcp:localhost:1234,server,wait=3Doff
>
>  $ ./scripts/qmp/qmp-shell localhost:1234
> Welcome to the QMP low-level shell!
> Connected to QEMU 8.1.50
>
> - As expected, the 'max' CPU implements the rva22u64 profile.
>
> (QEMU) query-cpu-model-expansion type=3Dfull model=3D{"name":"max"}
>     {"return": {"model":
>         {"name": "rv64", "props": {... "rva22u64": true, ...}}}}
>
> - rv64 is missing "zba", "zbb", "zbs", "zkt" and "zfhmin":
>
> query-cpu-model-expansion type=3Dfull model=3D{"name":"rv64"}
>     {"return": {"model":
>         {"name": "rv64", "props": {... "rva22u64": false, ...}}}}
>
> query-cpu-model-expansion type=3Dfull model=3D{"name":"rv64",
>     "props":{"zba":true,"zbb":true,"zbs":true,"zkt":true,"zfhmin":true}}
>     {"return": {"model":
>         {"name": "rv64", "props": {... "rva22u64": true, ...}}}}
>
> We have no vendor CPUs that supports rva22u64 (veyron-v1 is the closest
> - it is missing just 'zkt').
>
> In short, aside from the 'max' CPU, we have no CPUs that supports
> rva22u64 by default.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/riscv-qmp-cmds.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.=
c
> index 5ada279776..205aaabeb9 100644
> --- a/target/riscv/riscv-qmp-cmds.c
> +++ b/target/riscv/riscv-qmp-cmds.c
> @@ -116,6 +116,19 @@ static void riscv_obj_add_named_feats_qdict(Object *=
obj, QDict *qdict_out)
>      }
>  }
>
> +static void riscv_obj_add_profiles_qdict(Object *obj, QDict *qdict_out)
> +{
> +    RISCVCPUProfile *profile;
> +    QObject *value;
> +
> +    for (int i =3D 0; riscv_profiles[i] !=3D NULL; i++) {
> +        profile =3D riscv_profiles[i];
> +        value =3D QOBJECT(qbool_from_bool(profile->enabled));
> +
> +        qdict_put_obj(qdict_out, profile->name, value);
> +    }
> +}
> +
>  static void riscv_cpuobj_validate_qdict_in(Object *obj, QObject *props,
>                                             const QDict *qdict_in,
>                                             Error **errp)
> @@ -220,6 +233,7 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(=
CpuModelExpansionType type,
>      riscv_obj_add_multiext_props(obj, qdict_out, riscv_cpu_experimental_=
exts);
>      riscv_obj_add_multiext_props(obj, qdict_out, riscv_cpu_vendor_exts);
>      riscv_obj_add_named_feats_qdict(obj, qdict_out);
> +    riscv_obj_add_profiles_qdict(obj, qdict_out);
>
>      /* Add our CPU boolean options too */
>      riscv_obj_add_qdict_prop(obj, qdict_out, "mmu");
> --
> 2.43.0
>
>

