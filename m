Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l9IYe-0007A3-SA
	for mharc-qemu-riscv@gnu.org; Mon, 08 Feb 2021 21:15:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9IYd-00079l-Ci; Mon, 08 Feb 2021 21:15:15 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:38612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9IYa-0006Os-Du; Mon, 08 Feb 2021 21:15:15 -0500
Received: by mail-yb1-xb36.google.com with SMTP id 133so3976333ybd.5;
 Mon, 08 Feb 2021 18:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H+nM2YlZCHkjZQFTNGaYN8+VWxxtnyjoNi4lKelPUIE=;
 b=jMYwTMGE0bEKHnE5MWUHlgWnSTQdmp0i9MnDi3KKTjsnanibu3xEibTG2pUoilOwmZ
 SwBHrt0qOpWGyeQxnNeyzXElZ6Iq7NwsqmfL9kfYG4cJUvX3EhsAf9QIJ+w+v5mRcsh/
 a/SCsqiKQTYi3hJEeWJym3A8ji9j+VoXZuKnNVijfvooN3KgwcUDk0IVmB6XPlmsyPRM
 nFczh48sjIOlShJKyZr3UusGhjE9Icq/0zyGJkRdZ9KH0/QdoBWG+aK1qTbf9f2Gxqjg
 CKGEBrESPphdorFdnfMMwZGU3CkE6ULfmN6sCeTpCqXckemHp+Rbuu3O33DB0PD59Kat
 25Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H+nM2YlZCHkjZQFTNGaYN8+VWxxtnyjoNi4lKelPUIE=;
 b=G+xLshwzEd2LAikvDYET+LIOn7Hi5NaYPx1P8xUyKK+OJp4ycJ3i2k5caSqt8Jk3UD
 pC7MqOSbqZjYSIfFspF7a14SQSE6qEz4kWVbA5GVQsCqikm12Ug2Mtr5UEdkEixYhMco
 75HnR51Mw90+3TbuOGjeWrG47TQk5A3ldVKwJz/2+GRcVQFzD4wEApyJJ+uasESGkpcv
 L1wIlrZqB2Hhhw6j6Jq8PGCxIJOooP+7ao7bGvS2Mk3wM06dJI0nlfTzsOssd6RK7/0U
 D68S3xEF+dD44IsGAJGOO9aYmL2g3mH1xfjSsX2AUdBT/H8X314ENxlU2jirmSavFDR4
 ypWg==
X-Gm-Message-State: AOAM5314p4edgj961/UhyXoqBAySsiAg8w5AY5vZrmcbaDG00G0EE+W1
 ppdjMknikQsCkdxKASe9yrlATIbU0bZ/et+h+kI=
X-Google-Smtp-Source: ABdhPJyJvT1/YiYHaUPEx+Al9rHrQcf0tjgcDTX5MtzOdgqO4iZanwmM7/GJkqVcalWDVv7YBjDRmEFCHD+mZLgsUMs=
X-Received: by 2002:a25:b8ca:: with SMTP id g10mr27664033ybm.517.1612836911245; 
 Mon, 08 Feb 2021 18:15:11 -0800 (PST)
MIME-Version: 1.0
References: <6bc077e5ae4a9512c8adf81ae194718f2f17c402.1612836645.git.alistair.francis@wdc.com>
In-Reply-To: <6bc077e5ae4a9512c8adf81ae194718f2f17c402.1612836645.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 9 Feb 2021 10:14:59 +0800
Message-ID: <CAEUhbmW5TzWVQFOv3PM6ZwY34cSPRjvfzN3sWxP+_6SDcJ93ZA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] MAINTAINERS: Add a SiFIve machine section
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
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
X-List-Received-Date: Tue, 09 Feb 2021 02:15:15 -0000

On Tue, Feb 9, 2021 at 10:11 AM Alistair Francis
<alistair.francis@wdc.com> wrote:

nits: SiFIve => SiFive in the title

>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Acked-by: Bin Meng <bin.meng@windriver.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
>

Regards,
Bin

