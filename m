Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMJGE-0005uu-9A
	for mharc-qemu-riscv@gnu.org; Sun, 29 Jan 2023 20:47:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pMJG4-0005uA-A2; Sun, 29 Jan 2023 20:46:57 -0500
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pMJG1-0002HZ-HB; Sun, 29 Jan 2023 20:46:55 -0500
Received: by mail-vs1-xe31.google.com with SMTP id 187so10970062vsv.10;
 Sun, 29 Jan 2023 17:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jTcyvn84Ktx1SzMuYPD98jEGHANSEo8cFAF3Fz3MzO8=;
 b=F/TfoWK6JIcQ7bghBKyH8suyY8KDEAWTdpEtajQLYGOfWLr9bJIxi+VgREdPCcP4Ce
 uck7HKsBqeU7bcy4nLZYEr4nL/ELNHPz4YtT9fNttFbuCg9dHmm+fn69X7ZLgVldyrAq
 /JH/6McoaN+6rhhFkjjJUR9wldIvb7MdtJRIFkc27FehQ4RPmxbBYAGKQdPe/I1xXvsR
 hcXXL1U5JPW6BkvlpGhbmvgEM9axkYMm1qMf2Tdzi9s28/NPRzAD63yq/VkLPA4nfvHh
 jVmCAQkO2unZdp5ZNoxT0kPQFcTwYUzjQaMV4ZYrSRrs6/xciNTxcxhfeaWtrQ95EFIn
 z6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jTcyvn84Ktx1SzMuYPD98jEGHANSEo8cFAF3Fz3MzO8=;
 b=oiyDQBT0ytrqCCU5P+9oS4ajpHh9w3RQSo+FBxitwF5d8FmE3Nqu9utpG2BNGXN5ob
 3plt7Kf05jGWCNcwyXea7UM/qFJtW5UWvQ5YKbfV3WWXD2tGXvQd+37LZHQOb1YobL39
 J45AeEK1KHKLr5i55Ap+K/dGbmZeqt+r5Q0+mT1Kqrdyp7kdx46oDpkvsikmdAod7xO3
 5b33r60Gwg/LFF0x09Bwsk1mtrIE2x4Qx8aPQKrI8Ov+EdfwucY6BDYfJ94y9hy9MQJm
 mQksFtAjbNkpsw40hNGaRdT7zLuQtVr2ElIeYx83XYUq5HQ3kvhorJQxoIrvnLySa+oJ
 1xiw==
X-Gm-Message-State: AO0yUKUeivHwP/70tJKZfLmnWs4V34NErvgzJco/bOChQyyEM2HQBt/C
 3YNqYOl/f2KAiua8+wd/OdEoOUEXREj4ts4QCaY=
X-Google-Smtp-Source: AK7set9+ATjERnsmXGraOfm4XULr7IQBTJRBueuh27WRU7M/x+6rnGxVhuknV1m8oBzNv1fzLWi6w9pBn7Xd6ZMJqt8=
X-Received: by 2002:a05:6102:232e:b0:3ee:4ef8:45d3 with SMTP id
 b14-20020a056102232e00b003ee4ef845d3mr1165177vsa.64.1675043211636; Sun, 29
 Jan 2023 17:46:51 -0800 (PST)
MIME-Version: 1.0
References: <20230124212234.412630-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230124212234.412630-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Jan 2023 11:46:25 +1000
Message-ID: <CAKmqyKP0iRT8iEpbSJKypyBwtEHE_-LJf4wbk5tTuzgDbuxYqA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] hw/riscv: misc cleanups
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe31.google.com
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
X-List-Received-Date: Mon, 30 Jan 2023 01:47:00 -0000

On Wed, Jan 25, 2023 at 7:23 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> These are the last 3 patches from the series
>
> "[PATCH v3 0/7] riscv: fdt related cleanups"
>
> That can be sent in separate from the fdt work. Patches are all acked.
>
> Changes from v3:
> - patches 1,2,3:
>   - former patches 5, 6 and 7 from "[PATCH v3 0/7] riscv: fdt related cleanups"
> - v3 link: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg04464.html
>
> Daniel Henrique Barboza (3):
>   hw/riscv/virt.c: calculate socket count once in create_fdt_imsic()
>   hw/riscv/virt.c: rename MachineState 'mc' pointers to 'ms'
>   hw/riscv/spike.c: rename MachineState 'mc' pointers to' ms'

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/riscv/spike.c |  18 +-
>  hw/riscv/virt.c  | 462 ++++++++++++++++++++++++-----------------------
>  2 files changed, 242 insertions(+), 238 deletions(-)
>
> --
> 2.39.1
>
>

