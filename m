Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lThHr-0002o0-Ib
	for mharc-qemu-riscv@gnu.org; Tue, 06 Apr 2021 04:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lThHX-0002m4-JR; Tue, 06 Apr 2021 04:42:04 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:46844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lThHV-0002q2-7W; Tue, 06 Apr 2021 04:41:55 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id e188so4317064ybb.13;
 Tue, 06 Apr 2021 01:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h6rjvImiGMVCW0t3J+utBXlpy4VPpbMLma6GxaEOi+Q=;
 b=afjQ52+k5ZVGs+DLKcXCxs3X16nf9SFZHQWPL2XOtdJuJ6LCWeHr7Z3cGGWeAfKMLa
 AMD+1G1SKVj7sTILXZqXUE/myB1b24TxCZ8JQ/kUQpyL5h73APcsT+ec5b5RIQhxfGc+
 V8Y7iWA6by9G1FtSIVpFBd4lJooqzlnvlvK+Bn4qJlpmJ6gvR/do7f9g2jyaeXLesS/j
 SuaaLeCJJbFtd8mlQwY2CvdwGSfURinPjnW/k4WlaEVv+B0/geQdr3+8NDYfNBvrF1We
 gC+gdRyed8FsmynM4RTtczLTLDpxvZ7HSfQwmDzRArHyw5FDESFRQONqMYH8cWcxtPtv
 Qlmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h6rjvImiGMVCW0t3J+utBXlpy4VPpbMLma6GxaEOi+Q=;
 b=U8FgpGZbQ7NyuIXd/Fkut5Eg1Ea/nlvv99KmSzKsb8YlwlXViVGWXU2cH1fpnFWet6
 aFPa+olWYv7A1z7l7FAwDzGLO2TbWe4j1RsFHN0gOt+YNrRXEfk4R1C982rh6A/3Vv9J
 8GFS2X45olGcLozxllHaN7AEndCQVpMJPg6z9NYgF5rZLyYdhFf2jdGAwtnx/HArH7XO
 32FSthfXaa1s4JhC5JvEHFG4IaUMcMco1MtnDtBAzxgnRs+pAmdmrlo4t/pgfvEqV1wH
 G/21FNuSMdRC3b5aWH4wtp2PbSCLVOed22vAT5DaDK8r864DHzHYc5zoiN/oY8yZjaTS
 ZE+g==
X-Gm-Message-State: AOAM530Tl4sKpZLXLql5oyd7tyAqTOc8REKQhXLdWMkwDsSoFS1+/LUT
 cRaUCl7mMf02+XMTcZxwIYyaL53jaVk+1DFFyG0=
X-Google-Smtp-Source: ABdhPJyUnkyU9aBWwyWUyzA0LepyToPhiv+dV3SVZXK/gq9xY1aGrwbRIbj8TdqU+a7NLg8u/VhOHmxW274J/v4hgH0=
X-Received: by 2002:a25:afca:: with SMTP id d10mr39455210ybj.517.1617698511881; 
 Tue, 06 Apr 2021 01:41:51 -0700 (PDT)
MIME-Version: 1.0
References: <7ac26fafee8bd59d2a0640f3233f8ad1ab270e1e.1617367317.git.alistair.francis@wdc.com>
In-Reply-To: <7ac26fafee8bd59d2a0640f3233f8ad1ab270e1e.1617367317.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 6 Apr 2021 16:41:40 +0800
Message-ID: <CAEUhbmUXswCjYfms_Bmj34yzp+ha+2KgdB06Bh_Xj7S+Lmr-Tw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] hw/riscv: Enalbe VIRTIO_VGA for RISC-V virt machine
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
X-List-Received-Date: Tue, 06 Apr 2021 08:42:05 -0000

On Fri, Apr 2, 2021 at 8:44 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>

typo in the commit title: Enalbe -> Enable

> imply VIRTIO_VGA for the virt machine, this fixes the following error
> when specifying `-vga virtio` as a command line argument:
>
> qemu-system-riscv64: Virtio VGA not available
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

