Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mMW55-00058Q-Mr
	for mharc-qemu-riscv@gnu.org; Sat, 04 Sep 2021 09:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mMW52-000550-QU; Sat, 04 Sep 2021 09:51:37 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:44585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mMW50-0002aP-L5; Sat, 04 Sep 2021 09:51:36 -0400
Received: by mail-yb1-xb36.google.com with SMTP id q70so3933299ybg.11;
 Sat, 04 Sep 2021 06:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wPszDaySKyrt6JXiLmOoulzJVjPFGYn/jtAI7FXBads=;
 b=AKOqo/Fb+6DO9xpLOl1ZzBitLkZwJXpC9aVqcMDK1RHJKBJ4sd2tDiBpV87xEj7/nc
 3G/RL9fM/xb1pXZlY6nWNLrc+czPu6L2fz0ZNcZT0/oZ9jskzXsaNQiu7kuHBbyWaTGq
 +YjiccRN6gnBVTx/idlkI9EBM7vXDjGZoUxnPdfwfAtaDGcuAPGp0EqIXr7302f2zDaS
 mpXOkgZAKbUmYZ0DrfrACWA6PlwQzDX0qOhX4IpLZIa9ep+usms/9GR9Fax00KfYiXpU
 WsLo+8ROlikv+/+6/pzKjt+oAx8mavX5QsBkX5ZqIIDCqT6FasgEXRfjs+NZdgMSRPfY
 hd/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wPszDaySKyrt6JXiLmOoulzJVjPFGYn/jtAI7FXBads=;
 b=CIcxc55d55TlR4/4d2S/zn0YSC5R8o7530+nF5Gkh9wOhevmMoKxseG+OlFHzarU1G
 ce4IYNlNLn4KNWm+kNQYA7m5631BouoM7t0RZAvYmCcxQOuxucYxDLyoEftxEspFFe4A
 2ewsRkyM2mKbyL/ChzxsdUMTOqur8ptwDiFWzWMMV2+hdMnjRu//YMLZ27fHlsBBy3z/
 bgEx/FBCUeRLwrOIOWB+HZGYMOaH10ZvuSq9MnxJR+9iW6RVAp1Pd+fPX7RCAT4cdh16
 i7ZuN4FCIug6JPdu8wJwioLI/vOyieHvTQc9efsnCqW7Mu4nWpZcbtC0YRCDoFwuzY2w
 UPeA==
X-Gm-Message-State: AOAM531vs2JlScfqh5859Z3fzO8DegB06erLswAaidSen6D33AQlAxCz
 H5AJeUD8IuFlVJ3pvkJz55JeMHO3qMf94VbngNc=
X-Google-Smtp-Source: ABdhPJy4o7rsgs3GxDqJ+XsddDDO+YTFylqFuOg99YJZSNncChFseBSrBIPFwma3o/ZnZT5EVWkU3ob1zFeaecSV6QA=
X-Received: by 2002:a05:6902:724:: with SMTP id
 l4mr5021546ybt.109.1630763491042; 
 Sat, 04 Sep 2021 06:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210902112520.475901-1-anup.patel@wdc.com>
In-Reply-To: <20210902112520.475901-1-anup.patel@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 4 Sep 2021 21:51:20 +0800
Message-ID: <CAEUhbmUXxacAcojk+nExh-KjrdAyuEBG0U0P_fu=m3JY4Z2Ttw@mail.gmail.com>
Subject: Re: [PATCH v2 00/22] QEMU RISC-V AIA support
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sat, 04 Sep 2021 13:51:37 -0000

On Thu, Sep 2, 2021 at 7:26 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> The advanced interrupt architecture (AIA) extends the per-HART local
> interrupt support. Along with this, it also adds IMSIC (MSI contrllor)
> and Advanced PLIC (wired interrupt controller).
>
> The latest AIA draft specification can be found here:
> https://github.com/riscv/riscv-aia/releases/download/0.2-draft.24/riscv-interrupts-024.pdf
>
> This series adds RISC-V AIA support in QEMU which includes emulating all
> AIA local CSRs, APLIC, and IMSIC. Only AIA local interrupt filtering is
> not implemented because we don't have any local interrupt greater than 12.
>
> To enable AIA in QEMU, use one of the following:
> 1) Only AIA local interrupt CSRs: Pass "x-aia=true" as CPU paramenter
>    in the QEMU command-line
> 2) Only APLIC for virt machine: Pass "aia=aplic" as machine parameter
>    in the QEMU command-line
> 3) Both APLIC and IMSIC for virt machine: Pass "aia=aplic-imsic" as
>    machine parameter in the QEMU command-line
> 4) Both APLIC and IMSIC with 2 guest files for virt machine: Pass
>    "aia=aplic-imsic,aia-guests=2" as machine parameter in the QEMU
>    command-line
>
> To test series, we require OpenSBI and Linux with AIA support which can
> be found in riscv_aia_v1 branch at:
> https://github.com/avpatel/opensbi.git
> https://github.com/avpatel/linux.git
>
> Changes since v1:
>  - Revamped whole series and created more granular patches
>  - Added HGEIE and HGEIP CSR emulation for H-extension
>  - Added APLIC emulation
>  - Added IMSIC emulation
>

Where is v1 of this series? It seems I cannot find it on the ML.

Regards,
Bin

