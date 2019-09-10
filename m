Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7hRF-0000PJ-TD
	for mharc-qemu-riscv@gnu.org; Tue, 10 Sep 2019 10:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54782)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7hRA-0000KN-DY
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 10:48:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7hR9-0006OK-Dm
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 10:48:08 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36013)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7hR9-0006Nq-79
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 10:48:07 -0400
Received: by mail-wr1-f67.google.com with SMTP id y19so20864917wrd.3
 for <qemu-riscv@nongnu.org>; Tue, 10 Sep 2019 07:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=62DKnnZ3R2aQjTeCpvnqwbJlIX89ZfIbEuBSBRs6M78=;
 b=m0i1PBFSgA7rDQHM2QF+2+Q+HFXcit45gS9Ywm0wPzgsRdpEd6tEACJwjxeTqvHrk7
 bSa0SK13W0VnTT3bcMZgTAqY9eOiSz7qGNUiY4Zul58NWBpNDBygfoyouhzlxhl91mm7
 1QFegZeKDqD00/W15wSulbV59wepMYxB8vEx4mOuaH3D0k+XSQv4h4pOUg/gAVaJ1yyk
 +WGqqb/mszKn/Kcb7rqawhiw9Sxu44epSr4iVmDqpVKcfeqwdpl1u4X+0o0Upb6YRWWc
 ASv30rIWMgo/ahcmQXfLzf3sbj/r8OcedCEYwBqnfarFnwGqkPLJMvbnI4hq/HeXtU/f
 3Fzg==
X-Gm-Message-State: APjAAAWgPdyc5ioVjPvOTuuhivh5lFMAqt96rNfEBLqzdguVmRYwNQJQ
 t84kSo33j8r3a0jjIxBYMfM8Rg==
X-Google-Smtp-Source: APXvYqweODaLB/2nQGD5iozLW2AcB/NxHwY68xJWogAwgxdAYIyKvBm20JFinAI1KYkXdSnLcd4oqA==
X-Received: by 2002:adf:e986:: with SMTP id h6mr27558802wrm.59.1568126886071; 
 Tue, 10 Sep 2019 07:48:06 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id d193sm5796622wmd.0.2019.09.10.07.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 07:48:05 -0700 (PDT)
Date: Tue, 10 Sep 2019 07:48:05 -0700 (PDT)
X-Google-Original-Date: Tue, 10 Sep 2019 07:42:56 PDT (-0700)
In-Reply-To: <e959ee81e5121c74678d2383a28665e44db9e31d.1566603412.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-91f54d04-62bd-44b7-a4ce-d7f3631181c0@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-riscv] [PATCH v1 05/28] target/riscv: Add the Hypervisor
 CSRs to CPUState
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

On Fri, 23 Aug 2019 16:38:02 PDT (-0700), Alistair Francis wrote:
> As the MIP CSR is 32-bits to allow atomic_read on 32-bit hosts the vsip
> is 32-bit as well.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 3a95c41428..4c342e7a79 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -154,6 +154,23 @@ struct CPURISCVState {
>      target_ulong mcause;
>      target_ulong mtval;  /* since: priv-1.10.0 */
>
> +    /* Hypervisor CSRs */
> +    target_ulong hstatus;
> +    target_ulong hedeleg;
> +    target_ulong hideleg;
> +    target_ulong hgatp;
> +
> +    /* Virtual CSRs */
> +    target_ulong vsstatus;
> +    uint32_t vsip;
> +    target_ulong vsie;
> +    target_ulong vstvec;
> +    target_ulong vsscratch;
> +    target_ulong vsepc;
> +    target_ulong vscause;
> +    target_ulong vstval;
> +    target_ulong vsatp;
> +
>      target_ulong scounteren;
>      target_ulong mcounteren;

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

