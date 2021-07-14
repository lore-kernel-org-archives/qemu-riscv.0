Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3ZNQ-0006l3-7u
	for mharc-qemu-riscv@gnu.org; Wed, 14 Jul 2021 03:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m3ZNO-0006fO-1h; Wed, 14 Jul 2021 03:32:14 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:33431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m3ZNL-000422-Qo; Wed, 14 Jul 2021 03:32:13 -0400
Received: by mail-yb1-xb36.google.com with SMTP id r135so1742441ybc.0;
 Wed, 14 Jul 2021 00:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ewqIiJpJKsLoIWoXeZdlkmpcoVdtLvtbDas4wbIhZCE=;
 b=sX2pW/KHJnd0C+NHMUKeEAN9KNcdCNK1KBRXX+J8RSNcM8z/fA+no+GJGGIRw5pAV1
 j8pciU5SOSKapL7h9r/EBr7UqQXQBp72r3u25imVX1+dw6hdgCIF9cR6c8Fmr7oQJU5p
 9LaL/CvrAdxYFralJ+cIZ/WEbk+aPAq+6kjmZ5r30qCMNcR4DnvDZj9kgrIzygiTjn2a
 f/yXNVeakc+31IAoHVR2Ez+3iH6i+enC5AnuZSRIzD6H1Sa3EinigWtKzzP23G0NWouo
 pJZ2HICK0+OFNdCo948mw+EQEe2hAgpmt/1KrXVhjtrvJYhpW7powhKAlAj9wmz/Wi4h
 q5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ewqIiJpJKsLoIWoXeZdlkmpcoVdtLvtbDas4wbIhZCE=;
 b=ZlemwWCbNllvHRSZVLh7ivTTw8B8ybkJ1YYRp5YALEyX5oAKqZ2+QqEAZduSU3wt12
 /kLpogmd34cQo9wWQ0iMBPAlKnhOr/3Om9f2+sE4ol+idBXcbT5p32xz/1t8aP9qJT8y
 enuRDYwGhfpCwiN/D/xdA4FfJGBC6A+iPfdzbvNn+awOhr4qGQHzP1HtBwQIbpF/AUzH
 g4u49OzMPXNjeYN50bVs8wVItHXASs2r9M2W1sn302TZniZ/uB6cJ1QRICgdLGuL2LFT
 H9L8M316KhNMbW8Q4s07qJ2Y5QsiH9759mEclFuVw+6brn6gqwRvBNmvGbAOrl7iOwRC
 ee+w==
X-Gm-Message-State: AOAM532grh12JE3xUr2meOngF5na7CpiQZPgMZQ/opQ1MXZTM5mQwitf
 iyFV+fZIgzWG6CVbjbP5FxghOfIKS4s4um5/+Mo=
X-Google-Smtp-Source: ABdhPJx2qSknV2jw+F7cEGksO7Csez20bnhrdPMKTSZA3IJycOemHaUjs2waRAjHIh3Omg1URX/dVAY9YKd1+3v8GX4=
X-Received: by 2002:a25:be09:: with SMTP id h9mr12136140ybk.239.1626247930150; 
 Wed, 14 Jul 2021 00:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <da5acadd07eabd5a6e9fc8870fecb435173b8f47.1626247332.git.alistair.francis@wdc.com>
In-Reply-To: <da5acadd07eabd5a6e9fc8870fecb435173b8f47.1626247332.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 14 Jul 2021 15:31:59 +0800
Message-ID: <CAEUhbmVBOYZ85fMFKywAXMhHT-3zqybOwXsTEOvWz5gwPx0Hhw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] hw/riscv/boot: Check the error of fdt_pack()
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>
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
X-List-Received-Date: Wed, 14 Jul 2021 07:32:14 -0000

On Wed, Jul 14, 2021 at 3:22 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Coverity reports that we don't check the error result of fdt_pack(), so
> let's save the result and assert that it is 0.
>
> Fixes: Coverity CID 1458136
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/boot.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

