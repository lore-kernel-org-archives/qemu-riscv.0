Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oJFCS-00084c-LA
	for mharc-qemu-riscv@gnu.org; Wed, 03 Aug 2022 10:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oJFCN-0007u8-5d
 for qemu-riscv@nongnu.org; Wed, 03 Aug 2022 10:18:11 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:43654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oJFCL-0004Y8-1F
 for qemu-riscv@nongnu.org; Wed, 03 Aug 2022 10:18:10 -0400
Received: by mail-ej1-x632.google.com with SMTP id gb36so6172818ejc.10
 for <qemu-riscv@nongnu.org>; Wed, 03 Aug 2022 07:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eTPZxyCY0QVw2TngA45vnfvDEdxctXHALSjVDUaQSCQ=;
 b=X8v2nP1zHtoOVxOA7X+4N5/RACGMVUVbdNvgujkHgRkoGSpA7bq0MxTHfTXqhagObl
 x/q2QQPpgPat2QnB5x0J20uMQ9eQZlI9gf6lyn3Jn2WxZmLxS5Cq4VHzjblk2TEIVW8f
 96usF0qRSMwyx2KJR32KCXuUD1+phLvW+i8P/n2e6aHjQQnqswpYF0OcDf7vR+Mw8VvS
 UsBCIaWzNxsCwpSQdQYQY64347+uJE+VI1ie6zpWBUNDEWR664cWFWAFXvmObsW48jjQ
 1cyGGPIzLCZPgUsSNbhGgNgwDfTpSLIlRukSgh9QrcysD3btUQcnCZR40cNIuDJkJ+Su
 yZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eTPZxyCY0QVw2TngA45vnfvDEdxctXHALSjVDUaQSCQ=;
 b=WKWAVFHKj2lD+objR4Y252+kOOTWqzvRC3jdUsFd7prvtsv6zuWY13HEwk3+4tqo8k
 Cs2S99ws1dQ8zQfdd8EFCC6FlTNCxuwTBG11X8UMLV71IoFNU77CN0ZzBalzMdSRFO/g
 58D3P/e/9Xbx4DxJjHRi4QrRCyfpX9Q4MW7vegKp0yXR/Pz8+QKiiAEQk+pxrHv6LjHL
 P5uTgK/wq1HL57NQz57xZH4KGEfsww02EVsn+xW4v9HSng7B1HPpGC7SYOHdIczNh+eB
 VuQ4PJkKjIko2/zpY6GBri0IOcuUTWxyoVAUz22oakRiS7yb846AUNCINn29eK0B8Cs0
 ET+Q==
X-Gm-Message-State: AJIora+TRFI9Bx18dw/tHRa9Bt+AYNXUNgTnL8mUfY3CoKmmFrMESHHX
 QrF6T+/7KIk4S8+y/0GgEm+Q7Q==
X-Google-Smtp-Source: AGRyM1v7syBpwjh8Ts5IOKAXKowjK0E5HcdLmHo7d5u7xNkjnAz3wVuqdJrqH0NxfU+yU093h318dg==
X-Received: by 2002:a17:907:6285:b0:72f:a3b9:9666 with SMTP id
 nd5-20020a170907628500b0072fa3b99666mr20145610ejc.455.1659536286645; 
 Wed, 03 Aug 2022 07:18:06 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a056402054d00b0043ca6fb7e7dsm9460427edx.68.2022.08.03.07.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 07:18:06 -0700 (PDT)
Date: Wed, 3 Aug 2022 16:18:05 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: qemu-devel@nongnu.org, Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: Re: [PATCH v7  1/3] hw/intc: Move mtimer/mtimecmp to aclint
Message-ID: <20220803141805.7tho3p6gng57w5qm@kamzik>
References: <20220803082516.2271344-1-atishp@rivosinc.com>
 <20220803082516.2271344-2-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220803082516.2271344-2-atishp@rivosinc.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 03 Aug 2022 14:18:11 -0000

On Wed, Aug 03, 2022 at 01:25:14AM -0700, Atish Patra wrote:
> Historically, The mtime/mtimecmp has been part of the CPU because
> they are per hart entities. However, they actually belong to aclint
> which is a MMIO device.
> 
> Move them to the ACLINT device. This also emulates the real hardware
> more closely.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  hw/intc/riscv_aclint.c         | 41 ++++++++++++++++++++++++----------
>  hw/timer/ibex_timer.c          | 18 ++++++---------
>  include/hw/intc/riscv_aclint.h |  2 ++
>  include/hw/timer/ibex_timer.h  |  2 ++
>  target/riscv/cpu.h             |  2 --
>  target/riscv/machine.c         |  5 ++---
>  6 files changed, 42 insertions(+), 28 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

