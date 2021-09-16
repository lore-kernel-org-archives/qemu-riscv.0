Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQjd7-0001Ed-NI
	for mharc-qemu-riscv@gnu.org; Thu, 16 Sep 2021 01:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mQjd5-0001D5-JB; Thu, 16 Sep 2021 01:08:11 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:36367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mQjd4-0007dT-3O; Thu, 16 Sep 2021 01:08:11 -0400
Received: by mail-yb1-xb31.google.com with SMTP id y16so10544779ybm.3;
 Wed, 15 Sep 2021 22:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EreJha7/DA1K2RJP3ozydN8NbEzlwjkHROEDl4EXzY0=;
 b=SKElfs+M685MZOKU0HGa87eIU4VFINGSLRtQXdPMV8X4xcEMpCC0oRfAcvXSApKVRG
 oUz6xPmSzBZFNq4QhKw5mhW5RgDEXtPiolt7ZvM8Jg+t0GH5ygl8ygvseL47nuaDHx02
 Zfj5KxXQLyN3gEzgBVUOabH6vLGk8H40LoK9MbFs3gUGWrCNwzmUWYVgKbWHdyAbglZ3
 eFmoKTcqYGnJXOqAmTrZy5OL0fs0HD4yLBGN3Zsp9B8Fy/2PB6vQWRw37DGTBEvIz3BG
 57mJMAE4MetjDarXco9fKGik3UKwXidhArSfJLFZPfv/W3/B1TESdWRh8Y2DsZB35jm5
 pviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EreJha7/DA1K2RJP3ozydN8NbEzlwjkHROEDl4EXzY0=;
 b=WhFNYZVuK/BSTnPXMW+YDytm7FyLMSsgJm7Fq9jtR15WSznEJbQ5QqnWvsjcnG3Z0v
 nRAYivRZJ8RWGcbymNLoEPoVK991DDRJM0wDLfzuk0FoLY6EGHRm4wK93WH0lCNcQQyX
 3P2Xoh73fvU467hRfhgSFGkNZA8CCfiDYkGKWACVr409tkyq7Ka392m7V6fbsTmnimH9
 IWX/ULkStHB4eCtBaCkqhk2YeB8oo9ZjmwPzTSQQ0Tj7KvELiqOS2oYYmF1W7s7kgVKz
 xaQiqHVf/2+HN7+kzT6E9HXAfKYFucivlOPb3EK3mShxyXrMKKE/L96pC8zlgEPe7VHe
 yRTA==
X-Gm-Message-State: AOAM533ZC2ia3/IguUzkD7gxkaggOssEcqJkqct2FKyxKBpQp59VODHA
 i5knROT3h2jajynLVvG6FffXkptbE7fKpSuv4XlFJ1ySW1s=
X-Google-Smtp-Source: ABdhPJy1TsuRxPQefe4U9LmaPY4LjjI90eXGcAgIsBQ+SvsxkSXeF6VGVpuQcA7M7LYakCBUr3ByZ4iZrMT0ryw4icg=
X-Received: by 2002:a25:83:: with SMTP id 125mr4814125yba.467.1631768888796;
 Wed, 15 Sep 2021 22:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <d6cb4dfe75a2f536f217d7075b750ece3acb1535.1631767043.git.alistair.francis@wdc.com>
In-Reply-To: <d6cb4dfe75a2f536f217d7075b750ece3acb1535.1631767043.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 16 Sep 2021 13:07:57 +0800
Message-ID: <CAEUhbmWYBzqmMMq6uP3ytDT-39O9B2bvDM8EfuV8Bz2DRfNCTA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] hw/riscv: opentitan: Correct the USB Dev address
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
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
X-List-Received-Date: Thu, 16 Sep 2021 05:08:12 -0000

On Thu, Sep 16, 2021 at 12:37 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/opentitan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

