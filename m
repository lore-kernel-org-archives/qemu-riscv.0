Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A5DC4725D
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 05:25:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRmni-0006I8-8L; Mon, 22 Jan 2024 00:24:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRmng-0006Ho-VI; Mon, 22 Jan 2024 00:24:48 -0500
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRmne-0000qD-GX; Mon, 22 Jan 2024 00:24:48 -0500
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-7d2e37e1d19so1078570241.1; 
 Sun, 21 Jan 2024 21:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705901085; x=1706505885; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z+vfULguOS+rBjxCWcdIUtCQ00hv0VL3NufwatwoZfU=;
 b=VRt1fFF27tE/SLBBKzVnkWfFpD3QwmzmBmsZ4VH0kqj2+zXleSSbhnmYWcUpGZ6oY3
 pa1BTv7BLy25z3Ug3j5As/O18EokdA7NPRWix+ftSwa0zmJ8Y1f9zxTDZXCaYNmJnjaV
 f67K1tALIqoFTUDwRks+IdukHzXHIskQQaTqe8jzuGnDjhf9FOL8hJqFeFJt8wSiWADN
 C75WEtytZvRNPogET8h7rougIPg2+RiVa2F/Ju3DWSttV+4fjuR7L5RRu2JV9Hr6Z8mT
 c2brx4tbVfqKcL/254g4Jt6FOov35QNb5Wc8Fap7FnTrv0IENcK3MjMxE8GHmc0isv1s
 rczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705901085; x=1706505885;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z+vfULguOS+rBjxCWcdIUtCQ00hv0VL3NufwatwoZfU=;
 b=UbPQb9KfQRRj9nO2z8mEoa0ilX6TlAwBzRKH7ZeqQObKcbbD+eP8m2yLerRNx4YBQQ
 oT6JXzaHFgW0/LHmiGfNELNM0sXo3o7h8DoaCZXpRlj9lFD9c3al37K4Vz1ov2n9Hbu9
 UsEbIch+G5RG1BDwmo9VsK0Brj25Ik2B3JjA5eMNG0LU0cAVaXhqCQye9LM9jYONupAr
 Tz63XzFPH4mHdEntO6h/RMYWa3XrZjtPD9R0pm+6IG27hELmrXpKov9rKjr4gzcaBYsU
 oJleC2Ehb+g2QjM9nkm585zJC5NPTUGL2laSECo43ZrQc3IB1PRk0Lm5USlTNMByxEXC
 cG1w==
X-Gm-Message-State: AOJu0YwVPIaV3U+IopNrQjWyt1kCWAN7r0kfGjKjkLbOBsJ9sOn/D6PZ
 PLevfV4ICH4Uscr4OFEt/9Z07dWwDkIob0wqEur4nvbeKgP2TAAAkA+Ge/XDo22qk7OtPXPkXW6
 1/PVBHmA/pPwut6p6kUM2xKlNeb0=
X-Google-Smtp-Source: AGHT+IF/ZvFbN4iKJQsSZ+vJHNMRhykxCjieTKBWS8xEwYLLIIEMSh8783/hKy8XQGMUfWC2fxdJf1pp5RbuRtyIrGs=
X-Received: by 2002:a05:6122:1798:b0:4b7:57a4:1238 with SMTP id
 o24-20020a056122179800b004b757a41238mr2975052vkf.14.1705901085035; Sun, 21
 Jan 2024 21:24:45 -0800 (PST)
MIME-Version: 1.0
References: <20240110-mold-renovate-256db1b5c70e@spud>
In-Reply-To: <20240110-mold-renovate-256db1b5c70e@spud>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 15:24:19 +1000
Message-ID: <CAKmqyKOy19Vy5zm8=9WZmUs3H=aL8Tn49-iXu9LfEHtHJMpadA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] riscv: support new isa extension detection
 devicetree properties
To: Conor Dooley <conor@kernel.org>
Cc: qemu-riscv@nongnu.org, Conor Dooley <conor.dooley@microchip.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92c.google.com
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

On Wed, Jan 10, 2024 at 8:27=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Making it a series to keep the standalone change to riscv_isa_string()
> that Drew reported separate.
>
> Changes in v3:
> - g_free() isa_extensions too
> - use misa_mxl_max rather than the compile target for the base isa
> - add a new patch changing riscv_isa_string() to do the same
> - drop a null check that cannot be null
> - rebased on top of Alistair's next branch

Do you mind rebasing on
https://github.com/alistair23/qemu/tree/riscv-to-apply.next again?
There was a big re-org recently so lots of rebasing is required

Alistair

>
> Changes in v2:
> - use g_strdup() for multiletter extension string copying
> - wrap stuff in #ifndef to prevent breaking the user mode build
> - rename riscv_isa_set_props() -> riscv_isa_write_fdt()
>
> CC: Alistair Francis <Alistair.Francis@wdc.com>
> CC: Bin Meng <bin.meng@windriver.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Weiwei Li <liwei1518@gmail.com>
> CC: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> CC: Andrew Jones <ajones@ventanamicro.com>
> CC: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
> CC: qemu-riscv@nongnu.org
> CC: qemu-devel@nongnu.org
>
> Conor Dooley (2):
>   target/riscv: use misa_mxl_max to populate isa string rather than
>     TARGET_LONG_BITS
>   target/riscv: support new isa extension detection devicetree
>     properties
>
>  hw/riscv/sifive_u.c |  7 ++----
>  hw/riscv/spike.c    |  6 ++---
>  hw/riscv/virt.c     |  6 ++---
>  target/riscv/cpu.c  | 57 ++++++++++++++++++++++++++++++++++++++++++++-
>  target/riscv/cpu.h  |  1 +
>  5 files changed, 63 insertions(+), 14 deletions(-)
>
> --
> 2.39.2
>
>

