Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7hRW-0000W3-T4
	for mharc-qemu-riscv@gnu.org; Tue, 10 Sep 2019 10:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54858)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7hRF-0000PM-R0
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 10:48:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7hRE-0006RH-K1
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 10:48:13 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43005)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7hRD-0006Qd-Tx
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 10:48:12 -0400
Received: by mail-wr1-f66.google.com with SMTP id q14so20834197wrm.9
 for <qemu-riscv@nongnu.org>; Tue, 10 Sep 2019 07:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=sX5dnt1H0NPzA1MYbZxhDL297HTdjTWHoyxd1DtQJi0=;
 b=XlhR8bMCt+OltBd859NUnW2t7EQQfvEK/2xKeGvpVfBEkA63HM5WI7nqDcjtK6QLZt
 ZwC+l1e9vMiFQkIczbjc1b/gWA8BNNJeWPL6mMV78aGf01KnYcP/0KuyTdg1zXll9BbA
 btSxkKumCeyML2nCxRAqbrPrppeMqfcO1/tgdUQNmJkC1Jm84dxGtY+e/DBv4JUOowxF
 FNjsBYkIXetXvnx0KPQ+BLnobjtNmn8bPH1Rh7EHLXHPNZQhPG/aNB4sgu72s48wwjPF
 0ThmZLFi6podmQmU4GCsftJoKCWAbXdhGSjvs8eO6M2OHg0JupOEZAAuyZYhr6qgxm7O
 tgKw==
X-Gm-Message-State: APjAAAXk77GBnIdnGir/Ur/zQZFHmUjDKg16LgXIVmc3wJt29E9Bewba
 Ekx0m4QHskW2LZYTAZfJYCuV2g==
X-Google-Smtp-Source: APXvYqy2OaAQT8quyLVWn0c0t6YpVOHaynKV1QGiG1AE+5k7B8QeSG+SEh9KhTHOkhK1ZtgQsvGtww==
X-Received: by 2002:a5d:6585:: with SMTP id q5mr25320303wru.162.1568126890787; 
 Tue, 10 Sep 2019 07:48:10 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id p23sm3240563wma.18.2019.09.10.07.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 07:48:10 -0700 (PDT)
Date: Tue, 10 Sep 2019 07:48:10 -0700 (PDT)
X-Google-Original-Date: Tue, 10 Sep 2019 07:44:36 PDT (-0700)
In-Reply-To: <bc32540efd592bc56ef8c4a59ecc142d8dc594a0.1566603412.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-295434c5-b526-4ca5-ae7a-107a7126954f@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-riscv] [PATCH v1 08/28] target/riscv: Add Hypervisor CSR
 access functions
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
X-List-Received-Date: Tue, 10 Sep 2019 14:48:16 -0000

On Fri, 23 Aug 2019 16:38:10 PDT (-0700), Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/csr.c | 68 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 471f23a1d0..388775d45a 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -98,6 +98,20 @@ static int smode(CPURISCVState *env, int csrno)
>      return -!riscv_has_ext(env, RVS);
>  }
>
> +static int hmode(CPURISCVState *env, int csrno)
> +{
> +    if (riscv_has_ext(env, RVS) &&
> +        riscv_has_ext(env, RVH)) {
> +        /* Hypervisor extension is supported */
> +        if ((env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
> +            env->priv == PRV_M) {
> +            return 0;
> +        }
> +    }
> +
> +    return -1;
> +}
> +
>  static int pmp(CPURISCVState *env, int csrno)
>  {
>      return -!riscv_feature(env, RISCV_FEATURE_PMP);
> @@ -754,6 +768,55 @@ static int write_satp(CPURISCVState *env, int csrno, target_ulong val)
>      return 0;
>  }
>
> +/* Hypervisor Extensions */
> +static int read_hstatus(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->hstatus;
> +    return 0;
> +}
> +
> +static int write_hstatus(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->hstatus = val;
> +    return 0;
> +}
> +
> +static int read_hedeleg(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->hedeleg;
> +    return 0;
> +}
> +
> +static int write_hedeleg(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->hedeleg = val;
> +    return 0;
> +}
> +
> +static int read_hideleg(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->hideleg;
> +    return 0;
> +}
> +
> +static int write_hideleg(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->hideleg = val;
> +    return 0;
> +}
> +
> +static int read_hgatp(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->hgatp;
> +    return 0;
> +}
> +
> +static int write_hgatp(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->hgatp = val;
> +    return 0;
> +}
> +
>  /* Physical Memory Protection */
>  static int read_pmpcfg(CPURISCVState *env, int csrno, target_ulong *val)
>  {
> @@ -950,6 +1013,11 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      /* Supervisor Protection and Translation */
>      [CSR_SATP] =                { smode, read_satp,        write_satp        },
>
> +    [CSR_HSTATUS] =             { hmode,   read_hstatus,     write_hstatus    },
> +    [CSR_HEDELEG] =             { hmode,   read_hedeleg,     write_hedeleg    },
> +    [CSR_HIDELEG] =             { hmode,   read_hideleg,     write_hideleg    },
> +    [CSR_HGATP] =               { hmode,   read_hgatp,       write_hgatp      },
> +
>      /* Physical Memory Protection */
>      [CSR_PMPCFG0  ... CSR_PMPADDR9] =  { pmp,   read_pmpcfg,  write_pmpcfg   },
>      [CSR_PMPADDR0 ... CSR_PMPADDR15] = { pmp,   read_pmpaddr, write_pmpaddr  },

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

