Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdgmr-0005Rm-W3
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 18:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdgmj-0005JV-EJ; Thu, 21 Oct 2021 18:43:43 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:40724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdgme-0003Gn-7K; Thu, 21 Oct 2021 18:43:39 -0400
Received: by mail-io1-xd2c.google.com with SMTP id x1so2972015iof.7;
 Thu, 21 Oct 2021 15:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xjkJwawwwFXVceI53StOdY8tq2HpwW23uGGcq+4G40o=;
 b=T6TUG+Pzg50CXujf4O1G6E5KtVaVwcDGQNn6nAdrmCJNtoriltsAlBJmpAq1QyFCA1
 KfKvLrR8tc0RXIuRc9I2hQZF3enbnU9Xw9C8Stio2nF0qgG99RUlb7aS69BRGADjvZOk
 /1alQ1FtAOl9C5ouM8V3BQndTn8lMMWd4oZ8/1BfXNIIRVIAr+PavIfcK6LJuZDqY9xu
 cJFvEx8DfCk3qHzLzxiq1O5bKESyizf3H/z0DN7++nGZMZ2LrZuoGcEnc16zGk0cUq0W
 7wOiaKkDvnjAG1oT7Ki9/S4pG7Ai9MQuFueEURNZVhh59nMMb2hQu5aTUhiwj/P/dNve
 3osA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xjkJwawwwFXVceI53StOdY8tq2HpwW23uGGcq+4G40o=;
 b=40eTfzwax29PikSvsq1K5XYeLWzlSB/3bcutEYvad1uCsFzW9IEfx5Bpv0b35f9J5H
 H68QVavsbuoxSevI/EWjRuTDrOsor+E9Jnb8X1nSfbbTh/tA9Cxf7f1c09D4Y6cYZzBT
 FyjrWl2X2OizGyWXuO9gqbtFKwzdovE627gklDO4s/A/fdtTE3wCzc70ZDmamh6+aAq3
 YW5kTrUP67QDcYF2sQS2wis/5cPNTf5KT0SQ41f0/QF0oIb+UCSjYiF2GmYr2Xr5wQAe
 3G3QhcVsykyUWRhsTdFUoT4IEDGsKC+RArCCG1dA6OjoA2no/DxrWvqm6crlXlDdsSS9
 Dw6Q==
X-Gm-Message-State: AOAM533p6XfAYjZeaWe4kgTE6NvQO/XNhTbNhY+f9i4DWKrdQj6ZvWzx
 5BM3fimNeGvZD9Tzlqr4HwnYlJroMXmoIYz/SQc=
X-Google-Smtp-Source: ABdhPJw1HLPLYNt97hKd3nJBNoHqvA+BpepfPzJewWVm8OPnObGwWGniTn/hLqlFS4VHeXi+psOlHdXqow/SBU3vaRA=
X-Received: by 2002:a6b:8d4a:: with SMTP id p71mr5895774iod.16.1634856214563; 
 Thu, 21 Oct 2021 15:43:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211021150921.721630-1-ruinland@andestech.com>
 <20211021150921.721630-3-ruinland@andestech.com>
In-Reply-To: <20211021150921.721630-3-ruinland@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 Oct 2021 08:43:08 +1000
Message-ID: <CAKmqyKPhR4e_CJpbyEUxmQ=k7MZ=p8U6L9-_gT5uen+JYmhhAA@mail.gmail.com>
Subject: Re: [RFC PATCH v5 2/3] riscv: Introduce custom CSR hooks to
 riscv_csrrw()
To: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
Cc: wangjunqiang <wangjunqiang@iscas.ac.cn>, Bin Meng <bmeng.cn@gmail.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, ycliang@andestech.com, 
 "Alan Quey-Liang Kao(((((((((()" <alankao@andestech.com>,
 Dylan Jhong <dylan@andestech.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
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
X-List-Received-Date: Thu, 21 Oct 2021 22:43:48 -0000

On Fri, Oct 22, 2021 at 1:13 AM Ruinland Chuan-Tzu Tsai
<ruinland@andestech.com> wrote:
>
> riscv_csrrw() will be called by CSR handling helpers, which is the
> most suitable place for checking wheter a custom CSR is being accessed.
>
> If we're touching a custom CSR, invoke the registered handlers.
>
> Signed-off-by: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>

Awesome! This looks really good :)

> ---
>  target/riscv/cpu.c             | 19 +++++++++++++++++
>  target/riscv/cpu.h             | 13 +++++++++++-
>  target/riscv/csr.c             | 38 +++++++++++++++++++++++++++-------
>  target/riscv/custom_csr_defs.h |  7 +++++++
>  4 files changed, 68 insertions(+), 9 deletions(-)
>  create mode 100644 target/riscv/custom_csr_defs.h
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0c93b7edd7..a72fd32f01 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -34,6 +34,9 @@
>
>  static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
>
> +GHashTable *custom_csr_map = NULL;
> +#include "custom_csr_defs.h"
> +
>  const char * const riscv_int_regnames[] = {
>    "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
>    "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a3",
> @@ -149,6 +152,22 @@ static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
>  #endif
>  }
>
> +static void setup_custom_csr(CPURISCVState *env,
> +                             riscv_custom_csr_operations csr_map_struct[])
> +{
> +    int i;
> +    env->custom_csr_map = g_hash_table_new(g_direct_hash, g_direct_equal);
> +    for (i = 0; i < MAX_CUSTOM_CSR_NUM; i++) {
> +        if (csr_map_struct[i].csrno != 0) {
> +            g_hash_table_insert(env->custom_csr_map,
> +                GINT_TO_POINTER(csr_map_struct[i].csrno),
> +                &csr_map_struct[i].csr_opset);
> +        } else {
> +            break;
> +        }
> +    }
> +}
> +
>  static void riscv_any_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 3bef0d1265..012be10d0a 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -245,6 +245,11 @@ struct CPURISCVState {
>
>      /* Fields from here on are preserved across CPU reset. */
>      QEMUTimer *timer; /* Internal timer */
> +
> +    /* Custom CSR opset table per hart */
> +    GHashTable *custom_csr_map;
> +    /* Custom CSR value holder per hart */
> +    void *custom_csr_val;
>  };
>
>  OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
> @@ -496,9 +501,15 @@ typedef struct {
>      riscv_csr_op_fn op;
>  } riscv_csr_operations;
>
> +typedef struct {
> +    int csrno;
> +    riscv_csr_operations csr_opset;
> +} riscv_custom_csr_operations;
> +
>  /* CSR function table constants */
>  enum {
> -    CSR_TABLE_SIZE = 0x1000
> +    CSR_TABLE_SIZE = 0x1000,
> +    MAX_CUSTOM_CSR_NUM = 100
>  };
>
>  /* CSR function table */
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 23fbbd3216..1048ee3b44 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1403,6 +1403,14 @@ static RISCVException write_pmpaddr(CPURISCVState *env, int csrno,
>
>  #endif
>
> +/* Custom CSR related routines */
> +static gpointer find_custom_csr(CPURISCVState *env, int csrno)
> +{
> +    gpointer ret;
> +    ret = g_hash_table_lookup(env->custom_csr_map, GINT_TO_POINTER(csrno));
> +    return ret;

You can just return directly here, so:

return g_hash_table_lookup(env->custom_csr_map, GINT_TO_POINTER(csrno));

Also, I think you need to run checkpatch.pl on this patch (you should
run it on all patches).

Alistair

> +}
> +
>  /*
>   * riscv_csrrw - read and/or update control and status register
>   *
> @@ -1419,6 +1427,7 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
>      RISCVException ret;
>      target_ulong old_value;
>      RISCVCPU *cpu = env_archcpu(env);
> +    riscv_csr_operations *csr_op;
>      int read_only = get_field(csrno, 0xC00) == 3;
>
>      /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
> @@ -1449,26 +1458,39 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
> +    /* try to handle_custom_csr */
> +    if (unlikely(env->custom_csr_map != NULL)) {
> +        riscv_csr_operations *custom_csr_opset = (riscv_csr_operations *)
> +            find_custom_csr(env, csrno);
> +        if (custom_csr_opset != NULL) {
> +            csr_op = custom_csr_opset;
> +            } else {
> +            csr_op = &csr_ops[csrno];
> +            }
> +        } else {
> +        csr_op = &csr_ops[csrno];
> +        }
> +
>      /* check predicate */
> -    if (!csr_ops[csrno].predicate) {
> +    if (!csr_op->predicate) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
> -    ret = csr_ops[csrno].predicate(env, csrno);
> +    ret = csr_op->predicate(env, csrno);
>      if (ret != RISCV_EXCP_NONE) {
>          return ret;
>      }
>
>      /* execute combined read/write operation if it exists */
> -    if (csr_ops[csrno].op) {
> -        return csr_ops[csrno].op(env, csrno, ret_value, new_value, write_mask);
> +    if (csr_op->op) {
> +        return csr_op->op(env, csrno, ret_value, new_value, write_mask);
>      }
>
>      /* if no accessor exists then return failure */
> -    if (!csr_ops[csrno].read) {
> +    if (!csr_op->read) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>      /* read old value */
> -    ret = csr_ops[csrno].read(env, csrno, &old_value);
> +    ret = csr_op->read(env, csrno, &old_value);
>      if (ret != RISCV_EXCP_NONE) {
>          return ret;
>      }
> @@ -1476,8 +1498,8 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
>      /* write value if writable and write mask set, otherwise drop writes */
>      if (write_mask) {
>          new_value = (old_value & ~write_mask) | (new_value & write_mask);
> -        if (csr_ops[csrno].write) {
> -            ret = csr_ops[csrno].write(env, csrno, new_value);
> +        if (csr_op->write) {
> +            ret = csr_op->write(env, csrno, new_value);
>              if (ret != RISCV_EXCP_NONE) {
>                  return ret;
>              }
> diff --git a/target/riscv/custom_csr_defs.h b/target/riscv/custom_csr_defs.h
> new file mode 100644
> index 0000000000..4dbf8cf1fd
> --- /dev/null
> +++ b/target/riscv/custom_csr_defs.h
> @@ -0,0 +1,7 @@
> +/*
> + * Copyright (c) 2021 Andes Technology Corp.
> + * SPDX-License-Identifier: GPL-2.0+
> + * Custom CSR variables provided by <cpu_model_name>_csr.c
> + */
> +
> +/* Left blank purposely in this commit. */
> --
> 2.25.1
>

