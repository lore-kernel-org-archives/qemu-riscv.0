Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGd2G-00012z-DG
	for mharc-qemu-riscv@gnu.org; Thu, 19 Aug 2021 04:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGd2F-00010e-Gg; Thu, 19 Aug 2021 04:04:23 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:40567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGd2B-0005pa-IL; Thu, 19 Aug 2021 04:04:23 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id i8so10728494ybt.7;
 Thu, 19 Aug 2021 01:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Oq3LlyhCJEenOkDLDUxOo0rr4CwO8euEAhjIYHK1iQ0=;
 b=V43n2lUfCPLqSBdI1lxFbm0JJQZJaBqwrdQxrE1kzYkB/4Ws6dUOLPcVJ4+vFkWM1K
 1885x1BYuYngIEfEa3XoDKitnwQyfn8eO5hDxV1q5O5IYmG55TbZravvJCd652T3Y6gf
 5lvRxqI8edEgtMaxVS7HH0gk3jCZgVoyayBBzK3v5q5ZC2TH6CEhIY/Ut4yueUkVl0gS
 8II1Zneq3gmd/IRA2w0jqMuc9tUpFsDJYNuQS37BNJciLeo06BM7B/dTT0kPk+9oiWQi
 jMX2qmBSpQtWbqfzVtVwT7fr+b7uZM8HmrNHG6BJRAae6J5yAPuKSd3+k5jOfAA3su2B
 O4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Oq3LlyhCJEenOkDLDUxOo0rr4CwO8euEAhjIYHK1iQ0=;
 b=DlxXOksEc6g/itkJmstZxxAz0AFsF7F5iGvnKGAs+iPPe1fNWEYK+EyGFqxuf5Iu7y
 m/onjtQb6u8bZKB0Mxd8oDOynyq1bumHyiAvFp4duuz+zfQvYZF7VePoHzR9MPAF39Xk
 qSlrlYwT7nWp2Hyaz8Xdbs+GBpMVbqnQyksiwedT2w20pV7O87aLkGoM+aXYPztxD/Fk
 3sBih+pTYBCUJu/MMYRk7mYkJaTySW7zufT+EYF7kkQ3t9WeSCSnXNCyEOE1IH+QwDPP
 yxDd3HzjJLIU3pZkWlCOsckJ/vR+ZwCt2pNpb/8X1FX0AkXJHq+oY481QesmuPzc0FmF
 Hxww==
X-Gm-Message-State: AOAM530q/4y4Z2GKzuhqC2Uiv5N7XQ6PI6bsOuUu77UbNwrgl+m4tNqf
 QzjpOTYtvUKjJdfwkszLtBGKTkaqM+I0+mi4850=
X-Google-Smtp-Source: ABdhPJyYO6XE6iNOJniwimJrk6x8KTdMlcJxJob8dD0sKsX+me/VMGmLnJf6wwJM7bz07uRWymc7AgpAu6WVNOo2xE8=
X-Received: by 2002:a25:cf8a:: with SMTP id
 f132mr17703187ybg.387.1629360255068; 
 Thu, 19 Aug 2021 01:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210817211803.283639-1-richard.henderson@linaro.org>
 <20210817211803.283639-17-richard.henderson@linaro.org>
In-Reply-To: <20210817211803.283639-17-richard.henderson@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 19 Aug 2021 16:04:03 +0800
Message-ID: <CAEUhbmWUkur7nKxAGLew4m529jAkLiyEcTdaQXKYvMkchrTXJA@mail.gmail.com>
Subject: Re: [PATCH v2 16/21] target/riscv: Use {get,dest}_gpr for RVA
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
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
X-List-Received-Date: Thu, 19 Aug 2021 08:04:23 -0000

On Wed, Aug 18, 2021 at 5:24 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/insn_trans/trans_rva.c.inc | 47 ++++++++++---------------
>  1 file changed, 19 insertions(+), 28 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

