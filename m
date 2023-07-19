Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E09EB64DD
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 01:16:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLvnS-0000BG-TS; Tue, 18 Jul 2023 21:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qLvnQ-00009m-Qe; Tue, 18 Jul 2023 21:16:04 -0400
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qLvnP-0007X7-8Q; Tue, 18 Jul 2023 21:16:04 -0400
Received: by mail-vk1-xa30.google.com with SMTP id
 71dfb90a1353d-460eb67244eso2227402e0c.1; 
 Tue, 18 Jul 2023 18:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689729362; x=1692321362;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sSZSwo9AXZtyg5OowIjoeQJ9mq2RMX+zs8VLQ0DNTlw=;
 b=QRIjDRbOXrEbHb1c4fEweg8iWn9YG1jvMvLIQPyKDMpUmOkNy0ib8bJJzoQUCn0oh7
 kEVS0+UQiPRDYhccWfLKGdrR0Jg+QUf2NiQBnW0yEDntcMWSPccLQ+4H3M6uI2ifDo7A
 bmFwkOL7ZuY1i2NEqVPtv/9d4z8ZqDymRFKJpcU59Y2XsY1mUs4JAgOJCpLXfSX06CRb
 yfyV5XkKctRpwYlDjAfIGWXRt7RhGva0Hb7jVjQepm84sVxkIkMZyJQvkHEFfpemTxzP
 zWKhQfK9Z50S8/+6LdZptkMJkOQj+KnkkthKkK07CswwtMPpAwfmGa8yWIZ+y0Zkf/y/
 Gv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689729362; x=1692321362;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sSZSwo9AXZtyg5OowIjoeQJ9mq2RMX+zs8VLQ0DNTlw=;
 b=ilsgVLo1m1isjgpMRnmvmt89NgX6gNEJPV1d3zsemRcBJoKYovrVgDaHcIjRkkEqEn
 Na2EwnyqKkaeRkpmc/slFAfS/g4b+BBx13+rjFV87Uz5dqiWH9FkGfeRsszLNmUBJBau
 BXDB959ZRNEqE3zifsrbnyiQ5N+dygHC9MADtq3cVWCawuEIAT7Xurq3N/0x0BiJgH3X
 DNmjuTfhmG8lDUJDH3uTHVz8ENzl4Ohv5StQKRURTqRZH7SNLz/IeaRFPwGL9zBrGq0R
 qW0sSe8Jlm+IOFByBgPymEAAJRTw2uIYOVfvyj/73g1CwnrU8DR+dbFCZovcjtVsZPOU
 AVRw==
X-Gm-Message-State: ABy/qLbyYtUg7p547r/aaydIbJORlUYV2jkdRzL06wblGc4rO31PvpyD
 A2F1C2qEUJWp4yCkkfKGLJ4Xf+d7UA0AUjtgzEo=
X-Google-Smtp-Source: APBJJlFPl5LY5GgHY4ueb2d6bo47aTu4lfv8JUaspW+rQDR0pprpPtZXfDWc1JnsgxGXdOsNBxq5g7rrjHjxv28/rFg=
X-Received: by 2002:a1f:5f0b:0:b0:481:2ff5:c9b2 with SMTP id
 t11-20020a1f5f0b000000b004812ff5c9b2mr943024vkb.5.1689729361833; Tue, 18 Jul
 2023 18:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230717154141.60898-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230717154141.60898-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jul 2023 11:15:35 +1000
Message-ID: <CAKmqyKNCE7RTuL-xZPfDPEtu-0c+e2KFHQHVbbunOEme7q4YDg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/cpu.c: check priv_ver before auto-enable
 zca/zcd/zcf
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, Conor Dooley <conor@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa30.google.com
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

On Tue, Jul 18, 2023 at 1:42=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Commit bd30559568 made changes in how we're checking and disabling
> extensions based on env->priv_ver. One of the changes was to move the
> extension disablement code to the end of realize(), being able to
> disable extensions after we've auto-enabled some of them.
>
> An unfortunate side effect of this change started to happen with CPUs
> that has an older priv version, like sifive-u54. Starting on commit
> 2288a5ce43e5 we're auto-enabling zca, zcd and zcf if RVC is enabled,
> but these extensions are priv version 1.12.0. When running a cpu that
> has an older priv ver (like sifive-u54) the user is spammed with
> warnings like these:
>
> qemu-system-riscv64: warning: disabling zca extension for hart 0x00000000=
00000000 because privilege spec version does not match
> qemu-system-riscv64: warning: disabling zcd extension for hart 0x00000000=
00000000 because privilege spec version does not match
>
> The warnings are part of the code that disables the extension, but in thi=
s
> case we're throwing user warnings for stuff that we enabled on our own,
> without user intervention. Users are left wondering what they did wrong.
>
> A quick 8.1 fix for this nuisance is to check the CPU priv spec before
> auto-enabling zca/zcd/zcf. A more appropriate fix will include a more
> robust framework that will account for both priv_ver and user choice
> when auto-enabling/disabling extensions, but for 8.1 we'll make it do
> with this simple check.
>
> It's also worth noticing that this is the only case where we're
> auto-enabling extensions based on a criteria (in this case RVC) that
> doesn't match the priv spec of the extensions we're enabling. There's no
> need for more 8.1 band-aids.
>
> Cc: Conor Dooley <conor@kernel.org>
> Fixes: 2288a5ce43e5 ("target/riscv: add cfg properties for Zc* extension"=
)
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9339c0241d..6b93b04453 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1225,7 +1225,8 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cp=
u, Error **errp)
>          }
>      }
>
> -    if (riscv_has_ext(env, RVC)) {
> +    /* zca, zcd and zcf has a PRIV 1.12.0 restriction */
> +    if (riscv_has_ext(env, RVC) && env->priv_ver >=3D PRIV_VERSION_1_12_=
0) {
>          cpu->cfg.ext_zca =3D true;
>          if (riscv_has_ext(env, RVF) && env->misa_mxl_max =3D=3D MXL_RV32=
) {
>              cpu->cfg.ext_zcf =3D true;
> --
> 2.41.0
>
>

