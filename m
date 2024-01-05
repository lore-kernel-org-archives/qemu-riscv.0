Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D143C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 03:51:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLbFG-0004wv-5N; Thu, 04 Jan 2024 22:51:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLbFE-0004wM-Qc; Thu, 04 Jan 2024 22:51:40 -0500
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLbFD-0005IX-8L; Thu, 04 Jan 2024 22:51:40 -0500
Received: by mail-ua1-x934.google.com with SMTP id
 a1e0cc1a2514c-7cbdd011627so381063241.3; 
 Thu, 04 Jan 2024 19:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704426698; x=1705031498; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ld3G+NfFpIRxaJ+dhDUpwTHyQE4CN+3iaWh9gHiKo1Y=;
 b=gu3SyBJD4s8983wRiREwLLiE4E0cjQSWH3y0oKBIE7Rk5wHWjAfoTtajOO9bXhfxNS
 XQ3hciJrbzY1SzbFKnkUO73W113QqlLCa0jaX5k2TG/0mJNaOJuBKW4gaxzvZ36dPwsd
 AdeJfGyLcA7jvQmsBS1MHSC5F+z2wcRRufAjRqQ7MocIvFupzPowhpmHWpCIpwz6UT6M
 ZGCNRXzkiGhENiM0NHXTgT7p84E3/lpXVTRyyOWBKG/A6bbjY/DUI8mcWuSStxakeCxl
 hCgFEULO8jtf7GkJTCiHnHZpOz19QRZyqLqtGAkqDAxTxk3MOxinX1QMVmfy34IUeqvM
 WpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704426698; x=1705031498;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ld3G+NfFpIRxaJ+dhDUpwTHyQE4CN+3iaWh9gHiKo1Y=;
 b=fGzB3KfU3zw88zQOcxaXvrHeGaQs+HmLG4SDdtXJYqOEx8AKaWWAyG5G99losqyqcZ
 iLR3eU34pKaLQgRl1HxLqvbJBzGDcTLWMQuxgWOOn0OizB9zX0sJU4wF2lx3iRTdMiG+
 Au3cITWYOH8UnQIZ2pBwu9jmbPoiHryWwN/3KvJHidh3TjRKSxhVAypoOSlB3aYfPe4S
 7NlGYErTDrRrzE3LtTNdb4iTA6quf0VkOs2jLuIEPQnMsbz87RwvSVcG11D2r5l0QGPb
 ZSULQ6/pYHLYOue4xA7mdbD7By/7hIVkSp5djXn9JvuLeERxRX7OZ+1qzHHTYQAp2fKi
 skow==
X-Gm-Message-State: AOJu0YwKCKFRs/My2x2hsjMGceI6MMotIS8Xv5CBHfEEQ0QJ+SqT4z8n
 crYTtqzOqMCHf4cvPuYKkP8f0p+wjDcYTEe8FL8=
X-Google-Smtp-Source: AGHT+IHO8T06R5l4Rsm1zajYWhtkopiCcmAR+ex/nGFLSlDitBGhHjyBOFoCnRag5YCk/kxT+OhZG7IutdL9bjOSpi4=
X-Received: by 2002:a05:6102:94e:b0:467:b62e:5800 with SMTP id
 a14-20020a056102094e00b00467b62e5800mr116373vsi.18.1704426697666; Thu, 04 Jan
 2024 19:51:37 -0800 (PST)
MIME-Version: 1.0
References: <20240103174013.147279-1-dbarboza@ventanamicro.com>
 <20240103174013.147279-2-dbarboza@ventanamicro.com>
In-Reply-To: <20240103174013.147279-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 13:51:11 +1000
Message-ID: <CAKmqyKO9zzN3g-ZRoXbKQfVaBf918KqW_1=RuS=Dshdom6YHOQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/16] target/riscv/cpu_cfg.h: remove unused fields
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com, vladimir.isaev@syntacore.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x934.google.com
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

On Thu, Jan 4, 2024 at 3:46=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> user_spec, bext_spec and bext_ver aren't being used.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h     | 1 -
>  target/riscv/cpu_cfg.h | 2 --
>  2 files changed, 3 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index d74b361be6..40c96a32cc 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -164,7 +164,6 @@ struct CPUArchState {
>      target_ulong guest_phys_fault_addr;
>
>      target_ulong priv_ver;
> -    target_ulong bext_ver;
>      target_ulong vext_ver;
>
>      /* RISCVMXL, but uint32_t for vmstate migration */
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index f4605fb190..c67a8731d3 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -136,8 +136,6 @@ struct RISCVCPUConfig {
>
>      uint32_t pmu_mask;
>      char *priv_spec;
> -    char *user_spec;
> -    char *bext_spec;
>      char *vext_spec;
>      uint16_t vlen;
>      uint16_t elen;
> --
> 2.43.0
>
>

