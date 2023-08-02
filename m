Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4048C001E0
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 13:31:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qRBwk-00052E-IB; Wed, 02 Aug 2023 09:31:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qRBwe-0004qy-V6; Wed, 02 Aug 2023 09:31:21 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qRBwb-0004QB-6x; Wed, 02 Aug 2023 09:31:20 -0400
Received: by mail-ua1-x92a.google.com with SMTP id
 a1e0cc1a2514c-794c5f5ae8aso1989392241.3; 
 Wed, 02 Aug 2023 06:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690983075; x=1691587875;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9L+IzsoZgeW5BtYhZQ89vGV+bGlfFK2cXQti+uCTHuc=;
 b=PRv05f4X/K2jouEDlesLaRU2dbioWk2ROtx7BzxzsoGSvKPZvyz8dn5XJWvNrf3pY6
 UHcWJzFr1Rb1lb2mliXGeyEbk8ZNJISZ0znADPj+BZOzYbFKydZtq5hxf69opi76iRWC
 qjalgEm2kwQWITrcM0/A6hTgV0HgS3CQa2vzJ+qujzhF8nAlpekI1n2X41g9f/PHoLrL
 inZLf8bxYA4Bld4nDg7MQs7+D1Me8Ufcrtz5HKeEQHJejI3MXXy9WS1jZycHF2yhWZSi
 lIMO7JLNLSnXnBvOh/o3cl9aphZCKkIuOVdD7Nu9vjmXSsuziO8LIYVsWvnnxb7DRPpg
 3fqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690983075; x=1691587875;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9L+IzsoZgeW5BtYhZQ89vGV+bGlfFK2cXQti+uCTHuc=;
 b=FfIUgNAC9cjZ/pq3j+rue8TWAoNH8uCzINYeb1KskAxRDMUDLrrHbS0fD5nM2WxdVN
 /sjq3olOMqD7jwfkTVpcUu9ZIRl3lfXXegk3L5OGazlWQgh2iL+/yPpSQ0uryXxapjdB
 bJAQ/DdEQs8PLAzHgrZd1EE1sNemL+490oTiRxJopLCuxC0iKlZLz+/nmyT5BeNGv8d9
 L+6yNfyy6vWFfxNvkj9O9vzifTZWYSynpsNqU5rwkMtahbYqq49qR66d9sAAWPgi1N+O
 gujbhFeIo+n/qMO+SyetgayZnWCOwoTih67LGkd4aOmN/+dmlFLnnXMzu/sGYMG2M9AJ
 vUCQ==
X-Gm-Message-State: ABy/qLaK6qKyD3iy9an7CCdJKZJTdJraTwQHQsT5IfGg6HN7HU8FbQrJ
 P62PNyq1XyB53neCR4jj44s0XJGSkEhXpsCVo6o=
X-Google-Smtp-Source: APBJJlEtynJQP/3Y0FpUv+2YPzmBbipeHWgcEblROw6xlGcyJfDlQ9cjEGdj1s+NQoZNAvi4ywZ7iCMxPfHpvdGQEvM=
X-Received: by 2002:a67:f3d1:0:b0:443:8b27:6dac with SMTP id
 j17-20020a67f3d1000000b004438b276dacmr4202486vsn.9.1690983075006; Wed, 02 Aug
 2023 06:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230729031618.821-1-zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230729031618.821-1-zhiwei_liu@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 2 Aug 2023 09:30:49 -0400
Message-ID: <CAKmqyKPFFZR4pSnwDunzTKhEMtWH4BzmZ9Jrw0NsyyszYA1KDQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix page_check_range use in fault-only-first
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Alistair.Francis@wdc.com, palmer@dabbelt.com, 
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, 
 qemu-riscv@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92a.google.com
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

On Fri, Jul 28, 2023 at 11:34=E2=80=AFPM LIU Zhiwei
<zhiwei_liu@linux.alibaba.com> wrote:
>
> Commit bef6f008b98(accel/tcg: Return bool from page_check_range) converts
> integer return value to bool type. However, it wrongly converted the use
> of the API in riscv fault-only-first, where page_check_range < =3D 0, sho=
uld
> be converted to !page_check_range.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/vector_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 4d06754826..a059ef3900 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -583,7 +583,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
>                                           cpu_mmu_index(env, false));
>                  if (host) {
>  #ifdef CONFIG_USER_ONLY
> -                    if (page_check_range(addr, offset, PAGE_READ)) {
> +                    if (!page_check_range(addr, offset, PAGE_READ)) {
>                          vl =3D i;
>                          goto ProbeSuccess;
>                      }
> --
> 2.17.1
>
>

