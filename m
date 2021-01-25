Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l4Bcx-0007ju-Sn
	for mharc-qemu-riscv@gnu.org; Mon, 25 Jan 2021 18:50:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l4Bcv-0007fU-Ky; Mon, 25 Jan 2021 18:50:33 -0500
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:36187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l4Bct-0003HC-W4; Mon, 25 Jan 2021 18:50:33 -0500
Received: by mail-io1-xd29.google.com with SMTP id d81so30225234iof.3;
 Mon, 25 Jan 2021 15:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZNIIkHaFgeBDRziBwcU71ulE4BcncZkLf8clBCfa/sM=;
 b=lKUGLuX0WtCtxXN1yl1r/3Uu0cT0b0eZbhDHklJnVckdzcIqhYy6Oit6T8QF0gQZO8
 5DA2XJM1spMopIHgbL8a06xY4o8+m2RUqRZKYLyQr32jiV5eZtXUDpkDACRvJQBGfcUS
 QkjtCF9XyJsFnO2ePsDNwYDh1lXjHFaW7+60rx4E3o8U8MlaPHGobtZtH2RrZvolWfco
 2QCMT0KlIPhA6CVIbd1F1lWfJpvmuCrZc9CJO2m8dORjiDZCV3OkIfaJiTZ3jB3OvK+4
 GsrRSLJrwgaA8gkRDDB3sJbA3iimLQjZ0sCDykD3IoWmyt0WqBl/V6zeY0igJczmsrXO
 8KiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZNIIkHaFgeBDRziBwcU71ulE4BcncZkLf8clBCfa/sM=;
 b=CCTftySeS52cVDCe9tWnAILBkm5WYcOP1Egm1KxFuW11ADPP4ZtOCmQwIXDEjEm3BR
 qHtsRHz/UydP/TpO7I/xn7F3X5EJdI8/NPBTI1LAEHluT0cUE4BACzagedvAgHOUUvB6
 LEMHJfuJ3Z5KC6bfs2vnRM4760xNsxMuxlkV6CAyQz7qK9imY9kTQUlOvWHP3q5c5GWv
 vQ5R8Bd8eprhhWAo89otthCEhaZJ1pztY8uF4urU50u4AnqDWdc8GRS0Sn+rSZuHD2YV
 qFnkxNv9SgZ103cblYeBMJGIPb8FM3/UUvqP674aUhuj13QeNvc1lQUrKvp5VvQ+1lU9
 DMmA==
X-Gm-Message-State: AOAM53304btauyQPxIb4Jyf6+T0BJQRSmyncG2NMKXB/kujaHUiYhAcx
 6XQD9IHd+kzty3Nmjl1RewCJBIaAGMt/DHIs6wE=
X-Google-Smtp-Source: ABdhPJwC5dZtW6JDUP6FDuxlHeVJeBA8VMJrW37cwVmT0IdkIjnDmtCyD8L2ZE6RtQQCTaVLjLu9iSKmwNyqaYuIONI=
X-Received: by 2002:a6b:7d42:: with SMTP id d2mr2214733ioq.176.1611618630116; 
 Mon, 25 Jan 2021 15:50:30 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
 <20210112093950.17530-28-frank.chang@sifive.com>
In-Reply-To: <20210112093950.17530-28-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Jan 2021 15:50:03 -0800
Message-ID: <CAKmqyKN8wrOASETsT9g4BdhEYL3_BUZ_DsAx74JhJADf2eDnBA@mail.gmail.com>
Subject: Re: [PATCH v6 27/72] target/riscv: rvv-1.0: floating-point classify
 instructions
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Mon, 25 Jan 2021 23:50:34 -0000

On Tue, Jan 12, 2021 at 2:03 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32.decode | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index c0053cfb828..a0a47dbceb3 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -561,7 +561,7 @@ vmfgt_vf        011101 . ..... ..... 101 ..... 1010111 @r_vm
>  vmfge_vf        011111 . ..... ..... 101 ..... 1010111 @r_vm
>  vmford_vv       011010 . ..... ..... 001 ..... 1010111 @r_vm
>  vmford_vf       011010 . ..... ..... 101 ..... 1010111 @r_vm
> -vfclass_v       100011 . ..... 10000 001 ..... 1010111 @r2_vm
> +vfclass_v       010011 . ..... 10000 001 ..... 1010111 @r2_vm
>  vfmerge_vfm     010111 0 ..... ..... 101 ..... 1010111 @r_vm_0
>  vfmv_v_f        010111 1 00000 ..... 101 ..... 1010111 @r2
>  vfcvt_xu_f_v    100010 . ..... 00000 001 ..... 1010111 @r2_vm
> --
> 2.17.1
>
>

