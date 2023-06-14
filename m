Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E7BEB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 09:00:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q9MMc-0000wK-N0; Wed, 14 Jun 2023 05:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q9MMb-0000vz-DT
 for qemu-riscv@nongnu.org; Wed, 14 Jun 2023 05:00:25 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q9MMZ-0005FG-JV
 for qemu-riscv@nongnu.org; Wed, 14 Jun 2023 05:00:25 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1a67ea77c3bso3349927fac.3
 for <qemu-riscv@nongnu.org>; Wed, 14 Jun 2023 02:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686733222; x=1689325222;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PSiVnoNXwA/9+IsbqMn7p7LJuDWj7Q4v/whuwhU8Za8=;
 b=Fbj9bbV4zh/7QLA0S9zUnxkKTQ87CBp7k3jlTleXdEa5/ttMc/KisiZvfNGU6y4rIm
 t/tf0Z6zpDaFmcb8HtZo01pezHiJFj5GbkvNmfmYS4+Vgw3ANGJDUTrweNpAhHupCtLQ
 b5czFn7nsEbGKHdRcsoQ6yWaojrs+3YTPp+O2emLOdImmxMqob9Ps3SNSKe2tF46Le7q
 K7yctblqCqNlV/eFWPC4Aomub4aK8uPyd//pdWAHUVzWC47WK/V9jBCumMAzAMEHcMPi
 QKO4ZoyV0S9ojwuf1h0BSmxJtIlJp6UHO4fjr080uKF0nS0q1MwLsfahCejramED+G1h
 WOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686733222; x=1689325222;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PSiVnoNXwA/9+IsbqMn7p7LJuDWj7Q4v/whuwhU8Za8=;
 b=QurMebyTY9MpLd7GKGcY7cLDvGzGNKSyj7QPg9all6agO7ydzwk8k+dO/E2V7dpIT/
 Jb5fe8l8PcLAu9WqYxuNLzk0j0wz3tzmshj7/21CqnXcZaeOQoQ9vdrJwgnZsXN/cTnI
 TNjSUfJKuQ7HTkLoCyuh4ZWURWt3G9/JRw9v4WC+U3JFULHW9mU9MInX/FHwMJtzHJ7m
 aYZz3q/AXXZhc19J09xA4sYkrYOi/4SNK0R4P+9i5ZXdp694vZCq3kT9I7oWz2+43YRy
 Nlk3FX4KJC7sUU7SgeLUWYPwUkRANs83os4Q4p2yfWOQ4SkINLj3sW3QjYoai9doebZs
 q0Vg==
X-Gm-Message-State: AC+VfDwQ861O6ETj/CPdjs/i2PbUVuTVLHnmjNCHbFo+mb8ZzHJcT+00
 CeNwjjRbxewudjYJcHlGivov+g==
X-Google-Smtp-Source: ACHHUZ4R8H4rselBxiDDnpEjbvfTuSqtKWzQ81mtjX+Dies7JGDrs7O43yhCDyglLYpQqEJhVry59A==
X-Received: by 2002:a05:6870:5415:b0:19f:a1da:49d3 with SMTP id
 d21-20020a056870541500b0019fa1da49d3mr10424859oan.51.1686733221940; 
 Wed, 14 Jun 2023 02:00:21 -0700 (PDT)
Received: from [192.168.68.107] ([177.170.117.210])
 by smtp.gmail.com with ESMTPSA id
 r21-20020a05687032d500b001a663e49523sm5241974oac.36.2023.06.14.02.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 02:00:21 -0700 (PDT)
Message-ID: <de6d5a44-66e4-4795-0604-b56beb18a2c8@ventanamicro.com>
Date: Wed, 14 Jun 2023 06:00:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 7/8] disas/riscv: Add support for XVentanaCondOps
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
References: <20230612111034.3955227-1-christoph.muellner@vrull.eu>
 <20230612111034.3955227-8-christoph.muellner@vrull.eu>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230612111034.3955227-8-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
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



On 6/12/23 08:10, Christoph Muellner wrote:
> From: Christoph Müllner <christoph.muellner@vrull.eu>
> 
> This patch adds XVentanaCondOps support to the RISC-V disassembler.
> 
> Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   disas/meson.build      |  5 ++++-
>   disas/riscv-xventana.c | 41 +++++++++++++++++++++++++++++++++++++++++
>   disas/riscv-xventana.h | 18 ++++++++++++++++++
>   disas/riscv.c          |  4 ++++
>   4 files changed, 67 insertions(+), 1 deletion(-)
>   create mode 100644 disas/riscv-xventana.c
>   create mode 100644 disas/riscv-xventana.h
> 
> diff --git a/disas/meson.build b/disas/meson.build
> index 832727e4b3..e0ee326411 100644
> --- a/disas/meson.build
> +++ b/disas/meson.build
> @@ -6,7 +6,10 @@ common_ss.add(when: 'CONFIG_M68K_DIS', if_true: files('m68k.c'))
>   common_ss.add(when: 'CONFIG_MICROBLAZE_DIS', if_true: files('microblaze.c'))
>   common_ss.add(when: 'CONFIG_MIPS_DIS', if_true: files('mips.c', 'nanomips.c'))
>   common_ss.add(when: 'CONFIG_NIOS2_DIS', if_true: files('nios2.c'))
> -common_ss.add(when: 'CONFIG_RISCV_DIS', if_true: files('riscv.c'))
> +common_ss.add(when: 'CONFIG_RISCV_DIS', if_true: files(
> +    'riscv.c',
> +    'riscv-xventana.c'
> +))
>   common_ss.add(when: 'CONFIG_SH4_DIS', if_true: files('sh4.c'))
>   common_ss.add(when: 'CONFIG_SPARC_DIS', if_true: files('sparc.c'))
>   common_ss.add(when: 'CONFIG_XTENSA_DIS', if_true: files('xtensa.c'))
> diff --git a/disas/riscv-xventana.c b/disas/riscv-xventana.c
> new file mode 100644
> index 0000000000..a0224d1fb3
> --- /dev/null
> +++ b/disas/riscv-xventana.c
> @@ -0,0 +1,41 @@
> +/*
> + * QEMU RISC-V Disassembler for xventana.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "disas/riscv.h"
> +#include "disas/riscv-xventana.h"
> +
> +typedef enum {
> +    /* 0 is reserved for rv_op_illegal. */
> +    ventana_op_vt_maskc = 1,
> +    ventana_op_vt_maskcn = 2,
> +} rv_ventana_op;
> +
> +const rv_opcode_data ventana_opcode_data[] = {
> +    { "vt.illegal", rv_codec_illegal, rv_fmt_none, NULL, 0, 0, 0 },
> +    { "vt.maskc", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +    { "vt.maskcn", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> +};
> +
> +void decode_xventanacondops(rv_decode *dec, rv_isa isa)
> +{
> +    rv_inst inst = dec->inst;
> +    rv_opcode op = rv_op_illegal;
> +
> +    switch (((inst >> 0) & 0b11)) {
> +    case 3:
> +        switch (((inst >> 2) & 0b11111)) {
> +        case 30:
> +            switch (((inst >> 22) & 0b1111111000) | ((inst >> 12) & 0b0000000111)) {
> +            case 6: op = ventana_op_vt_maskc; break;
> +            case 7: op = ventana_op_vt_maskcn; break;
> +            }
> +            break;
> +        }
> +        break;
> +    }
> +
> +    dec->op = op;
> +}
> diff --git a/disas/riscv-xventana.h b/disas/riscv-xventana.h
> new file mode 100644
> index 0000000000..72be9ffa16
> --- /dev/null
> +++ b/disas/riscv-xventana.h
> @@ -0,0 +1,18 @@
> +/*
> + * QEMU disassembler -- RISC-V specific header (xventana*).
> + *
> + * Copyright (c) 2023 VRULL GmbH
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef DISAS_RISCV_XVENTANA_H
> +#define DISAS_RISCV_XVENTANA_H
> +
> +#include "disas/riscv.h"
> +
> +extern const rv_opcode_data ventana_opcode_data[];
> +
> +void decode_xventanacondops(rv_decode*, rv_isa);
> +
> +#endif /* DISAS_RISCV_XVENTANA_H */
> diff --git a/disas/riscv.c b/disas/riscv.c
> index dc3bfb0123..c7bfd4ed32 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -22,6 +22,9 @@
>   #include "target/riscv/cpu_cfg.h"
>   #include "disas/riscv.h"
>   
> +/* Vendor extensions */
> +#include "disas/riscv-xventana.h"
> +
>   typedef enum {
>       /* 0 is reserved for rv_op_illegal. */
>       rv_op_lui = 1,
> @@ -4708,6 +4711,7 @@ disasm_inst(char *buf, size_t buflen, rv_isa isa, uint64_t pc, rv_inst inst,
>           void (*decode_func)(rv_decode *, rv_isa);
>       } decoders[] = {
>           { always_true_p, rvi_opcode_data, decode_inst_opcode },
> +        { has_XVentanaCondOps_p, ventana_opcode_data, decode_xventanacondops },
>       };
>   
>       for (size_t i = 0; i < ARRAY_SIZE(decoders); i++) {

