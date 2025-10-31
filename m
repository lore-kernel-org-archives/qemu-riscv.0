Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112CFCCF9E3
	for <qemu-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 03:29:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vEfpX-0004dO-C6; Thu, 30 Oct 2025 23:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vEfpV-0004cq-4M
 for qemu-riscv@nongnu.org; Thu, 30 Oct 2025 23:29:33 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vEfpQ-0000KJ-Ve
 for qemu-riscv@nongnu.org; Thu, 30 Oct 2025 23:29:32 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-63c489f1e6cso3333460a12.1
 for <qemu-riscv@nongnu.org>; Thu, 30 Oct 2025 20:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761881362; x=1762486162; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ae+Mf5Csw1vp6GvaHpjWnSvsgrwfvZmao3NOLmGg+yI=;
 b=Jmw137TaIETkDqQLLLdWkTO37O3Yr4glvYjVG3A2X3uTcPKcn5ZyqtNl3ZzsteIie7
 nBGmJKE4E8ANYwBLqUJp7zuVc/y9Jaep5Q1vs+hJo4IA17B2XpmItG2Fk/c1GNgcZoid
 WjoonALvc7JcUwyhyWytHzQGITsi1ahTGnGFYvjI6cGhWSBviVQaMKavOHklTCP0Xygv
 12p1n5atyOhvwrMmLDv+XhnU8H1ROLqAeOsuQ4rnac52bPBBC16nRWownYBLMzNVUTsn
 yTnETzAdRAGdUSbZm/VomxMCQZOdzmQHRHjiq977wrofFrZulSVocpG0gTcN9I8k7Sek
 IsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761881362; x=1762486162;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ae+Mf5Csw1vp6GvaHpjWnSvsgrwfvZmao3NOLmGg+yI=;
 b=f5RfpydLpojFFhQvfLyQUMUQA5mG/JYbdZtfflmZYSylUPi96CNOB3Fe5B3jxGe236
 fV0NSObgmp1/fEc/PliU+GMd3ApXRhZvbe4YAr9WFVux7TfH91Ee89lRsMWYHr3ra364
 8XR+LFWXQfCIG7b1lJ9tRhQ0ZhhY3oETmAOtPSdh+b1mUV87IuwV10UM2t6+BKoQv8sP
 uKGOQKnzd9TFoWWuDEh/ifG2EAhoETV8grm5qb66HG4xE7fDVsvchPNBbZ+SGQCmuG7O
 rBHn4yf1+fbrSTi/l5yvwRLrADm12WuZLMmyFMtCCQCMKloKa+3qfMUhVQ4o65AkhuB5
 8Xlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaqiYmzv0a+gqW88RJJ6DByAByAUDIhiRJIDa1LLm+xXrEc5/jHYSidpWlskFRfOyc2wP38lWy0Dm9@nongnu.org
X-Gm-Message-State: AOJu0YzrtoBbGsi6elh0SN0wLfAz0Z1LDaIWI8VwXst4xQK/vfSlVkwM
 eeE2oJFVqnwEM3EtsQhlh6BNmad489QybmwxXaIScTw+QlI9dlkgDS9pvd206sanY22it1G03co
 VuxpQw1VxFHdv+3eDWUB40rLz2+OCQi4=
X-Gm-Gg: ASbGnctLAjazlR6GzYzUUe6UJ0F0Hmz28egM/eUJpl0Cgv5OIHSEpaymqsysm4X/Cw6
 QWjZ4HtfUFXw/ZKGMF9QyHT3b+4DLPoI9PS1RdTH0m3k1p40QsoKFVR/YsK1B+YQGgZRUvKt/Re
 Askyokqt7wufdteYPSLOOmQgx34eKqhhlmMbqkYpeZuZ4OShD9aq/jo1Vh+Ajy9CwL8YvRXfAXr
 u0pd3SEpzEfQKq64vbGwtV2+WcF7ohp4OvQuXQ0CkKN1bWnwZb/5CdS6w6mBHyH9yMp3GiMeH9V
 xUegtKbnkbKTXx8IU0sb6D3yAv2fhg0zN6vE
X-Google-Smtp-Source: AGHT+IE3cZNhLvm3O/mdENlZ6OzkyBO9rMLgTdabWjrZNHvyfLXUoPA2N5x/9Md6iWsBRvRL3EPS2u0iYGrkuffCnds=
X-Received: by 2002:a05:6402:40c6:b0:634:11d7:f70c with SMTP id
 4fb4d7f45d1cf-640752fd07dmr1992852a12.2.1761881362489; Thu, 30 Oct 2025
 20:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <20251028084622.1177574-1-dbarboza@ventanamicro.com>
In-Reply-To: <20251028084622.1177574-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 31 Oct 2025 13:28:56 +1000
X-Gm-Features: AWmQ_blc9XEuXkLUVARBsGjL_lLzoC9ehpUVap6U0KObwOS5ddsmDVuuMVICwS4
Message-ID: <CAKmqyKMboT1r-TcUfP06iDdHQ2kV_k_xkE5Wirvc_feL81hDOQ@mail.gmail.com>
Subject: Re: [PATCH] docs/specs/riscv-aia.rst: add 'riscv-aia' accel prop info
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52a.google.com
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

On Tue, Oct 28, 2025 at 6:48=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Add a small section talking about the 'riscv-aia' KVM setting we
> implement and how it affects the provisioning of the IMSIC s-mode
> in-kernel controller.
>
> While we're at it, fix the formatting of the AIA bullet list.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  docs/specs/riscv-aia.rst | 43 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 39 insertions(+), 4 deletions(-)
>
> diff --git a/docs/specs/riscv-aia.rst b/docs/specs/riscv-aia.rst
> index 8097e2f897..f3c6ab7fcb 100644
> --- a/docs/specs/riscv-aia.rst
> +++ b/docs/specs/riscv-aia.rst
> @@ -8,10 +8,8 @@ RISC-V machine for TCG and KVM accelerators.
>
>  The support consists of two main modes:
>
> -- "aia=3Daplic": adds one or more APLIC (Advanced Platform Level Interru=
pt Controller)
> -  devices
> -- "aia=3Daplic-imsic": adds one or more APLIC device and an IMSIC (Incom=
ing MSI
> -   Controller) device for each CPU
> +- *aia=3Daplic*: adds one or more APLIC (Advanced Platform Level Interru=
pt Controller) devices
> +- *aia=3Daplic-imsic*: adds one or more APLIC device and an IMSIC (Incom=
ing MSI Controller) device for each CPU
>
>  From an user standpoint, these modes will behave the same regardless of =
the accelerator
>  used.  From a developer standpoint the accelerator settings will change =
what it being
> @@ -81,3 +79,40 @@ we will emulate in userspace:
>       - n/a
>       - emul
>       - in-kernel
> +
> +
> +KVM accel option 'riscv-aia'
> +----------------------------
> +
> +The KVM accelerator property 'riscv-aia' interacts with the "aia=3Daplic=
-imsic"
> +to determine how the host KVM module will provide the in-kernel IMSIC s-=
mode
> +controller.  The 'kernel-irqchip' setting has no impact in 'riscv-aia' g=
iven
> +that any available 'kernel-irqchip' setting will always have an in-kerne=
l
> +IMSIC s-mode.  'riscv-aia' has no impact in APLIC m-mode/s-mode and
> +IMSIC m-mode settings.
> +
> +
> +.. list-table:: How 'riscv-aia' changes in-kernel IMSIC s-mode provision=
ing
> +   :widths: 25 25 25 25
> +   :header-rows: 1
> +
> +   * - Accel
> +     - KVM riscv-aia
> +     - AIA type
> +     - IMSIC s-mode
> +   * - kvm
> +     - none
> +     - aplic-imsic
> +     - in-kernel, default to 'auto'
> +   * - kvm
> +     - auto
> +     - aplic-imsic
> +     - in-kernel, hwaccel if available, emul otherwise
> +   * - kvm
> +     - hwaccel
> +     - aplic-imsic
> +     - in-kernel, use IMSIC controller from guest hardware
> +   * - kvm
> +     - emul
> +     - aplic-imsic
> +     - in-kernel, IMSIC is emulated by KVM
> --
> 2.51.0
>
>

