Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ioyrX-0001qT-NG
	for mharc-qemu-riscv@gnu.org; Tue, 07 Jan 2020 19:06:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40666)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1ioyrV-0001qG-Tz
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2020 19:06:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1ioyrU-0002ng-Rq
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2020 19:06:13 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:37662)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1ioyrU-0002mD-K3
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2020 19:06:12 -0500
Received: by mail-pf1-x443.google.com with SMTP id p14so668880pfn.4
 for <qemu-riscv@nongnu.org>; Tue, 07 Jan 2020 16:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:cc:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=z+in7Qiu0uJOVVZsPIL5WgzbcNDpsMijJxT+AW8sdZM=;
 b=BrQNVZu88EFfymKgzroYyrXsw2TosEf2+zRufJYJKCqgLpdPNKTYkzgG1zU9bLoISD
 1p9F+2m2uXY0kXCz66mWRKvevzY8Et3XKLPKEBNKAyNFxlyVWwnELJSfpA5EhYYbZ5vB
 YtYpLJpASk2aJYnynIgvhLoydJkv4IeksJJqBBUHBhsLSR9wA6Fq73oZuEKJPS6YGNGI
 WLWFeFQfA2vzRJ0xhe4EmAbma80DKQlSCAMbUWOz/fNt+/ZW8J7xt6UiUv4cz+nGGZaf
 AOd3Bj9IacPCGtD7QYsiu6NdlMyMC+4SEI2sP/qlNXckiO5sUJdM03/8E4T0kkfXQz3m
 zgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=z+in7Qiu0uJOVVZsPIL5WgzbcNDpsMijJxT+AW8sdZM=;
 b=Ttjb1mkZKB/yZeu7JZRZSR1t9jjGYlVTIuJBCFEDh609TB2ccQaSwuFZtB3HCtdQ8n
 9yNAUVZdH7uwALzJWstV4hIWJCEecQONQ6OvK89hzKU5GdEVOyaav+JIH4DNRMRxf7Ep
 TUSSZcU6dRzxHE/8zVyEAbwSbSe/i8kvCWgAH7lWHry6SbTbNfqNJTsIHMSvHgfx8Gej
 c+tg2Ve6fpT2JyNR5+xtATnB64DC48Dqc6Vlpp0GBnU9Tvi144UbdPnLtng7PUuMd8oX
 xQRZh7AW8OEMdymTlaaSaa3aB0HXMe4sI/jFF9tguYBF9g5xwC0YIRldpQmA+ju/wR2N
 acPw==
X-Gm-Message-State: APjAAAWDmcvpLVqvtFSospRx8fq6KREjNPQQEIeOyF6jXK3dg9omc6lH
 rqqxto6GEQFws5XDNTeHjjRMdQ==
X-Google-Smtp-Source: APXvYqx+1ovn6xo4uVYCkbhllZpCoqrzAy2ljQI00lVFpWWjLRMWfHvTe+3fYRFsvf/Dfa6jRFu80g==
X-Received: by 2002:a62:e30d:: with SMTP id g13mr2069468pfh.92.1578441971106; 
 Tue, 07 Jan 2020 16:06:11 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id a16sm912684pgb.5.2020.01.07.16.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 16:06:10 -0800 (PST)
Date: Tue, 07 Jan 2020 16:06:10 -0800 (PST)
X-Google-Original-Date: Tue, 07 Jan 2020 16:06:08 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v1 09/36] target/riscv: Fix CSR perm checking for HS mode
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
To: Alistair Francis <Alistair.Francis@wdc.com>
In-Reply-To: <72b377cf058f6d159a40301b6880f017404ef9cd.1575914822.git.alistair.francis@wdc.com>
References: <72b377cf058f6d159a40301b6880f017404ef9cd.1575914822.git.alistair.francis@wdc.com><cover.1575914822.git.alistair.francis@wdc.com>
Message-ID: <mhng-304917e2-e6ff-4bca-8479-d71b5c13aff6@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
X-List-Received-Date: Wed, 08 Jan 2020 00:06:15 -0000

On Mon, 09 Dec 2019 10:11:04 PST (-0800), Alistair Francis wrote:
> Update the CSR permission checking to work correctly when we are in
> HS-mode.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/csr.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 6a0a59edfd..eebfc1823d 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -802,12 +802,22 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
>
>      /* check privileges and return -1 if check fails */
>  #if !defined(CONFIG_USER_ONLY)
> -    int csr_priv = get_field(csrno, 0x300);
> +    int effective_priv = env->priv;
>      int read_only = get_field(csrno, 0xC00) == 3;
> -    if ((!env->debugger) && (env->priv < csr_priv)) {
> -        return -1;
> +
> +    if (riscv_has_ext(env, RVH) &&
> +        env->priv == PRV_S &&
> +        !riscv_cpu_virt_enabled(env)) {
> +        /*
> +         * We are in S mode without virtualisation, therefore we are in HS Mode.
> +         * Add 1 to the effective privledge level to allow us to access the
> +         * Hypervisor CSRs.
> +         */
> +        effective_priv++;
>      }
> -    if (write_mask && read_only) {
> +
> +    if ((write_mask && read_only) ||
> +        (!env->debugger && (effective_priv < get_field(csrno, 0x300)))) {
>          return -1;
>      }
>  #endif

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

