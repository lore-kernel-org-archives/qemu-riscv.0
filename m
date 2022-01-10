Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n6nhC-0001NG-K0
	for mharc-qemu-riscv@gnu.org; Mon, 10 Jan 2022 00:58:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n6ngy-0001Lo-Tu; Mon, 10 Jan 2022 00:58:08 -0500
Received: from [2607:f8b0:4864:20::b2a] (port=40640
 helo=mail-yb1-xb2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1n6ngx-00085R-JV; Mon, 10 Jan 2022 00:58:04 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id e198so12433302ybf.7;
 Sun, 09 Jan 2022 21:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=31k5WQCg3/Zfv/bEtr3cXZBJbqU/mUHqYQ26YebCBFg=;
 b=Y4mlwgIF+jm6TUe6ox0b5cyDU+BiZ8jTfSqV2pd/l8EOw9pj1d5tU8TPp5q/JkfUjb
 QSDg8Le8JzE2A8uF0CJmSXiGuH4WGlDzQRZoGA5B+hPMjNQrooJUoBDSXmWgYJ3WWQcS
 20YAMW5Z1GJS++xfrQ7cloqnY0pp4LEDzlZ7ZcKDRifIpyz4gQcF/al8XIQ2m1FgMSTm
 6qA8+W/BrFHAJLpbrxLAAdbGs1lO4YThAyigRgxfksE9VHCCyHyvmPFV5KzZSvN9OpgC
 EDkNkAXUPFX/S9syDHD2BgX0yKFcfR+mj7Gomig7sHVlohuxr/g50N19bIdJxYiCTEk+
 DURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=31k5WQCg3/Zfv/bEtr3cXZBJbqU/mUHqYQ26YebCBFg=;
 b=ZisH1YCHcQZYJaHqIuzry25xkNN7SuWJtsLv+lO7Km1ZzH+Nbgno2Vy7R6YVJA1l27
 1juBE32eN0K+0m8rmXM4KeivSffN9gjzNnIke2FKlK2x5eKLI5BfDhH2552pyDssvv7V
 Yl4SJLtXe8C5uIClTOgrqq48xJXwjDmcaxCj7BC3VbzeHc95EWMzCV1xfQvwZYFbRCoU
 EvVFR3IcbimelaRtBLiZlGC3wp3N6L984+lMYopTZ9LGKFbO1Z++gGPC3PwBL47g1Blt
 ZCE6GDhES71z2lahMfRLv+gZQyXeKDjQAMO/qMN7CukO9qLlv7rh6oA1Z7gDp+QBS/zc
 YMzw==
X-Gm-Message-State: AOAM532oYFGg1B0mQkRmV4XWQzN+/Dw+g8EXICFJ3OEDOkE0kY1Dzgct
 7IOu27lNoHhpZS9Y2CGBBnTJTmJdyyIAucHVow8=
X-Google-Smtp-Source: ABdhPJw+5IufLslWR6T0eovG9T/Se4EDmaYaADFxQqOKDljoz+yHGdf84/YIqIWqprnzavG4dCBPN3z9jRoALubTu0Y=
X-Received: by 2002:a25:9012:: with SMTP id s18mr1724455ybl.148.1641794279430; 
 Sun, 09 Jan 2022 21:57:59 -0800 (PST)
MIME-Version: 1.0
References: <20220110051606.4031241-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220110051606.4031241-1-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 10 Jan 2022 13:57:48 +0800
Message-ID: <CAEUhbmXHg=j_E=Ge-NY5vPdmOU8ooKWvFf7876+ocHrYhT1dgQ@mail.gmail.com>
Subject: Re: [PATCH] hw: timer: ibex_timer: Fixup reading w/o register
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair23@gmail.com>, wilfred.mallawa@wdc.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
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
X-List-Received-Date: Mon, 10 Jan 2022 05:58:12 -0000

On Mon, Jan 10, 2022 at 1:16 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> This change fixes a bug where a write only register is read.
> As per https://docs.opentitan.org/hw/ip/rv_timer/doc/#register-table
> the 'INTR_TEST0' register is write only.
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> ---
>  hw/timer/ibex_timer.c         | 14 +++++---------
>  include/hw/timer/ibex_timer.h |  1 -
>  2 files changed, 5 insertions(+), 10 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

