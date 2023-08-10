Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D77C04E69
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 17:15:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qU9FB-0007z3-FC; Thu, 10 Aug 2023 13:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU9F9-0007yM-HQ; Thu, 10 Aug 2023 13:14:39 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU9F8-0007Ym-24; Thu, 10 Aug 2023 13:14:39 -0400
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-4871e5dd7ebso412577e0c.3; 
 Thu, 10 Aug 2023 10:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691687676; x=1692292476;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kw9fagHvT1fxug33yUkEcv/EriSxBgjaCokpA6F0mfs=;
 b=s0r2p/FhLFl/hGlLILoaLyBkxQT4UDwxPnKkEQApEQpQLJSUyKL94SZxay8UIk/a5g
 OclhLRyLkrjgwLsrOTgljsX1+wsi4Ii535bGVwqRWYoFJclQwI88bBGiJ/WqWVkEZT5c
 eUHJBHCkTWv+YpDvtyJdRlkjtaxY+nLHryfWGXEYPEhtLVQzGlFw0XC6jjNCo+CntOgG
 Vanf5OifBAUhQZZeRM6+IS/FyrwVB/R8+htTPh4Z1n7lBsMyP+i/6QrBz9jHpsczmpHk
 /CMlCGpFObRsJe1vuOYgqVtsuhZGHd8NYNrfxUKYdRfb+q/egD9crQRoiwtahNNj4i2M
 i+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691687676; x=1692292476;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kw9fagHvT1fxug33yUkEcv/EriSxBgjaCokpA6F0mfs=;
 b=cdW9xUc91wJa+OunavUsV1GvKd5YGcACgkb1i4B5QdkfQsMEfmveva3bwuX5tfGabG
 XZWlCnftO1E8L80UMQlEdwh+veHIAqH14n9EKSGwDPP2eS1jKWKUEhFO8W8FoBcmne4m
 yccnxcFeaKs4Id8YK4JH6zd2cd+/PQfUuwXCXCWaz9mN8BGKASUnS6ORJWu8SFzY2q9D
 a73cg44w5G7cRvCq1BbIPxc3narW1m7yBstxMmkHn43TpVDUGrPr5PFGwlXnklqeM/l/
 pOWg13alfFY1ukCqppD2vq3G+S6PMQbwMwltlTEc16ttgHhDJ8flFthxXuXvg6JHxiJ6
 7lHw==
X-Gm-Message-State: AOJu0YzYuMEtOq8BZCAJJ8C6LAh3eB5dMs7FVTP6aGbfBOGP/yL4ld3Y
 8S9aMPO+htHMS9qXDLWeAoSMSXNKaAqWLl/yKeA=
X-Google-Smtp-Source: AGHT+IGNLV1Ty/lzievGah3oforZbk07if3pK4NsrupssMcIDXYLVr+uY5JIqiS4SQ3pQnYHuNGzWko1zgNd4sy90sY=
X-Received: by 2002:a1f:5e8f:0:b0:487:36a0:9f82 with SMTP id
 s137-20020a1f5e8f000000b0048736a09f82mr2804014vkb.10.1691687676646; Thu, 10
 Aug 2023 10:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230808181715.436395-1-vineetg@rivosinc.com>
In-Reply-To: <20230808181715.436395-1-vineetg@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Aug 2023 13:14:10 -0400
Message-ID: <CAKmqyKPrrXqQRqqtRDi08hU5uNYB=0PxXBdxRVh81zmnRAauKw@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: zicond: make non-experimental
To: Vineet Gupta <vineetg@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, kito.cheng@gmail.com, 
 Jeff Law <jeffreyalaw@gmail.com>, Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa31.google.com
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

On Tue, Aug 8, 2023 at 2:18=E2=80=AFPM Vineet Gupta <vineetg@rivosinc.com> =
wrote:
>
> zicond is now codegen supported in both llvm and gcc.
>
> This change allows seamless enabling/testing of zicond in downstream
> projects. e.g. currently riscv-gnu-toolchain parses elf attributes
> to create a cmdline for qemu but fails short of enabling it because of
> the "x-" prefix.
>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6b93b04453c8..022bd9d01223 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1816,6 +1816,7 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("zcf", RISCVCPU, cfg.ext_zcf, false),
>      DEFINE_PROP_BOOL("zcmp", RISCVCPU, cfg.ext_zcmp, false),
>      DEFINE_PROP_BOOL("zcmt", RISCVCPU, cfg.ext_zcmt, false),
> +    DEFINE_PROP_BOOL("zicond", RISCVCPU, cfg.ext_zicond, false),
>
>      /* Vendor-specific custom extensions */
>      DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
> @@ -1832,7 +1833,6 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOp=
s, false),
>
>      /* These are experimental so mark with 'x-' */
> -    DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
>
>      /* ePMP 0.9.3 */
>      DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
> --
> 2.34.1
>
>

