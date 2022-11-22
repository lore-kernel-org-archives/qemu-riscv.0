Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oxHhr-0004a2-2j
	for mharc-qemu-riscv@gnu.org; Mon, 21 Nov 2022 20:04:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oxHhq-0004Zi-9n; Mon, 21 Nov 2022 20:04:10 -0500
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oxHho-00058K-N9; Mon, 21 Nov 2022 20:04:10 -0500
Received: by mail-vk1-xa2a.google.com with SMTP id u9so4658602vkk.4;
 Mon, 21 Nov 2022 17:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1pweLM+3elOiTWXMbwFND2qrhDa30X/vij9pg+w3zvM=;
 b=BMcPsCJXiOX2HsIO9UTtBc3/XLYCGukswunqyjvk1BC2tgiq9lFGCnwvnswLgZvs5y
 ttwbl8axWw2svdCkUre7oC8vCpdIqDXWi/DR5haPPcMEik983D1ZGXadGBoVWsp3bHJp
 czTN42YJNZ1/fOEeVpG8cm/3LSkX7mEvQ5nKZQPbPj3ODdbMhoToy5NLnVVEuiFxs8kA
 foXTQyvtcRBD4xaE7nxEEck9ok5aSNbnKxN2b3/aYvLxxtNp9BoqXEP9uONubbhCJHs4
 NKg5HhtbJt7Jg6+/zWkQyYyQB3PYxN+UCD3p72lcxbw+406FGIykiwy7gE3E4easouKe
 sABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1pweLM+3elOiTWXMbwFND2qrhDa30X/vij9pg+w3zvM=;
 b=USKUtIW/Lo6R3qXG8QHIPhRKtcoW/y2NHxZ8DYCFUYCI2tjZ1XnbqWxVPzyIY2wq70
 c+ibVPwJ/DoCHNtxfSA+rFotl0Rw+8PxDm8vdX7QfhIQR5ixAc/Jm94kd9pG0I+Z4HwX
 y6naemM5r5w7j9hCqSCzJhDywntqrFWkQMbVQWpKshLcAYh2PPb1cjp2ir/mkmG33oxT
 rGgquV5gIyt2lmXGrXWoMXkgpJY1NHRnzJX4e7GtS6xNlQlbsE7eUECOW71hHmZKMiww
 kc3EJR7qmOmBlL9KXhjymhzXPsCFJid0OUFLg0aimt3S3dKwqIDaQtbx+UIfRHFLouAL
 CsRQ==
X-Gm-Message-State: ANoB5pnIEjVPWSLR3dJoRhkKbVlQyOWVcntiBUcQBXU1ceSBJ6hv9zvM
 2DWKtgMZf/JbPF2FPyjpSHA5KAURi+mqonjcoc8=
X-Google-Smtp-Source: AA0mqf5yJrPCQA5OnBucNsc9RmSuM0TxnZk1/XIK2h+C4mokoXzt3PK8LxfH88Jo0H87Gyh1nL8ME9mtknocgIqBhJw=
X-Received: by 2002:a1f:e3c6:0:b0:3b8:ba98:bd43 with SMTP id
 a189-20020a1fe3c6000000b003b8ba98bd43mr3894124vkh.34.1669079046688; Mon, 21
 Nov 2022 17:04:06 -0800 (PST)
MIME-Version: 1.0
References: <20221108125703.1463577-1-apatel@ventanamicro.com>
In-Reply-To: <20221108125703.1463577-1-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 22 Nov 2022 11:03:39 +1000
Message-ID: <CAKmqyKO3AKHQs852+Fc1oXvfMLLXCgZS7OgnxD3TxZePGoXntA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Nested virtualization fixes for QEMU
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2a.google.com
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
X-List-Received-Date: Tue, 22 Nov 2022 01:04:10 -0000

On Tue, Nov 8, 2022 at 10:59 PM Anup Patel <apatel@ventanamicro.com> wrote:
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

Thanks!

Applied to riscv-to-apply.next

Alistair

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
>

