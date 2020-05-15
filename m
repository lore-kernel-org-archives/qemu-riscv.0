Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jZTqd-0003sI-Jk
	for mharc-qemu-riscv@gnu.org; Fri, 15 May 2020 02:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jZTqb-0003nH-Tk; Fri, 15 May 2020 02:29:29 -0400
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:38390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jZTqb-0000px-6W; Fri, 15 May 2020 02:29:29 -0400
Received: by mail-yb1-xb44.google.com with SMTP id m10so576919ybf.5;
 Thu, 14 May 2020 23:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qcklaDwwDezZ5j34inhDX3YDAcvH2nd4C8UsHQ6VlcY=;
 b=I7+ULXrTE9SY6f2OqkOCYHJuKLAfdRZO7rBx8ZGL+MtgjWgmDlINtXbkwI62vIi+mx
 kjRq60FTTAaPUHAKWpIZuwItQwefUo0uYNyG5mds5sdeuvZj9AaTynBXNv4OHhOO26o6
 L4NGqF83rhNaUJadO1xtBX2lkjPJFhP7YhKKlqiD3+1gelICidbLONnShzuv/8TlxEXh
 PtRTonVXbo3OCCj8Efn7UESTM5jfKokPTT9hWLVCFcAgyXi5kfL9V0nv4v8hzUl6H60r
 CxYAJwMTLza3NE9u6+1gKVcQG7i5ZF4lehPMhmc11Xv1BqWgbna1ovP+G0GkzIR4STxU
 Te1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qcklaDwwDezZ5j34inhDX3YDAcvH2nd4C8UsHQ6VlcY=;
 b=maxViPMulH7FzmEfHFHSmilXrgVcmUUZRLnDai8p9r6i+KJBXUoEogV12/cmFe1A9A
 OAxpAoAEnjcnHnB3X/rFAF9woVJ3w2n7BT2nCj8C6jo84SXEAWGAqAVt6qomt5kLFybS
 wofBexGM8ioYrFw1SSztVmVPg0vqtOTLcBCU0/AUJIqTMx7pDlVIBqbk+a0qqvWvIRyp
 fpmRVmiUzkLmdh5JXQu804AmMMI18EqlVPd1M0DpOp10jqSrRu/iHA9DxboGtlrJlecb
 v97HRbCvWALWuUudodO7dSUBKMLOjMP/BPyk8ykyn/K0e+Jx3h+7Kw1ID4pCWUnhhnty
 FMsQ==
X-Gm-Message-State: AOAM530WaP1/5HMxk06e6aUu88I5bk491gWQUkXwltDdeJbKx8f59rcv
 T0Ok1l2cxyD5aspSXCOvHO/MFMDEqK6MDpzLdgc=
X-Google-Smtp-Source: ABdhPJzO6EviC1yVtlVGkVKU398QIxxhBG9MUV/WP7mfATUALdA6CW49P6l3yujz6X4Nsct8tNJm42uhdextTKk0j70=
X-Received: by 2002:a25:ab89:: with SMTP id v9mr3118246ybi.306.1589524167793; 
 Thu, 14 May 2020 23:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588878756.git.alistair.francis@wdc.com>
 <786141c80bd14a93395d68e693060d89530d9d3d.1588878756.git.alistair.francis@wdc.com>
In-Reply-To: <786141c80bd14a93395d68e693060d89530d9d3d.1588878756.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 15 May 2020 14:29:16 +0800
Message-ID: <CAEUhbmWCXuvDP_EQDQ8Opmr0joKkYqmEmAtUObO_MyGN0Q=c5g@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] riscv/opentitan: Connect the UART device
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b44;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 15 May 2020 06:29:30 -0000

On Fri, May 8, 2020 at 3:24 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/opentitan.c         | 24 ++++++++++++++++++++++--
>  include/hw/riscv/opentitan.h | 13 +++++++++++++
>  2 files changed, 35 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>

