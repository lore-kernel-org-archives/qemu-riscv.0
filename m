Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kuWuz-0007jP-72
	for mharc-qemu-riscv@gnu.org; Wed, 30 Dec 2020 03:33:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuWus-0007ha-Mj; Wed, 30 Dec 2020 03:33:10 -0500
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:35956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kuWur-0007iZ-7K; Wed, 30 Dec 2020 03:33:10 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id y4so14348468ybn.3;
 Wed, 30 Dec 2020 00:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WlNQKK08dGVsjYSRErxI4Uebj8KVoXRsIubaR1sFPkQ=;
 b=C5WhHp5ynC3v5xfE6Nz5nNhiH3HHRasjgCRp+VzzYz+JjosopN+Os+Yyre8x1d9Wrr
 zt3Ts7hKF26a6SXxLbtvkmoQNl8ttUtsbbb+Ym9yHwPKOvfRUwNZCsOMBO8psHj5EdWP
 QIf1H9wm772zHrjZ5d+mBiRM1+JUmYNGxjwC4av3J4hMXbgYIVJVPr1xMpGUAglXzMsN
 bowUb9LWk4DWEZRZwgJrgjU/uf7cI73wcwGv8Bs7/CoEv9SzOoY7BveR0GLdQrn50fUi
 FEmz+mTViNJ2Eo2YX85kidVCvUiQJFwxONsFfVvjP0t2hKJ4jO04JKXFUOq9GkFLPocN
 7j7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WlNQKK08dGVsjYSRErxI4Uebj8KVoXRsIubaR1sFPkQ=;
 b=mU3VihvRQd9g6uUnIEFYmQToAPUg3IxAvAb379g/8fd3zZN1yT690OW/WOPQ1M8Tv3
 MR/atEhCPOWohLmT8Qivwu65OHYEpS8eQtHbD2jdT9sA+CDlm7GwULhWgyNzi1LAr5cc
 WNKICQy8AbNaVS4O03Q/niWkOWpez/7RLkkX898V96jSBYGMz1pHNcpBnpD0l77U5yBP
 meV6o1NvyG9LrARNxovORaIaSzbSR1C4yw0gNmH1uLdUkrcnHvX4XePHX6Rl1WrBGu7l
 Xgz+73IRFR3hH8SVVw7fH9lDxNu9bn3uSRIOXSfCDe103p6HWLe6KVDLm5o0F/eAFEuR
 Hx/g==
X-Gm-Message-State: AOAM532aLAAKI06kXSxBqS1ixaaztTIXq5LFAVWHwBdlv3sPCEPzm0Ha
 9mJJLS5esucuu9c+MWPYVDscbYjJf9rV5RvB1JU=
X-Google-Smtp-Source: ABdhPJwPkOVCbbBCZyoF8zjuwaFdC4Je4riJjrcNG6bek05shoW1nO/wz5MLdGz/acjTtcSf4SOy8xZx5/IWWYttE8U=
X-Received: by 2002:a25:e70e:: with SMTP id e14mr16651127ybh.332.1609317188023; 
 Wed, 30 Dec 2020 00:33:08 -0800 (PST)
MIME-Version: 1.0
References: <CAOkUe-BGMmUTtY8bdTgi2Vrmq-pL2O36bY_kmE5rfbv0SQTJmA@mail.gmail.com>
In-Reply-To: <CAOkUe-BGMmUTtY8bdTgi2Vrmq-pL2O36bY_kmE5rfbv0SQTJmA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 30 Dec 2020 16:32:57 +0800
Message-ID: <CAEUhbmUL6jvbhOtrq0uLWCFu04rxG2mMpcjZKfQKW3X1S=C+0g@mail.gmail.com>
Subject: Re: [PATCH v2] gdb: riscv: Add target description
To: Sylvain Pelissier <sylvain.pelissier@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
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
X-List-Received-Date: Wed, 30 Dec 2020 08:33:11 -0000

On Wed, Dec 30, 2020 at 4:25 PM Sylvain Pelissier
<sylvain.pelissier@gmail.com> wrote:
>
> Target description is not currently implemented in RISC-V architecture. Thus GDB won't set it properly when attached. The patch implements the target description response.
>
> Signed-off-by: Sylvain Pelissier <sylvain.pelissier@gmail.com>
> ---
>  target/riscv/cpu.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>

