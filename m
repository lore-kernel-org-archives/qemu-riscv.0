Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lqnHD-0004GO-Ct
	for mharc-qemu-riscv@gnu.org; Tue, 08 Jun 2021 21:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lqnHB-0004Dy-UR; Tue, 08 Jun 2021 21:45:01 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:44715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lqnHA-0007Bz-9M; Tue, 08 Jun 2021 21:45:01 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id p184so33070720yba.11;
 Tue, 08 Jun 2021 18:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=afPcPje/KlvVbIRCXk+9tmxGNgLiKWQzrD5OEuxmA88=;
 b=qVQblnUVBCQZV+E4u63TsrLOEXr9WyPQEb6mDfImYg+/IVVK9fYvLl8aE3znxK58O1
 UXNZm1XVUmSO/qAo7FXKRuzD9CwBISsshvWXCEQdjmRYa/Hs6hDHgK6g+a3dHyYRkMPh
 qBcA3LxSXmF5irfBNxwSLOlhiM0pZy01YUiP5h47MqjRaBu55UScadXLCvA2Qf74M1+V
 w1jJdYaKpfsRkLiKj71uiwOnpYWcxLwE4ywApxO4q9A5jm8aRRpCx0sZIW52TkJwiTKT
 3lQnxVv01zExi0cVqRQkWtmtX+ckI5GwVwXn0S6r7pCIfxHGn5O+HinKPzVQcqUQOS41
 8sAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=afPcPje/KlvVbIRCXk+9tmxGNgLiKWQzrD5OEuxmA88=;
 b=HAjY5wfbXAGW5tueiEwitWAdtyyF/6y7kLrs0iizDlaWwORYZn3i/hRjvnwExSBGDs
 NzdEajX1xnNlcJjXCabCtVoi6UjF8puutYvY422M9hKdtAp527XRGAOpqXQSbSaQ1I1+
 wali7BQLTMQZ6xVlp96bhQPoBbGyRUUZN+HSqwbIJisPW+JIn4+YUCBD+VDAmRPZtQ46
 45AvfOa5Atu3JVkfIKCdlqG+HwwSFcWe8hGju4JxCvCpPA75ZwalcyGPvLXVuZvIwAXy
 GdMXTv9RuXhFh4Isc0gdhuzsiqLo+LPr02piP8dLIFqIeqeoYJvk31AmeR1ccEQeq15r
 vgaQ==
X-Gm-Message-State: AOAM5334dEtaFH/rv4wSC28gM1veO3GhNuj/XhheOIrgOjSUD5gA8E8M
 KPDq0OviRFJPld+8JwiAoz/BJIJh743DVlnaz5s=
X-Google-Smtp-Source: ABdhPJx59s2IHV1Se5nsBq4Qmv7oNYoL+l5Eh+KF409J+U/pEZK5hE3wfgEQiTmcOwrcZ61UjDz8jnJuDyAkAojsZq8=
X-Received: by 2002:a25:99c1:: with SMTP id q1mr34366215ybo.517.1623203098854; 
 Tue, 08 Jun 2021 18:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623196022.git.alistair.francis@wdc.com>
 <0f539904158bfd88ac0aa5d604d07df41ce8be60.1623196022.git.alistair.francis@wdc.com>
In-Reply-To: <0f539904158bfd88ac0aa5d604d07df41ce8be60.1623196022.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 9 Jun 2021 09:44:47 +0800
Message-ID: <CAEUhbmURPJHjvyntT7=btYt4+K-Q5xtab-kFAGs5PFL1a4M1jA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] hw/riscv: OpenTitan: Connect the mtime and
 mtimecmp timer
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
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
X-List-Received-Date: Wed, 09 Jun 2021 01:45:02 -0000

On Wed, Jun 9, 2021 at 7:49 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Connect the Ibex timer to the OpenTitan machine. The timer can trigger
> the RISC-V MIE interrupt as well as a custom device interrupt.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/riscv/opentitan.h |  5 ++++-
>  hw/riscv/opentitan.c         | 14 +++++++++++---
>  2 files changed, 15 insertions(+), 4 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

