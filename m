Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjuFB-0000Ux-QK
	for mharc-qemu-riscv@gnu.org; Tue, 04 Apr 2023 23:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjuFA-0000Uj-6A; Tue, 04 Apr 2023 23:55:32 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjuF8-0006Q1-Ll; Tue, 04 Apr 2023 23:55:31 -0400
Received: by mail-ua1-x935.google.com with SMTP id n17so24697836uaj.10;
 Tue, 04 Apr 2023 20:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680666929;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7A5q85dKuZF3kRbNCPTlOAkp3UMeSEqR+tEIlzexl3Y=;
 b=jtnhsDZqvuVkyZSPAOeG55G6GLoOXDkhKm5hHzpaw8uQrJeybVUOKP3KjTqCEY+O2z
 lZVmaj0nG9Y58iyhrH5bcWf9YPJtrZB3hMSIcks7RvyEOi6qTC6gzHfz+VcJ+ki2v+rH
 F3UFPKeK2FOGIcU3T1llIam4SpJElRPTMRG+wkkD8NzrU51/MxwkYv4o/U+ytDuVXoaa
 bHbAdPE8SRVTaD0q6HcNfKeWSwJ91bwVvEGD1+vtpWTRIup2XSi9uPkG0Q+M5argBqYM
 SjCU5RmBllTj3DdP2ZaWzDxFz2yoLDiknREmoiE9ceull7aJR8nI79NXZr0nvW02J0Vh
 7D6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680666929;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7A5q85dKuZF3kRbNCPTlOAkp3UMeSEqR+tEIlzexl3Y=;
 b=dm7lHkQbKBQiFnc1rqOn3bu5HhXBRYi9V5JrbqrU4R9iqzGoRLX2BzpGJAnPV9caUt
 xaq5lKJ9Ib2upH2cUun4cToerIm6OUBrh2J3L8oFpl120AIKpPun/doQ4SQDIGEW1Igl
 ds0/p2nGYCIOSMOpW389Q++0toI+2LRWu8nFPBs5TKp5OFSw5xiF3+lq/8Nc7YZnIXra
 UCfSaYCe4HiCrBYIBt7JCmwUcgxsB9rH1ZsPwj9LTuIVH9c84QWCCf1kM4xdzq7tmMZY
 b187So0cFBsiKvabajQEIWC8o1bFhPaIl8JRO/gaVGFns7DG7OK4XBNy6igvjvbPLgp0
 u/Dw==
X-Gm-Message-State: AAQBX9ewMndR7Tu75kyl5Y8kF2XqXIrATOe8pHzODnsd3iabXBTNR6Tf
 E5neREkhrm1kGfq38XMjwjwSGZrW9/jWotHY3NM=
X-Google-Smtp-Source: AKy350Y1M9cbAXEgmLbqHzlw5NoTrQRHab3BrlPGMr+4cPAcvR0r+rilML5qEjvKRXEAbFYI5ex6wFCgzB0HMJSEG5Q=
X-Received: by 2002:ab0:7ce:0:b0:68d:6360:77b with SMTP id
 d14-20020ab007ce000000b0068d6360077bmr3077589uaf.1.1680666928973; 
 Tue, 04 Apr 2023 20:55:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230330034636.44585-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20230330034636.44585-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 13:55:02 +1000
Message-ID: <CAKmqyKM8i_Mr1JgJNhe24JMFpZabOr2MWnixYR0M+0SuH-4JsA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Set opcode to env->bins for illegal/virtual
 instruction fault
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x935.google.com
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
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Apr 2023 03:55:32 -0000

On Thu, Mar 30, 2023 at 1:47=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> decode_save_opc() will not work for generate_exception(), since 0 is pass=
ed
> to riscv_raise_exception() as pc in helper_raise_exception(), and bins wi=
ll
> not be restored in this case.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvh.c.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvh.c.inc b/target/riscv/insn_=
trans/trans_rvh.c.inc
> index 9248b48c36..4b730cd492 100644
> --- a/target/riscv/insn_trans/trans_rvh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvh.c.inc
> @@ -20,6 +20,8 @@
>  static bool check_access(DisasContext *ctx)
>  {
>      if (!ctx->hlsx) {
> +        tcg_gen_st_i32(tcg_constant_i32(ctx->opcode), cpu_env,
> +                       offsetof(CPURISCVState, bins));
>          if (ctx->virt_enabled) {
>              generate_exception(ctx, RISCV_EXCP_VIRT_INSTRUCTION_FAULT);
>          } else {
> --
> 2.25.1
>
>

