Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ni94u-0006ZZ-8P
	for mharc-qemu-riscv@gnu.org; Sat, 23 Apr 2022 02:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ni94U-0006Z8-V3; Sat, 23 Apr 2022 02:16:57 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:37838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ni94S-0000Fs-2m; Sat, 23 Apr 2022 02:16:41 -0400
Received: by mail-io1-xd2d.google.com with SMTP id p21so10673687ioj.4;
 Fri, 22 Apr 2022 23:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nJsNUkPLub8bqWUYweitxrAbCeJkJlVSssqCJw+1Cb0=;
 b=LhmSpEupvUAd2rRz03b9asWdZ3MtES8qD3og9976YTcPCg+xoPaQW4oVFjnluKxj6F
 o88UG4jodYNqABBTigGHS93tLHEeEC+gtEBeJvhbqGKYU7gPG1AuXbzoMnP/ct8Mu1Lq
 I/8Ttj1457MwtRvQQomkqWu1PuT7kKmygNrCxZT+WroM5nI3OZtfNtTjyHVmIbZ9MCAm
 zslwHxRM5knF5HVAjZt+dXwvO1bV2gUtREetFN4nT7tVVLusxju5N7BEbAU0CZgmYuif
 F5at3a/XG4qpUz3hHEcUF2uHHE5234zGfYR3RRlB+w7w39rOvsS8QqpoIjV2cDc0lh9q
 70VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nJsNUkPLub8bqWUYweitxrAbCeJkJlVSssqCJw+1Cb0=;
 b=CacERck/tb/PfbJyc+0t7E0Cv9wX32HRqKus7kHFrjrHOboJEwq2q6yAbfWLZZcTjf
 eP8Yha/JDM8GDb8SPpNs9ets9WGbRNYJ6f91IQsGFBz/nH35adOtAu0++f+sbf3+O1HJ
 gCdtqn9UBtYWYEv9eWfoD7UqW5rOCUbHm+ZIjKFCM3jMrenIqfGeLgG6hZbmMmsAoHZB
 ghq5w8drSJ37y2ceYpqA+bDACHVsEBNzCU8E1pyZEnGXVj4/wcA3adsX4mXkL03IdDlN
 3ESeqnzehDaaySCYqz+89mMCW0tFT2r7JOA6a3byM1iOmBN8/Df9LMlEubc/gU3Cqc8a
 cGJw==
X-Gm-Message-State: AOAM5319ekvU6H+Fhhm9XNGWHCLM1m7yTJP4sXURQp+Hf8rNcySF9ozj
 odFsyzn3QZsMIebM+smtyugr6PG/rUZIHd7KiqA=
X-Google-Smtp-Source: ABdhPJxVpDJv02Kr/MCG/Q3RtrqRu6WA2ydkPWmjYcLXB9FfMD0RBLYliuAJGMGRxSdWPZV6dOez7bpMfYDCw7+d6YE=
X-Received: by 2002:a5d:948a:0:b0:64d:23a4:9afa with SMTP id
 v10-20020a5d948a000000b0064d23a49afamr3439815ioj.114.1650694597332; Fri, 22
 Apr 2022 23:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220423023510.30794-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220423023510.30794-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 23 Apr 2022 16:16:11 +1000
Message-ID: <CAKmqyKOL89zKRsPHLJDg6RyY4kOs161UUY_mR8=QfrWr7mpvZw@mail.gmail.com>
Subject: Re: [PATCH v12 00/14] support subsets of scalar crypto extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, luruibo2000@163.com, 
 lustrew@foxmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
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
X-List-Received-Date: Sat, 23 Apr 2022 06:16:58 -0000

On Sat, Apr 23, 2022 at 12:38 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> This patchset implements RISC-V scalar crypto extension v1.0.0 version in=
structions.
> Partial instructions are reused from B-extension.
>
> Specification:
> https://github.com/riscv/riscv-crypto
>
> The port is available here:
> https://github.com/plctlab/plct-qemu/tree/plct-k-upstream-v12
>
> To test rvk implementation, specify cpu argument with 'zks=3Dtrue,zkn=3Dt=
rue' or "zbkb=3Dtrue,zbkc=3Dtrue,zbkx=3Dtrue,zknd=3Dtrue,zkne=3Dtrue,zknh=
=3Dtrue,zksed=3Dtrue,zksh=3Dtrue,zkr=3Dtrue" to enable K-extension support.=
 This implementation can pass the ACT tests for K with our extended act sup=
port for qemu (available at https://github.com/plctlab/plct-qemu/tree/plct-=
k-upstream-v12-with-act)
>
> Review status:
> patch 5 is reviewed by Philippe Mathieu-Daud=C3=A9
> patch 1~14 are acked or reviewed by Alistair Francis
> patch 2~11 are reviewed by Richard Henderson (fix new comments on patch 6=
 and 7)
>
> v12:
> * rebase on master and riscv-to-apply.next
>
> v11:
> * patch 6: add REQUIRE_32BIT to trans_* function for aes RV32 instruction
> * patch 7: add REQUIRE_64BIT to trans_* function for aes RV64 instruction
>
> v10:
> (only patch 12 is modified)
> * simplify the conditions for the check in seed function
> * add NULL check for ret_val in rmw_seed function
> * remain the change of MSECCFG_* to align with the added MSECCFG_*SEED
>
> v9:
> * check whether seed is accessed by a read-write instruction in helper_cs=
rr.
> * fix disas for partial scalar crypto instructions
> * rebase on https://lists.nongnu.org/archive/html/qemu-riscv/2022-03/msg0=
0156.html
>
> v8:
> * replace large macro for trans function of sha256/512 instructions with =
parameters to gen_sha* function in patch 8,9,10
> * fix tcg_const_tl to tcg_constant_tl
> * fix rmw_seed function
>
> v7:
> * reuse gen_unary/gen_arith to simplify trans_* functions
> * replace DEF_HELPER_* with DEF_HEPER_FLAG_*
> * move aes64 related macros from patch 6 to patch 7
> * create common helper gen_aes32_sm4 for aes32 and sm4 related instructio=
ns
> * replace bs with shamt (bs << 3)
> * optimize trans function for sha256, sha512 and sm4 instructions to be g=
enerated inline
>
> v6:
> * add reviewed-by tags
> * rebase on upstream
>
> v5:
> * split the big patches
>
> v4:
> * drop "x-" in exposed properties
> * delete unrelated changes
>
> v3:
> * add extension check for SEED csr access
>
> v2:
> * optimize implementation for brev8, xperm, zip, unzip
> * use aes related sbox array from crypto/aes.h
> * move sm4_sbox to crypto/sm4.c, and share it with target/arm
>
> Weiwei Li (14):
>   target/riscv: rvk: add cfg properties for zbk* and zk*
>   target/riscv: rvk: add support for zbkb extension
>   target/riscv: rvk: add support for zbkc extension
>   target/riscv: rvk: add support for zbkx extension
>   crypto: move sm4_sbox from target/arm
>   target/riscv: rvk: add support for zknd/zkne extension in RV32
>   target/riscv: rvk: add support for zkne/zknd extension in RV64
>   target/riscv: rvk: add support for sha256 related instructions in zknh
>     extension
>   target/riscv: rvk: add support for sha512 related instructions for
>     RV32 in zknh extension
>   target/riscv: rvk: add support for sha512 related instructions for
>     RV64 in zknh extension
>   target/riscv: rvk: add support for zksed/zksh extension
>   target/riscv: rvk: add CSR support for Zkr
>   disas/riscv.c: rvk: add disas support for Zbk* and Zk* instructions
>   target/riscv: rvk: expose zbk* and zk* properties

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  crypto/meson.build                      |   1 +
>  crypto/sm4.c                            |  49 +++
>  disas/riscv.c                           | 173 ++++++++++-
>  include/crypto/sm4.h                    |   6 +
>  target/arm/crypto_helper.c              |  36 +--
>  target/riscv/bitmanip_helper.c          |  80 +++++
>  target/riscv/cpu.c                      |  36 +++
>  target/riscv/cpu.h                      |  13 +
>  target/riscv/cpu_bits.h                 |   9 +
>  target/riscv/crypto_helper.c            | 302 ++++++++++++++++++
>  target/riscv/csr.c                      |  80 +++++
>  target/riscv/helper.h                   |  22 ++
>  target/riscv/insn32.decode              |  97 ++++--
>  target/riscv/insn_trans/trans_rvb.c.inc | 116 ++++++-
>  target/riscv/insn_trans/trans_rvk.c.inc | 391 ++++++++++++++++++++++++
>  target/riscv/meson.build                |   3 +-
>  target/riscv/op_helper.c                |   9 +
>  target/riscv/pmp.h                      |   8 +-
>  target/riscv/translate.c                |   8 +
>  19 files changed, 1368 insertions(+), 71 deletions(-)
>  create mode 100644 crypto/sm4.c
>  create mode 100644 include/crypto/sm4.h
>  create mode 100644 target/riscv/crypto_helper.c
>  create mode 100644 target/riscv/insn_trans/trans_rvk.c.inc
>
> --
> 2.17.1
>
>

