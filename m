Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSFsf-0000fJ-Fu
	for mharc-qemu-riscv@gnu.org; Wed, 15 Feb 2023 06:23:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSFsZ-0000aS-0i; Wed, 15 Feb 2023 06:23:17 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSFsR-0000hk-6R; Wed, 15 Feb 2023 06:23:08 -0500
Received: by mail-ed1-x536.google.com with SMTP id u21so21578298edv.3;
 Wed, 15 Feb 2023 03:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kUV+JSslaMeovg4FZmOzfSIOO4BJkYLyexQsQ+zQcrE=;
 b=ZrXKjrz+JC8Rqv/a5jtjxzUxMqhfNDJ4vL/7VIuSIS/v9QL89ZTKH2vip+s9x865UA
 CT83LXwO/IHu34cko3OxirgcSfkHLAIp3VZJYYWNzZmecBM7/ltOB+eYAewCQ5RBvOaJ
 zFR3aK4IxrwtXtaVcnjD13Fpz2J8mDM1NxJaa4z/nJgj7wxBkSpDIRoB7jJz2e6SpK8m
 /kioYEnnFidkkduRt0dkWf0KiSoBPDmp0Vh+CMMzprWHL6iYjKupXUSYX3G03wn2Ir4w
 hfwaioOJREQFmpqzBIgfQaV4RRmKnBz3ND89A1N1z2M0bXV0nZ9zrcE/kcPLZYFtiI8E
 9opQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kUV+JSslaMeovg4FZmOzfSIOO4BJkYLyexQsQ+zQcrE=;
 b=5cUN82soZLHuhzr8IeY1sQZLdyQqOUBKRD1XhcOhhnjNLKtjHzEJLPMBOuEYmFKQQo
 J/NMRGjZwdBMaHpkmHOJDUfWO1tSgRzmVtV2BWz871JkDh37FhnMKWnSHMXoC9XxiexC
 KY30BdSQCfiAQcnQ3HqLW5T+hlPkZXWPSbewU/Kz5v7lRembgvaiTUo44OVTtPnwPXSB
 9vl7puUXoeU6bTeO7jbnPU6uLUOpjwVCg1Ysh3aFUo5QGPTnrxtxQd8exUJDeDjBw53P
 CqBmpaJHKgNE171xNMan0i+6hky/uyrY9PjdAFykwn0a5Roysv0T2WrTn2SOd9yvj/Qm
 sLcA==
X-Gm-Message-State: AO0yUKU8P+Y69fh6nu8N71Xl/IBURvMpYQc261Tcn/2n+/U5l7Bb/uLH
 Bl4Ndu9BEj5uRULu/w8ZkE+69dOhNLwaqOMZP9Q=
X-Google-Smtp-Source: AK7set8Yj4ev2tOWJ11zBdiDPDl/5l2LsLGnwNKhXTxQ8qovdkaaplJ35m9xexqoNNS6MjT0uA3BpI11oKIb/67XWgE=
X-Received: by 2002:a50:d653:0:b0:4ac:b618:7fb1 with SMTP id
 c19-20020a50d653000000b004acb6187fb1mr842331edj.6.1676460186285; Wed, 15 Feb
 2023 03:23:06 -0800 (PST)
MIME-Version: 1.0
References: <20230214192356.319991-1-dbarboza@ventanamicro.com>
 <20230214192356.319991-11-dbarboza@ventanamicro.com>
In-Reply-To: <20230214192356.319991-11-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 15 Feb 2023 19:22:55 +0800
Message-ID: <CAEUhbmWowUNJ9-99xa8X=O-ZK6g7nvS6xC5QHh+NG9UUOMiD2A@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] target/riscv: remove RISCV_FEATURE_MMU
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x536.google.com
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
X-List-Received-Date: Wed, 15 Feb 2023 11:23:19 -0000

On Wed, Feb 15, 2023 at 3:27 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> RISCV_FEATURE_MMU is set whether cpu->cfg.mmu is set, so let's just use
> the flag directly instead.
>
> With this change the enum is also removed. It is worth noticing that
> this enum, and all the RISCV_FEATURES_* that were contained in it,
> predates the existence of the cpu->cfg object. Today, using cpu->cfg is
> an easier way to retrieve all the features and extensions enabled in the
> hart.
>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c        | 4 ----
>  target/riscv/cpu.h        | 7 -------
>  target/riscv/cpu_helper.c | 2 +-
>  target/riscv/csr.c        | 4 ++--
>  target/riscv/monitor.c    | 2 +-
>  target/riscv/pmp.c        | 2 +-
>  6 files changed, 5 insertions(+), 16 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

