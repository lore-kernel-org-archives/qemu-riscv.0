Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pF1CU-0005yI-4h
	for mharc-qemu-riscv@gnu.org; Mon, 09 Jan 2023 18:05:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pF1CH-0005pV-SW; Mon, 09 Jan 2023 18:04:54 -0500
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pF1CG-0002py-5G; Mon, 09 Jan 2023 18:04:53 -0500
Received: by mail-vk1-xa30.google.com with SMTP id l3so1675440vkk.11;
 Mon, 09 Jan 2023 15:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+g3bu0AyXYGFdZfnwd/uiFeLwF7AJudu1avLJa6+/9Q=;
 b=MNlyLDXCUVs1s+9HSpAOeUrgSdUoH+iWD05nPYiX/XOWOuq/ERIX8KN0dFkX5rt2O7
 MKSHjxl1oiFAFnA5uKEJW7RlVbcom1xpz9ZvFYBAnud5lgyF9v2Vv4s2uR3qanI+J2NK
 W5OAZvWnljDE8BWUX1YpOqeJ4xeYxwdLMnfThI1Lv/R5Nk+HQz2+VRI4gXqWKA2nB2mR
 gjq9+R3FDWibsmW4/0OaCeWpSws4L+mPIOHTMSjiuNCTnimMPzAUDzzIXeuW/JbjVr1O
 8odjoXmLtP7KMFW6B9qrJEgY6+Ir2opmXKyZ/zH/o2R56Mo9Rciri18/WWbJxRX4tcF4
 hMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+g3bu0AyXYGFdZfnwd/uiFeLwF7AJudu1avLJa6+/9Q=;
 b=Q2Hs5WOby7T8WR/Q10HDWcSdTEftbsS9e4AGvTN/NlE8qoF4da/OUQ3eCMmYOUJxW9
 1uDHGsAecy0j62vYFeu7HUAyjpRFVtTf13lyH89lUkE5m4Vkl9rkD+1IfDRyffJIbUxX
 t/akqU4bhAIY2o4E+tRCHgMjkeDiGfZm8/HFTtn9f30eB+KRJyDz5abbHqSGcm5di5b+
 bSggnt2/pfC0ZMJDfLNoR4egRJpS+k1nSy2osY1RCG3qN13RHb3B7Bg+s57jeKorCAnv
 zwu2nF6pUuhSozYLD4oV6vZuI+J+hA90bz0tieVtWg5CM8TwJ8TiXUbl23Bjw/FsFUVr
 Prag==
X-Gm-Message-State: AFqh2kq6BXi5FmSJkNGVV+z2P0omplKC0ZLYN+85FirCB36avpCUuKBT
 g1BSEsrtUDxTsgcDvG12QPFVKdvx2Utzfo8/0/I=
X-Google-Smtp-Source: AMrXdXspl9qn20ncZyBj2YMupkfO7gMdfDLdZ1tw0e2jcOodnmHJXZ8OdlV9jiWBtloCH8GBJlXc0iWFvY7wuQ1n97E=
X-Received: by 2002:ac5:ccdb:0:b0:3b7:cbb8:bbf1 with SMTP id
 j27-20020ac5ccdb000000b003b7cbb8bbf1mr8432342vkn.25.1673305485759; Mon, 09
 Jan 2023 15:04:45 -0800 (PST)
MIME-Version: 1.0
References: <167236721596.15277.2653405273227256289-0@git.sr.ht>
In-Reply-To: <167236721596.15277.2653405273227256289-0@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 10 Jan 2023 09:04:19 +1000
Message-ID: <CAKmqyKPoPnVaY4qZwxyc6dPRuYmWYj7wxX+ubiEF4uewiztACw@mail.gmail.com>
Subject: Re: [PATCH qemu] target/riscv/cpu.c: Fix elen check
To: "~elta" <503386372@qq.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, 
 Dongxue Zhang <elta.era@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa30.google.com
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
X-List-Received-Date: Mon, 09 Jan 2023 23:04:55 -0000

On Fri, Dec 30, 2022 at 12:26 PM ~elta <elta@git.sr.ht> wrote:
>
> From: Dongxue Zhang <elta.era@gmail.com>
>
> Should be cpu->cfg.elen in range [8, 64].
>
> Signed-off-by: Dongxue Zhang <elta.era@gmail.com>
> Reviewed-by: LIU Zhiwei <zhiwe_liu@linux.alibaba.com>
> Message-ID: <bcdd7992-e3ff-de17-22c4-1319e3816e8b@linux.alibaba.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Message-ID: <CANzO1D0du4TSza=-bnqZ+N9cGVfZ6P4xwYaiJg6doTzo7_MdYg@mail.gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6fe176e483..5dc51f7912 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -872,7 +872,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>                          "Vector extension ELEN must be power of 2");
>                  return;
>              }
> -            if (cpu->cfg.elen > 64 || cpu->cfg.vlen < 8) {
> +            if (cpu->cfg.elen > 64 || cpu->cfg.elen < 8) {
>                  error_setg(errp,
>                          "Vector extension implementation only supports ELEN "
>                          "in the range [8, 64]");
> --
> 2.34.5

