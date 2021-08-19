Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGYL4-0000Zv-U4
	for mharc-qemu-riscv@gnu.org; Wed, 18 Aug 2021 23:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGYL2-0000UH-5x; Wed, 18 Aug 2021 23:03:28 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:36384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGYL0-0005Tx-UC; Wed, 18 Aug 2021 23:03:27 -0400
Received: by mail-yb1-xb29.google.com with SMTP id p4so9509401yba.3;
 Wed, 18 Aug 2021 20:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v4hTOjzrTh/bL+kgZWCWjg+MQ7+TT7NWQ7Qx+yEiFrI=;
 b=IKL7Tqo9myG0LEwwaS09CtUPJGHOiwhH+DCwXsTOXTi2Y5ddCpqdMQwAI9B+nlQwIG
 7eF/UUvjgaKO52D0BSur4e2lE9tyhgetTLP/ff7sAVHLmAY3VNGltLUAFqOMCeECUCAy
 T+EBhl1EN3B49lKT72ZbWPvoy5GL+cYB2Snh/D6mw3kGGEp0pQB+V0oeYDdMWR/H0Mq9
 erpD7mw/SG/Cs/uS9A/E2ITGGH9Wxteiyq/z+xXl6B/p9xYCtfDFG11aFp0lLJy/kj9V
 F0fw7jk2H9FJNBDtw7I5tEDtQ4IwQKKIrU+i9kGgkaC7vRRLo69zrMrz2qHofmb2fgH9
 4Eaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v4hTOjzrTh/bL+kgZWCWjg+MQ7+TT7NWQ7Qx+yEiFrI=;
 b=epkoqMbf/N9kiI3RRlf/5pwz1QUP+MsghJpR0iOe03NW62ykslWOrcoKtjcICb2tOC
 tpdKtVh9ke7KobUGUwXpjEH7fYuPpPGygJLgq5frpVuvZcir3rD+kQWUlWTYhU5fUSO1
 2DM/94jfGlup3PIc8TMmYwrvPyZb1hNRQ/3/czaenZ6R0+pGUKgW5WXt1DiJidbiu4up
 ki63UxcNC7/m4HYIylrGhU30hwBlpD19+4GqWIg1g8XkiU+3aQx3HDajiY3pQjQ0AFRT
 +usIwsZEGlgGFURL+B/lNm6f43fp8+rmNwWdDEOpN9ONj6vRwHZMBTHQyBMBT7drSD5C
 VJ1A==
X-Gm-Message-State: AOAM531VvT9FNdahHe5yn9/6GXioXKTFVw7kP9Y0q9tO6EbeT0cuIE0F
 Q9zmRUZ5yT8KI2FnF/kqUb4pWaoC84Ld9xDYqnU=
X-Google-Smtp-Source: ABdhPJw9rz95M0ezQ+UqcaKmL6tKtsqBtyPO0tgBoSA5bX0/UBVRPz6bihYzLbrhVMlio4ZwTgonrh6zWtbFwt61tn8=
X-Received: by 2002:a25:be09:: with SMTP id h9mr16737748ybk.239.1629342205667; 
 Wed, 18 Aug 2021 20:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210817211803.283639-1-richard.henderson@linaro.org>
 <20210817211803.283639-9-richard.henderson@linaro.org>
In-Reply-To: <20210817211803.283639-9-richard.henderson@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 19 Aug 2021 11:03:14 +0800
Message-ID: <CAEUhbmUQGD9p6xQ=cW1ADomDF7i5Sw=-c6NHBkJvk31eHr2UZw@mail.gmail.com>
Subject: Re: [PATCH v2 08/21] target/riscv: Move gen_* helpers for RVM
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb29.google.com
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
X-List-Received-Date: Thu, 19 Aug 2021 03:03:28 -0000

On Wed, Aug 18, 2021 at 5:18 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move these helpers near their use by the trans_*
> functions within insn_trans/trans_rvm.c.inc.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/translate.c                | 112 ------------------------
>  target/riscv/insn_trans/trans_rvm.c.inc | 112 ++++++++++++++++++++++++
>  2 files changed, 112 insertions(+), 112 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

