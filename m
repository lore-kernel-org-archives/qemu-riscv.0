Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oELyg-0005Cc-Jr
	for mharc-qemu-riscv@gnu.org; Wed, 20 Jul 2022 22:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oELyd-0005As-HC; Wed, 20 Jul 2022 22:31:47 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:44903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oELya-00043v-SA; Wed, 20 Jul 2022 22:31:46 -0400
Received: by mail-pl1-x62e.google.com with SMTP id q5so501311plr.11;
 Wed, 20 Jul 2022 19:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s1WNcyYa4BddjaL9iPfXG+ZHXAhJrqaNHYeGKvxu4hU=;
 b=IapxxpWPhrwsO26KKUhc+b3dOOhFWyYGaQMEhaph0IouXJseCD2Pnmzl3nK1tq7tXm
 hTsdrR0CwI0prycNTuLZAjiaSA21KygsnUiS4XW4QgCFVIvmk1hmX9gbNxU91fjFUnXw
 itw5adaC4Gtq+LeW/5Tzz0cSssbRXoTWWXZ5wnthhc5knj37nIQZZ9qGXKC++HZQw9vI
 NsWzfqzWbZiZb+SuiTm+0T0qJsfFeXFAFxWs9baElnrjywqH2KBv86BuJvOvmLSwdjfY
 shOmNo3n4iFxkBEicVzWSqqiuGH7Q+B3UMNY80Wd/XRa7R/gwbMKsW3J6LsOb437xcKp
 C60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s1WNcyYa4BddjaL9iPfXG+ZHXAhJrqaNHYeGKvxu4hU=;
 b=ZICgamHNVcpkMwwy9DoWmm+DaEkJk1oBostfErHuGorwiHtO2qIZ72dOdQTGYl2Q2g
 vnjgGX+pezMeUJ1U7SYdmULc6H23DdfVus7gidZ9iNN2LhZqUqwVXgaF106ImxoZDKlx
 25JJS15HrR2cNO8KC2YlxNbqtMU8xxD6U/GFDKO8wHn/j8+WtI0wlQUymQDiTsMpPb6Q
 7PvdmbWDQt1EARsMK0y4B7Jr5FRMxbx0WqAghUK9GAlCTdtnmtLUSwUxzyBfGL+D+rf6
 Gv72y/NdaGKJl323E4mW32TjGjt7XyW9MIu+7p/nbHVI6y5z/ATxmePh4Zn23Dfk0Jbl
 p5rg==
X-Gm-Message-State: AJIora/z2llkS4V6cWRFfniVTOnrXeZPlIdHjNAN198w2WnAptDvMptD
 uPgrZ8GLNAJZu6KeAWF6+DR95MdUFaTb+cJpnoM=
X-Google-Smtp-Source: AGRyM1uDdwpZxT4IXzlNC5EjAQuEnXGHqdPIJyCNNKUi1mDsmo5k6uS+2UCP+5F7tk8WhzFL4T6iI2VAHC8NyJ92TvU=
X-Received: by 2002:a17:90b:3103:b0:1f2:1464:9622 with SMTP id
 gc3-20020a17090b310300b001f214649622mr8784483pjb.166.1658370702710; Wed, 20
 Jul 2022 19:31:42 -0700 (PDT)
MIME-Version: 1.0
References: <165570784143.17634.35095816584573691-0@git.sr.ht>
In-Reply-To: <165570784143.17634.35095816584573691-0@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Jul 2022 12:31:16 +1000
Message-ID: <CAKmqyKMkEgBE0P-FhurdD_25LrUmc3DXY5bChTZb6vxT73=PGg@mail.gmail.com>
Subject: Re: [PATCH qemu v6 00/10] Add mask agnostic behavior for rvv
 instructions
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62e.google.com
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
X-List-Received-Date: Thu, 21 Jul 2022 02:31:47 -0000

On Mon, Jun 20, 2022 at 4:56 PM ~eopxd <eopxd@git.sr.ht> wrote:
>
> According to v-spec, mask agnostic behavior can be either kept as
> undisturbed or set elements' bits to all 1s. To distinguish the
> difference of mask policies, QEMU should be able to simulate the mask
> agnostic behavior as "set mask elements' bits to all 1s".
>
> There are multiple possibility for agnostic elements according to
> v-spec. The main intent of this patch-set tries to add option that
> can distinguish between mask policies. Setting agnostic elements to
> all 1s allows QEMU to express this.
>
> The following instructions that are always unmasked and not affected:
>
> - Vector add-with-carry and subtract-with-borrow instructions
> - Vector merge and move instructions
> - Vector reduction instructions
> - Vector mask-register logical instructions
> - `vcompress`
>
> v2 updates:
> - Rebase upon changes of the tail agnostic patch-set
> - Minor change for vector load/store instructions
>
> v3 updates:
> - Rebase upon changes of the tail agnostic patch-set
> - Fix coding style, add missing space
> - Trigger `vma` when encountering vector load instructions and not in
>   vector stores
>
> v4 updates:
> - Rebase upon changes of the tail agnostic patch-set
>
> v5 updates:
> - Tag WeiWei as Reviewed-by for this patch-set
>
> v6 updates:
> - Now that the tail agnostic patch-set has been merged, this
>   patch-set no longer depends on it. Rebased to latest master.
>
> Yueh-Ting (eop) Chen (9):
>   target/riscv: rvv: Add mask agnostic for vv instructions
>   target/riscv: rvv: Add mask agnostic for vector load / store
>     instructions
>   target/riscv: rvv: Add mask agnostic for vx instructions
>   target/riscv: rvv: Add mask agnostic for vector integer shift
>     instructions
>   target/riscv: rvv: Add mask agnostic for vector integer comparison
>     instructions
>   target/riscv: rvv: Add mask agnostic for vector fix-point arithmetic
>     instructions
>   target/riscv: rvv: Add mask agnostic for vector floating-point
>     instructions
>   target/riscv: rvv: Add mask agnostic for vector mask instructions
>   target/riscv: rvv: Add mask agnostic for vector permutation
>     instructions
>
> eopXD (1):
>   target/riscv: rvv: Add option 'rvv_ma_all_1s' to enable optional mask
>     agnostic behavior

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.c                      |   1 +
>  target/riscv/cpu.h                      |   2 +
>  target/riscv/cpu_helper.c               |   2 +
>  target/riscv/insn_trans/trans_rvv.c.inc |  28 +++++
>  target/riscv/internals.h                |   5 +-
>  target/riscv/translate.c                |   2 +
>  target/riscv/vector_helper.c            | 152 ++++++++++++++++++++----
>  7 files changed, 167 insertions(+), 25 deletions(-)
>
> --
> 2.34.2
>

