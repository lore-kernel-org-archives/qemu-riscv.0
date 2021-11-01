Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhRF1-0004sy-Gu
	for mharc-qemu-riscv@gnu.org; Mon, 01 Nov 2021 02:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mhREz-0004se-Nj; Mon, 01 Nov 2021 02:56:21 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:35537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mhREx-0008UP-HF; Mon, 01 Nov 2021 02:56:21 -0400
Received: by mail-io1-xd2d.google.com with SMTP id 62so12903154iou.2;
 Sun, 31 Oct 2021 23:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v27AjKMx8U/YHCCYvXdEzsizdoYKrCm6YNtjSwb595E=;
 b=pvylne3xjdh23MiPrVWi8nGvaT7Noo0bEtQ4UVoGcHDIUbGlREU6ba4dV4iCmJ6hTw
 cIMzg9CwqmV6lz2W8K/QecQg4/H0/YF3hIKLGA+bIGF+EDmNCIGIffFHO9VlzHaza2I6
 43AVhqhHrll8WrywNbLKqoGycpyJBqpOTVP97JMD1hWBEOL1ZcCNDuRGNL707KzZ6e37
 uNqIuWMbiM28+jKhPKmX1jody+UaxIL2ZyijFmKYtzP7mRBbCqvf25l5Mj8oiWTqKMjy
 1srVnj72Qc4qATDw4MU3s+rUlwsEw54kYQf83ojdGVDfHv/1OV0YCZDXOSCHQtMqPpcC
 PElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v27AjKMx8U/YHCCYvXdEzsizdoYKrCm6YNtjSwb595E=;
 b=kXyhmPhWzQY+9x2m/rdq22A4Me+HigFv/+3fo29Hy6ThLGFN3WJo9LH9SyX4N2K3y1
 eij8WByY0ZuGWn+33w1a0A4JGs08kX3Ddcth5DdYCJJIEy4vByIIRdVNkp1zkgvX1CXu
 azuFMSxsvotpgOAJRyMBtWQbppGQZasA3jpv1tloDH2LKShEiWmj/2MQvpjbkAX0Fw8N
 krlN9+Tr7Gj9lrVQnjZIIWiCQjgjIAnsVeRDLQeq2egcF7IhR3Q/NeascU7HufMkea0p
 ZONNKVFbMRYow+hG+TtXWGdAbuKG7OKMRdeIRzbDh5jZX3h5L/2hTpvtiTAMUoAyAsYi
 xRlg==
X-Gm-Message-State: AOAM532xCIzTXgpapeZoGKVpOZzQclXUIO4HG7T+H1WUfZJfwf0NRWOa
 Qic6QlOqH3lo3zCJPy5NZZOWfZIAfTQ7E9srOOw=
X-Google-Smtp-Source: ABdhPJyGcYRDocJCYEjvBwj0nKoNbABzDPzWPAyITiMJBxlKxLtXueuFe4qwicH7Nbt89CloCGv/iTMvf9/kKcIn6Mk=
X-Received: by 2002:a05:6638:329e:: with SMTP id
 f30mr18546818jav.63.1635749778042; 
 Sun, 31 Oct 2021 23:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211026064227.2014502-1-anup.patel@wdc.com>
 <20211026064227.2014502-8-anup.patel@wdc.com>
In-Reply-To: <20211026064227.2014502-8-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Nov 2021 16:55:52 +1000
Message-ID: <CAKmqyKOyTR1RX4k3Eq-YmcuWRsxVu5J=o-_eQeU6Ht1TUEUEBA@mail.gmail.com>
Subject: Re: [PATCH v4 07/22] target/riscv: Add defines for AIA CSRs
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Anup Patel <anup@brainfault.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
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
X-List-Received-Date: Mon, 01 Nov 2021 06:56:22 -0000

On Tue, Oct 26, 2021 at 5:01 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> The RISC-V AIA specification extends RISC-V local interrupts and
> introduces new CSRs. This patch adds defines for the new AIA CSRs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

What's the status of these CSR addresses being finalised?

Alistair

