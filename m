Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2ECEB64D9
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 13:24:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qE8gJ-0002Oa-3K; Tue, 27 Jun 2023 09:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1qE8gD-0002LP-9b
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 09:24:26 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1qE8gA-0003ie-2x
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 09:24:25 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-51bece5d935so5917542a12.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 06:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1687872259; x=1690464259;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VlLHpt8mqhf5MppTqMtZyXybKQoLwbHkqPVsSZB+qso=;
 b=JQaYT36FZJ69uwYOB+2N0+KnUeJHJyl4JBv1aL9Hyb6BRkq+mR1Vi6AnTYPc627KAH
 uerFlYzZImz8xoZGgcAP7jOTsBTY/jObvUgWTL70tjlKmi327estVR2Gnji3iNDyPSJ1
 i4B6uWmp/LrZNzLDdGozYDXrSa9sSdBKKoEq/x8GrRT/iCuAgb5F6xlr29fYxTM2iU+a
 eqpeSA19hDD6x6mbp4dLymIzpOYSo1HN+/B4e1mMrIFqqHPevT4aipDoDRpn8hNVR7tu
 0SLniWTUOLMYkzHEEWMQF8exRkeLPOMujwI+4191i6c4ocrYOZK0LXp8kd9EMZGD9jbI
 yyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687872259; x=1690464259;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VlLHpt8mqhf5MppTqMtZyXybKQoLwbHkqPVsSZB+qso=;
 b=XuiSdipEhKLdj0RDyJkr8cXbGIXD0SY8EzMvxdagBvhemA45Gdor2O1ItiDPv2Dvku
 jlSzLqFjNegm2eyMnvbLWywapqx4KgU1TrwNhG0NPyM6E6wnylnUcFqPXs/WhxEYUE+M
 m+T+B5vr0iYQesC/WVp4As2CFz5FJDEYmSxul15qays6a58ZSBFiU3g6Y5OOAJMZAsq0
 AaShhLfhqhbMZ+LJe7Zdh+HLnnJN77Jcy0GLgyY76WoEDun+CUOSEZh7ZXpqzSDtbC/3
 uldiJ8Kd6R2kpGIl5x7Nqk5fUVInQKdEsm2u4b4fcQd99XarNDlq8U6Ry9KxmwZcb+uw
 FRLw==
X-Gm-Message-State: AC+VfDwGNmD+Q+niatXhEvnVHAAIG84Tkt3FM5Njq3QTp+yqvr95vcfn
 6b0GBlWbnMjYChdKSPIqWq2yhbK2MIMf3sk3LompsA==
X-Google-Smtp-Source: ACHHUZ506UFY7rmJn414b+dkZM1Qm2XfZHZHBvhz6baV3o2/bjfBIjFpFxy0O8EM/P80hqMBuT2hu/bUAmpz/8AtN4w=
X-Received: by 2002:a05:6402:1859:b0:51d:8835:90a1 with SMTP id
 v25-20020a056402185900b0051d883590a1mr7444094edy.30.1687872259390; Tue, 27
 Jun 2023 06:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <deda3e29-654a-5a60-98bf-b97b0ada570e@linaro.org>
In-Reply-To: <deda3e29-654a-5a60-98bf-b97b0ada570e@linaro.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 27 Jun 2023 18:54:07 +0530
Message-ID: <CAAhSdy2JeRHeeoEc1XKQhPO3aDz4YKeyQsPT4S8yKJcYTA+AiQ@mail.gmail.com>
Subject: Re: Is it possible to boot a riscv32 guest on riscv64 host using KVM?
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Yifei Jiang <jiangyifei@huawei.com>, Mingwang Li <limingwang@huawei.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 qemu-riscv <qemu-riscv@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::529;
 envelope-from=anup@brainfault.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, Jun 26, 2023 at 4:57=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Hi,
>
> I'm working on a tree-wide accelerator refactor and want
> to run various configs to be sure I didn't broke anything.
>
> QEMU theoretically supports running a riscv32 guest using
> KVM on a riscv64 host, however the documentation I'm finding
> only refers to riscv64 guests:
> https://github.com/kvm-riscv/howto/wiki
>
> So I wonder, is this a valid / supported config? If so,
> do you mind helping me with pointing me to a guest image
> and its command line?

Currently, we only support running rv64 guest on rv64 host
and rv32 guest on rv32 host.

In the future, we might support running rv32 guest on rv64 host
but as of now we don't see a strong push for it.

Regards,
Anup

>
> Thanks,
>
> Phil.

