Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSeMF-0004jG-Jh
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 08:31:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSeME-0004hm-2W; Thu, 16 Feb 2023 08:31:30 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pSeMC-0002mF-ML; Thu, 16 Feb 2023 08:31:29 -0500
Received: by mail-ej1-x630.google.com with SMTP id b2so5099372ejz.9;
 Thu, 16 Feb 2023 05:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LHnb1hOD2Tmu+EubNVpID1pnZ9pJSWoPh4urY1mByoE=;
 b=i5aupdfPN83nkQj+VYmKEGRjx3jFjxYY+80vaAC4dKAUg4+KRuaRBhDnjSxdwdbPvP
 Cr4hdb6xV+uoXyiApNo9S77SRseKZU98aZsOlXjh4E6umuMEO3IzfKOx4mgwZyRHmOoB
 tkFDaHeCtsLJaqvrnH99fHzPtH8/iuvY2IRqVXvdp+U6LQR5tAZ89av93PB7O4RvJmbU
 ikfguHncOt0fHmLbFShVzSj/3h/Rvvkq9AT5q782JwBtRx+igLVXwpLXGkoJMtHArj9Q
 cVWnGTJ2kve2rJ3jtZXEL0MVWdw1c0uszfCTok6SkMfdXzdzb19gszajzoufe9yWRlkW
 9zug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LHnb1hOD2Tmu+EubNVpID1pnZ9pJSWoPh4urY1mByoE=;
 b=3NrhmWS2dj/1HD4i8nm963bZjKJbg/nbesJiU2eswht1jUWtz2ETdcuvGGEIUVNA9i
 6T8E62AQrlvf2ktP8R8i7BNK5Qq2GCspXZpv8GKvhm2NrOUCDbJOBy3dEIP7qVxOklCm
 bOB/YM6MtsTbSQEURoDYSWdgux2gDAwZh5+2213XKEYqLjLCaAaQAmiJzllGZW8lCPpb
 UBgyqrRiGAXy+3JCVqxphSa+5forMirjgpGYPK1JpmM5I4aS203HNx09Uc7ocFiPsZ9V
 EULI0wCS4p3crFtxXiIzhWnKfO1zu/dj6eDY+K2jW3KNQc3tJLpqQwMOnQ9xgEZ91L0M
 VJPg==
X-Gm-Message-State: AO0yUKVXJtWY+u1SlwV1U9vC+pt0ncL0RKDSaSNrjJr+euFEv9BbNsDg
 VA8DowyVeaqzU5FJg3MnuD/LgxxAZGNrcKtKs/c=
X-Google-Smtp-Source: AK7set9a9Tu4uFp7h6BwZDTBThFKAsA0mmfneLu5q42dbauoHfAL0UL8Dqu8X5+bVLZ62tksdshpv4AyXUsTo+pw4kQ=
X-Received: by 2002:a17:907:76f0:b0:8b1:30eb:9dba with SMTP id
 kg16-20020a17090776f000b008b130eb9dbamr2858170ejc.6.1676554286813; Thu, 16
 Feb 2023 05:31:26 -0800 (PST)
MIME-Version: 1.0
References: <20230216130444.795997-1-dbarboza@ventanamicro.com>
 <20230216130444.795997-3-dbarboza@ventanamicro.com>
In-Reply-To: <20230216130444.795997-3-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 16 Feb 2023 21:31:15 +0800
Message-ID: <CAEUhbmWcwKEUa4NSjN+YrBo1+V+x95jjbb1ktFVe=UJmtDCcZA@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] target/riscv: remove RISCV_FEATURE_MISA
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x630.google.com
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
X-List-Received-Date: Thu, 16 Feb 2023 13:31:30 -0000

On Thu, Feb 16, 2023 at 9:07 PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> It's unused after write_misa() became a regular no-op.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.h | 1 -
>  1 file changed, 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

