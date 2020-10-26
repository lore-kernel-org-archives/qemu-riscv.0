Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kWyIa-00021l-2Z
	for mharc-qemu-riscv@gnu.org; Mon, 26 Oct 2020 04:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kWyIX-0001wz-QH; Mon, 26 Oct 2020 04:56:13 -0400
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:33827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kWyIW-0005hw-4k; Mon, 26 Oct 2020 04:56:13 -0400
Received: by mail-yb1-xb44.google.com with SMTP id o70so7012247ybc.1;
 Mon, 26 Oct 2020 01:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9pybJr78bVvapfavYXfM6yf471TkTAdxCqgm+6wN/80=;
 b=LvnC2nZGZGTvDlqtsrCOm4NdTWEOC4UctlVXPbEf1QmW2EACmP6m5z1siRzZ+Uj6Fo
 YJXqy40ButO9ZycsYdI4PmGIji4XfycCB5duFYIwFU6W54xBUaUg7kJSwOH0dIiH3lBH
 3H3fszMXmTGebtGseoc82jnNSEn7+XQK+XiogzWdZhJWt2yu36DDnaSF96TIyycubCdo
 NgbCz0H2cIPAKQsubGd0UKPHhkVpkvxXL69l8iZeXZATZr4H8MDdigpJ3pkeePG3ruhr
 mjq0WBbTq8HzN/ozrwuauVKmWABIaRMgkLAoArHG21p7ULhhgs/51ZUU6vlhIwolhxjK
 2AeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9pybJr78bVvapfavYXfM6yf471TkTAdxCqgm+6wN/80=;
 b=tIWu8DUDYktVFtfdhNFzjQDtjdj7ozOeey0PEy9HyezJNOCSpzrbBdZc5NmLcPyzHV
 +7T8HMB9FUZvJjHvj+cGWaaki70aFQJ8c/BQL4kISV9D5OcyOdRukyzWpetAT8d8ZJK8
 nfKxF8seJlFwqlixRu6g3pd3uLbp8JmxH0v1Rp96gV7gwPLayOgnEPrxFLSw583SvDGe
 oLl3SgO2nWoUzjR2S8RqWDK8/BHoaa6S0/Z6HEvfrBJOnmTT1i1QOXIawye5dTg/3k/C
 ZcuQxYmmXfP8JML1agFMXYRZRFOiCj9oMlWJt31UPrpICg7aW7L/3UvmmdcQ7JxYlS/0
 RPZw==
X-Gm-Message-State: AOAM531KYyMZl7QV2lV9OqYj06e2DZr1kNXN8j7NKmMdLPh+lU4EaiKz
 KJJME9tDCBc7OwNAjF5hrSfxg4+Wu80sSPJsNq+d1FXx
X-Google-Smtp-Source: ABdhPJx3WS+2nfhWKc6qL3BKttb2X0IMMC4ILLQGh/puFxOmYURXLnFfWK743bTrc6sFooaxPHU+Y9Lat7uNXuhywns=
X-Received: by 2002:a25:386:: with SMTP id 128mr18346777ybd.122.1603702571032; 
 Mon, 26 Oct 2020 01:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1603467169.git.alistair.francis@wdc.com>
 <82ea05de42d429e1bf572cc134d4571d87a4cfc7.1603467169.git.alistair.francis@wdc.com>
In-Reply-To: <82ea05de42d429e1bf572cc134d4571d87a4cfc7.1603467169.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 26 Oct 2020 16:55:59 +0800
Message-ID: <CAEUhbmUvdh_oqhG2X2P0oKBEzjvWT-jsXVXPKNNg2CdGftuXjQ@mail.gmail.com>
Subject: Re: [PATCH v1 06/16] hw/riscv: spike: Remove compile time XLEN checks
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b44;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb44.google.com
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
X-List-Received-Date: Mon, 26 Oct 2020 08:56:14 -0000

On Fri, Oct 23, 2020 at 11:44 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/spike.c | 45 ++++++++++++++++++++++++---------------------
>  1 file changed, 24 insertions(+), 21 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>

