Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F87BC77B75
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 May 2023 04:59:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pz9Fy-0005k3-DZ; Wed, 17 May 2023 00:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz9Fw-0005ja-AJ; Wed, 17 May 2023 00:59:20 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pz9Fu-0008P5-1W; Wed, 17 May 2023 00:59:20 -0400
Received: by mail-ua1-x92e.google.com with SMTP id
 a1e0cc1a2514c-783ef1c0cfdso3815873241.0; 
 Tue, 16 May 2023 21:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684299554; x=1686891554;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bf8SxjlQUg0vr4mlDU6vQnNALyMMwAPmnktoYQL63iA=;
 b=Iflysfl4rGI3TCT8t51jq9KKxApP0diND9gog8vT4y8IvAF0sFDZMOzQR5GfKxq4Af
 3rnvysD/jdWzOcgo/dKlnrTGMalJl3dfLHwXYzfezwXgn9NGCejgFQiiNbjjQ4nVdHJ5
 oFnU1ZxvgFzstrc+xvKT308n2xu3oU44xG46nLCHZZNKMDWm8pStmegiliHROKyTPJVs
 Xt3eB4RNEJ1LKuHnewy7YlpNP9XoPDdcjZNRmcFu/mPufbGgA4IvfaRv+oEbs+11YOxf
 SWTACEycWcgdzxmhODXYi/2a1M7sD/Mp9+YrMz2xp/A/dBXJnZ8rIMLZvdPRbCgx7twm
 Y6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684299554; x=1686891554;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bf8SxjlQUg0vr4mlDU6vQnNALyMMwAPmnktoYQL63iA=;
 b=IbJ3cBez+X1cmVhs0jW9giSVKaQp5GosSgCiUn7QOE/G7AFjkwR6lAR581eeLP1dgr
 Hm2diyrXLcqyvT40teV5lFiRnNg6nWzTklN4k/QlQC/hbqfSBPz4+tKvkb6Y/zeymn6W
 L8KCjnMWu7lsCcEr75JDF6q8HNBiJaw3S8jfyiyBS2DzLloAh7EQVv8iDvfqFMhCJdw0
 18Y6S96nqjUdo/zURbYWCk7YYjxo64qR9kH6F5COOrIWLwXwSAGdhwuecuOpWgAVrgO4
 v5QlRNn5LDkd574Esg4bxJYcsYRZkKf3ejgle6jf6l0oxcVj+8g7L52c9AVqD3ScfRe1
 y6VQ==
X-Gm-Message-State: AC+VfDyQtyGTxy+wHJxAmW7COtXVAEGaVC7CBxJZxZlevz0M3UTY2WnZ
 nCOhtoLoUCBMAcPDdnGQzeDmn9YahcOqmWsn9Zg=
X-Google-Smtp-Source: ACHHUZ4TWAQ51adf8kn+1aJvFTNfAMniZotxvJiUPse+4ktoNBghjvbiNYqx7Tx9Vy7fityduSAFRNVztQ/0gyOVW78=
X-Received: by 2002:a05:6102:298e:b0:42e:28b2:aa99 with SMTP id
 dl14-20020a056102298e00b0042e28b2aa99mr257810vsb.14.1684299554506; Tue, 16
 May 2023 21:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230516005348.1440987-1-yin.wang@intel.com>
In-Reply-To: <20230516005348.1440987-1-yin.wang@intel.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 May 2023 14:58:48 +1000
Message-ID: <CAKmqyKPoBfWhzoewkfnv3_kUjk2P3DhyqzW5nN=oEfC1xy8umw@mail.gmail.com>
Subject: Re: [PATCH v4] hw/riscv: qemu crash when NUMA nodes exceed available
 CPUs
To: Yin Wang <yin.wang@intel.com>
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92e.google.com
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

On Tue, May 16, 2023 at 10:55=E2=80=AFAM Yin Wang <yin.wang@intel.com> wrot=
e:
>
> Command "qemu-system-riscv64 -machine virt
> -m 2G -smp 1 -numa node,mem=3D1G -numa node,mem=3D1G"
> would trigger this problem.Backtrace with:
>  #0  0x0000555555b5b1a4 in riscv_numa_get_default_cpu_node_id  at ../hw/r=
iscv/numa.c:211
>  #1  0x00005555558ce510 in machine_numa_finish_cpu_init  at ../hw/core/ma=
chine.c:1230
>  #2  0x00005555558ce9d3 in machine_run_board_init  at ../hw/core/machine.=
c:1346
>  #3  0x0000555555aaedc3 in qemu_init_board  at ../softmmu/vl.c:2513
>  #4  0x0000555555aaf064 in qmp_x_exit_preconfig  at ../softmmu/vl.c:2609
>  #5  0x0000555555ab1916 in qemu_init  at ../softmmu/vl.c:3617
>  #6  0x000055555585463b in main  at ../softmmu/main.c:47
> This commit fixes the issue by adding parameter checks.
>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Yin Wang <yin.wang@intel.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/numa.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/riscv/numa.c b/hw/riscv/numa.c
> index 4720102561..e0414d5b1b 100644
> --- a/hw/riscv/numa.c
> +++ b/hw/riscv/numa.c
> @@ -207,6 +207,12 @@ int64_t riscv_numa_get_default_cpu_node_id(const Mac=
hineState *ms, int idx)
>  {
>      int64_t nidx =3D 0;
>
> +    if (ms->numa_state->num_nodes > ms->smp.cpus) {
> +        error_report("Number of NUMA nodes (%d)"
> +                     " cannot exceed the number of available CPUs (%d)."=
,
> +                     ms->numa_state->num_nodes, ms->smp.max_cpus);
> +        exit(EXIT_FAILURE);
> +    }
>      if (ms->numa_state->num_nodes) {
>          nidx =3D idx / (ms->smp.cpus / ms->numa_state->num_nodes);
>          if (ms->numa_state->num_nodes <=3D nidx) {
> --
> 2.34.1
>
>

