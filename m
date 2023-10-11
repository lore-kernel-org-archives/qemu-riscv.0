Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77C9CD98E0
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 01:19:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqNt1-000401-VU; Tue, 10 Oct 2023 21:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNsx-0003yy-Ga; Tue, 10 Oct 2023 21:19:39 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNsv-0001u7-1W; Tue, 10 Oct 2023 21:19:38 -0400
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-7b5f7f4e733so673378241.3; 
 Tue, 10 Oct 2023 18:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696987175; x=1697591975; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+cqfu7rX3bajUVWJOF3fz0F+6+1qGAI3AzLbrG0tuaI=;
 b=Orq8HVnJXagc7as8+SiZgEnmwwua7ytAUunCvmkDsOlIUEv30UTGa8Gb+QVPC8Fm0n
 f8QpNvXPA/q7hMKH2s2HtRsHH0vL90huA1+17zkt20GE0g4KY/dACxfdrD37oGmsFW23
 Pbz/lx5RWStZ/PLYpxanjtXtpJ9bgAg5R1qN3cQ2mAhhokOzNzFQWN3qhEcw2r45y1xw
 zr5yKBNWFsUeLx++mKMUjnkjh2l6yMUgLcolQZPCRwM76AYfIFjn8VKQTA22S/OSzAWq
 x4sbUJiLFrctupMx5tT8mSazuGMp5smz4PAqb6EHs5QXwu6s6vn0z7iLvR2oROvrYuw6
 R9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696987175; x=1697591975;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+cqfu7rX3bajUVWJOF3fz0F+6+1qGAI3AzLbrG0tuaI=;
 b=lo7kBYlpe7VSYbE93nJA4d73n8pndomU1iCAz4ObiHo6BlPfN0PLbpGOmH5lSXbiZk
 H3WcjnjEo/CEIAOVhkg/yCbzlHbTiB4DfLRNQYn4nunr/6Jam8kBVgnwVcZ7tM67isi4
 It1GKDuiOrOzoJT/o7PqmO4o9l1JHqeYm/BSpgrQrEnS0ZUpnaUZ5jpUUWwDhIblKOmP
 IVlmYAGNibCH9J4veJhCupC9sfDR9+G3/egtZrlm/pw55suYssqmOXdv4H6NF4PkAX61
 gwgZLirR4Jq2Qx786h+vlUIKlLciKl/cjXNzu3V2X5RDzmwWhGMpjwBAQRHAwBAk9Sb8
 amGw==
X-Gm-Message-State: AOJu0Yx+moDFK05S8sFml4rNIfHWIASFYZOMmAPSb/mKbE/lMipJ6y59
 0YEqfw2CPiIPblq25Jav92HULdcUE946o5/OPs7mNO5h4D8=
X-Google-Smtp-Source: AGHT+IExsfwq/d25abE3qSUKJjgk4ognq+6gdjw92Ma9jzdkTNRxTneYUCey0vM+if9fUXR73S7iJsUm2JiLqsCoBmY=
X-Received: by 2002:a67:fb18:0:b0:452:5a95:16a with SMTP id
 d24-20020a67fb18000000b004525a95016amr17101501vsr.1.1696987175474; Tue, 10
 Oct 2023 18:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <20231009124859.3373696-1-rjones@redhat.com>
 <20231009124859.3373696-2-rjones@redhat.com>
In-Reply-To: <20231009124859.3373696-2-rjones@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 11:19:08 +1000
Message-ID: <CAKmqyKMSHCr3_qMspMn5vRs92ie_MuQ-Ab9JQdBzhsK0kfn9nA@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: Use env_archcpu for better performance
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, pbonzini@redhat.com, 
 philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x933.google.com
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

On Mon, Oct 9, 2023 at 10:50=E2=80=AFPM Richard W.M. Jones <rjones@redhat.c=
om> wrote:
>
> RISCV_CPU(cs) uses a checked cast.  When QOM cast debugging is enabled
> this adds about 5% total overhead when emulating RV64 on x86-64 host.
>
> Using a RISC-V guest with 16 vCPUs, 16 GB of guest RAM, virtio-blk
> disk.  The guest has a copy of the qemu source tree.  The test
> involves compiling the qemu source tree with 'make clean; time make -j16'=
.
>
> Before making this change the compile step took 449 & 447 seconds over
> two consecutive runs.
>
> After making this change: 428 & 421 seconds.
>
> The saving is over 5%.
>
> Thanks: Paolo Bonzini
> Thanks: Philippe Mathieu-Daud=C3=A9
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu_helper.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 3a02079290..8c28241c18 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -65,8 +65,7 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch=
)
>  void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
>                            uint64_t *cs_base, uint32_t *pflags)
>  {
> -    CPUState *cs =3D env_cpu(env);
> -    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +    RISCVCPU *cpu =3D env_archcpu(env);
>      RISCVExtStatus fs, vs;
>      uint32_t flags =3D 0;
>
> --
> 2.41.0
>
>

