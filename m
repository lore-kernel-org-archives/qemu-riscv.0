Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE05C83F2D
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 01:06:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qcy2W-0002Lw-Se; Sun, 03 Sep 2023 21:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qcy2W-0002K6-C2; Sun, 03 Sep 2023 21:06:04 -0400
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qcy2U-0006CS-AB; Sun, 03 Sep 2023 21:06:04 -0400
Received: by mail-vk1-xa34.google.com with SMTP id
 71dfb90a1353d-48d11ae09c8so45394e0c.3; 
 Sun, 03 Sep 2023 18:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693789560; x=1694394360; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hhZF3qTkFULByk1NWfUfmcuS32MCWkv4inAm72d1hFE=;
 b=TkXdkM+0GMiBbhzGD4TEQQjjeDyxOt/XzBM4FtlqZTBJEPQ9Wy5iVdhL/Lcu8Tx/HE
 LEXt411wNcmFdm0rnYOEw69O9OeHHrMIA0kq3m1oNQ+umBOau8vuu0jfqu2GNj6FOaFk
 ST1oNdUp3mTxmp9aKb8MHKyAbgDnXvw3XWIeqVt3TdAVsXssiWo7W3tfBiioDH71iOJ1
 YJASkRjMrhjO+qjoHdtVSsG1u+qSA51FaDoIxRMeG8qm/Dsdyz1K9yt/hz59I9UYmiCD
 Z1zoEa9Fh8Ia9jLNMifNbV5pbuXs4fEa+gL9TS8Kg1YASmdmXyOXyRSv+NZRdlolhqbu
 sBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693789560; x=1694394360;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hhZF3qTkFULByk1NWfUfmcuS32MCWkv4inAm72d1hFE=;
 b=R26W01PuLV51zZyBp+TkWQMj1JLnrsxVo9EcCT0luDnbnCIDQyh56QXfQyYaPR0rax
 cE3+xwndgPW//GcpicVxycWkWRuZCi7Li1/Opq3lXC0BTV02qlQtMEbSGVMzf7LQ6j0m
 +hZb5Ql0UX1pnazAJoy/+Xt4zFYZk7BraReDSyA77Tz+LnygW+8L85lS0RawbQ6WacVm
 Q0JY4oH2zSoKXP1j4uK8Sf71YcUJtoaJgFhkv83SWpne6EPE04lYAH8g0VtXkA/ketum
 ZIHU7yeXDoaseTigxwDWYbfLGkCsTAosOut5psZh5LstLFFWElgSPlXH9BmFgK+DN/eu
 eo9g==
X-Gm-Message-State: AOJu0YzXVW/ZorfOcCipY+Cd8hDd7FI4dxT+HFZ5zqT+olO3o9zpDpHM
 rELIBuIs65AvQ0Qa/UhEIHjjscCE1ztTov7klaQ=
X-Google-Smtp-Source: AGHT+IHciyD1FkGC8Cp2qOIgcAVnMXNFzSQggHFR2+ROSsUIuAoT+KGlaAV5ZcD1Z7BU29nuyB/RvGskoDuv2ycOSGs=
X-Received: by 2002:a05:6102:98:b0:44d:47c2:7470 with SMTP id
 t24-20020a056102009800b0044d47c27470mr4705374vsp.34.1693789559769; Sun, 03
 Sep 2023 18:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230829215046.1430463-1-leon@is.currently.online>
In-Reply-To: <20230829215046.1430463-1-leon@is.currently.online>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 4 Sep 2023 11:05:33 +1000
Message-ID: <CAKmqyKMcASJUh0pSCV5DOw8HV8TT3=kL+eg_GQtuvu2SR7obmA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/pmp.c: respect mseccfg.RLB for pmpaddrX
 changes
To: leon@is.currently.online
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Leon Schuermann <leons@opentitan.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa34.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Aug 30, 2023 at 7:50=E2=80=AFAM <leon@is.currently.online> wrote:
>
> From: Leon Schuermann <leons@opentitan.org>
>
> When the rule-lock bypass (RLB) bit is set in the mseccfg CSR, the PMP
> configuration lock bits must not apply. While this behavior is
> implemented for the pmpcfgX CSRs, this bit is not respected for
> changes to the pmpaddrX CSRs. This patch ensures that pmpaddrX CSR
> writes work even on locked regions when the global rule-lock bypass is
> enabled.
>
> Signed-off-by: Leon Schuermann <leons@opentitan.org>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/pmp.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 9d8db493e6..5e60c26031 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -44,6 +44,10 @@ static inline uint8_t pmp_get_a_field(uint8_t cfg)
>   */
>  static inline int pmp_is_locked(CPURISCVState *env, uint32_t pmp_index)
>  {
> +    /* mseccfg.RLB is set */
> +    if (MSECCFG_RLB_ISSET(env)) {
> +        return 0;
> +    }
>
>      if (env->pmp_state.pmp[pmp_index].cfg_reg & PMP_LOCK) {
>          return 1;
>
> base-commit: a8fc5165aab02f328ccd148aafec1e59fd1426eb
> --
> 2.34.1
>

