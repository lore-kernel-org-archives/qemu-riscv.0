Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o1SNY-0003Q4-JY
	for mharc-qemu-riscv@gnu.org; Wed, 15 Jun 2022 08:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o1SNU-0003Ov-7W; Wed, 15 Jun 2022 08:44:09 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:41486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o1SNS-0004m3-PR; Wed, 15 Jun 2022 08:44:07 -0400
Received: by mail-qk1-x72e.google.com with SMTP id d128so8597263qkg.8;
 Wed, 15 Jun 2022 05:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=56HZdKnOrtImWFI4JC3pFKpVEFCXvWmM6vOwPDX+66Q=;
 b=PTQTqQHs9HnZVw2RCcNQPkKPLdus2UxFqrUKEObxaxf90D8pCbHtRwCo4ZbR4T6Q+O
 HVsW6LhDFEPlsMbNFnFliRfny3wO4HJySiLxkCMgMbY+g1LmLPcMtMbB+kRySe5uodLu
 18QOnxnyHD6LDZO6woUJq2Gxe2+fin/IDSNXas3Ngrb+/H4L7HrM4ZGn1AEghCEbFk0K
 ay7Q3rh86lU1p9mlktwEFICdPHuxxWqnm7Tl81zQqBFbvJ/Yos0PMTgf3zwpVeLDG/LN
 njmH2LY8LILT+0+uECqEcbzWpgmDVg2hxYi0gq/2/SVpZ4Jo2lYlJrdcadTABk3Uems0
 PjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=56HZdKnOrtImWFI4JC3pFKpVEFCXvWmM6vOwPDX+66Q=;
 b=UYTt7xaKLQrdOxHHmHGYLqiUaRcmrsL5t0ahW5u3vrLB6Ze0RvTNR13ns4lMGTnGLA
 eILZwzJU/VgtK1/CkmzHsf8BYJwVmqSmmMsDPHKV8xk5LBPB4Wo1MeWCHhv+QqnWkhqq
 ZhDdXxKgcXFzm/cRId9SJBVrKi29aG3wsGYuMXVwoRLOfRl6WCQqYyagIsECskE+QGkb
 B65bLwu/vsF/lWpUfq6nOx4X6WyT352YK7eL+rUwqX0mzav46IBkQ95wUDxW6gybkEiZ
 XzND1T+626IXgreepKGxzhaCxUcDW0XN+nsFn6+8KJgmSMdGtaEkYsN+S0ZhtdG8+iw2
 5oTA==
X-Gm-Message-State: AOAM5330bJeRYbloNT4U4ivoph8i4R5KcJkXKne3Uxp91NjrnZ0IFsBu
 U0Gt3xfO2JkvgqmAYTxROlxpitGjlM7PdtEFayTAmzqhhR0=
X-Google-Smtp-Source: ABdhPJzHmtrWlfrF/WcwQY5Abe1m8ykw4iBK5aUGlzerTt3WZSHaO2skK/y4+oUBxFljB72Jvan2p9OxlpGYxrCMSxo=
X-Received: by 2002:a05:620a:683:b0:6a6:93aa:8559 with SMTP id
 f3-20020a05620a068300b006a693aa8559mr8052829qkh.94.1655297045377; Wed, 15 Jun
 2022 05:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220610051328.7078-1-frank.chang@sifive.com>
 <20220610051328.7078-8-frank.chang@sifive.com>
In-Reply-To: <20220610051328.7078-8-frank.chang@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 15 Jun 2022 20:43:54 +0800
Message-ID: <CAEUhbmV7aom2Y6ZGs4hsv2MGbAX_uc10_YzChvcGoF0Qg0-h3A@mail.gmail.com>
Subject: Re: [PATCH 7/9] target/riscv: debug: Check VU/VS modes for type 2
 trigger
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72e.google.com
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
X-List-Received-Date: Wed, 15 Jun 2022 12:44:10 -0000

On Fri, Jun 10, 2022 at 1:25 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Type 2 trigger cannot be fired in VU/VS modes.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/debug.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

