Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1obaba-0004lf-If
	for mharc-qemu-riscv@gnu.org; Fri, 23 Sep 2022 00:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1obab3-0004ja-4N; Fri, 23 Sep 2022 00:47:34 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1obab1-0007ye-Fd; Fri, 23 Sep 2022 00:47:28 -0400
Received: by mail-pl1-x62f.google.com with SMTP id t3so10742337ply.2;
 Thu, 22 Sep 2022 21:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=MW5pYUnLE1OgAfclDBsAQ5YA2yJBAmj/PGJYBHN2+K4=;
 b=TSWr6wKOI5eyLlPAxdT3zukrlAdDjUK9i+B75MAMoe/bqRDSxM5sMJeaR4oRQeXryx
 7ZQnW58OFwmPlBxtt+t2e4CRKIbUYIk7DlawwTgMED6rgk2t9UqOXvzZ6MzhXMPrGrNd
 fmVoTxE/XGHLUB2bUDlCcCNjfsMlJW6Qa4whVhgjGG5wWBLY0eyOzadlEkO07Z/+H2LQ
 i3U0lALXGfJkwL8vT+ut40Vp9TLPwkXjRvKehqoNAUVRKj4ssd/UQVoLU/SAYdvfIiBL
 doFwC8goR02DqEKeOYEnQ7ykZek8M5TrUshJUeVsiSTJJDqdmWOxoSXEUrv4PzbUcXlo
 4sog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=MW5pYUnLE1OgAfclDBsAQ5YA2yJBAmj/PGJYBHN2+K4=;
 b=0/o8SItdD/ORIoM/w2VolmsZiaW1S4HzWZRhO0XPmDU+e45eIlZH7GhFtxRtMSxkmV
 WP4M58d5XAaitDYwlhRA3XE3GCz26FxqulAvMI5pmGlnl2gg0ZC/W8jqNqN4qe/rpl/G
 +ZjPpOtLQwV13R2iv94JjUY1H+OX4CZ55CAXwDZefSWjeS0KsFD2TP97Ut/sM1V9dvvR
 ONG+6a+fp2FESWN+xjCrbMMcErYYG1/jbaSnc53CHHtn5c1QJkALO9b0n9nRs3sKpt6+
 9EVAOajOMARApQpgRD2SOjjeHrsVlx8/n8DvdRNCBuS/Xe19TekfkM71Hj9Cv63yST9L
 d/9w==
X-Gm-Message-State: ACrzQf3AV3wMZihNNftn3/aw/gU3bXf70564Ele5XwOEtdaWMPQULsw4
 OFRgdGz+dWHSrg+iNVY8zaIQdYG9+PXtZ4sI0G0=
X-Google-Smtp-Source: AMsMyM6WAx6W723VIILtdSOfmaT/0fg8VMgvSg1WotVdRehR6kCoQZ3WyVztIM2ItmAfahUUIcpCygyvFY2L9xQGPKw=
X-Received: by 2002:a17:902:f7ca:b0:178:9c90:b010 with SMTP id
 h10-20020a170902f7ca00b001789c90b010mr6588470plw.149.1663908445835; Thu, 22
 Sep 2022 21:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220909134215.1843865-1-bmeng.cn@gmail.com>
In-Reply-To: <20220909134215.1843865-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Sep 2022 14:46:59 +1000
Message-ID: <CAKmqyKOdRaHDO2wQznzzXF0MJofdyxmPbHOTWzq6a9e9Ea7S-g@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] target/riscv: Improve RISC-V Debug support
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62f.google.com
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
X-List-Received-Date: Fri, 23 Sep 2022 04:47:49 -0000

On Fri, Sep 9, 2022 at 11:48 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> This patchset refactors RISC-V Debug support to allow more types of
> triggers to be extended.
>
> The initial support of type 6 trigger, which is similar to type 2
> trigger with additional functionality, is also introduced in this
> patchset.
>
> This is a v2 respin of previous patch originally done by Frank Chang
> at SiFive. I've incorperated my review comments in v2 and rebased
> against QEMU mainline.
>
> Changes in v2:
> - fixed MXL_RV128 case
> - moved macros to patch#2
> - added log guest errors for TRIGGER_TYPE_{NO_EXIST,UNAVAIL}
> - moved RV{32,64}_DATA_MASK definition to this patch
> - add handling of the DBG_ACTION_NONE case in do_trigger_action()
> - drop patch: "target/riscv: debug: Return 0 if previous value written to tselect >= number of triggers"
>
> Frank Chang (8):
>   target/riscv: debug: Determine the trigger type from tdata1.type
>   target/riscv: debug: Introduce build_tdata1() to build tdata1 register
>     content
>   target/riscv: debug: Introduce tdata1, tdata2, and tdata3 CSRs
>   target/riscv: debug: Restrict the range of tselect value can be
>     written
>   target/riscv: debug: Introduce tinfo CSR
>   target/riscv: debug: Create common trigger actions function
>   target/riscv: debug: Check VU/VS modes for type 2 trigger
>   target/riscv: debug: Add initial support of type 6 trigger

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.h      |   6 +-
>  target/riscv/cpu_bits.h |   1 +
>  target/riscv/debug.h    |  55 +++--
>  target/riscv/csr.c      |  10 +-
>  target/riscv/debug.c    | 484 ++++++++++++++++++++++++++++++++--------
>  target/riscv/machine.c  |  20 +-
>  6 files changed, 445 insertions(+), 131 deletions(-)
>
> --
> 2.34.1
>
>

