Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLPvz-0004co-KU
	for mharc-qemu-riscv@gnu.org; Wed, 01 Sep 2021 09:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLPvx-0004UK-1m; Wed, 01 Sep 2021 09:05:41 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:39566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLPvu-0003VJ-24; Wed, 01 Sep 2021 09:05:40 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id n126so4949808ybf.6;
 Wed, 01 Sep 2021 06:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iT2AuVaz6o7nhCjsZ1aglO9N/gjzAl1Eq5akKyHGu48=;
 b=YOoHzq6eE0K1qXp6LRyRmxXWGfSavT88uqA5IMPkYiMi3cbLJtGavaFfat2rvL0rMe
 gZGV6O6aavroAqQnbymS6TZQ29gSa4CQ73oy+EMFR4INA4J1ztkXSmSEtvhrIpBUYaUS
 IlSa25jTY7Omt1kp/eaeU0Z+c49njZDtWuI2cfJIkH8MgFT6LbIWcnOB3A6JrX5cGmQl
 yY4PtJBSKW8cR9B0XxeH6TldL1swH+Wqougr2GtbY8fHfQTGCOjReD3dAowwZcihMXT0
 NNK+vDKN4aeVDNYzdrQi5wDdI7R15pvelU9hdcKGQ/uzqsTBce1QUOpqrh5R3m5slV6v
 r8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iT2AuVaz6o7nhCjsZ1aglO9N/gjzAl1Eq5akKyHGu48=;
 b=pyeAQ8e4S/AA1Y5EmkIU+eVlQ73s0qKM5urrNVXE6FB50rhK+zQXeJNvS+D/n0ENaz
 m2qBQXrCCIEIU1JuYQwpLH74EjOPsDOrkHkRcYVwLw45HupCv1a7OrVBWclrP8z0WVbA
 78eaNl7BQoztorOK7kt74rSmUBNZ4iD5nEFaSOWxJuAeTojKT5t2xgdzXmsTTUWjI02N
 ts/1Fj84q3q+3j7F3WCJinx2TML2g4dpMMZfT8/RYB27ynwpcf2BqO9Xe7EJIqgVj+JN
 9Xc7cyKjWw4N36MHZzzUaWvrBz6By5wruP9qdcJ3b7N8tdKssXEIopHVkvYdVcjFQ+xa
 3YXw==
X-Gm-Message-State: AOAM532PR1TsB4DMoxJq9EA+NDZJLqHGHDyiyZ5q8TIUoU5YQkmR82VV
 KVJAzAd6D9iPEl+5bamilqvW15R7mtzPd35T6dI=
X-Google-Smtp-Source: ABdhPJzIzOeGBSxRQT+ude7Gs9Jtd5BxwTRI5ONwgVObCeWHKWt3OVCnt17aSWk4hkhUrEL81Xk7qvlVmo/1KhMkfQU=
X-Received: by 2002:a5b:391:: with SMTP id k17mr39245913ybp.152.1630501536256; 
 Wed, 01 Sep 2021 06:05:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210901124539.222868-1-zhiwei_liu@c-sky.com>
In-Reply-To: <20210901124539.222868-1-zhiwei_liu@c-sky.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 1 Sep 2021 21:05:25 +0800
Message-ID: <CAEUhbmUvb4_tmevGEcK_YgyA9_g5LumRVpMc7+rwuD4D7FSBBA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix satp write
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
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
X-List-Received-Date: Wed, 01 Sep 2021 13:05:41 -0000

On Wed, Sep 1, 2021 at 8:51 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> These variables should be target_ulong. If truncated to int,
> the bool conditions they indicate will be wrong.
>
> As satp is very important for Linux, this bug almost fails every boot.

Could you please describe which Linux configuration is broken? I have
a 64-bit 5.10 kernel and it boots fine.

Please add:

Fixes: 419ddf00ed78 ("target/riscv: Remove the hardcoded SATP_MODE macro")

> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/csr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 50a2c3a3b4..ba9818f6a5 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -986,7 +986,7 @@ static RISCVException read_satp(CPURISCVState *env, int csrno,
>  static RISCVException write_satp(CPURISCVState *env, int csrno,
>                                   target_ulong val)
>  {
> -    int vm, mask, asid;
> +    target_ulong vm, mask, asid;
>
>      if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
>          return RISCV_EXCP_NONE;

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

