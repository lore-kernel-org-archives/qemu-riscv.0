Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7hRN-0000RP-RH
	for mharc-qemu-riscv@gnu.org; Tue, 10 Sep 2019 10:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54798)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7hRB-0000Lr-PR
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 10:48:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7hRA-0006P1-P5
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 10:48:09 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36019)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7hRA-0006Od-Jx
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 10:48:08 -0400
Received: by mail-wr1-f67.google.com with SMTP id y19so20865101wrd.3
 for <qemu-riscv@nongnu.org>; Tue, 10 Sep 2019 07:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=2V9FK9K2t1PGHm8vRzp0SynOI3GiSjvt1CUWvjkDi+w=;
 b=m0VdZiRJAWzqRHWyJJfnJJj7QYp/ntsSgrAwlcu6Zg4nFeoODFib1wX01wAPAVg8eL
 my0sKD7dtchbrHHXJN5d/qRimDFOFiaNTd+O8YBjrmDziIOI5a3Nj+TB0/qTVup7mlwI
 RUyvO9b4R66NOZQqhxRUOg5vRN3372CqLojyxIrdF0lW+xz+6YzvnCU01WOKs7v5YUVA
 JDKS9kB3fYaaqqTr+BjGoDrrn/mFBRIOuqt4MjrZEUR1Lv1njd0ROryScgTacSdjyS53
 k99ExN77Qvfs/FQBaf/jP64dElOPZhNeRaID2vysXYFSWgkES7AHxMm0CigLejU7BgyM
 tmvQ==
X-Gm-Message-State: APjAAAUlqOMUuSD1hl2L5Xv3vptU0A5XXbdHAim6g4MWUki35sbhHvLp
 Afl/TY8wfA9efl6QyH97nt7VbA==
X-Google-Smtp-Source: APXvYqz5JBu/oMgO5Kj5C1A5/crLiTqrqJFjGGogbNk7IfMk8kScCpt3XAAVeUyq9koCvT19p55xbA==
X-Received: by 2002:adf:db47:: with SMTP id f7mr26273520wrj.1.1568126887533;
 Tue, 10 Sep 2019 07:48:07 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id b144sm3646416wmb.3.2019.09.10.07.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 07:48:07 -0700 (PDT)
Date: Tue, 10 Sep 2019 07:48:07 -0700 (PDT)
X-Google-Original-Date: Tue, 10 Sep 2019 07:43:50 PDT (-0700)
In-Reply-To: <413539f43f6b9c120efd4c882ce7341ef3530b81.1566603412.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-16fd87b6-4cf3-45ec-bcc5-12bd4463aa06@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-riscv] [PATCH v1 06/28] target/riscv: Print priv and virt
 in disas log
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
X-List-Received-Date: Tue, 10 Sep 2019 14:48:11 -0000

On Fri, 23 Aug 2019 16:38:05 PDT (-0700), Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/translate.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index adeddb85f6..8ac72c6470 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -810,7 +810,15 @@ static void riscv_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>
>  static void riscv_tr_disas_log(const DisasContextBase *dcbase, CPUState *cpu)
>  {
> +#ifndef CONFIG_USER_ONLY
> +    RISCVCPU *rvcpu = RISCV_CPU(cpu);
> +    CPURISCVState *env = &rvcpu->env;
> +#endif
> +
>      qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
> +#ifndef CONFIG_USER_ONLY
> +    qemu_log("Priv: "TARGET_FMT_ld"; Virt: "TARGET_FMT_ld"\n", env->priv, env->virt);
> +#endif
>      log_target_disas(cpu, dcbase->pc_first, dcbase->tb->size);
>  }

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

