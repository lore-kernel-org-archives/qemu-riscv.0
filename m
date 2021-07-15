Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m3wcZ-0000Sd-JV
	for mharc-qemu-riscv@gnu.org; Thu, 15 Jul 2021 04:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m3wcW-0000Eh-L0; Thu, 15 Jul 2021 04:21:24 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:43813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m3wcV-0007LI-0u; Thu, 15 Jul 2021 04:21:24 -0400
Received: by mail-yb1-xb36.google.com with SMTP id g5so7704142ybu.10;
 Thu, 15 Jul 2021 01:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=irOfS5g1oiWeLizuYzrN0am65BmhQtmvPc78xsBYYRw=;
 b=ri/2ye2vxnzxVaKj+bcEevPd4CiAAQ1zuedqNKtW6ke95CZp2/W2lGXOuWKTHySiVj
 OsGOZ82cf1Soay7hBncoUDLEMVzJm87kFpNJ8lvaKbYQv2R7UVhc1TiudjwBAXG20NY7
 PzxzXuJkeX5pu1nVLXNks741BojUfhZe7K6SjgBldqIk6qM2d87aYw9spCJRD8ku5ki4
 qcPabyEMNVdA7b1P0sMbFAe8LQhInrvxJDa/+i61hcqvqxtU+8Ya4ZAZ0dTNLu+z3eTT
 +SkOnY14cPFBKNlZHULlsdKhsrg0z3CtpMons+AxCzrSEqgrmB3HZ6kFWHw9wsYOjk7N
 KJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=irOfS5g1oiWeLizuYzrN0am65BmhQtmvPc78xsBYYRw=;
 b=fETCFA+bjK3GRYXwezkmhS2nrqZRHxNKB1jKZQVhzbo3VI+hxaXRwrj9EzXprG3AVa
 G/EGsdIqstiXCe48g5pOpaMeb5avlXeLCb6/fKX+W99rfgWJNIpntgKkms4T00im1LLv
 xFL2JPX5ozUkVspa4svBGyOGIZkEtFbLPLNFcWyrBVrU48TuW0psdrgiQ3zUViGFfQ4c
 9AruvppJ2mt76fD/FSyeOWE6yL/1oq5zUjjORmPFQaE5I5kY2R7/7ICptXp6BtUMlUMM
 1Oe6uRdEMAWRAmWhr+iVjSmtUfD/9RgSMfOjuMWP/qU886AL6Sy4zt/+fs339wwV4KMV
 yRPQ==
X-Gm-Message-State: AOAM5329477DX2OXbd9ohw1Us3Be1tl87RYHKhhIhVt9+Mhd3U3NpN/g
 UupAkqUOWAFFH9IBhzkrCnV14x86VmrCfPEQxSs=
X-Google-Smtp-Source: ABdhPJywF9PNWb7DsScYjZ9KjlW/a0TzTW55PH3nlGF7ytBPWxfmXxgrRxU9TkOPF9OX+LsdKJB0MhTAUYxBiuUZJys=
X-Received: by 2002:a25:dcd:: with SMTP id 196mr3901488ybn.306.1626337280617; 
 Thu, 15 Jul 2021 01:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <5ebc64a6885af5cc3812beb71621cb7615556a1e.1626247467.git.alistair.francis@wdc.com>
In-Reply-To: <5ebc64a6885af5cc3812beb71621cb7615556a1e.1626247467.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 15 Jul 2021 16:21:09 +0800
Message-ID: <CAEUhbmXpu890C_s1yXUC1+kP-OuiKzNZ5WXVcbGJsNFCuV0r7Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] target/riscv: Expose interrupt pending bits as
 GPIO lines
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
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
X-List-Received-Date: Thu, 15 Jul 2021 08:21:25 -0000

On Wed, Jul 14, 2021 at 3:24 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Expose the 12 interrupt pending bits in MIP as GPIO lines.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>  target/riscv/cpu.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>

Tested-by: Bin Meng <bmeng.cn@gmail.com>

