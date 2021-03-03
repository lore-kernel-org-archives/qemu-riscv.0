Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHaLm-0004DG-2s
	for mharc-qemu-riscv@gnu.org; Wed, 03 Mar 2021 17:52:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lHaLj-0004Aw-SH; Wed, 03 Mar 2021 17:52:11 -0500
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:41595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lHaLi-00041j-AF; Wed, 03 Mar 2021 17:52:11 -0500
Received: by mail-il1-x132.google.com with SMTP id c10so23020723ilo.8;
 Wed, 03 Mar 2021 14:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VmsM/BiMHseQcSp4eqKd/vtKmnHV/kidEFnIlCls40A=;
 b=jtFueVuAE0s0kJ1frVETJA+qF+P7LFkD7VR5Y/rsHyWhnd57dwXwu5UP59ZPae0v8F
 +jRPkBLdSco13AgncCyLR9c8tBtyl016jx+T19RX8HfL/p/vvsJzDv4CexJz/sBjz9ug
 vRzZE8kzePVaVIHN+QYjRyE3AwiAokS28mUhMz9Sa59xnQFNmQDCkPYxHJn/WQmSco2W
 V99GYTTDRSE0O7fTbpYUU3mfXsWPWdyav3iPS+jEqaVMdkJiV+5ltHVvUUOXZakAavlE
 xTj7VX/0W+rFFCbj8AVwqVs4aNs75QiqLPRribDQDnlFLua31nBzgs3V8CekfztUbRIq
 JUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VmsM/BiMHseQcSp4eqKd/vtKmnHV/kidEFnIlCls40A=;
 b=JLX4nnf6nkE1xMTl2SzzzrgzXTkDXAf4ao00RQ8LNcM+joUp6F3fFw6kPEVGujMvh9
 JSpcjVAAgNNRqjzWDJUcLsen/mlVNIbF0b0ulocPZ8gwkx4HsFOFoCe8gU0AKh23aQBX
 8HKtFRZDd6JmJs6eVqkK9k7FhpdJIpgiqm46SnlSiNmirj5ULRQ8RGVKk98/am79OLSY
 FTuWBGAvBbj4ILQEwXpQkQhDcmT6NyxsGxRTHkGe6cKrQLH0TMindvLLsEYfkFQJ+xV3
 rwFMybTWKHNJDSb8ngTMi3bZCLeJk2ULt+snsCFYAbSWPLPKbH7S+ThSPPhMvLZlQ2JG
 HPjg==
X-Gm-Message-State: AOAM532fNLa5MBVyFhpI00M2rfRExlWG3jw6MyaNrpY5cCAGO0nXGx8+
 SlYhvS6A2Uq7SuUQN6QlmO4/UMlQqETaLYPBf1U=
X-Google-Smtp-Source: ABdhPJwBgISrzKmjE/ROpqdpWZ/cW3jtS9kHCAFfZjAmZAySlD5230AgCYL+Kfx5de+9Qo9GT4XBWjSnUyQ52w2BApM=
X-Received: by 2002:a05:6e02:1a0c:: with SMTP id
 s12mr1489852ild.177.1614811928683; 
 Wed, 03 Mar 2021 14:52:08 -0800 (PST)
MIME-Version: 1.0
References: <20210228111657.23240-1-ashe@kivikakk.ee>
In-Reply-To: <20210228111657.23240-1-ashe@kivikakk.ee>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Mar 2021 17:50:52 -0500
Message-ID: <CAKmqyKMv-TBYAK2kEEBmZ8J10iDk86YoNa=Pkpj-fmZAKa9+7A@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] hw/riscv: Add fw_cfg support, allow ramfb
To: Asherah Connor <ashe@kivikakk.ee>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
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
X-List-Received-Date: Wed, 03 Mar 2021 22:52:12 -0000

On Sun, Feb 28, 2021 at 6:18 AM Asherah Connor <ashe@kivikakk.ee> wrote:
>
> This is version 3 of the series to bring fw_cfg support to riscv's virt
> machine, including ramfb support.  It is tested as working against a
> modified U-Boot with ramfb support.

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>
> Changes in v3:
> * Document why fw_cfg is done when it is.
> * Move VIRT_FW_CFG before VIRT_FLASH.
>
> Changes in v2:
> * Add DMA support (needed for writes).
> * Add ramfb as allowed on riscv virt machine class.
>
> Asherah Connor (2):
>   hw/riscv: Add fw_cfg support to virt
>   hw/riscv: allow ramfb on virt
>
>  hw/riscv/Kconfig        |  1 +
>  hw/riscv/virt.c         | 33 +++++++++++++++++++++++++++++++++
>  include/hw/riscv/virt.h |  2 ++
>  3 files changed, 36 insertions(+)
>
> --
> 2.20.1
>
>

