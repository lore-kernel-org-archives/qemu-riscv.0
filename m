Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBC7C2BBCA
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 00:06:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sMGAk-0003wu-Lh; Tue, 25 Jun 2024 20:06:09 -0400
Received: from [2001:470:142:3::10] (helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1sMG91-0003PC-J7
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2024 20:04:20 -0400
Received: from [2607:f8b0:4864:20::a2f] (helo=mail-vk1-xa2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1sMG7k-0008Lg-0g
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2024 20:03:58 -0400
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-4ef748596d7so931490e0c.0; 
 Tue, 25 Jun 2024 17:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719360065; x=1719964865; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fbp/p0rJJv8e2G4lRh69XillF98ah82eoVD3RJE9QZM=;
 b=gJ5Tvb/cLv0NVJ3ysdquPhUxKigqQf4aVFWO+hevodU5B4Cd9k+sKZYeOUYgGdcV9U
 t/B4guxCOYVqlRwTlELv5A/K4hK+uCM2Fj2c+2vflwZNWlWfppEP11yvmTz/9YtjOJr1
 cOsapqNAvo1bY679pmAEOG7dwJu7T5QF9RNQ+FHFDdoC56NtuV2gMcp91c+LQpA998HW
 1e4iOyd1nR8fOaK2v5dfL0+VEAFbiHfvC7jJsD5CeHBPjgDhK5xCr3OyVZ52t8Cunr/8
 sjg8PSdMSM8aT/kv0uRTYZILYPnZnrnBW6t+rEhJ2Flcod1D7DgaeKteHOMSBQAsos1D
 mn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719360065; x=1719964865;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fbp/p0rJJv8e2G4lRh69XillF98ah82eoVD3RJE9QZM=;
 b=g9WL2RGSGVuu0UCF0CsVC85150U33zCULMs9uAmBaoB1cWnegX1l5KL/RuSYXoGJo1
 VenCTJcwgJj6vF58IFrFLB36ihzHuXNP/RFeqoa+YsdxtzYzh1RB70p6HIXIs1XepIRu
 JfDCklkxuKhYWsJZ13V8DYl9ch+cGarfB2T8tDxhz/7rIGhSUQWNv28igndxqAh/pZEx
 Uidn+aQFqoRLteFOp76SIivoxT5PVJ0AaZM3ttmHOKSbSK3wUqci9UvAbiNW1+6b62ge
 JMoivKrDYo+SfZVfGiE1Ypt4zFuxHjZx2sQ/3461gvIfOCuyGz3tUzfAlt8TQ2lDfPtw
 /lIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4XMWHIqHfNolCapyHDTjV27Xce1FZTYsWO6GAmF8p6azG8/mdSGdIoXB9cY0UKG6kDga8YfnEkR3TykRYKhL9NxlIYg4=
X-Gm-Message-State: AOJu0YwcefsBLl1EqsActy1UABbY3zuK3aoN67yAxr4VD1eyODbQ/s+4
 IwqtCY+Ks43nrPHqkw9us2QJvWu7+9kOEgRXVSIgAxphoOtNINSD9DCIJr2IjMwiz24t29URkre
 vOjUAYrKNsqIQqAgkqTFqX04M4gJ/9A==
X-Google-Smtp-Source: AGHT+IGSulW5NySdGWHKmNhJudYLsEgTAxBqXOYbIi9guoYzOMJN+ELfChd/HcSLO2Tz1I1MNai2oDFbf9we6IV5UUs=
X-Received: by 2002:a05:6122:1827:b0:4ef:5b2c:df25 with SMTP id
 71dfb90a1353d-4ef6d8094eemr8011295e0c.6.1719359629029; Tue, 25 Jun 2024
 16:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240625114629.27793-1-frank.chang@sifive.com>
 <20240625114629.27793-2-frank.chang@sifive.com>
In-Reply-To: <20240625114629.27793-2-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 26 Jun 2024 09:53:22 +1000
Message-ID: <CAKmqyKOdM3_2tQKN=kJn5sR2YCR8xvHT-bqR10oqnvhrNhin6w@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] target/riscv: Introduce extension implied rules
 definition
To: frank.chang@sifive.com
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Jerry Zhang Jian <jerry.zhangjian@sifive.com>, 
 Max Chou <max.chou@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2f
 (deferred)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2f.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPOOFED_FREEMAIL_NO_RDNS=0.001,
 T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On Tue, Jun 25, 2024 at 9:47=E2=80=AFPM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> RISCVCPUImpliedExtsRule is created to store the implied rules.
> 'is_misa' flag is used to distinguish whether the rule is derived
> from the MISA or other extensions.
> 'ext' stores the MISA bit if 'is_misa' is true. Otherwise, it stores
> the offset of the extension defined in RISCVCPUConfig. 'ext' will also
> serve as the key of the hash tables to look up the rule in the following
> commit.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Jerry Zhang Jian <jerry.zhangjian@sifive.com>
> Tested-by: Max Chou <max.chou@sifive.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c |  8 ++++++++
>  target/riscv/cpu.h | 23 +++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 4760cb2cc1..7b071ade04 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2250,6 +2250,14 @@ RISCVCPUProfile *riscv_profiles[] =3D {
>      NULL,
>  };
>
> +RISCVCPUImpliedExtsRule *riscv_misa_ext_implied_rules[] =3D {
> +    NULL
> +};
> +
> +RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] =3D {
> +    NULL
> +};
> +
>  static Property riscv_cpu_properties[] =3D {
>      DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 90b8f1b08f..87742047ce 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -124,6 +124,29 @@ typedef enum {
>      EXT_STATUS_DIRTY,
>  } RISCVExtStatus;
>
> +typedef struct riscv_cpu_implied_exts_rule {
> +#ifndef CONFIG_USER_ONLY
> +    /*
> +     * Bitmask indicates the rule enabled status for the harts.
> +     * This enhancement is only available in system-mode QEMU,
> +     * as we don't have a good way (e.g. mhartid) to distinguish
> +     * the SMP cores in user-mode QEMU.
> +     */
> +    unsigned long *enabled;
> +#endif
> +    /* True if this is a MISA implied rule. */
> +    bool is_misa;
> +    /* ext is MISA bit if is_misa flag is true, else multi extension off=
set. */
> +    const uint32_t ext;
> +    const uint32_t implied_misa_exts;
> +    const uint32_t implied_multi_exts[];
> +} RISCVCPUImpliedExtsRule;
> +
> +extern RISCVCPUImpliedExtsRule *riscv_misa_ext_implied_rules[];
> +extern RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[];
> +
> +#define RISCV_IMPLIED_EXTS_RULE_END -1
> +
>  #define MMU_USER_IDX 3
>
>  #define MAX_RISCV_PMPS (16)
> --
> 2.43.2
>
>

