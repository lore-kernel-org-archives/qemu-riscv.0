Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grX3o-0005JF-1s
	for mharc-qemu-riscv@gnu.org; Wed, 06 Feb 2019 18:56:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1grX3l-0005HS-He
	for qemu-riscv@nongnu.org; Wed, 06 Feb 2019 18:56:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1grX3k-0000oc-9u
	for qemu-riscv@nongnu.org; Wed, 06 Feb 2019 18:56:53 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:38792)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1grX3g-0000hk-PE; Wed, 06 Feb 2019 18:56:48 -0500
Received: by mail-lj1-x241.google.com with SMTP id c19-v6so7735200lja.5;
	Wed, 06 Feb 2019 15:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ymZ0nS5cFzAfOO+ckZ8ApDqORA7ZgL+aoKxuqM6EMMs=;
	b=jcGqnP6iLm3kKUObR/56jaje6ARGNS+s/h76ckxt/ZhaBd7O7tc7RP5CDrCm7zquG2
	PXVp6mvRDhIimFZ41h0LvolVKoVdNVqa8gX/1D0VEO4KQt+GmV8zOQM5MUHiPDHSk7r2
	JpKPr7oIsRv7WUYjjhiwimzyPA4+OAUm8IJ7FfAuYKGajLFtTPxWBXx7X74egAYbs5bI
	OqMQkuYVby4ulxLljEs7DioxNbzzqXKLeRhJzYrxIZbfCQN0zrIcAp0mxPhrokzjElm9
	csTLmp9Gc7a8GczNbRI8o9z35kEduT2chC+Y5QkX8bUDZG45XkbVC4aRUhmlUbCht1hm
	z+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ymZ0nS5cFzAfOO+ckZ8ApDqORA7ZgL+aoKxuqM6EMMs=;
	b=P/o0JegFQV3bBr2RFlo9Tbe1Ua4cJzBnjBiEobbmf5vXpdyC6XdiYJ9mE1FjWFOYVm
	b9vIXh625Hjh/zoA0l5B9xyyRjOmgvIq8QI1B3m9ONfhyIGT3N1rr5RVaWAUMQ4g73GO
	xdENoosHS9e65P7RqkNEJM0lu2djNDzl0EqZCtgS6y304eP1LvyUI4YSD5pjL+2KQ7/v
	skaFPfvzGfabI0nDy62ws/E1q0IG1SsCJlhW8oNannX0vUdlU7qanWBhT9u4/Oj6VbTc
	M+1xwSjOSzVb+HVpJGmUoTY6KzmGe1gpedrWRVX8Bjki0ffr+7sknCOaBRsN5S1v7K9E
	hjBA==
X-Gm-Message-State: AHQUAuYrTILXRgVqHm4fyNbdTQPhJoGPzfYBGjeQLdDjXT3cxRyhMwjk
	2fwp3ZKZCIr2zEWgAH0h06J+OCc2VJ+jAesMODU=
X-Google-Smtp-Source: AHgI3IaNbltOzzt4XCluahBInDPvgi4nDZH6QsL7lms3IMftnOMF2R6l4U4PdMdbzL1FTEVxCX/F61pRUwu6WEpQ6hg=
X-Received: by 2002:a2e:9516:: with SMTP id
	f22-v6mr4305538ljh.191.1549497398609; 
	Wed, 06 Feb 2019 15:56:38 -0800 (PST)
MIME-Version: 1.0
References: <CAFyWVaZ5tQq4eGaZiPBq7172PB_x3JCqV6c2xo=wSJdgbJakKQ@mail.gmail.com>
	<20190130025644.12754-1-jimw@sifive.com>
In-Reply-To: <20190130025644.12754-1-jimw@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 6 Feb 2019 15:55:59 -0800
Message-ID: <CAKmqyKMPYYuD1jRT-9pxgAdBcgA3990MmseMNube_zzP0wmncQ@mail.gmail.com>
To: Jim Wilson <jimw@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 4/5 v3] RISC-V: Add debug
 support for accessing CSRs.
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Feb 2019 23:56:54 -0000

On Tue, Jan 29, 2019 at 6:57 PM Jim Wilson <jimw@sifive.com> wrote:
>
> Adds a debugger field to CPURISCVState.  Disable mode checks in riscv_csrrw
> when true.
>
> Signed-off-by: Jim Wilson <jimw@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h |  3 +++
>  target/riscv/csr.c | 16 ++++++++--------
>  2 files changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 743f02c..faa46d0 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -170,6 +170,9 @@ struct CPURISCVState {
>
>      /* physical memory protection */
>      pmp_table_t pmp_state;
> +
> +    /* True if in debugger mode.  */
> +    bool debugger;
>  #endif
>
>      float_status fp_status;
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 5e7e7d1..04e6b59 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -46,7 +46,7 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
>  static int fs(CPURISCVState *env, int csrno)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    if (!(env->mstatus & MSTATUS_FS)) {
> +    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
>          return -1;
>      }
>  #endif
> @@ -58,7 +58,7 @@ static int ctr(CPURISCVState *env, int csrno)
>  #if !defined(CONFIG_USER_ONLY)
>      target_ulong ctr_en = env->priv == PRV_U ? env->scounteren :
>                            env->priv == PRV_S ? env->mcounteren : -1U;
> -    if (!(ctr_en & (1 << (csrno & 31)))) {
> +    if (!env->debugger && !(ctr_en & (1 << (csrno & 31)))) {
>          return -1;
>      }
>  #endif
> @@ -86,7 +86,7 @@ static int pmp(CPURISCVState *env, int csrno)
>  static int read_fflags(CPURISCVState *env, int csrno, target_ulong *val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    if (!(env->mstatus & MSTATUS_FS)) {
> +    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
>          return -1;
>      }
>  #endif
> @@ -97,7 +97,7 @@ static int read_fflags(CPURISCVState *env, int csrno, target_ulong *val)
>  static int write_fflags(CPURISCVState *env, int csrno, target_ulong val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    if (!(env->mstatus & MSTATUS_FS)) {
> +    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
>          return -1;
>      }
>      env->mstatus |= MSTATUS_FS;
> @@ -109,7 +109,7 @@ static int write_fflags(CPURISCVState *env, int csrno, target_ulong val)
>  static int read_frm(CPURISCVState *env, int csrno, target_ulong *val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    if (!(env->mstatus & MSTATUS_FS)) {
> +    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
>          return -1;
>      }
>  #endif
> @@ -120,7 +120,7 @@ static int read_frm(CPURISCVState *env, int csrno, target_ulong *val)
>  static int write_frm(CPURISCVState *env, int csrno, target_ulong val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    if (!(env->mstatus & MSTATUS_FS)) {
> +    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
>          return -1;
>      }
>      env->mstatus |= MSTATUS_FS;
> @@ -132,7 +132,7 @@ static int write_frm(CPURISCVState *env, int csrno, target_ulong val)
>  static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    if (!(env->mstatus & MSTATUS_FS)) {
> +    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
>          return -1;
>      }
>  #endif
> @@ -144,7 +144,7 @@ static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
>  static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    if (!(env->mstatus & MSTATUS_FS)) {
> +    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
>          return -1;
>      }
>      env->mstatus |= MSTATUS_FS;
> --
> 2.7.4
>
>

