Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nCHPU-0005QK-Cp
	for mharc-qemu-riscv@gnu.org; Tue, 25 Jan 2022 03:42:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guoren@kernel.org>)
 id 1nCHPL-0005N4-FL; Tue, 25 Jan 2022 03:42:32 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:58776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guoren@kernel.org>)
 id 1nCHPJ-00060d-Hx; Tue, 25 Jan 2022 03:42:31 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 367FB61291;
 Tue, 25 Jan 2022 08:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC0BC340ED;
 Tue, 25 Jan 2022 08:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643100146;
 bh=HeNRO6gDaqmqdAPTAYOJawDCCrPdQRB6iWVAuYH0y64=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZzsPlTmaP3AEj323tt0CFl6kv18l8Vv/X1Aknie5sD2sMebLvhqOiBFyHzxBdQG2R
 +OuGL6Fo42+h3emQ3rosWQGVCtbzPwvAy98LKQOdFR+g8DKD9YN4gQrp2khA1JuYUe
 1OnugjvecIWSZeZhEXMRffAD9/XH3a+u0fQ4LsDP/XNTHFFIDAXrr1OxKjiKLHcZwV
 p2GDMvai09IwIUYYCREnFVAc2ER+3rfPQ8UtPNVyRI99YOntiUVZqkG/nkVJrYf8m0
 o9qWhU1V7J+BQE+raV04BO7Dd+xR3hcpPYRGmjQngczne6FWqX7I9ywa0XJ50W7oiU
 rNe16EayMlDoQ==
Received: by mail-ua1-f48.google.com with SMTP id u6so36115367uaq.0;
 Tue, 25 Jan 2022 00:42:26 -0800 (PST)
X-Gm-Message-State: AOAM533K0CqVAovP24IM5eX6XPbrHCXltpVCe3wL5JfTr1+4JBTr53iJ
 dhaOHrpA3mi2sIQv530HpNdNkq5BaplNiaQULJ0=
X-Google-Smtp-Source: ABdhPJxnVUnPO0fJOqkgJVqNCw6qtsH4Ny8t+HnTwyHQsfjLgWRXw/EPmtbvrlX4+2Lfp4/AZti5ZJbYdzGB2uohA8c=
X-Received: by 2002:a67:f6c8:: with SMTP id v8mr338566vso.51.1643100145334;
 Tue, 25 Jan 2022 00:42:25 -0800 (PST)
MIME-Version: 1.0
References: <20220125064536.7869-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20220125064536.7869-1-liweiwei@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 25 Jan 2022 16:42:14 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSeWowyfM-aZW9S153=kOFYrQ4vai-Qth8Lb3vPH9kQJw@mail.gmail.com>
Message-ID: <CAJF2gTSeWowyfM-aZW9S153=kOFYrQ4vai-Qth8Lb3vPH9kQJw@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] support subsets of virtual memory extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Ren Guo <ren_guo@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217; envelope-from=guoren@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 25 Jan 2022 08:42:34 -0000

On Tue, Jan 25, 2022 at 3:33 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> This patchset implements virtual memory related RISC-V extensions: Svnapot version 1.0, Svinval vesion 1.0, Svpbmt version 1.0.
>
> Specification:
> https://github.com/riscv/virtual-memory/tree/main/specs
>
> The port is available here:
> https://github.com/plctlab/plct-qemu/tree/plct-virtmem-upstream-v6
>
> To test this implementation, specify cpu argument with 'svinval=true,svnapot=true,svpbmt=true'.
>
> This implementation can pass the riscv-tests for rv64ssvnapot.
>
> v6:
> * select ppn mask base on sxl
>
> v5:
> * merge patch https://lore.kernel.org/qemu-devel/1569456861-8502-1-git-send-email-guoren@kernel.org/
> * relax pte attribute check
>
> v4:
> * fix encodings for hinval_vvma and hinval_gvma
> * partition inner PTE check into several steps
> * improve commit messages to describe changes
>
> v3:
> * drop "x-" in exposed properties
>
> v2:
> * add extension check for svnapot and svpbmt
>
> Guo Ren (1):
>   target/riscv: Ignore reserved bits in PTE for RV64
>
> Weiwei Li (4):
>   target/riscv: add PTE_A/PTE_D/PTE_U bits check for inner PTE
>   target/riscv: add support for svnapot extension
>   target/riscv: add support for svinval extension
>   target/riscv: add support for svpbmt extension
>
>  target/riscv/cpu.c                          |  4 ++
>  target/riscv/cpu.h                          | 14 ++++
>  target/riscv/cpu_bits.h                     | 10 +++
>  target/riscv/cpu_helper.c                   | 34 +++++++++-
>  target/riscv/insn32.decode                  |  7 ++
>  target/riscv/insn_trans/trans_svinval.c.inc | 75 +++++++++++++++++++++
>  target/riscv/translate.c                    |  1 +
>  7 files changed, 142 insertions(+), 3 deletions(-)
>  create mode 100644 target/riscv/insn_trans/trans_svinval.c.inc
>
> --
> 2.17.1
>
>

Tested-by: Guo Ren <guoren@kernel.org>

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

