Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lU96o-0003uO-S4
	for mharc-qemu-riscv@gnu.org; Wed, 07 Apr 2021 10:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lU96m-0003rw-RT; Wed, 07 Apr 2021 10:24:40 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:42542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lU96g-0008K8-Vq; Wed, 07 Apr 2021 10:24:40 -0400
Received: by mail-yb1-xb29.google.com with SMTP id c195so20309983ybf.9;
 Wed, 07 Apr 2021 07:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qD4JmBSc3QWTzz5uaLSh7Ol8TnQeutrarHi/EctpLf8=;
 b=DQJR+8POs7rQNBjp0ryVCHZyqv5f6JorlEA8oNvbHKgaw74Jrwg9JLILBKazw7iBaS
 alZZ9UDVhRb93WmD5SI0Rv/fdIHX5j5uqNoFH8tY59S20tkIyHP59CBKDaNb5vVz24Of
 58OnAwy+SjfKGLYQsb/cnHtc1jfuhjrFKnNTlsnfb92BYTE5HcoEZdroow6NydATN4v5
 YBG3ftc84JXcxUKEwfo5fdFYtAZMCd5406zDI93WAzGIVx98bSQ+i9ApG1DEARoHems9
 4+GELvw/cPbmKXgcnNPXRKWO5KwGHNoLlIo/yQ1T8qIfPh1i5Zl7F31C+wtLr2pYsEvc
 tMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qD4JmBSc3QWTzz5uaLSh7Ol8TnQeutrarHi/EctpLf8=;
 b=O+n7WJscUPSXrOk8Y2qk3nYYTatZy6Lyr5rhApy7FWrI5a2+qukcGD/xulld83V79S
 QIXtyZyku6ODN16LT/I2CZ6oeJpwWUc+5mMbmU7Xhg4cyNcR4ehSqbCxodNwhDRzArnE
 8FymTY/5DPP4YhIV4QkV9h+ZPxdOVRgHrfHSBQ7AQATDLDd0TjbEF10ocHFKz5az3AZ5
 W7qD9xmCut10xah8gAoZdZ0ldlXUXwr8f1zs9B/R9CVujJI0y0Ti/r8naBNHYWcohdAb
 41LHcDiXw0SZKVn9RCTh9n8V4wypTEMPLdmOAmNqnszPEilxUlJR3fuUxpIgnL1ONaNK
 kN6g==
X-Gm-Message-State: AOAM53124f/jRuGxHUJkuQPgYUqmv/HcQTbwstZ4jfAe97Nzd5AE5m5Y
 zmeTJJxh//TIgy0bNV0AmZGjYkzRqS26F6ib0ZA=
X-Google-Smtp-Source: ABdhPJza+QH7yOOvMgtlrEaaeDGNOOKkZG3RMV1kAmt3ssovtXXs7CtjTnZgrlWCX480p4RDxW4UcncDHzPSbm1Yqx4=
X-Received: by 2002:a25:afca:: with SMTP id d10mr4439334ybj.517.1617805473688; 
 Wed, 07 Apr 2021 07:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617367533.git.alistair.francis@wdc.com>
 <5bf4e802b52fc4f8e57c8c03346cec716ea3ce32.1617367533.git.alistair.francis@wdc.com>
In-Reply-To: <5bf4e802b52fc4f8e57c8c03346cec716ea3ce32.1617367533.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 7 Apr 2021 22:24:22 +0800
Message-ID: <CAEUhbmXyyQYAL3fxE0tO094BO-Ry+BO0GW4nZX9fS9jLri_x7A@mail.gmail.com>
Subject: Re: [PATCH v1 2/8] target/riscv: Define ePMP mseccfg
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>,
 Ethan.Lee.QNL@gmail.com, weiying_hou@outlook.com, camiyoru@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb29.google.com
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
X-List-Received-Date: Wed, 07 Apr 2021 14:24:41 -0000

On Fri, Apr 2, 2021 at 8:49 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> From: Hou Weiying <weiying_hou@outlook.com>
>
> Use address  0x390 and 0x391 for the ePMP CSRs.

nits: remove one space before 0x390

>
> Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
> Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
> Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Message-Id: <SG2PR02MB2634D85E5DF0C2BB540AE1BB93450@SG2PR02MB2634.apcprd02.prod.outlook.com>
> [ Changes by AF:
>  - Tidy up commit message
> ]
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_bits.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index caf4599207..32e1ee92dc 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -232,6 +232,9 @@
>  #define CSR_MTINST          0x34a
>  #define CSR_MTVAL2          0x34b
>
> +/* Enhanced PMP */

nits: Enhanced Physical Memory Protection ?

> +#define CSR_MSECCFG         0x390
> +#define CSR_MSECCFGH        0x391
>  /* Physical Memory Protection */
>  #define CSR_PMPCFG0         0x3a0
>  #define CSR_PMPCFG1         0x3a1

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Regards,
Bin

