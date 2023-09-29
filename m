Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39942E743ED
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 05:31:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qm654-0000k7-Rv; Fri, 29 Sep 2023 01:30:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qm64v-0000Y3-OS; Fri, 29 Sep 2023 01:30:19 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qm64s-0000mM-Kc; Fri, 29 Sep 2023 01:30:17 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-452951b27d0so6549283137.2; 
 Thu, 28 Sep 2023 22:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695965411; x=1696570211; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ixnLf9GKIsDx655mTkhftQ5THBH57Uc7hp9cYg2NfJk=;
 b=I+0O2nws+7TOBylwvvCv5T56Zefv46fA7+JUDDJGJdVRH2aE+Cfp+76V6LQTsoW9bx
 gqAUTr/lM2DFSDyjpUvlxepS8vuIuBCLDfGZkGaJQy24/lXjLqvrU3va9JPgIkvvhGtP
 V68xp+pBPBboiAbqYikfDZwy36wkL+GP7z7CiigDLdu3Xta/4MXgplmTFTCOI4hcten4
 wOQervbrvrfZWW+dMM6DHR24PQAQh7JbPcafALcJeQdNSwmVH4tQgrB864Bs4DRBXDY/
 bQtiX5iVvaIwLjbvqMx7KHUFYAsYqh8eke20wKfRNfSlsx3usQHSR08iRrrmrj/gqO9A
 ZV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695965411; x=1696570211;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ixnLf9GKIsDx655mTkhftQ5THBH57Uc7hp9cYg2NfJk=;
 b=UAJvjVccmNAx6SS6r1x/iwq9uCEc4Nk7xvJFMq0MPaMVeMe32exlQufM4pkBX2NInw
 UbsXD8iun5oSO+1w8RrE0EwM6slG66gGF3KvwQrqdW2aW0/gefo6Bj8HOlrVH5VzQYma
 tWcmzbtsnYmU40lIXdo9Wam9bQK0Xvgv7SF7GAXpWdM8IuPNFdO8Efaeii7rRkzbd9EU
 xtcfIVrmA5My+3fkK8Gz92vm3/auelmC+dcXzzHKhywXUT1rY4rXyVpgFgD+Xpfi+atU
 FItN/DYDE9yaxqDKe4Iit/t9L3c/+VkFG6xJYrEB5EexIJ1qjQKKFb1SspL+85yoSBna
 jIgg==
X-Gm-Message-State: AOJu0YyACIRUjv2JjPWzQ7zv5p4XeEocH2pwkeU9xlati9UCRoUGgR2w
 il1EnAYscO5fQOhrrri7aQr9yGC7HTRC/7C54y8=
X-Google-Smtp-Source: AGHT+IErUCkm7C12ocQgc+RXc+Wu6W6mcC/fJ7/ZOLglq0w87pjyqX+7YdC3eb/nUpJCf4OzKliwh2QGteoA1zrybaE=
X-Received: by 2002:a67:f746:0:b0:452:5837:7ed9 with SMTP id
 w6-20020a67f746000000b0045258377ed9mr3126696vso.16.1695965410620; Thu, 28 Sep
 2023 22:30:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230926183109.165878-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230926183109.165878-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 29 Sep 2023 15:29:43 +1000
Message-ID: <CAKmqyKOQTLh=ZwEuv5d-3a1Vt=rFjG2eXMTOMXBOSPsMC68yTg@mail.gmail.com>
Subject: Re: [PATCH 0/2] riscv: add extension properties for all cpus
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2b.google.com
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

On Wed, Sep 27, 2023 at 4:32=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> At this moment we do not expose extension properties for vendor CPUs
> because that would allow users to enable extensions in them. But that
> comes at a cost: if we were to add an API that shows all CPU properties,
> e.g. qmp-query-cpu-model-expansion, we won't be able to show the
> extension state of vendor CPUs.
>
> We're in a good spot to revisit this decision. We have the required
> abstractions in place to be able to expose user properties for vendor
> CPUs and, at the same time, forbid users to enable extensions for those
> CPUs. As a bonus, we'll allow users to be able to disable extensions for
> vendor CPUs, which can be useful for testing/debugging.
>
> Patches based on Alistair's riscv-to-apply.next.
>
> Daniel Henrique Barboza (2):
>   target/riscv: add riscv_cpu_get_name()
>   target/riscv/tcg-cpu.c: add extension properties for all cpus

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.c         | 11 ++++++
>  target/riscv/cpu.h         |  1 +
>  target/riscv/tcg/tcg-cpu.c | 68 +++++++++++++++++++++++++++++---------
>  3 files changed, 65 insertions(+), 15 deletions(-)
>
> --
> 2.41.0
>
>

