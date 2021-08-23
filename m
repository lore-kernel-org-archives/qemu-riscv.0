Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mI35N-0004an-DH
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 02:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mI35K-0004ZO-85; Mon, 23 Aug 2021 02:05:26 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:36508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mI35H-00047g-8F; Mon, 23 Aug 2021 02:05:25 -0400
Received: by mail-il1-x12e.google.com with SMTP id x5so16029312ill.3;
 Sun, 22 Aug 2021 23:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G1TRZe5QiWOJs2Wmo0bQfrNOrUm8K0tWPeWR5v6rYfQ=;
 b=Fhh3kQFA2UOZxs5K/gh5t7G3B2s8MZY1h6zAjK96VU8hXzavJkoTMDBeXF/zJU8ejc
 /J2KDi4l92cehEmMILQ6YG6B4gWBmQ3Y+YFvN3wKGkXz9Di8n8bfk0zRedqWCiVhz7iD
 PelVD+3VLPJ/UsK/Pjn1Mw1MlQAJQRI0YcQaDwi8s9RKhGQaHb1nFapMBtSk7PcuJ5Gb
 x9SKsVPD7VcHktLWxX1h1tg1Z0MEws/T/RLz45n04RDMIEgWC5TUHp8/+KFlL5vDyBPE
 YnDkqOxfip6r4L4Tme6Wh8IMyN0PM15MPWaMS1VM7qDigUPKUo3jRJC5Wewl7+IGofyd
 vLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G1TRZe5QiWOJs2Wmo0bQfrNOrUm8K0tWPeWR5v6rYfQ=;
 b=LRpDZL08gz2gruTneWjsTm0K2OfIGGTEdISHx4ghU/2h7QTw3SJUnkrqXgpyJ3LzCJ
 YVmqY8duWANZN8km+odZmVE0zBv+KfRfwu12nY/Mhf75hkpOleO4Z8Y2jan/Ep7m6gRx
 U7PmK0Y2CgubTWk0GBNxArqjx/aj9psHKB9B8F+Ua/di7T6htWwyyQQhe30A7v81EhkU
 CjD6M8dkAGWMre/pT2FZzqPRhPeCsn5ejTC4A8N3AJByQOPdB68KaWQMP5n589uLTJk6
 QAGXmo6OQ3u83rrA6QgNPG6IpzOAZPmRqwM5kiNd1BsY6rbrSrHBxJ6uy5A4lSusynzM
 IS4g==
X-Gm-Message-State: AOAM532SFfgsTaCZ1AGOSpoYqzW0TBoxco1wBiLI54gE/w7nYzBu6aS9
 YYMMdzaRETFj9AS+wlf7LHRjBb+kT9mJ58FOALA=
X-Google-Smtp-Source: ABdhPJxFXZNnAF7dWmhlyT5t4O6YyiS7KyrVgChirEJ2cuelhBTDRxnxEBfgiiqdordPBm/yClCJ1WIdNngSohsB5sY=
X-Received: by 2002:a92:ce03:: with SMTP id b3mr21821263ilo.267.1629698721831; 
 Sun, 22 Aug 2021 23:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210820174257.548286-1-richard.henderson@linaro.org>
 <20210820174257.548286-3-richard.henderson@linaro.org>
 <CAEUhbmXzz5ptCzNit9hQtUkyJgb77wATN=5CSCcYMBnwLieSVQ@mail.gmail.com>
In-Reply-To: <CAEUhbmXzz5ptCzNit9hQtUkyJgb77wATN=5CSCcYMBnwLieSVQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Aug 2021 16:04:55 +1000
Message-ID: <CAKmqyKNzJxzJLFxEwxXViyv09WdzWGA2-d9V9A30xvJGAZgipA@mail.gmail.com>
Subject: Re: [PATCH v4 02/21] tests/tcg/riscv64: Add test for division
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Mon, 23 Aug 2021 06:05:26 -0000

On Mon, Aug 23, 2021 at 1:19 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Sat, Aug 21, 2021 at 1:43 AM Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> > ---
> >  tests/tcg/riscv64/test-div.c      | 58 +++++++++++++++++++++++++++++++
> >  tests/tcg/riscv64/Makefile.target |  5 +++
> >  2 files changed, 63 insertions(+)
> >  create mode 100644 tests/tcg/riscv64/test-div.c
> >  create mode 100644 tests/tcg/riscv64/Makefile.target
> >
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Tested-by: Bin Meng <bmeng.cn@gmail.com>
>

