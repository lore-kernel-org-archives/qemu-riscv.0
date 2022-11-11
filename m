Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1otMf9-0005o6-5W
	for mharc-qemu-riscv@gnu.org; Fri, 11 Nov 2022 00:33:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1otMet-0005n0-Mi; Fri, 11 Nov 2022 00:32:57 -0500
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1otMeq-0000Jk-02; Fri, 11 Nov 2022 00:32:54 -0500
Received: by mail-vs1-xe31.google.com with SMTP id k67so4315502vsk.2;
 Thu, 10 Nov 2022 21:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nNUvZzjb2uOhPtX++Yg4Zw8QeEN21wgTb01S1CTt2xU=;
 b=Gex8E3RbpMuTPVZhGoiLwJJYNqzHihOLNf5sCkGdxzsXpRmU5je/RDQdskp+A8oHs5
 o28uBUVq95XHldgQ+ZAJJ1AFZbQLWK08/xsaWu83HMz2CmAoIEGnUGm6vxfPmJN0HMVS
 qSDjH1VBqat8xZe4iIBE2f7J6RfIXQQdD63ZqyyAw41x2jOvyv6WTUVsLU3+cfdfN3mp
 8rgbQxtrlUu9y8y93fYsTYokcLoYc0Ip64W4KNCd7SSQTnu07EY2/ECvbcTY21efDAHY
 rb6zJgNdvm9JtezG/tCy/eGYtKTUnxfJDtmxiCRUjz7mYpA6/8UkFbumDuMWkNSnJbx9
 TaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nNUvZzjb2uOhPtX++Yg4Zw8QeEN21wgTb01S1CTt2xU=;
 b=CbSj5X+H/Rp9Cxc2eJGHcuLI36fie2UR/OzLBpaMcxdMQQvNgdrr5Bx9AH5cEho8Vc
 B3sLfrTFnDN0xnwuL8iYxg//mGCep6VcNkXTfznswu+5X0OS7myrjIuGSyPUCToFTUxl
 6106ewHiaUJupOldE1vn3owKlu4FVKBb43NVCZGI/9XxcfNtU2Hd9IOP3cfAgdgO9zfI
 xEzxRuBR+S8z2IDq7hyZ6NuCktJKaTFfPGBg0/QwRIq04hncYaAgPYFI9fPYv73wGeEl
 i3YmvYN4pswDY0Sabc4zMB3Mr5JvoK7YZffBKN3dQblC95n7nYB7DnUG2+F1FMP//+f1
 r11g==
X-Gm-Message-State: ANoB5pkjLNYcE5ZiyJD0MPRLvjV1OIBwIcx1G+6rtH40/g0RYKl9kLo1
 snocbPZUCOfZC7UIy5cE5TLkNCfLttGQK7nfn9o=
X-Google-Smtp-Source: AA0mqf52YLUryPyJWQGzr3fmG3c09Oi8Q5G52mvd0ZtHOG9eMTZNig4gLRrEdd5whBHbX9hlKQJdMhpCSHal556uTMY=
X-Received: by 2002:a67:d60d:0:b0:3a6:eec3:b246 with SMTP id
 n13-20020a67d60d000000b003a6eec3b246mr97678vsj.64.1668144769523; Thu, 10 Nov
 2022 21:32:49 -0800 (PST)
MIME-Version: 1.0
References: <20221013062946.7530-1-zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20221013062946.7530-1-zhiwei_liu@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Nov 2022 15:31:00 +1000
Message-ID: <CAKmqyKPXK6Zk8PBzAUz4utLvM+hgKBa4gKDF7MZSm=5vRhrhCw@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] Support native debug icount trigger
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, sergey.matyukevich@syntacore.com, 
 vladimir.isaev@syntacore.com, anatoly.parshintsev@syntacore.com, 
 philipp.tomsich@vrull.eu, zhiwei_liu@c-sky.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe31.google.com
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
X-List-Received-Date: Fri, 11 Nov 2022 05:32:59 -0000

On Thu, Oct 13, 2022 at 4:34 PM LIU Zhiwei <zhiwei_liu@linux.alibaba.com> wrote:
>
> icount trigger set an instruction count. After one instruction retired,
> the count will be decreased by 1. If the count decreased to 0, the icount
> trigger will fire.
>
> icount trigger is needed by single step ptrace system call and the native
> GDB.
>
> In this patch set, change the translation when icount trigger enabled in the
> way that instruction executes one by one. After executing one instruction,
> call a helper function to decrease the count for itrigger.
>
>
> It also provides an accelebrated way. If QEMU executes with -icount parameter,
> itrigger is simulated by a timer with the count in itrigger as the deadline.
>
> Note the count in itrigger will only decrease when the priviledge matches, which
> is also processed in this patch set.
>
>
> After merging this patch set, QEMU will support type2/type6 trigger(needed by
> breakpoint and watchpoint) and icount trigger(needed by single step),
> which is enough for a PoC of native debug.
>
> LIU Zhiwei (4):
>   target/riscv: Add itrigger support when icount is not enabled
>   target/riscv: Add itrigger support when icount is enabled
>   target/riscv: Enable native debug itrigger
>   target/riscv: Add itrigger_enabled field to CPURISCVState

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.h                            |   5 +
>  target/riscv/cpu_helper.c                     |   8 +
>  target/riscv/debug.c                          | 205 ++++++++++++++++++
>  target/riscv/debug.h                          |  13 ++
>  target/riscv/helper.h                         |   2 +
>  .../riscv/insn_trans/trans_privileged.c.inc   |   4 +-
>  target/riscv/insn_trans/trans_rvi.c.inc       |   8 +-
>  target/riscv/insn_trans/trans_rvv.c.inc       |   4 +-
>  target/riscv/machine.c                        |  15 ++
>  target/riscv/translate.c                      |  33 ++-
>  10 files changed, 286 insertions(+), 11 deletions(-)
>
> --
> 2.17.1
>
>

