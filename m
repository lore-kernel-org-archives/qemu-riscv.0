Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGYL0-0000RD-QG
	for mharc-qemu-riscv@gnu.org; Wed, 18 Aug 2021 23:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGYKz-0000R0-Mc; Wed, 18 Aug 2021 23:03:25 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:37801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGYKy-0005RG-2y; Wed, 18 Aug 2021 23:03:25 -0400
Received: by mail-yb1-xb35.google.com with SMTP id r4so9490368ybp.4;
 Wed, 18 Aug 2021 20:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JZl3h6tgMdfUPBlExBOvpw6l44LwiyONSy7q+Goj+uc=;
 b=EwCb++SuZRzeT9kNixNWrD5ZMwOscEr1NT3AyTnzWcawW2s22xbiYHSsOAscNebf8A
 QY9+N5sHqiSAIadjJxWkSZQLgMjXymMcmin7bxJRPlSdqU1Wy5s7FddWSbEAdBXQbJ4P
 qQTqUPSn8PiyKC2v2HHwat6pB9pziRigY/5CxTOG6mQSo/3aUZrZY3dXi2nxgbE9dC8f
 vrUxEOGBQENWq4t8RAp18cVn6H/zNpI/eKqU7uqkK+JRV77EK9Q6LYg4Z5lWla6LYEpJ
 DSKJ1HBjEbcqfLE8FOPGzHenQOLtkpUmUK80iqpSTMTpbe4SaWIWkuhLO2p32+AtSNS6
 R7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JZl3h6tgMdfUPBlExBOvpw6l44LwiyONSy7q+Goj+uc=;
 b=AwmgAD95GLkKUlJriHelfQ42fcG50bT6vCW2fZ/qRrA9dEl5bFqG/uKgjDfRw8K+F0
 8YQcIguVWuWZf34x9cMC7/kBNBMrvltVidVb7+xFceMcnjx9RfmEijrE6EWhBcHyY3gc
 0KYwG+bBvzEjEMag+ZR2HREJqTHYgOggeEQrEoI9b8Cvq6OyhJ5g6sghtJFsS4P8wPa0
 2vnbdN6wI/CWTX4GC10HmZx1PbmVW36LZ+oSLJWOzpNlOiZhza5wjTSwDIHNpoK4qCQN
 /HFbp7v7b1T9m6OZeZi0vGgnn4yp7HvsRt2fa3QlRiwRJsY+JhFzM3r6xWIKMQBnr71M
 HvtA==
X-Gm-Message-State: AOAM531grhHecvz+9T9YRGleUQvXzyivUYmzpr1LoT/LexmXQ7g/TAKp
 LzfYD7rH0AneSJweyyGuokf6Fmqzeir72K3yYGQ=
X-Google-Smtp-Source: ABdhPJzC60ufZPZXPHBnNt+KTm1YC8+hL5Pjlx1sFsjPNzkCtyhyFNUkRbCsiRY04gQroeJNDZw9kxwIFnT7tkNk48M=
X-Received: by 2002:a25:6d44:: with SMTP id i65mr14848074ybc.517.1629342202607; 
 Wed, 18 Aug 2021 20:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210817211803.283639-1-richard.henderson@linaro.org>
 <20210817211803.283639-8-richard.henderson@linaro.org>
In-Reply-To: <20210817211803.283639-8-richard.henderson@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 19 Aug 2021 11:03:11 +0800
Message-ID: <CAEUhbmWyMcyqUk_EtO3qm4QbN7am7-TSD_dL_kFUS-VfJdM_ug@mail.gmail.com>
Subject: Re: [PATCH v2 07/21] target/riscv: Use gen_arith for mulh and mulhu
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
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
X-List-Received-Date: Thu, 19 Aug 2021 03:03:26 -0000

On Wed, Aug 18, 2021 at 5:23 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Split out gen_mulh and gen_mulhu and use the common helper.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/insn_trans/trans_rvm.c.inc | 40 +++++++++++--------------
>  1 file changed, 18 insertions(+), 22 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

