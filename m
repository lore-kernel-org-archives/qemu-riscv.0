Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C248CEB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 02:24:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qG9Ev-0000AY-0c; Sun, 02 Jul 2023 22:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG9Et-00004z-EM; Sun, 02 Jul 2023 22:24:31 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG9Ep-0007i9-OK; Sun, 02 Jul 2023 22:24:31 -0400
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-76571dae5feso364288485a.1; 
 Sun, 02 Jul 2023 19:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688351066; x=1690943066;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ikv3XpnBt5HqBmgbgjgBYygxJqrH8OVfX0eLI5yw6u8=;
 b=IvnY96XMg/tWAUtKMw0Qyx4vSgFKGbiL8eVCJnGO7Uey0whmSvT6uankQefDmZVZGL
 N4GucDtOXKHnopsPNBiLuQMmJRhua9ER2IebiSfnRJddT3EyKxyc2pmz+72K0xS95v1w
 jY5IMlO6KuOK952vXU4AOend2SvRlcVNM8JmBuEvILjXXEshgogKqoCCXNSGIG4ca5nf
 bDJjLjNM/DU1cVqEjpzmZljg3ZWhZS5nIOTLy76T0u+pOXR64YXJ0bDJvqGZWCJ9ltlo
 k67wS/zny88Y2MXs8fK0wusTsDk5EfZvRxbmLy1QTvLbJ3YXSKzEwNRKocACaSBtaU/L
 FZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688351066; x=1690943066;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ikv3XpnBt5HqBmgbgjgBYygxJqrH8OVfX0eLI5yw6u8=;
 b=RHV41pT/3xiC3Cktivd3Wz9nSDEget2VwuTOCYXZwbtFzHmPUgpwQZEXXVMUKPzCdL
 SV7ljYOAl5HNnvzmTX52qc86g2y2SdpyFXyBKHLtFbH9tzRot7A0cPqtx5dTqt9bqmUp
 kRn80U8NhI2fNC3lRbDfnKfb7AvUbbLUun0jlIT6DpyO96erciQng2APPz0/c0O9v1lM
 ZvzUz7QGLE63fzAhF7qWzGGOWEVonXTQsGrDEK6BNv9VZkXmgGlpNMfGgxZG2hAPnOEv
 Z7Md9OE+VMw59WXV4MNavd46BTB0Snk2rg7uDoNU+62vxzMqpK2bL+tmvFa3z7ACs1g0
 yMqQ==
X-Gm-Message-State: AC+VfDxqjIyo+KpA+weBLC9yKSaWVcPV2H4NHnxT32n0jtmJFMWbHUMc
 B+ADLlvC0dXG42HRJm5FZV1+YKa13uDJGtDZH3U=
X-Google-Smtp-Source: ACHHUZ6B89GJ9sR7C11kd2ynRaaejqb3dPiRnFEmwxxX6tZDfw8qtUAKHfvKboZMxH/6Mwm9QHdoukLNdUPfMbJutj0=
X-Received: by 2002:a05:620a:1915:b0:767:352d:54f4 with SMTP id
 bj21-20020a05620a191500b00767352d54f4mr11091190qkb.30.1688351066171; Sun, 02
 Jul 2023 19:24:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230627143235.29947-1-philmd@linaro.org>
In-Reply-To: <20230627143235.29947-1-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 3 Jul 2023 12:24:00 +1000
Message-ID: <CAKmqyKOXOCwGKgonnkX0zqEbYdGq1G=cHnYw5VuQeK01KixQdw@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=alistair23@gmail.com; helo=mail-qk1-x734.google.com
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
>  meson.build | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> --
> 2.38.1
>
>

