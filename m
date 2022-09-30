Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oeC3a-0005px-3n
	for mharc-qemu-riscv@gnu.org; Fri, 30 Sep 2022 05:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oeC3Y-0005mf-QW; Fri, 30 Sep 2022 05:11:40 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:38578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oeC3X-0003tf-FJ; Fri, 30 Sep 2022 05:11:40 -0400
Received: by mail-qk1-x731.google.com with SMTP id 3so2436078qka.5;
 Fri, 30 Sep 2022 02:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ioxSjXzaBcEi2Dy3qDV/fFxplYaUVKP4gq2QQ/TkMy0=;
 b=gG8l/RmroZgD/xloEgbHuSe3vzUrR4KrIg8BtOIhVojWHwbsv6X7KWEPBSwt6dd8Of
 FGBCNJrKWUE+/06zoUgSXzhJ9ltRsaKaXJSEUo4vowt8uzbBwMBf9JX9b0Zh9+WIEUas
 KRaqCjKJBPCgmAIYwPTO8+6yVK9Sp9mUteePHMgMI8Bje0k8SUmM9oz2OiQ2hdtp9wKI
 bJQikqfujOz5FiEXgv3kkT+KxxvKrKCN9K2fxJUFelmBkk0HRLcI26FHNRzj1ZqygDjj
 2ydFf+HxE3Bjh2b5ydl41bshK0zITInTarzScxskG5Pe7DymwMEGtm5cuXxygCOPRiDm
 lO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ioxSjXzaBcEi2Dy3qDV/fFxplYaUVKP4gq2QQ/TkMy0=;
 b=C8Xo1FvbKOuM768KrvrlrNPBYooqcQSQxcg0subgsYQ+p7GGMWyFxxOnTu4b/0zPN5
 D4lOZjwbZro/NfL3Kw+q3K/XNi81YxKLWkq3ggaaWDOV/QjI48EpOtrl8wEFrDcdTdVc
 VG7Tlj+ADb5st2Q68OP+xB41PilPtR9newCcuYI8i/OJwuJuTvRYL6tbPRU3Qlk0OKUM
 5+60oglxING1mFXy7LsdX3qUsfYkm1fte78T2mngc2bOiqRmAVQo9Ut5k172hWaEXoXg
 v+DpKcEk0WxbObjPMowUVPyaiFwLN9z8IiP/RLK/tcIcPJwKLicik20jprmOAGr207+Z
 YdLQ==
X-Gm-Message-State: ACrzQf2ZtAa4iv0i1mFbo5Kza8U3LcZ49DYorUxc71tv8MhDLfEj8ETD
 MOZPcLo93irdOInmB4827JN5II4FFkk6JUe4CX6xh8G4
X-Google-Smtp-Source: AMsMyM6DZCEdsOY72Y6eBqxCkzfnZpE7ft9kQeNDyQruAV0XfIsUofENLvL9FbGg/j6+cSoYllyEbGgQc8cnNP5RDBw=
X-Received: by 2002:a05:620a:19a5:b0:6cf:4a24:cccb with SMTP id
 bm37-20020a05620a19a500b006cf4a24cccbmr5180539qkb.376.1664529097516; Fri, 30
 Sep 2022 02:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220929232339.372813-1-Jason@zx2c4.com>
 <20220929232339.372813-3-Jason@zx2c4.com>
In-Reply-To: <20220929232339.372813-3-Jason@zx2c4.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 30 Sep 2022 17:11:26 +0800
Message-ID: <CAEUhbmUc5D9qsBgvymRcXo+ggHQXaggD0XkfmuvGsH79m2-XOA@mail.gmail.com>
Subject: Re: [PATCH 3/6] riscv: re-randomize rng-seed on reboot
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x731.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 30 Sep 2022 09:11:41 -0000

On Fri, Sep 30, 2022 at 7:24 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> When the system reboots, the rng-seed that the FDT has should be
> re-randomized, so that the new boot gets a new seed. Since the FDT is in
> the ROM region at this point, we add a hook right after the ROM has been
> added, so that we have a pointer to that copy of the FDT.
>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: Bin Meng <bin.meng@windriver.com>
> Cc: qemu-riscv@nongnu.org
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  hw/riscv/boot.c | 3 +++
>  1 file changed, 3 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

