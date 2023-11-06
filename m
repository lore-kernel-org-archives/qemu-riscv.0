Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4F5C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 00:11:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qznCO-0005q0-3V; Sun, 05 Nov 2023 19:10:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qznCM-0005p9-Br; Sun, 05 Nov 2023 19:10:34 -0500
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qznC2-0001N2-Tx; Sun, 05 Nov 2023 19:10:32 -0500
Received: by mail-vs1-xe36.google.com with SMTP id
 ada2fe7eead31-45dad6ece90so555379137.0; 
 Sun, 05 Nov 2023 16:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699229409; x=1699834209; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ioXc727uXGVCxn1HJrPKqxsswmBPCuAP41UTisZiZQw=;
 b=bIcQk7zezt6wasxdAJdICvaGglbpyVQZ1REByuhNJMOqE8jLZl0VMChD5ZARTUvQnc
 oh6G6glMa00FpAz/IcztuNGhpOjGAddMHLG40JGIdHAtw689G/B+FAPRU8aoYYROto9Z
 j6J0SryAmoAJYqleM83cFixiJRM1sbZ/YrOWBuBYWK6MGJQfyKCcosH5e0j1fm6uXEjS
 f0fK122tnq2d6Kdnu6rWYS4D+nSvYoeeE9THT9jFm1nbVuRNs8C3Yl5Utho5EyQ5+q/a
 e9BkTBjlF17+njcbQCzXEDMp+9S/cUMY0h0IZ5erub8Miw5I6DFVJyVBajQ3fd2MWkGW
 j6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699229409; x=1699834209;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ioXc727uXGVCxn1HJrPKqxsswmBPCuAP41UTisZiZQw=;
 b=QvR6Un1dqDDxyziFfsjOCKweYJXvNEiLKkFllvEDtquc8ADXRTjv+jr6526XGEADQu
 90uhiA0ZG3OWglGjWc16PjJXLgGj02HX8QDnDKfPfiBOy876w6OdiWZQWsAUlK+GlXwo
 rOtZnN43tlyClVPRE85yTK1Xi6WS+Crul5PO5jll5RWQBBQh0XNjES5bWdwpTMcHfRbD
 FLdkbQF/MgAMUz0GE2K6hMr5lvZ8c5VpWc8IrTaTeEiJLyaDUENylMpuYvp6+ZbDEnKK
 d7LAozLD09BmDD9kpqavh9GdP+zY1zc7YSmIo+/arFhOrlJgwQA6/0cvvpYGR8tV3hOr
 rRDQ==
X-Gm-Message-State: AOJu0Yxgk/deNUKACm8+unumIKktuFM1OAm5pN20RQVZAIuPvGUL5gWu
 a40rCYJ2qs814IYSgBKDF9T1+3iUBlNfi6ClCYaM80ICSHo=
X-Google-Smtp-Source: AGHT+IGkSjbYZ3jptSNSbnVpcc8ULwAqkQt05nYHV1tdDmnDeoDZ+os02R6vK5jddABzLnlKGVJ2SShsCLF6Mbzx+yE=
X-Received: by 2002:a67:e156:0:b0:45f:2587:71cf with SMTP id
 o22-20020a67e156000000b0045f258771cfmr333025vsl.12.1699229409501; Sun, 05 Nov
 2023 16:10:09 -0800 (PST)
MIME-Version: 1.0
References: <20231102003424.2003428-1-alistair.francis@wdc.com>
In-Reply-To: <20231102003424.2003428-1-alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Nov 2023 10:09:42 +1000
Message-ID: <CAKmqyKOmMipfzjrDhi7j6C5WZjOF98epGLLbQGeNF_RhuqpEuQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] RISC-V: OpenTitan: Fixup ePMP and SPI interrupts
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: liweiwei@iscas.ac.cn, Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair@alistair23.me>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, bmeng.cn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Nov 2, 2023 at 10:34=E2=80=AFAM Alistair Francis <alistair23@gmail.=
com> wrote:
>
> Fixup the Ibex CPU priv version so that smepmp/epmp is correctly
> enabled and make a small change to the SPI interrupt generation to
> ensure we don't miss interrupts.
>
> Alistair Francis (2):
>   hw/ssi: ibex_spi_host: Clear the interrupt even if disabled
>   target/riscv: cpu: Set the OpenTitan priv to 1.12.0

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/ssi/ibex_spi_host.c | 6 ++++--
>  target/riscv/cpu.c     | 2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> --
> 2.41.0
>

