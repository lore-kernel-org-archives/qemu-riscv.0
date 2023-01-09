Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pF12P-000515-Vg
	for mharc-qemu-riscv@gnu.org; Mon, 09 Jan 2023 17:54:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pF12N-0004wP-P5; Mon, 09 Jan 2023 17:54:39 -0500
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pF12L-0007jP-0s; Mon, 09 Jan 2023 17:54:38 -0500
Received: by mail-vk1-xa2f.google.com with SMTP id l185so1568483vke.2;
 Mon, 09 Jan 2023 14:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wIml/86VIh1Yv5cQrS4eyVEugrgWsNH8gQXS0Z8IbwI=;
 b=e6bKqJG3bXbouwTNciC7CL23S9oRgOXKVHOdplqVCV5urxNWCy02V7OGIn5/JFEdTD
 16ZHr7W76JV711rV20jdj6VlBgwfAYS8ih+kbYYcRjeNJB8JeVS58+wInRCF0PK2LcLW
 LRH8M4qSM0Uf0s6a1TyK9pMHYPIJsxDNTtQ13coOHKpJmzNNEBc0fsEU98fIovFMuwBG
 6SgWs6Nh6oacz1XNqOXYoNp6GTyqDvqZMDvpV65gix/UgOfn8+sg9hU4f+V2xnQnGMCR
 OSJLI1n4zJ+BH4SL/W2Q+SJAV1BrFTE1vBcuD5oD2e6vn3geo5s6k5d3gqpsZcq450tv
 mbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wIml/86VIh1Yv5cQrS4eyVEugrgWsNH8gQXS0Z8IbwI=;
 b=MsB1/J2VS1yrst4nRA/ReshSFlFbDJjgqLzXJb6UmxERBvfEKdDbpK/ynncPL7Bkdx
 RSdDllbZr3B5a/5tanb9rI7NU90uqrDiNDqAHF7lO3AcMmfW5hB8D+HEitd/NhYjYH+G
 xN8op58HT9w9CKjeaf8Nn7w+aS3YTCFKqxMaDeHxol2BavYE6Lxh3cb5CuVQZUDekTbv
 Jy+fH/xVGyeSQro8yxmq3iYE6DncFkdujZZZHLUbz33WbjMpcqr3yeVFgWP9/iVnVR/N
 BJ19aEVtjgvrzuRHHmb0+fz11/GRpV4fAIvRoVWUK9uxMJ3YghmdN2loB8VFeljl+8W+
 NJ4Q==
X-Gm-Message-State: AFqh2krWm4ri9cgJmE/aIxDRMqjk2gy3juS669B+xj2b/Zq67aoLUGGQ
 gzog+mXlrBTIiteF1K6OHssUA+cwb4/04/SHHDI=
X-Google-Smtp-Source: AMrXdXvQiOS9QRQ4A0HIj6w/mU183y6uwCrrOtbY3HrU0f5jmamg5P9Y2EQqtaelRilW/4x8uhYkSLWDX3RvPl4X2r8=
X-Received: by 2002:a1f:c703:0:b0:3d5:6ccb:8748 with SMTP id
 x3-20020a1fc703000000b003d56ccb8748mr6386608vkf.26.1673304875363; Mon, 09 Jan
 2023 14:54:35 -0800 (PST)
MIME-Version: 1.0
References: <20221228062028.29415-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20221228062028.29415-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 10 Jan 2023 08:54:09 +1000
Message-ID: <CAKmqyKMCUxq4VikHqi5Mte6r3QiAnByDZtk_1Y80Apq57c-9vA@mail.gmail.com>
Subject: Re: [PATCH v9 0/9] support subsets of code size reduction extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2f.google.com
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
X-List-Received-Date: Mon, 09 Jan 2023 22:54:40 -0000

On Wed, Dec 28, 2022 at 4:23 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> This patchset implements RISC-V Zc* extension v1.0.0.RC5.7 version instru=
ctions.
>
> Specification:
> https://github.com/riscv/riscv-code-size-reduction/tree/main/Zc-specifica=
tion
>
> The port is available here:
> https://github.com/plctlab/plct-qemu/tree/plct-zce-upstream-v9
>
> To test Zc* implementation, specify cpu argument with 'x-zca=3Dtrue,x-zcb=
=3Dtrue,x-zcf=3Dtrue,f=3Dtrue" and "x-zcd=3Dtrue,d=3Dtrue" (or "x-zcmp=3Dtr=
ue,x-zcmt=3Dtrue" with c or d=3Dfalse) to enable Zca/Zcb/Zcf and Zcd(or Zcm=
p,Zcmt) extensions support.
>
>
> This implementation can pass the basic zc tests from https://github.com/y=
ulong-plct/zc-test
>
> v9:
> * rebase on riscv-to-apply.next
>
> v8:
> * improve disas support in Patch 9
>
> v7:
> * Fix description for Zca
>
> v6=EF=BC=9A
> * fix base address for jump table in Patch 7
> * rebase on riscv-to-apply.next
>
> v5:
> * fix exception unwind problem for cpu_ld*_code in helper of cm_jalt
>
> v4:
> * improve Zcmp suggested by Richard
> * fix stateen related check for Zcmt
>
> v3:
> * update the solution for Zcf to the way of Zcd
> * update Zcb to reuse gen_load/store
> * use trans function instead of helper for push/pop
>
> v2:
> * add check for relationship between Zca/Zcf/Zcd with C/F/D based on rela=
ted discussion in review of Zc* spec
> * separate c.fld{sp}/fsd{sp} with fld{sp}/fsd{sp} before support of zcmp/=
zcmt
>
> Weiwei Li (9):
>   target/riscv: add cfg properties for Zc* extension
>   target/riscv: add support for Zca extension
>   target/riscv: add support for Zcf extension
>   target/riscv: add support for Zcd extension
>   target/riscv: add support for Zcb extension
>   target/riscv: add support for Zcmp extension
>   target/riscv: add support for Zcmt extension
>   target/riscv: expose properties for Zc* extension
>   disas/riscv.c: add disasm support for Zc*

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  disas/riscv.c                             | 228 +++++++++++++++-
>  target/riscv/cpu.c                        |  56 ++++
>  target/riscv/cpu.h                        |  10 +
>  target/riscv/cpu_bits.h                   |   7 +
>  target/riscv/csr.c                        |  38 ++-
>  target/riscv/helper.h                     |   3 +
>  target/riscv/insn16.decode                |  63 ++++-
>  target/riscv/insn_trans/trans_rvd.c.inc   |  18 ++
>  target/riscv/insn_trans/trans_rvf.c.inc   |  18 ++
>  target/riscv/insn_trans/trans_rvi.c.inc   |   4 +-
>  target/riscv/insn_trans/trans_rvzce.c.inc | 313 ++++++++++++++++++++++
>  target/riscv/machine.c                    |  19 ++
>  target/riscv/meson.build                  |   3 +-
>  target/riscv/translate.c                  |  15 +-
>  target/riscv/zce_helper.c                 |  55 ++++
>  15 files changed, 834 insertions(+), 16 deletions(-)
>  create mode 100644 target/riscv/insn_trans/trans_rvzce.c.inc
>  create mode 100644 target/riscv/zce_helper.c
>
> --
> 2.25.1
>
>

