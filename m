Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhTA2-0004e7-Km
	for mharc-qemu-riscv@gnu.org; Mon, 01 Nov 2021 04:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mhTA1-0004du-UW; Mon, 01 Nov 2021 04:59:21 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:37562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mhT9z-0005FW-1k; Mon, 01 Nov 2021 04:59:21 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id d204so42897167ybb.4;
 Mon, 01 Nov 2021 01:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Te13DGIcy1aGp3eHDRMCeD23kvRA1qid/+2R26IZqvU=;
 b=T4cCbegjaou9UKtkccAB5II6AUOjCkvkQ35wPJQMsVHrcfJ7ygQlL2Xr/TtfHIqnMA
 50NuNCqmGVhBueILi6wjBL0X9cbibWjrzefuK+5617SF5k6uTdZRBjjPgzaswl4rjF/X
 C/6fhABWqfWH7mFuaTBsfeZEoTENWR8Ef/6ph4z5quLG0+KC4M3tTqUJjYVse9zkIEjy
 fI3IbJxm5kj4Se77WNxU7569S+Kh3MPXhbpuplqIIdCyYgBAOLM9+FaQwO02Yo4yEvzm
 FQXRv0xp05P0anTmrLSBx0NYgthXpi5I8teqk0RBuQckjOXXZorbEbhgCbya2iouX9iX
 EYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Te13DGIcy1aGp3eHDRMCeD23kvRA1qid/+2R26IZqvU=;
 b=0IaSj/NcdjjtEBlE8b1NAuOmmK7FLJh34XWVq3v0Ku+lQSFCy6g6XUaaD5evrp7lEL
 6JZ82oVz0ECrvl250cxsy0S2IMnCjjAlDSI0cDpPta75g0d3NVBzlWgt0MByuP+5vM7l
 800bkxxyZ67ClmqdHqseM9NUoa6Xfv4t1/ElUEiqR8Ezzz9gAVFjfiT9zUb+dyvOnF0y
 Q9CW6YFfu08pGdXnqw5eQBu8t7MXzol7d3f8nGPDeYyxsFC3Wsink0kF16KU+rBOvhzD
 PIobW/qJ/tpK29hXtDXKSgcN8HwHCNcTEfno5LLxrfSXlkH48GQHXEyBlJVUx05hkqF7
 ewoA==
X-Gm-Message-State: AOAM533y9UcHHU/25R5mlwdH/dICNFuQ58fmXYfwSXCUbbPUAeYPWMt5
 6xJvHQgLPabMH1jHi0S4xvmi98u5xt1YL9lOuGQ=
X-Google-Smtp-Source: ABdhPJzCd+xa1QsOLv0mK6rbMY5PNDxbnq/mtbKf2sqX3ePDtgmQm1KsnHl+EdZyTyY1t2XEKzbRGXZ2VmihvodTTpk=
X-Received: by 2002:a25:258c:: with SMTP id l134mr4812984ybl.40.1635757157866; 
 Mon, 01 Nov 2021 01:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211026064227.2014502-1-anup.patel@wdc.com>
 <20211026064227.2014502-2-anup.patel@wdc.com>
In-Reply-To: <20211026064227.2014502-2-anup.patel@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 1 Nov 2021 16:59:06 +0800
Message-ID: <CAEUhbmWOwJw8RoNaKXQQWWSnNLGMqhz8DXSCO+bMBR3qD9-fAQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/22] target/riscv: Fix trap cause for RV32 HS-mode
 CSR access from RV64 HS-mode
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 01 Nov 2021 08:59:22 -0000

On Tue, Oct 26, 2021 at 2:43 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> We should be returning illegal instruction trap when RV64 HS-mode tries
> to access RV32 HS-mode CSR.
>
> Fixes: d6f20dacea51 ("target/riscv: Fix 32-bit HS mode access permissions")
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/csr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

