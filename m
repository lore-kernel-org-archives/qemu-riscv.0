Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lsyjH-0004io-UZ
	for mharc-qemu-riscv@gnu.org; Mon, 14 Jun 2021 22:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lsyjG-0004fv-C3; Mon, 14 Jun 2021 22:23:02 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:38475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lsyjB-0000Pt-4I; Mon, 14 Jun 2021 22:23:02 -0400
Received: by mail-yb1-xb34.google.com with SMTP id m9so18281209ybo.5;
 Mon, 14 Jun 2021 19:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cpacIx7ph9RH78da4ilbgw/oX9NN+B0XqtZA5rt90T8=;
 b=EGLRH2rV0zazdU6g6tulnJlKy7MBij0JNTIrRFM3FPCGfWReYio1CkBYyzXsqZN4+0
 Nw0P8kCdzOv/hH2uWeLsr4DTdxRpRbZUFr0ZpXCHziS9BtQpnUdR7tMY7oQ9E7u1ksDI
 VimdVmtsrv8DF5hu3HAJ6ZVzyzkXQOlS4Q3wJSoV20u4UIFtG1RvLzTx8GFv3bDBoepm
 Cb/e92djiKgrKGnKVOgzQ/x68kn3VuDpnQkKA9k22sxxHyh+oPh/JwMNQ0yAFvILw9Q+
 Qow0D3FKIO9zTpczyk77epNfSZ2ZKqPH+BSJHPCfiqiYW3MLvCNx0IOD4r6Sd1gnr5G0
 F7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cpacIx7ph9RH78da4ilbgw/oX9NN+B0XqtZA5rt90T8=;
 b=bMlTzYlvR5uRDVIwcAvRbMj+gpliHt+7MhQ1rGrBkCzcwchIjRmaNI1E998u0N1g7m
 g2DPazLq8iEpmUrPMEbav+MyoIqRs3ifKdWs1qM/6bx63MpbxVHur1n6FeECcJmpbRPW
 k7s2/d8vvQARjaHZEkqBgZfFPPxLoQJMkMLghf0YkqoohlZvcAdbvWnqJxnXyPjyqSzQ
 PunkKTHg+UDTRd5rLmkp4ahUHiX3Bj52ZOcIuqrZ6u2WgQ2tNKwL+dLx+qJkwjUF3fvD
 lOjPNvPMmdx8dMPUjKj4na7lmUhMOs/5d5wKEeNkeyPwg+e8jMnPAWjN+i1fd7Bnin6c
 0Z/A==
X-Gm-Message-State: AOAM532dwFvXKE+IM3NNIO3YY3N56KKqBfzPegQbvVJcYEEUW+5B9UzY
 +/eZAnMmcYca8vVCDroz2JJDZ7vkgnsyviAfjKM=
X-Google-Smtp-Source: ABdhPJzSGA+Tm8IyeJBwT4Hc1ktjMdPxuMZLOWuKyLJ32FFl6X0GOO8Psxqpu6qZbmqnGgH+byuUbxWUGHj6QzQjZLI=
X-Received: by 2002:a25:be09:: with SMTP id h9mr29949062ybk.239.1623723775814; 
 Mon, 14 Jun 2021 19:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210613141222.548357-1-lukas.juenger@greensocs.com>
 <20210613141222.548357-2-lukas.juenger@greensocs.com>
 <CAEUhbmUXnrXM_-YhjJavG4rDxm1m28XSsQZyd27jeyrNgLELfw@mail.gmail.com>
In-Reply-To: <CAEUhbmUXnrXM_-YhjJavG4rDxm1m28XSsQZyd27jeyrNgLELfw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 15 Jun 2021 10:22:44 +0800
Message-ID: <CAEUhbmUHwnPnoaX4Pt40-JGjrPniA9a1cDzyQqSjXzuaSbBAZw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] hw/char: sifive_uart
To: =?UTF-8?Q?Lukas_J=C3=BCnger?= <lukas.juenger@greensocs.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, mark.burton@greensocs.com, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair.francis@wdc.com>, luc.michel@greensocs.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
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
X-List-Received-Date: Tue, 15 Jun 2021 02:23:02 -0000

On Tue, Jun 15, 2021 at 10:19 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Sun, Jun 13, 2021 at 10:12 PM Lukas J=C3=BCnger
> <lukas.juenger@greensocs.com> wrote:
> >
> > Make function names consistent
> >
> > Signed-off-by: Lukas J=C3=BCnger <lukas.juenger@greensocs.com>
> > ---
> >  hw/char/sifive_uart.c | 46 ++++++++++++++++++++++---------------------
> >  1 file changed, 24 insertions(+), 22 deletions(-)
> >
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Please reword the commit title to make it something meaningful. Please
do the same for patch 2.

Regards,
Bin

