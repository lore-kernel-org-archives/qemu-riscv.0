Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F20EB64DD
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 01:02:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIfI5-0000FL-H2; Sun, 09 Jul 2023 21:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIfI1-0000El-Hj; Sun, 09 Jul 2023 21:02:09 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIfHz-0006sc-7r; Sun, 09 Jul 2023 21:02:09 -0400
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-47e58485212so1099333e0c.1; 
 Sun, 09 Jul 2023 18:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688950925; x=1691542925;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vRYtNHqsD/i2GP+XXGxrr3lbGT6QdmCj8XgbZf/scYQ=;
 b=p7oYyAkAw3DH9IirgEZA+RJ25h5IQQqai0f1y89WRKA2zZ20BL2I6AFTuET5fiaBXj
 VqtGq/heeX0kk5fTWR1DTIpT7OeXKJVTJ89LBgXIZf0EM6aApKFpYgHFz9c58ILNatls
 dJYyuwQ5jchpeSVudQJo0FltUPfUOYpiT6VmWM3pj8h6Z7ciZzQLjf4v766HbUVc0FXk
 pBYC1pMIY4alzYD09QrX6NplOaW+PQkivDxGQyfB9QWV/r9ZkNEeOZHAlVRhiIFwTT13
 nHpXnmNcFXXTEGwfG7BXo3J0nFnJEa2lO2j0jGfpTo7SoN+l32oyD3qoDClpFobB6ZvW
 b4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688950925; x=1691542925;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vRYtNHqsD/i2GP+XXGxrr3lbGT6QdmCj8XgbZf/scYQ=;
 b=kVXkKnyvU7WSmpPIXnJQ5VPqOgJegHIa+wHYs8qucorRxAXbWWkucT8mT9+M+wMIu4
 iS+dtJvvVGtWJAP9GilQhZPeoTJXw5T62QoU6IWq6fUnDTuZR2FQikCSr/y3mbzj440S
 cpPdrH0AGsqawwejhorpMt/+LYJcyuzZ1tOrr35xDDOFaZBHzMQ11wcBra1MW4O1wY4N
 rp+QCYeoZ+YchBOP3iZ8VjELvTra1dhO3ATElsnJ7hQAtMD240LJkuFSN7ISUZFlYTgD
 M9M434nabbNB7QaherDCfkfuFsAbIcmc+W00Hg1jkB2042gaMP+9LZwCGxP8uiWCq5Sl
 gn9Q==
X-Gm-Message-State: ABy/qLZzhRGvgaqiqoxmfXipDF7iVDr6o9YUsT1QQ1KS+1TTZnfcpsNZ
 gtjb3+MZXwsL8VnTuicvZK1JVgOrsWQcb7JMTWs=
X-Google-Smtp-Source: APBJJlHrD1aNO4ofNtJJmaoZOLUjR3G37DvvyKxapubQ1yjAWCDYGA2UIt3dzFRF9BV9KSeGbr/yN4WhhQJygrm+55o=
X-Received: by 2002:a1f:3d44:0:b0:476:4267:178d with SMTP id
 k65-20020a1f3d44000000b004764267178dmr5040935vka.12.1688950925530; Sun, 09
 Jul 2023 18:02:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230707032306.4606-1-gaoshanliukou@163.com>
In-Reply-To: <20230707032306.4606-1-gaoshanliukou@163.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jul 2023 11:01:39 +1000
Message-ID: <CAKmqyKMz=GXKaBAbFe6iBi3codHw-HVN-cpF42riMPUw6E_S6Q@mail.gmail.com>
Subject: Re: [PATCH] target/riscv KVM_RISCV_SET_TIMER macro is not configured
 correctly
To: "yang.zhang" <gaoshanliukou@163.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, pbonzini@redhat.com, 
 kvm@vger.kernel.org, zhiwei_liu@linux.alibaba.com, dbarboza@ventanamicro.com, 
 "yang.zhang" <yang.zhang@hexintek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa31.google.com
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

On Fri, Jul 7, 2023 at 10:26=E2=80=AFPM yang.zhang <gaoshanliukou@163.com> =
wrote:
>
> From: "yang.zhang" <yang.zhang@hexintek.com>
>
> Should set/get riscv all reg timer,i.e, time/compare/frequency/state.
>
> Signed-off-by:Yang Zhang <yang.zhang@hexintek.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1688

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/kvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 30f21453d6..0c567f668c 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -99,7 +99,7 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, ui=
nt64_t type,
>
>  #define KVM_RISCV_SET_TIMER(cs, env, name, reg) \
>      do { \
> -        int ret =3D kvm_set_one_reg(cs, RISCV_TIMER_REG(env, time), &reg=
); \
> +        int ret =3D kvm_set_one_reg(cs, RISCV_TIMER_REG(env, name), &reg=
); \
>          if (ret) { \
>              abort(); \
>          } \
> --
> 2.25.1
>
>

