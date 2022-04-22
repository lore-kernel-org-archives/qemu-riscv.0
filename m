Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhinU-0008Fa-K3
	for mharc-qemu-riscv@gnu.org; Thu, 21 Apr 2022 22:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhinT-0008EA-9y; Thu, 21 Apr 2022 22:13:23 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:33184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhinR-0001cm-IH; Thu, 21 Apr 2022 22:13:22 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2eba37104a2so71857747b3.0; 
 Thu, 21 Apr 2022 19:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1I+LQYReg0CnXp6WlfnRD0aOzelZmrk0tDVMoTysREY=;
 b=EWeTcOVt/9rewS9qxUnjpFehj/M7IGTGnfYwd8IsFTBVlhqzBkFk5+D7CrB0G0vosn
 W8H6BFcKfyP20Fa/D3fnbWCQ1dX/G0+OEWyJD1M2rXRzNieOFE6JN6/nJM26bykzvEfU
 vamPrwQxFtBt5al7rEBfcmYo6WswOmjxBleF7ci9y/YJpM56AOxFvDtyG4YueJBMi1AR
 xh4NBkfZGUAjAOA2HjiC3G2aa0fp3euLtBSRNuMlqthTxEwT3ePP09R60Ej/6NhV4q25
 UM9PS4n84AbxuWdk7lsuUiSQ/Ax0Rpf/yUo3dpfsgZlbRLRRubScSKVRfiE/UYt3dhQ1
 +RRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1I+LQYReg0CnXp6WlfnRD0aOzelZmrk0tDVMoTysREY=;
 b=uYKf0TnkuI/408oMl+4wQDbdh0/tuuNh33f/LiInBUYhTUvhzjWb0IIcxXByNuDM1W
 vTIsj0phOj9nZBeVnuX4F20SbRq+m4A/3t2E9315Un05/0tAnquFGM84GTZ3HpIdyoau
 vva73QuFtybhmnu54jk9MNIS1X+yvSXFmVwI92ecRQ6Ad7MCBroisT+8EmVgTVIifPkf
 v7E81Ti1+RvY9GuF5uCVTgx9fQq1NykJ+oHdpLvz3lzksvoF9N2gCJGWpMrGDh7p/6CR
 dKCdDjQ4FdQvXR+VSGcxAn0YorK/iD0z1AA4cHKG6SnRQTV+8D1sFXIQL2WvGWR/fWh8
 iTlg==
X-Gm-Message-State: AOAM530Vue3l0RT5hDii26YWhBD5BgFGOA/f2tqERvkB3pNa64JklMyR
 Ece0bl2MMdbhv/M1e6+08H2NJxgE2nz6Nn2b9mY=
X-Google-Smtp-Source: ABdhPJxa/pSOZjSupR1ytZpRffubj+BKGOXrQezkfKCU30CQYJ5qwzcQOLKT8shxAhVW/+fdB1rTcFSjwyNGYehwpRE=
X-Received: by 2002:a81:ad7:0:b0:2e6:84de:3223 with SMTP id
 206-20020a810ad7000000b002e684de3223mr2713534ywk.209.1650593599848; Thu, 21
 Apr 2022 19:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
 <20220420055248.960491-7-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220420055248.960491-7-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 22 Apr 2022 10:13:07 +0800
Message-ID: <CAEUhbmVRjbJWWRBEav1jEv79+rK-7f_89H=SKrnfw+COvMkZuQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] hw/riscv: Enable TPM backends
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Alistair Francis <alistair23@gmail.com>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 22 Apr 2022 02:13:23 -0000

On Wed, Apr 20, 2022 at 1:53 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Imply the TPM sysbus devices. This allows users to add TPM devices to
> the RISC-V virt board.
>
> This was tested by first creating an emulated TPM device:
>
>     swtpm socket --tpm2 -t -d --tpmstate dir=/tmp/tpm \
>         --ctrl type=unixio,path=swtpm-sock
>
> Then launching QEMU with:
>
>     -chardev socket,id=chrtpm,path=swtpm-sock \
>     -tpmdev emulator,id=tpm0,chardev=chrtpm \
>     -device tpm-tis-device,tpmdev=tpm0
>
> The TPM device can be seen in the memory tree and the generated device
> tree.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/942
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  hw/riscv/virt.c  | 4 ++++
>  hw/riscv/Kconfig | 1 +
>  2 files changed, 5 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

