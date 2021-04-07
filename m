Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lU98a-0005fu-VE
	for mharc-qemu-riscv@gnu.org; Wed, 07 Apr 2021 10:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lU98Y-0005cW-Gp; Wed, 07 Apr 2021 10:26:31 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:46752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lU98N-00010V-JW; Wed, 07 Apr 2021 10:26:30 -0400
Received: by mail-il1-x12f.google.com with SMTP id p8so12004668ilm.13;
 Wed, 07 Apr 2021 07:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Acf9CiAzaFeH8eLeZ5du5p1Kh8sUSQ3gzUGdD30l1NM=;
 b=AGwR+KmYxXagDXyMggYDEwLfrXTb70/vkDl0v8Nmqt0BpvGfzMjNXfHXNyBppgQkTY
 TFaQ/BdEBTZH8CS5CZWy9XVKtpUWWqq6BQhrvckARu6gSk1HlYUZt9BznONxjJTd8ojb
 4IsgOqmmV4w8a2GhVMWUE1X6lRt3KTJDW42dJRUEB5JhDEXLvMXSUprxcXsAb0ES/23w
 FTmvNRCDb7dYPmHPM6myWUOHlXHzT5Mc+REWtKFCJR8rK3wxKlwoU4aCD7CYmSnbbtdD
 ciStx10i/08ppJaTRXYxMXmLsaQIqRPS2ip8gcK2rIiqwSJiZSiD2CPWIVeqXCq/6JZe
 ScgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Acf9CiAzaFeH8eLeZ5du5p1Kh8sUSQ3gzUGdD30l1NM=;
 b=DNQqQcLlkDYi5Ich2Ip+lwxwIyyP+hB8TZQyOpNe+LTwtARqu9CrP1vz3yRmsW9lar
 AQd4hNa5Zgo55JGqYkxnY+jlJPxd9J4H+lWZmJoL0TdIuI2WQZq3AC9shA+r/c5eSKaG
 hZbv2O1srvUtjXgVE1SH+ti5FQjwrXDHNVQULVDZwwIwAwtI4tH5HYetTvvWR2ZnqQmW
 65nS8tueog6yBahUIltgB+PVFitONPCleT/mlXpI7uN9uEu/gsfn2riXu2s/7TvzILhP
 njLJDE5O+mA9Mz5NUGXSHgMZINunNTiAstauMTbiK5Ox3Phn7RK0F8Gc8z088DO0oQlG
 8whA==
X-Gm-Message-State: AOAM530Hadnv+qvUR4jxoF0vFm7kgSlChLo4f7iBGvlzWHaiGqV8zuZQ
 9EIkrXGkAv1Y1GvTylNdH8/pxhrl8Wew0VKi49Q=
X-Google-Smtp-Source: ABdhPJxbN7EQGTgDdIELhWYxvhXKhYLSnNwoZ6qFtiQZp59gtiXbEN9TBSSicrUSbWaY2O68X+Iwfykq2ecnG7jY5n0=
X-Received: by 2002:a05:6e02:1989:: with SMTP id
 g9mr2977298ilf.40.1617805571754; 
 Wed, 07 Apr 2021 07:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <6564ba829c40ad9aa7d28f43be69d8eb5cf4b56b.1617749142.git.alistair.francis@wdc.com>
In-Reply-To: <6564ba829c40ad9aa7d28f43be69d8eb5cf4b56b.1617749142.git.alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 7 Apr 2021 10:23:51 -0400
Message-ID: <CAKmqyKPX_7F2-nsS0Ea1oimJC9jKe3RfvFH-yG91dVXhy3PzSA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] MAINTAINERS: Update the RISC-V CPU Maintainers
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
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
X-List-Received-Date: Wed, 07 Apr 2021 14:26:32 -0000

On Tue, Apr 6, 2021 at 6:51 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Update the RISC-V maintainers by removing Sagar and Bastian who haven't
> been involved recently.
>
> Also add Bin who has been helping with reviews.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> I have run this by all of the people involved and they are all ok with
> the change.
>
>  MAINTAINERS | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 69003cdc3c..541bd264b2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -295,9 +295,8 @@ F: tests/acceptance/machine_ppc.py
>
>  RISC-V TCG CPUs
>  M: Palmer Dabbelt <palmer@dabbelt.com>
> -M: Alistair Francis <Alistair.Francis@wdc.com>
> -M: Sagar Karandikar <sagark@eecs.berkeley.edu>
> -M: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> +M: Alistair Francis <alistair.francis@wdc.com>
> +M: Bin Meng <bin.meng@windriver.com>
>  L: qemu-riscv@nongnu.org
>  S: Supported
>  F: target/riscv/
> --
> 2.31.0
>

