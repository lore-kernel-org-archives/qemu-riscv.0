Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DDBC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 03:16:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxIku-0004V9-Nc; Sun, 29 Oct 2023 23:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxIkt-0004Tz-IF; Sun, 29 Oct 2023 23:15:55 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxIkr-0005mz-14; Sun, 29 Oct 2023 23:15:55 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id
 ada2fe7eead31-457e9088d7aso1562905137.1; 
 Sun, 29 Oct 2023 20:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698635751; x=1699240551; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rmYJp9F5tamAALlEoG9pOxZJ21dbz0BKNaEjgebt4EY=;
 b=VgwkpnG24qldVwc6dD45D7yeahYsx+yJx1QQcA/ZpY3BhDF+rj+uUBWWPc5qFlHwpu
 BBS6+tcU1UbfGdr10Wywz9h8iu+dNtIS6WLGo2PYUDI8j3Yp9De7ngSFruhIMDOwMCeG
 XAPD/YwC4O5G9I0cJCfdXO3dsG78LY/U8z84Rg6cMo9debDdZD9vEawRgifWZTlEeqpC
 CfiKeCEj8Wfxw2ASWIl5N/nrnSIjMVEqL8xg10AMP1jMh5lcG9eBbzJav4GzGKe+tRsn
 YzCNsvXJEgWV2LUdqtfYB13oa4s02djBQJK9HvuUpJx8CLfNrrN+fojbuMF0/20n+qsC
 radA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698635751; x=1699240551;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rmYJp9F5tamAALlEoG9pOxZJ21dbz0BKNaEjgebt4EY=;
 b=olnKIh1A0TkdsgXtD8Cj/r/R8qL/znJJdxYOkByl7wVI/1+Gq+vURgzGJrXkWvhuMj
 J8IUVJmTLI8F/3/qUn/qy+pi0xTKl0XxFZRbBcv/apwDK+skZGQsykxTYiPH60j/frWy
 PChQeQX9RSX6cFSAma8sW7LTcuMFlVclxAIOf0Zv60xsWi0GKlfKIsKFUv7KPRzt5uUd
 JcubLhtkZo6a8I4JWW9L+Xpcgw2rhj8uGKBtDdX+1EkbRPPDIIzHhC0oViwACckJaCai
 af/JmdDseHjMcKpBLiJ68kgWMKYUYeG8+3ixB/cypDclkupwraFiRY/BM75vfB2nR36d
 Mvcg==
X-Gm-Message-State: AOJu0YzgnCcXbcrKMZiMZVH60gcUyw44sYV8BxY3WRyg0aKSWxwf3LAH
 dBTrBZNYZVc3NEqBNntytwRpTE9jBUq+etjhBFI=
X-Google-Smtp-Source: AGHT+IF3pGri1z3k60q376dH6ytNHF2sHtgNCM6oP5yA/f34hc/+eYCSxKeT115v7SjoMLWoMMSXNzvnvRBeHahu8ak=
X-Received: by 2002:a67:e09e:0:b0:458:23f2:62e2 with SMTP id
 f30-20020a67e09e000000b0045823f262e2mr6791433vsl.10.1698635750307; Sun, 29
 Oct 2023 20:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20231023153927.435083-1-dbarboza@ventanamicro.com>
In-Reply-To: <20231023153927.435083-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Oct 2023 13:15:23 +1000
Message-ID: <CAKmqyKM8Ed+9UiztaVTFk1Bz-qhFmHyuGSXn8B0D5ygQJDXCHA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] riscv: zicntr/zihpm flags and disable support
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2d.google.com
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

On Tue, Oct 24, 2023 at 1:40=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> In this v3 the patches that added the extensions flags were squashed
> with the patches that handled the disablement of the extensions in TCG,
> as suggested by Alistair in v2.
>
> No other change made. Patches based on Alistair's riscv-to-apply.next.
>
> Patches missing acks: patch 3
>
> Changes from v2:
> - patch 2: squashed with patch 1
> - patch 5: squashed with patch 4
> - v2 link: https://lore.kernel.org/qemu-riscv/20231017221226.136764-1-dba=
rboza@ventanamicro.com/
>
> Daniel Henrique Barboza (4):
>   target/riscv: add zicntr extension flag for TCG
>   target/riscv/kvm: add zicntr reg
>   target/riscv: add zihpm extension flag for TCG
>   target/riscv/kvm: add zihpm reg

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.c         | 15 +++++++++++++++
>  target/riscv/cpu_cfg.h     |  2 ++
>  target/riscv/csr.c         |  4 ++++
>  target/riscv/kvm/kvm-cpu.c |  2 ++
>  target/riscv/tcg/tcg-cpu.c | 21 +++++++++++++++++++++
>  5 files changed, 44 insertions(+)
>
> --
> 2.41.0
>
>

