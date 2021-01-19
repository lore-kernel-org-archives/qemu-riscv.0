Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1twr-0005KB-BM
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jan 2021 11:33:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1two-0005IX-RR; Tue, 19 Jan 2021 11:33:39 -0500
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:32970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1twi-0006v6-2c; Tue, 19 Jan 2021 11:33:37 -0500
Received: by mail-io1-xd29.google.com with SMTP id w18so40807580iot.0;
 Tue, 19 Jan 2021 08:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iv0/NXnL/VFw9WEw6C9KLoIthfT8I1cEhW1iJd1Q2RI=;
 b=Vp/WsWWw/Hk6xeEaw6VQtlh3wzdK0bO00VTVJW7lWdRx4PZWI4PjbBh04RHAd+pjM9
 oiCDI7owyXyakunv1rIdyhCWYkxXHNHtwDyHG3X60Pj3o8tAPbJXOlG0dwQwKEAHGk39
 5zts2WpSgqmJMAHRzderWcIIP9h0RRU2yzFGa66nBmvkc6T/g7xx9G0ourq1GamSCkyM
 AhJpkFOBad72PA+LceIIVHvvsbOS/BJH2SYLCKZdgYCYFCvJiSxaB1CS0QH22VAMDR53
 +NCnPucbupEjbzWSqV+gIMyRstJh4tEs0f0FiDflbvtLNGgvKdAaxeYIURu/a+Ft0kjt
 ee3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iv0/NXnL/VFw9WEw6C9KLoIthfT8I1cEhW1iJd1Q2RI=;
 b=Fj5PnGXEbRF3X/mD6x/xohos7Yumv2oDkfBN6t4ouTvuvmDy898bAscIoBhfPDiuqd
 hxgrVS5FtZp7KHb6BF1+RCLGtPtjkODwvNGwu4CAQ7bnCd6B53L4t6usAyQT+NhZcHMk
 f6rx+vIvRvsteuOm93Oc4Za6DDZIWjUxN1yweEnPxETk3QgeTjkiHKyCDWOkHPBOcChX
 OvihCIA1M2PLBNQS+CdZSo+bJeE1yHAnPCULfpgkBm3Of3yD0Bw9qmF1RPo3+No9To4b
 T9TJnJ7THUOVRJX4sbvBCNCUHoRPhUiXBQYkBxiStkC8kx6qqA9GyEnmTkwjzh4f9cm+
 l3aA==
X-Gm-Message-State: AOAM533moLQ0PkH1AwUxeQeVvyepAbrFWlz/81mYn7g+insntt9nImid
 dEtz6MFZU+QztwPXN/j6CTkfuSiMx/lKWAy5iPQ=
X-Google-Smtp-Source: ABdhPJw0640ZJcbt3ZW6NCWwf8/UEPhRa9TiHQeiJi7Qp8i3DKrqyeivUClnko+65+5snli3L68v29HR+AQEX36Wp1g=
X-Received: by 2002:a02:a584:: with SMTP id b4mr3549293jam.135.1611074009541; 
 Tue, 19 Jan 2021 08:33:29 -0800 (PST)
MIME-Version: 1.0
References: <1611024723-14293-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1611024723-14293-1-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jan 2021 08:33:03 -0800
Message-ID: <CAKmqyKO-80yFNPxhnKMfF999SM4D8SVecectSMcYzqK=YiDMeQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Declare csr_ops[] with a known size
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Tue, 19 Jan 2021 16:33:39 -0000

On Mon, Jan 18, 2021 at 6:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> csr_ops[] is currently declared with an unknown size in cpu.h.
> Since the array size is known, let's do a complete declaration.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  target/riscv/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 02758ae..419a214 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -487,7 +487,7 @@ enum {
>  };
>
>  /* CSR function table */
> -extern riscv_csr_operations csr_ops[];
> +extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
>
>  void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops);
>  void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
> --
> 2.7.4
>
>

