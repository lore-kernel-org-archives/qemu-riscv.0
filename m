Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjwrs-000357-RF
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 02:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjwrq-000340-7x; Wed, 05 Apr 2023 02:43:38 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjwrn-0002Zf-Kp; Wed, 05 Apr 2023 02:43:37 -0400
Received: by mail-vs1-xe35.google.com with SMTP id h27so30596477vsa.1;
 Tue, 04 Apr 2023 23:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680677014;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xUF3EfRlWs6bxfd6qdap88DwFSNBmkwW/J6l5GW0jjo=;
 b=E1ngsBkW0SHpQZW2MhpVlebyrs5QRRFMfvFo4WPKmvC9VfznnNyKb8SmhK8KuhDn2d
 aripBMkDgUAwsPO/pVEURH35gUQIsaLxxmmePGH6hmRvoOkQcKq1EnmJYX7nPyT2xoGG
 sqDGcwsLsZCC1CJnqI2kscGvGtmSNHuuZIcFjY3tnY5DMNwb7oCxj3TTWNIBPB+IGpms
 xFOnAQwIzmzuxH13d49QLBO5CgFClytFMfTtq6Z3vJArswoDZb+v1m7PBcPkEfvItmFA
 sV5QET4jiM63AD7l9hg/zjJWCnKzFCb8aN5PSlJtIjgfJfcb44UUTNt15scfQJkj23aA
 22eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680677014;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xUF3EfRlWs6bxfd6qdap88DwFSNBmkwW/J6l5GW0jjo=;
 b=IEc1cLsVzBd7igg4mRtk9EzPUr3j3Zrjq6XcTjIAol+5V3HMfkyzeBdI3MKUH7qIqS
 XOVXztkdiViryJ6g3lyRAVAWX4w8TtDLjkbeHoo/aKokUdg95jaSYgJhZv8Q9F9/BD/q
 O0aiHKARzCwSLAimdmuV3Hd5tBqnu/8hcKKAGXsTR/UC/b1YRPMJsItILWRFTnsKW46Q
 S41TTHyArq1x+ry0lRUduOjuFjajQYJLAcvNtKdKoRKduf+HeL/ZmYCAtp8dNSbPJTsw
 E5HTIhnePr4JgcF75onl8ttVsgYxvPf2afHfntcP8tOVdKdDib6/ZbRDzwrb1QlAcjb6
 ukoQ==
X-Gm-Message-State: AAQBX9dwcEVJMBD9LZTUmRQejWreFyVqkG44tzm4/M3dFV0x1jyVzUL7
 PspFIB8sqToK59A+1UO13YavCgvAtuJJugRbWMc=
X-Google-Smtp-Source: AKy350YQ6yNHQC6RjnyWp7Fi6Jsf1I/R0QH89/AA6Tfxlvw8W1KI0RXiDPHQ6HhKAHKfq/DA9jYjPCxaW63x8kXgobA=
X-Received: by 2002:a67:e18f:0:b0:425:8cbd:f74f with SMTP id
 e15-20020a67e18f000000b004258cbdf74fmr4170746vsl.3.1680677013853; Tue, 04 Apr
 2023 23:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230330034636.44585-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20230330034636.44585-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 16:43:07 +1000
Message-ID: <CAKmqyKO04mis_Lj0GQsfD71LmH-s7jVasHeWyGNNBvwoKjWHiQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Set opcode to env->bins for illegal/virtual
 instruction fault
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe35.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 06:43:38 -0000

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

Thanks!

Applied to riscv-to-apply.next

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

