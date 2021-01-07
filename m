Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kxPDI-0000UQ-Rj
	for mharc-qemu-riscv@gnu.org; Thu, 07 Jan 2021 01:56:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxPDH-0000UG-JH; Thu, 07 Jan 2021 01:56:03 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:32934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxPDG-0001no-3O; Thu, 07 Jan 2021 01:56:03 -0500
Received: by mail-wr1-x42e.google.com with SMTP id t30so4564063wrb.0;
 Wed, 06 Jan 2021 22:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hOr4beHwQJIGmV1UyQYHqPKWp+njp7zoK3jrg7may0k=;
 b=kMIxdgxYAVLn6c2lf8WbDpfaXC9Qtqvn/82Qqy7perIbUV7IxEjkflCth69KIHFwW9
 rdoQeT2ImPylfIRfxD7ZwibboOj/Y3/XECZJBD2eLtceQXQ71Ycp8eTfNP6niS1AucCS
 NceocQ3S+WK0cPuNsOHome/7FYfVjO5TtBpYmKSqRPUeRmajsxBojr5bJVDGlkxWV34o
 pWFQdF4/bLhZYUxlD4GE/ZpM9Dheo0DEwk4B3ADiGFSkBkZ8/yarTqcWvXZN4mrMSbDZ
 tXHdtaDHHs72aiDXbtwO9DQeDlShNlluvlV24pFGlSTp440JbVexK1twvvhMuFgNR0W/
 +5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hOr4beHwQJIGmV1UyQYHqPKWp+njp7zoK3jrg7may0k=;
 b=Xm07ZKyh1HwdUjxERfbfyWHZ6GS8u1LwXxbOKDowoAQBsVCvcbfOG5ycR7F1wkVD0u
 oxTAOPsNrCKHtQVyEXm6uAx9eTUIoNkBllD9S3lSeXyuhCLFrMOlZfA9Bp05/pcxGezd
 D/7HtylROycRN1cRS6qTzJhA+/KIu/4U/tBIzOuJrCl+IgnVt7eFVYtdOQJ8/HgRS24D
 GcW4u+3DKSjYdNTDX4c/kEDw5ufyssUOnyH8/5Hs8UriATs1LaqJmwHrLXZcnf/QWnfm
 vOtQoDhYNkYMcXOkf5+TpuATKJGJMXaT80dP3S8/vmNWLrp8ZyJd2A3u/qrFqkhuETsg
 Dyng==
X-Gm-Message-State: AOAM531wIeR1SOVNjPWl4ynPl3mckeqByc7qM/nZdbcXu+160pcyxSLz
 ALVUolUvKpiP5iwYcsbju2I=
X-Google-Smtp-Source: ABdhPJzJ6/9VkoHroy/MfL65k6xd4ChdwWsB8kPABYv/6g2MHbBH9jf2WMACbB3Pn6cqTLdyBSddhA==
X-Received: by 2002:a5d:6884:: with SMTP id h4mr7439488wru.174.1610002559801; 
 Wed, 06 Jan 2021 22:55:59 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id r16sm7047916wrx.36.2021.01.06.22.55.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jan 2021 22:55:58 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v4] gdb: riscv: Add target description
To: Sylvain Pelissier <sylvain.pelissier@gmail.com>, qemu-devel@nongnu.org
Cc: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <20210106204141.14027-1-sylvain.pelissier@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e9e863ec-1f88-5d5f-ab00-da318502c321@amsat.org>
Date: Thu, 7 Jan 2021 07:55:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210106204141.14027-1-sylvain.pelissier@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 07 Jan 2021 06:56:03 -0000

On 1/6/21 9:41 PM, Sylvain Pelissier wrote:
> Target description is not currently implemented in RISC-V
> architecture. Thus GDB won't set it properly when attached.
> The patch implements the target description response.
> 
> Signed-off-by: Sylvain Pelissier <sylvain.pelissier@gmail.com>
> Reviewed-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

