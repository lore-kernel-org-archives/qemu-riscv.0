Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB872CDB465
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 05:01:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsFjM-0005F9-AU; Mon, 16 Oct 2023 01:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsFjK-0005Eg-O7; Mon, 16 Oct 2023 01:01:26 -0400
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsFjI-00007z-Ux; Mon, 16 Oct 2023 01:01:26 -0400
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-49d14708479so1685921e0c.2; 
 Sun, 15 Oct 2023 22:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697432483; x=1698037283; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1+UnqwyTbjn4xXeVTKaE+pymhk252G8AddJxNCiKj4E=;
 b=azeyRDu+5DQbjEmHc1hRydWzPzLJf3uNuGw/hjVF6u7rPGcJDFt3W1UiBBMm8T2Ij2
 P+/VT8ykJI0nk8I8491nualHALLByYRkCEJgSnXb4++s5/UxnfuaMBgF2a3d2K52Fetj
 0mpw6vX2x5JINwWcsdnQrQ9PsondZjQPjCty64gxGUD6JhZMcm/N6Px+VvKc9qOacwOy
 LCcv4Vq0ddP4ECNBTRRCYB2+IoA0OzFYEg/TzIWQX232HBG8pSXCbwEMLW4peT7JMkwT
 WlKriVuQ2pm01J5CJaTQuSL4hVIElaCTi02q6ZMITPK5zGEXpDeLlbPfF0HMBDyTaW6O
 lMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697432483; x=1698037283;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1+UnqwyTbjn4xXeVTKaE+pymhk252G8AddJxNCiKj4E=;
 b=OQuH1l3I/QNj7vk3R/5gBTLBTRZqPWX4a4W2WlvBR78dC+xgo80gLfa18d4xBlcH02
 lbxZyMACw6W0SdyjfuRXPgkYrzFiR6qfUhm1P6Y4+PZQRHcnmpQWOHW7cJqEF6UD9wVw
 2RGiar3Wc8tz4M9gRG3qtnwdqEA5tChft2IYCIpQJS5tJcp2kaPpE6AdDvmZjQ0lkmbo
 St+/Gy/vw/JrAfSoRpv5XNrS11oIGR//SZwwMFP9Ka5PAASY4ZUm6bJqEBnnW255WvIq
 wN4yTDXp7xeW0Tamh5ZD1H6fp6KuyLyXylauyIqjwVTpKAEbufWI1JYv/LyvtqVIN1O2
 YbbA==
X-Gm-Message-State: AOJu0YzbyWTpluSIWjVEoi60Fg1TysCkd8mrppFBWQp4/gKfRIqLmGgt
 UPHy3LvHUHuGDhwjzAusQmJ4y6qP4+I7L5D978Q=
X-Google-Smtp-Source: AGHT+IEBxi6KnVusRkcywg7NlWAvLTcYby2YTIn0MDSZ+WUoDaSUQbYHLoJt3D5P7O7hTpMyqsdi/hrC+uJX1LqmvbA=
X-Received: by 2002:a1f:e3c4:0:b0:49d:10ce:9a8b with SMTP id
 a187-20020a1fe3c4000000b0049d10ce9a8bmr22578110vkh.15.1697432483053; Sun, 15
 Oct 2023 22:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <20231012164604.398496-1-dbarboza@ventanamicro.com>
In-Reply-To: <20231012164604.398496-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Oct 2023 15:00:56 +1000
Message-ID: <CAKmqyKPygC2-L22pCEJKrgjU0qiywAiSYWgLTX-8RcUnZ4UMXg@mail.gmail.com>
Subject: Re: [PATCH 0/4] target/riscv: rename ext_i* to ext_zi*
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2a.google.com
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

On Fri, Oct 13, 2023 at 2:47=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> This series renames the following internal extensions flags:
>
> ext_ifencei, ext_icsr, ext_icbom, ext_icboz
>
> To add a leading 'z':
>
> ext_zifencei, ext_zicsr, ext_zicbom, ext_zicboz
>
> This was proposed by Andrew Jones. The motivation, in his own words:
>
> "I'd prefer we name the booleans with their 'z' to improve grepping.
> When one wants to search for uses of zifencei, I imagine they're more
> likely to do 'grep -i zifencei' than 'grep -i ifencei', particularly
> because the 's' is maintained for S extensions. "
>
>
> Aside from that, these are the only 4 Z-extension flags that don't use a
> leading 'z' in their name, so there's also the benefit of making
> everything equal.
>
>
>
> Daniel Henrique Barboza (4):
>   target/riscv: rename ext_ifencei to ext_zifencei
>   target/riscv: rename ext_icsr to ext_zicsr
>   target/riscv: rename ext_icbom to ext_zicbom
>   target/riscv: rename ext_icboz to ext_zicboz

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/riscv/boot.c                             |  2 +-
>  hw/riscv/virt.c                             |  4 +-
>  target/riscv/cpu.c                          | 56 ++++++++++-----------
>  target/riscv/cpu_cfg.h                      |  8 +--
>  target/riscv/csr.c                          |  2 +-
>  target/riscv/gdbstub.c                      |  2 +-
>  target/riscv/insn_trans/trans_rvi.c.inc     |  2 +-
>  target/riscv/insn_trans/trans_rvzicbo.c.inc | 16 +++---
>  target/riscv/kvm/kvm-cpu.c                  | 12 ++---
>  target/riscv/tcg/tcg-cpu.c                  | 20 ++++----
>  10 files changed, 62 insertions(+), 62 deletions(-)
>
> --
> 2.41.0
>
>

