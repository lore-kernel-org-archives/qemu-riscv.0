Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8e4H-0005oq-U3
	for mharc-qemu-riscv@gnu.org; Fri, 23 Dec 2022 04:10:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8e4D-0005nL-1t; Fri, 23 Dec 2022 04:10:16 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8e4B-000558-Bq; Fri, 23 Dec 2022 04:10:12 -0500
Received: by mail-lj1-x22c.google.com with SMTP id v11so4363308ljk.12;
 Fri, 23 Dec 2022 01:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZN0FXykyWIoNVZhTRLiPb0PX3c97d9vcVgUlaLhMh+M=;
 b=JSLxMoko6V1VmZ+Mn9hKhMVpZRVvowh2mRc+pFeU64Xjxu0nDzEPbK75+IjAz9OijJ
 /hDiGIPwg6Sn/F18Zsz7vlpkp73z3+Vv8gEkaMu6rkf8Urju3W9h4eeuFj1OgWtDm3Vs
 Ck6L6KE0x6Q4sRSuegN+u6PxU7zyrz7ds9ZXROQu4UN1OnDso7QMx8oSC7gO3fvh40qN
 kCRWBQ/fh4xRQiVcO+BSEp3Jr66D5wKERxAG06I33q6D2kBP3OpoOdsh+NsVSwyqJr08
 N3B4LGHDd13/p+xsB06LraulPG9mHHJvg8/mcAmyRMGIaWRh/JNsnivPVKrf747uQpn/
 WnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZN0FXykyWIoNVZhTRLiPb0PX3c97d9vcVgUlaLhMh+M=;
 b=gc5fI5Q8mIyWzvcQ/JNmx5SZorB8pfhI8mkXr0bRPnWD3QYVEmxRmhajmdVH+g5TeH
 Y+8W1N8+xvuQz6LP0qUYWAeTW08av6zg58JuXHImA4ZeWfX/dXvbBJoE69lc790UGSmo
 Jx0YjLbxMgvxfQSOKodniThAGBDL2SVNTEQiCb3A0m6m2IypefZcKQp8ISZ89r16yWqx
 +In5DMEdykIADjWPKw+FXR/RSREpnMuIwnntHT4FFTMJFL1yI7XNBRBcIwqEjZEGjvWE
 iKQMXYUi6nBPRI90zCWi3puhZEXdCDlRldRuSf6FCENHRhrWVJ3W9shanzPW2yBpLKKg
 X9BA==
X-Gm-Message-State: AFqh2kqKVTnU7rlBEjXW/Mb0tdY3gzJX9zcaBuEuGm4YsI3aIgIjBMsk
 fpIz9jRkCQSTdrnUXljg0j8Oz4D/GNbu1TCvGCU=
X-Google-Smtp-Source: AMrXdXu8krHNqM7M72rufi6uF0pli8oYSZI/YlELQqqv7GvLVmbkCS3/1EDS78WTlqPX61zcanIxijrGb3U7263O13g=
X-Received: by 2002:a2e:b5b8:0:b0:277:44b2:6b9c with SMTP id
 f24-20020a2eb5b8000000b0027744b26b9cmr437681ljn.26.1671786607850; Fri, 23 Dec
 2022 01:10:07 -0800 (PST)
MIME-Version: 1.0
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-3-dbarboza@ventanamicro.com>
In-Reply-To: <20221221182300.307900-3-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 23 Dec 2022 17:09:56 +0800
Message-ID: <CAEUhbmW2rJuGfrmobAPY7oe6gSVic3HrmG_kWXPDOi3-8xK2-w@mail.gmail.com>
Subject: Re: [PATCH 02/15] hw/riscv/spike: use 'fdt' from MachineState
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-lj1-x22c.google.com
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
X-List-Received-Date: Fri, 23 Dec 2022 09:10:17 -0000

On Thu, Dec 22, 2022 at 2:24 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The MachineState object provides a 'fdt' pointer that is already being
> used by other RISC-V machines, and it's also used by the 'dumpdtb' QMP
> command.
>
> Remove the 'fdt' pointer from SpikeState and use MachineState::fdt
> instead.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/spike.c         | 12 +++++-------
>  include/hw/riscv/spike.h |  2 --
>  2 files changed, 5 insertions(+), 9 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

