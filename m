Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEC1C47DA2
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 23:30:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rO4V1-0006iY-N7; Thu, 11 Jan 2024 18:30:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO4Ux-0006df-Be; Thu, 11 Jan 2024 18:30:07 -0500
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO4Uu-0000MC-17; Thu, 11 Jan 2024 18:30:06 -0500
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-4b78b813dd0so1299654e0c.3; 
 Thu, 11 Jan 2024 15:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705015802; x=1705620602; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yuWQksC0NBplZyXdtbj52ZnQN4WzG9OzDN/8EsrbNCw=;
 b=VgVDbLFWOaVoDWjXT/NMuEtQ0cgP9Ny7ebqV2a1rfHz9dP9y6dVUia2OsqsxZLKk5q
 jT9C4yAvgm6PeiSezec831gUh3hTBXQWawyHaBySqRoUCD4WlrngjQicsJ427pnkOrGb
 Wrm+OPk8GC4FcCFpolbQ3f2N0c7YoHqzK4RkfCzEL3G5iO9x2k/gxCJxmhekjXbOmXEa
 H6MScpzW0H8SvspV389U9cF2KxUsWwVtjKix1VAdobTOpSowpkisJcEXRF0z2dMGaI5v
 WQptBnCLHd/b2Zxxw2hVAMAwOPTIz2vPArTLUmrInoQcEXDhjvy99AdTx5Q7kkfIOE2H
 Z1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705015802; x=1705620602;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yuWQksC0NBplZyXdtbj52ZnQN4WzG9OzDN/8EsrbNCw=;
 b=Dfs92/5FUaIaK7V1KSZVZVrbYy4sO9pnnChon7BSvi2Vc0sA93U89ao6qFf/XHFa0q
 nCbAWnSTWT797NeXOCm9APCeEp4p5BXS6iVSM+6LGQGK7Dadm3MPZw2BICRyXk/TQAiX
 N+np/Yw6wcKJvED32hCm4NkyWha5p607vS/qXmQXVE3D/Zb8J5osJgtuC89OMYU5/rOw
 PbrxhX8bI95d/j2g8YQ3xOONdoGdSaQHkhtUVfLYC8VdmBixeF7bkxWqh5pvppFjm1b1
 u2ihYXYR9+gzrgSYy7pQDscIE8VjIh4cRGYIbntxW1uCj4fZZ/pyWdF4z4i3AjOTuGTH
 HlZw==
X-Gm-Message-State: AOJu0YxObRdWSqIArkeOjKa2gMRqlH5zZPtP6aOz/WkZg0tSr4/ohMc1
 4O9RfGfii+LKhc5q/uezT7P/uDznUkCFHzLxsQE=
X-Google-Smtp-Source: AGHT+IHBIaJoDr5HUUryIltRLrz6y35765sj67UkDGINGlwdFvVBN36DreNbFxmlGOocAe5GdYaz3KBKrjrI1bOBLS4=
X-Received: by 2002:a05:6122:2917:b0:4b7:8d7c:347d with SMTP id
 fm23-20020a056122291700b004b78d7c347dmr609723vkb.10.1705015801827; Thu, 11
 Jan 2024 15:30:01 -0800 (PST)
MIME-Version: 1.0
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-24-alex.bennee@linaro.org>
 <87sf37hlwo.fsf@draig.linaro.org>
In-Reply-To: <87sf37hlwo.fsf@draig.linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Jan 2024 09:29:35 +1000
Message-ID: <CAKmqyKPCy9W-iYscHLjVvU=RfoSLURFgdki0qdzgNSkLKqutyg@mail.gmail.com>
Subject: Re: [PATCH v2 23/43] target/riscv: Remove misa_mxl validation
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2f.google.com
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

On Tue, Jan 9, 2024 at 1:43=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linaro=
.org> wrote:
>
> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
> > From: Akihiko Odaki <akihiko.odaki@daynix.com>
> >
> > It is initialized with a simple assignment and there is little room for
> > error. In fact, the validation is even more complex.
> >
> > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> > Acked-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> > Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > Message-Id: <20231213-riscv-v7-2-a760156a337f@daynix.com>
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ping: along with this are the RiscV maintainers happy for me to take:
>
>   [PATCH v2 23/43] target/riscv: Remove misa_mxl validation
>   [PATCH v2 24/43] target/riscv: Move misa_mxl_max to class
>   [PATCH v2 25/43] target/riscv: Validate misa_mxl_max only once
>
> through my next pull request?

Yep! Go for it

Alistair

>
> <snip>
>
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro
>

