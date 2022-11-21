Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1owx4Q-0007IR-P9
	for mharc-qemu-riscv@gnu.org; Sun, 20 Nov 2022 22:02:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1owx4O-0007IC-Rj
 for qemu-riscv@nongnu.org; Sun, 20 Nov 2022 22:02:04 -0500
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1owx4J-0005Z0-V2
 for qemu-riscv@nongnu.org; Sun, 20 Nov 2022 22:02:04 -0500
Received: by mail-ot1-x329.google.com with SMTP id
 p10-20020a9d76ca000000b0066d6c6bce58so6601937otl.7
 for <qemu-riscv@nongnu.org>; Sun, 20 Nov 2022 19:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1GC5szBlmSrZNXAp6q6CL2QPUkkIjAV+S+QUdZgBYgw=;
 b=DC4UaAEnJWGo9umR1qVFF1H7FjKT6Hyrj0x2PCMStQZZ8J9Dm2T6miKBor2Fr4blVJ
 nSjTDxZpt8SeckksG9c7jFWEE73YzmL8EJpFq18zkLXE1pCGCxjkZ1hH/pR7rgsDJCPf
 q/mYbsaPVoRWrx3Sw3U9ectbv1rWhBcf+QU0OywnnN4cZ7j8wkQ7nsMu3jCr5ebS3ijl
 hxbGI4WnEfo3kG/71LliQoIhv9lMn1n7NQIeqcjdt9Gybi48Ow7uGDlCh7Y5szM6BXa8
 LGWz4q13bH0PaeZu5UR524Z2VJnjYyIBarBkTfnSdgMvvsvwZ1T+WvILLxyUgM4K8Uzk
 HfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1GC5szBlmSrZNXAp6q6CL2QPUkkIjAV+S+QUdZgBYgw=;
 b=mmLK6ryLIEquoEN5j+43LWXn1Ia3uIt9ExBqzMB0HSVh0dJ0Zd6xu0kSroZOJThjyQ
 we91sSinsjRECqoqO8wc7l9+0iZ5k8kAPc8r440OGRxgQY9LFgvi7B63V/gpvrmR6IyS
 D7DNPyUdiSgX6XFIjSA4WV1QiA4vH9A66Zku+PVRJJsjWQsXE9WVWuUQNaI3DDSL8RTw
 h/DCDA0CbWBsoPM7yCgDvhZTOKREheCfQiL/EXH3nI3lGzz7R2D11InhoqgFpE+9hGRo
 7jyGz10j9ZpjOoyl8aqWu6c2i+3sA1PZ7UNuZvkiY5AELUgEznuGcH3sj/DsEka0rIuU
 McOw==
X-Gm-Message-State: ANoB5pn3qhBIt/cXBM6j3o+IjsZGaeMe/lvV9+wue1+CnRqZUPhlmRMG
 HUhgAc5+HfXBHxKdJU1ZPdwXmjwTXJd2ZlMnxeIBFQ==
X-Google-Smtp-Source: AA0mqf7CFE3bV2P0evt9gsd+lsflp142lxrBlijNUQz7B+30Y/xLi887tnoJu61JOKuHt+YyGYxm/T5sHCNzDvsccGA=
X-Received: by 2002:a9d:5e0f:0:b0:662:2458:3ef7 with SMTP id
 d15-20020a9d5e0f000000b0066224583ef7mr8792737oti.150.1668999718082; Sun, 20
 Nov 2022 19:01:58 -0800 (PST)
MIME-Version: 1.0
References: <20221108125703.1463577-1-apatel@ventanamicro.com>
In-Reply-To: <20221108125703.1463577-1-apatel@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 21 Nov 2022 08:31:47 +0530
Message-ID: <CAK9=C2WPJRmQ31h3EvEm-JHX8MtrgZFwOyx20Dp88HCbeLkPMw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Nested virtualization fixes for QEMU
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=apatel@ventanamicro.com; helo=mail-ot1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 21 Nov 2022 03:02:05 -0000

Hi Alistair,

On Tue, Nov 8, 2022 at 6:27 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> This series mainly includes fixes discovered while developing nested
> virtualization running on QEMU.
>
> These patches can also be found in the riscv_nested_fixes_v2 branch at:
> https://github.com/avpatel/qemu.git
>
> Changes since v1:
>  - Added Alistair's Reviewed-by tags to appropriate patches
>  - Added detailed comment block in PATCH4
>
> Anup Patel (5):
>   target/riscv: Typo fix in sstc() predicate
>   target/riscv: Update VS timer whenever htimedelta changes
>   target/riscv: Don't clear mask in riscv_cpu_update_mip() for VSTIP
>   target/riscv: No need to re-start QEMU timer when timecmp ==
>     UINT64_MAX
>   target/riscv: Ensure opcode is saved for all relevant instructions

Friendly ping ?

Regards,
Anup

>
>  target/riscv/cpu_helper.c                   |  2 --
>  target/riscv/csr.c                          | 18 ++++++++++-
>  target/riscv/insn_trans/trans_rva.c.inc     | 10 ++++--
>  target/riscv/insn_trans/trans_rvd.c.inc     |  2 ++
>  target/riscv/insn_trans/trans_rvf.c.inc     |  2 ++
>  target/riscv/insn_trans/trans_rvh.c.inc     |  3 ++
>  target/riscv/insn_trans/trans_rvi.c.inc     |  2 ++
>  target/riscv/insn_trans/trans_rvzfh.c.inc   |  2 ++
>  target/riscv/insn_trans/trans_svinval.c.inc |  3 ++
>  target/riscv/time_helper.c                  | 36 ++++++++++++++++++---
>  10 files changed, 70 insertions(+), 10 deletions(-)
>
> --
> 2.34.1
>

