Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGbOv-00033D-A4
	for mharc-qemu-riscv@gnu.org; Thu, 19 Aug 2021 02:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGbOt-0002yB-Fk; Thu, 19 Aug 2021 02:19:39 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:39622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGbOs-0006Tb-2M; Thu, 19 Aug 2021 02:19:39 -0400
Received: by mail-yb1-xb31.google.com with SMTP id a126so10233971ybg.6;
 Wed, 18 Aug 2021 23:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hBCScDBLUsaaZLN7Gh2vyVp7ew/0Lu033YPtQJ9DU3c=;
 b=JoSbdQVI4U0jnWOJ1yNgbyONOLnriEUF7WTF/cKTwEhnDPSpcdWj+mteL7IW+U+YIK
 wCcjSxVeCRVnioWWKCKxgCvgzLbhaJzS0XkzcWKK8aVaeyx8qaw8zXpRR2+R2Mnket5C
 MBqK/uvQMXnnt4merN9p+5Pa+c0H+9Wsfrd+PMAVU+3m5zuhgxsLP9rXxdFKKFzpKvZy
 yTRApY159i/hIKmuTWdKBukLzmVn/qx93fb/thCCbA0GVUYH9QOVcIH0tfcRMhO8XC9v
 8wGrLCD1NKish1q1DvBBZ92ZiKZpRKuIsXudqc6JCWF2++o43N1AL5u2KYgum0BHu40v
 TlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hBCScDBLUsaaZLN7Gh2vyVp7ew/0Lu033YPtQJ9DU3c=;
 b=lhhK6Xk3aq1RTIVAJWgf1PC6heeZrqyeHmsYp3uLecnMNYT+ftIDOdB6KzKrxiEpYa
 EKKtQqG28uqKgk/eP6jPJpBETxnvOihrvWtQ/5E/GH2k2pV5+yPo2tpfXFfBVtudIJIE
 Zlwg6WbV0pyXRYhOoGUlnr055GvfiO5OI+KMNfPJpfeJOBx3FUpSD/slo6tFSarUCJKB
 as1IBVg8HFd6olTje8pjt7ifNLkScbKvuJ1qqy667qOEi1015q6WiC7IPEO8eqpG6OCN
 g3jZpDBjQg6TmWxB0Kp6cPljsrJ/d1Ww+xImbXnuz3uCb7vqnMCvnKGuYnd+a5Lhs+OI
 XFvQ==
X-Gm-Message-State: AOAM533+xIzIX1kI6+oZ8wemYVX7u4feBTDFJV8Acv4GwjkIy6jCPQJd
 qRGkcrcNz7q/APMnTNErThhW2ljLvyvF1tsArNE=
X-Google-Smtp-Source: ABdhPJyp/2PNm6a9CdXSkefNJQE5KjK58Y3oJFzeAfjlM9WX7aeQqyCTJ6lewIjvS4t5QV7WsTN3RQRBUir3LD6ynxs=
X-Received: by 2002:a25:be09:: with SMTP id h9mr17577245ybk.239.1629353976497; 
 Wed, 18 Aug 2021 23:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210817211803.283639-1-richard.henderson@linaro.org>
 <20210817211803.283639-14-richard.henderson@linaro.org>
In-Reply-To: <20210817211803.283639-14-richard.henderson@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 19 Aug 2021 14:19:25 +0800
Message-ID: <CAEUhbmUpkyRM+fSFeKKEnFXmdTDZnEVT2v7=FX+or20XeqEv5g@mail.gmail.com>
Subject: Re: [PATCH v2 13/21] target/riscv: Use get_gpr in branches
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 liuzhiwei <zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Thu, 19 Aug 2021 06:19:40 -0000

On Wed, Aug 18, 2021 at 5:26 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Narrow the scope of t0 in trans_jalr.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/insn_trans/trans_rvi.c.inc | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

