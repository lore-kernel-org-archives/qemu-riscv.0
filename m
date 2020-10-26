Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kWyIO-0001fk-9a
	for mharc-qemu-riscv@gnu.org; Mon, 26 Oct 2020 04:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kWyIM-0001eI-2q; Mon, 26 Oct 2020 04:56:02 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:42866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kWyIK-0005cT-El; Mon, 26 Oct 2020 04:56:01 -0400
Received: by mail-yb1-xb42.google.com with SMTP id a12so6989876ybg.9;
 Mon, 26 Oct 2020 01:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ffP36bbc8FKLvuMSZD24VoF8QXsW+nchsBVkwp1EyKk=;
 b=SLUWBtC0CdSOMOylOClKDtbHpDspkDKV/8uB6aM9k2sPnV7M6OtgXasp8IEcVJCqwP
 QbjLfuQp7j+gWs98fyJfoCTg9Ia8gjS9NX4ExOVWzjyEcRgob6gL2Ic+p4iswOiSrsfG
 LF1kQ+N6hv2sW2gM4miyBPxgONSXUmJl64j4kxXDJ95helJJuw4mEAQGGPNyUA1QNYIA
 5wxbcxzE5/3dsUA07tEVjcMw4qoPZaEFvsi9CMWetytrMxQQUcpo0b2mmlbQXVC8NubY
 dWll4G93LuEgPF0S4wPy5PrmP561424U/D3/zd070zDFKMlbiYU82HQlFDoVPYZMPQ6d
 O2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ffP36bbc8FKLvuMSZD24VoF8QXsW+nchsBVkwp1EyKk=;
 b=lQj1z5JqdqGsOeFbL8IvMt0KyQ49zCPOi3cwQb8XvLH2EslmueNLhJyDnINT0GXSze
 oCJzuL2WNLgbvpp54sX+3vgyjELDqwFxnPvq9HZkJHccN0KR9mV+ziZEg2ZQkqv9aVRo
 yY4pUieaT/ja1Om9/6QsZMkAmolojqcO4Rku4iofHm67f3rSQcCb1yC5hahlnst6NJYH
 TItEscZ9w7zBihKze8lCLN3TivdZb1qEleLWh1b4O5HyVu8kMlDlSlFXXKgBOde1fNo/
 MAwaP5qH58S2WRAddo4GtgQ2isiIICkBhJ8d1U+QmuGM01zAR1iMggBuvu2BGhpeyZy+
 HjvQ==
X-Gm-Message-State: AOAM532RsDaSlD/JV/QS/wU5vW/yBZ1sYzlTjdTVZSZU6Bim7S2OGcD/
 fSo+fqdzRjxFkjjiFs+sH6NubXKz3QW7bsiD1IA=
X-Google-Smtp-Source: ABdhPJz7qJkMYLV3/OIPQU5FBv656x539Br3ef/gLsibQ33HFM8rxY4gH51IKZAmgUb7flsU7AUFg9R/pM43S1+otPc=
X-Received: by 2002:a25:f81e:: with SMTP id u30mr21673150ybd.332.1603702559371; 
 Mon, 26 Oct 2020 01:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1603467169.git.alistair.francis@wdc.com>
 <2f7f2621dda197492b848fcf186f1cb6fb3eb53d.1603467169.git.alistair.francis@wdc.com>
In-Reply-To: <2f7f2621dda197492b848fcf186f1cb6fb3eb53d.1603467169.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 26 Oct 2020 16:55:48 +0800
Message-ID: <CAEUhbmUkxc5yMA8ZmsDHMr6GXRvfVfYp8SZ-cywFTF-UGuKH8Q@mail.gmail.com>
Subject: Re: [PATCH v1 02/16] riscv: spike: Remove target macro conditionals
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b42;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Mon, 26 Oct 2020 08:56:02 -0000

On Fri, Oct 23, 2020 at 11:44 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/riscv/spike.h | 6 ------
>  hw/riscv/spike.c         | 2 +-
>  2 files changed, 1 insertion(+), 7 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>

