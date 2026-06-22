Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9942CDB46B
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 05:00:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbWl9-0004Jl-WB; Mon, 22 Jun 2026 00:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbWl7-0004JO-RD
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 00:59:45 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbWl6-00081R-4M
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 00:59:45 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6976b6860bcso2728725a12.1
 for <qemu-riscv@nongnu.org>; Sun, 21 Jun 2026 21:59:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782104382; cv=none;
 d=google.com; s=arc-20240605;
 b=GaZzxaJ8zxvshLa25KBEj5g4nwBsyDa0l8xH6Iu/KKG0Aqzn5VKqs0cAOEWJ4QzSOu
 c3CWKg2g4SQgOKN91YEbOmUam7/jHhEkM10t1Qj2JQHxkH3k//25Hpgf4A/I7k9wbES1
 OCCsAirww/Ta9uVpNs8FgsuXFnBxxe1Cg9hCETqQOyuFqs7mbjArjz/6OwOPG7kqX+Yl
 L7dNU54niFyh2/SCreo6zaHDooixNdxJVAM2z25W+NgcqKdxu66CMXZjvkEGe3UcgBiY
 o9fvIrNuTOeI1tG/SWgjTp/JrwvzWladzLLsSCqfEI6ZzSuF3iBtyegLLSJcdL4Jlxo3
 UiYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=h5eRS3JBtzTis1RyBjwRpM8b3wRmaXjyAApR0YSW3GY=;
 fh=ubzVdpsZ54ATYK5rA6Bl4cEy58kpFfxWyebRCgC9Nos=;
 b=OO9Y+7pmzVxqFueE8rIPfocccchcP7pdhuotN8//TcB4uRX/N23UaqZ+2UGgjHH+qx
 luuQJc46opXuWA04+dyqOlIoxHFIsD43GcMlP7yjTyUd+SK6HNEXGx36dcpdvexh74Hp
 lWBlxuoRJB9HlTqoOwbBroLuANcKZqbxa2M4+pOT+VTaRcVhWawIdyCqSEpd34sewUCm
 pOjp9ltaGTFYZxWCWyKD0WWaaRPPQCuTS3QrvfioRoIqjiZOpw1NDuO+ulo5pD4078lG
 GobW2XqFNnFrlqlLjKIO6hUfoNJ+p3INoeS2S6ixNzPkDg9B6HpNovMDShOIPPoiDezN
 b0AA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782104382; x=1782709182; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h5eRS3JBtzTis1RyBjwRpM8b3wRmaXjyAApR0YSW3GY=;
 b=OcTJfgDMGP5N48SexuBMC125quFErITZ5N0NonQMe+1yDWnZtjKMY1MzUzvh8y8j/8
 aPr2TLkXz7H/9wCa51TKYtNFihFGTicLtJOjXZvjI4bM9I4B1rY/9JZ0PSFgOqT0+3kV
 7qMvDpb0SsGEtCg9Z3B7oi3amPoCSq7FMlL5yyKTBk0agyxJn5F0eBNBupMwSDDD+bp0
 4o0mDBu1/h6lrMOX9DmmlCMl1+p8tzqHnZUUopV71qZ5mAPTFrLwDGAKAGlSgGS2gP2N
 Uo3/k4cWkbaWE/8d0wyGT+QWiLJkAqbghac2SeRpdv1FTH6hGODtujI26oYZVOS1IGWr
 xd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782104382; x=1782709182;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=h5eRS3JBtzTis1RyBjwRpM8b3wRmaXjyAApR0YSW3GY=;
 b=D08Ztgd7YYxWbDvvHGmd1iY5tLTp5pOE7dAGUzwApjQ6vjrURPgIJZjlm952Qs8yXu
 EEdYYaQWt+Gn+d50cTeuyCbtmUQ+UAylrb/9JtEsmorBaNbNMvHfYN8N792m4FYEIXLw
 R29ZgSIr/VbtMvPUyTXGuzghAnx6WsctW7htSFYsdB2ebC0B/wO9KxfKTNWvHU8gVyj8
 rC+gVEgo+4qv2EnjF7KcJwQI73Cx4X81N2zTbms+7qvpIZnQOX/C/KvS8j5tYZMOfOQX
 nmKWQYqD/K+Dw28U6l2UU3DpvIc1QQOpGksprqxpr4QRhqv/PIpF3DG4okjonUWciTDv
 1aNQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/fMOM/XEhJ0m1rLuPUTsmmNVyWvcHx+VA1mf25+WqY6vIMnqgsann5DiqfmPRHIQ86ma3aG/GjPl25@nongnu.org
X-Gm-Message-State: AOJu0YzhoFh+DVQHBC8OPL/vpt63LAHgX2MXwKghtJIhLNXwba/ssiyT
 BHiOrgnAHzNOEz3VFT/o8lzMvcg81YgzdIAzMH8knQpv3H0SXd/LQATkfAYQtx8LYyaomWHCARu
 R5UnFQpTxEmTN3XgnpxFsjpwg8dYOe7U=
X-Gm-Gg: AfdE7ckj1yYDpbvb6pI/Jw5+LSP9ZHfjsernaqtuLqFP8EBbYCDtySMfbh9yLNoGd5X
 qJjzMHijMVDLwV2pGJZ4HaxO1Fc0CyoeP+9Gto084hzyTaOtCfVgbiNVgUO9a2W1xGdRZav9Zut
 dvXa3x2so6EGCDWOzE6TvOFDkG9z80R5KDTTY1kvZSYQBCt/KCb9Gx+i4f+AxeDxlJsGW1RI5AS
 6afyLF7K4AMtfrWDEdfHcC5HYcERSLPVJ2vdgZHfWm64ezSUFhRgQ055XrfNnanRV2BqsV6j0Js
 ghPwt5N8Bw6gTrUmZjt2Vt7CB8M=
X-Received: by 2002:a05:6402:5309:b0:696:9973:5cdb with SMTP id
 4fb4d7f45d1cf-697569b97d2mr4566333a12.28.1782104382592; Sun, 21 Jun 2026
 21:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260616235939.1358663-1-daniel.barboza@oss.qualcomm.com>
 <20260616235939.1358663-4-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260616235939.1358663-4-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jun 2026 14:59:16 +1000
X-Gm-Features: AVVi8CfyR0wIO0mWHwCEQdiwUG0QlsfDr3_nBqjEsU_eZMNBfMsA9lBY0BWt4W4
Message-ID: <CAKmqyKNFAq27dm1iKUFWHwNHCftiNKp9vKjW=BcXmnEfjxzW8w@mail.gmail.com>
Subject: Re: [PATCH 3/5] hw/riscv/sifive_u: add #address-cells in PLIC FDT
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52e.google.com
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

On Wed, Jun 17, 2026 at 10:01=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> By Linux FDT docs in [1] the "address-cells" property is mandatory.  Set
> it to zero.
>
> While we're at it let's also put this new value and the interrupt-cells
> value in macros, like the 'virt' board is doing.
>
> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/interrup=
t-controller/sifive%2Cplic-1.0.0.txt
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/sifive_u.c         | 5 ++++-
>  include/hw/riscv/sifive_u.h | 2 ++
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index b3468254f5..7dfc18d3ec 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -213,7 +213,10 @@ static void create_fdt(SiFiveUState *s, const MemMap=
Entry *memmap,
>      nodename =3D g_strdup_printf("/soc/interrupt-controller@%lx",
>          (long)memmap[SIFIVE_U_DEV_PLIC].base);
>      qemu_fdt_add_subnode(fdt, nodename);
> -    qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells", 1);
> +    qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells",
> +                          SIFIVE_U_PLIC_INT_CELLS);
> +    qemu_fdt_setprop_cell(fdt, nodename, "#address-cells",
> +                          SIFIVE_U_PLIC_ADDR_CELLS);
>      qemu_fdt_setprop_string_array(fdt, nodename, "compatible",
>          (char **)&plic_compat, ARRAY_SIZE(plic_compat));
>      qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
> diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> index e4c9860d50..aed966a62d 100644
> --- a/include/hw/riscv/sifive_u.h
> +++ b/include/hw/riscv/sifive_u.h
> @@ -156,6 +156,8 @@ enum {
>  #define SIFIVE_U_MANAGEMENT_CPU_COUNT   1
>  #define SIFIVE_U_COMPUTE_CPU_COUNT      4
>
> +#define SIFIVE_U_PLIC_ADDR_CELLS   0
> +#define SIFIVE_U_PLIC_INT_CELLS    1
>  #define SIFIVE_U_PLIC_NUM_SOURCES 54
>  #define SIFIVE_U_PLIC_NUM_PRIORITIES 7
>  #define SIFIVE_U_PLIC_PRIORITY_BASE 0x00
> --
> 2.43.0
>
>

