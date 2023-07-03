Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4681DEB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 02:27:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qG9H8-0001vf-IY; Sun, 02 Jul 2023 22:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG9H6-0001uc-G2; Sun, 02 Jul 2023 22:26:48 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG9H4-0008NA-Tq; Sun, 02 Jul 2023 22:26:48 -0400
Received: by mail-ua1-x931.google.com with SMTP id
 a1e0cc1a2514c-7948c329363so860786241.0; 
 Sun, 02 Jul 2023 19:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688351205; x=1690943205;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ih3D8ylV73mD3mLgpC/h6oSCA+GnagLD+Wx7Q6VTgcw=;
 b=b0FdpVYXZFR7unvpKE1EnCi0FSVJTkpBnel2Okk2DFrQX+a/IxN2WQFj9cihXzp6sA
 gLS3ZmyIv7Y3fTyipI5m+9D7DC0JaxqO6Rj8Gu3HCscI5uNUHKqtlh9MdYElEoEIKhr/
 Eq4+b8dOxJKUEwqqQjf8pfCYhsyu55m7Kkvd8IaA1chRrrAK/YXNS1inXKJU4DMAfqvl
 1AYTYkFZIz8CLaYTRbpT/G2uD7VVCoKZ8y2KFBGBFMVTntVjWQVX31KagC5aoskEvKRt
 YP4Hc9/BvGt1BXk/o7K/Qp0K0ddIJjLfAUHh4kPEaW3CTtGM5kC4VEbjYXpJdfZaB5ST
 sExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688351205; x=1690943205;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ih3D8ylV73mD3mLgpC/h6oSCA+GnagLD+Wx7Q6VTgcw=;
 b=ljaYCuMnBNAxLtnWRhB/OGwA3+XEPMUjzzonePa4CXD8eoseaeGxpybJwBeTKtyrNs
 Q9e1u6l2Cq9ugauJzHKGCoot/chJf9++o+1YGW7j5zt2EKrxCMO3LtyTefuWdfZYl/4P
 dpke9J9OCqHrQTnpTuGwdabZyz3fs1Z5nwQ/4+g1+hx9e617aJLf0sRPhyHt5aBS8yS1
 rSZxxoyuP4OTi75AKyjXANjGHBPesxgkk+63LAL4MpiIsX8DmYr0h5tzq/w2JB3qLeNW
 0mDaidVM+Hza2rIxPE1RjcbZYF/sKrbGu0JjeuRtHEgkN3/kdqhM9mT4TRxQWrkfZjTJ
 haDQ==
X-Gm-Message-State: ABy/qLY/zmu1JV23Lzi3UYoW73W1J4iEiJl6db/v5OmaI7z5mybiWxjH
 xf+bFnYm1ucYf9duaMu3noZSi3/+fBmwkTvvGfs=
X-Google-Smtp-Source: APBJJlGBt2dFae+noQYMQubMzCnf26SssoLj7VGUvjdDY8Zyd0hKtvNQFdS15q1mhMsFm4rBtUtHeP6WA7lhdPfQtsQ=
X-Received: by 2002:a05:6102:1082:b0:443:5505:f983 with SMTP id
 s2-20020a056102108200b004435505f983mr4413581vsr.21.1688351205339; Sun, 02 Jul
 2023 19:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230627143235.29947-1-philmd@linaro.org>
In-Reply-To: <20230627143235.29947-1-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 3 Jul 2023 12:26:19 +1000
Message-ID: <CAKmqyKMf9G0cdfphnN2dzUz6taUCRiWwbDSRTrB2ZLO_oix3_w@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/riscv: Only build qemu-system-riscv$$ on rv$$
 host
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x931.google.com
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

On Wed, Jun 28, 2023 at 12:33=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Per Anup Patel in [*]:
>
>  > Currently, we only support running rv64 guest on rv64 host
>  > and rv32 guest on rv32 host.
>  >
>  > In the future, we might support running rv32 guest on rv64
>  > host but as of now we don't see a strong push for it.
>
> Therefore, when only using the KVM accelerator it is pointless
> to build qemu-system-riscv32 on a rv64 host (or qemu-system-riscv64
> on a rv32 host). Restrict meson to only build the correct binary,
> avoiding to waste ressources building unusable code.
>
> [*] https://lore.kernel.org/qemu-devel/CAAhSdy2JeRHeeoEc1XKQhPO3aDz4YKeyQ=
sPT4S8yKJcYTA+AiQ@mail.gmail.com/
>
> Based-on: <20230626232007.8933-1-philmd@linaro.org>
> "target/riscv: Allow building without TCG (KVM-only so far)"
> https://lore.kernel.org/qemu-devel/20230626232007.8933-1-philmd@linaro.or=
g/
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   target/riscv: Only unify 'riscv32/64' -> 'riscv' for host cpu in meson
>   target/riscv: Only build KVM guest with same wordsize as host

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  meson.build | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> --
> 2.38.1
>
>

