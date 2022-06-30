Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o6iL4-00085x-Ql
	for mharc-qemu-riscv@gnu.org; Wed, 29 Jun 2022 20:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o6iL3-00085H-4z; Wed, 29 Jun 2022 20:47:21 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:34634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o6iKy-0004AR-Mz; Wed, 29 Jun 2022 20:47:20 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 a11-20020a17090acb8b00b001eca0041455so1971493pju.1; 
 Wed, 29 Jun 2022 17:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bCleCyHObJuxmutDeeY/CC1ri8k8KdRSXU8l6oFTftY=;
 b=pZBvUR7EEdujzfaN369eEZq3TbFPFh8IcqGvBU8MPYcm74j3v9XCRQsnFUkxqVDs2l
 igkY42cffWmx9b7HNF4yUT8JghXkIlMrn3+91qXhcIggmQk9CEqTwf83T/3VGKEnXuqR
 Pc/0kHAHyLJJG6DVgJJml98548w/9Va/o11LsJSNaBW+fKgQ1CZHRxNzcuZ+Y06kyMfd
 sqVawxJzZRrUb8ae4Z0gG0DJGTPtOnv1IPrj68ep12Q5TJQL+BF9Js48pkxSrOvlnxKj
 OjlxsB3mTL6wRSDr3qosSw3FPki+ibVcritzItvRPavh0eg8HyEw+MHx0oOz0sP55lIh
 sZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bCleCyHObJuxmutDeeY/CC1ri8k8KdRSXU8l6oFTftY=;
 b=og024cM1o/rzQWytYpQEp+xhfFY1kVLFWloj5WX08xnjSLaRM+v7b8/ht9+KlFSgsD
 gd8Pmpz4UuCOYuOROJCcL/59Y91oQhyxQ6DgfwkKxUMZ4kQUkANmWcfU6iRMv8o9txmE
 d714iPEcmg/uT56R/8uqbMMaL/z9fUWTy9+ib8/9gNrgNKg3gYpJ/bASgLA9UkEpT5nq
 wD6Vw6HqVPzqcDsqQyiVPcJyxxg5viPxwfoGswPuLGkGpGsVsIvkbNOiCL/vISxLWU6B
 NnngFqNEHskrDJ1PDfXYJQjLjStiwpiTddYRI9Rg2pnZKjLHyhUqpm9Xeb9OtNK3P2qx
 qO5w==
X-Gm-Message-State: AJIora/Hgge6OajZl1TrM96wXmkRSWHeGVCTIR13vctC+0riESU21j6d
 tnE8/RokPkMabYPIIoNF+wa7VTPSiJyVqyRMtxc=
X-Google-Smtp-Source: AGRyM1sjAIpjIEDtEJJSveC0Ecm0ow2AeY7v7N3E/RTZykadi1k4S6p2XvcPfPIGOIIyO+5wDPPwuG8XqVTLcc9onvc=
X-Received: by 2002:a17:90a:590e:b0:1ed:59f0:bc2f with SMTP id
 k14-20020a17090a590e00b001ed59f0bc2fmr6837017pji.120.1656550034961; Wed, 29
 Jun 2022 17:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220616031543.953776-1-apatel@ventanamicro.com>
In-Reply-To: <20220616031543.953776-1-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 30 Jun 2022 10:46:48 +1000
Message-ID: <CAKmqyKNd67cB-YkKvh=nibv0DzjYpJUgtQjbH7HCR_T63S8x+w@mail.gmail.com>
Subject: Re: [PATCH 0/2] AIA draft v0.3.0 support for QEMU RISC-V
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x102c.google.com
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
X-List-Received-Date: Thu, 30 Jun 2022 00:47:21 -0000

On Thu, Jun 16, 2022 at 1:17 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The latest AIA draft v0.3.0 addresses comments from the architecture
> review committee.
> (Refer, https://github.com/riscv/riscv-aia/releases/tag/0.3.0-draft.31)
>
> There are primarily two changes:
> 1) Removing various [m|s|vs]seteienum, [m|s|vs]clreienum, [m|s|vs]seteipnum,
>    and [m|s|vs]clrei;num CSRs because these CSRs were mostly for software
>    convienence.
> 2) Simplifying the default priority assignment for local interrupts
>
> These patches can also be found in riscv_aia_update_v1 branch at:
> https://github.com/avpatel/qemu.git
>
> Corresponding changes in OpenSBI and Linux were small and these can be
> found at:
>  riscv_aia_update_v1 branch of https://github.com/avpatel/opensbi.git
>  riscv_aia_v1 branch of https://github.com/avpatel/linux.git
>
> Anup Patel (2):
>   target/riscv: Remove CSRs that set/clear an IMSIC interrupt file bits
>   target/riscv: Update default priority table for local interrupts

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu_bits.h   |  26 +------
>  target/riscv/cpu_helper.c | 134 +++++++++++++++++-----------------
>  target/riscv/csr.c        | 150 +-------------------------------------
>  3 files changed, 72 insertions(+), 238 deletions(-)
>
> --
> 2.34.1
>
>

