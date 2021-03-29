Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lQm86-0006QE-Lg
	for mharc-qemu-riscv@gnu.org; Mon, 29 Mar 2021 03:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lQm85-0006Pz-UK; Mon, 29 Mar 2021 03:16:05 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:35383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lQm83-00045P-0G; Mon, 29 Mar 2021 03:16:05 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id m132so12782747ybf.2;
 Mon, 29 Mar 2021 00:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MBTE2ln4BgbbXqrkGLEvSfJ8/X1gKcz4yAqlCLSGJdc=;
 b=Mfg8bhNxbpbyyHMlTAjG7orNYp6llaCsY9DtH7DXB/BXjZ+2zjrYJu4PqS51iRGBz8
 Q0pp3MptxEmvlxi2nKN2B+ghge2kDScwRTOBTRW+sQUaOKaI8dx+fbqrZ4RVMQ+U2mPq
 Y/HoEr7/mqLWWXtQICi1yN3E1Nog3yw9HM5iA7551y+f5ksWVlfuyVLwdT2Zgd/X9CGg
 Yc8ZuHqiujEfDoUPC6MhRZGCBScnJmOjNEGzYSID5X2Y7+83IwebbUEYzmly7DdG414W
 cs7u4MKZysZdwTU0wJTBWHhFUVU1cDlCR98YVcx1pxtv4YFfwFsuCKROR1Z2ZSupcNdj
 8hqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MBTE2ln4BgbbXqrkGLEvSfJ8/X1gKcz4yAqlCLSGJdc=;
 b=VbQtzwSqX3lIGvmVEUO+xSALiSD/MQF40iHwJAEzRZ+XmZc6Im1QszIr2ddtX2S0NO
 56ye/dZsp8OM5x26wXpCIq7eTmZodC3JJF+ogZ1EvK12ZshsRZJBk7ERejIIq4cRB38K
 YB+ImhtjEzhPXMCao7Ba5C6KUaGsVLR5unSV3DYPAhfZ3wsBJBz6Q3l68PARS58hmqyb
 ggEl8NJ8/RSa3V6q7pvD2vc9lq+J21uR0XSH+8ltoDilXDghxHNeiSyYMIrHUPO7K3vY
 plQjLAyPGXihaKx7lku1GTW3L9BLnfByHXaEMnLuxZ3/fFQo+nlTX6Ot3S2EBFrzmnaV
 YlOw==
X-Gm-Message-State: AOAM533PX16M3dTrkV6iSwuk/Eu5U3s0TVz7XNQ0/Q5IRMsTmV8dEfUj
 YXcrwz1GYWMZNCs0bJRxrbcASrcA0YjaVzKG87c=
X-Google-Smtp-Source: ABdhPJzTWUN5bs55UW6Yc5nogJsfvXQK+b7r73k7f53B9PZ2y4Bzey+hzzIMSjBgmcdxkLJM3WyKLE2iJhi+R/xkJqs=
X-Received: by 2002:a25:d645:: with SMTP id n66mr35775675ybg.122.1617002161344; 
 Mon, 29 Mar 2021 00:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210329034801.22667-1-dylan@andestech.com>
In-Reply-To: <20210329034801.22667-1-dylan@andestech.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 29 Mar 2021 15:15:50 +0800
Message-ID: <CAEUhbmVvmWLALMe1W_wZBHX9NyKh8C1VXp2gy9fvcoHXV53gmA@mail.gmail.com>
Subject: Re: [PATCH V5] target/riscv: Align the data type of reset vector
 address
To: Dylan Jhong <dylan@andestech.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, x5710999x@gmail.com,
 Alan Kao <alankao@andestech.com>, 
 "Ruinland Chuan-Tzu Tsa(((((((((()" <ruinland@andestech.com>,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
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
X-List-Received-Date: Mon, 29 Mar 2021 07:16:06 -0000

On Mon, Mar 29, 2021 at 11:48 AM Dylan Jhong <dylan@andestech.com> wrote:
>
> Use target_ulong to instead of uint64_t on reset vector address
> to adapt on both 32/64 machine.
>
> Signed-off-by: Dylan Jhong <dylan@andestech.com>
> Signed-off-by: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
> ---
>  target/riscv/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

