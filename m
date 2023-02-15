Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSFsg-0000gL-0s
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 06:23:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSFsO-0000YM-7t; Wed, 15 Feb 2023 06:23:06 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSFsM-0000iq-3j; Wed, 15 Feb 2023 06:23:03 -0500
Received: by mail-ej1-x62e.google.com with SMTP id qb15so45301794ejc.1;
 Wed, 15 Feb 2023 03:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uJaeQlrZk0neU+uq7mI/mMDgAF9mMrQ9u+w9OyhDT2U=;
 b=Ih+YUWOWTT82P47N1ZsWvdxAtkrbQpqUUmDIyZhPVGoGVXOB7pOhrvb3hwP2qI8qyn
 P8VBL/uFW34mJEir2EsfVS0v8LzoBOf8opr/c6QayuiqwM++fEQl6sboh5W59eH9IZy7
 DoASCKk2a1Ayit7/QvGbLfnTybwgUTMDYR6LvFXhVtEHG07jbD8Ds3gjQtMssUDfg1n6
 C2bTL54MJZJI8RgPJC7ax8NGhYEwclZ9H7SVQ5o8cUYfKpcysgA1MArPFPa2Isic0lBc
 rfz4pbPpzbbD/TfDdVE68SMr9VgN5IqRvdj3XJUkChY599qHnheKTYjqgjGbgIbgN0fz
 saaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uJaeQlrZk0neU+uq7mI/mMDgAF9mMrQ9u+w9OyhDT2U=;
 b=lx6p6tgd8RXbLQOzyiNtYmYTSAowz/59laVfB3VEOAyA0UaUsqzfEjYnS+QrQLxzp/
 4liBilhFeNifPTqRvAALLq9ZniRJ6kgDWeqkBywlgOHYmselW37VpyYhkWfoSskczek9
 MQkVux2kUEWmRHrqv5Dy/wrQmJPkOatvg9D5TW1u/9MVuOaFkASyxdvC5IPdH/kQAS8n
 eksQphj4WBE6NToeUV89yDiIwPP7qnlb4XlCD9oHy/RotQCyCD6c4PJExPBp0QglyL65
 T80H30R7pjOB1xqa/LMnV/pX9R5h+QxL6npvvRP36t9DchauS2OLiZViOeBHU9ddM93i
 O6pw==
X-Gm-Message-State: AO0yUKXSs2B6/h5aF3n7kSS3We0zCCWjVZ41iSGu2EadBLU/0P+P7EMW
 tcs1/t1p1g1wWX4UkhQx/0gfrFEEnzt4+ACumOU=
X-Google-Smtp-Source: AK7set9T9k4ABahVfk0G4EZkuYdgb6uHg6shr7eZYu1tyTkrxGqDz/97pdMODGmKjOxmraRsnDMoTmoYsF2l6DfQEHk=
X-Received: by 2002:a17:906:e219:b0:8af:2e89:83df with SMTP id
 gf25-20020a170906e21900b008af2e8983dfmr1139731ejb.6.1676460180471; Wed, 15
 Feb 2023 03:23:00 -0800 (PST)
MIME-Version: 1.0
References: <20230214192356.319991-1-dbarboza@ventanamicro.com>
 <20230214192356.319991-9-dbarboza@ventanamicro.com>
In-Reply-To: <20230214192356.319991-9-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 15 Feb 2023 19:22:48 +0800
Message-ID: <CAEUhbmWwn5+Uf_HHBbEjNzRiGfpa8rXsSQ8=coz=M=GxapMLHA@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] target/riscv: remove RISCV_FEATURE_PMP
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62e.google.com
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
X-List-Received-Date: Wed, 15 Feb 2023 11:23:08 -0000

On Wed, Feb 15, 2023 at 3:25 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> RISCV_FEATURE_PMP is being set via riscv_set_feature() by mirroring the
> cpu->cfg.pmp flag. Use the flag instead.
>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c        | 4 ----
>  target/riscv/cpu.h        | 1 -
>  target/riscv/cpu_helper.c | 2 +-
>  target/riscv/csr.c        | 2 +-
>  target/riscv/machine.c    | 3 +--
>  target/riscv/op_helper.c  | 2 +-
>  target/riscv/pmp.c        | 2 +-
>  7 files changed, 5 insertions(+), 11 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

