Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715F5C5B572
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 09:51:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuoZW-0006OD-F4; Fri, 14 Aug 2026 05:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wuoZE-0006Mr-Vs
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 05:51:13 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wuoZB-0007CZ-NY
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 05:51:11 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-81ea0b7d137so6993757b3.2
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 02:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786701068; cv=none;
 d=google.com; s=arc-20260327;
 b=PAf67wZQeRlr3c1ZlJGa0PGzBXr3N9QzF9q9eOIEtKXOjPbKLaUjEn4+UM4UJRQDcy
 eVNm/wvzG1kWasXpG/tI/P0b5e1aIj+qbRrAhTbewtJeh1kfiMUM7VLGC6QwWv8T8QvR
 1UnAoDCNdKB42hWDJ9U4Ssmh8Y+wjcnI94LPbnCzrWsVKSuZ3WxBPJon3dUNGhhkQjlp
 VzGeDm5Rq2IZmT04SwV4IdziIrrfNghO+daXHdDm7oMRyhrUY/U68miQyJGcq6T3/IpP
 w2aLAQqy81L+bzD0uLheteS00jKYEV0zLMK9VUXtyly4NixHwAVOrcNGrNPFr+LRwfzW
 SbYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=K53K0n+MC9oHyiqtFswg6lvCOVt83JZMnk4OL2Jt2dE=;
 fh=g3qHXmDK4cdrsd46RewCTSvxFxlgJ2OgFt+Tpn8b1MQ=;
 b=JuoDgDtMLIJG3wgHNw4Lr4y5iYOK2n+EWniFcqxQa0u5BrN5ZnERZZJMvCRHxEa7kZ
 pno1q5g8gTtVTB8igIfckGrlsGtobTF9FHSOHVOcH9IdEUHo24jqyv5SKk0QBRBfkY+B
 1Ytxo6g0DgMHUAFRueKWm4n5P/16mWVfHpxlXtvlUDK2cwx5hevAxd+ZhWdbzsmBbOfh
 Yv2LMKCo+IcRwDhfkTYyyhiCQE8MMvUiL6x7qWD9ekkV+GSF/BWifUhw5qKUYZy9+REZ
 aTiDyilutzZtrlPSRo6XU6SetoYNm4sp8qx63LN0DuXtt+To2KYX3DImJNQ2SMLUGgMh
 c8Zw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786701068; x=1787305868; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=K53K0n+MC9oHyiqtFswg6lvCOVt83JZMnk4OL2Jt2dE=;
 b=fdNImuPT3NL5DMGMg/WxivJ9uzNUMl1QL8ZvWfgf2kYidcQZfqNjXEoizsAq23/LNa
 EGlNIG1MX5NuMxzuX3W25xZSLZlON1Th6OtnMwEd/faGt+eLTv9YXfRiHpSyZLdPfqCk
 wYbZ+f2w03VGAF8OqdJ5hnicMVs5LkUuM/y6z3vWnzaSF/iN7gMLn269QPHT01drQo5P
 mNBG8xzko3vOJhyhdf6BOkQ1qo5KaGaO0PtgC7xoTL1v7yyFa9b7iIDDeA2GeLn3VfES
 KgDEdF7tjlPxlfx8AJVReHIQ1RXKD5egF6jG/RBEsvAqVLR0gw1n0V0+R8ctUmS5GktK
 ZUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786701068; x=1787305868;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=K53K0n+MC9oHyiqtFswg6lvCOVt83JZMnk4OL2Jt2dE=;
 b=sUXZsXPbeiJHgXiAy6b7I/K6l2s/7xN7x3iGCUBRNv+CArIYvg+tZjpgop/OcBoOWt
 33Qo5+GJeoqjjhf5j3ydW/sNzFbVRZiH1ub3tM/BfaVbvICgingBhh4sbFp3d84NgBIr
 9aGGNKR+t0+bODrcLpbwk2UNRu4t7UZtR7GjP32JMtd3sCBBH+wXTNHEsmAuaN6X/Rjf
 oQhryX7Aun8fGb84rnHQaryjcQZtugh4sFKQOYsDUhnWBAKiBbC5yAd6BGKSM+d7X2Zo
 rNKrWblh+iYrmp6buQ+uTy0NfHHoHacTxuYGYrEUZMvfCYlYcqqcurGsflSv9Gbi45KR
 1npA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpMa2PHTe8HDKRIgGlAQThMQjYNz1AAKfbTFIyinfF/PvXfVbkeAOhqYhkF4UjUgFbFWXC5oq/Vebee@nongnu.org
X-Gm-Message-State: AOJu0YyJL9BJGtjZJT+8XXuGEn0nIZy/SkXNfe115h4ekI3AQURUvsQm
 mi50UVAxroJH3IC2UfdnGVMP3ZQj6iUzKlwRtgMJvjPeNZGHkZaOyMGQY7xaFGEn0trlWBho5jJ
 8CHu30U6EALJPuYxx5VQPluWVhEx7IhY=
X-Gm-Gg: AR+sD125sZDD+ewm8TKPMPkddFr02Qdrx1TlzoyNdaxOW2gqc2baZalUKmK69l/Sl1m
 InXWPhDbbghun66jCC4Jmqpvh51zDfIIje7uKYF7GJV3oW4Tu560tbD5MAuPrnv5mmzrOGGX7Fk
 zZtT1WWPloiNGCqWyXSLdgg33sN/v3NZR4Y5h9K1shOCbG/+Tr7nV/IIMbP4B3/z0Hl5XdsFHJm
 zEvFJK9fZmeQlzc2SWquOocmFLRwf74rkh8k2aTBbQyMTEY+htvhELwZesdu/ARYIJM4he8MqkC
 qqAOUYwvSeWujr9X4lGEYD7LL1/L1crCJ2V19W/sKJ43
X-Received: by 2002:a05:690c:28f:b0:81f:2825:de9 with SMTP id
 00721157ae682-83710a8ddd4mr20029827b3.20.1786701067959; Fri, 14 Aug 2026
 02:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_EF996EEB2215272639C89FAE1491CEF43908@qq.com>
 <be7afd5c-55dd-4af1-b828-9a2f401e3bfc@smtp-relay.sendinblue.com>
 <CAEUhbmWjR3cc4jkdBAqpXcmt9z3ExHWsPzCthX7d+G1wgqTbTQ@mail.gmail.com>
 <178669925995.92831.6332189576763663701.b4-reply@b4>
In-Reply-To: <178669925995.92831.6332189576763663701.b4-reply@b4>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 14 Aug 2026 17:50:55 +0800
X-Gm-Features: AUfX_mxI1lO2VyuGGM5L5pmJcNt9ZB4OoY9bwiWrJrPDyeWkfb3DMOKMqlYweOo
Message-ID: <CAEUhbmXMKug9v2x9PaJTXiwnF+o0HqQsiY+PtCL6eYtGZ8_ViA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] hw/gpio: add K230 GPIO controller model
To: Junze Cao <caojunze424@gmail.com>
Cc: guochun wang <guochun.wang@foxmail.com>, qemu-devel@nongnu.org, 
 chao.liu@processmission.com, pbonzini@redhat.com, farosas@suse.de, 
 lvivier@redhat.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
 liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com, 
 zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi Junze,

On Fri, Aug 14, 2026 at 5:21=E2=80=AFPM Junze Cao <caojunze424@gmail.com> w=
rote:
>
> On 2026-08-14 15:26:41+08:00, Bin Meng wrote:
> > On Mon, Aug 10, 2026 at 4:02=E2=80=AFAM guochun wang <guochun.wang@foxm=
ail.com> wrote:
> >
> > > Implement a K230 SoC APB GPIO controller model for QEMU, derived from
> > > the Synopsys DesignWare APB GPIO (the Linux gpio-k230 driver is based
> > > on gpio-dwapb.c and shares the same register layout), with a
> > > Canaan-specific compatible ("canaan,k230-apb-gpio") and hardlock
> > > integration. The model is capable of running the Linux gpio-k230 driv=
er
> > > and driving external input/output lines. Behaviour follows the K230
> > > Technical Reference Manual v0.3.1.
> >
> > Please split the k230_gpio model into 2 separate models:
> >
> > - One is generic Synopsys DesignWare GPIO IP model
> > - Optional Canann K230 specific wrapper glue model to the dw-gpio IP
> > (if the generic Synopsys DesignWare GPIO IP model, or plus some unimp
> > region, is good enough to make the software happy, no need to create
> > this one)
>
> Hi Bin Meng,
>
> Thanks for the detailed review.
> Regarding the suggestion to abstract this into a generic Synopsys DesignW=
are APB GPIO model, I have a question: do you know of any other QEMU SoCs t=
hat use this IP and would benefit from a shared model?
> If there is no immediate second user, I wonder whether it might be premat=
ure to generalize now, especially while we still need to complete the K230-=
specific behavior.
>

There is no other immediate second user as far as I know. But Synopsys
DesignWare IP is not like others, and it's commonly seen on many SoCs.

For RISC-V, I can see Eswin EIC7700, Sophgo CV1800B (Milk-V Duo),
Sophgo SG2042 / SG2044 and T-Head TH1520 (Lichee Pi 4A) all use the
same Synopsys GPIO IP, and they are all good candidate of QEMU models
in the future.

What K230-specific behavior are you concerned about?

Regards,
Bin

