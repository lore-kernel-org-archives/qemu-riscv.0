Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4C4C47DD9
	for <qemu-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 19:12:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rnkIU-0007Pl-3J; Fri, 22 Mar 2024 15:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rnkIK-0007Oy-BR
 for qemu-riscv@nongnu.org; Fri, 22 Mar 2024 15:11:12 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1rnkII-0005yU-AE
 for qemu-riscv@nongnu.org; Fri, 22 Mar 2024 15:11:12 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-513e89d0816so3106559e87.0
 for <qemu-riscv@nongnu.org>; Fri, 22 Mar 2024 12:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711134667; x=1711739467;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jvx8ZjJ0atERzIqSHDRdJfASHUoCN0/DtdUDOA6nc5U=;
 b=b5kfUWEMhbGxdG+j2MckNeEjzgQOoGrRRoS3+yyoUN+Ov53JPMJ3J6hHzsKO1gWRqG
 5GTislw2T6JdG4Nw0Fl7zi/xsprLocLd/ra+8fo9AnaJ2QRln/S9D3JSBCJTSXm04Tly
 XUt0+kTpPIJhIsSTpdGaLZfRbo2CbPcFDlasBbEy6R4CTkcQl77KRH7SuBzBaY2IjpiL
 jMrcuNZih7HgXoB7cnIi2tkvpBp7TXszNXlwJuOJsj3REek3WwAPR1QjI0ZVuSz6xGvr
 g9E5JKgYjM9sOWYSfGPR6RWOVI4QMQnbMNMHsgvI+TNFNP0w8BLuHgKvoESuxajEb7H1
 eTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711134667; x=1711739467;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jvx8ZjJ0atERzIqSHDRdJfASHUoCN0/DtdUDOA6nc5U=;
 b=bGylk68ikOvnM3c/AOqAnmcbTgExS6S6/WixRz7fF8yjvazhD1rqh2P/fMb9+sso8e
 vmCRG09TVEeQva7ATSY5WcYt/z33NR4wrIRyjwLP+bLjubDUWutunABEADlT/RmBNd1H
 utndPLnDkGzMrZ/kT8uEhvkL6Cukb1v6qP1dEA0bpv5Ve3qr9FDYppiGCLGgor2QsSC2
 BXftd32OXHa+yM3XYavth1KtWJVSP6tRBinzWdWJ5D7WLweHMKDQqDCFSI7XahH8axh3
 b1Mc3ElsOB4da4cWjAZuheg9BAQk5BTy2ATnzWrUAGDNjmORvEp3zYsgX+spqDoc22Il
 4Pbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3rqVt6HbqUa+mQ9rwLax64qk3MPhoR9OkDIaN6FrKTZwWN23EqoGphFjmCpx1T6YWSWdUiXKxE6OI4RIstFaKZONT38M=
X-Gm-Message-State: AOJu0YxWA+zGgnMI6YjDR9LfNyBE9gaMv8rTe5OFa4jZ1M7aoPrcuneK
 o7+n9TOE8he0ndz4R25xySukt5Gi9CYxkw6BluKr6qTfXIKXkvkPp3Ywtnrdt2bglxsr7/QgYrA
 QwNlBk3ZuhhxN0SkdRxsweGBCqbhlL4Yk7SdhIw==
X-Google-Smtp-Source: AGHT+IEyHWVlv2xT9HB90YGXQfq1DJvLPdycn2ghKK1uL8sFND5OzlCdI0AZQp93vjUQuuTxf245scZuX1kpm5RWtTg=
X-Received: by 2002:a05:6512:456:b0:513:2b35:2520 with SMTP id
 y22-20020a056512045600b005132b352520mr221837lfk.58.1711134666703; Fri, 22 Mar
 2024 12:11:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240312135222.3187945-1-fei2.wu@intel.com>
 <20240312135222.3187945-3-fei2.wu@intel.com>
 <CAKmqyKN-Yj-HZrR2MtxD2jC=JR6nFn5cEq866EXm0OfaEydXsQ@mail.gmail.com>
 <cfac29ce-f353-4bbd-8e8d-4a7d40bf80e3@linaro.org>
 <ebd63aa1-b4e7-490a-bdef-d952c8e37c47@canonical.com>
 <5587d9ed-6cdd-47ae-864e-75cb5ea47aee@linaro.org>
In-Reply-To: <5587d9ed-6cdd-47ae-864e-75cb5ea47aee@linaro.org>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Fri, 22 Mar 2024 12:10:55 -0700
Message-ID: <CAHBxVyFufHcSumU1b_uxQikVak-7f-xznhAwB7u5HxEXujY6-A@mail.gmail.com>
Subject: Re: [RFC v2 2/2] hw/riscv: Add server platform reference machine
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 pbonzini@redhat.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liwei1518@gmail.com, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, andrei.warkentin@intel.com, 
 shaolin.xie@alibaba-inc.com, ved@rivosinc.com, sunilvl@ventanamicro.com, 
 haibo1.xu@intel.com, evan.chai@intel.com, yin.wang@intel.com, 
 tech-server-platform@lists.riscv.org, tech-server-soc@lists.riscv.org, 
 ajones@ventanamicro.com, conor@kernel.org, Fei Wu <fei2.wu@intel.com>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=atishp@rivosinc.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Mar 22, 2024 at 2:20=E2=80=AFAM Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> W dniu 22.03.2024 o 09:50, Heinrich Schuchardt pisze:
>  >>> I see no mention of device trees in the spec, but I do see ACPI. Do =
we
>  >>> really expect a server platform to use DTs?
>  >>
>  >> This platform "kind of" follows sbsa-ref where we have very
>  >> minimalistic device tree sharing information qemu->firmware.
>  >>
>  >> libfdt is small, format is known and describes hardware. Firmware is
>  >> free to make use of it in any way it wants.
>  >>
>  >> On sbsa-ref we parse DT in TF-A (base firmware) and provide hardware
>  >> information to higher level (edk2) via SMC mechanism. Then EDK2
>  >> creates ACPI tables and provide them to the Operating System.
>
>  > We should ensure that only either an ACPI table or a device-tree
>  > description is passed to the OS and not both, e.g. when using
>  >
>  >      qemu-system-riscv64 -kernel vmlinux -M sbsa-ref
>  >
>  > But that requirement is not machine specific.
>
> I would not call "qemu-system-* -M machinename -k kernel_image" a proper
> way to boot for several systems emulated by QEMU.
>
> DeviceTree is in rvsp-ref and sbsa-ref because it is easy to process in
> limited space 1st stage of firmware has.
>

OpenSBI also has DT support only. So a minimalistic DT generated by the mac=
hine
for the firmware is required for RISC-V as well.

> And if we knew how people will mention 'sbsa-ref uses DT' we would use
> something else instead. But that would require adding more code into
> existing firmware projects (libfdt is usually already there).
>
> I did not looked at DT generated for rvsp-ref. I know that sbsa-ref one
> is too minimalistic for kernel use as we added only those fields/nodes
> we need to provide data for firmware.

