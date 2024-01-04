Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9F9C4706F
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 06:08:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLGu0-0005gQ-Fw; Thu, 04 Jan 2024 01:08:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLGty-0005fr-Jg; Thu, 04 Jan 2024 01:08:22 -0500
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLGtw-0005yR-Pa; Thu, 04 Jan 2024 01:08:22 -0500
Received: by mail-vs1-xe2c.google.com with SMTP id
 ada2fe7eead31-466f4be526bso41853137.0; 
 Wed, 03 Jan 2024 22:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704348493; x=1704953293; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sKFsKHhRtmzJqkFI8rCYjZj4XqnX/Q95NlhfjUuIPpQ=;
 b=LOtZIFeMJnZdc3uiIva872FsF8h9ejudgxKo3FS/MfKQzAkWLA0YSiT34BtYAdX2aw
 Xmhpvhqxd9QwdIGUhMszf0Qc1xs7Fgqtd6h2/S7tZNtA5L7bXMGO8JZJAYYBuczT31Hy
 2LZf6VMwbASYHIGoYCPj0yuSECwjZCd/1eZmmPpxqUvNBRct+FUCzApWfpQoFA9+xQED
 fFu0CAXIKw1F5QCORh2+H4yep1ZjE6Rau9dMTItKQpog1+jwYRvIl6Ojvo5KdXhT9nP1
 iJfH0S0k/4TXbcPHVR0rEvA+p2EHCUkb1OSoCjJHOCY7rP+veSjhfByhQmxo8skaobra
 WZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704348493; x=1704953293;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sKFsKHhRtmzJqkFI8rCYjZj4XqnX/Q95NlhfjUuIPpQ=;
 b=cqhnvVFe+PqaMAz/Hi+cAnHspxsbg0baMrUrk/7ZhZAfELH8T/VpfhrDLz6tyr5Rnr
 P1vuY2SpACq0XOFrpmJweJGAQR62xXBblW3e9ayNm1bxb0pyMwZ0Os5HkU2D/yhfLmLr
 6xt33ALENRLW5TQ1q/uzXNtbABX9a0BgrDEYUi5B/oY6WL4z1vNdEfumGlYPv8YEJKEl
 rbGaxiwX8iLL/qNzWs21FuOoYhuGgwLPNgCI3ZyzOgabuVR6dy28PKFmpa+qPmHJqkmn
 HnuAXvpO+D0OeuIoSyZiJUnSvR+VILHLFMNuus6ADeh89MXxYDG5BaLJ4bWQKW0C+gda
 sp0Q==
X-Gm-Message-State: AOJu0Yzn0s2HWzhWiCCxMNDtvT6zwtOYA9Lynt4CYhU7LLsAwPNISPxj
 fkdLOc3ugTfMX/O//e3UoZCoIa3czA/jslC7S7j2kxXe
X-Google-Smtp-Source: AGHT+IG59s9jUxR+E/SBlN9iwgnMWQdM1/SrsGWE4AI9BOsNmAOqdZ1lTmQB9lZ56sFV7jubBf/CWOQVXypA4Q5z+3A=
X-Received: by 2002:a05:6102:d8f:b0:467:7ccb:27da with SMTP id
 d15-20020a0561020d8f00b004677ccb27damr29151vst.6.1704348493335; Wed, 03 Jan
 2024 22:08:13 -0800 (PST)
MIME-Version: 1.0
References: <20231207153842.32401-1-rbradford@rivosinc.com>
In-Reply-To: <20231207153842.32401-1-rbradford@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Jan 2024 16:07:47 +1000
Message-ID: <CAKmqyKP1=Uf3GnyKiM7_a6NiT3RNjUL7RL-DDZodpDt5Vf4-Gg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add support for (ratified) Zacas extension
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, atishp@rivosinc.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liwei1518@gmail.com, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2c.google.com
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

On Fri, Dec 8, 2023 at 1:40=E2=80=AFAM Rob Bradford <rbradford@rivosinc.com=
> wrote:
>
> The Zacas extension is now ratified:
> https://github.com/riscv/riscv-zacas
>
> This series uses a patch from Weiwei Li from:
> https://github.com/plctlab/plct-qemu/tree/plct-zacas-dev with the
> following changes:
>
> * Fixed destination register (looks like a copy and paste error),
> * Fixed extension name enabling,
> * Minor coding style fixes,
> * Updated for new extension handling & cpu.h header split.
>
> This patch was mentioned on the list here:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg970280.html
>
> The series was tested against riscv-tests from the following PR:
> https://github.com/riscv-software-src/riscv-tests/pull/492
>
> Rob Bradford (1):
>   disas/riscv: Add amocas.[w,d,q] instructions
>
> Weiwei Li (1):
>   target/riscv: Add support for Zacas extension

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  disas/riscv.c                               |   9 ++
>  target/riscv/cpu.c                          |   2 +
>  target/riscv/cpu_cfg.h                      |   1 +
>  target/riscv/insn32.decode                  |   6 +
>  target/riscv/insn_trans/trans_rvzacas.c.inc | 150 ++++++++++++++++++++
>  target/riscv/tcg/tcg-cpu.c                  |   5 +
>  target/riscv/translate.c                    |   1 +
>  7 files changed, 174 insertions(+)
>  create mode 100644 target/riscv/insn_trans/trans_rvzacas.c.inc
>
> --
> 2.43.0
>
>

