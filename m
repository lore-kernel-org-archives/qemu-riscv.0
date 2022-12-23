Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8e7p-0007ZQ-LB
	for mharc-qemu-riscv@gnu.org; Fri, 23 Dec 2022 04:13:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8e7l-0007YW-MF; Fri, 23 Dec 2022 04:13:53 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8e7k-0006gQ-6L; Fri, 23 Dec 2022 04:13:53 -0500
Received: by mail-lf1-x12b.google.com with SMTP id z26so6335354lfu.8;
 Fri, 23 Dec 2022 01:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JMsWvAxtJP4GbKP1eXPbqB66BdI+0mY4uXk9/XTHLSI=;
 b=H1DsvEYhrklU/BOiaV7FHlW5siUWiyX9Sb1f715+KQrVEm5Nn6TyP+estoq3aPZfWY
 pXGrbMvWMQ/TedT3CwE7ntHDLrMuyGmibChcCLGFzebW4/PetdxSWfF5nhqM9h0H+c7A
 eGJ6ZdDZkYH9WAcPuFbyLKVEZowYgE9otiIdtNkPtleHNpDL1vCjUX1jCwVe1DhzGqxe
 GjbQmGGAcRj/cEf6oKZxB7mh8CyY0yFXtALgewVTQ9dtaLtLAOozLVlpXauTywuHtIl/
 2da3+EI5SrnJGsY7FcMyqmmFeJfVUYNWDDpKCF4b1v5Qv+4pG5AcR3elvaqUfVCTb5KE
 baVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JMsWvAxtJP4GbKP1eXPbqB66BdI+0mY4uXk9/XTHLSI=;
 b=HRhKw1i9YjBMgBohLMbZQJNeeUSnT07Qh15W8Q+WpajwjdqusPC6YgEQe8JXOWCnAX
 pe1DJD71nXNYzzx20xmXqm/nPptSn9ZwSiHkrZPonqFmvPlYk1rrsYh/9Ks/rycWs0Eg
 eHHMRJ4OT6WThD7m5lKLhMvIHdiqPdn/3B8hTe6hmvWtyGR3SK3HZsNsANs9oVTSDQrP
 2oj3iJfNSDxH0QXcUx5+nKoPqZ9VHVZSdTPRn1NtFb6inJNVlf88wVMbcuLedfRqNMgs
 GaPdp9TpKRGrznbBw2PCHWMckaj3Lh7Xfc14MoIvq9NnACVjhEKe3m1A2AOzJ4D6pFoW
 1gBQ==
X-Gm-Message-State: AFqh2koGCW7Z9kRuwoAMM5rFMWyl66xZ+Xzkw+lC161RZbsiUp3efcdQ
 JKmfMT/34bKPqpsp/Oh5F7mzppc8iqVa6z9XiRM=
X-Google-Smtp-Source: AMrXdXsyiy7609ozeY/pDsrzYd8tipEPjHodAY16vRNM0y+/dskoJtSzLV/HO01gw3mAjVT2yXdrrzNw5a1OwUbDx2Y=
X-Received: by 2002:a19:f513:0:b0:4b6:e65f:e295 with SMTP id
 j19-20020a19f513000000b004b6e65fe295mr1105601lfb.0.1671786829235; Fri, 23 Dec
 2022 01:13:49 -0800 (PST)
MIME-Version: 1.0
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-5-dbarboza@ventanamicro.com>
In-Reply-To: <20221221182300.307900-5-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 23 Dec 2022 17:13:38 +0800
Message-ID: <CAEUhbmXy3hGDa2tDJrjJ7fGHThPPW9v5oGvXRZX_Zj2g8PK=og@mail.gmail.com>
Subject: Re: [PATCH 04/15] hw/riscv/boot.c: make riscv_find_firmware() static
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-lf1-x12b.google.com
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
X-List-Received-Date: Fri, 23 Dec 2022 09:13:54 -0000

On Thu, Dec 22, 2022 at 2:27 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The only caller is riscv_find_and_load_firmware(), which is in the same
> file.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/boot.c         | 44 ++++++++++++++++++++---------------------
>  include/hw/riscv/boot.h |  1 -
>  2 files changed, 22 insertions(+), 23 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

