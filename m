Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mz8nj-0003Ou-LT
	for mharc-qemu-riscv@gnu.org; Sun, 19 Dec 2021 21:53:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mz8ni-0003NB-Lq; Sun, 19 Dec 2021 21:53:22 -0500
Received: from [2607:f8b0:4864:20::b33] (port=33284
 helo=mail-yb1-xb33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mz8nh-0001Tz-8F; Sun, 19 Dec 2021 21:53:22 -0500
Received: by mail-yb1-xb33.google.com with SMTP id d10so24668294ybn.0;
 Sun, 19 Dec 2021 18:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QDsuMt48Ny5KzW/twrA0fRei0WvT1bhYnld+PZtEpSE=;
 b=kCbA8ugqCWK/7cj0P1eQfcZWg7gr5jZ8l4gtJq97rcFUQENol90lVF5qkI8oxFPX7h
 46GdwakhIVSuLXHh1rUEFK2tPeVCJOtTNhr2qPIB+M9qZU6D7J9AWRlbjYA9eLaQRja2
 jMwpB5JecK3Pdbk+GQOKqIvYjQgPzulsx619ZkA+f91g91vomaUA0Bo/fYS+m467bp2K
 4PPdjvgTqimSCrH0Pfv4B6SBNy3S1EAxlT+Etdupsg5efRIobrGScF4vYPJVti2pSUmL
 F4T2/DqbCY3Jb92q/onpwHClzHVY/IwvOZSBNs6FMKWwMxXQq1X8iuuZ4clDxPEXUE5p
 mKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QDsuMt48Ny5KzW/twrA0fRei0WvT1bhYnld+PZtEpSE=;
 b=ATFUsA/iseamhJMUq+0oIgjYkcO7d2ezMOzo5YIXIZ8bdCGVZLc44cS9U9DmERQiZe
 l+XYpb0gmygzfCdDBs1YCQ+MUlO+CO26IhHrm7qR212rvNuXsPBymdo0/BAT/84Dvdbw
 Eoh9aoYDddl18BIwFJD+4va8sIxrkrSjLLBe9t9A94g3HCE0LfbMqVPc/x0OL4EEdSPY
 oWi01/b40ALwWi3wH548jF7scOZHNEm7ONZ3JcuoXXFDRQ6JQJMbaoxB2FsRhr5ZZ9IV
 1teuDVhi3Wlum52xPrg+QjmxounD2qTHt6023kdedDJjlGllbqtrl7avvf7RFRVXIWN7
 mifA==
X-Gm-Message-State: AOAM531NGgvCfjWohuD2ZWjmNdOOWzfXWOmN1rEB/sQ6mGnpQulhLGW3
 oL2ukUXUPWnPRuSiglfVqgtXsFeyXT0IVrZlwDYq7tRWO4s=
X-Google-Smtp-Source: ABdhPJzN6Oi4OhwTnbUUTVXOhyhTPVd63phY+Uj8gCU2Ifccht/U7yZJ8pklQ221AXPwjEFc1HOuAgPlJRZ+igGootU=
X-Received: by 2002:a25:b47:: with SMTP id 68mr20712796ybl.378.1639968800117; 
 Sun, 19 Dec 2021 18:53:20 -0800 (PST)
MIME-Version: 1.0
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
 <20211216045427.757779-7-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211216045427.757779-7-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 20 Dec 2021 10:53:09 +0800
Message-ID: <CAEUhbmXC9J4q+_OeVnQc6J+WMU2DEmBL07B93vAxM9_03-jKng@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] target/riscv: Enable the Hypervisor extension by
 default
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair23@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
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
X-List-Received-Date: Mon, 20 Dec 2021 02:53:22 -0000

On Thu, Dec 16, 2021 at 12:55 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Let's enable the Hypervisor extension by default. This doesn't affect
> named CPUs (such as lowrisc-ibex or sifive-u54) but does enable the
> Hypervisor extensions by default for the virt machine.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

