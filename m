Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C6ECCD1AB
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 02:38:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vBlDU-00067K-D3; Wed, 22 Oct 2025 22:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vBlDQ-00066Y-RH
 for qemu-riscv@nongnu.org; Wed, 22 Oct 2025 22:38:12 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vBlDP-0005h4-0D
 for qemu-riscv@nongnu.org; Wed, 22 Oct 2025 22:38:12 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-637e9f9f9fbso506675a12.0
 for <qemu-riscv@nongnu.org>; Wed, 22 Oct 2025 19:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761187088; x=1761791888; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tZ1Li+zQnOnMqkypzcF/DnB9F+kM/ZRRwvZgQTomdNk=;
 b=XRvrbqdpeQZwb410xrA3zMmxXbOy8clN27Qa3DT/7Rc9cxTGKS8MZn+bF7sgT5Xoa0
 j8XjdBrQuMhINNBg3MEshIyjlOpi1CRvO9OQT5mEYEzS2Y2yo9YCiWCgu6FV432voZcf
 xs5Q+bZd+1zr9RFHaAnwfQSRUy2RooS9FdpGx0rssc50ch+R+sPDLN5Nez0Gl6PrVEkd
 KwRDsevz4/ZI7nQuXRAq0tXQxUg0Htu+9nYQm59E+ChvJ0gOJyT3tUiUIbVKXq70GnKU
 ZOW01etr2BHhcZAP8MfDxBpVd9yte9F3gKG72+jiysKmRxH4yVoTHteuAS0vMB0LVXka
 ZJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761187088; x=1761791888;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tZ1Li+zQnOnMqkypzcF/DnB9F+kM/ZRRwvZgQTomdNk=;
 b=vsKVjaj81ihHd1J3SPLpc697tLm7/n30nC3f9MXsRtu961tEKcJKogueruuwgvHZ4z
 694Gj6TgBpGvUg+3hDlP9JswFsAD9PehQh2BMquvzhiC7FkTMNSIAWlh5sW3JPOscc0P
 XSbIIaoCrBDh5LQgong/47p4xziYtfOz0mEYe6MttkrFbuvCKpgPxq8tigbKIB7mHDYC
 JRkJXKli32n4QtaEPvMp3x5AzdlEA+b7/jKc6d3eckJwYBUBGD5VWUc7LecI5dFZoolp
 QbWlJGqjjwNOSFYztKrphQaEwNTyR2PxY/9YBBuYkCg+XWMXrJNMo9zB6YoE4Ni/FQst
 uJLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/BoF9PxpZTiBkV55Ke1VMalXcWkefa0nzdyLMSjxiX/Gd1kDWzz2LTTk1fgAQNmNoE7OaO9csKn6e@nongnu.org
X-Gm-Message-State: AOJu0YwikHfcFosC3UPofKEAw1McldTy2dT4mhAn4jhi0a2YEYIdhvL9
 8AaTw1ceR7zsJ579vdAZBFZsnL869CAa4/oXJmwNBg+6I0ny2cTkbhOvX8V81aCDdKXSHCyqOKF
 z6jX1o3+AWX+FBk/iBEjD12p7cFJasgQ=
X-Gm-Gg: ASbGncuNd9t3iBRFuQU4lLIQpEnYMuWMfxRLpHMYeqym4dKEGg4blFipz0RG+TUykms
 /GsIKOUpVZAIp8QQBj0UTfvjqCkxDaUyBMwd1ReK3VLFkt3PsH5aQel8g5XUC3JHuBqqr3A1Xtk
 vZDZgJzwzpRcUyfnfu8zGCZoIvsDbXnj0Mnt6/f+6K/MsGFGGBd5JAjN1vnYpVYqCtSOd0G43ET
 THHWyW2gzS662GHHvt1m3t9k1am6Mq0wFYxIigzJqDINQh63ZBRcj2Yhmf9HmB6g5LwxYVZK8KJ
 iGqr5309QLMwhi/mOfjPcf2ymg==
X-Google-Smtp-Source: AGHT+IF/R3rsoj8+SzDwYHQzXDZKgOw6k+F2OmdxvFmpd8r04zcfm5TwqDf2gTMZqn6SRhvk7zebi3LDeQEROPZkqf4=
X-Received: by 2002:a05:6402:40c8:b0:63e:1354:d9ab with SMTP id
 4fb4d7f45d1cf-63e3dff6f32mr960540a12.8.1761187087957; Wed, 22 Oct 2025
 19:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <20251022024141.42178-1-jay.chang@sifive.com>
In-Reply-To: <20251022024141.42178-1-jay.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 23 Oct 2025 12:37:40 +1000
X-Gm-Features: AS18NWDtuopmd2qokXK6qlDe9gMrNQpJ_2-MDEDnWQj9SQCyLakiecmbviHzYto
Message-ID: <CAKmqyKNY1W6K1E=9Y98Ou24qOn5tn00VmdWs9orE9MgAQeSJsg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Make PMP granularity configurable
To: Jay Chang <jay.chang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x535.google.com
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

On Wed, Oct 22, 2025 at 12:43=E2=80=AFPM Jay Chang <jay.chang@sifive.com> w=
rote:
>
> This patch series enhances QEMU's RISC-V PMP support to conform with
> the RISC-V Privileged Specification regarding PMP granularity and WARL
> constraints.
>
> Previously, QEMU always used a fixed minimum PMP granularity of 4 bytes.
> This series introduces a configurable "pmp-granularity" parameter, allowi=
ng
> platforms to specify larger granularity values. In addition, the handling=
 of
> pmpcfg and pmpaddr CSRs has been updated to follow WARL constraints. For
> example, when NA4 is not valid due to a larger granularity, it is silentl=
y
> ignored. TOR and NAPOT address ranges are also properly aligned according=
 to
> the configured granularity.
>
> A new CPU parameter `pmp-granularity` is now available on the QEMU comman=
d
> line. For example:
>
>     -cpu rv64,g=3Dtrue,c=3Dtrue,pmp=3Dtrue,pmp-granularity=3D1024
>
> If not provided, the default remains 4 bytes.
>
> ---
>
> Patch summary:
>
> 1. target/riscv: Make PMP granularity configurable
>    - Introduce CPU property `pmp-granularity` for platforms to configure
>      PMP granularity.
>    - Default remains 4 bytes if unspecified.
>
> 2. target/riscv: Make PMP CSRs conform to WARL constraints
>    - Update pmpcfg and pmpaddr handling to follow WARL semantics.
>    - Align start and end addresses of TOR regions to PMP granularity.
>    - Ensure software can read back correct values per the spec.
>
> PATCH v3 update
> Change UL type to ULL to prevent bit-width errors.
>
> Jay Chang (2):
>   target/riscv: Make PMP granularity configurable
>   target/riscv: Make PMP CSRs conform to WARL constraints

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.c                | 39 ++++++++++++++++++++++++++
>  target/riscv/cpu.h                |  1 +
>  target/riscv/cpu_cfg_fields.h.inc |  1 +
>  target/riscv/pmp.c                | 46 +++++++++++++++++++++++++++++++
>  4 files changed, 87 insertions(+)
>
> --
> 2.48.1
>
>

