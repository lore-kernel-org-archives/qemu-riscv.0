Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1leQDI-0003kr-Jg
	for mharc-qemu-riscv@gnu.org; Wed, 05 May 2021 18:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1leQDF-0003kY-1E; Wed, 05 May 2021 18:41:49 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:46051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1leQDC-000839-RD; Wed, 05 May 2021 18:41:48 -0400
Received: by mail-il1-x12a.google.com with SMTP id e14so3099211ils.12;
 Wed, 05 May 2021 15:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UNFSq16nUa0on0+z/3j8UGnHeMA8Oxdl3wOWlAGPJgU=;
 b=c9LEdTnaEDxbKeJdDXyZxr2BkJVPWo/yjLraJbt70LzQMlnuXPB/HqZiV6oMQbHmCB
 wXqh9YS/FUuT3YA9GAZ80BOTC10f6RGZS1UdJzbp6KNrWvzBWX4kN/DL5S48HZGqaVdn
 tVZhpyjbMlI6bcD0lKm7bUWemiqExVD3h3ACK96ipq0HnVK6uziPwEwxAFpjIUZJkd0M
 411YlIqLtM3OFspfa8bA6hvNoEQC92Ypj/zkTi8HBX3dShVe1KGF13fpkUOrTPq/Yty3
 oE7W7NQjwHCTQ9jrTQw8/o4YMfdpfkZ8Zbk0rQ5N0/1IrMcEUbcWFL8FZwEmOo3bg1Ql
 SThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UNFSq16nUa0on0+z/3j8UGnHeMA8Oxdl3wOWlAGPJgU=;
 b=SaYeszIG+Jz2cKFudIMS/qQLUm1PvCQFuo+Oa1ZB1adK/9/3pbdZbSVeSv+aXS3mUv
 F3NKtkqfVEZHxfT4KN1trY5BN8ss1cZFMbMiBL93NthhhKSd41J05YSZBT2r/VGyFd+p
 cZXq3P78xXboGRRlnDUyhWdt1b9RsWAaCxAISq7mCO8SpnK5c4wBh9RKGwltt7cNI6O9
 0OhipOki5wqumKLFkdN0/Ipe6LXijiUA/BUBE05ny6K4+h7BcdCZxX8pRo+UZS3L/0A0
 6Bl2PPdYNUyZz/sQf70W3K9BKPJw4A29lj0kRkE+fof6d/1xqSK4RlfYpf13RRXV1Mqw
 HeDA==
X-Gm-Message-State: AOAM530BK+40i7pLMawj4tCRXjtt1Z7zNB+1q+246jkKIHMto/raiMC5
 JmsOwovU0cBqoHldi0VqAkb0vY46RO+ZyRUU9iY=
X-Google-Smtp-Source: ABdhPJwJ2t0cRPb6c4pmhdzeRQV+WC1FXCKDKwq40Qrs0EcGlBby5b4YnBaAE+E7D22+CeHEw4f3mMVeekXwpY/ETeI=
X-Received: by 2002:a05:6e02:671:: with SMTP id
 l17mr1149288ilt.267.1620254502252; 
 Wed, 05 May 2021 15:41:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210430070534.1487242-1-bmeng.cn@gmail.com>
In-Reply-To: <20210430070534.1487242-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 May 2021 08:41:16 +1000
Message-ID: <CAKmqyKPyV1Nm_a9jatzsGG=8PRQXB=V4=n65seCTyDcr4hndjg@mail.gmail.com>
Subject: Re: [PATCH] docs/system: riscv: Include shakti_c machine documentation
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
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
X-List-Received-Date: Wed, 05 May 2021 22:41:50 -0000

On Fri, Apr 30, 2021 at 5:08 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> shakti_c machine documentation was missed in the riscv target doc.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  docs/system/target-riscv.rst | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
> index 8d5946fbbb..4b3c78382c 100644
> --- a/docs/system/target-riscv.rst
> +++ b/docs/system/target-riscv.rst
> @@ -67,6 +67,7 @@ undocumented; you can get a complete list by running
>     :maxdepth: 1
>
>     riscv/microchip-icicle-kit
> +   riscv/shakti-c
>     riscv/sifive_u
>
>  RISC-V CPU features
> --
> 2.25.1
>
>

