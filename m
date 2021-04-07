Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lU96r-0003vk-DS
	for mharc-qemu-riscv@gnu.org; Wed, 07 Apr 2021 10:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lU96n-0003t6-TG; Wed, 07 Apr 2021 10:24:41 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:45020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lU96l-0008Mu-Qj; Wed, 07 Apr 2021 10:24:41 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id j206so11694921ybj.11;
 Wed, 07 Apr 2021 07:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iFaqjRvMA2GttUCQ/Y+2CQe4b4GAeBCsmahPte5h26c=;
 b=VDnqG2ZM2pdWnlGYPKcYVIolvp8+uUoE9mjv9DrPpOSv6qon0nsKfEOpK37i28gKwK
 RMT0xmK0bcODfDG2VfYPvpcq4XmgkhlwcOoHZq9ynxuD2IlnQdEiieWklv6ABJ0wXdnK
 ZC91S/aVKzmEgGpzpL6V3Jslrs5zG9T8WZCfdDmor92jXNhhdUmNeXTeed5VJgYda7N7
 mlsDmYxLE2ZuYYg1USZiMM3vB39uUe/d0KMuaeAdWs+2a+X4nLHDD4C1pyyiznHiqwug
 foGoCdh3+fU3Pav4L145c2phJMGWjDywKOeB2BfiIMBmfFCjSLDpr6FOvACmOBe3Ozd/
 5AVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iFaqjRvMA2GttUCQ/Y+2CQe4b4GAeBCsmahPte5h26c=;
 b=sTLmDrHFo3j+c2Kw6Ut6Ag//nc1X1XJLFpm7w0XkGao4eGCdCmJKrJbUKSkQ5NRIIh
 M3p1Ztnuw/MqhjNX1W6hbWYsahAF0H5IfxFGXLZpU8tq7jC3gHl7Fk/SKdxbGKzebDcu
 lU6AFytkq4hCf+t7qLpqFlIfb2hpbkpTGDsoifW8dtsVRAtRUSW10DahRFQmF7kL0OjC
 j3eqOhCWXTgZMztp7F9uzDOIM8nsQTB9uixezhjJ7RmbFyUoKNz8zqNj1unz/RxLUkpu
 ZcHCyIUYPNNmDkGI/v3ShA0jiPEmrHePhfhP5+Yd4Qy8NtQ9SphfeZDyIT6NGTlwWtXe
 LshQ==
X-Gm-Message-State: AOAM531UEn168sdLkxRrlcGT9hVDOiX5Cc3BYiZSpyFv0QRgArImsg6x
 QBwFBzpZitRjjV8KhsIevoC/8kiK26cZVHweKZU=
X-Google-Smtp-Source: ABdhPJzdxtqdYit4lvUSUXoNkFlOk7gSaYfuyLu7THFsdPfwySVNZdVXr5Yc8v83OoYwQt3MKC1HHLSxw7B9ZK0GNEM=
X-Received: by 2002:a25:4154:: with SMTP id o81mr5068542yba.239.1617805478410; 
 Wed, 07 Apr 2021 07:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617367533.git.alistair.francis@wdc.com>
 <5c59f6a40a5bdff35c086f35665e97de5b872c64.1617367533.git.alistair.francis@wdc.com>
In-Reply-To: <5c59f6a40a5bdff35c086f35665e97de5b872c64.1617367533.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 7 Apr 2021 22:24:27 +0800
Message-ID: <CAEUhbmW=O4E7npyoBPRx9J1WOD+=wWKWq_dhz4PnxvKD240PHQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/8] target/riscv: Add the ePMP feature
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>,
 Ethan.Lee.QNL@gmail.com, weiying_hou@outlook.com, camiyoru@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
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
X-List-Received-Date: Wed, 07 Apr 2021 14:24:42 -0000

On Fri, Apr 2, 2021 at 8:50 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>

nits: I guess mentioning the ePMP spec URL in the commit message might
be helpful

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0a33d387ba..8dcb4a4bb2 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -80,6 +80,7 @@
>  enum {
>      RISCV_FEATURE_MMU,
>      RISCV_FEATURE_PMP,
> +    RISCV_FEATURE_EPMP,
>      RISCV_FEATURE_MISA
>  };

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

