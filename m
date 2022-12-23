Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8hbG-0007EG-PS
	for mharc-qemu-riscv@gnu.org; Fri, 23 Dec 2022 07:56:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8hbF-0007Dl-1Q; Fri, 23 Dec 2022 07:56:33 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8hbD-0002vc-Aq; Fri, 23 Dec 2022 07:56:32 -0500
Received: by mail-ed1-x52b.google.com with SMTP id m19so6987731edj.8;
 Fri, 23 Dec 2022 04:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TvdGR0Wgg6H9dADJoaS4ejGYjpyMgU2NLYJbveUAggw=;
 b=RwM1ACR1UgkYKanK2uXeuQv8B6O0vBjIilfTfboWi/N7+uQ1eqxt+8knTUFyMisDcX
 q5oVIO8aM9fEHxclypQAPqgfCBRteqi0bge9LNEg872zHpgDq3/pp0eG/RyqvSIQqVsM
 o1FOQfp5YOL1l2OOvDnylJkYuU3wEZQEtgf5IeUqXCuPt1bxvfxOnHXz0MGBnEaj5p6k
 ewjgB3hnKkNhoHaUG8paYKC5IUpNdU1ZUWkIpaJP+84iwHY9pNU4OfP4SaCG7dw3VVDn
 B8Tn6xKhe7MRFp0dt1XUihMNW8CnoxgWyDauPr9ncIyGatsY4p7IkiIVUGkfwxew5KOt
 pWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TvdGR0Wgg6H9dADJoaS4ejGYjpyMgU2NLYJbveUAggw=;
 b=KBpU8ZW4lVc2Ty/Jje7ywOP2a+FNhqOcMqZas18vgeol/c4C+ysCTCxsIllVyH9IFh
 MeAbKDXessjpCj0RtVyfBM2t51+fLxVYwvHg06ywW9h/1O5h3vuLR0OCqG1m9QNPGl5M
 AfAciftBoIC0ITjMamH9Ea5qBovMqvAesCau1F/SuIj4oW/t3RH3W5CgwIzLPng3J/lv
 vHqwbtoffD+xB6lLw4v6Qdo600vP5TQ7NWmbx5bTcBA4gCwRmDacSvzWx+UeHnbNakx0
 Akn6uepKI+xE4s+bNTwQsAGNMgvXtO9YyWJR3l0t+DMQa7zI1v2MJX3Xo0xxts+DUSLy
 Qprw==
X-Gm-Message-State: AFqh2kp0s0eRwyYW3jSB1pCmpBefD5NGDGv0EgRvEOReAaq56Z5kL3oD
 7Wsi+AxY6b6xuotQFQUDWNxRnuO8enD88Ly/sZEyrKPm7Z0=
X-Google-Smtp-Source: AMrXdXvbYyFGD6AR2NSKv00lIEg8MGg7nxE5fJTtcJp35JfkSe5xttD8Rf4toel48SzsZLtaRpBJBOtDq2/0sGoLbYE=
X-Received: by 2002:a05:6402:1843:b0:46b:1d60:f60a with SMTP id
 v3-20020a056402184300b0046b1d60f60amr1045304edy.193.1671800189484; Fri, 23
 Dec 2022 04:56:29 -0800 (PST)
MIME-Version: 1.0
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-13-dbarboza@ventanamicro.com>
In-Reply-To: <20221221182300.307900-13-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 23 Dec 2022 20:56:17 +0800
Message-ID: <CAEUhbmVDcwE+dSX9H3L2w8_h8vukCFL8tS_gOMSc92c-8E5qbQ@mail.gmail.com>
Subject: Re: [PATCH 12/15] hw/riscv/boot.c: make riscv_load_initrd() static
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52b.google.com
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
X-List-Received-Date: Fri, 23 Dec 2022 12:56:33 -0000

On Thu, Dec 22, 2022 at 2:25 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The only remaining caller is riscv_load_kernel() which belongs to the
> same file.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/boot.c         | 76 ++++++++++++++++++++---------------------
>  include/hw/riscv/boot.h |  1 -
>  2 files changed, 38 insertions(+), 39 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

