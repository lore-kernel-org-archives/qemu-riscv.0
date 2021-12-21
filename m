Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mza4e-0002OK-79
	for mharc-qemu-riscv@gnu.org; Tue, 21 Dec 2021 03:00:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mza4c-0002Jj-GQ; Tue, 21 Dec 2021 03:00:38 -0500
Received: from [2607:f8b0:4864:20::b2f] (port=41509
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mza4Z-0008S4-Sk; Tue, 21 Dec 2021 03:00:37 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id v138so36371457ybb.8;
 Tue, 21 Dec 2021 00:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sKHf3YD5zficj/X2p/jqI25KW8/2GuZEbeZWfWrOMZc=;
 b=hcmHEkYtQ3+8s2sTsZ+XmN8UKe8Qnmij17piJoWJ97AtcimagPBiIfp+2vOomfZVMu
 Uybn5T0dmjKKtA35ts8buaIPGdc9biq+36bxcHfbfkVgOXLPhPhNZAN79/RsG1FEFMG7
 6LEFNnOVc/11+lydQgATY3MOd+hTBqVt0/C0LIjOqrf03osO3uzxbYmWhczT+Nd83Swo
 fkhp1s4vUrrfHEpCPGm8CZZTA27+C/k0BYlqXH48Ib2sWnDykKfhHbilgBfv9t0LCHVf
 8wZuXteqDt6enA3PTiyP5nE0oZUPS13+v360eRDwc3SHzOhE5CpozbOPlY3wE6KBnlNU
 gXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sKHf3YD5zficj/X2p/jqI25KW8/2GuZEbeZWfWrOMZc=;
 b=j/jOI8qGAJjIF7rZFw9gfDMFKmnM7V/MANzyhFItnPI6vGmoZZ6OEHetffZKFMhz2N
 l3Oc5eArPxjiwvBlIs6poijx508u5bpEoMH+VqcTqyHpDFCieAl6TRUbbEcHsV3K+gme
 0Zgm1Ai/vbeYLNczWIih5FMmyn7+OOM1J27buwfQQ7+OK2U3zwExVriRhtFWl7Clix7v
 ZR6Fo/qX5PIbaJM0VPodrxQ4iv9tpOmM4fvenM700XGB7V6YJOe2l1GfiifKrhal11x6
 p+XeQA+JwiACELVInPB8YNvXzNlYWmBPYNJ3uNBFNhGlLP5es1C9Y8uQalexFXu/Bfe4
 pWNQ==
X-Gm-Message-State: AOAM5314UCHaVWNvwVJXV62m7yt3r+sT6W6oSgG6ipFmHQmLfPmXW4uX
 lY3UCK4om8AtYg7RADLc313bN0FdS1yW6gRPwBU=
X-Google-Smtp-Source: ABdhPJz3y7gYoGIwiuwy52XDs2eDTMixhmES7lhG4P/peBUwowFUAZCE5dcYUTqkxyH1g7huEe9jPxPVDvL9ESLgh/o=
X-Received: by 2002:a25:ed0f:: with SMTP id k15mr2235953ybh.148.1640073633567; 
 Tue, 21 Dec 2021 00:00:33 -0800 (PST)
MIME-Version: 1.0
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
 <20211216045427.757779-2-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211216045427.757779-2-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 21 Dec 2021 16:00:22 +0800
Message-ID: <CAEUhbmW6x2=FpTMizvKW21-QUNK7VcXgDeHaTzCV1+_ps9DRuA@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] hw/intc: sifive_plic: Add a reset function
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair23@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 21 Dec 2021 08:00:38 -0000

On Thu, Dec 16, 2021 at 12:54 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/intc/sifive_plic.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

