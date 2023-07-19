Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7B5EB64DC
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 01:18:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLvpC-0001Id-8H; Tue, 18 Jul 2023 21:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qLvp9-0001Hs-Di; Tue, 18 Jul 2023 21:17:52 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qLvp7-0007u9-Uv; Tue, 18 Jul 2023 21:17:51 -0400
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-4814505ddbbso2233107e0c.0; 
 Tue, 18 Jul 2023 18:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689729468; x=1692321468;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=67WPNX/sgUiNxh0hEU1Fm5qf6DC1s2HSoKHcpSVaWwY=;
 b=XvnmYTkFzULgV8DaLR11D4zDrvMHPL34xmN0g5c2B7bm/LkAg/t09bf0MwaPBTD9rY
 27M+6HvqnMBRZ0w/VMhsEhvalDOUPxW1rShwFliC9K7UO+M0erDmZJpk6UTWiZcRkA6k
 Fczu60rHM623qxSTbfhrg/aiv9cPMb75iInLKy6EsPGmIlrWZNJ9WMXo5hunLZ06aO7r
 W/eG8Zg0lLL13Cpl3CM0dibVqxPig6NObn/g+vBZHetzRYD/v8IxJmDpZ2OH+KcV2mt3
 8pDTD4Hychz13R6MbMC4ehYW1s7utk5Cd+vzHKcpuoSVG/zH003tF3vioqj15ns6Aw1o
 OXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689729468; x=1692321468;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=67WPNX/sgUiNxh0hEU1Fm5qf6DC1s2HSoKHcpSVaWwY=;
 b=Br8mMr1gf+dD12NxHsnDwlGuYdte9Na7cIL3MuPFKs2wRRoDfSuiMhg+009WZGCdIg
 MKpMg7oaxBgsIiu8WUKKf3eDLNbKWtIqpGY1DL9LYt+Bgi+cT4rLVfWwEQeZbGSi00vU
 TUb69lWqtJYf37AsMlVEMcaSm+U7lAgaUQQ5nXzWAQwI+PDSW7JJQQqJlbXI+6TQ2Y23
 NS9g2HdiidGLif0jxyXvln0ulPKCD79wPTap3AUPHcw+630qw+smfKeV6JrhrZMy4a8L
 fROb0ebWtRgVuRMuOo2dwGqakrp3XijuCEvN/ZY4TanlhVdlY/9eb4WnwQrYBTFQxUt9
 CiHA==
X-Gm-Message-State: ABy/qLZACrtzry7CDWmvUtJcoju2fLu+Se9nWWBQ9gKZv+VndwHCUMoT
 6aU/tcSHLKh4fUgjF9CaE/J+4fRb+1h4acNQ5ug=
X-Google-Smtp-Source: APBJJlFpfTDIZ+L1G5nKpTB/KISAGba7syK5G6uhPr/4U9ixj4JgPf0rZCrM8RT4QDlDeFlMYx+JCIII4a/ps7+mJBE=
X-Received: by 2002:a1f:60d0:0:b0:481:3f5d:2667 with SMTP id
 u199-20020a1f60d0000000b004813f5d2667mr835189vkb.15.1689729468611; Tue, 18
 Jul 2023 18:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230718080712.503333-1-zhao1.liu@linux.intel.com>
In-Reply-To: <20230718080712.503333-1-zhao1.liu@linux.intel.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jul 2023 11:17:22 +1000
Message-ID: <CAKmqyKPZL+0XNkw854DJh+uXkUHvX56c7iO-i52hj6pNNehP0g@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: Fix topo field in error_report
To: Zhao Liu <zhao1.liu@linux.intel.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Zhenyu Wang <zhenyu.z.wang@intel.com>, Zhao Liu <zhao1.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa32.google.com
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

On Tue, Jul 18, 2023 at 5:57=E2=80=AFPM Zhao Liu <zhao1.liu@linux.intel.com=
> wrote:
>
> From: Zhao Liu <zhao1.liu@intel.com>
>
> "smp.cpus" means the number of online CPUs and "smp.max_cpus" means the
> total number of CPUs.
>
> riscv_numa_get_default_cpu_node_id() checks "smp.cpus" and the
> "available CPUs" description in the next error message also indicates
> online CPUs.
>
> So report "smp.cpus" in error_report() instand of "smp.max_cpus".
>
> Since "smp.cpus" is "unsigned int", use "%u".
>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/numa.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/numa.c b/hw/riscv/numa.c
> index e0414d5b1b73..d319aefb4511 100644
> --- a/hw/riscv/numa.c
> +++ b/hw/riscv/numa.c
> @@ -209,8 +209,8 @@ int64_t riscv_numa_get_default_cpu_node_id(const Mach=
ineState *ms, int idx)
>
>      if (ms->numa_state->num_nodes > ms->smp.cpus) {
>          error_report("Number of NUMA nodes (%d)"
> -                     " cannot exceed the number of available CPUs (%d)."=
,
> -                     ms->numa_state->num_nodes, ms->smp.max_cpus);
> +                     " cannot exceed the number of available CPUs (%u)."=
,
> +                     ms->numa_state->num_nodes, ms->smp.cpus);
>          exit(EXIT_FAILURE);
>      }
>      if (ms->numa_state->num_nodes) {
> --
> 2.34.1
>
>

