Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81534C4706F
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 03:55:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLEp4-0007J9-Lw; Wed, 03 Jan 2024 22:55:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLEp0-0007IG-NF; Wed, 03 Jan 2024 22:55:06 -0500
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLEop-0008OY-4l; Wed, 03 Jan 2024 22:54:56 -0500
Received: by mail-ua1-x92a.google.com with SMTP id
 a1e0cc1a2514c-7cc10f59524so44034241.1; 
 Wed, 03 Jan 2024 19:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704340493; x=1704945293; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P/mIZipsaJxUK1JwYV0hhhOLfAxDGY7YJW4ADcqZ4KQ=;
 b=RjL2mpL0ubsX4x5YSLIJI064xzTFKxCkFejA/Q685h27crKqOVHtW9BKFc2qTKnAAb
 EUocoFMoUTITRXd31NQBq0QYM9JVLjvm5ldLd05xEOWMOMT8+oNh6A+761niQOdO6mZb
 UT1ZdaYDjoj/exDrsTcZKPX8u0dE2IbjTbJvAXFfus6sR608aJOfLVAa7HT2p6F68Y4Q
 zopVRALtdEtZsn+cJ+MXpNNrqCSf0eCucbcOV+Yqa2ZxNS5U2MtcKvJngiwEL/bLz+8D
 LQzMetdjyukdJCfmgTInw1F11amU/HFekUmlZHZ8Yi9zIlESBlgmLXWd2onNIaOx9XWD
 glzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704340493; x=1704945293;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P/mIZipsaJxUK1JwYV0hhhOLfAxDGY7YJW4ADcqZ4KQ=;
 b=ueih0/utT6a6apaLsp3uY4CBKnl6wmL8WgrvbShuhX8BtxrWjebbAU664PUgR0mstc
 85uJGPrC5n1ZkX6PjFkbPqltetxgBkC9SoD5I9W96SLv1dxUtaR1bX3QXBfdLjHD9Xbx
 ohR6RF1oduPGblI9t/B2eZlpTRyPdXDd9vYxlfxgPkO9hSQXbXGgFQMkfxxdL7hO6Rp8
 ZHAc3maFBTrcfptCYq/tx85MtnOE+KPG1f+akGes3WCq4U4P7H4/Xvf2agvfNy+Yq4hu
 O99W03yc6w4SXL3KcAuUpk4er0LJutfra9418eZg67/6HI0JioTqMG7wca5+g78RevYg
 tWSQ==
X-Gm-Message-State: AOJu0YxhSkzTm/p28ZJzds7gQBYDDhLLCMwNFdzyhGTnKJUTHPoT2t2M
 fy1yPxu7WM11moBs5KPAJ5lROrFe4+4JJidp9a6SxlsgdEQ=
X-Google-Smtp-Source: AGHT+IFfrkEpQQBBxbSnZmNSmNF+SZOqxMLdW/ZbP1VtLf/FrmhWBAOFl4XaoMHVInpot4RNnGumLXSRXmFM8BjWFAg=
X-Received: by 2002:a05:6102:3ecb:b0:467:a0c0:f467 with SMTP id
 n11-20020a0561023ecb00b00467a0c0f467mr1289vsv.27.1704340493534; Wed, 03 Jan
 2024 19:54:53 -0800 (PST)
MIME-Version: 1.0
References: <20231221113628.41038-1-vadim.shakirov@syntacore.com>
In-Reply-To: <20231221113628.41038-1-vadim.shakirov@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Jan 2024 13:54:27 +1000
Message-ID: <CAKmqyKPqfsVFD2N3YDOW=WYLHRwiOYmZp8op18ds6Hw4AHXY=A@mail.gmail.com>
Subject: Re: [PATCH 0/2] Added the ability to delegate LCOFI to VS
To: Vadim Shakirov <vadim.shakirov@syntacore.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92a.google.com
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

On Fri, Dec 22, 2023 at 1:08=E2=80=AFAM Vadim Shakirov
<vadim.shakirov@syntacore.com> wrote:
>
> This series of patches adds LCOFI delegation from HS-mode to VS-mode.
>
> This possibility must be implemented, as in the AIA spec in section 6.3.2
> it is indicated in table 6.1 that in the case when the hideleg bit is set=
,
> the corresponding vsip bit is an alias to the corresponding sip bit, also
> for enable registers.
>
> Vadim Shakirov (2):
>   target/riscv/csr: Rename groups of interrupts
>   target/riscv/csr: Added the ability to delegate LCOFI to VS

Thanks for the patch.

Do you mind rebasing this on
https://github.com/alistair23/qemu/tree/riscv-to-apply.next and
sending a new version?

Alistair

>
>  target/riscv/csr.c | 50 ++++++++++++++++++++++++++++++----------------
>  1 file changed, 33 insertions(+), 17 deletions(-)
>
> --
> 2.34.1
>
>

