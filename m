Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lo2qP-000289-3L
	for mharc-qemu-riscv@gnu.org; Tue, 01 Jun 2021 07:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lo2qK-000279-PQ; Tue, 01 Jun 2021 07:45:58 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:34578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lo2qH-00046s-Fo; Tue, 01 Jun 2021 07:45:56 -0400
Received: by mail-yb1-xb29.google.com with SMTP id 207so10569777ybd.1;
 Tue, 01 Jun 2021 04:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=anrulR6CgDXGa5Keo9/UsiVuX8xrJccyaFpeJN2Vqe0=;
 b=dG11KTC05DcVlx1mjGgM9A6TDu3Qb2mfxcr1fpD+vhmmTeWaiz10tNFInUMDdXZMH7
 xG8z1/B7aNYKsnoCHVBJUQoVlEwDfEAxOYMuXf9sRu0gXDZeYmiRoEoOfIJDX/KIS/kg
 NRX4CeDH3qj1VXEaKiVg3o1lc7oNAKKzTIGz40TcM/MqIGLdowygWo/LXOFqoYl64eaJ
 7U8bJVuhbDeF4XiLthbhJnDsG3u5j4jL+VAknFO1AK3MUxJFJUyDzjPVHES+nbvTsAGR
 sVnyA+LCL5OyFYi7M5uFPEy6JKMTwqTyVehT5Z14h8BzaDR1byNvCAfXBgqM4cNoJMVI
 Clwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=anrulR6CgDXGa5Keo9/UsiVuX8xrJccyaFpeJN2Vqe0=;
 b=n1Ej5+j1UbHmtBjD/Lzxq4VmxAPQLQuf0fMeeQkLSIAerLb/XZ6wmPBiawg7ed6h9Q
 /rHwR1wGIp43DAlK7kMlc6NdIqM0zFmzceZp7DhymfbrAegecT3Hl/A6GD98EynPnV1T
 Rn00UdR59R4MCJ6+FTy+ztNcFx6wafu9nJUakm9BpfSPbH/2u7jIAy0yxoE3lKTzOId0
 FRwaSU5BvXsPx7u+8kbGyMwEDx4rvESpjyeU9q+KOV0JO9UE9x5Lf8Ftrb51TogSN7r/
 18GF4dvxojtmKWKGj8XjUQKWFCKmkcAtHdQ9A5+nmPZeRJYswjbM+RGi6Fnv7UN9T5S1
 gjqw==
X-Gm-Message-State: AOAM531fP9/vPaVPmkK77xH2vQB722mnNr2dCjFQx/r8f4OdBaKMeBEW
 /bNW4VTnTNsLLsXXSRQuhmrToDKlM3uSz9iIvDM=
X-Google-Smtp-Source: ABdhPJxahHzXhmxglHwv6m8n+onBXWdGwfpwgDhqWlVBqGkl0a4zBK6vDRzsKJkAfSG5J9bvPJa/zDM8jwT2L1TEj5w=
X-Received: by 2002:a25:99c1:: with SMTP id q1mr36310975ybo.517.1622547951886; 
 Tue, 01 Jun 2021 04:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <c00176c7518c2a7b4de3eec320b6a683ab56f705.1622435221.git.alistair.francis@wdc.com>
In-Reply-To: <c00176c7518c2a7b4de3eec320b6a683ab56f705.1622435221.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 1 Jun 2021 19:45:40 +0800
Message-ID: <CAEUhbmU07E01JRKM1n+EX9zzSSn9oBxf+VPK3=tY56K-k7di8g@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] target/riscv: Use target_ulong for the
 DisasContext misa
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Tue, 01 Jun 2021 11:45:59 -0000

On Mon, May 31, 2021 at 12:27 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> The is_32bit() check in translate.c expects a 64-bit guest to have a
> 64-bit misa value otherwise the macro check won't work. This patches
> fixes that and fixes a Coverity issue at the same time.
>
> Fixes: CID 1453107
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

