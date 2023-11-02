Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD12CC4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 00:51:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyLvQ-0005bh-AD; Wed, 01 Nov 2023 20:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyLvN-0005aT-49; Wed, 01 Nov 2023 20:51:05 -0400
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyLvL-0000wq-Ja; Wed, 01 Nov 2023 20:51:04 -0400
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-49d0d90a7ddso190316e0c.0; 
 Wed, 01 Nov 2023 17:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698886262; x=1699491062; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r+w0wMNJ8rmMaknQa487TlLbwMK5Xr0KXGsJo5C6K4Q=;
 b=UK4Ybl4HYGWQy9iScODQnl33GwhG8uuStrEjjSdDUP5/GBgb+BT48NnSQ16xZrkq43
 XJATvgkPpczTf5OAV2As3L9UKVbI/LKR3Od5bmegxMqbBB52yERKR1ntkTXugqPs3Jpu
 qri1t1pKPr01o+Cmnt4bSFN/yQ1Wz8GDXv5KX6MIu9cvT79nWofyZZmxU/u444uf8T+n
 b+zDs3F7uln8LhI5Yfk31grTqv7SrV78i0mir7ziwBuYGyKPqI60EUcDVaiXjgaoJeKt
 RfJYXf9ypZzfN1D0kwhJ+NTKCDs1Qdw0s9AbGIJ4oicQj885ixZmdFzWGfSr2X2lmrDa
 uwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698886262; x=1699491062;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r+w0wMNJ8rmMaknQa487TlLbwMK5Xr0KXGsJo5C6K4Q=;
 b=vj7pr88ZySkColCowhdseJQgjTvJXjCnTfxZ0xI3QFRzvI+e1TiF1321S8byHY0pnL
 q/bdACFgYsY5o7o+artSZKS23OVsT0vCgMiHv7EEjRnn1rQb+430aDWdZ5NRezKZOJHs
 JB5b0KL8E08Z/eYGat+Mn5RYhWMVwit8vSpuLks01vDaJDODlUFzBWWWH8ZlA9lZzU5z
 pqPLjCcRmHiLGd/yquFZKj3HgsJQQ4YuSVvxC5URRxQ7MlFBopQNZUX6FIN5C5kH2RSI
 EHtOv8TIYe8Ki099ghs+wyadpc5VL5XNrrlr3DNsScHUzdmxek5GJy9djn/MLEt6ujnc
 2wJw==
X-Gm-Message-State: AOJu0YxgfJ5s4jWYIbIk+LDBy/kUTwnbrHGiQyZeOV6gdM5jeP/uF4mx
 oNqk9VOEbVSIgk8XA7pakhSXZHHcSlEzqrC6BH3Wb5VZa1Q=
X-Google-Smtp-Source: AGHT+IHWkxum6hhkOGSJSqZ9Y4QdJd/eHI4895qi3URcB5W0OVKL1J60jjb/4WI05zAiK/1ZkKbUjlgTgtOzwSU0brU=
X-Received: by 2002:a1f:26c4:0:b0:49e:1eca:f849 with SMTP id
 m187-20020a1f26c4000000b0049e1ecaf849mr16298520vkm.13.1698886262111; Wed, 01
 Nov 2023 17:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231026151828.754279-1-max.chou@sifive.com>
 <20231026151828.754279-9-max.chou@sifive.com>
In-Reply-To: <20231026151828.754279-9-max.chou@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Nov 2023 10:50:35 +1000
Message-ID: <CAKmqyKMz2M6bWgicchJAwTzKkj7P57pu-9Ss5D0faJ8nE+x3fQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/14] target/riscv: Add cfg properties for Zvks[c|g]
 extensions
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2b.google.com
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

On Fri, Oct 27, 2023 at 1:21=E2=80=AFAM Max Chou <max.chou@sifive.com> wrot=
e:
>
> Vector crypto spec defines the ShangMi algorithm suite related
> extensions (Zvks, Zvksc, Zvksg) combined by several vector crypto
> extensions.
>
> Signed-off-by: Max Chou <max.chou@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_cfg.h     |  3 +++
>  target/riscv/tcg/tcg-cpu.c | 17 +++++++++++++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index fd07aa96a27..7b0ca657a6a 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -99,6 +99,9 @@ struct RISCVCPUConfig {
>      bool ext_zvkn;
>      bool ext_zvknc;
>      bool ext_zvkng;
> +    bool ext_zvks;
> +    bool ext_zvksc;
> +    bool ext_zvksg;
>      bool ext_zmmul;
>      bool ext_zvfbfmin;
>      bool ext_zvfbfwma;
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index e460701a13c..f9023ca75c7 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -519,6 +519,23 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu=
, Error **errp)
>          cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvkt), true);
>      }
>
> +    if (cpu->cfg.ext_zvksc) {
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvks), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvbc), true);
> +    }
> +
> +    if (cpu->cfg.ext_zvksg) {
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvks), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvkg), true);
> +    }
> +
> +    if (cpu->cfg.ext_zvks) {
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvksed), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvksh), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvkb), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvkt), true);
> +    }
> +
>      if (cpu->cfg.ext_zvkt) {
>          cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvbb), true);
>          cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvbc), true);
> --
> 2.34.1
>
>

