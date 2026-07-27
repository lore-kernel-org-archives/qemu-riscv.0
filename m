Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FE4C531FC
	for <qemu-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 04:45:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1woDDY-00069x-Hg; Mon, 27 Jul 2026 00:45:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1woDDW-00067U-LB
 for qemu-riscv@nongnu.org; Mon, 27 Jul 2026 00:45:30 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1woDDU-0006Jn-Dc
 for qemu-riscv@nongnu.org; Mon, 27 Jul 2026 00:45:30 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-81e9f7491ffso27350937b3.0
 for <qemu-riscv@nongnu.org>; Sun, 26 Jul 2026 21:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785127527; cv=none;
 d=google.com; s=arc-20260327;
 b=dcib9H3CJxeIA7yTnOU/XVKLRYycKfDjI6CZDmokZkoX/njF2yO0WRNaPnhkLe1ieP
 5sfz6BWa8DngrpFNgG7++6dHrTKz8tG3zRQphHIuyNR5iAQKhjQ5AneACJjT//v9ZY+K
 x/EcUIK4lRVQLABEBMGcXuvetrL/ZgGvUYpYhyNLU5H8tYJ72fmpfhKsL0aEcUCLfZDJ
 6vYsKAQBf8pg8Uuvs1GycbUPafrhMdkyRcNoVkWHpVckY7B+riNeVdrm06qsqwc6+0nn
 QGe6zY9+8et3qVyJ5/aw6jclPbNMG/h100ASz+PaMU/X6TgxK9C3+8+sHywsMUGfnSRv
 Xb9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=0OUhsbKQ0/u8SCUlAqfilJ4I7sL1QRkwHHunxt6ShDM=;
 fh=dbLBXKB9Yp3YkotSOILT9/huNWMPgGO6uMbjUDyBM9Y=;
 b=IdybefDspFcARW473nSC0TBjj6FugoCI/x3VN0rnL/8c3NIXZZsn/oF+9qjdri7n41
 4jBK8b5H2AF3bUIKY4QnmKjcqT6fa5mPJSDmmBFMu9/qa3CU6NjbovXDbs1dqFyf6Bpd
 9nscxNkFYB14QqLIqW9OT6w47z5TQr5Nvrd6t+MsyCqm8twTmjWcpfvGtUvozO2DJayO
 hqpaNWMp3bMGWzvY+8kOChIFHY4+2+UWs6iW7jHCTw/h/GQm53Mb5PHX6qpZcVioXyNc
 tl6xyV/wLEMYjiTFfRblQGZ9joT9NU2t8FyO7hA5XUi6z50hfqO8uJnZWh43O6Hu895g
 wGYw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785127527; x=1785732327; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=0OUhsbKQ0/u8SCUlAqfilJ4I7sL1QRkwHHunxt6ShDM=;
 b=R+Slgg3cA4pALMIf+z7gHzI0baGe9W7pqRAFeyQp3GAUtfzMKmDug3b8vlkFShrhwo
 Zh52F+lTEI4PRyggXcg2TK85k2/q2qXmWcejxN4B0Wop6332NYJwuntZaZkM6ryooCfd
 I3BkNu1ZMC1sH0qjgYFUI9MU7fGB2idaI8wXDoYaMbZJ4JTZDCbvIhKzWN4yEzNtfk+r
 ZJvz3uqfrKevlBuT5VtIjozbP5tN1pVsiniJtMaIVuBmP/ja3bq4MPxb5ZQV8HGIMGuK
 jP4V+2g+eEaVhNlLYiVW+ikQesP2M73BPfFVR1fjH2342pVnvJcx9nsitCj09DbS2Vh8
 PaHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785127527; x=1785732327;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0OUhsbKQ0/u8SCUlAqfilJ4I7sL1QRkwHHunxt6ShDM=;
 b=aRrU9ODigpU6aXfMnyzJgx2bzBfsQ+7+zJcB8ZNNnF4DVJy9Lh9cdy+gRPvd/udXQH
 cBkHk0ScZxSf8qswhn7MtTdABJ1IVsLFL8FbGX7tyM0bQmGWR2TapOeQiCv9cfZvA2aC
 flHWBohKH87NPYa77MJwJ5KZUUW978aoVzWLKal0NKR1EmS6mY0JSh0nA/KLR8G2T0CJ
 swW1aoXlQuo5Wcfo7LN5dsAyJSozM4YpfRSWhdO/7Q/yTRfBiJjaud4qUXTKe1xIjhOA
 DmddEnNrwldibr1KMFtLndgV09DpThTOoraOxzFBzf/4QXDBAqrNGsP00xgXjWRVSy2r
 +RiA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq82rEzOgQYdx9c3UCgysQAv37PxHwyyi+8NFc/i5HsotKHdWuXOY+OsCPaAFlEKXQUg7Xvpkijo6cE@nongnu.org
X-Gm-Message-State: AOJu0YxdRUuA9BoZYH/ioD/3oe2GxFWGPC5+juizJ7RBgp0qCY4ZVzox
 6/k8BqaiEBnDnezL568G72RY/HOTGh+f3kEb4jz3RWrUe5wa/hEcr6LHitnxOxJetCHaKnA70CG
 V3D2cdmo8KYVWlwqdaPgRemDrUyGARUI=
X-Gm-Gg: AR+sD10Wpa8nAvOZtjq5kKy7bdgQZ7CX1tbk5aHHvRMh6RhgIFkOSW7H99zlUclWsD9
 s9OGLcEE+xeej7n+PM0qfk4tM9MqSH2+1c5MMGNiJFSiE0xxNm5mdzVPd5lNMFOysRLQo/vbfTD
 LT5+LPyBW7s+WqboMHCyc4E9gJBSrivVKrqFMMBXmGiHP2Sh3JeV1cLM3rz+zeD0SBG8rK+KanI
 D8Dsv7Z42oZR0Cy3nh0T0uO+jOoy81ZMYSQNpYOUqJkaMTWCEkGfSRQ0cCQMQ==
X-Received: by 2002:a05:690c:64c2:b0:81e:9ba9:d36b with SMTP id
 00721157ae682-81f69e9bd7amr23128037b3.63.1785127526839; Sun, 26 Jul 2026
 21:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1785064312.git.flamboyant.h.01@gmail.com>
 <12e325190a15045cff5c429b154217814cd9e618.1785064313.git.flamboyant.h.01@gmail.com>
In-Reply-To: <12e325190a15045cff5c429b154217814cd9e618.1785064313.git.flamboyant.h.01@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 27 Jul 2026 12:45:12 +0800
X-Gm-Features: AUfX_mwYfOo15Iqvx9k9PAcrHvDVRAGZQUpU5j2HVZnvG7olLePuuxVNmCIwcPo
Message-ID: <CAEUhbmUEF7fLEP9+HbE6mKE5OKsVm0rds+1S==BtRLArLZMbxA@mail.gmail.com>
Subject: Re: [PATCH 01/11] hw/ssi: Add K230 DesignWare SSI register model
To: Kangjie Huang <flamboyant.h.01@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair@alistair23.me>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Kangjie,

On Sun, Jul 26, 2026 at 8:30=E2=80=AFPM Kangjie Huang <flamboyant.h.01@gmai=
l.com> wrote:
>
> Add a SysBus model for the K230 DesignWare SSI controllers.
>
> Implement the register layout, reset values, writable masks, FIFO state,
> chip-select GPIOs, and the MMIO regions needed by the K230 machine,
> based on the K230 Technical Reference Manual. The controller is not
> instantiated by this patch.

Please split the model into 2 models:

- One generic model for Synopsys DesignWare SSI controller
- One K230 specific wrapper model on top of the Synopsys DesignWare
SSI controller [optional, if the generic model is enough to make the
k230 software happy]

This way we can reuse the Synopsys DesignWare SSI controller model by
other machines in the future.

>
> Signed-off-by: Kangjie Huang <flamboyant.h.01@gmail.com>
> ---
>  hw/ssi/Kconfig               |   4 +
>  hw/ssi/k230_dw_ssi.c         | 795 +++++++++++++++++++++++++++++++++++
>  hw/ssi/meson.build           |   1 +
>  include/hw/ssi/k230_dw_ssi.h |  50 +++
>  4 files changed, 850 insertions(+)
>  create mode 100644 hw/ssi/k230_dw_ssi.c
>  create mode 100644 include/hw/ssi/k230_dw_ssi.h
>

Regards,
Bin

