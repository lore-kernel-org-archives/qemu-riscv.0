Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSFsa-0000bd-QC
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 06:23:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSFsM-0000Y9-ON; Wed, 15 Feb 2023 06:23:04 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSFsI-0000hk-Nc; Wed, 15 Feb 2023 06:23:01 -0500
Received: by mail-ed1-x536.google.com with SMTP id u21so21577398edv.3;
 Wed, 15 Feb 2023 03:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ouLWuQZ2pz+VduoyrmD93mYSriub3L2vubqcxMKhsgg=;
 b=oXayaoSD0F6LSdTbc3ixzxNsXtvUpoqIu1FVyH5sVvgbJODsxGvzybzqCK+GgPnP7Z
 4otVqHISMGq2NF3rh0BUanSCLyeOSfRqB1YjL4liDX0Mnr3sm+kJ3eHnYeZ2uUYtRSih
 MxYlTHnlugDi2Dk6D55PxcMdiGZ6q/WqsmGmS251qKKF+Xfx94sB0Zgvun6HAlW7x1Rk
 wS6Kc+lHTgmAtxT19XkoNl+71yhT91RERmyFnt9pPMkoUSolPdGvpe9PIg/hpYHBj1r1
 hTpnji3O0x/MORNqUWTRaiPiOzgZOsfzkmCrAXNjrufxtsAn/0qWmudoacON1TlXIdu5
 1tfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ouLWuQZ2pz+VduoyrmD93mYSriub3L2vubqcxMKhsgg=;
 b=ZHTjqpJkEDDAZ9G/sfm5HQ8NFq3XRwF3E62/tgaOfTwUsu7qOGzDqyfz4/RDEwiuGG
 38PyHrpfktoNpIKNBryMzU9edOLohAKrnpyHlwsJTJtVU/xJPviBw810YWRcPLxzOGix
 j63IVYxlM6qp1yVdRF7y+l5v7nu74RK2a9U7t/WUkaZkz6W80l3h4P1yN8LvO2Cx37kb
 254EIG7x/O2DL7XOQkQw5LrxM4Rqj6Klbjv4LYpyNF/0ZBq9WdtG/AOLNj3AXIqFqrAZ
 0qmQhkDHUUEIzu5tfDE9t5vcbzRrOfHETslFFME0uI9/qkPbEIsVEg9OjvrHrj8CSCOn
 5xYQ==
X-Gm-Message-State: AO0yUKWqv+g9hHyNxju8IP4aey+vg5WTY5INYwwVC4gQQEQVTlkr1XwK
 OTvnmZ+dqFtUG58pzBQGzHsQSSr6oSZBqP1Nj00=
X-Google-Smtp-Source: AK7set/331RP+8P2X9VZiYMo5Dq/61fsXyWlznjJHxYmWdMcVPC78ThsiIKwKxW6wVaBUtIeN3MaXmNCe3Pgj9zYIDg=
X-Received: by 2002:a50:d093:0:b0:49d:ec5d:28b4 with SMTP id
 v19-20020a50d093000000b0049dec5d28b4mr873541edd.6.1676460171539; Wed, 15 Feb
 2023 03:22:51 -0800 (PST)
MIME-Version: 1.0
References: <20230214192356.319991-1-dbarboza@ventanamicro.com>
 <20230214192356.319991-6-dbarboza@ventanamicro.com>
In-Reply-To: <20230214192356.319991-6-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 15 Feb 2023 19:22:40 +0800
Message-ID: <CAEUhbmU-xX-LDB2K0BT8iA0Y3kfDn7knoRa=F1G5tdv+znWmwg@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] target/riscv: remove RISCV_FEATURE_DEBUG
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x536.google.com
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
X-List-Received-Date: Wed, 15 Feb 2023 11:23:08 -0000

On Wed, Feb 15, 2023 at 3:25 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> RISCV_FEATURE_DEBUG will always follow the value defined by
> cpu->cfg.debug flag. Read the flag instead.
>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c        | 6 +-----
>  target/riscv/cpu.h        | 1 -
>  target/riscv/cpu_helper.c | 2 +-
>  target/riscv/csr.c        | 2 +-
>  target/riscv/machine.c    | 3 +--
>  5 files changed, 4 insertions(+), 10 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

