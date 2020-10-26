Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kWyIL-0001dh-Jj
	for mharc-qemu-riscv@gnu.org; Mon, 26 Oct 2020 04:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kWyIJ-0001aL-Fm; Mon, 26 Oct 2020 04:55:59 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:40829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kWyIH-0005bL-Un; Mon, 26 Oct 2020 04:55:59 -0400
Received: by mail-yb1-xb42.google.com with SMTP id n142so7005830ybf.7;
 Mon, 26 Oct 2020 01:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sYz1s3JurRxwegTIJew+l8B1S3/bunVBQ+Y+O4865aY=;
 b=OjMtYAiRLXKNt0sOP/JP9kIBLRcKBw1tFU4hrTA/ymxB0a1Mpov+3n5TOddmpm0FJh
 JT/3o6LYe+98TJhQQG2qlHQJubA7e/AgVYtDl9mKeB/GTORdDdG3AgHIrb0KdfqO8K/N
 Wub3gW0MGLuLJ8m69CK3O08tap63/EpdGlvFY6VTLO/lwySanUk1ZeGzPhmv75fO956e
 0A4nYxHCsyTrQq2WpKEMlcKWogdrrw2wQS+RyKu0v7eXzDXsJk7frLIdax4RaYumlfry
 BE53C++Fn4C/bNQHykyqO+KDAU4A3rMaYrUl20Ik8U5laSb5bp3BAd6xvOz4ANbhg8AD
 VHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sYz1s3JurRxwegTIJew+l8B1S3/bunVBQ+Y+O4865aY=;
 b=WH5yy1pZ2bs8ZhOdKN1DtY8SUeDqJzcTOzatRcaRr/JWRgz+DOxsZyiOZuf5b3oPXv
 HeneJ4NzP8MZQfaWk6AEYDnC12yCz4ZuCjpSwafxbUoLDiqRUpCfWvwuc1pj2T6Xqatt
 TG/mkhLnC3OWleRyD5EGSWyYHRRBFeyhCefFos1/OtTZmcNi28Z7mhhnP1t+7CeNjykR
 zXdDSP/9HIt62s3AHhlOgvwK16fPhcXy2SRTcpaRnt1hWczwPChyYqERBrdcIaSQSVs9
 //SCp+sX/pr9r+EqgnyYCqDkem3MhvemwcOh6HgmjBOoWObVFOFpO1PLpX7nbCY+YqYI
 B6Gw==
X-Gm-Message-State: AOAM531d99pQBxPZOj6YlFNYrVB7T6Di3KK3qtTj+YiCQttyEqRAZRpo
 MUJYJbk5ft8VjzoJitC7EubmzRq6DrVRUl46MN/8H5d4
X-Google-Smtp-Source: ABdhPJxW+8cBoZBpDPZz3G4cPcoo/cE1yMgEsjNiuNOlGelZ6YsozKYLbig/Ouh8lem7gLox43OUhtfjqx2lcPW0pGo=
X-Received: by 2002:a25:520a:: with SMTP id g10mr18952354ybb.152.1603702556475; 
 Mon, 26 Oct 2020 01:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1603467169.git.alistair.francis@wdc.com>
 <67626d271ea0b75a3c5479f3aaf07c565b1d1d83.1603467169.git.alistair.francis@wdc.com>
In-Reply-To: <67626d271ea0b75a3c5479f3aaf07c565b1d1d83.1603467169.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 26 Oct 2020 16:55:45 +0800
Message-ID: <CAEUhbmU2Q3czD7uS5N1JKZxFN0oyKoft4ZNFq0SR99tBTkr6PA@mail.gmail.com>
Subject: Re: [PATCH v1 01/16] target/riscv: Add a TYPE_RISCV_CPU_BASE CPU
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b42;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Mon, 26 Oct 2020 08:55:59 -0000

On Fri, Oct 23, 2020 at 11:44 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Bin Meng <bin.meng@windriver.com>

