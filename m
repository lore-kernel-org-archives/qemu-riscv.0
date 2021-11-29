Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrXAL-0005cw-QV
	for mharc-qemu-riscv@gnu.org; Sun, 28 Nov 2021 22:17:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mrXAI-0005aa-8N; Sun, 28 Nov 2021 22:17:15 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=38684
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mrXAG-00020T-Eg; Sun, 28 Nov 2021 22:17:13 -0500
Received: by mail-io1-xd2e.google.com with SMTP id z18so19592163iof.5;
 Sun, 28 Nov 2021 19:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9Y3oUSLzS9VQrH0sxhmNT6uoqbd/ySBskGg5HwMQ8zw=;
 b=GUodPrZiV7defuMjXBIGUXFNUe1eQT6u1j77SEapGEc21MgXNbsDafntg5fbCNzmb4
 r6owhbWqfvJVwdDM+OvDayJKvm9zOmBCYONKiYetysH3MBDRSYvor78HmUeL9E08JyXy
 H+Fls6t4AIhj4cTXbbRg2bivTvtjXjwyNVBchZtPatEcc36y0TngM7TttECjMapufG9N
 E0SexxISyFX7t/8DailHX8zhQVsQi5a0ByXxJPAnET0FsR9SsAMWRpc2nb3S3pb9sces
 PIYo4pUd2rm68lalUFn9GEdQ0My0DzdKg4bbCG/S8HVx9XdB+D+uA6s9ADXH6QDBZu/Q
 KeyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Y3oUSLzS9VQrH0sxhmNT6uoqbd/ySBskGg5HwMQ8zw=;
 b=FqJ8xBTroHFM2IF/ecV7NDLngDNARdwSuhSzAq7sQiFGZMK8yZ5MQmsaLJXmJY19zM
 AOhO8Rjs+bywvLjvEUaP3/PST97k6eCNgXabs4mVIfFqpqhjN/fNnOFrnbDF9thUE8ky
 5JY646Ulss655OwMjzZqrzcG4s2/Oh+2g7iJWRIuKZQX4Oq8wKFW4QdY4+E1SRkOZ4mY
 wbVqQ2kiH06bsMq9uLPgWLYnIz+XQyv/6USLUjbaXKre9vYD3EIL//g80rr2fDLTkg3a
 4tH+r4KqgS7w4iVphtrNldQmK5BzDI2nK5Pu9LGjXoMQbiWyFla5dE09y/UGgWUQR0o4
 wm2g==
X-Gm-Message-State: AOAM533HLv0OfC4Y+jkGh34wRpmcC7RebG4q50TkTZf1q2bO225aiZiy
 4Yl8z4uA8uWOzxnM0Y/pNjf/z9dFlrO0Pm+ehoM=
X-Google-Smtp-Source: ABdhPJzW32wJEsgPyVlFg7CZdkwxIORfQXCtSi3h1KtZRlQJYS0s7GHrfXdH6D7f7h9IWrdhVA6jz1Zw9P+nmRigrUc=
X-Received: by 2002:a6b:f212:: with SMTP id q18mr52564830ioh.16.1638155830578; 
 Sun, 28 Nov 2021 19:17:10 -0800 (PST)
MIME-Version: 1.0
References: <20211129030340.429689-1-frank.chang@sifive.com>
 <20211129030340.429689-5-frank.chang@sifive.com>
In-Reply-To: <20211129030340.429689-5-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Nov 2021 13:16:44 +1000
Message-ID: <CAKmqyKNuR5NKn3v6hzXu+4=CwsS46jQg10efqtOfrGuY773+xg@mail.gmail.com>
Subject: Re: [PATCH v10 04/77] target/riscv: rvv-1.0: set mstatus.SD bit if
 mstatus.VS is dirty
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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
X-List-Received-Date: Mon, 29 Nov 2021 03:17:15 -0000

On Mon, Nov 29, 2021 at 1:07 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 9b5bd5d7b49..bb500afdeb5 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -502,6 +502,7 @@ static RISCVException read_mhartid(CPURISCVState *env, int csrno,
>  static uint64_t add_status_sd(RISCVMXL xl, uint64_t status)
>  {
>      if ((status & MSTATUS_FS) == MSTATUS_FS ||
> +        (status & MSTATUS_VS) == MSTATUS_VS ||
>          (status & MSTATUS_XS) == MSTATUS_XS) {
>          switch (xl) {
>          case MXL_RV32:
> --
> 2.25.1
>
>

