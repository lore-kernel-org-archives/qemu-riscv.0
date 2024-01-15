Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A47DC4707B
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 01:29:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rPBmR-0006LI-BM; Sun, 14 Jan 2024 20:28:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rPBmH-0006KV-3W; Sun, 14 Jan 2024 20:28:39 -0500
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rPBmF-0004qJ-CN; Sun, 14 Jan 2024 20:28:36 -0500
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-4b78b813dd0so1507045e0c.3; 
 Sun, 14 Jan 2024 17:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705282113; x=1705886913; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BMyaPqMU+yTQ4jRoDn6GnzzvcQyzXwK5LRTL/BNPcTw=;
 b=ZpTtK74K0eDXo8S6+YNRQtf3lbInyZGVGd5pdh06imHCNGxIFV9l5zXKRxb79uHLmV
 tj+dj0DPWVYp4Sj+9xpLYLmD/tTTwbODb5ZErbAGooj0/FiuW3COxRvn9JQSIIuaR4mM
 4QdXtWIiYEUw50LbLbs7fPclJ9n9pCaiN0LqSt6r4X+rrhayNSWyupslnqpIRZDyQ053
 HPH8/7gOfYZLlkWZwvgRNY1rGlfVkWDrK8dnCf2XyXyL10E/V4KpiiEEoeGJDH4UP942
 96C6rZPLXiJ7NoD3Yr3vicyhGJxMt2Z8B5md8AMSPlC6RBbgZ2aCS0v4FlkJxAH3jWHZ
 Tayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705282113; x=1705886913;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BMyaPqMU+yTQ4jRoDn6GnzzvcQyzXwK5LRTL/BNPcTw=;
 b=jV7NO6crcU9s5Fzes7SaqOg+U0OJL46W83vbsw8F+xTwy5XSzkXaNm9UhrYBnP9YND
 RQTbx1Adg9bgP0UkI+s15PV51FHdCnmsJ5UrRTQYwDUmhdxsaybHYkYmMclTzFsyGEfi
 Me6MZxe4GXTUDt7mFZh8LqLj6OPQ9dQLYoYCaK1uUZDGfOq1qVTbc3/tf0qMHAkRGjwH
 OoxG84aXXGa0qxF7/fVtR0iT9qBcPVWOcfGQZNM+dePFRPOWZunHMQAvOIupuE9ci9LF
 0R2vliUIaBrSPXvCjvuquqLNjxdWsKvOrO/WeV1RKeFbN9RK+0ZCdHwtpkjPdxL53E1J
 AixA==
X-Gm-Message-State: AOJu0YyFq3w1kklodREGtE+4WUR9IarghCOphlUSnJwQ8q4z05yw3FXx
 ymME0+zUXpkJbnUI2nvUbA+zt5BosguGLpMvwT4=
X-Google-Smtp-Source: AGHT+IFGkuCxgIz9VqgFi/4KgMjdNVG5FdQMgvHRrincAJ+XBJgWEuQYtUaeOq1VFK/LsBHO5E2bbopHU2s/AgCJM74=
X-Received: by 2002:a05:6122:4493:b0:4b7:2940:8fa2 with SMTP id
 cz19-20020a056122449300b004b729408fa2mr2032622vkb.12.1705282113190; Sun, 14
 Jan 2024 17:28:33 -0800 (PST)
MIME-Version: 1.0
References: <20240112140201.127083-1-dbarboza@ventanamicro.com>
In-Reply-To: <20240112140201.127083-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Jan 2024 11:28:06 +1000
Message-ID: <CAKmqyKOoOfiZ2NOs=NsbXCskXT83KaBWH6T2y4yWLmmuEEXkzQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] target/riscv: deprecate riscv_cpu_options[]
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2b.google.com
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

On Sat, Jan 13, 2024 at 12:05=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> This version is a resend of patches 10 to 17 from v4, reviewed-by and
> tested-by tags added, rebased with Alistair's riscv-to-apply.next.
> Patches 01 to 09 of v4 are already queued.
>
> All patches acked.
>
> Changes from v4:
> - patches 1 to 9: already queued
> - patches 10 to 17: reviewed-by and tested-by tags added (tested-by
>   not added in KVM specific patches)
> - v4 link: https://lore.kernel.org/qemu-riscv/20240105230546.265053-1-dba=
rboza@ventanamicro.com/
>
> Daniel Henrique Barboza (8):
>   target/riscv: create finalize_features() for KVM
>   target/riscv: move 'cbom_blocksize' to riscv_cpu_properties[]
>   target/riscv: move 'cbop_blocksize' to riscv_cpu_properties[]
>   target/riscv: move 'cboz_blocksize' to riscv_cpu_properties[]
>   target/riscv: remove riscv_cpu_options[]
>   target/riscv/cpu.c: move 'mvendorid' to riscv_cpu_properties[]
>   target/riscv/cpu.c: move 'mimpid' to riscv_cpu_properties[]
>   target/riscv/cpu.c: move 'marchid' to riscv_cpu_properties[]

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.c           | 377 +++++++++++++++++++++++------------
>  target/riscv/cpu.h           |   2 +-
>  target/riscv/kvm/kvm-cpu.c   | 100 ++++++----
>  target/riscv/kvm/kvm_riscv.h |   1 +
>  target/riscv/tcg/tcg-cpu.c   |   4 -
>  5 files changed, 311 insertions(+), 173 deletions(-)
>
> --
> 2.43.0
>
>

