Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A5CC7EE2E
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 02:21:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8XBA-0004lz-Hi; Sun, 11 Jun 2023 22:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8XB9-0004lV-Fh; Sun, 11 Jun 2023 22:21:11 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8XB7-0002BZ-Pz; Sun, 11 Jun 2023 22:21:11 -0400
Received: by mail-vs1-xe36.google.com with SMTP id
 ada2fe7eead31-43b28436ebeso895297137.0; 
 Sun, 11 Jun 2023 19:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686536468; x=1689128468;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qWHv5u88KiXLxspgoryb/7Y4GkhCFznPZFj78c9yAAs=;
 b=RPYXYoG2IUjdLLWXQz7QMRGJl19JK8wuBnTyEqUPt8OO3rn+KCFVjzFsWb6s12GwtQ
 /mvpoPB+7yU/mcD8CzfTQo61n9LHrA2zF9DnEcf3MXOEUCdEX3qjN3F92cyfl4zE1ATA
 XMYiU9zXZTDmHAwD8wPujU3oVe64hL20EMfN+MXMEmknkf6Uf7Z3QredEiOxQtWxuSZH
 rnKh1javpiAxb2Ox9L1TFZZRrrT6o42EViItnZrqmHOOc+worwitrp5OeToWv6TeuRcC
 GSpCs0rQmk9EMpJbZczDi+GyWrzX0GqCXwjz+OT6D3+h+PLRmK9SAuniC3anPthQ9Ava
 3vDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686536468; x=1689128468;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qWHv5u88KiXLxspgoryb/7Y4GkhCFznPZFj78c9yAAs=;
 b=iB8a+Ey6CZ6s1f5UP/2TRZBwMf9ONsJxlOgoUuLHuKSsdp7ZPGA6jpEImT2gbzH4J+
 QADDtid0dABokC9ZGAR/luZVDhkKbqBOeUVXZH8d+59HWDzVg4rCAJwUU1sgJX0p1Gc/
 xvPmnMF6KvmGmf8saeNGOadRYhbyY7cTTxg+Kj55lsU9VxLoOHdRj31Tt3A7IKRr4+Kq
 kXJ7kDVAxewRyccb6YwcP4BszBK31PVmYVakeHCjofhCLbs611K95PBtHLnd4HSTkppO
 rX09UceHwzKNyt4IgpB9Dz5XJ9Tx+anof42qqKwyLRlNUZA2VK/TAzkdvNXUZ4fddWlz
 B+7g==
X-Gm-Message-State: AC+VfDz9FCSQ1BzoSVZ8POzAcv6Q9qQaPboHpkQUCB4ejLB+smHlJ7ga
 vCoJWfVoKK7VHvheXpieybzFfOLyiJ3iZ7/jE94=
X-Google-Smtp-Source: ACHHUZ75qQc9ou8QmwwfgqOd1mPrSg1LMW+XkBya97/OYEjkMqa+suH0hiC8cAgVAM8oIRDR5zlYe9Fk60JWJZTaSjE=
X-Received: by 2002:a1f:ea43:0:b0:462:ac61:27e7 with SMTP id
 i64-20020a1fea43000000b00462ac6127e7mr2915719vkh.16.1686536468214; Sun, 11
 Jun 2023 19:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230610094651.43786-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20230610094651.43786-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jun 2023 12:20:42 +1000
Message-ID: <CAKmqyKMJ5ycbfbfhTDZi42Gwxn6qvEi86n8OMin+de9noNyr4Q@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix initialized value for cur_pmmask
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Sat, Jun 10, 2023 at 7:48=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> We initialize cur_pmmask as -1(UINT32_MAX/UINT64_MAX) and regard it
> as if pointer mask is disabled in current implementation. However,
> the addresses for vector load/store will be adjusted to zero in this
> case and -1(UINT32_MAX/UINT64_MAX) is valid value for pmmask when
> pointer mask is enabled.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 09ea227ceb..acbcb7ed76 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -133,7 +133,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_=
ulong *pc,
>      flags =3D FIELD_DP32(flags, TB_FLAGS, FS, fs);
>      flags =3D FIELD_DP32(flags, TB_FLAGS, VS, vs);
>      flags =3D FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
> -    if (env->cur_pmmask < (env->xl =3D=3D MXL_RV32 ? UINT32_MAX : UINT64=
_MAX)) {
> +    if (env->cur_pmmask !=3D 0) {
>          flags =3D FIELD_DP32(flags, TB_FLAGS, PM_MASK_ENABLED, 1);
>      }
>      if (env->cur_pmbase !=3D 0) {
> @@ -145,7 +145,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_=
ulong *pc,
>
>  void riscv_cpu_update_mask(CPURISCVState *env)
>  {
> -    target_ulong mask =3D -1, base =3D 0;
> +    target_ulong mask =3D 0, base =3D 0;
>      /*
>       * TODO: Current RVJ spec does not specify
>       * how the extension interacts with XLEN.
> --
> 2.25.1
>
>

