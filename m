Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipNZW-0007dI-G0
	for mharc-qemu-riscv@gnu.org; Wed, 08 Jan 2020 21:29:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55370)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1ipNZP-0007ax-JV
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 21:29:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1ipNZL-0007FG-PH
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 21:29:11 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:42359)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1ipNZL-0007Bs-8N
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2020 21:29:07 -0500
Received: by mail-pg1-x544.google.com with SMTP id s64so2448455pgb.9
 for <qemu-riscv@nongnu.org>; Wed, 08 Jan 2020 18:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:cc:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=GQ/CTU9UZPoDIfSC5uAvm0HxUXJkB1DNdwrAHTNgMqY=;
 b=JQPampuX01Y1eseokDwHhGB6LZcNwAXAwBu11WDAcfOl4WEpD0iGd7QX35f/qzQRQk
 OB/uy47qrzpdsB6di1Mz0kBMtNHin6aoOBDxk5sbBY5Hs8/RNjO4JalNgJMVjXTkRu1z
 Y6c21Ew108YPhnMdSB7t2KzLhAdgeC60J6SHNM6uMVFPR6Mb7++pA9mdPQEUdpRAJ/ve
 cYyhOfy7GRQUMic5F+yUfGyQBhpMgCNdx9XcjAs97iqR53jnth1iXbyyGukOjNdX29pz
 8heySCPPSYAy5ftRv82gbw4e3phYAF1NW/8eQI4Y7eIsK9Hc22qi38wznwXTxz7f4l8D
 kiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=GQ/CTU9UZPoDIfSC5uAvm0HxUXJkB1DNdwrAHTNgMqY=;
 b=Og2v6mWJDokY2MoCZoQEWlAtg6NJRPgASsryyCZ5tXdtb6pMS+ckEDmTQWzXbYd1Fp
 By7fSO7y6YY0MHZpaqH21TNP4fXqy81wJDZTvd5vxgtr+6ITCgK2IVG5DjVJOwmWRh5I
 MaOxx4eRZN6117D92xhToedHcjGw96NMN43WnIAU8A93bw/qSV3yEucN7o7fYGDHrrRZ
 8lC5ZkYyNIQzvnWqgwEeBTBgVlHbUelLpmqfxP6MafFu4J0EEyc4F2Y5WCDFhtmll2ir
 Z8tZ4xGdKVifhYtI+QGt1VaoN5cB7kX3z/ppj58vgiKAW41HMiN3ltL2QYYDWKLEBNru
 +7Og==
X-Gm-Message-State: APjAAAWOGU4ZEff0rNWEZuUd+a+Kbhh8a7OQBhk7AmFsTF6FzTYVMZ11
 qSvO5DSAa6Ms1qrQfPFpzCaPNA==
X-Google-Smtp-Source: APXvYqz1bcHW86KgjzVfvgc3kcIBDdHaq47vxtU2N4lTrjb64GZd5OpnOYuzt+ya6lGlPl56HRB7dw==
X-Received: by 2002:a63:ff5c:: with SMTP id s28mr8577205pgk.196.1578536945288; 
 Wed, 08 Jan 2020 18:29:05 -0800 (PST)
Received: from localhost (189.8.197.35.bc.googleusercontent.com.
 [35.197.8.189])
 by smtp.gmail.com with ESMTPSA id h128sm5527563pfe.172.2020.01.08.18.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 18:29:04 -0800 (PST)
Date: Wed, 08 Jan 2020 18:29:04 -0800 (PST)
X-Google-Original-Date: Wed, 08 Jan 2020 18:26:45 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v1 32/36] target/riscv: Raise the new execptions when 2nd
 stage translation fails
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
To: Alistair Francis <Alistair.Francis@wdc.com>
In-Reply-To: <f8bbda95f454a47bbfac3df8473f523a57aee3bb.1575914822.git.alistair.francis@wdc.com>
References: <f8bbda95f454a47bbfac3df8473f523a57aee3bb.1575914822.git.alistair.francis@wdc.com><cover.1575914822.git.alistair.francis@wdc.com>
Message-ID: <mhng-2a2e73ac-badd-4db1-95ff-10d8558bedf1@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
X-List-Received-Date: Thu, 09 Jan 2020 02:29:17 -0000

On Mon, 09 Dec 2019 10:12:04 PST (-0800), Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_helper.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 8667e5ffce..43c6629014 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -589,16 +589,28 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
>      }
>      switch (access_type) {
>      case MMU_INST_FETCH:
> -        cs->exception_index = page_fault_exceptions ?
> -            RISCV_EXCP_INST_PAGE_FAULT : RISCV_EXCP_INST_ACCESS_FAULT;
> +        if (riscv_cpu_virt_enabled(env) && !first_stage) {
> +            cs->exception_index = RISCV_EXCP_INST_GUEST_PAGE_FAULT;
> +        } else {
> +            cs->exception_index = page_fault_exceptions ?
> +                RISCV_EXCP_INST_PAGE_FAULT : RISCV_EXCP_INST_ACCESS_FAULT;
> +        }
>          break;
>      case MMU_DATA_LOAD:
> -        cs->exception_index = page_fault_exceptions ?
> -            RISCV_EXCP_LOAD_PAGE_FAULT : RISCV_EXCP_LOAD_ACCESS_FAULT;
> +        if (riscv_cpu_virt_enabled(env) && !first_stage) {
> +            cs->exception_index = RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT;
> +        } else {
> +            cs->exception_index = page_fault_exceptions ?
> +                RISCV_EXCP_LOAD_PAGE_FAULT : RISCV_EXCP_LOAD_ACCESS_FAULT;
> +        }
>          break;
>      case MMU_DATA_STORE:
> -        cs->exception_index = page_fault_exceptions ?
> -            RISCV_EXCP_STORE_PAGE_FAULT : RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
> +        if (riscv_cpu_virt_enabled(env) && !first_stage) {
> +            cs->exception_index = RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT;
> +        } else {
> +            cs->exception_index = page_fault_exceptions ?
> +                RISCV_EXCP_STORE_PAGE_FAULT : RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
> +        }
>          break;
>      default:
>          g_assert_not_reached();

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

