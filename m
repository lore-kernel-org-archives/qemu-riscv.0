Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAqIj-0005tJ-DR
	for mharc-qemu-riscv@gnu.org; Thu, 29 Dec 2022 05:38:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pAqIh-0005sp-JI; Thu, 29 Dec 2022 05:38:15 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pAqIf-0005js-RD; Thu, 29 Dec 2022 05:38:15 -0500
Received: by mail-ed1-x52c.google.com with SMTP id d14so26152174edj.11;
 Thu, 29 Dec 2022 02:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wXfd/c2r8PLn6mdmLQzntuErAUEDywSjHF+sNHs+goo=;
 b=goU3QiPdJR8Ka6DbcxsHAFduOJUEqSEgV2O/A4nUstcCgmyczCw2eMAYnEJhS0A4zN
 nPAcmpnngqubBfXxAPiKiuv+Gztq61671LzoHuK5liOcdJZSov3sj6U6jVsBNFimhZ+g
 LN+zCAxN1a9rmA2bGo35vqAKYKKN2HRxr39GAIz7MqbPiHCR+olbMNMf1NDXuwHcCrY2
 dPuaX+BfYS6N6P11O4MJOGzrdiRz/dRGJFSgU6+gB1NKfc1iUpQizCUmvBgRKeNGlPpo
 vJMn2IfDU2ORiSUGRp4VnwM/KiUH++GRox4COAzqurMFk51Jtc4FKw50uVQjcHH2IuAW
 0BIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wXfd/c2r8PLn6mdmLQzntuErAUEDywSjHF+sNHs+goo=;
 b=WtkdZ0pXIOt+gYIx8+feU3rE4qNvBkBa/sn5xoRBHtwDTk198tCVJZngd8Mo1WfmTF
 BBqt8lPU1RXLLqVcQ2YNlbWAykWE87IM4bx72dSr915JzowpS9sAwXJwisTsY8zZsvDR
 Vf3mr7+Uk3wcsvs2lTZXgtbg4aMW5h8eHlO/Rbi81d29AUNxgoj5mwEknzSY1IaUCYvu
 tlhi3ZMFzoggMliYsYSB3l+V9wccEPrdsnKEjWPj+SIy++co3esi8+SatUA2uBJ6XQmj
 L+RuqbmxBqDBApzw5/hzWMQWJl3AYHnhTB1FRBX1X3npvpGt6Pj3iziXe0cEA9Uw1Y98
 nXuQ==
X-Gm-Message-State: AFqh2kqNeSDTu2jiSoHpKystc5AbWy23PW1FeH0fjpSAWTnnUxN1ZUNc
 Mx9st+kO/K8h7kE9EnaXiBUSP3FIUwqTQK4tMzo=
X-Google-Smtp-Source: AMrXdXtxRwHnqtd/iXQalayHHnCPezY0Co5EZPLb/ssfmTR7fOPIOsqSQph3GMGbToAczxMurbVmIROd9q3qZ0C0TPo=
X-Received: by 2002:aa7:d584:0:b0:46b:6096:a884 with SMTP id
 r4-20020aa7d584000000b0046b6096a884mr1943497edq.152.1672310291652; Thu, 29
 Dec 2022 02:38:11 -0800 (PST)
MIME-Version: 1.0
References: <20221229091828.1945072-1-bmeng@tinylab.org>
 <ca5bb1de-652c-8074-5b49-867e40d0a818@ventanamicro.com>
In-Reply-To: <ca5bb1de-652c-8074-5b49-867e40d0a818@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 29 Dec 2022 18:38:00 +0800
Message-ID: <CAEUhbmVs4-WCByerzqDK2G1FTaQVJ5RuzB_qaJ4yCeMeDqrKUA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] hw/riscv: Improve Spike HTIF emulation fidelity
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Bin Meng <bmeng@tinylab.org>, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-devel@nongnu.org, 
 Anup Patel <apatel@ventanamicro.com>, Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 29 Dec 2022 10:38:16 -0000

Hi Daniel,

On Thu, Dec 29, 2022 at 6:25 PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Bin,
>
> Not sure if it's a problem on my side but I can't find patch 12/12. I didn't
> received in my mailbox. I tried patchwork but didn't find in there:
>
> https://patchwork.ozlabs.org/project/qemu-devel/list/?series=334352
>
>
> And it's not in the ML archives as well:
>
> https://mail.gnu.org/archive/html/qemu-devel/2022-12/msg04581.html
>

Thanks for reporting this!

I just examined the "git send-email" log, and indeed the "git
send-email" aborted at the last patch for some unknown reason.

I just resent the 12th patch using "git send-email" using the correct
Message-Id, and hopefully it will be correctly chained into the v2
patch thread.

Regards,
Bin

