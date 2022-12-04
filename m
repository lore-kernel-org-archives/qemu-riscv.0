Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p1xRO-0003Ad-I2
	for mharc-qemu-riscv@gnu.org; Sun, 04 Dec 2022 17:26:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p1xRN-00038B-Ay; Sun, 04 Dec 2022 17:26:29 -0500
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p1xR8-0005OX-KO; Sun, 04 Dec 2022 17:26:15 -0500
Received: by mail-vk1-xa35.google.com with SMTP id o5so2258223vkn.7;
 Sun, 04 Dec 2022 14:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=abv3qhQP3e1d7T8p7dUwLyWnajdmF115AyCnQWVz86M=;
 b=VjUTHUJvrJ6+moRmy+IhA0Y4HN8/z69G+iJpZK1/1GBdOKF5vSvyuLzreOU3ZNCRdq
 RTV4L2B2FxeqD90UGCgPTzRhD0xtHe+WRnVuXIU9Wa1JCqqZYfk4Bf1xsVrRzr4nlU8k
 9Qk/ZSx4GR9WOaiAfk3gISH2eBmFb988fhbRxHkdYigSk2AlsuvBRmG7Dy9TVoldRNsz
 6bkYEqmgiJKlB4tf2WbHzRBExvZCIwbjGsMpGW0dCOvCei1gd3ATYLeXHAgr/GXWTANt
 CQB9uIl0QJmfvhgQY+W7C6bmXwJwK8DeFKDx0hkrnjEdc76vpZa5KlQELW8YeNEcHHNq
 Mzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=abv3qhQP3e1d7T8p7dUwLyWnajdmF115AyCnQWVz86M=;
 b=RAcugyP5411+o2BDmBrnLn+g+ApCcrZS7S0sk2aWnHNaw4oGkQq1/ZQUOFc5rNnlnN
 71mK6DM0IeSLKVlirYdWAq9KcLbGnk8cfIHcgysMgSaD/yYc1CYVQcArja82JTwtgbym
 w/KL/cKT6x4s+CCXFLFJUlorpepYnwa5JqWdq2TT/x3XZdQVN9ncSWhbYB/5Bzg5xeIH
 LxJyKxHQqRsqdLjjQPUmoir5lVvpDgu6MIXFOPRw29bZxFtdFBsenFfgjdjpHQ4fhBgH
 sFcaK+sWf3rLHMeg/9Wxvbp8wbQzcgreWt6PkZdNYaZiFuR2lMBgeCNiahST3f49J3LB
 ImOw==
X-Gm-Message-State: ANoB5plUm8cA2Ul9rhUnxVnXeOErPTkpFkdzV96IY5dh2jDnfXsCv5tw
 xlPUFnIWaLHUZVc+015YP8dJue6GpkMWbcqmREo=
X-Google-Smtp-Source: AA0mqf6LLO4qiBRJ74IoLnz8tTODcLXzitoxQ6jIiVJ5vhiyGSeE3XVIT7cP2hrw2FouW2hXFF881Jp1xG0u3TSgBGQ=
X-Received: by 2002:a1f:b693:0:b0:3bc:7ad1:1e2e with SMTP id
 g141-20020a1fb693000000b003bc7ad11e2emr35203363vkf.7.1670192773243; Sun, 04
 Dec 2022 14:26:13 -0800 (PST)
MIME-Version: 1.0
References: <20221201140811.142123-1-bmeng@tinylab.org>
 <20221201140811.142123-6-bmeng@tinylab.org>
In-Reply-To: <20221201140811.142123-6-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 5 Dec 2022 08:25:47 +1000
Message-ID: <CAKmqyKOSAmy8OhporwfVLo=7SnJQNbagYbSbm30T8o12WgS-2w@mail.gmail.com>
Subject: Re: [PATCH 06/15] hw/intc: sifive_plic: Drop PLICMode_H
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa35.google.com
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
X-List-Received-Date: Sun, 04 Dec 2022 22:26:29 -0000

On Fri, Dec 2, 2022 at 12:15 AM Bin Meng <bmeng@tinylab.org> wrote:
>
> H-mode has been removed since priv spec 1.10. Drop it.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  include/hw/intc/sifive_plic.h | 1 -
>  hw/intc/sifive_plic.c         | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/include/hw/intc/sifive_plic.h b/include/hw/intc/sifive_plic.h
> index 134cf39a96..d3f45ec248 100644
> --- a/include/hw/intc/sifive_plic.h
> +++ b/include/hw/intc/sifive_plic.h
> @@ -33,7 +33,6 @@ DECLARE_INSTANCE_CHECKER(SiFivePLICState, SIFIVE_PLIC,
>  typedef enum PLICMode {
>      PLICMode_U,
>      PLICMode_S,
> -    PLICMode_H,
>      PLICMode_M
>  } PLICMode;
>
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index 1cf156cf85..3f6ffb1d70 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -42,7 +42,6 @@ static PLICMode char_to_mode(char c)
>      switch (c) {
>      case 'U': return PLICMode_U;
>      case 'S': return PLICMode_S;
> -    case 'H': return PLICMode_H;
>      case 'M': return PLICMode_M;
>      default:
>          error_report("plic: invalid mode '%c'", c);
> --
> 2.34.1
>
>

