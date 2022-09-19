Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oaQH6-0005S2-Om
	for mharc-qemu-riscv@gnu.org; Mon, 19 Sep 2022 19:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oaQH5-0005PC-6w; Mon, 19 Sep 2022 19:34:03 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:44696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oaQH2-0004OH-Bg; Mon, 19 Sep 2022 19:34:01 -0400
Received: by mail-pf1-x433.google.com with SMTP id j12so1074955pfi.11;
 Mon, 19 Sep 2022 16:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=sKvZVAO7JG903MhYl2Uv2uOM0RoX67nnq6UJthrCKok=;
 b=itdelNQ/GODR1N/h0oYyBjqQ+WYGOC0k2CLJjFJln73rUx1UHw124sBDBgyuMe5+yo
 7vbwbjszj9aCqNpsbjPPHH+jipBPwC1bUlJrfqyRr0ZZD4s6sdmAHNWbjZeftgjFW0Re
 4TNUhM0s8WMZiz4HSbV1JrVksaZEO5O3IU/EOQ7m41lk7d7qXGx92IYaLM4X1KpSSHsY
 tNL88+Z6/+uiP4To15h/9w1d3SdjP1/7kLUCeAIeB6j/Wi2sNigZPfaPXEJNB7NvpSGX
 58nHCKRshTqV5RVSTFtapziw7Yd9MCTcjbiVZ+HOUTEc7KdMbtwxcJzfNOLZE+d2c13E
 d1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=sKvZVAO7JG903MhYl2Uv2uOM0RoX67nnq6UJthrCKok=;
 b=u2wpFJt6EwxJTYIpxjUfo/bbGU4tl7y32IOHJRegtsglWiubIX78Y0UdTU9UcH2s80
 FsHBCcorQn1Mvpx+dhCP9HuGBjS+zqpIMktTpOHKaKS/syYPeYq16jzZLKH3A89dIStN
 pI+X0im7FJ05WRyjM9EwfnVO1EhiZc3lJ1wuQMgTrBNB1WLp9fpAdovJSaDEe0Be/oRD
 1ZQl2LbpFhYU1W+keU3SMllziuCFH1ZuRDIHGEOPCUsGKToL/GVP/nEVqS0Q+reyMNSV
 RKSn+00de4ypBThIEudlM3HNjfeuaLa+55p+tpNo3gjcY0QcctC67ULa+RhkLRWyzZhi
 0zvg==
X-Gm-Message-State: ACrzQf2FmqFxtvXqYifVS26vlHdxTcnMe1iZFPAS+h4Du85cthsuwBP2
 X9CvtubUzapHFKtNbgMEBdF1dwcjRnUOxNZ1fN8=
X-Google-Smtp-Source: AMsMyM5wLU/Ee7vdOki/dNvCa/vG17pVMO0Plq7crdzE7mFo6MhXuH2yXtf8K9lQux49oCIG/g4GKNxU/C7jr3rjV3w=
X-Received: by 2002:a05:6a00:1496:b0:546:2856:6cf5 with SMTP id
 v22-20020a056a00149600b0054628566cf5mr20155315pfu.31.1663630438570; Mon, 19
 Sep 2022 16:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220914101108.82571-1-alistair.francis@wdc.com>
In-Reply-To: <20220914101108.82571-1-alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 20 Sep 2022 09:33:32 +1000
Message-ID: <CAKmqyKNTcsO2XYnE3+8kdYQrx4vGLb8ozGkUFPmUyWFX8H1rFQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/riscv: opentitan: Fixup resetvec issues
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Bin Meng <bin.meng@windriver.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x433.google.com
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
X-List-Received-Date: Mon, 19 Sep 2022 23:34:04 -0000

On Wed, Sep 14, 2022 at 8:11 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> The OpenTitan resetvec is dynamic on QEMU as we don't run the full boot
> ROM flow. This series makes it more configurguable from the command line
> and fixes the default.
>
> Alistair Francis (3):
>   target/riscv: Set the CPU resetvec directly
>   hw/riscv: opentitan: Fixup resetvec
>   hw/riscv: opentitan: Expose the resetvec as a SoC property

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  include/hw/riscv/opentitan.h |  2 ++
>  target/riscv/cpu.h           |  3 +--
>  hw/riscv/opentitan.c         |  8 +++++++-
>  target/riscv/cpu.c           | 13 +++----------
>  target/riscv/machine.c       |  6 +++---
>  5 files changed, 16 insertions(+), 16 deletions(-)
>
> --
> 2.37.2
>

