Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHa54-0005ad-3l
	for mharc-qemu-riscv@gnu.org; Wed, 03 Mar 2021 17:34:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lHa52-0005Z4-TA; Wed, 03 Mar 2021 17:34:56 -0500
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:39203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lHa51-0007Ln-GT; Wed, 03 Mar 2021 17:34:56 -0500
Received: by mail-il1-x134.google.com with SMTP id d5so23016146iln.6;
 Wed, 03 Mar 2021 14:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FQPmLcl6eMa/Y8DdcBL6qdpMa8zTP/Ig7wpWzXFjYrc=;
 b=izHbZyVsMRS/KL+w6DWRR91OU7LVE+utYW/HEbkjjBiSWnwxNtFhEDHaJyus7UaD/n
 WFYD8mmgoSl/E0QmjxNo47doZYc/0YD728ET8s0kdIkV/+Ee6Z3BrOmYw/iYIBaE/tKC
 UrXt6MMD4Q7V2AMekANcS5lBPDD2926EowgEmlzzwIgYYttnrptHbxUdehRzuuECemBm
 X54qHLxoGCR5U56mgHqCataNgq7FlfnM4Hu4GcokOZqHKM7XIffx2TR5msMFVm3lyOYm
 8XwYPhH4fwnsuiWW9Z67IbEWXY68oi6YBmQ95SbjrVq83eo6+zYcASBPLnyL1ht7RDPT
 LmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FQPmLcl6eMa/Y8DdcBL6qdpMa8zTP/Ig7wpWzXFjYrc=;
 b=dWs+x+qRaSqS2ZgsN5lfkJruSz3ke0ivIdBuXMuLSxIqyffqZuSHp9fugSPXBkbHci
 ndSG3HWlIrhTGihC0sVg6+1mxnvNxopyqA83kNnnUO/zMWERRxkQinjpelDi3rfP19Bv
 XAm7pD5LD9srb08H6ZW50omc4u9wLrRL3aqZX5GMtIpoE98gRycmi1Qi++GqXeqKnVC7
 Hl+Hw+uepEtdafH2e1ilWI32dzPzIHvZrF66iZ6ppshaGFJmBev3qR/y+4cJAKwinBMe
 TmC1MXJhhDwRidu+P8JXmY5X3owbynsXcwxCZZQygFqzAzFuOlKQ8olumG54QXhI2X5Q
 1vIA==
X-Gm-Message-State: AOAM533UKV2WZu8PQIOZZqxvBkPxABlkDxaxhVeR/cj5z2exWY3UVw5m
 AVvnwA6xF2ulYikLjdqpv4cGmN3IbuLQ/U3K5Bo=
X-Google-Smtp-Source: ABdhPJwRNLtc0HYrLaUMVdzaTQ3iN0lfjdW47nsFPxsJ8cL9dZISFRL60/F3dPThk5x9/0uRSXRF6xTB9Jr7ajcW4Bk=
X-Received: by 2002:a92:c102:: with SMTP id p2mr1397197ile.227.1614810894078; 
 Wed, 03 Mar 2021 14:34:54 -0800 (PST)
MIME-Version: 1.0
References: <20210228111657.23240-1-ashe@kivikakk.ee>
 <20210228111657.23240-2-ashe@kivikakk.ee>
 <CAEUhbmXPC5CKnsvx7_0qG4eN3zMS6as4PkbxSE-kv0De1Lv_VQ@mail.gmail.com>
In-Reply-To: <CAEUhbmXPC5CKnsvx7_0qG4eN3zMS6as4PkbxSE-kv0De1Lv_VQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Mar 2021 17:33:37 -0500
Message-ID: <CAKmqyKOQ-EwJjq9az9KzP2BEXYLshYCLWiFJ_aF7izj5d-bdaw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] hw/riscv: Add fw_cfg support to virt
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Asherah Connor <ashe@kivikakk.ee>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x134.google.com
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Mar 2021 22:34:57 -0000

On Sun, Feb 28, 2021 at 6:45 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Sun, Feb 28, 2021 at 7:17 PM Asherah Connor <ashe@kivikakk.ee> wrote:
> >
> > Provides fw_cfg for the virt machine on riscv.  This enables
> > using e.g.  ramfb later.
> >
> > Signed-off-by: Asherah Connor <ashe@kivikakk.ee>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> > ---
> >
> > Changes in v3:
> > * Document why fw_cfg is done when it is.
> > * Move VIRT_FW_CFG before VIRT_FLASH.
> >
> > Changes in v2:
> > * Add DMA support (needed for writes).
> >
> >  hw/riscv/Kconfig        |  1 +
> >  hw/riscv/virt.c         | 30 ++++++++++++++++++++++++++++++
> >  include/hw/riscv/virt.h |  2 ++
> >  3 files changed, 33 insertions(+)
> >
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>

