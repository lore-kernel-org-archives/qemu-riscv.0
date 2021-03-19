Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lNEsG-0006wv-TH
	for mharc-qemu-riscv@gnu.org; Fri, 19 Mar 2021 09:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lNEsF-0006wi-Iu; Fri, 19 Mar 2021 09:09:07 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:37645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lNEsE-0001oD-1Q; Fri, 19 Mar 2021 09:09:07 -0400
Received: by mail-io1-xd2f.google.com with SMTP id b10so5990480iot.4;
 Fri, 19 Mar 2021 06:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s3YVosDOHXtscmPMs8euaOMeqVtoqrnRF4CTe32hWo0=;
 b=sv0gWZwLzEbnQ+SBz+ve5Vq+iK13XXmMsBdIsO5ujccsRaPbdVzpCGysO8R+pD+xd1
 NCSza0uNIfqNoFZTxHhhz3uumMHKrNjmiIUb1dO41TpAE+a6ux3c3Q36T7QfEAOz2vL2
 KvxMpiT3HW6L0CrUD6rNBX/UDI6fH4aDYZoyc3p/X/rB/uMJqC1SxQPsznOFNSXaM2cJ
 ifKkxPEXxgBJ9vkdvmvAvhbUOF8dtPGr9YXIdbOLcf22RaFA/NC2snu87ubF+ezf8yrk
 mkaBZ7nut0JPJR6BYsdh8ADfWnTh7JQp/XEBK8wScfk6+jnBnNdVirsUA3jcur3nk8dc
 9gRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s3YVosDOHXtscmPMs8euaOMeqVtoqrnRF4CTe32hWo0=;
 b=pLW4N/NMheYziBg1vu8umClOFNBbY3hn7QAc1uMZFSiAOHH7LQgr0feJfjB4GbVosS
 G7sbugEGc2+T3aX9BwLnf20Mrze6/2PwN3T8htLpaezDkv1fKtNLb7mh8uKtfCtUsF8c
 eN2FiKkprkgZo6C4cu4Gzl4/VCCbSzGxtaewiRODpEf/SuEpCfbMgiZF2yiQgXP9YuaW
 bDH0FOx009+tlFSqZTE9C/39ASPBqNHCogw0c7kgd7PRxTe3yzEPtIhI/6gIqM1FKBw5
 4vfdPMvHtw6zhvfw9mNLePQD0uiYBX08YTy5XsvEs2MNYKTNui+tauqUwvUbOlDMm5fB
 P3/A==
X-Gm-Message-State: AOAM530ExfPzeAzjNHK/G+3+RiGwSd0kap8P4+HubBfiVr/eiJvqN8bb
 kODI491KggUg83icqUGrSNyREUjaiQZZytJe0Eo=
X-Google-Smtp-Source: ABdhPJzl8cGuJqfnHaZIXG1DlCKOES97yhCaSsiNTAIHx3/YN5ArfJz1Yv93v+eaFgjSKE+hmwmTyTvXo0JakoLG2ck=
X-Received: by 2002:a05:6638:3791:: with SMTP id
 w17mr1242121jal.91.1616159344094; 
 Fri, 19 Mar 2021 06:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210318235041.17175-1-ashe@kivikakk.ee>
In-Reply-To: <20210318235041.17175-1-ashe@kivikakk.ee>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Mar 2021 09:07:15 -0400
Message-ID: <CAKmqyKNj9HB7c3+ESYzPTWn_TXY-AZ-w+pBP1BePpNqpHUpuMg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] hw/riscv: Add fw_cfg support, allow ramfb
To: Asherah Connor <ashe@kivikakk.ee>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
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
X-List-Received-Date: Fri, 19 Mar 2021 13:09:07 -0000

On Thu, Mar 18, 2021 at 7:51 PM Asherah Connor <ashe@kivikakk.ee> wrote:
>
> This is version 4 of the series to bring fw_cfg and ramfb support to
> riscv's virt machine, adapted for the latest master.  It is still tested
> as working against a modified U-Boot with ramfb support.
>
>
> Changes in v4:
> * Adapt for changes made in c65d7080d8 "hw/riscv: migrate fdt field to
>   generic MachineState".
>
> Changes in v3:
> * Document why fw_cfg is done when it is.
> * Move VIRT_FW_CFG before VIRT_FLASH.
>
> Changes in v2:
> * Add DMA support (needed for writes).
> * Add ramfb as allowed on riscv virt machine class.
>
> Asherah Connor (2):
>   hw/riscv: Add fw_cfg support to virt
>   hw/riscv: allow ramfb on virt
>
>  hw/riscv/Kconfig        |  1 +
>  hw/riscv/virt.c         | 33 +++++++++++++++++++++++++++++++++
>  include/hw/riscv/virt.h |  2 ++
>  3 files changed, 36 insertions(+)

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> --
> 2.20.1
>
>

