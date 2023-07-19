Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73FBEB64DC
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 01:22:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLvtC-0003fF-G5; Tue, 18 Jul 2023 21:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qLvt6-0003cs-Qx; Tue, 18 Jul 2023 21:21:56 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qLvt5-0003VM-BR; Tue, 18 Jul 2023 21:21:56 -0400
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-48142b4134eso2225352e0c.2; 
 Tue, 18 Jul 2023 18:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689729714; x=1692321714;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SSmM/ghEP67tgU0prkrLjwVri2VgNnSEe/C7srUCOh4=;
 b=AtKTXgywq5amDel9nMBzfEcN8grq+QcdY8zsaNnlQwUnauj9AKM3z5EXfWOK9bMPpE
 Fc16xUh0kbdlRDkYgQTmgGgysPKoeNhhxpD+rk+RVi4PpOd3Zdf6vNu+eNxpPlkHrRCu
 FWPv42VKhtRBdJNW7jFI9SlCi5glqBBAs4njPn+b9+9ot14uVvKhg8wZdMx772xcLsmA
 g4Zrr4cunc1m9OZotHKs3rEjuGTkS45yQHt7CKuagbgZfOqTryz4MfFQ8Q/qu5HncAQV
 J25m3yu5AKkv0cj+89VSVAJ7c4RwXF0i/RwzMJ5m9yZQioIm1TkSdsNxTu5DCC3E4nBf
 zdfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689729714; x=1692321714;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SSmM/ghEP67tgU0prkrLjwVri2VgNnSEe/C7srUCOh4=;
 b=WuqJD7LkPtVAmZLPCu5VCV7+Ih0Z8t3tQF5kMtnyrijlf88cc9rgreRWCRSYDrcgCr
 B8l/egz/+TRtteKVpoDLdK4jCsHag2nm8stOAdrEN7RLiHCOi7kPfA0yUKhXXAtcJ9t/
 iSSwczY7uLoYrsxk8hQ8hfCFRAmzKWR4HrlAlSd/fCM2CNOK9NAZTQ7aBx49cOZxuhiX
 xfX3mA2WdFPzjMfRGtyoVYy51PtMKSNUXnqBu4nYpbUVbgv/KjPvibyNO0ZHS8FUroe1
 BxXixBFdHlbUX8M2I9BpyHlvH7+G4PD8OqGXPLMAETOMYyk72sgkjFWwlMmz/pgaMF85
 gKKw==
X-Gm-Message-State: ABy/qLbcOLJwtQlWsIG6UCAUeWPjCTyjnxhxCzzsYahGICF6YDPSYvxI
 FTKXrUsKmyozlVSIbAFtKi/Eh0bmH+34OfXluU0=
X-Google-Smtp-Source: APBJJlGckT2bjA0kbTZVeOnR/Sih/VqVyClmo3v+uqrMYQUhDBCSeZN9Pwv5Fuxo87Oi0TRQwf7AMiEZ+T/OyAb2OuQ=
X-Received: by 2002:a1f:ed47:0:b0:471:7996:228f with SMTP id
 l68-20020a1fed47000000b004717996228fmr894432vkh.7.1689729714009; Tue, 18 Jul
 2023 18:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230718080712.503333-1-zhao1.liu@linux.intel.com>
In-Reply-To: <20230718080712.503333-1-zhao1.liu@linux.intel.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jul 2023 11:21:28 +1000
Message-ID: <CAKmqyKNYNiSSBtcVbfJg0VO=M05VnxyO_hNPgsGzAf0u6X-JGA@mail.gmail.com>
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

I fixed up the typo in the commit title

Thanks!

Applied to riscv-to-apply.next

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

