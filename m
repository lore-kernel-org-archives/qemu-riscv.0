Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lzDVg-000440-4N
	for mharc-qemu-riscv@gnu.org; Fri, 02 Jul 2021 03:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lzDVe-00040q-IJ; Fri, 02 Jul 2021 03:22:46 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:41913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lzDVc-0004Nq-QV; Fri, 02 Jul 2021 03:22:46 -0400
Received: by mail-io1-xd29.google.com with SMTP id i189so10546045ioa.8;
 Fri, 02 Jul 2021 00:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UD257PTHe0Sq+65KA4uLb7OP0o8V+xHfb/yC5sAL36c=;
 b=hw9qt2CQOVzMxB8pv+47qbH2CtYJo+XEnBYXhPWRJBHzOFJtSqvnMJrH58rpZBh/T7
 HUZYlPiTCxuXWmDQsb/HCN8x3vjC2nXKDRnkNmiRjc0qnXytuAUPlAM69c8KnYQ/x8Nn
 Doa2/CFqXuRMSL/D37BH4i6yf3br0yZdRFj+21i4Ni1LEUcpFIJN6t+LpcFmrtp8M/cE
 qzhUQyKWuqIWcKXAg/+JTfqsPcSp768Ehnti6bjclv1mUa7VUK5LR/djSa3h5gvCtn4M
 8UD3bvDkr58W6/xunuyt8chjwuvHVg0OKIMlXLUOcEdlib69HsIqrSLa9stcXbHXX8xC
 wqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UD257PTHe0Sq+65KA4uLb7OP0o8V+xHfb/yC5sAL36c=;
 b=ZPaB6+pAi77ALzGWHsGoXHkvSbkVYiBM30FPFglNnkHf3CjG0Ge31T2tig6KMaY6GY
 5J5xp3fxbgMIWpMaIYUgOhjuIKTQrPHylhfUVa150dqpTBhT1mhgU50Vnl7ZT+Dk7xGP
 cH9O+cSeakzuiHD1utYKkdtl3Daj2ZXK5wuCu1a0TKbp1l6BQeaO47euNwRMUxtPTlQ5
 ibkSauB35ZtNRluAecAl4qhENJPne7DzLVRXLg8PRymETUbprVOx8Xmd3x0JhYS9Jq67
 kVG6iEWB6NU4qUqbwx2GoOr81lc4nSMY7KodRbKyN6v9xvMDTyAq4ceTovEmxHjci5DN
 hapg==
X-Gm-Message-State: AOAM530UnMd3ePuCS4Nv3FE5H9nyZuLj6TaEj/sTSLm5LsQrg62Nq7Kt
 aYHEnT+0HmXgLfAJioO3VJbP1x7a4AVpvloOinQ=
X-Google-Smtp-Source: ABdhPJxXHvsf0vPnHNRzKiviotxnnS2Um1qoZkm6iMLqRrjKf9OzMktFo0AxzaXduIT2nIHEY1ScU1LTLD3dGIBFC/I=
X-Received: by 2002:a02:a310:: with SMTP id q16mr3235797jai.8.1625210563220;
 Fri, 02 Jul 2021 00:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210627120604.11116-1-bmeng.cn@gmail.com>
In-Reply-To: <20210627120604.11116-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 2 Jul 2021 17:22:17 +1000
Message-ID: <CAKmqyKPha_5R5t1Kgy9wMru7fVai+qfCJvM1cR9+2Z3fsACcuQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: csr: Remove redundant check in fp csr
 read/write routines
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Fri, 02 Jul 2021 07:22:46 -0000

On Sun, Jun 27, 2021 at 10:06 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> The following check:
>
>     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
>         return -RISCV_EXCP_ILLEGAL_INST;
>     }
>
> is redundant in fflags/frm/fcsr read/write routines, as the check was
> already done in fs().
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> ---
>
> Changes in v2:
> - rebase on qemu/master
>
>  target/riscv/csr.c | 24 ------------------------
>  1 file changed, 24 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fe5628fea6..62b968326c 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -215,11 +215,6 @@ static RISCVException epmp(CPURISCVState *env, int csrno)
>  static RISCVException read_fflags(CPURISCVState *env, int csrno,
>                                    target_ulong *val)
>  {
> -#if !defined(CONFIG_USER_ONLY)
> -    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
> -#endif
>      *val = riscv_cpu_get_fflags(env);
>      return RISCV_EXCP_NONE;
>  }
> @@ -228,9 +223,6 @@ static RISCVException write_fflags(CPURISCVState *env, int csrno,
>                                     target_ulong val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
>      env->mstatus |= MSTATUS_FS;
>  #endif
>      riscv_cpu_set_fflags(env, val & (FSR_AEXC >> FSR_AEXC_SHIFT));
> @@ -240,11 +232,6 @@ static RISCVException write_fflags(CPURISCVState *env, int csrno,
>  static RISCVException read_frm(CPURISCVState *env, int csrno,
>                                 target_ulong *val)
>  {
> -#if !defined(CONFIG_USER_ONLY)
> -    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
> -#endif
>      *val = env->frm;
>      return RISCV_EXCP_NONE;
>  }
> @@ -253,9 +240,6 @@ static RISCVException write_frm(CPURISCVState *env, int csrno,
>                                  target_ulong val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
>      env->mstatus |= MSTATUS_FS;
>  #endif
>      env->frm = val & (FSR_RD >> FSR_RD_SHIFT);
> @@ -265,11 +249,6 @@ static RISCVException write_frm(CPURISCVState *env, int csrno,
>  static RISCVException read_fcsr(CPURISCVState *env, int csrno,
>                                  target_ulong *val)
>  {
> -#if !defined(CONFIG_USER_ONLY)
> -    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
> -#endif
>      *val = (riscv_cpu_get_fflags(env) << FSR_AEXC_SHIFT)
>          | (env->frm << FSR_RD_SHIFT);
>      if (vs(env, csrno) >= 0) {
> @@ -283,9 +262,6 @@ static RISCVException write_fcsr(CPURISCVState *env, int csrno,
>                                   target_ulong val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
> -        return RISCV_EXCP_ILLEGAL_INST;
> -    }
>      env->mstatus |= MSTATUS_FS;
>  #endif
>      env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
> --
> 2.25.1
>
>

